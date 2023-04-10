
				return function()
                    local mt, mt_data, this_mt = { }, { }

                    mt.__metatable = false
                    mt_data.struct = function(self, name)
                        assert(type(name) == 'string', 'invalid class name')
                        assert(rawget(self, name) == nil, 'cannot overwrite subclass')

                        return function(data)
                            assert(type(data) == 'table', 'invalid class data')
                            rawset(self, name, setmetatable(data, {
                                __metatable = false,
                                __index = function(self, key)
                                    return
                                        rawget(mt, key) or
                                        rawget(this_mt, key)
                                end
                            }))

                            return this_mt
                        end
                    end

                    this_mt = setmetatable(mt_data, mt)

                    return this_mt
                end
			local print, hooks = require("print")
        

    -- for the future investigations: https://github.com/perilouswithadollarsign/cstrike15_src/blob/f82112a2388b841d72cb62ca48ab1846dfcc11c8/common/detour/detourfunc.cpp#L633

    hooks = { }

    function hooks.rel_jmp(addr, pattern)
        if pattern then
            addr = utils.opcode_scan(addr, pattern)
        end
    
        addr = ffi.cast("uint8_t*", addr)
    
        local jmp_addr = ffi.cast("uintptr_t", addr)
        local jmp_disp = ffi.cast("int32_t*", jmp_addr + 0x1)[0]
    
        return ffi.cast("uintptr_t", jmp_addr + 0x5 + jmp_disp)
    end

    -- str ref: Couldn't get trampoline region lock, will continue possibly unsafely
    local hook = ffi.cast(
        "int(__cdecl*)(void*, void*, void*, int)",
        utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 51 8B 45 10 C7")
    )

    -- str ref: Aborting UnhookFunc because pRealFunctionAddr is not hooked
    local unhook = ffi.cast(
        "void(__cdecl*)(void*, bool)",
        hooks.rel_jmp(utils.opcode_scan("gameoverlayrenderer.dll", "E8 ? ? ? ? 83 C4 08 FF 15 ? ? ? ?"))
    )

    local all_hooks = { }
    function hooks.set(id, addr, typedef, callback)
        local addr_pointer = ffi.cast("void*", addr)

        all_hooks[id] = addr_pointer

        local typedef = ffi.typeof(typedef)

        local callback_fn = ffi.cast(typedef, callback)
        local original_pointer = ffi.typeof("$[1]", callback_fn)()

        local function actual_callback(...)
            local original = original_pointer[0]

            local call, result = pcall(callback, original, ...)
            if not call then
                if _DEBUG then
                    print(("\aFFFFFF[ERROR] \aFF0000%s\aFFFFFF! Calling original..."):format(result))
                end
                return original(...)
            end

            return result
        end

        local callback_type = ffi.cast(typedef, actual_callback)

        local result = hook(addr_pointer, callback_type, original_pointer, 0)
        if result == 1 then
            --print("[SUCCESS] Hooked function!")
        elseif result == 0 then
            if type(addr) ~= "number" then
                return print(("[EPIC FAIL] Failed to hook function! Unknown calling conv.!"))
            end

            print(("[EPIC FAIL] Failed to hook function! Addr: 0x%x!!!"):format(addr or 0))
        end

        return result
    end

    function hooks.remove(id)
        local orig = all_hooks[id]
        if orig then
            unhook(orig, false)
            --print("[SUCCESS] Removed hook!")
        end
    end

    events.shutdown:set(function ()
        for _, orig in pairs(all_hooks) do
            if orig then
                unhook(orig, false)
                --print("[SUCCESS] Removed hook!")
            end
        end
    end)
end

-- https://gist.github.com/tickcount/1f15706f269150b1fa2b6046026f8ef5

