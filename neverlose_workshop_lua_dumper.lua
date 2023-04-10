--[[


    WARNING, YOU MUST UNLOAD THE LUA RIGHT AS SOON AS YOU HAVE DUMPED SOMETHING, ELSE NEVERLOSE WILL HARDWARE ID BAN YOU BASED ON FUNCTION HOOK DETECTION!!!!!!!!

    HOW TO DUMP: LOAD THE LUA YOU WISH TO DUMP, LOAD THIS LUA, UNLOAD THE LUA YOU WISH TO DUMP, LOAD THE LUA YOU WISH TO DUMP AGAIN, UNLOAD THIS LUA, UNLOAD THE LUA YOU WISH TO DUMP, AND EXIT CSGO AS FAST AS POSSIBLE

    WORKS FOR EVERY SINGLE SCRIPT ON THE MARKET
]]

local ffi = require("ffi")
local bit = require("bit")
jit.off()
local uint8_t_ptr = ffi.typeof "uint8_t*"

local new, cast, typeof, ffi_string = ffi.new, ffi.cast, ffi.typeof, ffi.string

local clipboard = (function()
local function vtable_bind(module,interface,index,type)
    local addr = ffi.cast("void***", utils.create_interface(module, interface)) or error(interface..' is nil.')
    return ffi.cast(ffi.typeof(type), addr[0][index]),addr
end

local function __thiscall(func, this) -- bind wrapper for __thiscall functions
    return function(...)
        return func(this, ...)
    end
end


local nativeGetClipboardTextCount = __thiscall(vtable_bind("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)"))
local nativeSetClipboardText = __thiscall(vtable_bind("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)"))
local nativeGetClipboardText = __thiscall(vtable_bind("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)"))

local char_arr = ffi.typeof("char[?]")

local clipboard={}


clipboard.get=function()
    local text_length=nativeGetClipboardTextCount()
    if text_length > 0 then
        local clipboard_text = char_arr(text_length)
        nativeGetClipboardText(0, clipboard_text, text_length)
        return ffi.string(clipboard_text, text_length-1)
    end
    return nil
end

clipboard.set=function(text)
    text=tostring(text)
    nativeSetClipboardText(text, string.len(text))
end

clipboard.paste=clipboard.get
clipboard.copy=clipboard.set

return clipboard
end)()

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
        return '00'
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

-- print("original function address: " .. tonumber(voicedata_func_addr))

local CClientState = ffi.cast("uintptr_t**", ffi.cast("uintptr_t",utils.opcode_scan("engine.dll", "A1 ? ? ? ? 33 D2 6A 00 6A 00 33 C9 89 B0")) + 1)[0][0]
local vtable_voicedata_func_addr = ffi.cast("uintptr_t**", CClientState + 8)[0][24]

-- print("vtable function address: " .. tonumber(vtable_voicedata_func_addr))

local size = 5
local org_bytes = ffi.new("uint8_t[?]", size)
copy(org_bytes, voicedata_func_addr, size)

-- print(bit.tohex(tonumber(org_bytes[0])))
-- print(bit.tohex(tonumber(org_bytes[1])))
-- print(bit.tohex(tonumber(org_bytes[2])))
-- print(bit.tohex(tonumber(org_bytes[3])))
-- print(bit.tohex(tonumber(org_bytes[4])))

local read_funny = ffi.new("uint8_t[4]")
read_funny[0] = org_bytes[1]
read_funny[1] = org_bytes[2]
read_funny[2] = org_bytes[3]
read_funny[3] = org_bytes[4]

local funny_guy = ffi.cast("int32_t*", read_funny)

local offset = funny_guy[0] -- +
-- print("offset: " .. offset)

local prim_hooked_func_ptr = ffi.cast("uintptr_t", voicedata_func_addr) + 1 + offset -- relative jmp
print("nl hooked func ptr: " .. bit.tohex(tonumber(prim_hooked_func_ptr)))

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

local nativeVirtualProtect =
    proc_bind(
    "kernel32.dll",
    "VirtualProtect",
    "int(__stdcall*)(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect)"
)
local nativeVirtualAlloc =
    proc_bind(
    "kernel32.dll",
    "VirtualAlloc",
    "void*(__stdcall*)(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect)"
)
local nativeVirtualFree =
    proc_bind(
    "kernel32.dll",
    "VirtualFree",
    "int(__stdcall*)(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType)"
)

local buff = {free = {}}

local function VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect)
    return nativeVirtualProtect(ffi.cast("void*", lpAddress), dwSize, flNewProtect, lpflOldProtect)
end

