local ffi = require("ffi")
local bit = require("bit")

local new, cast, typeof, ffi_string = ffi.new, ffi.cast, ffi.typeof, ffi.string

local pGetModuleHandle_sig =
    utils.opcode_scan("engine.dll", " FF 15 ? ? ? ? 85 C0 74 0B") or error("Couldn't find signature #1")
local pGetProcAddress_sig =
    utils.opcode_scan("engine.dll", " FF 15 ? ? ? ? A3 ? ? ? ? EB 05") or error("Couldn't find signature #2")

local jmp_ecx = utils.opcode_scan("engine.dll", " FF E1")

local pGetProcAddress = ffi.cast("uint32_t**", ffi.cast("uint32_t", pGetProcAddress_sig) + 2)[0][0]
local fnGetProcAddress = ffi.cast("uint32_t(__stdcall*)(uint32_t, const char*)", pGetProcAddress)

local pGetModuleHandle = ffi.cast("uint32_t**", ffi.cast("uint32_t", pGetModuleHandle_sig) + 2)[0][0]
local fnGetModuleHandle = ffi.cast("uint32_t(__stdcall*)(const char*)", pGetModuleHandle)

local function proc_bind(module_name, function_name, typedef)
    local ctype = ffi.typeof(typedef)
    local module_handle = fnGetModuleHandle(module_name)
    local proc_address = fnGetProcAddress(module_handle, function_name)
    local call_fn = ffi.cast(ctype, proc_address)

    return call_fn
end

local voicedata_func_addr = ffi.cast("uintptr_t", utils.opcode_scan("engine.dll", "55 8B EC 8B 55 08 8B 4A 08")) + 80


ffi.cdef [[
    typedef struct {
        uint32_t dwLowDateTime;
        uint32_t dwHighDateTime;
    } FILETIME;
]]

-- Define the WIN32_FIND_DATA structure
ffi.cdef [[
    typedef struct {
        uint32_t dwFileAttributes;
        FILETIME ftCreationTime;
        FILETIME ftLastAccessTime;
        FILETIME ftLastWriteTime;
        uint32_t nFileSizeHigh;
        uint32_t nFileSizeLow;
        uint32_t dwReserved0;
        uint32_t dwReserved1;
        char cFileName[260];
        char cAlternateFileName[14];
    } WIN32_FIND_DATAA;
]]

-- Define the necessary Windows API functions
ffi.cdef [[
    typedef void* HANDLE;
    HANDLE CreateFileA(const char* lpFileName, uint32_t dwDesiredAccess, uint32_t dwShareMode, void* lpSecurityAttributes, uint32_t dwCreationDisposition, uint32_t dwFlagsAndAttributes, HANDLE hTemplateFile);
    uint32_t GetLastError();
    uint32_t ReadFile(HANDLE hFile, void* lpBuffer, uint32_t nNumberOfBytesToRead, uint32_t* lpNumberOfBytesRead, void* lpOverlapped);
    uint32_t WriteFile(HANDLE hFile, const void* lpBuffer, uint32_t nNumberOfBytesToWrite, uint32_t* lpNumberOfBytesWritten, void* lpOverlapped);
    HANDLE FindFirstFileA(const char* lpFileName, WIN32_FIND_DATAA* lpFindFileData);
    uint32_t FindNextFileA(HANDLE hFindFile, WIN32_FIND_DATAA* lpFindFileData);
    uint32_t FindClose(HANDLE hFindFile);
    HANDLE CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);
    uint32_t RemoveDirectoryA(const char* lpPathName);
]]

local function decimalToHex(num)
    if num == 0 then
        return '0'
    end
    local neg = false
    if num < 0 then
        neg = true
        num = num * -1
    end
    local hexstr = "0123456789ABCDEF"
    local result = ""
    while num > 0 do
        local n = num % 16
        result = string.sub(hexstr, n + 1, n + 1) .. result
        num = math.floor(num / 16)
    end
    if neg then
        result = '-' .. result
    end
    return result
end

--CreateFileA
local nativeCreateFileA =
    proc_bind(
    "kernel32.dll",
    "CreateFileA",
    "HANDLE(__stdcall*)(const char* lpFileName, uint32_t dwDesiredAccess, uint32_t dwShareMode, void* lpSecurityAttributes, uint32_t dwCreationDisposition, uint32_t dwFlagsAndAttributes, HANDLE hTemplateFile)"
)

local nativeWriteFile =
    proc_bind(
    "kernel32.dll",
    "WriteFile",
    "uint32_t(__stdcall*)(HANDLE hFile, const void* lpBuffer, uint32_t nNumberOfBytesToWrite, uint32_t* lpNumberOfBytesWritten, void* lpOverlapped)"
)

local nativeCloseHandle =
    proc_bind(
    "kernel32.dll",
    "CloseHandle",
    "bool(__stdcall*)(HANDLE hObject)"
)


local nativeCopyMemory =
    proc_bind(
    "kernel32.dll",
    "CopyMemory",
    "void(__stdcall*)(void* destination, const void* src, size_t length)"
)

local GENERIC_READ = 0x80000000
local GENERIC_WRITE = 0x40000000
local FILE_SHARE_READ = 0x00000001
local FILE_SHARE_WRITE = 0x00000002
local OPEN_EXISTING = 3
local FILE_ATTRIBUTE_NORMAL = 0x80
local INVALID_HANDLE_VALUE = ffi.cast("HANDLE", -1)
local CREATE_NEW = 1
local CREATE_ALWAYS = 2
local TRUNCATE_EXISTING = 5
local FILE_FLAG_BACKUP_SEMANTICS = 0x02000000
local FILE_FLAG_FIRST_PIPE_INSTANCE = 0x00080000
local FILE_ATTRIBUTE_DIRECTORY = 0x10