local molotov_color_modulation do
    molotov_color_modulation = { }

    local patricle_operator = ffi.typeof([[
        struct {
            char pad[92];
            unsigned char min[4];
            unsigned char max[4];
            unsigned char colmin[4];
            unsigned char colmax[4];
            unsigned char tintmin[4];
            unsigned char tintmax[4];
        }
    ]])

    local particle_operator_initializers = ffi.typeof([[
        struct {
            char pad_0[0x16C];
            $** data;
            char pad_1[0x8];
            int size;
        }*
    ]], patricle_operator)

    local patricle_attributes = ffi.typeof([[
        struct {
            float* base[24];
            size_t size[24];
        }
    ]])

    local utl_string = ffi.typeof([[
        struct {
            char* buffer;
            int capacity;
            int grow_size;
            int length;
        }
    ]])

    local patricle_system_definition = ffi.typeof([[
        struct {
            char pad_0[0x134];
            $ name;
        }
    ]], utl_string)

    local patricle_system_definition_ref = ffi.typeof([[
        struct {
            void* prev;
            void* next;

            $* object;
        }*
    ]], patricle_system_definition)

    local particle_collection = ffi.typeof([[
        struct {
            char pad_0[0x30]; 
            int active_particles; // 48
            char pad_1[0xC];
            $ definition; // 64
            char pad_2[0x4];
            $ initializers; // 72
            char pad_2[0x40];
            int* parent;
            char pad_3[0x50];
            $ attributes;
        }*
    ]], patricle_system_definition_ref, particle_operator_initializers, patricle_attributes)

    local constructor = hooks.rel_jmp("client.dll", "E8 ? ? ? ? C7 43 ? ? ? ? ? 8D BB ? ? ? ?")
    local destructor = hooks.rel_jmp("client.dll", "E8 ? ? ? ? 85 F6 74 14")

    local pointers = { }
    hooks.set("1", constructor, "void*(__fastcall*)(void*, void*)", function (original, this_ptr, edx)
        local result = original(this_ptr, edx)

        table.insert(pointers, ffi.cast("int*", result))

        return result
    end)

    local is_calling_destructor = false
    hooks.set("2", destructor, "void(__fastcall*)(void*, void*)", function (original, this_ptr, edx)
        is_calling_destructor = true

        for i, ptr in ipairs(pointers) do
            if ffi.cast("int", ptr) == ffi.cast("int", this_ptr) then
                table.remove(pointers, i)
                break
            end
        end

        original(this_ptr, edx)

        is_calling_destructor = false
    end)

    local function get_attribute(struct, num, i)
        local block_offs = math.floor(i / 4)
        return struct.base[num] + struct.size[num] * block_offs + (bit.band(i, 3))
    end

    local accepted_particles = {
        ["molotov_groundfire"] = true,
        ["molotov_groundfire_00MEDIUM"] = true,
        ["molotov_groundfire_00HIGH"] = true,
        ["molotov_groundfire_fallback"] = true,
        ["molotov_groundfire_fallback2"] = true,
        ["molotov_explosion"] = true,
        ["explosion_molotov_air"] = true,
        ["extinguish_fire"] = true,
        ["weapon_molotov_held"] = true,
        ["weapon_molotov_fp"] = true,
        ["weapon_molotov_thrown"] = true,
        ["incgrenade_thrown_trail"] = true,
        ["env_fire_tiny_b"] = true
    }

    local accepted_subparticles = {
        ["explosion_molotov_air_smoke"] = true,
        ["molotov_smoking_ground_child01"] = true,
        ["molotov_smoking_ground_child02"] = true,
        ["molotov_smoking_ground_child02_cheapo"] = true,
        ["molotov_smoking_ground_child03"] = true,
        ["molotov_smoking_ground_child03_cheapo"] = true
    }

    local bad_particles = {
        ["molotov_groundfire_child_base"] = true,
        ["molotov_groundfire_child_base8"] = true
    }

    local function apply_color(pointer, col)
        local collection = ffi.cast(particle_collection, pointer)
        if collection.active_particles == 0 then
            return
        end

        local def = ffi.cast(patricle_system_definition_ref, pointer[0] + 64) -- collection.definition didnt work for some reason
        local def_this = ffi.cast(patricle_system_definition_ref, pointer[0] + 64)

        local this_parent = ffi.cast("int*", pointer[0] + 136)
        while this_parent[0] ~= 0 do
            def = ffi.cast(patricle_system_definition_ref, this_parent[0] + 64)
            this_parent = ffi.cast("int*", this_parent[0] + 136)
        end

        local name = ffi.string(def.object.name.buffer)
        local name_this = ffi.string(def_this.object.name.buffer)

        if accepted_particles[name] == nil then
            return
        end

        if accepted_subparticles[name_this] ~= nil then
            return
        end

        local num_colors = #col

        for i = 0, collection.initializers.size - 1 do
            local operator = collection.initializers.data[i][0]
            if operator then
                if operator.colmin[0] ~= 0 then
                    local this_colorushka = col[(i % num_colors) + 1]

                    operator.min[0] = this_colorushka.r
                    operator.min[1] = this_colorushka.g
                    operator.min[2] = this_colorushka.b

                    operator.max[0] = this_colorushka.r
                    operator.max[1] = this_colorushka.g
                    operator.max[2] = this_colorushka.b
                end
            end
        end
        
        for i = 0, collection.active_particles - 1 do
            local ptr = get_attribute(collection.attributes, 6, i)

            local this_colorushka = col[(i % num_colors) + 1]

            ptr[0] = this_colorushka.r
            ptr[4] = this_colorushka.g
            ptr[8] = this_colorushka.b
        end
    end

    local menu do
        menu = { }

        local parent = ui.create("Fire Color Modulation")

        local btn1 = parent:button(ui.get_icon("plus") .. "  Add Color")
        local btn2 = parent:button(ui.get_icon("minus") .. "  Remove Color")

        menu.colors = {
            parent:color_picker("Color 1"),
            parent:color_picker("Color 2"),
            parent:color_picker("Color 3"),
            parent:color_picker("Color 4")
        }

        menu.secret_slider = parent:slider("num_colors", 1, 4, 2)
        menu.secret_slider:visibility(false)

        local function set_colors()
            local max = menu.secret_slider:get()

            for i = 1, 4 do
                menu.colors[i]:visibility(max >= i)
            end

            btn1:disabled(max == 4)
            btn2:disabled(max == 1)
        end

        btn1:set_callback(function ()
            menu.secret_slider:set(math.min(4, menu.secret_slider:get() + 1))

            set_colors()
        end)

        btn2:set_callback(function ()
            menu.secret_slider:set(math.max(1, menu.secret_slider:get() - 1))

            set_colors()
        end)

        set_colors()

        local sub_parent = ui.create("Information")

        sub_parent:label("For any suggesstions / reports DM: \n\n\a3d7efffflenin#6076")

        for _, url in ipairs({"https://i.imgur.com/ywVPLpT.gif", "https://i.imgur.com/Rgk0Jly.gif", "https://i.imgur.com/C77omKy.gif", "https://i.imgur.com/pyMjCtF.gif"}) do
            network.get(url, { }, function (data)
                if data then
                    sub_parent:texture(render.load_image(data), vector(470, 60) * render.get_scale(1) * 0.575)
                end
            end)
        end
    end

    ui.sidebar("Fire Modifications", ui.get_icon("fire"))

    function molotov_color_modulation.on_render()
        if is_calling_destructor then
            return
        end
    
        local col = { }

        for i = 1, menu.secret_slider:get() do
            local c = menu.colors[i]:get()
            col[i] = { r = c.r / 255, g = c.g / 255, b = c.b / 255 }
        end
    
        for i, pointer in ipairs(pointers) do
            if pointer[0] < 10000 then
                table.remove(pointers, i)
                break
            end
    
            apply_color(pointer, col)
    
            -- local this_parent = ffi.cast("int*", pointer[0] + 136)
            -- while this_parent[0] ~= 0 do
            --     apply_color(this_parent, col)
            --     this_parent = ffi.cast("int*", this_parent[0] + 136)
            -- end
        end 
    end

    local bad_materials do
        bad_materials = materials.get_materials("flare", true)

        for _, name in ipairs({
            "particle/fire_explosion_1/fire_explosion_1_oriented",
            "particle/fire_explosion_1/fire_explosion_1_bright"
        }) do
            bad_materials[#bad_materials+1] = materials.get(name, true)
        end
    end

    local function set_materials(b)
        for _, mat in ipairs(bad_materials) do
            mat:var_flag(2, b)
        end
    end

    set_materials(true)

    function molotov_color_modulation.on_shutdown()
        set_materials(false)
    end
end

events.post_render:set(molotov_color_modulation.on_render)
events.shutdown:set(molotov_color_modulation.on_shutdown)