local function VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect, blFree)
    local alloc = nativeVirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect)
    if blFree then
        table.insert(buff.free, alloc)
    end
    return ffi.cast("intptr_t", alloc)
end


local function find_signature(signature, addr, size)

    local image_bytes = ffi.cast(uint8_t_ptr, addr)

    for i = 0, size - #signature - 1 do
        local found = true

        for j = 0, #signature - 1 do
            local byte = signature:byte(j + 1)
            if image_bytes[i + j] ~= byte and byte ~= 204 then
                found = false
                break
            end
        end

        if found then
            return image_bytes + i
        end
    end

    return nil
end

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

local function setUint(array, offset, value)
    local value2 = tonumber(ffi.cast("uintptr_t", value))
    -- print(offset, " ", value2)
    for i = 0, 3 do
        array[i + offset] = bit.band(bit.rshift(value2, i * 8), 0xFF)
    end
end

local function createUwUcode(array)
    local mem = ffi.cast("void*", nativeVirtualAlloc(nil, #array, 0x3000, 0x40))
    ffi.copy(mem, ffi.new("char[?]", #array, array), #array)
    return mem
end

local data = VirtualQuery(prim_hooked_func_ptr)
local start = data.AllocationBase
data = VirtualQuery(data.AllocationBase)
--only_print_memory_info(data)
data = VirtualQuery(data.AllocationBase+data.RegionSize)
--only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
--only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
--only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
--only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
--only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
--only_print_memory_info(data)
data = VirtualQuery(data.BaseAddress+data.RegionSize)
--only_print_memory_info(data)
local finish = data.BaseAddress+data.RegionSize-1
data = VirtualQuery(data.BaseAddress+data.RegionSize)
--only_print_memory_info(data)
local size = finish-start

local luaL_loadbuffer = ffi.cast("intptr_t",find_signature("\x55\x8B\xEC\x83\xE4\xF8\x81\xEC\xCC\xCC\xCC\xCC\x8B\x45\x0C\xB9\xCC\xCC\xCC\xCC\x89\x44\x24\x08\x8B\x45\x10\x89\x44\x24\x0C\x8D\x44\x24\x08\x56\x89\x44\x24\x54\x8B\x45\x14\x85\xC0\x57\x8B\x7D\x08\x0F\x45\xC8\x68\xCC\xCC\xCC\xCC\x8D\x44\x24\x1C\xC7\x44\x24\xCC\xCC\xCC\xCC\xCC\x50\x6A\xCC\x57\x89\x4C\x24\x78\xC7\x44\x24\xCC\xCC\xCC\xCC\xCC\x89\x7C\x24\x60\xC7\x44\x24\xCC\xCC\xCC\xCC\xCC\xC7\x44\x24\xCC\xCC\xCC\xCC\xCC\xC7\x44\x24\xCC\xCC\xCC\xCC\xCC\xE8\xCC\xCC\xCC\xCC\x89\x44\x24\x1C\x8D\x44\x24\x28\x50\x57\xE8\xCC\xCC\xCC\xCC\x8B\x77\x08\x83\xC4\x18\x8B\x56\x08\x3B\x56\x0C\x72\x07\x8B\xCF\xE8\xCC\xCC\xCC\xCC\x8B\x44\x24\x0C\x5F\x5E\x8B\xE5\x5D\xC3",start,size))
assert(0 ~= tonumber(luaL_loadbuffer))

local hook_replace_bytes = 6

local org_bytes = ffi.new("uint8_t[?]", hook_replace_bytes)
copy(org_bytes, luaL_loadbuffer, hook_replace_bytes)

local pOriginal = VirtualAlloc(nil, hook_replace_bytes + 5, 0x3000, 0x40, false)

local trampoline_bytes = ffi.new("uint8_t[?]", hook_replace_bytes + 5, 0x90)
copy(trampoline_bytes, org_bytes, hook_replace_bytes)
trampoline_bytes[hook_replace_bytes] = 0xE9

ffi.cast("int32_t*", trampoline_bytes + hook_replace_bytes + 1)[0] = tonumber(luaL_loadbuffer) - tonumber(pOriginal) - hook_replace_bytes + (hook_replace_bytes - 5)
copy(pOriginal, trampoline_bytes, hook_replace_bytes + 5)



local pKernel32 = fnGetModuleHandle("kernel32.dll")
assert(0 ~= tonumber(pKernel32))
local pCreateFileA = fnGetProcAddress(pKernel32, "CreateFileA")
local pWriteFile = fnGetProcAddress(pKernel32, "WriteFile")
local pCloseHandle = fnGetProcAddress(pKernel32, "CloseHandle")
assert(0 ~= tonumber(pCreateFileA))
assert(0 ~= tonumber(pWriteFile))
assert(0 ~= tonumber(pCloseHandle))

local pFileHandle = nativeCreateFileA("UwU.lulz", GENERIC_WRITE, 0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nil)


local wrapper = { 0x55, 0x89, 0xE5, 0x81, 0xEC, 0x00, 0x00, 0x00, 0x00, 0x90, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x50, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x50, 0x8B, 0x45, 0x10, 0x50, 0x8B, 0x45, 0x0C, 0x50, 0xB8, 0xAA, 0xAA, 0xEE, 0xDE, 0x50, 0xB8, 0xCF, 0xBE, 0xAD, 0xDE, 0xFF, 0xD0, 0x8B, 0x45, 0x14, 0x50, 0x8B, 0x45, 0x10, 0x50, 0x8B, 0x45, 0x0C, 0x50, 0x8B, 0x45, 0x08, 0x50, 0xB8, 0xEF, 0xBE, 0xAD, 0xDE, 0xFF, 0xD0, 0x83, 0xC4, 0x10, 0xC9, 0xC3 }
--local wrapper = { 0x55, 0x89, 0xE5, 0x81, 0xEC, 0x00, 0x00, 0x00, 0x00, 0x90, 0x8B, 0x45, 0x14, 0x50, 0x8B, 0x45, 0x10, 0x50, 0x8B, 0x45, 0x0C, 0x50, 0x8B, 0x45, 0x08, 0x50, 0xB8, 0xEF, 0xBE, 0xAD, 0xDE, 0xFF, 0xD0, 0x83, 0xC4, 0x10, 0xC9, 0xC3 }
local file_name = "UwU.lua"

local szFileName = ffi.cast("void*", nativeVirtualAlloc(nil, #file_name, 0x3000, 0x04)) --DEP
ffi.copy(szFileName, new("char[?]", #file_name, file_name), #file_name)

setUint(wrapper, 0x20, tonumber(cast('uintptr_t', pFileHandle)))
setUint(wrapper, 0x26, tonumber(cast('uintptr_t', pWriteFile)))
setUint(wrapper, 0x3d, tonumber(cast('uintptr_t', pOriginal)))

-- setUint(wrapper, 0x5b, tonumber(cast('uintptr_t', szFileName)))
-- setUint(wrapper, 0x61, tonumber(cast('uintptr_t', pCreateFileA)))
-- setUint(wrapper, 0x83, tonumber(cast('uintptr_t', pWriteFile)))
-- setUint(wrapper, 0x8e, tonumber(cast('uintptr_t', pCloseHandle)))
-- setUint(wrapper, 0xa5, tonumber(cast('uintptr_t', pOriginal)))

--setUint(wrapper, 0x1c, tonumber(cast('uintptr_t', pOriginal)))

-- local outputlol = ""

-- for i,v in pairs(wrapper) do outputlol = outputlol..""..decimalToHex(v).." " end
-- print(outputlol)

local function UwUfunc(a1, a2, a3, a4)
    clipboard.set("so I did get called")
    return 0
end

local UwUcode = createUwUcode(wrapper)
--local UwUcode = ffi.cast("int(__cdecl*)(void*, void*, void*, void*)",UwUfunc)

local hook_bytes = ffi.new("uint8_t[?]", hook_replace_bytes, 0x90)
hook_bytes[0] = 0xE9
ffi.cast("int32_t*", hook_bytes + 1)[0] = (tonumber(cast("intptr_t",UwUcode))-tonumber(luaL_loadbuffer) - 5)

-- for i=0, hook_replace_bytes-1 do
--     print(decimalToHex(hook_bytes[i]))
-- end

-- if 1==1 then return end

local old_prot = ffi.new("unsigned long[1]")
VirtualProtect(luaL_loadbuffer, hook_replace_bytes, 0x40, old_prot)
copy(luaL_loadbuffer, hook_bytes, hook_replace_bytes)
VirtualProtect(luaL_loadbuffer, hook_replace_bytes, 0x20, old_prot)

print("UwUed!")

local function on_shutdown()
    VirtualProtect(luaL_loadbuffer, hook_replace_bytes, 0x40, old_prot)
    copy(luaL_loadbuffer, org_bytes, hook_replace_bytes)
    VirtualProtect(luaL_loadbuffer, hook_replace_bytes, 0x20, old_prot)
    nativeCloseHandle(pFileHandle)
end

utils.execute_after(5, function()
    on_shutdown()
    print("UnUwUed!")
end)

events.shutdown:set(on_shutdown)