local function copy(dst, src, len)
    --if 1==1 then print(dst,src,len) return  end
    return ffi.copy(ffi.cast("void*", dst), ffi.cast("const void*", src), len)
end

function write_file(filename, data_ptr, data_len)
    if data_len == nil then
        local data_len = #data_ptr
        local data_ptr2 = ffi.new("char[?]", #data_ptr)
        for k, v in pairs(data_ptr) do
            data_ptr2[k - 1] = v
        end
        write_file(filename, data_ptr2, data_len)
        return
    end
    -- Open the file for writing
    local handle = nativeCreateFileA(filename, GENERIC_WRITE, 0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nil)
    if handle == INVALID_HANDLE_VALUE then
        -- :trollface:
    end
    -- Write the data to the file
    local bytes_written = ffi.new("uint32_t[1]")
    local success = nativeWriteFile(handle, data_ptr, data_len, bytes_written, nil)

    -- Close the file handle
    nativeCloseHandle(handle)

    -- Check for errors
    if success == 0 then
        error("Error writing file: ")
    end
end

print("original function address: " .. tonumber(voicedata_func_addr))

local CClientState = ffi.cast("uintptr_t**", ffi.cast("uintptr_t",utils.opcode_scan("engine.dll", "A1 ? ? ? ? 33 D2 6A 00 6A 00 33 C9 89 B0")) + 1)[0][0]
local vtable_voicedata_func_addr = ffi.cast("uintptr_t**", CClientState + 8)[0][24]

print("vtable function address: " .. tonumber(vtable_voicedata_func_addr))

local size = 5
local org_bytes = ffi.new("uint8_t[?]", size)
copy(org_bytes, voicedata_func_addr, size)

print(bit.tohex(tonumber(org_bytes[0])))
print(bit.tohex(tonumber(org_bytes[1])))
print(bit.tohex(tonumber(org_bytes[2])))
print(bit.tohex(tonumber(org_bytes[3])))
print(bit.tohex(tonumber(org_bytes[4])))

local read_funny = ffi.new("uint8_t[4]")
read_funny[0] = org_bytes[1]
read_funny[1] = org_bytes[2]
read_funny[2] = org_bytes[3]
read_funny[3] = org_bytes[4]

local funny_guy = ffi.cast("int32_t*", read_funny)

local offset = funny_guy[0] -- +
print("offset: " .. offset)

local prim_hooked_func_ptr = ffi.cast("uintptr_t", voicedata_func_addr) + 1 + offset -- relative jmp
print("prim hooked func ptr: " .. bit.tohex(tonumber(prim_hooked_func_ptr)))

ffi.cdef [[
    typedef struct _MEMORY_BASIC_INFORMATION {
        uintptr_t  BaseAddress;
        uintptr_t  AllocationBase;
        uint32_t  AllocationProtect;
        uint32_t RegionSize;
        uint32_t  State;
        uint32_t  Protect;
        uint32_t  Type;
    } MEMORY_BASIC_INFORMATION, *PMEMORY_BASIC_INFORMATION;
]]

local nativeVirtualQuery =
    proc_bind(
    "kernel32.dll",
    "VirtualQuery",
    "int(__stdcall*)(void* lpAddress,void* lpBuffer, unsigned long dwSize)"
)

local function VirtualQuery(lpAddress)
    local pMEMORY_BASIC_INFORMATION = ffi.new("MEMORY_BASIC_INFORMATION[1]")
    nativeVirtualQuery(ffi.cast("void*", lpAddress), pMEMORY_BASIC_INFORMATION,ffi.sizeof(pMEMORY_BASIC_INFORMATION))
    return pMEMORY_BASIC_INFORMATION[0]
end

local function only_print_memory_info(pMEMORY_BASIC_INFORMATION)
    print("BaseAddress: 0x".. decimalToHex(tonumber(pMEMORY_BASIC_INFORMATION.BaseAddress)))
    print("AllocationBase: 0x".. decimalToHex(tonumber(pMEMORY_BASIC_INFORMATION.AllocationBase)))
    print("AllocationProtect: 0x".. decimalToHex(tonumber(pMEMORY_BASIC_INFORMATION.AllocationProtect)))
    print("RegionSize: 0x".. decimalToHex(tonumber(pMEMORY_BASIC_INFORMATION.RegionSize)))
    print("State: 0x".. decimalToHex(tonumber(pMEMORY_BASIC_INFORMATION.State)))
    print("Protect: 0x".. decimalToHex(tonumber(pMEMORY_BASIC_INFORMATION.Protect)))
    print("Type: 0x".. decimalToHex(tonumber(pMEMORY_BASIC_INFORMATION.Type)))
end

local data = VirtualQuery(prim_hooked_func_ptr)
local start = data.AllocationBase
data = VirtualQuery(data.AllocationBase)
only_print_memory_info(data)
data = VirtualQuery(data.AllocationBase+data.RegionSize)
only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
only_print_memory_info(data)
local finish = data.BaseAddress+data.RegionSize-1
data = VirtualQuery(data.BaseAddress+data.RegionSize)
only_print_memory_info(data)
print(bit.tohex(start))
print(bit.tohex(finish))
print(bit.tohex(finish-start))

local size = finish-start
local org_bytes = ffi.new("uint8_t[?]", size)
local base_addy = start
copy(org_bytes, base_addy, size)

local funny = decimalToHex(tonumber(ffi.cast("uintptr_t", base_addy)))
print(funny)

write_file("cooldump_" .. "0x" .. funny .. ".bin", ffi.cast("char*", org_bytes), size)