slot0 = nil
slot0 = {}
slot2 = nil
slot2 = {
	[slot7] = slot6
}

for slot6, slot7 in pairs({
	["Clan Tag"] = ui.get_icon("user-group") .. "  Clan Tag",
	["Trash Talk"] = ui.get_icon("face-tired") .. "  Trash Talk",
	["Scoreboard Icon"] = ui.get_icon("image-polaroid") .. "  Scoreboard Icon",
	["Unmute Silenced Players"] = ui.get_icon("microphone") .. "  Unmute Silenced Players",
	["Override Aspect Ratio"] = ui.get_icon("tv-retro") .. "  Override Aspect Ratio",
	["Override Viewmodel"] = ui.get_icon("hand") .. "  Override Viewmodel",
	["Log Aimbot Shots"] = ui.get_icon("list-ol") .. "  Log Aimbot Shots",
	["Automatic DT Release"] = ui.get_icon("transporter") .. "  Automatic DT Release",
	["Force Defensive in Air"] = ui.get_icon("bug") .. "  Force Defensive in Air",
	["Override Roll Axis"] = ui.get_icon("poo-storm") .. "  Override Roll Axis",
	Windows = ui.get_icon("window") .. "  Windows",
	["Crosshair Indicator"] = ui.get_icon("list-tree") .. "  Crosshair Indicator",
	["Manual Anti-Aim Arrows"] = ui.get_icon("arrows-repeat") .. "  Manual Anti-Aim Arrows",
	["Override Scope Overlay"] = ui.get_icon("plus-large") .. "  Override Scope Overlay",
	["On-Screen Shot Logs"] = ui.get_icon("list-timeline") .. "  On-Screen Shot Logs",
	["On-Screen Hit Marker"] = ui.get_icon("crosshairs-simple") .. "  On-Screen Hit Marker",
	["Simple Chat"] = ui.get_icon("comments") .. "  Simple Chat",
	["Grenade Radius"] = ui.get_icon("circle-dashed") .. "  Grenade Radius",
	["Console Modulation"] = ui.get_icon("terminal") .. "  Console Modulation",
	["Taskbar Notify on Round Start"] = ui.get_icon("timer") .. "  Taskbar Notify on Round Start",
	Mode = ui.get_icon("gear") .. "  Mode",
	["Manual Yaw Base"] = ui.get_icon("arrows-repeat") .. "  Manual Yaw Base",
	Tweaks = ui.get_icon("wand-magic-sparkles") .. "  Tweaks",
	["Anim. Breakers"] = ui.get_icon("person-running") .. "  Anim. Breakers",
	["Safe Head"] = ui.get_icon("shield-check") .. "  Safe Head",
	["Boost Framerate"] = ui.get_icon("film") .. "  Boost Framerate",
	["Custom Hitchance"] = ui.get_icon("bullseye-arrow") .. "  Custom Hitchance"
}) do
	-- Nothing
end

function slot0.get(slot0)
	return uv0[slot0] or slot0
end

function slot0.get_inverse(slot0)
	return uv0[slot0] or slot0
end

cvar.clear:call()

function slot1(...)
	for slot5 = 1, #{
		...
	} do
		slot0 = "" .. tostring(slot1[slot5]) .. "\t"
	end

	print_raw(slot0)
end

slot2 = math.min

function slot3(slot0, slot1, slot2)
	return uv0(slot0, (slot0 + (slot2 or 1)) * slot1)
end

slot4 = nil

function ()
	uv0 = {}
	slot0 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="

	function uv0.encode(slot0)
		slot1 = uv0

		return (slot0:gsub(".", function (slot0)
			slot2 = slot0:byte()

			for slot6 = 8, 1, -1 do
				slot1 = "" .. (slot2 % 2^slot6 - slot2 % 2^(slot6 - 1) > 0 and "1" or "0")
			end

			return slot1
		end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function (slot0)
			if #slot0 < 6 then
				return ""
			end

			for slot5 = 1, 6 do
				slot1 = 0 + (slot0:sub(slot5, slot5) == "1" and 2^(6 - slot5) or 0)
			end

			return uv0:sub(slot1 + 1, slot1 + 1)
		end) .. ({
			"",
			"==",
			"="
		})[#slot0 % 3 + 1]
	end

	function uv0.decode(slot0)
		return string.gsub(slot0, "[^" .. uv0 .. "=]", ""):gsub(".", function (slot0)
			if slot0 == "=" then
				return ""
			end

			slot2 = uv0:find(slot0) - 1

			for slot6 = 6, 1, -1 do
				slot1 = "" .. (slot2 % 2^slot6 - slot2 % 2^(slot6 - 1) > 0 and "1" or "0")
			end

			return slot1
		end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function (slot0)
			if #slot0 ~= 8 then
				return ""
			end

			for slot5 = 1, 8 do
				slot1 = 0 + (slot0:sub(slot5, slot5) == "1" and 2^(8 - slot5) or 0)
			end

			return string.char(slot1)
		end)
	end
end()

slot5 = nil
slot5 = {
	rel_jmp = function (slot0, slot1)
		if slot1 then
			slot0 = utils.opcode_scan(slot0, slot1)
		end

		slot2 = ffi.cast("uintptr_t", ffi.cast("uint8_t*", slot0))

		return ffi.cast("uintptr_t", slot2 + 5 + ffi.cast("int32_t*", slot2 + 1)[0])
	end
}
slot6 = ffi.cast("int(__cdecl*)(void*, void*, void*, int)", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 51 8B 45 10 C7"))
slot7 = ffi.cast("void(__cdecl*)(void*, bool)", slot5.rel_jmp(utils.opcode_scan("gameoverlayrenderer.dll", "E8 ? ? ? ? 83 C4 08 FF 15 ? ? ? ?")))
slot8 = {}

function slot5.set(slot0, slot1, slot2, slot3)
	slot4 = ffi.cast("void*", slot1)
	uv0[slot0] = slot4
	slot5 = ffi.typeof(slot2)

	if uv2(slot4, ffi.cast(slot5, function (...)
		slot1, slot2 = pcall(uv1, uv0[0], ...)

		if not slot1 then
			if _DEBUG then
				uv2(("FFFFFF[ERROR] FF0000%sFFFFFF! Calling original..."):format(slot2))
			end

			return slot0(...)
		end

		return slot2
	end), ffi.typeof("$[1]", ffi.cast(slot5, slot3))(), 0) == 1 then
		-- Nothing
	elseif slot10 == 0 then
		if type(slot1) ~= "number" then
			return uv1("[EPIC FAIL] Failed to hook function! Unknown calling conv.!")
		end

		uv1(("[EPIC FAIL] Failed to hook function! Addr: 0x%x!!!"):format(slot1 or 0))
	end

	return slot10
end

function slot5.remove(slot0)
	if uv0[slot0] then
		uv1(slot1, false)
	end
end

events.shutdown:set(function ()
	for slot3, slot4 in pairs(uv0) do
		if slot4 then
			uv1(slot4, false)
		end
	end
end)

slot6 = nil
slot6 = {
	get = function ()
		if uv0() ~= 0 then
			slot1 = uv1(slot0)

			uv2(0, slot1, ffi.sizeof(slot1) * slot0)

			return ffi.string(slot1, slot0 - 1)
		end

		return ""
	end,
	set = function (slot0)
		if slot0 then
			uv0(slot0, slot0:len())
		end
	end
}
slot7 = ffi.typeof("char[?]")
slot8 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)")
slot9 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")
slot10 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
slot7 = nil
slot7 = {
	profile = function (slot0, slot1, ...)
		if not uv0 then
			return slot1(...)
		end

		if not uv1[slot0] then
			uv1[slot0] = {
				total = 0,
				max_diff = 0
			}
			slot2 = uv1[slot0]
		end

		slot5 = common.get_timestamp() - common.get_timestamp()
		slot2.max_diff = math.max(slot2.max_diff, slot5)
		slot2.total = slot2.total + slot5

		return slot1(...)
	end,
	export_data = function ()
		return uv0
	end,
	send = function (slot0)
		slot1 = common.get_username()
	end,
	filter_profiler = filter_profiler,
	markup = function (slot0, slot1)
		if uv0[slot0] then
			return false
		end

		uv0[slot0] = true

		return ([[
User <b>%s</b> crashed!
Callback: <code>%s</code>

Error:
<code>%s</code>

%s]]):format(common.get_username(), slot0, slot1:gsub("%x%x%x", ""):sub(2, -1), filter_profiler(3))
	end
}
slot8 = false
slot9 = {}

function slot10(slot0, slot1)
	slot1 = slot1 or {
		"L",
		"O",
		"L",
		"T",
		"O",
		"H",
		"E",
		"L",
		"L"
	}

	for slot6 = 0, #slot0 - 1 do
		slot2 = "" .. string.char(bit.bxor(slot0:sub(slot6 + 1, slot6 + 1):byte(), slot1[slot6 % #slot1 + 1]:byte()))
	end

	return slot2
end

function filter_profiler(slot0)
	if not uv0 then
		return ""
	end

	slot1 = "<b>Profiler data:</b>\n<code>"
	slot2 = {}

	for slot6, slot7 in pairs(uv1) do
		slot2[#slot2 + 1] = {
			slot6,
			slot7
		}
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1[2].max_diff < slot0[2].max_diff
	end)

	slot3 = {}

	for slot9 = 1, slot0 do
		slot10 = slot2[slot9][1]
		slot11 = tostring(slot2[slot9][2].max_diff)
		slot4 = math.max(0, #slot10)
		slot5 = math.max(0, #slot11)
		slot3[#slot3 + 1] = {
			slot10,
			slot11
		}
	end

	function slot6(slot0, slot1)
		for slot6 = 1, slot1 do
			slot2 = "" .. slot0
		end

		return slot2
	end

	slot7 = slot6("-", slot4 + slot5 + 13)
	slot8 = {
		slot7,
		"| Name " .. slot6(" ", slot4 - 5) .. " | Diff. " .. slot12 .. " |",
		slot7
	}
	slot12 = slot6(" ", slot5)

	for slot12 = 1, #slot3 do
		slot13 = slot3[slot12]
		slot8[#slot8 + 1] = "| " .. slot13[1] .. slot6(" ", slot4 - #slot13[1]) .. " | " .. slot6(" ", 7 - #slot13[2]) .. slot13[2] .. " |"
	end

	slot8[#slot8 + 1] = slot7

	return slot1 .. table.concat(slot8, "\n") .. "</code>"
end

slot11 = {}
slot8 = {
	ascii_base = function (slot0, slot1)
		return slot1:lower() == slot1 and ("a"):byte() or ("A"):byte()
	end,
	cipher = function (slot0, slot1, slot2)
		return slot1:gsub("%a", function (slot0)
			slot1 = uv0:ascii_base(slot0)

			return string.char((slot0:byte() - slot1 + uv1) % 26 + slot1)
		end)
	end,
	decipher = function (slot0, slot1, slot2)
		return slot0:cipher(slot1, -slot2)
	end
}
slot9 = nil

function ()
	slot0 = {
		["6"] = true,
		["5"] = true,
		["="] = true,
		["9"] = true,
		["8"] = true,
		["7"] = true,
		["0"] = true,
		["1"] = true,
		["4"] = true,
		["3"] = true,
		["2"] = true
	}

	function uv0(slot0)
		for slot5 = 1, #slot0 do
			if string.byte(slot0:sub(slot5, slot5)) >= 65 and slot7 <= 122 or uv0[slot6] then
				slot1 = "" .. slot6
			end
		end

		return slot1
	end
end()

slot10 = {
	charge = 0,
	last_body_yaw = 0,
	on_warmup = false,
	can_be_connected_to_exscord = false,
	menu_visible = false,
	global_cond = -1,
	ab_phase = 0,
	yaw = 0,
	anim_done = false,
	update_date = "03.04",
	script_name = "acidtech",
	build1 = "Stable",
	build = "stable",
	screen_size = render.screen_size(),
	screen_center = render.screen_size() / 2,
	username = common.get_username(),
	panorama = panorama,
	ab_phases = {},
	functions = {
		jitter = 0,
		should_stop_jittering = false,
		is_overriding_hc = false,
		dmg_override = false,
		scope_anim = 0,
		should_fs_desync = false,
		is_fakelagging = false,
		anti_bruteforce_side = false,
		anti_bruteforce = -1,
		safehead = false,
		rolldesync = false,
		edge_yaw = false,
		on_use_aa_yaw_override = 0,
		on_use_aa = false
	}
}

while slot10.screen_size.x == 0 do
	slot10.screen_size = render.screen_size()
end

ui.sidebar(("%s [%s]"):format(slot10.script_name, slot10.build), "couch")

slot11 = panorama.loadstring([[
    return {
        stringify: JSON.stringify,
        parse: JSON.parse
    };
]])()
slot12 = math.abs

function slot13(slot0, slot1, slot2, slot3)
	if uv0(slot0 - slot1) < (slot3 or 0.01) then
		return slot1
	end

	if globals.frametime * slot2 * 175 < 0 then
		slot2 = 0.01
	elseif slot2 > 1 then
		slot2 = 1
	end

	return (slot1 - slot0) * slot2 + slot0
end

function slot14(slot0)
	if slot0 == nil then
		return {}
	end

	for slot5 = 1, #slot0 do
	end

	return {
		[slot0[slot5]] = true
	}
end

function slot15(slot0)
	if slot0 == nil then
		return {}
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		if slot6 then
			slot1[#slot1 + 1] = slot5
		end
	end

	return slot1
end

slot16 = color(162, 132, 255, 255)
slot17 = {
	white = color(),
	pinky = color(255, 100, 100, 255)
}
slot18 = vector

function slot20(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot5 then
		slot7 = "d" .. "o"
	end

	if slot6 then
		slot7 = slot7 .. "c"
	end

	render.text(slot4, slot1, slot2, slot7, slot0)
end

slot21 = math.min
slot22 = {
	elements = {},
	color_str = ffi.typeof("struct { uint8_t r, g, b, a; }"),
	color_print = function (slot0, slot1, slot2)
		if not slot0.native_ColorPrint then
			slot0.native_ColorPrint = utils.get_vfunc("vstdlib.dll", "VEngineCvar007", 25, "void(__cdecl*)(void*, void*, const char*)")
		end

		slot0.native_ColorPrint(slot0.color_str(slot2.r, slot2.g, slot2.b, slot2.a), slot1)
	end,
	font = render.load_font("Verdana", 12, "ad"),
	push = function (slot0, ...)
		for slot6 = 1, #{
			...
		} do
			slot1[slot6][3] = render.measure_text(slot0.font, "d", slot1[slot6][2]).x

			slot0:color_print(slot1[slot6][2], slot1[slot6][1])

			if not slot1[slot6][2]:find(uv0.script_name) then
				slot2 = "" .. slot1[slot6][2]
			end
		end

		slot0:color_print("\n", uv1.white)
		print_dev(slot2)
	end,
	push2 = function (slot0, ...)
		for slot5 = 1, #{
			...
		} do
			slot0:color_print(slot1[slot5][2], slot1[slot5][1])
		end

		slot0:color_print("\n", uv0.white)
	end,
	push3 = function (slot0, ...)
		for slot6 = 1, #{
			...
		} do
			if not slot1[slot6][2]:find(uv0.script_name) then
				slot2 = "" .. slot1[slot6][2]
			end
		end

		print_dev(slot2)
	end
}
slot23 = {
	antiaim = false,
	ragebot = false,
	global = false,
	misc = false,
	modifications = false,
	visuals = false
}
slot24 = {}
slot25 = {
	custom_visibility = {},
	visibilities = {},
	add_custom_callback = function (slot0, slot1, slot2, slot3, slot4)
		if not slot0.custom_visibility[slot1] then
			slot0.custom_visibility[slot1] = {}
		end

		slot0.custom_visibility[slot1][slot2] = slot4

		slot3:set_callback(slot4)
		slot4()
	end,
	register_visibility = function (slot0, slot1, slot2, slot3)
		slot1.main:set_callback(function ()
			slot0 = true

			if uv0 == "antiaim" then
				slot0 = uv1.AntiAim.main:Get()
			end

			for slot4, slot5 in pairs(uv2) do
				if slot4 ~= "main" and slot4 ~= "tab_info" then
					if type(slot5) ~= "table" then
						slot5:visibility(slot0)
					else
						if type(slot5.main and slot5.main:get() or false) == "number" then
							slot6 = slot6 > 0
						end

						slot7 = slot5.custom ~= nil

						if slot5.main then
							slot5.main:visibility(slot0)
						end

						if slot7 then
							for slot11 = 1, #slot5.elements do
								slot5.elements[slot11]:visibility(slot0 and slot5.main:Get(slot11))
							end
						else
							for slot11, slot12 in pairs(slot5) do
								if type(slot12) == "table" then
									for slot17, slot18 in pairs(slot12) do
										if slot17 ~= "main" then
											slot18:visibility(slot0 and slot6 and slot12.main:get())
										else
											slot18:visibility(slot0 and slot6)
										end
									end
								elseif slot11 ~= "main" then
									slot12:visibility(slot0 and slot6)
								end
							end
						end
					end
				end
			end

			uv3.antiaim = true
			uv3.ragebot = true
			uv3.visuals = true
			uv3.modifications = true
			uv3.misc = true

			if uv4.custom_visibility[uv0] then
				for slot4, slot5 in pairs(uv4.custom_visibility[uv0]) do
					slot5()
				end
			end
		end)

		for slot8, slot9 in pairs(slot1) do
			if type(slot9) == "table" then
				if slot9.main then
					slot9.main:set_callback(slot4)
				end

				for slot13, slot14 in pairs(slot9) do
					if type(slot14) == "table" and slot14.main then
						slot14.main:set_callback(slot4)
					end
				end
			end
		end

		slot4()

		function slot0.main_visibility()
			uv0.Ragebot.main:Set(true)
			uv0.Ragebot.main:SetVisible(false)
			uv0.Visuals.main:Set(true)
			uv0.Visuals.main:SetVisible(false)
			uv0.Modifications.main:Set(true)
			uv0.Modifications.main:SetVisible(false)
			uv0.Misc.main:Set(true)
			uv0.Misc.main:SetVisible(false)
			uv0.AntiAim.main:Set(true)
			uv0.AntiAim.main:SetVisible(false)
		end

		slot0.visibilities[#slot0.visibilities + 1] = slot4
	end,
	all_callbacks = {},
	register_callbacks = function (slot0, slot1)
		function slot2(slot0, slot1)
			return function ()
				uv0[uv1] = uv2:get()
			end
		end

		function slot3(slot0, slot1, slot2)
			return function ()
				if not uv0[uv1] then
					uv0[uv1] = {}
				end

				uv0[uv1][uv2] = uv3:get()
			end
		end

		function slot4(slot0, slot1, slot2, slot3)
			return function ()
				if not uv0[uv1] then
					uv0[uv1] = {}
				end

				if not uv0[uv1][uv2] then
					uv0[uv1][uv2] = {}
				end

				uv0[uv1][uv2][uv3] = uv4:get()
			end
		end

		for slot8, slot9 in pairs(slot1) do
			if slot8 == "main" then
				-- Nothing
			elseif type(slot9) == "table" then
				for slot13, slot14 in pairs(slot9) do
					if type(slot14) == "table" then
						for slot18, slot19 in pairs(slot14) do
							slot20 = slot4(slot8, slot13, slot19, slot18)

							slot19:set_callback(slot20)

							slot0.all_callbacks[#slot0.all_callbacks + 1] = slot20

							slot20()
						end
					else
						if type(slot14) ~= "userdata" then
							break
						end

						slot15 = slot3(slot8, slot14, slot13)

						slot14:set_callback(slot15)

						slot0.all_callbacks[#slot0.all_callbacks + 1] = slot15

						slot15()
					end
				end
			else
				slot10 = slot2(slot8, slot9)

				slot9:set_callback(slot10)

				slot0.all_callbacks[#slot0.all_callbacks + 1] = slot10

				slot10()
			end
		end
	end
}
slot26 = {
	convert = {
		createmove = "createmove_run",
		prediction = "createmove",
		draw = "render",
		registered_shot = "rbot_registered",
		destroy = "shutdown"
	},
	data = {},
	breakpoints = {},
	shutdowns = {},
	reports_sent = {},
	get_lp = entity.get_local_player,
	get_pl = entity.get_players,
	store_data_fn = function (slot0, slot1)
		return function (slot0)
			slot1 = uv0.data[uv1]
			slot1.lp = uv0.get_lp()
			slot1.is_lp_valid = slot1.lp and slot1.lp:is_alive()
			slot1.enemies = uv0.get_pl(true, true)
			slot1.additional = slot0
		end
	end,
	add = function (slot0, slot1, slot2, slot3)
		if slot0.convert[slot1] == nil then
			slot4 = slot1
		end

		if not slot0.data[slot4] then
			slot0.data[slot4] = {
				is_lp_valid = false,
				lp = slot0.get_lp(),
				enemies = slot0.get_pl(true, true)
			}

			events[slot4]:set(slot0:store_data_fn(slot4))
		end

		if slot4 == "shutdown" or slot1 == "shutdown" then
			slot0.shutdowns[#slot0.shutdowns + 1] = slot3
		end

		return events[slot4]:set(function ()
			slot1 = uv0.breakpoints[uv2]
			slot2, slot3 = nil

			if uv0.data[uv1].additional ~= nil then
				slot2, slot3 = pcall(function ()
					uv0.profile(uv1, uv2, uv3.additional, uv3.lp, uv3.is_lp_valid, uv3.enemies)
				end)
			else
				slot2, slot3 = pcall(function ()
					uv0.profile(uv1, uv2, uv3.lp, uv3.is_lp_valid, uv3.enemies)
				end)
			end

			if not slot2 then
				if _DEBUG then
					cvar.play:call("error")

					return uv5(slot3)
				end

				if not uv0.reports_sent[uv2] then
					uv0.reports_sent[uv2] = true

					return uv3.send(uv3.markup(uv2, slot3))
				end
			end
		end)
	end
}
slot28 = ui
slot29 = {}
slot30 = {}
slot31 = {}
slot32 = {
	groups = {},
	SetupGroup = function (slot0, slot1, slot2)
		if not slot0.groups[slot1 .. "_" .. slot2] then
			if slot2:find("Presets") then
				slot0.groups[slot3] = uv0.create(slot1, slot2, 1)
			elseif slot2:find("Builder") or slot2:find("Configs") or slot2:find("Recommendations") then
				slot0.groups[slot3] = uv0.create(slot1, slot2, 2)
			else
				slot0.groups[slot3] = uv0.create(slot1, slot2)
			end
		end

		return slot0.groups[slot3]
	end,
	SetupMT = function (slot0, slot1)
		slot2 = getmetatable(slot1)

		if uv0 then
			slot3 = {
				"menu_group(Angles)",
				"menu_group(Yaw Modifier)",
				"menu_group(Yaw Modifier)",
				"menu_group(Yaw)",
				"menu_group(Body Yaw)"
			}
			slot4 = slot2.parent

			function slot2.parent(...)
				return uv0(...), globals.tickcount % 3125 % 4178
			end

			slot5 = slot2.__index
			slot6 = {}

			for slot10, slot11 in pairs(slot2) do
				if tonumber(tostring(slot11):sub(-10)) then
					slot6[#slot6 + 1] = {
						n = slot10,
						num = slot13
					}
				end
			end

			table.sort(slot6, function (slot0, slot1)
				return slot0.num < slot1.num
			end)

			for slot10, slot11 in ipairs(slot6) do
				if slot11.n == "override" then
					slot13 = slot6[slot10 + 1]

					assert(slot6[slot10 - 1] ~= nil and slot13 ~= nil, "lol")
					assert(slot12.n == "get_override" and slot13.n == "name", "attempt to index a nil value 2")
				end
			end

			assert(type(slot5) == "table", "attempt to index a nil value 1")

			function slot2.__index(slot0, ...)
				if ({
					...
				})[1] == "get_override" then
					slot2, slot3 = slot0:parent()
					slot4 = tostring(slot2)

					if slot3 ~= globals.tickcount % 3125 % 4178 then
						return function ()
							return "пошёл в жлпу :D"
						end
					end

					slot5 = false

					for slot9, slot10 in ipairs(uv0) do
						if slot10 == slot4 then
							slot5 = true

							break
						end
					end

					if slot5 then
						return function ()
							return "пошёл в жлпу :D"
						end
					end
				end

				return uv1[slot1[1]]
			end

			slot7 = slot2.metatable

			events.shutdown:set(function ()
				uv0.__index = uv1
				uv0.parent = uv2
			end)
		end

		function slot2.Get(slot0, slot1)
			if slot1 then
				return slot0:get(slot1)
			end

			return slot0:get()
		end

		function slot2.Set(slot0, slot1, slot2)
			if slot2 then
				return slot0:set(slot1, slot2)
			end

			return slot0:set(slot1)
		end

		function slot2.SetVisible(slot0, slot1)
			return slot0:visibility(slot1)
		end

		function slot2.GetCombo(slot0, slot1)
			if uv1[uv0.get_inverse(slot0:name())] then
				slot3 = slot0:get()

				if not slot1 then
					for slot7 = 1, #uv1[slot2] do
						if uv1[slot2][slot7] == slot3 then
							return slot7 - 1
						end
					end
				else
					for slot7 = 1, #slot3 do
						if uv1[slot2][slot1] == slot3[slot7] then
							return true
						end
					end
				end
			end
		end

		function slot2.RegisterCallback(slot0, slot1)
			return slot0:set_callback(slot1)
		end

		function slot2.CreateGear(slot0)
			uv0[slot0:name()] = slot0:create()

			return slot0
		end
	end
}
slot33 = slot28.create("Global", "Global"):switch("...")

slot33:visibility(false)
slot32:SetupMT(slot33)

function slot32.FindVar(...)
	if not uv0.find(...) then
		return uv1("LOCAL MISTER REF -> ", ...)
	end

	return slot0
end

function slot32.List(slot0, slot1, slot2, slot3)
	slot5 = uv0:SetupGroup(slot0, slot1):list(slot2, slot3)

	slot5:name(uv1.get(slot2))

	return slot5
end

function slot32.Text(slot0, slot1, slot2, slot3)
	slot4 = uv0:SetupGroup(slot0, slot1)

	if slot3 then
		slot4 = uv1[slot3]
	end

	slot5 = slot4:label(slot2)

	slot5:name(uv2.get(slot2))

	return slot5
end

function slot32.Button(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = uv0:SetupGroup(slot0, slot1)

	if slot5 then
		slot6 = uv2[uv1.get(slot5)]
	end

	slot7 = slot6:button(slot2, slot4 or function ()
	end, true)

	slot7:name(uv1.get(slot2))
	slot7:tooltip(slot3 or "")

	return slot7
end

function slot32.Switch(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = uv0:SetupGroup(slot0, slot1)

	if slot5 then
		slot6 = uv2[uv1.get(slot5)]
	end

	slot7 = slot6:switch(slot2, slot3)

	slot7:name(uv1.get(slot2))
	slot7:tooltip(slot4 or "")

	return slot7
end

function slot32.MultiCombo(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = uv0:SetupGroup(slot0, slot1)

	if slot6 then
		slot7 = uv2[uv1.get(slot6)]
	end

	slot8 = slot7:selectable(slot2, slot3)

	slot8:name(uv1.get(slot2))
	slot8:set(slot4)

	uv3[slot2] = slot3

	slot8:tooltip(slot5 or "")

	return slot8
end

function slot32.SliderInt(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = uv0:SetupGroup(slot0, slot1)

	if slot7 then
		slot8 = uv2[uv1.get(slot7)]
	end

	slot9 = nil

	if slot6 ~= "%" then
		((slot2 ~= "Ratio" or slot8:slider(slot2, 100, 180, slot3, 0.01, function (slot0)
			if slot0 == 100 then
				return "Off"
			end
		end)) and slot8:slider(slot2, slot4, slot5, slot3)):tooltip(slot6 or "")
	else
		slot9 = slot8:slider(slot2, slot4, slot5, slot3, 1, "%")
	end

	slot9:name(uv1.get(slot2))

	return slot9
end

function slot32.Combo(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = uv0:SetupGroup(slot0, slot1)

	if slot6 then
		slot7 = uv2[uv1.get(slot6)]
	end

	slot8 = slot7:combo(slot2, slot3)

	slot8:name(uv1.get(slot2))
	slot8:set(slot3[slot4 + 1])

	uv3[slot2] = slot3

	slot8:tooltip(slot5 or "")

	return slot8
end

function slot32.ColorEdit(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = uv0:SetupGroup(slot0, slot1)

	if slot5 then
		slot6 = uv2[uv1.get(slot5)]
	end

	slot7 = slot6:color_picker(slot2, slot3)

	slot7:name(uv1.get(slot2))
	slot7:tooltip(slot4 or "")

	return slot7
end

function slot32.TextBox(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = uv0:SetupGroup(slot0, slot1)

	if slot6 then
		slot7 = uv2[uv1.get(slot6)]
	end

	slot8 = slot7:input(slot2, slot4)

	slot8:name(uv1.get(slot2))
	slot8:tooltip(slot5 or "")

	return slot8
end

slot33 = vector(1, 1)
slot34 = {
	"Global",
	"Standing",
	"Moving",
	"Slowwalking",
	"Ducking",
	"Jumping",
	"Crouching Air",
	"Legit AA",
	"Fakelagging"
}
slot35 = {
	fov = cvar.viewmodel_fov:float(),
	viewmodel_offset_x = cvar.viewmodel_offset_x:float(),
	viewmodel_offset_y = cvar.viewmodel_offset_y:float(),
	viewmodel_offset_z = cvar.viewmodel_offset_z:float(),
	r_aspectratio = cvar.r_aspectratio:float()
}
slot36 = slot28.get_style("Link Active"):to_hex()
slot37 = slot28.get_style("Sidebar Text"):to_hex()
slot38 = {
	tabs = {
		Modifications = "Modifications",
		Misc = "Misc",
		Main = "Main",
		Ragebot = "Ragebot",
		AntiAim = "Anti-Aim",
		Recommendations = "Recommendations",
		Configs = "Configs",
		Condass = "Builder",
		Presets = "Presets",
		Widgets = "Visuals",
		["Valve Server Crasher"] = slot28.get_icon("bomb") .. "  Server Exploit",
		AntiAim_tab = "🛡" .. " Anti-Aim",
		Global_tab = "🏠" .. " Home"
	}
}
slot39 = nil

function ()
	uv0 = {}
	slot0 = {
		["Safe Preset"] = "[acid_preset]>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NnbnEsOqECS0DB5pC0u1gCGugrhnTnOUErDnQHOph19agq9efL90C0u1gCGugrhnTnOJfCSmDrcqEHNxNrAzDBOxEBWkYB92fB5sNou0hsAqQHO5DCikDBWpRA9Ihr91D2mugriGfCNnToFxNsqmi19nDCSqC01airqzEdN6NpK0NKWmhriqiHNxNsOkgLqyfCWkZ2cai3imgLyugrhnToDbQHO5DCikDBWpC01airqzEdN6RHbnjBK3C21aEK9REBiuiJKGNotnWLqeDBOxEBVnQHO5DCikDBWpRA9Sg3EugrhnToFxNsqmi19mELWkWMAof2qzEdN6RHbnjBK3C21aEK9Sg3EugrhnTnOIEB50ECNnQHOxDsqkgB9pEA9Ihr91D2mugriGfCNnTnOUhMGah2q0EXNxNsqmi19yg2WkELAsC01airqzEdN6RohxNsqmi19mELVcC1Sxg3i3DBcwfB5sNotbQHOmgrqyC2OdEBKwECOeNou7kXbnErKwEA9ahMWkXsAyhLqzEdN6jdNcNotnVCEafBVlg3EqhrcmhHNxNoNnTnOPfCW0ECNnkXbngLqyfCWeC01airqzEdN6NpEmf2ZlYLqyfCWeNs19",
		["Classic Preset"] = "[acid_preset]>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",
		["Meta Preset"] = "[acid_preset]>jdOmiCWtg3NnTnOSfCStf2K0NnbnELK0DXN6jdOxfB1uiMSkWMAof2qzEdN6NpEmf2ZlYLqyfCWeNnbngK9xfB1uiK9JiBSwfB5sNot2RHbnhq9xfB1uiK9JiBSwfB5sNot2RHbnErKwEA9ahMWkWMAof2qzEdN6jdNcNotnXrq0iLAdNs0xNrEdEBAeiLKzEK9JiBSwfB5sNotnY2ErNnbnjBK3C2KpEK9MgL9nDBbnToFxNsqmi19mELVcC0ixg2OmgHN6RHbnjBK3C21aEK9MgL9nDBbnTnOJfCSmDrcqEHNxNrAzDBOxEBWkXsAyhLqzEdN6iMO1EXbnDr9pjA95DCikW2caDrKxNourDBceEXbngLqyfCWeC0ixg2OmgHN6NpEmf2ZlYLqyfCWeNnbngK9xfB1uiK9MgL9nDBbnToDbQHO5DCikDBWpRA9PiB1bfB5sNot4QHOdC2cugBq0C0ixg2OmgHN6SoFxNsqmi19yg2WkXsAyhLqzEdN6NpSqgsWqhnNxNrEmf2Akg3G0C0ixg2OmgHN6j30xNsqmi19yg2WkELAsC0u1gCGugrhnTn01RHbnEsOqECS0DB5pC0ixg2OmgHN6Np9rEnNxNr1mgsAmgK95DnN6NpWuh2KngLApNnbnEMSkg25kh2maiK9MgL9nDBbnTnOJfCSmDrcqEHNxNrcugBq0h19PiB1bfB5sNotnWrKwEXGRfB1uiMRnQHOxDsqkgB9pEA9MgL9nDBbnTnOJfCSmDrcqEHNxNsOkgLqyfCWkXsAyhLqzEdN6SoFxNsqmi19mELWkYLAsfCWGVXN6RHbnErKwEA9ahMWkXsAyhLqzEdN6jdNcNotnXrq0iLAdNs0xNrAzDBOxEBWkZ3WmgrWugrhnTsWdiBZxNrEdEBAeiLKzEK9PiB1bfB5sNotnY2ErNnbnjBK3C2Omh2AkZ3WmgrWugrhnTnOGiHGZDCOsECVnQHOph19agq9efL90C0u1gCGugrhnTnOYi2q0D2lnQHO5DCikDBWpC1S0DB5pfB5sNot5QHOxDsqkgB9pEA9PiB1bfB5sNotnY3Gbg3SuiLZnQHO5DCikDBWpRA9YiLKzELqzEdN6TXbnjBK3C21aEK9pEBikW2caDrKxNotbQHO5DCikgB9pC1S0DB5pfB5sNotnV2AziLAdNnbngK9xfB1uiK9YiLKzELqzEdN6SoFxNsqmi19yg2WkELAsC1S0DB5pfB5sNotySeVxNsOkgLqyfCWkZ3WmgrWugrhnToDbQHOng2W5C3qmi19YiLKzELqzEdN6iMO1EXbnh2KrEBmqDBVnTsy9QHO5DCikDBWpRA9Ihr91D2mugriGfCNnToJdQHOrhrAqh3WmgrWkZ3WmgrWugrhnTnOUErDnQHO5DCikgB9pC0Sdg3AofLqzE0KuhnN6NpSqgsWqhnNxNrWeC29zC3Stg3WkZ3WmgrWugrhnTnOYi2q0D2lnQHO5DCikgB9pC2WqE19Ihr91D2mugriGfCNnTn01RHbngLO5C21aELAkZ3WmgrWugrhnTnOUhMGah2q0EXNxNrOaEMqkjBK3C0Sdg3AofLqzE0KuhnN6iMO1EXbnEB5mDrcqEK9REBiuiJKGNou0hsAqQHOqgrKngLApC01airqzEdN6iMO1EXbngK9xfB1uiK9Ihr91D2mugriGfCNnToDbQHO5DCikDrKeEA9Sg3EugrhnTnOGiHGZDCOsECVnQHOyDBqzNou0hsAqQHO5DCikDBWpC01airqzEdN6SdbnErKwEA9ahMWkV3OaiBStfB5sVBqdNou7NoJnTnOPfCW0ECNnkXbnjBK3C2KpEIKkYB92fB5sNot3QHOrhrAqh3WmgrWkV3OaiBStfB5sVBqdNotnY2ErNnbnjBK3C21aEK9Sg3EugrhnTnOIEB50ECNnQHOph19agq9efL90C0Sdg3AofLqzE0KuhnN6NqS3fCWofHNxNsqmi19yg2WkELAsC01airqzEdN6QYD4QHOxDsqkgB9pEA9Ihr91D2mugriGfCNnTnOUhMGah2q0EXNxNrOaEMqkjBK3C01airqzEdN6iMO1EXbnErKwEA9ahMWkZ3WmgrWugrhnTsxnRXN6NpuuiMWqhnO9QHOxfB1uiMSkYB92fB5sNotnWrKwEXGRfB1uiMRnQHOxC2cugBq0C01airqzEdN6SoFxNr1aELZnTnOHiBqxELAdNnbnhq9xfB1uiK9Sg3EugrhnToDbQHOxfB1uiMSkZ3WmgrWugrhnTnOLDByqNJcugBq0hdNxNsqmi19mELVcC0cqE2q0VZJnToFxNrcugBq0h19Ihr91D2mugriGfCNnTnOLDByqNJcugBq0hdNxNsqmi19yg2WkYLAsfCWGVXN6NpSqgsWqhnNxNrcnjA9yg2WqC1Sxg3i3DBcwfB5sNotnY3Gbg3SuiLZnQHO5DCikgB9pC2WqE19REBiuiJKGNotdSXbnjBK3C2KpEK9Ihr91D2mugriGfCNnToJdQHOng2W5C3qmi19REBiuiJKGNou0hsAqQHO5DCikDrKeEA9MgL9nDBbnTnOGiHGZDCOsECVnQHOxfB1uiMSkYLAsfCWGVXN6NpEmf2ZlYLqyfCWeNnbngK9xfB1uiK9REBiuiJKGNot2RHbnEB5mDrcqEK9YgL93i2Kxf2qzEdN6iMO1EXbnhq9xfB1uiK9REBiuiJKGNot2RHbnjBK3C2Omh2AkV3OaiBStfB5sVBqdNotnVCVlALKdE2A0NnbnErKwEA9ahMWkYLAsfCWGVXN6jdNcNotnXrq0iLAdNs0xNsqmi19nDCSqC1Sxg3i3DBcwfB5sNotnVCVlALKdE2A0NnbnEsOqECS0DB5pC0cqE2q0VZJnTnOUErDnQHOdC2cugBq0C0Sdg3AofLqzE0KuhnN6SoFxNrWeC29zC3Stg3WkYLAsfCWGVXN6NpWuh2KngLApNnbngK9xfB1uiK9PiB1bfB5sNot2RHbngLO5C21aELAkYLAsfCWGVXN6NpWuh2KngLApNnbnDr9pjA95DCikXsAyhLqzEdN6iMO1EXbnDr9pjA95DCikZ2cai3imgLyugrhnTsWdiBZxNrWeC29zC3Stg3WkWMAof2qzEdN6NqS3fCWofHNxNrcugBq0h19YgL93i2Kxf2qzEdN6NpEmf2ZlYLqyfCWeNnbngK9xfB1uiK9YgL93i2Kxf2qzEdN6SoFxNsqmi19mELWkXsAyhLqzEdN6THbnhq9xfB1uiK9YgL93i2Kxf2qzEdN6SoFxNrcnjA9yg2WqC0W1D2yugrhnTnOUhMGah2q0EXNxNrEmf2Akg3G0C1Sxg3i3DBcwfB5sNou7NoJnTnOPfCW0ECNnkXbnjBK3C2Omh2AkXsAyhLqzEdN6NpK0NKWmhriqiHNxNrEdEBAeiLKzEK9YgL93i2Kxf2qzEdN6Np9rEnNxNsqmi19yg2WkELAsC1Sxg3i3DBcwfB5sNotySolxNrWeC29zC3Stg3WkZ2cai3imgLyugrhnTnOYi2q0D2lnQHO5DCikgB9pC1Sxg3i3DBcwfB5sNotnV2AziLAdNnbnDB5ugA9nhrAmf2AdhdN6j30xNsqmi19mELVcC1Sxg3i3DBcwfB5sNot4QHO5DCikDBWpC1Sxg3i3DBcwfB5sNot4QHOqgrKngLApC0Sdg3AofLqzE0KuhnN6iMO1EXbnEB5mDrcqEK9JiBSwfB5sNou0hsAqQHOog25pfCWug24nTnOREBiuiHGGVXNxNsqmi19nDCSqC0W1D2yugrhnTnOGiHGZDCOsECVnQHO0i2Amf3RnTsy9QHO5DCikDBWpC0W1D2yugrhnTopxNrcnjA9yg2WqC01airqzEdN6Np9bhL9efCWqNnbnjBK3C2KpEIKkWMAof2qzEdN6TXbnEMSkg25kh2maiK9Sg3EugrhnTnOUhMGah2q0EXNxNsqmi19yg2WkWMAof2qzEdN6NpSqgsWqhnNxNrEdEBAeiLKzEK9Sg3EugrhnTnOUErDnQHO5DCikgB9pC2WqE19JiBSwfB5sNotySYDxNrEmf2Akg3G0C01airqzEdN6jdNcNotnXrq0iLAdNs0xNrOaEMqkjBK3C0W1D2yugrhnTsWdiBA9QHOzDB1qNotnYBqeiLAdNs0=",
		["Random Based Preset"] = "[acid_preset]>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"
	}
	slot1 = db.acid_tech_presets or {}
	slot2 = {}

	if not db.acid_tech_presets then
		for slot6, slot7 in pairs(slot0) do
			slot1[slot6] = slot7
		end
	end

	uv0.currently_using = db.acid_tech_preset
	slot4 = 61440
	slot5 = 62839

	function uv0.get_presets()
		slot0 = {}

		for slot4, slot5 in pairs(uv0) do
			slot0[#slot0 + 1] = slot4
		end

		table.sort(slot0)

		uv1 = slot0

		return #slot0 == 0 and {
			"B0B0B0FFNothing there. Create preset or import it."
		} or function ()
			slot0 = {}

			for slot4 = 1, #uv0 do
				if uv0[slot4]:len() > 25 then
					slot5 = slot5:sub(0, 20) .. "..."
				end

				slot0[slot4] = uv0[slot4] == uv1.currently_using and slot5 .. "7BCAFFFF - Active" or slot5
			end

			return slot0
		end()
	end

	function uv0.list_callback(slot0)
		return function (slot0)
			if uv0[math.min(#uv0, slot0:get())] then
				uv1:set(slot2)
			else
				uv1:set("")
			end
		end
	end

	function slot6(slot0, slot1)
		slot2 = {
			name = slot0,
			author = uv0.username,
			data = {}
		}

		for slot6, slot7 in pairs(slot1) do
			if not slot6:find("preset") then
				slot2.data[slot6] = slot7:get()
			end
		end

		return uv1.stringify(slot2)
	end

	function uv0.save_preset(slot0, slot1, slot2)
		return function (slot0)
			if uv0:get():len() == 0 then
				return uv1:push({
					uv2.white,
					"Enter valid preset name."
				})
			end

			uv3[slot1] = "[acid_preset]>" .. uv4:cipher(uv5.encode(uv6(slot1, uv7)), 5) .. "<[acid_preset]"

			uv8:update(uv9.get_presets())
			uv8:set(#uv10)
			cvar.play:call("ambient\\tones\\elev1")
			uv11()
		end
	end

	slot7 = {
		main = true,
		condition = true,
		safehead = true,
		anim_breakers = true,
		tweaks = true,
		manual_yb = true,
		freestand = true
	}

	function uv0.load_preset(slot0, slot1, slot2)
		uv0.latest_preset_data = {}

		pcall(function ()
			if uv0:get():len() == 0 then
				return
			end

			if not uv1[slot0] then
				return
			end

			if not slot1:find("acid_preset") then
				return
			end

			slot3, slot4 = slot1:sub(14, -1):find("acid_preset")

			if slot3 and slot4 then
				slot2 = slot2:sub(0, slot3 - 3)
			end

			if not uv2:decipher(slot2, 5) then
				return
			end

			if not uv3.decode(slot3) then
				return
			end

			if not uv4.parse(slot4) then
				return
			end

			uv5.latest_preset_data = slot5.data

			uv6()
		end)

		return function ()
			uv0.latest_preset_data = {}

			if uv1:get():len() == 0 then
				return uv2:push({
					uv3.white,
					"Enter valid preset name."
				})
			end

			if not uv4[slot0] then
				return uv2:push({
					uv3.white,
					"Failed to find preset."
				})
			end

			if not slot1:find("acid_preset") then
				return
			end

			slot3, slot4 = slot1:sub(14, -1):find("acid_preset")

			if slot3 and slot4 then
				slot2 = slot2:sub(0, slot3 - 3)
			end

			if not uv5:decipher(slot2, 5) then
				return
			end

			if not uv6.decode(slot3) then
				return
			end

			if not uv7.parse(slot4) then
				return
			end

			uv0.latest_preset_data = slot5.data
			slot6 = 0
			slot7 = "Preset was imported, but following entries wasn't found:\n"

			for slot11, slot12 in pairs(uv8) do
				if not slot11:find("preset") and not uv9[slot11] then
					if slot5.data[slot11] ~= nil then
						slot12:set(slot5.data[slot11])
					else
						slot6 = slot6 + 1
						slot7 = slot7 .. slot11 .. "\n"
					end
				end
			end

			if slot6 > 0 then
				-- Nothing
			else
				cvar.play:call("ambient\\tones\\elev1")

				if slot6 == 0 then
					if slot5.author == uv10.username then
						uv2:push({
							uv3.white,
							"Preset was imported successfully."
						})
					else
						uv2:push({
							uv3.white,
							"Preset by " .. slot5.author .. " was imported successfully."
						})
					end
				end
			end

			uv0.currently_using = slot0

			uv11:update(uv0.get_presets())
		end
	end

	function uv0.delete_preset(slot0, slot1)
		return function ()
			if uv0:get():len() == 0 then
				return uv1:push({
					uv2.white,
					"Enter valid preset name."
				})
			end

			if not uv3[slot0] then
				return uv1:push({
					uv2.white,
					"Failed to find preset."
				})
			end

			if uv4.currently_using == slot0 then
				uv4.currently_using = -1
			end

			uv3[slot0] = nil

			uv5:update(uv4.get_presets())
			uv4.list_callback(uv0)(uv5)
			uv6()
		end
	end

	function uv0.export_preset(slot0, slot1)
		return function ()
			if uv0:get():len() == 0 then
				return uv1:push({
					uv2.white,
					"Enter valid preset name."
				})
			end

			if not uv3[slot0] then
				return uv1:push({
					uv2.white,
					"Failed to find preset."
				})
			end

			uv4.set(uv3[slot0])
			uv1:push({
				uv2.white,
				"Preset was copied into your clipboard."
			})
			cvar.play:call("ambient\\tones\\elev1")
		end
	end

	function uv0.import_preset(slot0, slot1, slot2)
		return function ()
			if not uv0.get():find("acid_preset") then
				return
			end

			slot2, slot3 = slot0:sub(14, -1):find("acid_preset")

			if slot2 and slot3 then
				slot1 = slot1:sub(0, slot2 - 3)
			end

			if not uv1:decipher(slot1, 5) then
				return
			end

			if not uv2.decode(slot2) then
				return
			end

			if not uv3.parse(slot3) then
				return
			end

			if uv4[slot4.name] then
				uv5:push({
					uv6.white,
					"Warning! Existing preset was overrided."
				})
				cvar.play:call("resource\\warning")
			end

			uv4[slot4.name] = slot0

			uv7:update(uv8.get_presets())
			uv7:set(#uv9)
			uv10()
		end
	end

	uv8:add("destroy", "presaewtststslts", function ()
		db.acid_tech_preset = uv0.currently_using
		db.acid_tech_presets = uv1
	end)
end()

slot40 = {
	Shadows = {
		changed = false,
		new_val = 0,
		orig_val = 1,
		cvar = cvar.cl_csm_shadows
	},
	Ragdolls = {
		changed = false,
		new_val = 1,
		orig_val = 0,
		cvar = cvar.cl_disable_ragdolls
	},
	["Map Details"] = {
		changed = false,
		cvar = {
			cvar.func_break_max_pieces,
			cvar.props_break_max_pieces
		},
		orig_val = {
			15,
			50
		},
		new_val = {
			0,
			0
		}
	},
	Particles = {
		changed = false,
		new_val = 0,
		orig_val = 1,
		cvar = cvar.r_drawparticles
	},
	["Useless Anims"] = {
		changed = false,
		cvar = {
			cvar.r_eyemove,
			cvar.r_eyegloss,
			cvar.r_eyesize
		},
		orig_val = {
			1,
			1,
			0
		},
		new_val = {
			0,
			0,
			0
		}
	},
	["Dynamic Lights"] = {
		changed = false,
		new_val = 1,
		orig_val = 0,
		cvar = cvar.mat_disable_fancy_blending
	},
	Bloom = {
		changed = false,
		new_val = 1,
		orig_val = 0,
		cvar = cvar.mat_disable_bloom
	},
	["Weapon Effects"] = {
		changed = false,
		cvar = {
			cvar.muzzleflash_light,
			cvar.r_drawtracers_firstperson
		},
		orig_val = {
			1,
			1
		},
		new_val = {
			0,
			0
		}
	},
	["Static Props"] = {
		changed = false,
		new_val = 0,
		orig_val = 1,
		cvar = cvar.r_drawbrushmodels
	},
	Sprites = {
		changed = false,
		new_val = 0,
		orig_val = 1,
		cvar = cvar.r_drawsprites
	}
}
slot44 = "⚙️ Settings"
slot29 = {
	Global = {
		sometex = slot32:SetupGroup(slot38.tabs.Global_tab, "\nMISTER\nMISTER2"),
		text0 = slot32.Text(slot38.tabs.Global_tab, slot38.tabs.Main, "Welcome back, " .. function (slot0, slot1, slot2)
			for slot8 = 1, #slot2 do
				slot4 = "" .. ("%s%s"):format(slot0:lerp(slot1, slot8 / slot3):to_hex(), slot2:sub(slot8, slot8))
			end

			return slot4
		end(color(), color(245, 110, 255), slot10.username) .. "!"),
		text2 = slot32.Text(slot38.tabs.Global_tab, slot38.tabs.Main, "Last update: " .. color():as_hsv(globals.realtime, 1, 1):to_hex() .. slot10.update_date .. "\n"),
		discord1 = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Main, "FFFFFFFF Join Discord server ", "", function ()
			uv0.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/gPuDHUpd7J")
		end),
		discord = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Main, "FFFFFFFF Get role in Discord server ", [[
• Join our Discord server.
• Get your unique token by pressing this button.
• Open "Verification" channel.
• Create new ticket.
• Send your token in the opened chat.]], function ()
			network.get("https://acidtech.monster/neverlose/get_token.php?username=" .. uv0.username:gsub("'", "") .. "&beta=" .. (uv0.build == "beta" and "1" or "0"), {}, function (slot0)
				if not slot0 then
					return uv0:push({
						uv1,
						("[%s] "):format(uv2.script_name)
					}, {
						uv3.white,
						"An error occured"
					})
				end

				if slot0 == "1" then
					utils.console_exec("play error")

					return uv0:push({
						uv1,
						("[%s] "):format(uv2.script_name)
					}, {
						uv3.white,
						"Already registered."
					})
				end

				if slot0 == "3" then
					utils.console_exec("play error")

					return uv0:push({
						uv1,
						("[%s] "):format(uv2.script_name)
					}, {
						uv3.white,
						"Database error."
					})
				end

				if #slot0 < 5 then
					return uv0:push({
						uv1,
						("[%s] "):format(uv2.script_name)
					}, {
						uv3.white,
						"Your internet blocks connection to the server. Create a ticket for recieve help! Neverlose username: " .. uv2.username
					})
				end

				uv0:push({
					uv1,
					("[%s] "):format(uv2.script_name)
				}, {
					uv3.white,
					"Join our Discord server and send a message: "
				}, {
					color(255, 128, 128, 255),
					"!register " .. slot0
				})
				utils.console_exec("play ambient\\tones\\elev1")
			end)
		end),
		tedasxt0ds13 = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Recommendations, "Telegram", "", function ()
			uv0.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://t.me/KuCJloTa_News")
		end),
		tedrwrwrasxt0ds13 = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Recommendations, "YouTube", "", function ()
			uv0.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/c/TheKuCJloTa")
		end),
		tedrwrwrasxt0ds14 = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Recommendations, "NL Config", "", function ()
			uv0.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=top1btw")
		end),
		text0ds13 = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Recommendations, "AcidTech Beta", "", function ()
			uv0.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=WF0cPX")
		end)
	},
	Misc = {
		main = slot32.Switch(slot44, slot38.tabs.Misc, "B6B665FFMaster switch", false),
		clantag = {
			main = slot32.Switch(slot44, slot38.tabs.Misc, "Clan Tag", false):CreateGear(),
			tag = slot32.Combo(slot44, slot38.tabs.Misc, "Tag", {
				"AcidTech",
				"500$",
				"500$ * 0"
			}, 0, "", "Clan Tag")
		},
		trashtalk = {
			main = slot32.Switch(slot44, slot38.tabs.Misc, "Trash Talk", false):CreateGear(),
			talk = slot32.MultiCombo(slot44, slot38.tabs.Misc, "Triggers", {
				"On Kill",
				"On Death",
				"Revenge 1"
			}, {
				"On Kill"
			}, "", "Trash Talk")
		},
		synchronization = slot32.Switch(slot44, slot38.tabs.Misc, "Scoreboard Icon", false, "Allows you to recognize AcidTech users on the server you're playing on."),
		auto_unmute = slot32.Switch(slot44, slot38.tabs.Misc, "Unmute Silenced Players", false),
		aspect_ratio = {
			main = slot32.Switch(slot44, slot38.tabs.Misc, "Override Aspect Ratio", false):CreateGear(),
			ratio = slot32.SliderInt(slot44, slot38.tabs.Misc, "Ratio", math.clamp(slot35.r_aspectratio, 1), 1, 1.8, "", "Override Aspect Ratio")
		},
		view_model = {
			main = slot32.Switch(slot44, slot38.tabs.Misc, "Override Viewmodel", false):CreateGear(),
			fov = slot32.SliderInt(slot44, slot38.tabs.Misc, "Fov", slot35.fov, -100, 100, "", "Override Viewmodel"),
			offset_x = slot32.SliderInt(slot44, slot38.tabs.Misc, "Offset X", slot35.viewmodel_offset_x * 15, -150, 150, "", "Override Viewmodel"),
			offset_y = slot32.SliderInt(slot44, slot38.tabs.Misc, "Offset Y", slot35.viewmodel_offset_y * 15, -150, 150, "", "Override Viewmodel"),
			offset_z = slot32.SliderInt(slot44, slot38.tabs.Misc, "Offset Z", slot35.viewmodel_offset_z * 15, -150, 150, "", "Override Viewmodel")
		}
	},
	AntiAim = {
		main = slot32.Switch(slot38.tabs.AntiAim_tab, slot38.tabs.AntiAim, "B6B665FFEnabled", false),
		mode = slot32.Combo(slot38.tabs.AntiAim_tab, slot38.tabs.AntiAim, "Mode", slot10.build == "beta" and {
			"Default",
			"Builder"
		} or {
			"Default",
			"Builder"
		}, 0),
		manual_yb = slot32.Combo(slot38.tabs.AntiAim_tab, slot38.tabs.AntiAim, "Manual Yaw Base", {
			"Disabled",
			"Forward",
			"Backward",
			"Right",
			"Left",
			"Freestanding"
		}, 0),
		tweaks = slot32.MultiCombo(slot38.tabs.AntiAim_tab, slot38.tabs.AntiAim, "Tweaks", {
			"Disable on Warmup",
			"Edge Yaw",
			"AA on Use",
			"Anti-Bruteforce",
			"Static Manuals",
			"Fast Ladder"
		}, {}),
		anim_breakers = slot32.MultiCombo(slot38.tabs.AntiAim_tab, slot38.tabs.AntiAim, "Anim. Breakers", {
			"Follow Direction",
			"No Jumping Anim.",
			"Zero Pitch on Land"
		}, {}),
		safehead = slot32.MultiCombo(slot38.tabs.AntiAim_tab, slot38.tabs.AntiAim, "Safe Head", {
			"Standing",
			"Slowwalking",
			"Ducking",
			"Jumping",
			"Crouching Air",
			"Air Knife",
			"Air Zeus"
		}, {}),
		condition = slot32.Combo(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Condition", {
			"Global",
			"Standing",
			"Moving",
			"Slowwalking",
			"Ducking",
			"Jumping",
			"Crouching Air",
			"Legit AA",
			"Fakelagging"
		}, 0),
		preset_list = slot32.List(slot38.tabs.AntiAim_tab, slot38.tabs.Presets, "\nb3b300ffPresets", slot39.get_presets()),
		preset_name = slot32.TextBox(slot38.tabs.AntiAim_tab, slot38.tabs.Presets, "Name", 0, ""),
		preset_save = slot32.Button(slot38.tabs.AntiAim_tab, slot38.tabs.Presets, " " .. slot36 .. slot28.get_icon("floppy-disk") .. "FFFFFFFF  Save ", ""),
		preset_load = slot32.Button(slot38.tabs.AntiAim_tab, slot38.tabs.Presets, " " .. slot36 .. slot28.get_icon("file-arrow-up") .. "FFFFFFFF  Load ", ""),
		preset_delete = slot32.Button(slot38.tabs.AntiAim_tab, slot38.tabs.Presets, " " .. slot36 .. slot28.get_icon("trash-can") .. "FFFFFFFF  Delete ", ""),
		preset_export = slot32.Button(slot38.tabs.AntiAim_tab, slot38.tabs.Presets, " " .. slot36 .. slot28.get_icon("file-export") .. "FFFFFFFF  Export ", ""),
		preset_import = slot32.Button(slot38.tabs.AntiAim_tab, slot38.tabs.Presets, " " .. slot36 .. slot28.get_icon("file-import") .. "FFFFFFFF  Import ", "")
	},
	Visuals = {
		main = slot32.Switch(slot44, slot38.tabs.Widgets, "B6B665FFMaster switch", false),
		velocity_warning = {
			main = slot32.Switch(slot44, slot38.tabs.Widgets, "Windows", false):CreateGear(),
			items = slot32.MultiCombo(slot44, slot38.tabs.Widgets, "Items", {
				"Watermark",
				"Keybinds",
				"Spectators",
				"Slowdown Indicator"
			}, {
				"Watermark",
				"Keybinds"
			}, "", "Windows"),
			elements = slot32.MultiCombo(slot44, slot38.tabs.Widgets, "Display", {
				"Username",
				"Latency",
				"Time",
				"FPS",
				"Server Framerate"
			}, {
				"Username",
				"Latency",
				"Time"
			}, "", "Windows"),
			custom_name = slot32.TextBox(slot44, slot38.tabs.Widgets, "Custom Name", 0, "", "", "Windows"),
			accent = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Accent", color(35, 185, 255, 255), "", "Windows"),
			rounding = slot32.SliderInt(slot44, slot38.tabs.Widgets, "Rounding", 5, 0, 8, "", "Windows")
		},
		indicators = {
			main = slot32.Switch(slot44, slot38.tabs.Widgets, "Crosshair Indicator", false):CreateGear(),
			add_info = slot32.MultiCombo(slot44, slot38.tabs.Widgets, "Features", {
				"Promotion",
				"Additional Info",
				"Current Damage"
			}, {
				"Promotion",
				"Additional Info"
			}, "", "Crosshair Indicator"),
			binds = slot32.MultiCombo(slot44, slot38.tabs.Widgets, "Display", {
				"Player State",
				"Double Tap",
				"Hide Shots",
				"Body Aim",
				"Force Safe",
				"Freestanding",
				"Fake Duck",
				"Min. Damage"
			}, {
				"Player State",
				"Double Tap",
				"Hide Shots",
				"Body Aim",
				"Force Safe",
				"Freestanding",
				"Fake Duck",
				"Min. Damage"
			}, "", "Crosshair Indicator"),
			color2 = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Text Color", slot17.white, "", "Crosshair Indicator"),
			animation_speed = slot32.SliderInt(slot44, slot38.tabs.Widgets, "Anim. Speed", 100, 1, 200, "%", "Crosshair Indicator"),
			colorushka = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "First Color", color(35, 180, 255), "", "Crosshair Indicator"),
			color1 = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Second Color", color(245, 110, 255), "", "Crosshair Indicator")
		},
		manual_strelki = {
			main = slot32.Switch(slot44, slot38.tabs.Widgets, "Manual Anti-Aim Arrows", false):CreateGear(),
			color = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Color", color(99, 125, 186, 255), "", "Manual Anti-Aim Arrows")
		},
		custom_scope = {
			main = slot32.Switch(slot44, slot38.tabs.Widgets, "Override Scope Overlay", false):CreateGear(),
			style = slot32.Combo(slot44, slot38.tabs.Widgets, "Style", {
				"Classic",
				"T",
				"X"
			}, 0, "", "Override Scope Overlay"),
			stype = slot32.Combo(slot44, slot38.tabs.Widgets, "Colors", {
				"Simple",
				"Gradient"
			}, 0, "", "Override Scope Overlay"),
			color = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Color  ", slot17.white, "", "Override Scope Overlay"),
			color1 = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "First Color", slot17.white, "", "Override Scope Overlay"),
			color2 = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Second Color", slot17.white, "", "Override Scope Overlay"),
			add_anim = slot32.Switch(slot44, slot38.tabs.Widgets, "Inaccuracy", false, "", "Override Scope Overlay"),
			size = slot32.SliderInt(slot44, slot38.tabs.Widgets, "Line Size", 50, 1, 250, "", "Override Scope Overlay"),
			gap = slot32.SliderInt(slot44, slot38.tabs.Widgets, "Line Gap", 18, -100, 100, "", "Override Scope Overlay")
		},
		log_aimbot = {
			main = slot32.Switch(slot44, slot38.tabs.Widgets, "On-Screen Shot Logs", false):CreateGear(),
			preview = slot32.Switch(slot44, slot38.tabs.Widgets, "Preview", false, "", "On-Screen Shot Logs"),
			hit = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Hit Color", color(151, 200, 60, 255), "", "On-Screen Shot Logs"),
			spread = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Spread Color", color(255, 200, 0, 255), "", "On-Screen Shot Logs"),
			miss = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Miss Color", color(255, 0, 0, 255), "", "On-Screen Shot Logs"),
			unregistered = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Unregistered Color", color(100, 100, 255, 255), "", "On-Screen Shot Logs"),
			emoji = slot32.Switch(slot44, slot38.tabs.Widgets, "Emoji", true, "Not funny at all. That's mr. unfunny moment.", "On-Screen Shot Logs"),
			shadow = slot32.Switch(slot44, slot38.tabs.Widgets, "Shadow", true, "", "On-Screen Shot Logs")
		},
		hit_marker = {
			main = slot32.Switch(slot44, slot38.tabs.Widgets, "On-Screen Hit Marker", false):CreateGear(),
			damage_marker = slot32.Switch(slot44, slot38.tabs.Widgets, "Damage Marker", false, "", "On-Screen Hit Marker"),
			color = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Hit color  ", slot17.white, "", "On-Screen Hit Marker"),
			color1 = slot32.ColorEdit(slot44, slot38.tabs.Widgets, "Lethal color  ", slot17.white, "", "On-Screen Hit Marker")
		}
	},
	Ragebot = {
		main = slot32.Switch(slot44, slot38.tabs.Ragebot, "B6B665FFMaster switch", false),
		adv_logs = {
			main = slot32.Switch(slot44, slot38.tabs.Ragebot, "Log Aimbot Shots", false):CreateGear(),
			states = slot32.MultiCombo(slot44, slot38.tabs.Ragebot, "Output", {
				"Event",
				"Console"
			}, {
				"Event",
				"Console"
			}, "", "Log Aimbot Shots")
		},
		weapons_disharge = {
			main = slot32.Switch(slot44, slot38.tabs.Ragebot, "Automatic DT Release", false, "Automatically teleports you while in the air if you're hittable by an enemy."):CreateGear(),
			weapons = slot32.MultiCombo(slot44, slot38.tabs.Ragebot, "Weapons", {
				"Auto-Sniper",
				"Scout",
				"AWP",
				"Pistols",
				"Taser",
				"Knife"
			}, {}, "", "Automatic DT Release")
		},
		dt_fakelag = slot32.Switch(slot44, slot38.tabs.Ragebot, "Force Defensive in Air", false),
		roll_resolver = {
			main = slot32.Switch(slot44, slot38.tabs.Ragebot, "Override Roll Axis", false):CreateGear(),
			delta = slot32.SliderInt(slot44, slot38.tabs.Ragebot, "Delta", 47, -90, 90, "", "Override Roll Axis")
		},
		hitchance = {
			main = slot32.Switch(slot44, slot38.tabs.Ragebot, "Custom Hitchance", false):CreateGear(),
			mode = slot32.MultiCombo(slot44, slot38.tabs.Ragebot, "Mode ", {
				"No Scope",
				"In Air"
			}, {}, "", "Custom Hitchance"),
			distance = slot32.SliderInt(slot44, slot38.tabs.Ragebot, "Distance", 50, 30, 150, "", "Custom Hitchance"),
			noscope = slot32.SliderInt(slot44, slot38.tabs.Ragebot, "No Scope", 50, 0, 100, "", "Custom Hitchance"),
			air = slot32.SliderInt(slot44, slot38.tabs.Ragebot, "In Air", 50, 0, 100, "", "Custom Hitchance")
		}
	},
	Modifications = {
		main = slot32.Switch(slot44, slot38.tabs.Modifications, "B6B665FFMaster switch", false),
		simple_chat = {
			main = slot32.Switch(slot44, slot38.tabs.Modifications, "Simple Chat", false):CreateGear(),
			color1 = slot32.ColorEdit(slot44, slot38.tabs.Modifications, "CT Color", color(160, 200, 255, 255), "", "Simple Chat"),
			color2 = slot32.ColorEdit(slot44, slot38.tabs.Modifications, "T Color", color(255, 225, 150, 255), "", "Simple Chat"),
			color3 = slot32.ColorEdit(slot44, slot38.tabs.Modifications, "Spec. Color", color(), "", "Simple Chat"),
			font_height = slot32.SliderInt(slot44, slot38.tabs.Modifications, "Font Scale", 18, 10, 28, "", "Simple Chat")
		},
		grenade_radius = {
			main = slot32.Switch(slot44, slot38.tabs.Modifications, "Grenade Radius", false):CreateGear(),
			options = slot32.MultiCombo(slot44, slot38.tabs.Modifications, "Grenades", {
				"Fire",
				"Smoke"
			}, {
				"Fire",
				"Smoke"
			}, "", "Grenade Radius"),
			fire_color = slot32.ColorEdit(slot44, slot38.tabs.Modifications, "Enemy Fire Color", color(245, 90, 90, 255), "", "Grenade Radius"),
			fire_color1 = slot32.ColorEdit(slot44, slot38.tabs.Modifications, "Friendly Fire Color", color(130, 245, 90, 50), "", "Grenade Radius"),
			smoke_color = slot32.ColorEdit(slot44, slot38.tabs.Modifications, "Smoke Color", color(130, 135, 255, 255), "", "Grenade Radius")
		},
		console_color = {
			main = slot32.Switch(slot44, slot38.tabs.Modifications, "Console Modulation", false):CreateGear(),
			color = slot32.ColorEdit(slot44, slot38.tabs.Modifications, "Color", color(47, 47, 60, 222), "", "Console Modulation")
		},
		round_warning = slot32.Switch(slot44, slot38.tabs.Modifications, "Taskbar Notify on Round Start", false),
		mega_optimized = {
			main = slot32.Switch(slot44, slot38.tabs.Modifications, "Boost Framerate", false):CreateGear(),
			options = slot32.MultiCombo(slot44, slot38.tabs.Modifications, "Removals", {
				"Teammates",
				"Shadows",
				"Ragdolls",
				"Map Details",
				"Particles",
				"Useless Anims",
				"Dynamic Lights",
				"Bloom",
				"Weapon Effects",
				"Static Props",
				"Sprites"
			}, {}, "", "Boost Framerate")
		}
	},
	Configs = {
		export_cfg = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Configs, "Export", ""),
		import_cfg = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Configs, "Import", ""),
		share_cfg = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Configs, " " .. slot36 .. slot28.get_icon("file-export") .. "FFFFFFFF  Export ", ""),
		redeem_cfg = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Configs, " " .. slot36 .. slot28.get_icon("file-import") .. "FFFFFFFF  Import ", ""),
		def_cfg = slot32.Button(slot38.tabs.Global_tab, slot38.tabs.Configs, " " .. slot36 .. slot28.get_icon("user-tie") .. "FFFFFFFF  Default ", "")
	}
}

if slot10.build == "beta" then
	slot29.Ragebot.lol = slot32.Switch(slot44, slot38.tabs.Ragebot, "FFFFFF33Nothing", false)
	slot29.Modifications.beta_options = {
		main = slot32.Switch(slot44, slot38.tabs.Modifications, "FFCF00FFBeta Options", false):CreateGear(),
		options = slot32.MultiCombo(slot44, slot38.tabs.Modifications, "Select", {
			"Ragdoll Anim.",
			"Warmup on Start",
			"Extra Lean",
			"Frogwalk",
			"FLY HACK"
		}, {}, "", "FFCF00FFBeta Options")
	}
end

slot29.Ragebot.main:Set(true)
slot29.Ragebot.main:SetVisible(false)
slot29.Visuals.main:Set(true)
slot29.Visuals.main:SetVisible(false)
slot29.Misc.main:Set(true)
slot29.Misc.main:SetVisible(false)
slot29.Configs.export_cfg:visibility(false)
slot29.Configs.import_cfg:visibility(false)
slot29.Configs.share_cfg:visibility(false)
slot29.Configs.redeem_cfg:visibility(false)
slot29.Configs.export_cfg:visibility(not slot10.can_be_connected_to_exscord)
slot29.Configs.import_cfg:visibility(not slot10.can_be_connected_to_exscord)
slot29.Configs.share_cfg:visibility(slot10.can_be_connected_to_exscord)
slot29.Configs.redeem_cfg:visibility(slot10.can_be_connected_to_exscord)

slot45 = slot39.list_callback(slot29.AntiAim.preset_name)

slot29.AntiAim.preset_list:RegisterCallback(slot45)
slot45(slot29.AntiAim.preset_list)
slot29.AntiAim.preset_save:RegisterCallback(slot39.save_preset(slot29.AntiAim.preset_name, slot29.AntiAim.preset_list, slot29.AntiAim))

slot46 = slot39.load_preset(slot29.AntiAim.preset_name, slot29.AntiAim.preset_list, slot29.AntiAim)

slot29.AntiAim.preset_load:RegisterCallback(function (slot0)
	slot1, slot2 = pcall(uv0, slot0)

	if not slot1 then
		return uv1:push({
			uv2.white,
			"Something went wrong!"
		})
	end
end)
slot29.AntiAim.preset_delete:set_callback(slot39.delete_preset(slot29.AntiAim.preset_name, slot29.AntiAim.preset_list, slot29.AntiAim))
slot29.AntiAim.preset_export:set_callback(slot39.export_preset(slot29.AntiAim.preset_name, slot29.AntiAim.preset_list, slot29.AntiAim))

slot52 = slot29.AntiAim

slot29.AntiAim.preset_import:set_callback(slot39.import_preset(slot29.AntiAim.preset_name, slot29.AntiAim.preset_list, slot52))

slot45 = true
slot47 = {
	"enabled_",
	"yaw_base_",
	"yaw_add_",
	"yaw_add1_",
	"yaw_mod_",
	"yaw_defensive_",
	"yaw_mod_deg_",
	"body_yaw_",
	"l_limit_",
	"r_limit_",
	"fake_opt_",
	"freestand_"
}

function slot48(slot0)
	return function (slot0)
		if type(slot0:get()) == "table" then
			return
		end

		if uv0.latest_preset_data[uv1] ~= nil and uv0.latest_preset_data[uv1] ~= slot0:get() then
			uv0.currently_using = -1

			uv2.AntiAim.preset_list:update(uv0.get_presets(uv2.AntiAim.preset_list))
		end
	end
end

for slot52 = 1, #slot34 do
	slot54 = ("##%s"):format(slot52 == 4 and "SW" or slot34[slot52]:gsub(" ", ""):sub(1, 1))

	if slot52 ~= 1 then
		slot29.AntiAim["enabled_" .. slot53] = slot32.Switch(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Enable " .. (({
			[8.0] = "Legit AA",
			[7.0] = "Crouching Air"
		})[slot52] or slot34[slot52]), false)
	end

	if slot52 ~= 8 then
		slot29.AntiAim["yaw_base_" .. slot53] = slot32.Combo(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Yaw Base" .. slot54, {
			"Local View",
			"At Target"
		}, 1):CreateGear()
		slot29.AntiAim["yaw_add_" .. slot53] = slot32.SliderInt(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Yaw Add Left" .. slot54, 0, -180, 180, "", "Yaw Base" .. slot54)
		slot29.AntiAim["yaw_add1_" .. slot53] = slot32.SliderInt(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Yaw Add Right" .. slot54, 0, -180, 180, "", "Yaw Base" .. slot54)
		slot29.AntiAim["yaw_defensive_" .. slot53] = slot32.Switch(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Hidden" .. slot54, false, "", "Yaw Base" .. slot54)
	end

	slot29.AntiAim["yaw_mod_" .. slot53] = slot32.Combo(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Yaw Modifier" .. slot54, slot45 and {
		"Disabled",
		"Center",
		"Offset",
		"Random",
		"3-Way",
		"5-Way"
	} or {
		"Disabled",
		"Center",
		"Offset",
		"Random"
	}, 0):CreateGear()
	slot29.AntiAim["yaw_mod_deg_type_" .. slot53] = slot32.Combo(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Type", {
		"Default",
		"Random",
		"Switch",
		"Anti-Brute"
	}, 0, "", "Yaw Modifier" .. slot54)
	slot29.AntiAim["mod_d_ab_add_" .. slot53] = slot32.Button(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Add Phase", "", function ()
	end, "Yaw Modifier" .. slot54)
	slot29.AntiAim["mod_d_ab_remove_" .. slot53] = slot32.Button(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Remove Phase", "", function ()
	end, "Yaw Modifier" .. slot54)

	for slot58 = 1, 5 do
		slot29.AntiAim["mod_d_ab_" .. slot58 .. slot53] = slot32.SliderInt(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Phase #" .. slot58 .. slot54, 0, -180, 180, "", "Yaw Modifier" .. slot54)
	end

	slot10.ab_phases[slot53] = 2
	slot29.AntiAim["yaw_mod_deg_" .. slot53] = slot32.SliderInt(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Modifier Offset" .. slot54, 0, -180, 180, "", "Yaw Modifier" .. slot54)
	slot29.AntiAim["yaw_mod_deg_min_" .. slot53] = slot32.SliderInt(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Minimum Offset" .. slot54, 0, -180, 180, "", "Yaw Modifier" .. slot54)
	slot29.AntiAim["yaw_mod_deg_max_" .. slot53] = slot32.SliderInt(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Maximum Offset" .. slot54, 0, -180, 180, "", "Yaw Modifier" .. slot54)
	slot29.AntiAim["body_yaw_" .. slot53] = slot32.Switch(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Body Yaw" .. slot54, false)
	slot29.AntiAim["limits_" .. slot53] = slot32.Text(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Fake LimitsFFFFFF00" .. slot54):CreateGear()
	slot29.AntiAim["l_limit_" .. slot53] = slot32.SliderInt(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Left Limit" .. slot54, 60, 0, 60, "", "Fake LimitsFFFFFF00" .. slot54)
	slot29.AntiAim["r_limit_" .. slot53] = slot32.SliderInt(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Right Limit" .. slot54, 60, 0, 60, "", "Fake LimitsFFFFFF00" .. slot54)
	slot29.AntiAim["fake_opt_" .. slot53] = slot32.MultiCombo(slot38.tabs.AntiAim_tab, slot38.tabs.Condass, "Options" .. slot54, {
		"Avoid overlap",
		"Jitter",
		"Randomize jitter"
	}, {})
	slot58 = slot38.tabs.AntiAim_tab
	slot59 = slot38.tabs.Condass
	slot29.AntiAim["freestand_" .. slot53] = slot32.Combo(slot58, slot59, "Freestanding" .. slot54, {
		"Off",
		"Default",
		"Reversed"
	}, 0)

	for slot58, slot59 in ipairs(slot47) do
		if slot29.AntiAim[slot59 .. slot53] then
			slot60 = slot48(slot59 .. slot53)

			slot29.AntiAim[slot59 .. slot53]:RegisterCallback(slot60)
			slot60(slot29.AntiAim[slot59 .. slot53])
		end
	end
end

function slot49()
	uv0.AntiAim.condition:SetVisible(uv1.antiaim and uv0.AntiAim.mode:get() == "Builder")

	for slot6, slot7 in pairs(uv2) do
		slot8 = slot7:gsub(" ", "")
		slot9 = slot1 and slot8 == uv2[uv0.AntiAim.condition:GetCombo() + 1]:gsub(" ", "") and (slot8 == "Global" or uv0.AntiAim["enabled_" .. slot8]:Get())

		if slot6 ~= 8 then
			uv0.AntiAim["yaw_base_" .. slot8]:SetVisible(slot9)
			uv0.AntiAim["yaw_add_" .. slot8]:SetVisible(slot9)
			uv0.AntiAim["yaw_add1_" .. slot8]:SetVisible(slot9)
			uv0.AntiAim["yaw_defensive_" .. slot8]:SetVisible(slot9)
		end

		slot10 = uv0.AntiAim["body_yaw_" .. slot8]:get()
		slot11 = uv0.AntiAim["yaw_mod_deg_type_" .. slot8]:get()
		slot12 = uv0.AntiAim["yaw_mod_" .. slot8]:Get() ~= 0

		uv0.AntiAim["limits_" .. slot8]:SetVisible(slot9 and slot10)
		uv0.AntiAim["body_yaw_" .. slot8]:SetVisible(slot9)
		uv0.AntiAim["fake_opt_" .. slot8]:SetVisible(slot9 and slot10)
		uv0.AntiAim["yaw_mod_" .. slot8]:SetVisible(slot9)
		uv0.AntiAim["yaw_mod_deg_" .. slot8]:SetVisible(slot9 and slot12 and slot11 == "Default")
		uv0.AntiAim["yaw_mod_deg_min_" .. slot8]:SetVisible(slot9 and slot12 and slot11 ~= "Default" and slot11 ~= "Anti-Brute")
		uv0.AntiAim["yaw_mod_deg_max_" .. slot8]:SetVisible(slot9 and slot12 and slot11 ~= "Default" and slot11 ~= "Anti-Brute")
		uv0.AntiAim["freestand_" .. slot8]:SetVisible(slot9 and slot10)
		uv0.AntiAim["l_limit_" .. slot8]:SetVisible(slot9 and slot10)
		uv0.AntiAim["r_limit_" .. slot8]:SetVisible(slot9 and slot10)

		if slot8 ~= "Global" then
			uv0.AntiAim["enabled_" .. slot8]:SetVisible(slot1 and slot8 == slot2)
		end

		slot13 = slot9 and slot12 and slot11 == "Anti-Brute"

		uv0.AntiAim["mod_d_ab_add_" .. slot8]:SetVisible(slot13)
		uv0.AntiAim["mod_d_ab_remove_" .. slot8]:SetVisible(slot13)

		for slot18 = 1, 5 do
			uv0.AntiAim["mod_d_ab_" .. slot18 .. slot8]:SetVisible(slot13 and slot18 <= uv3.ab_phases[slot8])
		end
	end
end

slot25:register_visibility(slot29.Ragebot, slot29, "ragebot")
slot25:register_callbacks(slot29.Ragebot)
slot25:register_visibility(slot29.AntiAim, slot29, "antiaim")
slot25:register_callbacks(slot29.AntiAim)
slot25:register_visibility(slot29.Visuals, slot29, "visuals")
slot25:register_callbacks(slot29.Visuals)
slot25:register_visibility(slot29.Misc, slot29, "misc")
slot25:register_callbacks(slot29.Misc)
slot25:register_visibility(slot29.Modifications, slot29, "modifications")
slot25:register_callbacks(slot29.Modifications)
slot25:add_custom_callback("antiaim", "selector", slot29.AntiAim.condition, slot49)

slot53 = "mode"

slot25:add_custom_callback("antiaim", slot53, slot29.AntiAim.mode, slot49)

for slot53 = 1, #slot34 do
	if slot34[slot53]:gsub(" ", "") ~= "Global" then
		slot25:add_custom_callback("antiaim", slot54, slot29.AntiAim["enabled_" .. slot54], slot49)
	end

	slot25:add_custom_callback("antiaim", slot54 .. "deg", slot29.AntiAim["yaw_mod_" .. slot54], slot49)
	slot25:add_custom_callback("antiaim", slot54 .. "smth", slot29.AntiAim["body_yaw_" .. slot54], slot49)
	slot25:add_custom_callback("antiaim", slot54 .. "smth1", slot29.AntiAim["yaw_mod_deg_type_" .. slot54], slot49)
	slot25:add_custom_callback("antiaim", slot54 .. "smth2", slot29.AntiAim["mod_d_ab_add_" .. slot54], function ()
		uv0.ab_phases[uv1] = math.min(5, uv0.ab_phases[uv1] + 1)

		uv2()
	end)
	slot25:add_custom_callback("antiaim", slot54 .. "smth3", slot29.AntiAim["mod_d_ab_remove_" .. slot54], function ()
		uv0.ab_phases[uv1] = math.max(2, uv0.ab_phases[uv1] - 1)

		uv2()
	end)
end

function slot50()
	slot1 = uv0.Visuals.indicators.main:Get()
	slot2 = uv1.visuals and slot1

	slot0.add_info:SetVisible(slot2)
	slot0.color1:SetVisible(slot2)
	slot0.colorushka:SetVisible(slot2)
	slot0.binds:SetVisible(slot2 and slot0.add_info:Get(2))
	slot0.animation_speed:SetVisible(slot2 and slot0.add_info:Get(1))
	slot0.binds:SetVisible(slot2 and slot0.add_info:Get(2))
	slot0.color2:SetVisible(false)

	uv2.indicators.main = slot1
end

function slot51()
	slot0 = uv0.Visuals.custom_scope.main:get()
	slot1 = uv0.Visuals.custom_scope.stype:get() == "Gradient"

	uv0.Visuals.custom_scope.add_anim:SetVisible(slot0)
	uv0.Visuals.custom_scope.gap:SetVisible(slot0)
	uv0.Visuals.custom_scope.size:SetVisible(slot0)
	uv0.Visuals.custom_scope.stype:SetVisible(slot0)
	uv0.Visuals.custom_scope.color1:SetVisible(slot0 and slot1)
	uv0.Visuals.custom_scope.color2:SetVisible(slot0 and slot1)
	uv0.Visuals.custom_scope.color:SetVisible(slot0 and not slot1)
end

function slot52()
	uv0.Modifications.grenade_radius.fire_color:SetVisible(uv0.Modifications.grenade_radius.main:Get() and uv0.Modifications.grenade_radius.options:GetCombo(1) or false)
	uv0.Modifications.grenade_radius.fire_color1:SetVisible(slot0 and uv0.Modifications.grenade_radius.options:GetCombo(1) or false)
	uv0.Modifications.grenade_radius.smoke_color:SetVisible(slot0 and uv0.Modifications.grenade_radius.options:GetCombo(2) or false)
end

function slot53()
	slot0 = uv0.Visuals.velocity_warning.main:Get()
	slot1 = uv0.Visuals.velocity_warning.items:Get(1)

	uv0.Visuals.velocity_warning.elements:SetVisible(slot0 and slot1)
	uv0.Visuals.velocity_warning.custom_name:SetVisible(slot0 and slot1 and uv1(uv0.Visuals.velocity_warning.elements:get()).Username == true)
	uv0.Visuals.velocity_warning.accent:SetVisible(slot0 and #uv0.Visuals.velocity_warning.items:Get() ~= 0)
end

function slot54()
	slot0 = uv0.Ragebot.hitchance.main:get()

	uv0.Ragebot.hitchance.mode:SetVisible(slot0)

	slot1 = uv0.Ragebot.hitchance.mode:get(1)

	uv0.Ragebot.hitchance.distance:SetVisible(slot0 and slot1)
	uv0.Ragebot.hitchance.noscope:SetVisible(slot0 and slot1)
	uv0.Ragebot.hitchance.air:SetVisible(slot0 and uv0.Ragebot.hitchance.mode:get(2))
end

slot25:add_custom_callback("ragebot", "aklfsjl", slot29.Ragebot.hitchance.main, slot54)
slot25:add_custom_callback("ragebot", "aklfsfasfajl", slot29.Ragebot.hitchance.mode, slot54)
slot25:add_custom_callback("visuals", "GrenadeRadius", slot29.Modifications.grenade_radius.main, slot52)
slot25:add_custom_callback("visuals", "GrenadeRadius1", slot29.Modifications.grenade_radius.options, slot52)
slot25:add_custom_callback("visuals", "widgets_visibility", slot29.Visuals.velocity_warning.main, slot53)
slot25:add_custom_callback("visuals", "widgets_visibility3", slot29.Visuals.velocity_warning.elements, slot53)
slot25:add_custom_callback("visuals", "widgets_visibility1", slot29.Visuals.velocity_warning.items, slot53)
slot25:add_custom_callback("visuals", "gradient_line", slot29.Visuals.indicators.main, slot50)
slot25:add_custom_callback("visuals", "gradient_line1", slot29.Visuals.indicators.add_info, slot50)
slot25:add_custom_callback("visuals", "scope_visibility", slot29.Visuals.custom_scope.stype, slot51)
slot25:add_custom_callback("visuals", "scope_visibility1", slot29.Visuals.custom_scope.main, slot51)
slot25.main_visibility()

slot55 = new_class():struct("base")({
	last_manipulations = 0,
	split = function (slot0, slot1)
		slot2 = {}
		slot4 = 1
		slot5, slot6, slot7 = slot0:find("(.-)" .. slot1, 1)

		while slot5 do
			if slot5 ~= 1 or slot7 ~= "" then
				table.insert(slot2, slot7)
			end

			slot5, slot6, slot7 = slot0:find(slot3, slot6 + 1)
		end

		if slot4 <= #slot0 then
			table.insert(slot2, slot0:sub(slot4))
		end

		return slot2
	end,
	get_cheat_var = function (slot0, slot1)
		if type(slot1) == "boolean" then
			return slot1
		end

		if type(slot1:get()) == "userdata" then
			return ("ColorElement:%d:%d:%d:%d"):format(slot2.r, slot2.g, slot2.b, slot2.a)
		end

		if type(slot2) == "table" then
			return function ()
				for slot4 = 1, #uv0 do
					slot0 = "TableTT{" .. uv0[slot4] .. (slot4 ~= #uv0 and ", " or "")
				end

				return slot0 .. "}"
			end()
		end

		return slot2
	end,
	get_cheat_var_value = function (slot0, slot1, slot2)
		if type(slot1) == "string" then
			if slot1:find("ColorElement") then
				slot3 = slot0.split(slot1, ":")

				return color(tonumber(slot3[2]), tonumber(slot3[3]), tonumber(slot3[4]), tonumber(slot3[5]))
			end

			if slot1:find("TableTT{") then
				if slot1 == "TableTT{}" then
					return {}
				end

				return slot0.split(slot1:gsub("TableTT{", ""):gsub("}", ""), ", ")
			end
		end

		return slot1
	end
}):struct("operations")({
	export = function (slot0, slot1, slot2)
		if globals.realtime < slot0.base.last_manipulations then
			return
		end

		slot3 = {
			[slot9] = {},
			data = {
				is_anti_aim = slot1,
				author = uv1.username,
				date = common.get_date(" created %d/%m/%y at %T")
			}
		}

		for slot8, slot9 in pairs(slot1 and {
			"AntiAim"
		} or {
			"Ragebot",
			"AntiAim",
			"Visuals",
			"Misc",
			"Modifications"
		}) do
			for slot13, slot14 in pairs(uv0[slot9]) do
				if type(slot14) ~= "table" then
					slot3[slot9][slot13] = slot0.base:get_cheat_var(slot14)
				else
					slot3[slot9][slot13] = {}

					for slot18, slot19 in pairs(slot14) do
						if type(slot19) ~= "table" then
							slot3[slot9][slot13][slot18] = slot0.base:get_cheat_var(slot19)
						else
							slot3[slot9][slot13][slot18] = {}

							for slot23, slot24 in pairs(slot19) do
								if type(slot24) ~= "table" then
									slot3[slot9][slot13][slot18][slot23] = slot0.base:get_cheat_var(slot24)
								else
									slot3[slot9][slot13][slot18][slot23] = {}

									for slot28, slot29 in pairs(slot24) do
										slot3[slot9][slot13][slot18][slot23][slot28] = slot0.base:get_cheat_var(slot29)
									end
								end
							end
						end
					end
				end
			end
		end

		slot0.base.last_cfg_manipulations = globals.realtime + 0.5

		if not slot2 then
			uv5.set(uv1.script_name .. "_" .. uv2:cipher(uv3.encode(uv4.stringify(slot3)), 5))
		else
			return slot5
		end

		utils.console_exec("play ambient\\tones\\elev1")
	end,
	import = function (slot0, slot1, slot2)
		if globals.realtime < slot0.base.last_manipulations then
			return
		end

		slot3 = slot2 or uv0.get()

		assert(slot3:find(uv1.script_name))

		if uv5.parse(uv3.decode(uv4:decipher(uv2(slot3:gsub(uv1.script_name .. "_", "")), 5))).data.is_anti_aim ~= slot1 then
			if slot6.data.is_anti_aim then
				uv6:push({
					uv7,
					("[%s] "):format(uv1.script_name)
				}, {
					uv8.white,
					"You are trying to load antiaim settings. You can load it in 'AntiAim' tab."
				})
			else
				uv6:push({
					uv7,
					("[%s] "):format(uv1.script_name)
				}, {
					uv8.white,
					"You are trying to load global settings. You can load it in 'Global' tab."
				})
			end

			return
		end

		slot7 = ""

		for slot11, slot12 in pairs(slot6) do
			if slot11 ~= "data" then
				for slot16, slot17 in pairs(slot12) do
					if type(slot17) == "table" then
						for slot21, slot22 in pairs(slot17) do
							if type(slot22) == "table" then
								for slot26, slot27 in pairs(slot22) do
									if type(slot27) == "table" then
										for slot31, slot32 in pairs(slot27) do
											uv9[slot11][slot16][slot21][slot26][slot31]:set(slot0.base:get_cheat_var_value(slot32))
										end
									elseif not slot26:find("preset") then
										uv9[slot11][slot16][slot21][slot26]:set(slot0.base:get_cheat_var_value(slot27))
									end
								end
							elseif uv9[slot11][slot16] and not slot21:find("preset") and type(uv9[slot11][slot16][slot21]) ~= "boolean" then
								uv9[slot11][slot16][slot21]:set(slot0.base:get_cheat_var_value(slot22))
							end
						end
					elseif uv9[slot11][slot16] and not slot16:find("preset") then
						uv9[slot11][slot16]:set(slot0.base:get_cheat_var_value(slot17))
					end
				end
			end
		end

		slot0.last_cfg_manipulations = globals.realtime + 0.5

		return {
			{
				uv7,
				("[%s] "):format(uv1.script_name)
			},
			{
				uv8.white,
				"Successfully loaded config by "
			},
			{
				uv8.pinky,
				slot6.data.author
			},
			{
				uv8.white,
				slot6.data.date
			}
		}
	end
})

slot29.Configs.export_cfg:RegisterCallback(function ()
	uv0.operations:export(false)
end)
slot29.Configs.def_cfg:RegisterCallback(function ()
	uv0.operations:import(false, "acidtech_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", false)
	uv1:push({
		uv2,
		("[%s] "):format(uv3.script_name)
	}, {
		uv4.white,
		"Succesfully loaded default settings."
	})
	utils.console_exec("play resource\\warning")
end)
slot29.Configs.import_cfg:RegisterCallback(function ()
	slot0, slot1 = pcall(uv0.operations.import, uv0, false)

	if not slot0 then
		utils.console_exec("play error")
		uv1:push({
			uv2,
			("[%s] "):format(uv3.script_name)
		}, {
			uv4.white,
			"Failed to import script settings."
		})
	elseif slot0 and slot1 then
		uv1:push(unpack(slot1))
		utils.console_exec("play resource\\warning")
	end
end)
slot29.Configs.share_cfg:RegisterCallback(function ()
	if not uv0.operations:export(false, true) then
		return
	end

	uv1:push({
		uv2,
		("[%s] "):format(uv3.script_name)
	}, {
		uv4.white,
		"Generating config token..."
	})
	network.post("http://exscord.tech/configs_new/share_alt.php", {
		u = uv3.username,
		c = slot0,
		t = common.get_unixtime() % 53299
	}, {
		["User-Agent"] = "Valve/Steam HTTP Client 1.0 (730;Windows;tenfoot)"
	}, function (slot0)
		if #slot0 > 30 then
			uv0.set(slot0)
			utils.console_exec("play ambient\\tones\\elev1")
			uv1:push({
				uv2,
				("[%s] "):format(uv3.script_name)
			}, {
				uv4.white,
				("Your unique config code is in your clipboard! (%s)"):format(slot0)
			})
		elseif slot0 == nil then
			uv1:push({
				uv2,
				("[%s] "):format(uv3.script_name)
			}, {
				uv4.white,
				"Failed to connect to the server."
			})
		else
			uv1:push({
				uv2,
				("[%s] "):format(uv3.script_name)
			}, {
				uv4.white,
				"Unknown answer from the server: "
			}, {
				color(255, 0, 0, 255),
				slot0
			}, {
				uv4.white,
				("(%d)"):format(#slot0)
			})
		end
	end)
end)
slot29.Configs.redeem_cfg:RegisterCallback(function ()
	if #uv0.get(result) < 30 then
		uv1:push({
			uv2,
			("[%s] "):format(uv3.script_name)
		}, {
			uv4.white,
			"Wrong code."
		})
		utils.console_exec("play error")

		return
	end

	uv1:push({
		uv2,
		("[%s] "):format(uv3.script_name)
	}, {
		uv4.white,
		"Parsing config data..."
	})
	network.post("http://exscord.tech/configs_new/redeem_alt.php", {
		c = slot0,
		t = common.get_unixtime() % 53299
	}, {
		["User-Agent"] = "Valve/Steam HTTP Client 1.0 (730;Windows;tenfoot)"
	}, function (slot0)
		if #slot0 > 30 then
			slot1, slot2 = pcall(uv0.operations.import, uv0, false, slot0)

			if not slot1 then
				utils.console_exec("play error")
				uv1:push({
					uv2,
					("[%s] "):format(uv3.script_name)
				}, {
					uv4.white,
					"Failed to import script settings."
				})
			elseif slot1 and slot2 then
				uv1:push(unpack(slot2))
				utils.console_exec("play resource\\warning")
			end
		elseif slot0 == "1" then
			uv1:push({
				uv2,
				("[%s] "):format(uv3.script_name)
			}, {
				uv4.white,
				"Requested config doesn't exist."
			})
		elseif slot0 == "2" then
			uv1:push({
				uv2,
				("[%s] "):format(uv3.script_name)
			}, {
				uv4.white,
				"Something went wrong."
			})
		elseif slot0 == nil then
			uv1:push({
				uv2,
				("[%s] "):format(uv3.script_name)
			}, {
				uv4.white,
				"Failed to connect to the server."
			})
		else
			uv1:push({
				uv2,
				("[%s] "):format(uv3.script_name)
			}, {
				uv4.white,
				"Unknown answer from the server: "
			}, {
				color(255, 0, 0, 255),
				slot0
			}, {
				uv4.white,
				("(%d)"):format(#slot0)
			})
		end
	end)
end)

slot56 = math.max
slot57 = function ()
	slot0 = math.min

	return function (slot0, slot1, slot2)
		return uv0(slot1, uv1(slot0, slot2))
	end
end()
slot58 = {
	Text = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7 = ""

		if type(slot4) == "boolean" then
			slot6 = slot8
		end

		if slot5 then
			slot7 = slot7 .. "o"
		end

		if slot6 then
			slot7 = slot7 .. "c"
		end

		if slot4 == nil or slot8 == "boolean" then
			if not uv0[slot3] then
				uv0[slot3] = render.load_font("Comic Sans MS", slot3, "a")
			end

			slot4 = uv0[slot3]
		end

		render.text(slot4, slot1, slot2, slot7, slot0)
	end,
	GradientBoxFilled = function (slot0, slot1, slot2, slot3, slot4, slot5)
		render.gradient(slot0, slot1, slot2, slot3, slot4, slot5)
	end,
	Blur = function (slot0, slot1, slot2, slot3)
		render.blur(slot0, slot1, 1, slot2.a / 255, slot3 or 0)
	end,
	BoxFilled = function (slot0, slot1, slot2, slot3)
		render.rect(slot0, slot1, slot2, slot3 or 0)
	end,
	Box = function (slot0, slot1, slot2, slot3)
		render.rect_outline(slot0, slot1, slot2, 1, slot3 or 0)
	end,
	Line = function (slot0, slot1, slot2)
		render.line(slot0, slot1, slot2)
	end,
	InitFont = function (slot0, slot1, slot2)
		return render.load_font(slot0, slot1, uv0(slot2))
	end,
	CalcTextSize = function (slot0, slot1, slot2)
		if not slot2 then
			if not uv0[slot1] then
				uv0[slot1] = render.load_font("Tahoma", slot1, "a")
			end

			slot2 = uv0[slot1]
		end

		return render.measure_text(slot2, uv1(flags), slot0)
	end,
	LoadImage = function (slot0, slot1)
		return render.load_image(slot0, slot1)
	end,
	Image = function (slot0, slot1, slot2, slot3, slot4)
		render.texture(slot0, slot1, slot2, slot3, "r", slot4)
	end
}
slot59 = {}

function slot60(slot0)
	if not slot0 then
		return ""
	end

	for slot5 = 1, #slot0 do
		slot1 = "" .. slot0[slot5]
	end

	return slot1
end

function ()
	uv0 = color(162, 132, 255, 255)

	function slot0()
		if uv0.Visuals.main:get() then
			uv1 = uv0.Visuals.indicators.colorushka:get():alpha_modulate(255)
		end
	end

	uv1.Visuals.main:set_callback(slot0, true)
	uv1.Visuals.indicators.colorushka:set_callback(slot0, true)
end()

slot62 = 0

function ()
	slot0 = uv0.FindVar("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
	slot1 = uv0.FindVar("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
	slot2 = false
	slot4 = uv1.Ragebot.hitchance

	uv2:add("prediction", "custom_hc", function (slot0, slot1, slot2, slot3)
		uv0.functions.is_overriding_hc = false

		if not slot0.in_jump then
			if slot1.m_hGroundEntity then
				uv1 = uv1 + 1
			end
		else
			uv1 = 0
		end

		if not uv2.ragebot or not uv3.dt_fakelag or uv1 ~= 0 then
			return uv4()
		end

		uv5:override("Always On")
		uv6:override("Break LC")

		uv7 = true
	end)
	uv2:add("destroy", "aksdal", function ()
		if uv0 then
			uv0 = false

			uv1:override()
			uv2:override()
		end
	end)
end()

slot64 = {
	GetPlayerForUserID = function (slot0)
		return entity.get(slot0, true)
	end
}
slot65 = nil

function ()
	uv0 = {}

	while render.screen_size().x == 0 do
		slot0 = render.screen_size()
	end

	slot1 = slot0 / 2
	slot2 = {}
	slot3 = ""
	slot4 = false
	slot5 = vector()
	slot6 = false
	slot7 = false
	slot8 = false
	slot9 = 20
	slot10 = slot1.x + slot9
	slot11 = slot1.x - slot9

	ffi.cdef("        int GetAsyncKeyState(int vKey);\n    ")

	slot12 = nil
	slot13 = uv1.create("containers")

	function uv0.add(slot0, slot1, slot2)
		uv0[slot0] = {
			is_in_b = false,
			is_rmb_pressed = false,
			dragging = false,
			id = slot0,
			menu = {
				x = uv1:slider(slot0 .. "_x", 0, uv2.x, slot1.x),
				y = uv1:slider(slot0 .. "_y", 0, uv2.y, slot1.y)
			},
			position = slot1,
			size = slot2,
			max = uv2 - slot2,
			drag = vector(),
			process = function (slot0, slot1)
				if not uv0 then
					return slot0
				end

				slot2 = slot0.position
				slot3 = slot0.position + slot0.size

				if slot1 then
					render.rect_outline(slot2, slot3, color())
				end

				slot4 = slot2.x <= uv1.x and slot2.y <= uv1.y and uv1.x <= slot3.x and uv1.y <= slot3.y
				slot0.is_rmb_pressed = slot4 and uv2
				slot0.is_in_b = slot4

				if slot4 or slot0.dragging then
					uv3 = true
				end

				if (slot4 or slot0.dragging) and (uv4 == "" or uv4 == uv5) and uv6 then
					uv4 = uv5

					if not slot0.dragging then
						slot0.dragging = true
						slot0.drag = uv1 - slot2
					else
						slot0.position = uv1 - slot0.drag
					end

					if false then
						if uv7 < slot0.position.x and slot0.position.x < uv8 then
							slot0.position.x = uv9.x
						end

						if uv7 < slot0.position.x + slot0.size.x and slot5 < uv8 then
							slot0.position.x = uv9.x - slot0.size.x
						end

						if uv7 < slot0.position.x + slot0.size.x / 2 and slot7 < uv8 then
							slot0.position.x = uv9.x - slot6
						end
					end
				elseif not uv6 then
					uv4 = ""
					slot0.dragging = false
					slot0.drag = uv10(0, 0)
				end

				slot0.menu.x:set(slot0.position.x)
				slot0.menu.y:set(slot0.position.y)

				return slot0
			end
		}

		if uv0[slot0].menu.x:get() ~= slot1.x then
			uv0[slot0].position = vector(uv0[slot0].menu.x:get(), uv0[slot0].menu.y:get())
		end

		uv0[slot0].menu.x:visibility(false)
		uv0[slot0].menu.y:visibility(false)

		return uv0[slot0]
	end

	slot14 = 0

	uv3:add("draw", "containers handle", function ()
		uv0 = nil

		if false then
			slot0 = uv2
			slot1 = uv1

			if false and uv3 then
				slot2 = 1
			else
				slot2 = 0
			end

			uv1 = slot0(slot1, slot2, 0.05)

			if uv1 * uv4.get_alpha() > 0 then
				render.line(vector(uv5.screen_center.x, 0), vector(uv5.screen_center.x, uv5.screen_size.y), color(255, slot0 * 100))
			end
		end

		uv3 = false
		uv6 = uv4.get_alpha() > 0

		if uv6 then
			uv7 = uv4.get_mouse_position()
			uv8 = common.is_button_down(1)
			uv9 = ffi.C.GetAsyncKeyState(2) > 0

			if uv9 then
				uv8 = false
			end
		end
	end)
	uv3:add("prediction", "skip moment", function (slot0)
		if uv0 then
			slot0.in_attack = false
			slot0.in_attack2 = false
		end
	end)
end()
function ()
	slot0 = uv0.FindVar("Miscellaneous", "Main", "Other", "Log Events")
	slot1 = -1
	slot3, slot4 = nil
	slot5 = {
		"generic",
		"head",
		"chest",
		"stomach",
		"left arm",
		"right arm",
		"left leg",
		"right leg",
		"?"
	}

	uv4.Ragebot.adv_logs.main:RegisterCallback(function (slot0)
		uv0(slot0:get())
	end)
	uv4.Ragebot.adv_logs.states:RegisterCallback(function ()
		uv0(uv1.Ragebot.adv_logs.main:get())
	end)
	function (slot0)
		uv0.adv_logs.main = slot0

		if slot0 then
			slot1 = uv1(uv2:get())
			slot1["Spread Misses"] = false
			slot1["Damage Dealt"] = false

			uv2:override(uv3(slot1))
		else
			uv4()
		end
	end(uv4.Ragebot.adv_logs.main:Get())
	uv5:add("destroy", "advanced logs destroy", function ()
		uv0:override()
	end)

	slot7 = {
		default = "Damaged",
		taser = "Zeused",
		inferno = "Burned",
		hegrenade = "Blew up",
		knife = "Stabbed"
	}

	uv5:add("player_hurt", "advanced logs beta version", function (slot0, slot1, slot2)
		if not uv0.ragebot or not uv1.adv_logs.main then
			return uv2()
		end

		if not slot2 then
			return
		end

		slot4 = uv3.GetPlayerForUserID(slot0.attacker)

		if not uv3.GetPlayerForUserID(slot0.userid) or not slot4 or slot3 == slot4 or slot4 ~= slot1 then
			return
		end

		uv4(uv5.Ragebot.adv_logs.main:Get())

		if not uv6[slot0.weapon] then
			return
		end

		if uv5.Ragebot.adv_logs.states:get(2) then
			uv10:push2(unpack({
				{
					uv7,
					("[%s] "):format(uv8.script_name)
				},
				{
					uv9.white,
					("%s %s for %d damage (%d health remaining)"):format(slot5, slot3:get_name() or "unk", slot0.dmg_health, slot0.health)
				}
			}))
		end

		if uv5.Ragebot.adv_logs.states:get(1) then
			uv10:push3(unpack(slot6))
		end
	end)

	slot8 = 0
	slot9 = 0
	slot10 = {
		"st",
		"nd",
		"rd"
	}
	slot11 = {
		color(151, 200, 60, 255),
		color(255, 0, 0, 255),
		color(255, 200, 0, 255),
		color(255, 128, 128, 255),
		color(255, 0, 0, 255),
		color(255, 0, 0, 255),
		color(100, 100, 255, 255),
		color(100, 100, 255, 255),
		color(100, 100, 255, 255)
	}
	slot12 = uv0.FindVar("Aimbot", "Ragebot", "Safety", "Safe Points")
	slot13 = {
		death = 8,
		["lagcomp failure"] = 6,
		prediction = 4,
		["unregistered shot"] = 9,
		spread = 3,
		["player death"] = 7,
		hit = 1,
		["player jitter"] = 5,
		desync = 2
	}
	slot14 = {
		misprediction1 = "jitter correction"
	}
	slot15 = {
		["lagcomp failure"] = "miss",
		["player death"] = "unregistered",
		["unregistered shot"] = "unregistered",
		spread = "spread",
		["prediction error"] = "miss",
		correction = "miss",
		death = "unregistered",
		["jitter correction"] = "miss"
	}

	uv5:add("aim_ack", "advanced logs aimbot", function (slot0)
		if not uv0.ragebot or not uv1.adv_logs.main then
			return
		end

		if not slot0.target or slot0.target == nil then
			return
		end

		if not slot0.state then
			if slot0.hitgroup == 0 then
				return
			end

			if uv8.Ragebot.adv_logs.states:get(2) then
				uv9:push2(unpack({
					{
						uv2,
						("[%s] "):format(uv3.script_name)
					},
					{
						uv4.white,
						("Registered %d%s shot at %s's %s [hitchance: %d] [dmg: %d (%d) | history: %d]"):format(uv5 % 100 + 1, uv6[uv5 % 100 + 1] or "th", slot0.target:get_name() or "unk", uv7[slot0.hitgroup + 1] or "?", slot0.hitchance, slot0.damage, slot0.wanted_damage or 0, slot0.backtrack)
					}
				}))
			end

			if uv8.Ragebot.adv_logs.states:get(1) then
				uv9:push3(unpack(slot1))
			end

			uv5 = uv5 + 1
		else
			if not slot0.wanted_damage or slot0.wanted_damage == 0 then
				return
			end

			slot1 = uv10[slot0.state] or 2

			if uv8.Ragebot.adv_logs.states:get(2) then
				uv9:push2(unpack({
					{
						uv2,
						("[%s] "):format(uv3.script_name)
					},
					{
						uv4.white,
						("Missed %d%s shot in %s's "):format(uv12 % 100 + 1, uv6[uv12 % 100 + 1] or "th", slot0.target:get_name() or "unk")
					},
					{
						uv4.white,
						uv7[slot0.wanted_hitgroup + 1] or "?"
					},
					{
						uv4.white,
						" due to "
					},
					{
						(uv8.Visuals.log_aimbot[uv11[slot0.state]] or uv8.Visuals.log_aimbot.miss):get(),
						uv13[slot0.state] or slot0.state or "?"
					},
					{
						uv4.white,
						(" [hitchance: %d] [dmg: %d | history: %d]"):format(slot0.hitchance, slot0.wanted_damage or 0, slot0.backtrack)
					}
				}))
			end

			if uv8.Ragebot.adv_logs.states:get(1) then
				uv9:push3(unpack(slot4))
			end

			uv12 = uv12 + 1
		end
	end)
end()
function ()
	slot0 = {}
	slot1 = false

	uv0:add("net_update_end", "podkumarka", function (slot0, slot1, slot2)
		slot3 = uv0.ragebot and uv1.roll_resolver.main and slot1
		slot4 = uv1.roll_resolver.delta

		for slot8, slot9 in pairs(slot2) do
			uv2[slot9:get_index()] = nil

			if ffi.cast("uintptr_t", slot9[0]) then
				if slot11 == 0 then
					-- Nothing
				else
					ffi.cast("float*", slot11 + 71632 + 8)[0] = 0

					if not uv3 then
						slot12[0] = slot3 and slot4 or 0
						uv2[slot10] = slot3 and "resolving" or nil
					end
				end
			end
		end
	end)
	uv0:add("destroy", "podkumarka destroy", function (slot0, slot1, slot2)
		uv0 = true
		slot3 = false

		if not slot2 then
			return
		end

		for slot7, slot8 in pairs(slot2) do
			uv1[slot8:get_index()] = nil

			if ffi.cast("uintptr_t", slot8[0]) then
				if slot10 ~= 0 then
					ffi.cast("float*", slot10 + 71632 + 8)[0] = 0
				end
			end
		end
	end)
end()

slot68 = math.floor

function ()
	function slot0(slot0, slot1)
		return slot0[2] < slot1[2]
	end

	function slot1(slot0)
		slot1 = {}

		for slot5, slot6 in pairs(slot0) do
			if slot6:is_alive() then
				if slot6:is_dormant() then
					-- Nothing
				elseif slot6:get_player_weapon() then
					if slot7:get_weapon_reload() ~= -1 then
						-- Nothing
					elseif slot7:get_weapon_info() then
						if slot8.weapon_type ~= 5 and slot8.weapon_type ~= 1 then
							-- Nothing
						elseif render.world_to_screen(slot6:get_origin()) then
							slot1[#slot1 + 1] = {
								slot6,
								slot9:dist(uv0.screen_center)
							}
						end
					end
				end
			end
		end

		table.sort(slot1, uv1)

		return {
			slot1[1],
			slot1[2],
			slot1[3]
		}
	end

	slot2 = 0
	slot3 = 0
	slot4 = false
	slot5 = false

	function slot6(slot0)
		return uv0(0.5 + slot0 / globals.tickinterval)
	end

	function slot7(slot0, slot1, slot2)
		slot3 = slot0.m_vecVelocity
		slot4 = slot2:clone()
		slot4.x = slot4.x + slot3.x * globals.tickinterval * slot1
		slot4.y = slot4.y + slot3.y * globals.tickinterval * slot1

		return slot4
	end

	slot8 = uv2.FindVar("Aimbot", "Ragebot", "Main", "Double Tap")
	slot9 = rage.exploit

	uv3:add("prediction", "Discharge DT on air-peek", function (slot0, slot1, slot2, slot3)
		uv0.charge = uv1:get()
		uv2 = uv3.ragebot and uv4.weapons_disharge.main and uv0.charge == 1 and uv5:get()

		if not uv2 then
			return uv1:allow_charge(true)
		end

		if not slot2 then
			return
		end

		if not slot1:get_player_weapon() then
			return
		end

		if uv6 > 5 or #slot1.m_vecVelocity < 100 then
			return
		end

		if not slot4:get_weapon_info() then
			return
		end

		uv7 = false
		slot6 = slot4:get_weapon_index()

		for slot11, slot12 in pairs({
			slot5.weapon_type == 5 and slot6 ~= 40 and slot6 ~= 9,
			slot6 == 40,
			slot6 == 9,
			slot5.weapon_type == 1,
			slot6 == 31,
			slot5.weapon_type == 0
		}) do
			if not uv7 then
				uv7 = slot12 and uv8.Ragebot.weapons_disharge.weapons:get(slot11)
			end
		end

		if not uv7 then
			return
		end

		if not #uv9(slot3) then
			return
		end

		slot9 = slot1:get_hitbox_position(4)

		for slot14, slot15 in pairs(slot8) do
			if false then
				break
			end

			if slot15[1]:get_resource() then
				slot21, slot22 = utils.trace_bullet(slot16, slot16:get_hitbox_position(4), uv12(slot1, uv10(5, uv11(slot18 * (slot17.m_iPing <= 10 and 2 or 1.75) / 1000)), slot9))
				slot10 = slot21 and slot21 > 0 and not slot22.entity
			end
		end

		if slot10 and uv13 < globals.realtime then
			if uv14 == 3 then
				uv13 = globals.realtime + 0.5

				uv1:force_teleport()
				uv1:allow_charge(false)

				uv14 = 0
			end

			uv14 = uv14 + 1
		else
			uv1:allow_charge(true)
		end
	end)
end()
function ()
	slot0 = uv0.FindVar("Miscellaneous", "Main", "In-Game", "Clan Tag")
	slot1 = {
		0,
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		11,
		11,
		11,
		11,
		11,
		11,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22
	}
	slot2 = 0

	uv1:add("net_update_end", "tag", function ()
		if not uv0.misc or not uv1.clantag.main then
			if uv2 ~= 0 then
				common.set_clan_tag("")
			end

			uv2 = 0

			return uv3:override()
		end

		uv3:override(false)

		slot0 = 0

		if (entity.get_game_rules() and slot1.m_gamePhase == 4 and 11 or uv4[math.floor((globals.client_tick + globals.clock_offset) / math.floor(0.3 / globals.tickinterval + 0.5) % 30) + 1]) ~= uv2 then
			slot2 = ""

			common.set_clan_tag((uv1.clantag.tag == "AcidTech" and "             acidtech                " or slot3 == "500$ * 0" and "             gAmeSenSe                " or "             gamesense                "):sub(slot0 + 1, slot0 + 18))
		end

		uv2 = slot0
	end)
	uv1:add("destroy", "tag destroy", function ()
		common.set_clan_tag("")
		uv0:override()
	end)
end()

slot71 = math.min
slot72 = 0
slot73 = math.abs

function slot74(slot0)
	return uv0(57, uv1(uv2((slot0.m_flPoseParameter[11] or 0) * 120 - 60 + 0.5, 1)))
end

function ()
	slot2 = uv2.add("velocity", uv0(math.floor(uv1.screen_center.x - 108), 50), uv0(215, 50))
	slot3 = 0
	slot4 = 0

	function slot5(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7 = slot2 * 255

		if uv0.is_in_b and uv0.is_rmb_pressed and slot6 then
			uv0.position.x = uv1.screen_center.x - 108
		end

		uv2 = uv3(uv2, uv0.is_in_b and slot6 and not uv0.dragging and 1 or 0, 0.06)

		if slot7 * uv2 ~= 0 then
			render.text(1, slot4 + vector(15, 40), color(255, 255, 255, slot8), "", "Press M2 to center.")
		end

		slot9 = color(255, 75, 75, slot7)
		uv4 = uv3(uv4, slot5 and 1 or 0, 0.05)
		slot11 = vector(slot4.x + 15, slot4.y + 30)
		slot12 = slot11 + vector(185, 4)
		slot13 = slot9:lerp(slot1:lerp(slot9, uv4):alpha_modulate(slot7), slot0)

		render.shadow(slot11, slot12, slot13:alpha_modulate(slot1.a * slot2), 20, 0)
		render.rect(slot11, slot12, color(0, 0, 0, slot7))
		render.rect(slot11 + vector(1, 1), slot11 + vector(184 * slot0, 3), slot13)
		render.text(1, slot11 + vector(92, -10), color():alpha_modulate(slot7), "c", ("%s %d%%"):format(slot3, (1 - slot0) * 100))
	end

	slot6 = 0

	function slot7(slot0, slot1, slot2, slot3)
		uv0:process()

		slot4 = uv0.position

		if slot1 == 1 and slot0 == 0 then
			return
		end

		uv2(slot1, uv1.Visuals.velocity_warning.accent:get(), slot0, "Max velocity reduced by", slot4, slot2, slot3)
	end

	function slot8(slot0, slot1, slot2, ...)
		slot4 = 0

		for slot8 = 1, #{
			...
		} do
			slot9 = slot3[slot8]

			uv0(slot9[1], uv1(slot0.x + slot4, slot0.y), slot9[2], slot1, slot2)

			slot4 = slot4 + (slot9[3] or uv2.CalcTextSize(slot9[1], slot1, slot2).x)
		end
	end

	slot9 = false
	slot10 = uv7.get_alpha
	slot11 = uv7.get_mouse_position

	uv8:add("draw", "gui", function (slot0, slot1)
		slot3 = uv0() ~= 0
		uv1.menu_visible = slot3
		slot4 = uv2()
		mouse_position = uv3(uv4(slot4.x, 0, uv1.screen_size.x), uv4(slot4.y, 0, uv1.screen_size.y))
		inactive_window = slot4.x < 0 or uv1.screen_size.x < slot4.x or slot4.y < 0 or uv1.screen_size.y < slot4.y
		slot5 = uv5.visuals and uv6.Visuals.velocity_warning.main:get() and uv6.Visuals.velocity_warning.items:Get(4)
		slot7 = slot1 and slot0.m_flVelocityModifier or 1

		if slot3 and slot5 then
			slot7 = math.min(1, globals.tickcount % 200 / 150)
		end

		uv7 = uv8(uv7, slot5 and slot7 ~= 1 and 1 or 0, 0.05, 0.01)

		if uv7 ~= 0 then
			slot9 = uv7

			if slot3 and slot5 then
				slot9 = slot2
				uv7 = slot2
			end

			uv9(slot9, slot7, uv10 < 3, slot3)
		end
	end)
	uv8:add("createmove", "trash info", function (slot0, slot1)
		uv0 = uv1(slot1)
	end)
end()

slot76 = slot10.functions
slot77 = nil
slot78 = 1
slot79 = bit.band
slot80 = slot32.FindVar("Aimbot", "Anti Aim", "Misc", "Slow Walk")
slot81 = slot32.FindVar("Aimbot", "Anti Aim", "Misc", "Fake Duck")
slot82 = slot32.FindVar("Miscellaneous", "Main", "Movement", "Air Duck")

function slot77(slot0, slot1)
	slot2 = slot0.m_flDuckAmount > 0.89 and not uv0:get()
	slot3 = 1
	slot4 = uv1(slot0.m_fFlags, 1)
	slot3 = uv2.functions.on_use_aa and 8 or not slot1 and uv3.is_fakelagging and 9 or slot2 and (slot4 == 0 or uv4 < 3) and 7 or (slot4 == 0 or uv4 < 3) and (not uv5:get() or uv6 == 6) and 6 or slot2 and slot4 ~= 0 and 5 or uv7:get() and 4 or #slot0.m_vecVelocity > 2 and uv4 > 10 and 3 or uv4 > 10 and 2 or uv6
	uv6 = slot3

	return slot3
end

function ()
	slot0 = 0
	slot1 = 11
	slot2 = 5
	slot3 = 0
	slot4 = 4
	slot5 = false
	slot6 = 6
	slot7 = uv0.white
	slot8 = {}
	slot9 = render.load_font("Calibri", 18, "a")
	slot10 = uv1.screen_center
	slot11 = uv2.FindVar("Visuals", "World", "Other", "Hit Marker")
	slot12 = false
	slot13 = vector(0, 15)

	uv3:add("draw", "Hit marker", function (slot0, slot1)
		if not uv0.visuals or not uv1.hit_marker.main then
			if uv2 then
				uv2 = false

				uv3:override()
			end

			return
		end

		if not slot1 then
			return
		end

		if uv4 - globals.realtime > 0 then
			slot3 = uv5((uv6 - globals.tickcount) / 2, 6, 20) - uv5((uv6 - globals.tickcount) / 2, 0, 3)
			slot4 = color(uv7.r, uv7.g, uv7.b, uv7.a * slot2 / 1)

			uv8.Line(uv9(uv10.x - uv11 - uv12, uv10.y - uv11 - uv12), uv9(uv10.x - uv11, uv10.y - uv11), slot4, 1)
			uv8.Line(uv9(uv10.x + uv11 + uv12, uv10.y + uv11 + uv12), uv9(uv10.x + uv11, uv10.y + uv11), slot4, 1)
			uv8.Line(uv9(uv10.x + uv11 + uv12, uv10.y - uv11 - uv12), uv9(uv10.x + uv11, uv10.y - uv11), slot4, 2)
			uv8.Line(uv9(uv10.x - uv11 - uv12, uv10.y + uv11 + uv12), uv9(uv10.x - uv11, uv10.y + uv11), slot4, 2)
		end

		if uv1.hit_marker.damage_marker then
			slot3 = globals.realtime

			for slot7, slot8 in pairs(uv13) do
				if slot8.hit_pos then
					if render.world_to_screen(slot8.hit_pos) then
						render.text(uv15, slot9 - uv16, slot8.color:alpha_modulate((slot8.timer - slot3 < 2 and uv14(0, slot10) * 2 or 1) * 255), "cd", slot8.damage)
					end

					if slot8.timer < slot3 then
						uv13[slot7] = nil
					end
				end
			end
		end
	end)
	uv3:add("round_prestart", "Hit marker event 1", function (slot0, slot1)
		uv0 = {}
	end)
	uv3:add("destroy", "Hit marker event 2", function (slot0, slot1)
		uv0:override()
	end)
	uv3:add("player_hurt", "Hit marker event", function (slot0, slot1)
		if not uv0.visuals or not uv1.hit_marker.main then
			return
		end

		slot3 = uv2.GetPlayerForUserID(slot0.attacker)

		if not uv2.GetPlayerForUserID(slot0.userid) or not slot3 or slot2 == slot3 or slot3 ~= slot1 then
			return
		end

		uv3 = slot0.health <= 0
		uv4 = globals.realtime + 1
		uv5 = globals.tickcount + 20
		uv6 = uv3 and uv7.Visuals.hit_marker.color1:Get() or uv7.Visuals.hit_marker.color:Get()

		if uv1.hit_marker.damage_marker then
			uv8:override(false)

			uv9 = true
			slot4 = slot0.hitgroup
			uv10[slot2:get_index()] = {
				timer = globals.realtime + 2.5,
				damage = tostring(slot0.dmg_health),
				hit_pos = slot2:get_hitbox_position(slot4),
				color = slot4 == 1 and color(237, 28, 36) or color(240, 240)
			}
		else
			uv10 = {}

			uv8:override()

			uv9 = false
		end
	end)
end()
function ()
	slot0 = uv0.FindVar("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
	slot1 = 0

	function slot2()
		if uv0 == 1 then
			uv1:override()

			uv0 = 0
		end
	end

	uv1:add("destroy", "yazik_asembler", function ()
		uv0()
	end)

	slot3 = 0
	slot4 = uv2.screen_center
	slot5 = math.sqrt
	slot6 = math.pow

	function slot7(slot0, slot1, slot2, slot3)
		return slot2 * uv0(1 - uv1(slot0 / slot3 - 1, 2)) + slot1
	end

	slot8 = 0

	uv1:add("draw", "microsecond", function (slot0, slot1)
		uv0.functions.scope_anim = 0

		if not uv1.visuals or not uv2.custom_scope.main or not slot1 or not slot1 then
			return uv3()
		end

		if uv4 == 0 then
			uv4 = 1
		end

		uv5 = math.clamp(uv5 + globals.frametime * (slot0.m_bIsScoped and 3 or -7), 0, 1)

		if uv0.menu_visible then
			if slot3 then
				uv5 = 1
			else
				uv5 = 0
			end
		end

		uv0.functions.scope_anim = uv6(uv5, 0, 1, 1)

		if not slot3 then
			return
		end

		if slot4 == 0 then
			return
		end

		uv7:override("Remove All")

		slot5, slot6 = nil

		if uv2.custom_scope.stype == "Simple" then
			slot6 = uv8.Visuals.custom_scope.color:Get():alpha_modulate(0)
		else
			slot5 = uv8.Visuals.custom_scope.color1:get()
			slot6 = uv8.Visuals.custom_scope.color2:get():alpha_modulate(0)
		end

		slot5 = slot5:alpha_modulate(slot5.a * uv0.functions.scope_anim)
		slot6 = slot6:alpha_modulate(slot6.a * uv0.functions.scope_anim)
		slot7 = uv2.custom_scope.gap

		if uv8.Visuals.custom_scope.add_anim:Get() and slot0:get_player_weapon() then
			slot7 = math.floor(slot7 + uv9 * slot7 * 3)

			if slot0.m_hGroundEntity then
				if uv10 > 3 then
					uv9 = slot8:get_inaccuracy()
				end
			else
				uv9 = slot8:get_inaccuracy()
			end
		end

		if uv2.custom_scope.style == "X" then
			render.push_rotation(45)
		end

		slot9 = uv2.custom_scope.size * slot4

		if uv2.custom_scope.style ~= "T" then
			uv11.GradientBoxFilled(uv12(uv13.x, uv13.y - slot7), uv12(uv13.x + 1, uv13.y - slot7 - slot9), slot5, slot5, slot6, slot6)
		end

		uv11.GradientBoxFilled(uv12(uv13.x, uv13.y + slot7 + 1), uv12(uv13.x + 1, uv13.y + slot7 + slot9 + 1), slot5, slot5, slot6, slot6)
		uv11.GradientBoxFilled(uv12(uv13.x - slot7, uv13.y), uv12(uv13.x - slot7 - slot9, uv13.y + 1), slot5, slot6, slot5, slot6)
		uv11.GradientBoxFilled(uv12(uv13.x + slot7 + 1, uv13.y), uv12(uv13.x + slot7 + slot9 + 1, uv13.y + 1), slot5, slot6, slot5, slot6)

		if slot8 then
			render.pop_rotation()
		end
	end)
end()
function ()
	slot5 = "Misc"
	slot6 = "Fake Duck"
	slot1 = {
		[slot6[1]] = render.measure_text(2, "", slot6[1])
	}

	for slot5, slot6 in ipairs({
		{
			"DT",
			uv0.FindVar("Aimbot", "Ragebot", "Main", "Double Tap"),
			0
		},
		{
			"HS",
			uv0.FindVar("Aimbot", "Ragebot", "Main", "Hide Shots"),
			0
		},
		{
			"BAIM",
			uv0.FindVar("Aimbot", "Ragebot", "Safety", "Body Aim"),
			0,
			"Force"
		},
		{
			"SAFE",
			uv0.FindVar("Aimbot", "Ragebot", "Safety", "Safe Points"),
			0,
			"Force"
		},
		{
			"FS",
			uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Freestanding"),
			0
		},
		{
			"FD",
			uv0.FindVar("Aimbot", "Anti Aim", slot5, slot6),
			0
		},
		{
			"DMG",
			0,
			0
		}
	}) do
		-- Nothing
	end

	slot4 = uv2.add("damageindicator", vector(uv1.screen_center.x + 10, uv1.screen_center.y - 30), vector(28, 16))
	slot5 = uv3.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
	slot6 = 0
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot10 = 0
	slot11 = 0
	slot12 = 0
	slot13 = 0
	slot14 = 0
	slot15 = {
		"IDLE",
		"STAND",
		"RUN",
		"S.WALK",
		"CROUCH",
		"AIR",
		"AIR",
		"USE",
		"FAKELAG"
	}
	slot16 = uv4(uv1.screen_center.x, uv1.screen_center.y + 20)
	slot17 = ""
	slot18 = false
	slot19 = rage.antiaim

	uv5:add("prediction", "wapaduruduruwap 123", function (slot0, slot1, slot2)
		if not uv0.visuals or not uv1.indicators.main then
			return
		end

		uv2 = uv3[uv4(slot1, not uv5.AntiAim.enabled_Fakelagging:get())]
	end)

	function slot20(slot0, slot1, slot2, slot3, slot4, slot5)
		slot8 = nil

		for slot12 = 1, #slot5 do
			slot7 = "" .. ("%s%s"):format(slot0:lerp(slot1, slot12 / slot6):to_hex(), slot5:sub(slot12, slot12))
		end

		render.text(slot3, slot2, color(), slot4, slot7)

		return slot8
	end

	function slot21(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7 = 0
		slot8 = #slot5
		slot9 = math.ceil(slot8 / 2)
		slot10 = nil

		for slot14 = 1, slot8 do
			slot15 = slot5:sub(slot14, slot14)

			if not slot6 then
				render.text(slot3, slot2 + vector(slot7, 0), slot0:lerp(slot1, slot14 / slot8), slot4, slot15)

				slot7 = slot7 + render.measure_text(slot3, slot4, slot15).x - 1
			end

			if slot14 == slot9 then
				slot10 = {
					slot0:lerp(slot1, (slot14 - 1) / slot8),
					slot16
				}
			end
		end

		return slot10
	end

	function slot22(slot0, slot1, slot2)
		return uv0(slot0, (slot0 + (slot2 or 1)) * slot1)
	end

	slot23 = 0
	slot24 = 0
	slot25 = 0
	slot26 = 28.5
	slot28 = {
		color(),
		color()
	}
	slot29 = 9
	slot30 = render.measure_text(2, "", "ACIDTECH ")
	slot31 = render.measure_text(2, "", "DT")
	slot32 = uv1.screen_center + vector(1, 20)
	slot33 = 0
	slot34 = 0
	slot35 = ""
	slot36 = 0
	slot37 = 0
	slot38 = 0

	uv5:add("draw", "wapaduruduruwap", function (slot0, slot1)
		uv0 = uv1(uv0, uv2.visuals and uv3.indicators.main and slot1 and 1 or 0, 0.045, 0.05)

		if uv0 < 0.01 then
			return
		end

		uv4 = (uv4 + globals.frametime * uv3.indicators.animation_speed / 100) % 1

		if uv5 - uv4 > 0.9 then
			uv6 = uv6 + 1
		end

		uv5 = uv4
		slot3, slot4 = nil

		if uv6 % 4 + 1 == 1 then
			slot3 = uv4
			slot4 = 0
		elseif slot2 == 2 then
			slot3 = 1
			slot4 = uv4
		elseif slot2 == 3 then
			slot3 = 1 - uv4
			slot4 = 1
		elseif slot2 == 4 then
			slot3 = 0
			slot4 = 1 - uv4
		end

		slot5 = 0
		slot7 = uv8(not uv7.Visuals.indicators.add_info:get(1) and 15 or 35, uv9.functions.scope_anim, 3)
		slot8 = uv3.custom_scope.style == "X" and vector(0, slot7) or vector(slot7, 0)
		slot9 = slot7 / (not slot6 and 15 or 35)
		slot10 = uv10
		slot13 = true

		if uv11 > 0.01 then
			render.shadow(slot10 - vector(uv12.x / 2, 1) + slot8, slot10 + vector(uv12.x / 2, -1) + slot8, color(uv13[1].r, uv13[1].g, uv13[1].b, 190 * uv0 * uv11), 30 + color(0, 0, 0, 255):lerp(color(0, 0, 0, 0), slot3).a / 25.5, 0)
		end

		slot14 = uv0 * 255
		slot15 = uv7.Visuals.indicators.colorushka:get():alpha_modulate(slot14 * uv11)
		slot16 = uv7.Visuals.indicators.color1:get():alpha_modulate(slot14 * uv11)
		uv13 = uv14(slot15:lerp(slot16, slot3), slot16:lerp(slot15, slot4), slot10 + vector(-uv12.x / 2 - 3, slot5 * uv15 - uv12.y / 2) + slot8, 2, "", uv16, uv11 < 0.01)
		uv11 = uv1(uv11, slot6 and 1 or 0, 0.05)

		if uv11 > 0.1 then
			slot5 = slot5 + 1
		end

		slot17 = uv7.Visuals.indicators.color2:get():alpha_modulate(slot14)
		uv17 = uv1(uv17, uv7.Visuals.indicators.add_info:get(2) and 1 or 0, 0.05)

		if uv17 > 0.01 then
			if uv7.Visuals.indicators.binds:get(1) then
				if slot13 then
					uv19(uv13[1]:alpha_modulate(slot14 * uv17), uv13[2]:alpha_modulate(slot14 * uv17), slot10 + vector(-render.measure_text(2, "", uv18).x / 2 * (1 - slot9) + 13 * slot9, slot5 * uv15 - 6), 2, "", uv18)
				else
					render.text(2, slot10 + vector(0, slot5 * uv15), slot17:alpha_modulate(slot14 * uv17), "", uv18)
				end

				slot5 = slot5 + 1
			end

			slot19 = false

			for slot24, slot25 in pairs(uv20.get_binds()) do
				if slot25.name == "Minimum Damage" then
					slot19 = slot25.active

					break
				end
			end

			slot21 = slot5 * uv15

			for slot25 = 1, #uv21 do
				slot26 = uv21[slot25]
				slot27 = slot14 * slot26[3] * uv17
				slot29 = -uv22[slot26[1]].x / 2 * (1 - slot9) + 13 * slot9

				if slot26[1] == "DT" then
					slot31 = -uv23.x / 2 * (1 - slot9) + 13 * slot9

					render.text(2, slot10 + vector(slot31, slot21 - 6), color(255, 100, 100, 0.7 * slot27), "", "DT")
					render.push_clip_rect(slot10 + vector(slot31, slot21 - 6), slot10 + vector(-uv23.x / 2 + rage.exploit:get() * (uv23.x / 2 + 12) + 13 * slot9, slot21 + 6))

					if not slot13 then
						render.text(2, slot10 + vector(0, slot21 - 6), slot17:alpha_modulate(slot30 * slot27), "", "DT")
					else
						uv19(uv13[1]:alpha_modulate(slot27), uv13[2]:alpha_modulate(slot27), slot10 + vector(slot31, slot21 - 6), 2, "", "DT")
					end

					render.pop_clip_rect()
				elseif slot26[3] ~= 0 then
					if not slot13 then
						render.text(2, slot10 + vector(0, slot21), slot17:alpha_modulate(slot27), "", slot26[1])
					else
						uv19(uv13[1]:alpha_modulate(slot27), uv13[2]:alpha_modulate(slot27), slot10 + vector(slot29, slot21 - 6), 2, "", slot26[1])
					end
				end

				slot30 = 0
				slot26[3] = uv1(slot26[3], slot26[1] == "DMG" and (slot19 and (uv7.Visuals.indicators.binds:get(slot25 + 1) and 1 or 0) or 0) or slot26[1] == "BAIM" and (slot26[2]:get() == slot26[4] and (uv7.Visuals.indicators.binds:get(slot25 + 1) and 1 or 0) or 0) or slot26[4] ~= nil and (slot26[2]:get() == slot26[4] and 1 or 0) or slot26[2]:get() and (uv7.Visuals.indicators.binds:get(slot25 + 1) and 1 or 0) or 0, 0.1, 0.05)
				slot21 = slot21 + uv8(9, slot26[3])
			end
		end

		slot20 = true

		if uv7.Visuals.indicators.add_info:get(3) then
			uv24:process()

			uv26 = uv1(uv26, uv25:get(), 0.4, 0.5)
			slot22 = uv24.position

			if slot1 and slot0:get_player_weapon() and (slot23:get_weapon_info().weapon_type == 0 or slot24 == 9 or slot24 == 7 or globals.curtime < slot0.m_flNextAttack - 0.7) then
				slot20 = false
			end

			slot23 = ""

			if not slot20 then
				if uv20.get_alpha() ~= 0 then
					slot20 = true
					slot23 = "AUTO"
				else
					slot23 = uv27
				end
			else
				uv27 = slot21 == 0 and "AUTO" or tostring(math.ceil(uv26))
			end

			uv24.size = vector(17 + render.measure_text(2, "", slot23).x, 24)

			if uv13[2]:alpha_modulate(slot14 * uv28).a ~= 0 then
				render.text(2, slot22 + vector(9, 6), slot26, "", slot23)
			end

			if slot24 * 50 * uv0 * uv28 ~= 0 then
				render.rect_outline(slot22, slot22 + slot25, color():alpha_modulate(slot27), 0, 8)
			end
		end

		uv28 = uv1(uv28, slot19 and slot20 and 1 or 0, 0.125)
	end)
end()
function ()
	slot0 = nil
	slot1 = {}
	slot2 = {}
	slot6 = uv1.add("aimlog", vector(uv0.screen_center.x, uv0.screen_size.y - uv0.screen_size.y / 3) - vector(165, 0), vector(330, 120))
	slot7 = color()
	slot8 = {
		{
			data = {
				{
					slot7,
					"Hit "
				},
				{
					"hit",
					"vladislav"
				},
				{
					slot7,
					" for "
				},
				{
					"hit",
					10
				},
				{
					slot7,
					" damage"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		},
		{
			data = {
				{
					slot7,
					"Hit "
				},
				{
					"hit",
					"monster"
				},
				{
					slot7,
					" in the "
				},
				{
					"hit",
					"head"
				},
				{
					slot7,
					" for "
				},
				{
					"hit",
					103
				},
				{
					slot7,
					" damage"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		},
		{
			data = {
				{
					slot7,
					"Missed shot due to "
				},
				{
					"miss",
					"correction"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		},
		{
			data = {
				{
					slot7,
					"Missed shot due to "
				},
				{
					"miss",
					"prediction error"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		},
		{
			data = {
				{
					slot7,
					"Missed shot due to "
				},
				{
					"miss",
					"lagcomp failure"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		},
		{
			data = {
				{
					slot7,
					"Missed shot due to "
				},
				{
					"spread",
					"spread"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		},
		{
			data = {
				{
					slot7,
					"Missed shot due to "
				},
				{
					"unregistered",
					"unregistered shot"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		},
		{
			data = {
				{
					slot7,
					"Missed shot due to "
				},
				{
					"unregistered",
					"player death"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		},
		{
			data = {
				{
					slot7,
					"Missed shot due to "
				},
				{
					"unregistered",
					"death"
				}
			},
			timers = {
				alpha = 1,
				remove = math.huge,
				remove_log = math.huge
			}
		}
	}
	slot9 = {
		miss = "🤬 ",
		burn = "🔥 ",
		spread = "🤔 ",
		hit = "🙂 ",
		unregistered = "🤪 "
	}
	slot10 = 0
	slot11 = 0

	function slot12(slot0, slot1, slot2, slot3, slot4, slot5)
		slot6 = slot0.timers.alpha * 255
		slot7 = ""
		slot8 = slot0.data
		slot10 = slot8[1][2]:find("Burned ") and slot2 < slot0.timers.shadow_pulse
		slot11, slot12 = nil
		slot13 = 0
		slot14 = 0
		slot15 = 0

		for slot19 = 1, #slot8 do
			slot20 = slot8[slot19]

			if slot19 == 2 then
				slot11 = (not slot5 or uv0.log_aimbot[slot20[1]]:alpha_modulate(slot6)) and slot20[1]:alpha_modulate(slot6)
			end

			if slot10 then
				if slot19 == 4 then
					slot13 = render.measure_text(1, "", slot7).x
				elseif slot19 == 5 then
					slot14 = render.measure_text(1, "", slot7).x - slot13
				end
			end

			if slot5 and type(slot20[1]) == "string" then
				slot12 = slot20[1]
				slot7 = slot7 .. "" .. uv0.log_aimbot[slot20[1]]:alpha_modulate(slot6):to_hex() .. slot20[2] .. "DEFAULT"
			else
				slot7 = slot7 .. "" .. slot20[1]:alpha_modulate(slot6):to_hex() .. slot20[2] .. "DEFAULT"
			end
		end

		if slot6 ~= 0 then
			if slot5 then
				slot7 = (uv0.log_aimbot.emoji and uv1[slot12] or "") .. slot7
			end

			slot15 = render.measure_text(1, "", slot7).x / 2

			if slot4 then
				render.shadow(slot1 - vector(slot15, -6 - slot3), slot1 + vector(slot15, 6 + slot3), slot11, 30 * slot11.a / 255, 0, 0)
			end

			if slot10 then
				slot17 = vector(slot1.x + slot13 - slot15, slot1.y + slot3 + 7)

				render.shadow(slot17, slot17 + vector(slot14, 0), slot11, 50 * slot11.a / 255 * (slot0.timers.shadow_pulse - slot2), 0, 10)
			end

			render.text(1, vector(slot1.x - slot15, slot1.y + slot3), uv2, "", slot7)
		end

		slot0.timers.alpha = uv3(slot0.timers.alpha, slot2 < slot0.timers.remove and 1 or 0, 0.1)

		return uv4(13, slot0.timers.alpha, 3)
	end

	uv5:add("draw", "alt logs", function (slot0, slot1)
		uv2 = uv3(uv2, uv0.visuals and uv1.log_aimbot.main and 1 or 0, 0.1)

		if uv2 == 0 then
			uv5 = {}
			uv4 = {}

			return
		end

		if uv6.get_alpha() ~= 1 then
			uv2 = slot3
		end

		slot4 = uv1.log_aimbot.shadow

		if slot3 == 1 and uv1.log_aimbot.preview or not uv7 then
			if uv8:process().is_in_b and slot5.is_rmb_pressed then
				slot5.position.x = uv9.screen_center.x - 165
			end

			uv7 = slot5.position
			uv10 = uv3(uv10, slot5.is_in_b and not slot5.dragging and 1 or 0, 0.06)

			if uv2 * uv10 ~= 0 then
				render.text(1, uv7 - vector(-115, 20), color(255, 255, 255, slot6 * 255), "", "Press M2 to center.")
			end
		end

		slot5 = uv7 + vector(165, 0)
		slot6 = globals.realtime

		if uv2 ~= 0 and uv1.log_aimbot.preview then
			slot11 = 0

			render.rect_outline(uv7, uv7 + uv11, color(255, 50 * uv2), slot11, 8)

			slot7 = 0

			for slot11 = 1, #uv12 do
				slot7 = slot7 + uv13(uv12[slot11], slot5, slot6, slot7, slot4, true)
			end

			return
		end

		slot7 = 0

		for slot11 = 1, #uv4 do
			slot7 = slot7 + uv13(uv4[slot11], slot5, slot6, slot7, slot4)
		end
	end)

	slot13 = color(125, 255, 125)
	slot14 = {
		taser = "Tasered ",
		smokegrenade = "Smoked ",
		hegrenade = "Naded ",
		snowball = "Snowballed ",
		knife = "Knifed "
	}
	slot15 = {
		"generic",
		"head",
		"chest",
		"stomach",
		"left arm",
		"right arm",
		"left leg",
		"right leg",
		"?"
	}

	function slot16(slot0)
		slot0 = slot0 or 0
		slot2 = {}

		for slot6 = 1, #uv0 do
			if uv0[slot6].timers.alpha > 0 then
				slot1 = 0 + 1
				slot2[#slot2 + 1] = slot7
			end
		end

		if slot1 > 9 then
			for slot6 = 1, slot1 - 8 + slot0 do
				slot2[slot6].timers.remove = 0
			end
		end
	end

	slot17 = 0
	slot18 = 0

	uv5:add("player_hurt", "alt logs hurt", function (slot0, slot1, slot2)
		if not uv0.visuals or not uv1.log_aimbot.main or not slot2 then
			return
		end

		slot4 = entity.get(slot0.attacker, true)

		if entity.get(slot0.userid, true) == nil or slot4 == nil or slot3 == slot4 or slot4 ~= slot1 then
			return
		end

		if uv2 ~= globals.tickcount then
			uv2 = slot5
		else
			uv3 = uv3 + 1
		end

		slot6 = slot0.weapon
		slot7 = uv1.log_aimbot.hit
		slot8 = uv1.log_aimbot.emoji and (slot6 == "inferno" and uv4.burn or uv4.hit) or ""
		slot9 = slot3:get_name()

		if slot6 == "inferno" then
			slot10 = globals.tickcount

			if not uv5[slot9] then
				uv5[slot9] = {
					all_damage = 0,
					tick = slot10
				}
				slot11 = uv5[slot9]
			end

			if slot10 - slot11.tick > 50 then
				slot11.all_damage = 0
			end

			slot11.tick = slot10
			slot11.all_damage = slot11.all_damage + slot0.dmg_health

			table.foreach(uv6, function (slot0, slot1)
				if slot1.data[1][2]:find("Burned ") and slot1.data[2][2] == uv0 then
					uv1 = uv2[slot0]
				end
			end)

			if not nil then
				uv6[#uv6 + 1] = {
					data = {
						{
							uv7,
							slot8 .. "Burned "
						},
						{
							slot7,
							slot9
						},
						{
							uv7,
							" for "
						},
						{
							slot7,
							tostring(slot11.all_damage)
						},
						{
							uv7,
							" damage"
						}
					},
					timers = {
						alpha = 0,
						remove = math.huge,
						shadow_pulse = globals.realtime + 0.5,
						remove_log = globals.realtime + 7
					}
				}
				slot12 = uv6[#uv6]
			end

			slot12.data[4][2] = tostring(slot11.all_damage)
			slot12.timers.remove = globals.realtime + 6
			slot12.timers.remove_log = globals.realtime + 7
			slot12.timers.shadow_pulse = globals.realtime + 0.5

			uv8()

			return
		elseif uv9[slot6] ~= nil then
			uv6[#uv6 + 1] = {
				data = {
					{
						uv7,
						slot8 .. uv9[slot6]
					},
					{
						slot7,
						slot9
					},
					{
						uv7,
						" for "
					},
					{
						slot7,
						tostring(slot0.dmg_health)
					},
					{
						uv7,
						" damage"
					}
				},
				timers = {
					alpha = 0,
					remove = globals.realtime + 6,
					remove_log = globals.realtime + 7
				}
			}

			uv8()

			return
		end

		if slot0.hitgroup == 0 then
			uv6[#uv6 + 1] = {
				data = {
					{
						uv7,
						slot8 .. "Hit "
					},
					{
						slot7,
						slot9
					},
					{
						uv7,
						" for "
					},
					{
						slot7,
						tostring(slot0.dmg_health)
					},
					{
						uv7,
						" damage"
					}
				},
				timers = {
					alpha = 0,
					remove = globals.realtime + 6,
					remove_log = globals.realtime + 7
				}
			}
		else
			uv6[#uv6 + 1] = {
				data = {
					{
						uv7,
						slot8 .. "Hit "
					},
					{
						slot7,
						slot9
					},
					{
						uv7,
						" in the "
					},
					{
						slot7,
						uv10[slot10 + 1]
					},
					{
						uv7,
						" for "
					},
					{
						slot7,
						tostring(slot0.dmg_health)
					},
					{
						uv7,
						" damage"
					}
				},
				timers = {
					alpha = 0,
					remove = globals.realtime + 6,
					remove_log = globals.realtime + 7
				}
			}
		end

		uv8()
	end)
	uv5:add("cs_game_disconnected", "Log aimbot clean", function (slot0)
		uv0 = {}
	end)
	uv5:add("round_prestart", "Log aimbot clean 1", function (slot0)
		uv0 = {}
	end)

	slot19 = {
		correction = "miss",
		["player death"] = "unregistered",
		["unregistered shot"] = "unregistered",
		death = "unregistered",
		["prediction error"] = "miss",
		["lagcomp failure"] = "miss",
		spread = "spread",
		["jitter correction"] = "miss"
	}
	slot20 = {
		misprediction = "jitter correction"
	}

	uv5:add("aim_ack", "logs aim", function (slot0)
		if not uv0.visuals or not uv1.log_aimbot.main then
			return
		end

		if not slot0.target or slot1 == nil or not slot0.state then
			return
		end

		if not slot0.wanted_damage or slot0.wanted_damage == 0 then
			return
		end

		if not uv3.Visuals.log_aimbot[uv2[slot0.state]] then
			return
		end

		uv6[#uv6 + 1] = {
			data = {
				{
					uv7,
					(uv1.log_aimbot.emoji and uv5[slot2] or "") .. "Missed shot due to "
				},
				{
					slot3:get(),
					uv4[slot0.state] or slot0.state
				}
			},
			timers = {
				alpha = 0,
				remove = globals.realtime + 6,
				remove_log = globals.realtime + 7
			}
		}

		uv8()
	end)
end()

slot82 = {
	yaw_base = slot32.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw"),
	yaw_base1 = slot32.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	yaw_add = slot32.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	freestand = slot32.FindVar("Aimbot", "Anti Aim", "Angles", "Freestanding")
}

function ()
	slot0 = {
		{
			vector(55, 2),
			vector(42, -7),
			vector(42, 11)
		},
		{
			vector(-54, 2),
			vector(-41, -7),
			vector(-41, 11)
		}
	}
	slot1 = 0
	slot2 = uv0.screen_center + vector(0, -1)
	slot3 = 0
	slot4 = 0
	slot5 = 0
	slot6 = 0
	slot7 = render.poly
	slot8 = rage.antiaim
	slot10 = color(0, 0, 0, 90)

	uv1:add("draw", "manuali", function (slot0, slot1)
		uv0 = uv1(uv0, uv2.visuals and uv3.manual_strelki.main and uv4.functions.scope_anim < 0.3 and slot1 and 1 or 0, 0.1, 0.01)

		if uv0 < 0.01 then
			return
		end

		slot2 = uv5:inverter()
		slot3 = uv6.Visuals.manual_strelki.color:get():alpha_modulate(255)
		uv7 = uv1(uv7, uv3.manual_yb == "Right" and 1 or 0, 0.1, 0.05)
		uv8 = uv1(uv8, slot4 == "Left" and 1 or 0, 0.1, 0.05)
		uv9 = uv1(uv9, slot2 and 1 or 0, 0.1, 0.05)
		uv10 = uv1(uv10, not slot2 and 1 or 0, 0.1, 0.05)
		slot7 = uv11:lerp(slot3, uv7)
		slot8 = uv11:lerp(slot3, uv8)
		slot9 = uv11:lerp(slot3, uv9)
		slot10 = uv11:lerp(slot3, uv10)

		uv12(slot7:alpha_modulate(slot7.a * uv0), uv13 + uv14[1][1], uv13 + uv14[1][2], uv13 + uv14[1][3])
		uv12(slot8:alpha_modulate(slot8.a * uv0), uv13 + uv14[2][1], uv13 + uv14[2][2], uv13 + uv14[2][3])
		render.rect(uv13 + vector(38, -7), uv13 + vector(40, 11), slot9:alpha_modulate(slot9.a * uv0))
		render.rect(uv13 + vector(-39, -7), uv13 + vector(-37, 11), slot10:alpha_modulate(slot10.a * uv0))
	end)
end()
function ()
	slot0 = cvar.r_aspectratio
	slot1 = false

	function slot3()
		slot0 = uv0.misc and uv1.Misc.aspect_ratio.main:Get() and uv1.Misc.aspect_ratio.ratio:Get() / 100 or uv2.r_aspectratio

		uv3:float(slot0)

		if slot0 == 1 then
			uv4 = true

			uv5()
		else
			uv4 = slot0 ~= 1
		end
	end

	uv3:add("draw", "aspect_ratio", function ()
		if not uv0.misc then
			return uv1()
		end
	end)
	uv2.Misc.main:RegisterCallback(slot3)
	uv2.Misc.aspect_ratio.main:RegisterCallback(slot3)
	uv2.Misc.aspect_ratio.ratio:RegisterCallback(slot3)
	slot3()
	uv3:add("destroy", "aspect_ratio 1", function ()
		if uv0 then
			uv1:float(uv2.r_aspectratio)

			uv0 = false
		end
	end)
end()

function slot85(slot0)
	while slot0 > 180 do
		slot0 = slot0 - 360
	end

	while slot0 < -180 do
		slot0 = slot0 + 360
	end

	return slot0
end

function ()
	slot0 = {
		"Global",
		"Standing",
		"Moving",
		"Slowwalking",
		"Ducking",
		"Jumping",
		"CrouchingAir",
		"LegitAA",
		"Fakelagging"
	}
	slot1 = {
		pitch = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Pitch"),
		yaw_base = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw"),
		yaw_base1 = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
		yaw_defen = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
		yaw_add = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
		fakeopt = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
		free_dsy = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
		yaw_mod = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
		yaw_mod_d = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
		freestand = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Freestanding"),
		limit1 = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
		limit2 = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
		body_yaw = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw")
	}
	slot2 = {
		false,
		false,
		false
	}
	slot3 = {
		{
			yaw_add = 0,
			pitch = 0,
			limit1 = 0,
			limit2 = 0,
			freestand = 0,
			yaw_mod_d = 0,
			yaw_mod = 0,
			free_dsy = 0,
			fakeopt = 0,
			yaw_defen = 0
		},
		{
			yaw_add = 0,
			pitch = 0,
			limit1 = 0,
			limit2 = 0,
			freestand = 0,
			yaw_mod_d = 0,
			yaw_mod = 0,
			free_dsy = 0,
			fakeopt = 0,
			yaw_defen = 0
		},
		{
			yaw_add = 0,
			pitch = 0,
			limit1 = 0,
			limit2 = 0,
			freestand = 0,
			yaw_mod_d = 0,
			yaw_mod = 0,
			free_dsy = 0,
			fakeopt = 0,
			yaw_defen = 0
		}
	}
	slot4 = 1
	slot5 = 1

	function slot6(slot0)
		if uv0[slot0] then
			return
		end

		for slot4, slot5 in pairs(uv1) do
			uv2[slot0][slot4] = slot5:get()
		end

		uv0[slot0] = true
	end

	function slot7(slot0)
		if not uv0[slot0] then
			return
		end

		for slot4, slot5 in pairs(uv1) do
			slot5:override()
		end

		uv0[slot0] = false
	end

	uv1:add("prediction", "cond aas pred", function (slot0, slot1, slot2)
		if slot0.choked_commands == 0 then
			uv0.last_body_yaw = slot1.m_flPoseParameter[11] * 120 - 60
			uv0.jitter = 0

			if not uv1.antiaim or not uv2.AntiAim.mode:get() == "Default" then
				return
			end

			uv3 = uv3 * -1
			uv4 = uv4 + 1
		end
	end)
	uv1:add("destroy", "cond aas dest", function ()
		uv0(1)
		uv0(2)
		uv0(3)
		uv1.yaw_base:override()
		uv1.yaw_base1:override()
		uv1.freestand:override()
		uv1.pitch:override()
		uv1.yaw_add:override()
		uv1.body_yaw:override()
	end)

	slot8 = rage.antiaim

	function slot9()
		return uv0(uv1(uv2:get_rotation() - uv2:get_rotation(true)), uv2:get_max_desync())
	end

	slot10 = 0
	slot11 = false
	slot12 = false
	slot13 = {
		[0] = "Forward",
		"Backward",
		"Right",
		"Left",
		"At target",
		"Freestanding"
	}
	slot14 = 0
	slot15 = uv2.screen_center

	uv1:add("prediction", "safehead", function (slot0, slot1, slot2, slot3)
		uv0.safehead = false
		uv1 = false
		uv2 = 0

		if slot1 and slot2 then
			uv3 = uv4(slot1, not uv5.AntiAim.enabled_Fakelagging:get())
			uv6.global_cond = uv3
		end

		if not uv7.antiaim or not slot2 or uv0.on_use_aa or uv0.edge_yaw or uv8.manual_yb == "Right" or uv8.manual_yb == "Left" then
			return uv9(3)
		end

		if uv3 - 1 == 2 then
			return
		elseif slot4 > 2 then
			slot4 = slot4 - 1
		end

		slot4 = math.clamp(slot4, 0, 5)

		if slot4 == 4 and not uv5.AntiAim.safehead:get(slot4) and slot1:get_player_weapon() then
			if slot6:get_classid() == 107 then
				slot5 = uv5.AntiAim.safehead:get(6)
			elseif slot7 == 268 then
				slot5 = uv5.AntiAim.safehead:get(7)
			end
		end

		if not slot5 then
			return uv9(3)
		end

		slot6 = slot1:get_origin()
		slot7 = 4096
		slot8 = nil
		slot9 = 0

		for slot13, slot14 in pairs(slot3) do
			if slot14:is_alive() then
				if slot14:is_dormant() then
					-- Nothing
				elseif not render.world_to_screen(slot14:get_origin()) then
					-- Nothing
				elseif slot7 > #(uv10 - slot16) then
					slot7 = slot17
					slot8 = slot14
					slot9 = slot15.z + 5
				end
			end
		end

		if slot8 and slot9 < slot6.z then
			uv0.safehead = utils.trace_bullet(slot8, slot8:get_eye_position(), slot1:get_hitbox_position(0) + vector(0, 0, 6)) > 0
		end

		if uv0.safehead then
			uv11(3)

			uv2 = uv12(slot1:get_eye_position():to(slot8:get_origin()):angles().y) - slot0.view_angles.y

			if not uv13 then
				uv1 = true

				return
			end

			uv14.yaw_add:override(0)
			uv14.yaw_mod:override("Disabled")
			uv14.fakeopt:override({})
			uv14.yaw_base:override("Backward")
			uv14.yaw_base1:override("Local View")
			uv15:inverter(slot4 ~= 1)
			uv14.limit1:override(25)
			uv14.limit2:override(25)
			uv14.yaw_add:override(uv2)
		else
			return uv9(3)
		end
	end)

	slot16 = false
	slot17 = {
		-180,
		0,
		90,
		-90
	}
	slot18 = 1
	slot19 = {
		-0.75,
		1,
		0,
		0.4,
		-0.25
	}
	uv1.breakpoints["cond aas"] = -1
	slot20 = false
	slot21 = 0
	slot22 = nil
	slot23 = {
		r_limit_Ducking = 29,
		yaw_add_Ducking = 34,
		yaw_mod_Ducking = "Offset",
		freestand_Ducking = "Off",
		enabled_CrouchingAir = true,
		body_yaw_Jumping = true,
		yaw_mod_deg_type_Ducking = "Random",
		enabled_Fakelagging = true,
		yaw_mod_Slowwalking = "Shaitan",
		yaw_mod_deg_max_Standing = 62,
		yaw_mod_deg_max_Moving = -65,
		yaw_mod_deg_min_Slowwalking = 43,
		yaw_mod_deg_max_Slowwalking = 66,
		yaw_mod_deg_Jumping = 25,
		l_limit_Slowwalking = 40,
		l_limit_Jumping = 60,
		r_limit_Jumping = 60,
		freestand_Jumping = "Off",
		yaw_add_CrouchingAir = 37,
		yaw_add_Fakelagging = 5,
		yaw_mod_CrouchingAir = "Offset",
		yaw_mod_deg_type_CrouchingAir = "Switch",
		body_yaw_Global = true,
		yaw_mod_deg_CrouchingAir = 56,
		yaw_mod_Jumping = "Offset",
		yaw_base_CrouchingAir = "At Target",
		l_limit_Ducking = 38,
		ds_on_shot_CrouchingAir = "Opposite",
		lby_mode_CrouchingAir = "Opposite",
		enabled_LegitAA = true,
		yaw_add_LegitAA = 0,
		yaw_add1_LegitAA = 0,
		yaw_mod_deg_type_LegitAA = "Default",
		yaw_mod_deg_min_LegitAA = 0,
		yaw_mod_deg_max_LegitAA = 0,
		r_limit_LegitAA = 60,
		freestand_LegitAA = "Off",
		ds_on_shot_LegitAA = "Disabled",
		lby_mode_LegitAA = "Disabled",
		yaw_add1_Fakelagging = 0,
		yaw_mod_Fakelagging = "Center",
		yaw_mod_deg_type_Fakelagging = "Default",
		yaw_mod_deg_Fakelagging = -49,
		yaw_mod_deg_min_Fakelagging = 0,
		body_yaw_Fakelagging = true,
		l_limit_Fakelagging = 60,
		ds_on_shot_Fakelagging = "Opposite",
		lby_mode_Fakelagging = "Opposite",
		body_yaw_Standing = true,
		l_limit_Standing = 39,
		freestand_CrouchingAir = "Off",
		body_yaw_Moving = true,
		yaw_mod_deg_Moving = 43,
		yaw_mod_Moving = "Offset",
		yaw_base_Moving = "At Target",
		lby_mode_Standing = "Disabled",
		ds_on_shot_Standing = "Disabled",
		freestand_Standing = "Off",
		r_limit_Standing = 40,
		yaw_mod_deg_Standing = -30,
		yaw_mod_Standing = "Center",
		yaw_add1_Standing = 0,
		yaw_add_Standing = 0,
		yaw_base_Standing = "At Target",
		lby_mode_Global = "Disabled",
		ds_on_shot_Ducking = "Disabled",
		yaw_add1_Jumping = 40,
		yaw_add1_Global = 0,
		yaw_mod_deg_min_Jumping = 0,
		ds_on_shot_Slowwalking = "Disabled",
		yaw_mod_deg_min_Ducking = -50,
		yaw_mod_deg_min_Global = 0,
		yaw_mod_deg_min_CrouchingAir = 0,
		body_yaw_CrouchingAir = false,
		ds_on_shot_Moving = "Disabled",
		body_yaw_LegitAA = false,
		yaw_mod_deg_type_Slowwalking = "Switch",
		yaw_mod_LegitAA = "Disabled",
		manual_yb = "Disabled",
		yaw_mod_deg_min_Moving = 0,
		yaw_add1_CrouchingAir = 37,
		yaw_mod_deg_min_Standing = -29,
		yaw_mod_deg_type_Standing = "Switch",
		yaw_mod_deg_max_Global = 0,
		yaw_mod_deg_type_Global = "Default",
		yaw_add_Global = 0,
		yaw_base_Global = "At Target",
		yaw_mod_deg_max_Fakelagging = 0,
		lby_mode_Ducking = "Disabled",
		yaw_base_Jumping = "At Target",
		yaw_add1_Slowwalking = 0,
		l_limit_CrouchingAir = 60,
		freestand_Moving = "Off",
		r_limit_Slowwalking = 21,
		yaw_mod_deg_max_CrouchingAir = -69,
		yaw_mod_deg_Ducking = -66,
		yaw_add_Jumping = 40,
		yaw_mod_deg_max_Jumping = -44,
		yaw_base_Ducking = "At Target",
		enabled_Ducking = true,
		yaw_mod_deg_type_Moving = "Switch",
		yaw_add_Slowwalking = 0,
		yaw_base_Slowwalking = "At Target",
		enabled_Slowwalking = true,
		lby_mode_Moving = "Disabled",
		l_limit_LegitAA = 60,
		body_yaw_Slowwalking = true,
		yaw_mod_deg_Slowwalking = 55,
		r_limit_Moving = 15,
		l_limit_Moving = 41,
		enabled_Jumping = true,
		body_yaw_Ducking = true,
		yaw_mod_deg_max_Ducking = -71,
		yaw_add_Moving = 51,
		enabled_Moving = true,
		yaw_mod_deg_Global = 35,
		yaw_mod_Global = "Random",
		lby_mode_Jumping = "Disabled",
		ds_on_shot_Jumping = "Disabled",
		freestand_Fakelagging = "Off",
		r_limit_Fakelagging = 60,
		yaw_base_Fakelagging = "At Target",
		yaw_add1_Ducking = 35,
		yaw_mod_deg_type_Jumping = "Switch",
		lby_mode_Slowwalking = "Opposite",
		freestand_Slowwalking = "Off",
		enabled_Standing = true,
		r_limit_CrouchingAir = 60,
		ds_on_shot_Global = "Freestanding",
		freestand_Global = "Off",
		r_limit_Global = 0,
		l_limit_Global = 0,
		yaw_mod_deg_LegitAA = 0,
		yaw_add1_Moving = 51,
		fake_opt_Jumping = {
			"Jitter"
		},
		fake_opt_Ducking = {
			"Jitter"
		},
		fake_opt_Global = {
			"Jitter"
		},
		fake_opt_Slowwalking = {
			"Jitter"
		},
		fake_opt_Fakelagging = {
			"Jitter"
		},
		fake_opt_Moving = {
			"Jitter"
		},
		fake_opt_Standing = {
			"Jitter",
			"Randomize jitter"
		},
		fake_opt_CrouchingAir = {
			"Jitter"
		},
		fake_opt_LegitAA = {}
	}
	slot24 = {
		Default = "Peek Fake",
		Off = "Off",
		Reversed = "Peek Real"
	}

	uv1:add("prediction", "cond aas", function (slot0, slot1, slot2)
		uv0 = not uv1.antiaim or uv2.AntiAim.mode:get() == "Default" or not slot2
		uv3.breakpoints["cond aas"] = 0

		if uv4.on_warmup then
			uv5.pitch:override("Disabled")
			uv5.yaw_base:override("Disabled")
			uv5.body_yaw:override(false)

			uv6 = true

			return
		elseif uv6 then
			uv5.pitch:override()
			uv5.yaw_base:override()
			uv5.body_yaw:override()

			uv6 = false
		end

		uv3.breakpoints["cond aas"] = 1

		uv5.yaw_base:override(uv7[1])
		uv5.freestand:override()

		slot4 = false

		if uv1.antiaim and uv2.AntiAim.mode:get() == "Default" and slot2 and not uv8.edge_yaw and (uv2.AntiAim.manual_yb:GetCombo() or 0) ~= 0 and not uv8.on_use_aa then
			uv3.breakpoints["cond aas"] = 2
			uv9 = true

			uv5.yaw_add:override(0)
			uv5.freestand:override(false)

			if uv10 then
				uv5.yaw_base1:override("At Target")
			else
				slot4 = true

				if slot3 > 4 then
					if slot3 == 5 then
						uv5.yaw_base1:override("Local View")
						uv5.freestand:override(true)
					end
				else
					uv5.yaw_base1:override("Local View")
					uv5.yaw_add:override(uv11[slot3] or 0)
				end
			end

			uv3.breakpoints["cond aas"] = 3
		else
			uv3.breakpoints["cond aas"] = 4

			if uv9 then
				uv9 = false

				uv5.yaw_add:override()
				uv5.yaw_base:override()
				uv5.yaw_base1:override()
			end

			uv3.breakpoints["cond aas"] = 5
		end

		uv3.breakpoints["cond aas"] = 6

		if uv0 or uv8.edge_yaw then
			return uv12(1)
		end

		uv3.breakpoints["cond aas"] = 7

		if uv10 then
			uv5.yaw_add:override(0)
			uv5.yaw_mod:override("Disabled")
			uv5.fakeopt:override({})
			uv5.yaw_base:override("Backward")
			uv5.yaw_base1:override("Local View")

			if uv13 - 1 > 1 then
				slot5 = slot5 - 1
			end

			uv14:inverter(slot5 ~= 1)
			uv5.limit1:override(25)
			uv5.limit2:override(25)
			uv5.yaw_add:override(uv15)

			return
		else
			uv12(3)
		end

		uv3.breakpoints["cond aas"] = 8

		uv16(1)

		uv3.breakpoints["cond aas"] = 9
		slot6 = uv18[uv17(slot1, not uv2.AntiAim.enabled_Fakelagging:get())]:gsub(" ", "")
		slot7 = "Global"
		slot8 = {
			body_yaw = uv21["body_yaw_" .. slot7],
			limit1 = uv21["l_limit_" .. slot7],
			limit2 = uv21["r_limit_" .. slot7],
			free_dsy = uv8.should_fs_desync and "Peek Fake" or uv21["freestand_" .. slot7],
			yaw_base1 = uv21["yaw_base_" .. slot7],
			yaw_add = uv21["yaw_add_" .. slot7],
			yaw_add1 = uv21["yaw_add1_" .. slot7],
			yaw_mod = uv21["yaw_mod_" .. slot7],
			fake_opt_combo_2 = uv22(uv21["fake_opt_" .. slot7]).Jitter,
			fake_opt = uv21["fake_opt_" .. slot7],
			yaw_mod_d = uv21["yaw_mod_deg_" .. slot7],
			yaw_mod_deg_type = uv21["yaw_mod_deg_type_" .. slot7],
			yaw_mod_deg_min = uv21["yaw_mod_deg_min_" .. slot7],
			yaw_mod_deg_max = uv21["yaw_mod_deg_max_" .. slot7],
			yaw_defensive = uv21["yaw_defensive" .. slot7] or false
		}
		slot9 = {}

		if uv19 and uv2.AntiAim.mode:get() == "Automatic" and uv20.get_alpha() == 0 then
			for slot13 = 1, 0 do
				slot8["mod_d_ab_" .. slot13] = uv21["lby_mode_" .. (slot5 == 1 and "Global" or uv21["enabled_" .. slot6] and slot6 or "Global")]
			end
		else
			slot7 = slot5 == 1 and "Global" or uv2.AntiAim["enabled_" .. slot6]:get() and slot6 or "Global"
			slot8.body_yaw = uv2.AntiAim["body_yaw_" .. slot7]:Get()
			slot8.limit1 = uv2.AntiAim["l_limit_" .. slot7]:Get()
			slot8.limit2 = uv2.AntiAim["r_limit_" .. slot7]:Get()
			slot8.free_dsy = uv8.should_fs_desync and "Default" or uv2.AntiAim["freestand_" .. slot7]:Get()

			if uv2.AntiAim["yaw_base_" .. slot7] then
				slot8.yaw_base1 = uv2.AntiAim["yaw_base_" .. slot7]:Get()
			end

			slot8.yaw_add = uv2.AntiAim["yaw_add_" .. slot7]:Get()
			slot8.yaw_add1 = uv2.AntiAim["yaw_add1_" .. slot7]:Get()
			slot8.yaw_mod = uv2.AntiAim["yaw_mod_" .. slot7]:Get()
			slot8.fake_opt_combo_2 = uv2.AntiAim["fake_opt_" .. slot7]:GetCombo(2)
			slot8.fake_opt = uv2.AntiAim["fake_opt_" .. slot7]:get()
			slot8.yaw_mod_d = uv2.AntiAim["yaw_mod_deg_" .. slot7]:get()
			slot8.yaw_mod_deg_type = uv2.AntiAim["yaw_mod_deg_type_" .. slot7]:get()
			slot8.yaw_mod_deg_min = uv2.AntiAim["yaw_mod_deg_min_" .. slot7]:get()
			slot8.yaw_mod_deg_max = uv2.AntiAim["yaw_mod_deg_max_" .. slot7]:get()
			slot8.yaw_defensive = uv2.AntiAim["yaw_defensive_" .. slot7]:get()

			for slot13 = 1, uv4.ab_phases[slot7] do
				slot9[#slot9 + 1] = uv2.AntiAim["mod_d_ab_" .. slot13 .. slot7]:get()
			end
		end

		uv5.body_yaw:override(slot8.body_yaw)

		uv3.breakpoints["cond aas"] = 10
		slot10 = uv14:inverter()

		uv5.limit1:override(slot8.limit1)
		uv5.limit2:override(slot8.limit2)

		uv3.breakpoints["cond aas"] = 11

		uv5.free_dsy:override(uv23[slot8.free_dsy])
		uv5.fakeopt:override({})
		uv5.yaw_mod:override("Disabled")
		uv5.yaw_add:override(0)

		uv3.breakpoints["cond aas"] = 12
		slot11 = 0

		if not uv8.on_use_aa then
			uv3.breakpoints["cond aas"] = 13

			if uv2.AntiAim["yaw_base_" .. slot7] then
				uv5.yaw_base1:override(slot8.yaw_base1)
			end

			if slot3 - 1 > 1 then
				uv5.yaw_base1:override("Local View")
				uv5.freestand:override(false)
			end

			if slot12 > 3 then
				uv3.breakpoints["cond aas"] = 14

				uv5.yaw_base:override(uv7[1])

				if slot12 == 4 then
					uv5.freestand:override(true)
				end
			else
				slot11 = slot11 + (uv11[slot12 + 1] or 0)
			end
		else
			slot11 = slot11 + uv4.functions.on_use_aa_yaw_override
		end

		uv3.breakpoints["cond aas"] = 16

		if not uv8.rolldesync then
			uv3.breakpoints["cond aas"] = 17

			if slot3 == 0 then
				slot11 = rage.antiaim:inverter() and slot11 + slot8.yaw_add or slot11 + slot8.yaw_add1
			end

			uv5.yaw_defen:override(slot8.yaw_defensive)

			slot12 = not uv8.should_stop_jittering and slot8.yaw_mod or "Disabled"

			if not uv8.should_stop_jittering and slot8.fake_opt_combo_2 then
				uv5.fakeopt:override(slot8.fake_opt)
			end

			slot13 = slot8.yaw_mod_d

			if slot8.yaw_mod_deg_type == "Random" then
				if uv24 % 2 == 0 or uv25 == nil then
					uv25 = utils.random_int(slot8.yaw_mod_deg_min, slot8.yaw_mod_deg_max)
				end

				slot13 = uv25
			else
				slot13 = slot14 == "Switch" and (uv24 % 4 > 1 and slot8.yaw_mod_deg_min or slot8.yaw_mod_deg_max) or (slot14 ~= "Anti-Brute" or slot9[uv4.ab_phase % #slot9 + 1]) and slot8.yaw_mod_d
			end

			if slot12 == "Shaitan" then
				if slot0.choked_commands == 0 then
					uv26 = slot13 * uv27[uv28]
					uv28 = uv28 + 1

					if uv28 > #uv27 then
						uv28 = 1
					end
				end

				slot11 = slot11 + uv26
			else
				uv5.yaw_mod:override(slot12)
				uv5.yaw_mod_d:override(slot13)
			end

			uv3.breakpoints["cond aas"] = 18

			uv5.yaw_add:override(slot11)

			uv3.breakpoints["cond aas"] = 19
		end

		uv4.yaw = slot11
	end)
end()
function ()
	slot0 = -1

	uv0:add("draw", "warmup disablers", function ()
		uv0.on_warmup = false

		if not uv1.antiaim or not uv2.AntiAim.tweaks:get(1) then
			return
		end

		if not entity.get_game_rules() then
			return
		end

		if not slot0.m_bWarmupPeriod then
			return
		end

		uv0.on_warmup = true
	end)
end()
function ()
	slot0 = false
	slot1 = 0

	function hostage_check(slot0)
		for slot5, slot6 in pairs(entity.get_entities(97)) do
			if slot6:get_origin() and slot7:dist(slot0) < 64 then
				return false
			end
		end

		return true
	end

	function bomb_check(slot0)
		if slot0:get_player_weapon() then
			if slot1:get_weapon_index() == 34 then
				return false
			else
				return true
			end
		else
			return false
		end
	end

	function defuse_check(slot0)
		for slot5, slot6 in pairs(entity.get_entities(129)) do
			if slot6:get_origin() and slot7:dist(slot0) < 100 then
				return false
			end
		end

		return true
	end

	slot2 = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Pitch")
	slot3 = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset")
	slot4 = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter")
	slot5 = -1
	slot7 = rage.antiaim

	uv2:add("prediction", "On use anti-aim", function (slot0, slot1, slot2)
		uv0.functions.on_use_aa = false
		uv0.functions.on_use_aa_yaw_override = 0

		if not slot2 or not uv1.antiaim or not uv2.AntiAim.tweaks:Get(3) then
			return uv3()
		end

		slot4 = false

		if slot0.in_use then
			if hostage_check(slot1:get_origin()) and bomb_check(slot1) and defuse_check(slot5) then
				uv4 = not uv5 and globals.tickcount or uv4
				uv5 = true

				uv6.freestand:override(false)
				uv7:override("Disabled")

				uv0.functions.on_use_aa_yaw_override = 180

				uv8:inverter(uv9.anti_bruteforce and uv9.anti_bruteforce_side or not uv10:get())

				if uv11 == -1 then
					uv11 = uv6.yaw_base:get()
				end

				uv6.yaw_base1:override("Local View")
			else
				uv5 = false

				uv3()
			end
		else
			uv5 = false

			uv3()
		end

		uv9.on_use_aa = uv5

		if uv4 + 4 <= globals.tickcount and slot4 then
			slot0.in_use = false
		end
	end)
	uv2:add("destroy", "ebalop zavali", function ()
		if uv0 ~= -1 then
			uv1:override()
			uv2:override()
			uv3.yaw_base:override()
			uv3.yaw_base1:override()
			uv3.freestand:override()
			uv4:override()

			uv0 = -1
		end
	end)
end()
function ()
	function slot0(slot0, slot1, slot2)
		return slot0 + (slot1 - slot0) * slot2
	end

	function slot1(slot0, slot1)
		return slot0.flYaw < slot1.flYaw
	end

	slot2 = table.sort
	slot3 = rage.antiaim

	function slot4(slot0, slot1)
		if not slot0 then
			return
		end

		if uv0.on_use_aa then
			return
		end

		slot2 = {}
		slot3 = nil
		slot8 = 10
		slot4 = slot0:get_eye_position() + vector(0, 0, slot8)

		for slot8 = 18, 360, 18 do
			if utils.trace_line(slot4, slot4 + vector():angles(0, uv1(slot8)) * 96, slot0, 33570827).entity and slot11:get_classname() == "CWorld" and slot10.fraction < 0.35 then
				slot2[#slot2 + 1] = {
					vecTraceEnd = slot10.end_pos,
					flYaw = slot8
				}
			end
		end

		uv2(slot2, uv3)

		if #slot2 >= 2 then
			slot3 = (slot4 - uv4(slot2[1].vecTraceEnd, slot2[#slot2].vecTraceEnd, 0.5)):angles()
		end

		if slot3 then
			if uv5(uv1(slot3.y - slot1.view_angles.y)) < 90 then
				slot7 = 0
				slot5 = uv1(slot6 + 180)
			end

			return uv1(-slot5 + slot6 + slot7 + 180)
		end
	end

	slot5 = -1

	uv4:add("prediction", "edge yaw bratka", function (slot0, slot1, slot2)
		uv0.edge_yaw = false

		if not uv1.antiaim or not slot2 or not uv2.AntiAim.tweaks:get(2) or uv3.on_warmup then
			return uv4()
		end

		if uv5(slot1, slot0) then
			if uv6 == -1 then
				uv6 = uv7.yaw_base:get()
			end

			uv7.yaw_base:override("Backward")
			uv7.yaw_base1:override("Local View")
			uv7.yaw_add:override(slot3)

			uv0.edge_yaw = true
		else
			uv4()
		end
	end)
	uv4:add("destroy", "globals", function ()
		if uv0 ~= -1 then
			uv1.yaw_base:override()
			uv1.yaw_base1:override()
			uv1.freestand:override()
			uv1.yaw_add:override()

			uv0 = -1
		end
	end)
end()
function ()
	slot0 = 0

	function slot1(slot0, slot1, slot2)
		slot3 = slot2 - slot0
		slot4 = slot1 - slot0
		slot5 = slot4:length()
		slot4.x = slot4.x / slot5
		slot4.y = slot4.y / slot5
		slot4.z = slot4.z / slot5

		if slot4.x * slot3.x + slot4.y * slot3.y + slot4.z * slot3.z < 0 then
			return slot0
		end

		if slot5 < slot6 then
			return slot1
		end

		return vector(slot0.x + slot4.x * slot6, slot0.y + slot4.y * slot6, slot0.z + slot4.z * slot6)
	end

	slot2 = 0

	uv0:add("bullet_impact", "anti brute bratka", function (slot0, slot1, slot2)
		if not uv0.antiaim or not slot0 then
			return
		end

		slot3 = uv1.GetPlayerForUserID(slot0.userid)

		if not slot2 or not slot3 or slot1 == slot3 then
			return
		end

		slot4 = slot1:get_eye_position()

		if not slot3:get_eye_position() then
			return
		end

		if uv2(slot5, vector(slot0.x, slot0.y, slot0.z), slot4):dist(slot4) > 60 or globals.tickcount == uv3 then
			return
		end

		if uv4.AntiAim.tweaks:get(4) then
			uv5.anti_bruteforce = globals.realtime + 3
			uv5.anti_bruteforce_side = not rage.antiaim:inverter()
		end

		uv6.ab_phase = uv6.ab_phase + 1
		uv7 = globals.realtime + 3
		uv3 = globals.tickcount
	end)
	uv0:add("prediction", "anti brute bratka jopka", function (slot0, slot1, slot2)
		if uv0.ab_phase ~= 0 and uv1 < globals.realtime then
			uv0.ab_phase = 0
		end

		if not uv2.antiaim or not uv3.AntiAim.tweaks:get(4) then
			uv4.anti_bruteforce = -1

			return
		end

		if globals.realtime < uv4.anti_bruteforce then
			rage.antiaim:inverter(uv4.anti_bruteforce_side)
		else
			uv4.anti_bruteforce = -1
		end
	end)
end()
function ()
	slot0 = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options")
	slot1 = uv0.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw Modifier")
	slot2, slot3 = nil

	uv2:add("prediction", "static manuals", function (slot0, slot1, slot2)
		uv0.should_stop_jittering = slot2 and uv1.antiaim and uv2.AntiAim.tweaks:get(5) and (uv3.manual_yb == "Right" or uv3.manual_yb == "Left")

		if uv0.should_stop_jittering and uv2.AntiAim.mode:Get() == "Default" then
			if not uv4 or not uv5 then
				uv5 = uv7:get()
				uv4 = uv6:get()
			end

			uv6:override("Disabled")

			slot3 = {}

			for slot7 = 1, #uv5 do
				if uv5[slot7] ~= "Jitter" then
					slot3[#slot3 + 1] = uv5[slot7]
				end
			end

			rage.antiaim:inverter(false)
			uv7:override(slot3)
			uv8.yaw_add:override(0)
		else
			return uv9()
		end
	end)
	uv2:add("destroy", "static manuals destr", function ()
		if uv0 and uv1 then
			uv2:override()
			uv3:override()
			uv4.yaw_add:override()

			uv1 = nil
			uv0 = nil
		end
	end)
end()
function ()
	slot0 = uv0.FindVar("Aimbot", "Anti Aim", "Misc", "Leg Movement")
	slot1 = false
	slot2 = uv0.FindVar("Aimbot", "Anti Aim", "Fake Lag", "Enabled")
	slot3 = uv0.FindVar("Aimbot", "Ragebot", "Main", "Double Tap")
	slot4 = uv0.FindVar("Aimbot", "Ragebot", "Main", "Hide Shots")

	uv1:add("prediction", "mossfoasfas", function (slot0, slot1, slot2)
		uv0.is_fakelagging = uv1:get() and not uv2:get() and not uv3:get()

		if not uv4.antiaim or #uv5.anim_breakers == 0 then
			return
		end

		uv6 = slot0.in_jump

		if uv7.AntiAim.anim_breakers:get(4) then
			slot0.animate_move_lean = true
		end
	end)

	slot5 = utils.opcode_scan("client.dll", "8B F1 80 BE ? ? ? ? ? 74 36", -5)
	slot6 = utils.get_vfunc(219, "void(__thiscall*)(void*, int)")
	slot7 = ffi.cast("int(__thiscall*)(void*, const char*)", uv6.rel_jmp("client.dll", "E8 ? ? ? ? 5E 83 F8 FF"))
	slot8 = 0
	slot9 = 0
	slot10 = 1
	slot11 = 0.25
	slot12 = -1
	slot13 = 0
	slot14 = nil
	slot16 = ffi.typeof([[
        struct {
            float   anim_time;
            float   fade_out_time;
            int     flags;
            int     activty;	
            int     priority;
            int     order;			
            int     sequence;
            float   prev_cycle;
            float   weight;
            float   weight_delta_rate;
            float   playback_rate;
            float   cycle;
            int     owner;
            int     bits;
        }
    ]])

	if uv8.build == "beta" then
		uv1:add("round_start", "beta prikol", function (slot0)
			if not globals.is_in_game then
				return
			end

			if slot0 and type(slot0) == "boolean" and uv0 == slot0 then
				return
			end

			uv1 = 0.25
			uv3 = 1
			uv2 = 0

			if entity.get_local_player() and slot1 ~= nil then
				uv4 = uv5(ffi.cast("void*", slot1[0]), "deathpose_lowviolence")

				uv6(uv4)
			end

			uv7 = 0
			uv8 = globals.realtime + cvar.mp_freezetime:float() - 1
		end)

		slot14 = uv5.Modifications.beta_options.options:get(2)

		uv5.Modifications.beta_options.options:set_callback(function (slot0)
			uv0(slot0:get(2))
		end)
	end

	slot17 = {
		["Extra Lean"] = {
			layer = 7,
			sequence = 228
		},
		Frogwalk = {
			layer = 7,
			sequence = 21
		},
		["FLY HACK"] = {
			layer = 7,
			sequence = 263
		}
	}
	slot18 = false

	uv6.set("mister", slot5, "void(__fastcall*)(uintptr_t, void*)", function (slot0, slot1, ...)
		if tonumber(slot1) == 0 then
			return
		end

		if not entity.get_local_player() then
			return slot0(slot1, ...)
		end

		if not slot2[0] or slot3 == 0 then
			return slot0(slot1, ...)
		end

		if ffi.cast("uintptr_t", slot3) == slot1 then
			slot0(slot1, ...)

			if uv0.build == "beta" and uv1.beta_options.main then
				slot5 = false

				if uv3 ~= -1 and globals.realtime < uv4 and uv5.Modifications.beta_options.options:get(2) then
					ffi.cast(ffi.typeof("$**", uv2), slot1 + 10640)[0][0].sequence = uv3
					slot8 = 0

					if uv6 < 0.645 then
						uv6 = uv6 + 0.005
						slot8 = uv6
					else
						slot8 = 0.645 + uv7
					end

					uv8 = uv9(uv8, slot8, 0.2)
					slot7.cycle = uv8
					uv7 = uv7 + 0.0005 * uv10

					if uv7 > 0.08 and uv10 == 1 then
						uv10 = -1
					end

					if uv7 < 0 and uv10 == -1 then
						uv10 = 1
					end

					slot5 = true
				end

				if not slot5 then
					slot8 = {}

					for slot12 = 1, #uv5.Modifications.beta_options.options:get() do
						if uv11[slot7[slot12]] and not slot8[slot13.layer] then
							slot14 = slot4[slot13.layer]
							slot8[slot13.layer] = true
							slot14.sequence = slot13.sequence
							slot14.weight = 1
						end
					end
				end
			end

			if not uv12.antiaim or #uv1.anim_breakers == 0 then
				if uv13 then
					uv13 = false

					uv14:override()
				end

				return slot0(slot1, ...)
			end

			if uv5.AntiAim.anim_breakers:get(1) then
				ffi.cast("float*", slot3 + 10104)[0] = 1

				uv14:override("Sliding")

				uv13 = true
			elseif uv13 then
				uv13 = false

				uv14:override()
			end

			if uv5.AntiAim.anim_breakers:get(2) then
				slot4[6] = 1
			end

			if uv5.AntiAim.anim_breakers:get(3) and ffi.cast("bool*", ffi.cast("uintptr_t*", slot3 + 39264)[0] + 265)[0] and not uv15 and uv16 > 8 and uv16 < 100 then
				slot4[12] = 0.5
			end

			return
		end

		slot0(slot1, ...)
	end)
end()

if slot10.build == "beta" then
	function ()
		slot0 = ffi.typeof("struct {float x, y, z;}")
		slot2 = utils.get_vfunc(2, ffi.typeof("$*(__thiscall*)(void*)", slot0))
		slot3 = ffi.cast(ffi.typeof("void(__thiscall*)(void*, $*)", slot0), uv0.rel_jmp("client.dll", "E8 ? ? ? ? 53 8D 45 F0"))
		slot4 = utils.get_vfunc(219, "void(__thiscall*)(void*, int)")
		slot5 = ffi.cast("int(__thiscall*)(void*, const char*)", uv0.rel_jmp("client.dll", "E8 ? ? ? ? 5E 83 F8 FF"))
		slot6 = {
			ffi.cast("void(__thiscall*)(void*, float*)", uv0.rel_jmp("client.dll", "E8 ? ? ? ? EB 19 8B 07")),
			ffi.cast("void(__thiscall*)(void*, float*)", uv0.rel_jmp("client.dll", "E8 ? ? ? ? EB 57 8D 44 24 24")),
			ffi.cast("void(__thiscall*)(void*, void*)", uv0.rel_jmp("client.dll", "E8 ? ? ? ? 8B 46 04 8D 4E 04 FF 50 28")),
			ffi.cast("void(__thiscall*)(void*)", uv0.rel_jmp("client.dll", "E8 ? ? ? ? 83 BE ? ? ? ? ? 74 16"))
		}

		uv0.set("ragdoll", uv0.rel_jmp(utils.opcode_scan("client.dll", "E8 ? ? ? ? 5F 5E 5D C2 04 00 8B 0D ? ? ? ? 81 F9 ? ? ? ?")), "void(__thiscall*)(void*)", function (slot0, slot1)
			if not uv0.beta_options.main or not uv1.Modifications.beta_options.options:get(1) then
				return slot0(slot1)
			end

			if ffi.cast("uintptr_t", slot1) == 0 then
				return slot0(slot1)
			end

			uv2[1](slot1, ffi.cast("float*", slot2 + 2695))
			uv2[2](slot1, ffi.cast("float*", slot2 + 2692))

			ffi.cast("int*", slot2 + 10429)[0] = 1

			if entity.get(slot1) == nil then
				return slot0(slot1)
			end

			if not slot3.m_hPlayer then
				return slot0(slot1)
			end

			if ffi.cast("bool*", ffi.cast("uintptr_t", slot4[0]) + 39700)[0] then
				uv2[3](ffi.cast("void*", slot4[0]), slot1)
			end

			slot8 = uv3(ffi.cast("void*", slot6 + 4))

			uv4(slot1, slot8[0])

			slot9 = ffi.cast("float*", slot1)
			slot9[75] = slot8.x
			slot9[76] = slot8.y
			slot9[77] = slot8.z

			if slot7[0] then
				uv2[4](slot5)
			end

			slot10 = utils.random_int(0, 1) == 0 and uv5(slot5, "deathpose_lowviolence") or 262

			uv6(slot1, slot10 == -1 and 232 or slot10)

			ffi.cast("int*", slot2 + 10400)[0] = 1
		end)
	end()
end

function ()
	slot0 = utils.get_vfunc("client.dll", "GameClientExports001", 3, "void(__thiscall*)(void*, int)")

	uv0.Misc.auto_unmute:RegisterCallback(function ()
		if uv0.auto_unmute then
			for slot3, slot4 in pairs(entity.get_players()) do
				uv1(slot4:get_index())
			end
		end
	end)
	uv2:add("player_connect_full", "auto unmute", function (slot0, slot1)
		if not uv0.misc or not uv1.auto_unmute then
			return
		end

		if not uv2.GetPlayerForUserID(slot0.userid) then
			return
		end

		if slot2 == slot1 then
			for slot6, slot7 in pairs(entity.get_players()) do
				uv3(slot7:get_index())
			end

			return
		end

		uv3(slot2:get_index())
	end)
end()
panorama.loadstring([[
        let entity_panels = {}
        let entity_data = {}
        let event_callbacks = {}

        let SLOT_LAYOUT = `
            <root>
                <Panel style="min-width: 3px; padding-top: 2px; padding-left: 0px;" scaling='stretch-to-fit-y-preserve-aspect'>
                    <Image id="smaller" textureheight="15" style="horizontal-align: center; opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; overflow: noclip; padding: 3px 5px; margin: -3px -5px;"  />
                    <Image id="small" textureheight="17" style="horizontal-align: center; opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; overflow: noclip; padding: 3px 5px; margin: -3px -5px;" />
                    <Image id="image" textureheight="21" style="opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; padding: 3px 5px; margin: -3px -5px; margin-top: -5px;" />
                </Panel>
            </root>
        `

        let _DestroyEntityPanel = function (key) {
            let panel = entity_panels[key]

            if(panel != null && panel.IsValid()) {
                var parent = panel.GetParent()
                let musor = parent.GetChild(0)

                musor.visible = true
                if(parent.FindChildTraverse("id-sb-skillgroup-image") != null) {
                    parent.FindChildTraverse("id-sb-skillgroup-image").style.margin = "0px 0px 0px 0px"
                }

                panel.DeleteAsync(0.0)
            }
            delete entity_panels[key]
        }

        let _DestroyEntityPanels = function() {
            for(key in entity_panels){
                _DestroyEntityPanel(key)
            }
        }

        let _GetOrCreateCustomPanel = function(xuid) {
            if(entity_panels[xuid] == null || !entity_panels[xuid].IsValid()){
                entity_panels[xuid] = null

                let scoreboard_context_panel = $.GetContextPanel().FindChildTraverse("ScoreboardContainer").FindChildTraverse("Scoreboard") || $.GetContextPanel().FindChildTraverse("id-eom-scoreboard-container").FindChildTraverse("Scoreboard")

                if(scoreboard_context_panel == null){
                    _Clear()
                    _DestroyEntityPanels()

                    return
                }

                scoreboard_context_panel.FindChildrenWithClassTraverse("sb-row").forEach(function(el){
                    let scoreboard_el

                    if(el.m_xuid == xuid) {
                        el.Children().forEach(function(child_frame){
                            let stat = child_frame.GetAttributeString("data-stat", "")
                            if(stat == "rank")
                                scoreboard_el = child_frame.GetChild(0)
                        })

                        if(scoreboard_el) {
                            let scoreboard_el_parent = scoreboard_el.GetParent()

                            let custom_icons = $.CreatePanel("Panel", scoreboard_el_parent, "custom-weapons", {
                            })

                            if(scoreboard_el_parent.FindChildTraverse("id-sb-skillgroup-image") != null) {
                                scoreboard_el_parent.FindChildTraverse("id-sb-skillgroup-image").style.margin = "0px 0px 0px 0px"
                            }

                            scoreboard_el_parent.MoveChildAfter(custom_icons, scoreboard_el_parent.GetChild(1))

                            let prev_panel = scoreboard_el_parent.GetChild(0)
                            prev_panel.visible = false

                            let panel_slot_parent = $.CreatePanel("Panel", custom_icons, `icon`)

                            panel_slot_parent.visible = false
                            panel_slot_parent.BLoadLayoutFromString(SLOT_LAYOUT, false, false)

                            entity_panels[xuid] = custom_icons

                            return custom_icons
                        }
                    }
                })
            }

            return entity_panels[xuid]
        }

        let _UpdatePlayer = function(entindex, path_to_image) {
            if(entindex == null || entindex == 0)
                return

            entity_data[entindex] = {
                applied: false,
                image_path: path_to_image
            }
        }

        let _ApplyPlayer = function(entindex) {
            let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(entindex)

            let panel = _GetOrCreateCustomPanel(xuid)

            if(panel == null)
                return

            let panel_slot_parent = panel.FindChild(`icon`)
            panel_slot_parent.visible = true

            let panel_slot = panel_slot_parent.FindChild("image")
            panel_slot.visible = true
            panel_slot.style.opacity = "1"
            panel_slot.SetImage(entity_data[entindex].image_path)

            return true
        }

        let _ApplyData = function() {
            for(entindex in entity_data) {
                entindex = parseInt(entindex)

                let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(entindex)

                if(!entity_data[entindex].applied || entity_panels[xuid] == null || !entity_panels[xuid].IsValid()) {
                    if(_ApplyPlayer(entindex)) {
                        entity_data[entindex].applied = true
                    }
                }
            }
        }

        let _Create = function() {
            event_callbacks["OnOpenScoreboard"] = $.RegisterForUnhandledEvent("OnOpenScoreboard", _ApplyData)
            event_callbacks["Scoreboard_UpdateEverything"] = $.RegisterForUnhandledEvent("Scoreboard_UpdateEverything", function(){
                _ApplyData()
            })
            event_callbacks["Scoreboard_UpdateJob"] = $.RegisterForUnhandledEvent("Scoreboard_UpdateJob", _ApplyData)
        }

        let _Clear = function() {
            entity_data = {}
        }

        let _Destroy = function() {
            // clear entity data
            _Clear()
            _DestroyEntityPanels()

            for(event in event_callbacks){
                $.UnregisterForUnhandledEvent(event, event_callbacks[event])

                delete event_callbacks[event]
            }
        }

        return {
            create: _Create,
            destroy: _Destroy,
            clear: _Clear,
            update_player: _UpdatePlayer,
            destroy_panel: _DestroyEntityPanels
        }
    ]], "CSGOHud")().create()

slot96 = function ()
	slot0 = panorama.GameStateAPI.GetPlayerXuidStringFromEntIndex

	return function (slot0)
		if not slot0 then
			return
		end

		if not uv0(slot0:get_index()) then
			return
		end

		if #slot1:sub(4, -1) == 0 then
			return
		end

		return 1.4483174291037683e-303 + tonumber(slot2)
	end
end()
slot97 = function ()
	ffi.cdef("        \tuint32_t GetModuleHandleA(const char* lpModuleName);\n        \tuint32_t GetProcAddress(uint32_t hModule, const char* lpProcName);\n        ")
	assert(ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("steamnetworkingsockets.dll"), "SteamNetworkingMessages_LibV2") ~= 0, "failed to get steam_networking_messages")

	slot3 = slot0
	slot5 = ffi.cast("void***", ffi.cast("void*(__thiscall*)()", slot2)())
	slot6 = ffi.cast(ffi.typeof("int(__thiscall*)(void*, const $&, const void *, uint32_t, int, int)", slot0), slot5[0][0])
	slot7 = ffi.cast(ffi.typeof("int(__thiscall*)(void*, int, $, int)", ffi.typeof("$* [?]", ffi.typeof([[
            struct {
                void* m_pData;
                int m_cbSize;
                unsigned int m_conn;
                $ m_identityPeer;
                int64_t m_nConnUserData;
                long long m_usecTimeReceived;
                int64_t m_nMessageNumber;
                void(__thiscall* m_pfnFreeData)(void*);
                void(__thiscall* m_pfnRelease)(void*);
                int m_nChannel;
                int m_nFlags;
                int64_t m_nUserData;
            }
        ]], ffi.typeof([[
            struct {
        		int m_eType;
        		int m_cbSize;
        		union {
        			uint64_t m_steamID64;
        			char m_szGenericString[ 32 ];
        			uint8_t m_genericBytes[ 32 ];
        			char m_szUnknownRawString[ 128 ];
        			void* m_ip;
        			uint32_t m_reserved[ 32 ];
        		};
        	}
        ]])))), slot5[0][1])
	slot8 = ffi.cast(ffi.typeof("bool(__thiscall*)(void*, const $&)", slot0), slot5[0][2])
	slot9 = ffi.cast(ffi.typeof("bool(__thiscall*)(void*, const $&)", slot0), slot5[0][3])
	slot10 = 2000

	return {
		send_message_to_user = function (slot0, slot1, slot2)
			slot3 = ffi.cast("uint64_t", slot0)
			slot5 = uv0()
			slot5.m_eType = 16
			slot5.m_cbSize = ffi.sizeof(slot3)
			slot5.m_steamID64 = slot3

			return uv1(uv2, slot5, ffi.cast("const char*", slot1), slot1:len(), 8, slot2 or uv3)
		end,
		receive_messages_on_channel = function (slot0)
			slot1 = uv0(1337)

			return uv1(uv2, slot0 or uv3, slot1, 1337), slot1
		end,
		close_connection_with_user = function (slot0)
			slot1 = ffi.cast("uint64_t", slot0)
			slot2 = uv0()
			slot2.m_eType = 16
			slot2.m_cbSize = ffi.sizeof(slot1)
			slot2.m_steamID64 = slot1

			return uv1(uv2, slot2)
		end,
		accept_session_with_user = function (slot0)
			slot1 = ffi.cast("uint64_t", slot0)
			slot2 = uv0()
			slot2.m_eType = 16
			slot2.m_cbSize = ffi.sizeof(slot1)
			slot2.m_steamID64 = slot1

			return uv1(uv2, slot2)
		end
	}
end()

function ()
	slot0 = {}
	slot2 = {
		Mishkat = 1,
		KuCJloTa1337 = 1,
		lenin = 1,
		Kikron = 1
	}

	function slot5(slot0)
		if not slot0 or not slot0:find("fa8a2f2ecbce2b23c7589a4543ff881c") then
			return
		end

		if not string.gmatch(slot0, "([^[[]+)([]]]+)")() or #slot1 == 0 then
			return
		end

		slot2, slot3 = pcall(uv0.parse, slot1)

		if not slot2 then
			return
		end

		return slot3
	end

	slot6 = {
		"acid",
		"acidb",
		"acid_dev"
	}
	slot9 = {
		"materials",
		"panorama",
		"images",
		"icons",
		"acidtech"
	}
	slot10 = {
		["acidb.png"] = "https://i.imgur.com/FntUDbe.png",
		["acid_dev.png"] = "https://i.imgur.com/BF6BBAk.png",
		["acid.png"] = "https://i.imgur.com/JuieUCH.png"
	}
	slot11 = function ()
		slot1 = ffi.cast("bool(__thiscall*)(void*, const char*, const char*)", ffi.cast("void***", utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011"))[0][10])

		return function (slot0)
			return uv0(uv1, slot0, nil)
		end
	end()

	return {
		update_local = function ()
			if entity.get_local_player() then
				slot1 = slot0:get_index()
				uv0[slot1] = {
					level = 8525,
					backup = -1337
				}

				uv1.update_player(slot1, ("file://{images}/icons/acidtech/%s.png"):format(uv2[uv3.username] and "acid_dev" or uv3.build ~= "beta" and "acid" or "acidb"))
			end
		end,
		clean_players = function ()
			for slot3, slot4 in pairs(entity.get_players()) do
				if uv0[slot4:get_index()] then
					table.remove(uv0, slot5)
				end
			end

			uv1.destroy_panel()
		end,
		send_messages = function ()
			uv0()

			for slot6, slot7 in pairs(entity.get_players()) do
				if slot7 ~= slot0 and uv4(slot7) then
					uv5.close_connection_with_user(slot8)
					uv5.send_message_to_user(slot8, "[[" .. uv3.stringify({
						hash = "fa8a2f2ecbce2b23c7589a4543ff881c",
						idx = entity.get_local_player():get_index(),
						version = uv1[uv2.username] and 3 or uv2.build == "beta" and 2 or 1
					}) .. "]]")
				end
			end
		end,
		download_images = function ()
			for slot5 = 1, #uv0 do
				slot6 = common.get_game_directory() .. "\\" .. uv0[slot5]

				files.create_folder(slot6)

				slot1 = slot6 .. "\\"
			end

			for slot6, slot7 in pairs(uv1) do
				if not uv2(slot1 .. slot6) then
					uv3("file didnt exist")

					if network.get(slot7) then
						files.write(slot8, slot9, true)
					end
				end
			end
		end,
		receive_messages = function ()
			slot0, slot1 = uv0.receive_messages_on_channel()

			for slot5 = 1, slot0 do
				if slot1[slot5 - 1][0] and uv1(ffi.string(slot6.m_pData)) and entity.get(slot7.idx) then
					uv2[slot7.idx] = {
						backup = -1337,
						level = slot7.version == 0 and 8524 or 8525
					}

					if uv3(slot8) then
						uv0.close_connection_with_user(slot9)
					end

					uv4.update_player(slot7.idx, ("file://{images}/icons/acidtech/%s.png"):format(uv5[slot7.version]))
				end
			end

			uv6()
		end,
		accept_connections = function ()
			for slot4, slot5 in pairs(entity.get_players()) do
				if slot5 ~= entity.get_local_player() and uv0(slot5) then
					uv1.accept_session_with_user(slot6)
				end
			end
		end
	}
end().download_images()

slot99 = false
slot100 = false

slot26:add("draw", "sync draw", function ()
	uv0 = uv1.misc and uv2.Misc.synchronization:get()

	if globals.is_connected and globals.is_in_game then
		if uv0 then
			if not uv3 then
				uv4.update_local()

				uv3 = true
			end
		elseif uv3 then
			uv5.clear()
			uv4.clean_players()

			uv3 = false
		end
	end
end)
slot26:add("shutdown", "sync shutdown", function ()
	uv0.clean_players()

	if uv1 and uv1.destroy then
		uv1.destroy()
	end
end)

slot26.breakpoints["sync round_end"] = -1

slot26:add("round_end", "sync round_end", function ()
	uv0.breakpoints["sync round_end"] = 0

	if uv1 then
		uv0.breakpoints["sync round_end"] = 1

		uv2.send_messages()
	else
		uv0.breakpoints["sync round_end"] = 2

		uv2.clean_players()
	end

	uv0.breakpoints["sync round_end"] = 3

	uv3.clear()

	uv0.breakpoints["sync round_end"] = 4
end)
slot26:add("round_prestart", "sync round_prestart", function ()
	if uv0 then
		uv1.accept_connections()
	end
end)
slot26:add("round_freeze_end", "sync round_freeze_end", function ()
	if uv0 then
		uv1.receive_messages()
	end
end)
slot26:add("level_init", "sync level init", function ()
	uv0.clear()
end)
function ()
	slot0 = utils.random_int
	slot1 = {
		start = {
			"бля",
			"ну",
			"ahah",
			"бляяя",
			"пизда",
			"туда",
			"куда летишь",
			"получил по башке",
			"1.",
			"ez",
			"ahah",
			"этот мув",
			"нормас",
			"норм",
			"впенил идиота",
			"всочнярил хуесоса",
			"ты мне в ширинку дышишь",
			"слава украини",
			"куда спрятался",
			"меня не убить",
			"опозорился",
			"разъебончик",
			"на здоровье",
			"дон лимон",
			"дон ватермелон",
			"stay acid"
		},
		mid = {
			"чмо",
			"name",
			"бич",
			"name",
			"долбаёб",
			"улетел на горшке",
			"пидорас",
			"слитый",
			"пролузавший",
			"тупорылый",
			"чмо",
			"униженный инвалид",
			"superior slow walk unhsble",
			"шлюха"
		},
		close = {
			"нах",
			"попущеный",
			"еблан ахах",
			"бля боже",
			"чё ты делаешь",
			"ahah",
			"оммг",
			"...",
			"учись играть",
			"хочешь бля мб поучиься играть у меня???",
			"мэлстрой бы не одобрил",
			"слишком просто для меня (◕‿◕)",
			"ХАХАХАХА (⌣̀_⌣́) ЗАПЕН",
			"я уже матёрый в этом деле",
			"никсвар>all"
		},
		v2 = {
			"0 ошибок",
			"stay acid шлюха •_•)",
			"всочнярил гавноеда",
			"лол, иди скиллуху треннируй, нубас",
			"униженный инвалид ты мне в ширинку дышишь",
			"найс аккаунт [̲̅$̲̅(̲̅1̅)̲̅$̲̅]",
			"нюхай пэнсел,баклан",
			"acidtech gang",
			"колики болики",
			"AcidTech.LUA НА СЕРВЕРЕ, ВСЕМ ОТОЙТИ НА БЕЗОПАСНОЕ РАССТОЯНИЕ",
			"~❤Твой|Растафарай❤~",
			"во смех, аж попой хрюкнул малёха",
			"У ПАРНЯ АА ОТ СКИТА ОТКАЗАЛИ КАК КЛАНТЕГ AcidTech УВИДЕЛИ ХАХАХАХАХА",
			"впитывай и терпи",
			"видно ты без AcidTech.lua, пора прикупить сыночек",
			"УВОЛЕН by AcidTech.lua",
			"нл сегодня подкован",
			"fipp#3882 напиши если фри кфг на нлку выдать",
			"джуманджа)",
			"пацан попутал берега и был пропенен",
			"зазевался и понюхал беброчки ( ͡ʘ ͜ʖ ͡ʘ)",
			"утро начинается с пули от асидтеч.луа",
			"не снимай подгузник, просто отодвинь его в сторону",
			"промолчишь?",
			"нежелательный окурок был наказан",
			"hs",
			"♛альфач на сервере♛",
			"ХАХАХАХА (；⌣̀_⌣́) ЗАПЕН",
			"все оправдания в пэнсел",
			"1.",
			"чел с кфг от резольвера, козяву глотаешь?",
			"немного напрудонил",
			"что за красота, среди это массовки",
			"огузок надристал со своей плеши",
			"прилоскал косматого ~(˘▾˘~)",
			"слава богу я юзаю AcidTech",
			"обоссал не взирая не последствия",
			"почухал попу пальчиком",
			"ну ты зверь",
			"вкусно?",
			"понюхай попу носиком, прикинься киса пёсиком",
			"куда спрятался, мама научила из шкафа подглядывать?",
			"меня не убить - superior slow walk unhsble",
			"парни, я и пёрнуть не успеваю, вы уже нюхаете",
			"чит оклемался можно и попенить",
			"парень, я вижу ты бедолага, зайди на форум там ща AcidTech номер 1",
			"ботик, ты про AcidTech.lua слыхал чето?",
			"опа, чит прогрел",
			"проучен.",
			"на виражике шлепок дал небольшой",
			"Malik163#6401 добавь в др, ищу друзей",
			"AcidTech показывает наглежа (◣_◢)",
			"опять один за тиммейтов всю работу сделал",
			"у кого скит предлогаю заснуть в попу пробку - ощущения те же, даже приятнее",
			"ты не умёха, гайды от KuCJloTa HvH посмотри",
			"я уже матёрый в этом деле",
			"тусня пошла (⌒‿⌒)",
			"опозорил чуханчика",
			"я подкован в этом",
			"мочканул наивного",
			"крем из писюхи ッ",
			"на куражике в гавнёху наступил",
			"Принцесса огорошена (o_O)",
			"люди сбежали в страхе... сервер прокачен...",
			"мочалка захотела раздрая и была запенина",
			"потому что гладиолус ¯\\_(ツ)_/¯",
			"бедолажный, понюхай мой acidtech:3",
			"натыкался я гдето на тебя, ты c клантегом chimera отсасывал?",
			"запенявочка на сервере",
			"разъебончик",
			"senpai~~~, заовни меня ^^",
			"на куражике",
			"пена так и хлещет",
			"копоть так и дымурится",
			"как относишься к ананасу на пицце?",
			"свинячий напен",
			"на здоровье",
			"подтрихамонозил",
			"отканифолил",
			"дон лимон",
			"закрыт потнявка",
			"хапнул забористого",
			"наказана \\(^O^)/",
			"МУЖИКИ Я КАБАН НЕ ШМАЛЯЙТЕ ХРИСТА РАДИ НЕ ГУБИТЕ",
			"чачка пипсов)))",
			"by асидтеч нубас",
			"AcidTech records",
			"ты чтото пёрнул? ОТКАЗАНО",
			"шальная залетела",
			"нихуя ты джентельмен, аж шляпа слетела",
			"сильно встал",
			"ровно двигаюсь",
			"прокачался сёдня, пенить буду",
			"вак в чат все дела",
			"8 6 4 2 ручка трахнула бобра",
			"после такой пули, у тебя порвались трусики",
			"МЫ РУССКИЕ - С НАМИ БОГ",
			"Что превращает девушку в женщину? Секс с витмой",
			"( ͡° ͜ʖ ͡°)",
			"задорная феня",
			"( ͡° ͜ʖ ͡°)Ɑ ̶͞ ̶͞ ̶͞ ̶͞ ﻝﮞ",
			" ЕССС -3 ЮХУУУУУ",
			"раз, два, три - попу подотри",
			"анансовый сироп, оп оп оп оп",
			"Пусть ваши печальки превратятся в ерундульки",
			"сися \\(^.^)/",
			"потяра, без оправданий только",
			"имбово кринжанул",
			"нелепая суета",
			"смачно дунул в пэнсел",
			"ёдрён картон",
			"а в попу больно?",
			"едрён батон, KAK JE YA JEBOSHY",
			"я обладатель - AcidTech.lua, оформи 3aгJloт фастом",
			"нахально отлимонил",
			"целуйте мои булки, я паПУЛЬКА",
			"дракакула(",
			"драчикула)",
			"накидал за шиворот",
			"Я ВСЁЛЫЙ ТАРАКАН, Я БЕГУ БЕГУ БЕГУ",
			"чухнул пенисом нахала",
			"♚ чик пук траляля ♚",
			"♛Ａｌｌ Ｆａｍｉｌｙ AcidTech♛",
			"в туза напихал",
			"присунул в ушко, ты моя подружка)",
			"лошара) я с нлом"
		}
	}
	slot2 = {
		w = "в",
		k = "к",
		l = "л",
		q = "к",
		c = "ц",
		v = "в",
		x = "кс",
		g = "г",
		r = "р",
		z = "з",
		n = "н",
		t = "т",
		f = "ф",
		d = "д",
		u = "у",
		a = "э",
		y = "ы",
		p = "п",
		m = "м",
		b = "б",
		e = "е",
		i = "и",
		s = "с",
		o = "о",
		h = "х",
		j = "ж"
	}

	function slot3(slot0)
		slot1 = ""
		slot2 = slot0:lower()
		slot3 = string.len(slot2)

		for slot8 = 1, #slot2 do
			slot4 = "" .. (uv0[slot2:sub(slot8, slot8)] or " ")
		end

		return slot4
	end

	function slot4()
		slot0 = ""

		for slot6 = 1, uv0(4, 10) do
			slot1 = "х" == "х" and "а" or "х"

			if uv0(0, 5) == 0 then
				slot0 = slot0 .. "ъ"
			end
		end

		if uv0(0, 5) == 0 then
			slot0 = slot0:upper()
		end

		return slot0
	end

	slot5 = {
		start = {
			"посмотрите",
			"ahah",
			"ваще",
			"жаун",
			"не забей",
			"st1vaha#9099 напиши если фри кфг на нлку выдать",
			"vitmoid#2845 добавь в др, ищу друзей",
			"пена так и хлещет",
			"МУЖИКИ Я КАБАН НЕ ШМАЛЯЙТЕ ХРИСТА РАДИ НЕ ГУБИТЕ"
		},
		mid = {
			"что этот",
			"ну этот",
			"ссаный",
			"лол",
			"ahah"
		},
		close = {
			"пытается сделать",
			"стараеться",
			"пыхтит",
			"муваеца смешно",
			"мув исполнил"
		},
		close_optional = {
			"бля",
			"ahah",
			"1x1 го",
			"еблан",
			"долбаёб"
		}
	}
	slot6 = {}

	function slot7(slot0)
		slot2 = uv0.mid[uv1(1, #uv0.mid)]
		slot3 = uv0.close[uv1(1, #uv0.close)]
		slot4 = uv0.close_optional[uv1(1, #uv0.close_optional)]
		slot5 = ("%s %s %s %s %s"):format(uv0.start[uv1(1, #uv0.start)] == "ahah" and uv2() or slot1, slot2 == "ahah" and uv2() or slot2, uv3(slot0), slot3 == "ahah" and uv2() or slot3, uv1(0, 2) == 0 and (slot4 == "ahah" and uv2() or slot4) or "")
		uv4.troll = {
			globals.realtime + slot5:len() * utils.random_float(0.1, 0.3),
			slot5
		}
	end

	function slot8(slot0)
		if uv0(0, 2) >= 1 then
			slot1 = uv1.v2[globals.tickcount % #uv1.v2 + 1]
			uv2.kill = {
				globals.realtime + slot1:len() * 0.075,
				slot1
			}

			return
		end

		slot2 = uv1.mid[uv0(1, #uv1.mid)]
		slot3 = uv1.close[uv0(1, #uv1.close)]
		slot4 = ("%s %s %s"):format(uv1.start[uv0(1, #uv1.start)] == "ahah" and uv3() or slot1, slot2 == "name" and uv4(slot0:get_name()) or slot2, slot3 == "ahah" and uv3() or slot3)
		uv2.kill = {
			globals.realtime + slot4:len() * 0.075,
			slot4
		}

		if uv0(0, 9) == 0 then
			uv5(slot0:get_name())
		end
	end

	slot9 = {
		start = {
			"что ты сделал",
			"?",
			"найс мув",
			"пизд ты конч",
			"найс подловил",
			"без дт не может",
			"просто +в",
			"бля",
			"на подпике",
			"еле убил",
			"почти хорошо",
			"тварюга",
			"оправдай мув",
			"ну",
			"gbpltw",
			",kznm",
			"тупой",
			"МЕНЯ ТПХНУЛО",
			"я стрельнул?",
			"гавноед",
			"яя в муте?",
			"ну тиммейт федука давит",
			"кердык",
			"что за вонь убила",
			"ты дт отжал?",
			"у меня одново серв лаг?",
			"найс автопик+миндмг",
			"бекшут?",
			"ты с соткой встал?",
			"ну ты зверь",
			"сидит предиктит",
			"онли боди чурка",
			"мразота потеет",
			"не потей",
			"ты с миндамагом пикнул?",
			"?",
			"у тебя пинк спайк?",
			"как ты дамаг выбил?",
			"нахуй ты это пикаешь?",
			"нахуй ты пикнул?",
			"мать ебал пидарас",
			"ты с соткой пикнул?",
			"ну фристендинг же не сработает",
			"чит делеит",
			"бля ну ты реально еблан",
			"ну нет",
			"сразу видно iq 14к юида",
			"S[DF[F[DF[SDF[SD[FSD[FDS[F[F[F[F",
			"да убогий хуесос",
			"у тебя скит?",
			"ну ты ебалоо",
			"да куда ты убил уёбок",
			"да опять уёбище убило",
			"ты из бийска?",
			"хорош доминик",
			"да у тебя мать шлюхендра",
			"не ужели долбаеб додумался пикнуть",
			"тиммейт ебу дал, просто смыслся нахуй",
			"у вас тоже loss поднялся?",
			"у кого после обновы sprid вылетает тоже",
			"долбаеб?",
			"это 100 dmg?"
		},
		mid = {
			"идиот",
			"долбаёб",
			"name",
			"ahah",
			"сын шлюхи",
			"сучара бля",
			"name",
			"ahah",
			"сын шлюхи",
			"долбоёбик",
			"свинья",
			"украинец ёбаный",
			"хуй",
			"мусор",
			"ник фикс",
			"кто тебе такой ник придумал??",
			"нейм фикс",
			"иди нахуй",
			"0 ошибок",
			"сочняра",
			"без скита",
			"крякер",
			"никс юзер",
			"ишак",
			"доминик",
			"армянин",
			"высер потный",
			"потная хуила",
			"ну глупый мочегон",
			"даже маут лучше тебя",
			"даже турки лучше тебя хвх играют",
			"оно же на лоу брейне играет",
			"да ссаный кончелыга",
			"чуркистан убогий",
			"ну глупый ребёнок",
			"мразь ебаная",
			"мусорила глупая",
			"пробка легитная",
			"зря сучонок"
		},
		close = {
			"1x1?",
			"дс кидай",
			"кинь кфг",
			"чё за луа",
			"1.",
			"конч",
			"кв??",
			"стату анматчеда кидай хуесос",
			"еле саб гетнул?",
			"коннект жду",
			"ну где тиммейты",
			"пизда твоему акку с лолза",
			"тебя стиваха не знает",
			"ты вообще читаешь что я пишу",
			"нл 1на1 вывезешь?",
			"ашалеееть",
			"ты сочный за тебя в чат луа пишет",
			"от сабки до сабки живёит",
			"я в ахуе",
			"не ливай",
			"я щас бекап позову",
			"я буду онли боди теперь",
			"ты хоть понял что сделал",
			"чучело спиной убило",
			"ОНО МЕНЯ БЕСИТ",
			"ему чит обновили",
			"найс 100 дмг онли",
			"очередной легитный еблан",
			"очередной подсос санчеза?",
			"а это не ты кв мне проиграл?",
			"я тебя трахну",
			"40к за инвайт оправдали себя",
			"нищита ебаная",
			"да тя даже стиваха перебайтит",
			"даже стиваха лучше тебя играет",
			"это не ты мне на анматчеде проиграл?",
			"это ты из бийска?",
			"пиздец сочники фанатят",
			"а брянск это внатуре город?",
			"ты из бийска?)",
			"это не ты букву z на лбу нарисовал?",
			"это не ты у фипа сабку покупал?",
			"загрузил доменик яв и вот те раз, увидимся в следующем раунде",
			"я что один в тиме блять",
			"мужики, я в муте?",
			"у меня тиммейты с никсом чтоли поголовно, откисают на раз два",
			"парни как в tub показ нла выключить",
			"да вы бля с предиктом чтоли ватруху гоняете",
			"скок ща в нле пинг ставить лучше"
		}
	}

	function slot10()
		slot5 = 4

		for slot5 = 1, uv0(1, slot5) do
			if "" == ")" then
				slot6 = uv0(0, 2) == 0 and "0" or ")"
				slot0 = "" .. slot6
				slot1 = slot6
			else
				slot0 = slot0 .. ")"
				slot1 = ")"
			end
		end

		return slot0
	end

	function slot11(slot0)
		if uv1(0, 2) == 0 then
			slot1 = uv0.start[uv1(1, #uv0.start)]:upper()
		end

		if uv0.mid[uv1(1, #uv0.mid)] == "name" then
			slot2 = uv2(slot0:get_name())
		elseif slot2 == "ahah" then
			slot2 = uv3()
		end

		if uv1(0, 2) == 0 then
			slot2 = slot2 .. uv4()
		end

		uv5.kill = {
			0
		}
		uv5.troll = {
			0
		}
		uv5["death #1"] = {
			globals.realtime + slot1:len() * 0.2,
			slot1
		}

		if uv1(0, 2) > 0 then
			uv5["death #2"] = {
				uv5["death #1"][1] + slot2:len() * 0.1,
				slot2
			}

			if uv1(0, 1) == 1 then
				slot3 = uv0.close[uv1(1, #uv0.close)]
				uv5["death #3"] = {
					uv5["death #2"][1] + 1 + #slot3 * utils.random_float(0.05, 0.2),
					slot3
				}
			end
		end
	end

	uv0:add("draw", "trashtalk run", function (slot0, slot1)
		if not uv0.misc or not uv1.trashtalk.main then
			return
		end

		for slot6, slot7 in pairs(uv2) do
			if slot7 and slot7[1] ~= 0 and slot7[1] < globals.realtime then
				if utils.random_int(0, 2) == 0 then
					utils.console_exec("say " .. slot7[2]:upper())
				else
					utils.console_exec("say " .. slot7[2])
				end

				uv2[slot6] = {
					0
				}
			end
		end
	end)

	slot12 = {
		"найс игра",
		"уёбище валв",
		"убило нахуй",
		"нищий валв",
		"надеюсь в сурс 2 пофиксят это",
		"ебать",
		"бляяяя убилооо"
	}
	slot13 = -1

	uv0:add("player_death", "trashtalk player death", function (slot0, slot1, slot2)
		if not slot1 or not uv0.misc or not uv1.trashtalk.main then
			return
		end

		if not entity.get_game_rules() then
			return
		end

		if slot3.m_bWarmupPeriod then
			return
		end

		slot6 = uv2.GetPlayerForUserID(slot0.attacker)

		if not uv2.GetPlayerForUserID(slot0.userid) or not slot6 or slot5 == nil or slot6 == nil then
			return
		end

		if slot5 == slot6 then
			return
		end

		if uv4 ~= -1 and uv3.Misc.trashtalk.talk:Get(3) and slot6 ~= slot1 and entity.get(uv4) == slot5 then
			uv5["death #1"] = nil
			uv5["death #2"] = nil
			uv5["death #3"] = nil
			uv5.killer = {
				globals.realtime + 0.4,
				"1."
			}
			uv4 = -1
		end

		if uv3.Misc.trashtalk.talk:Get(1) and slot6 == slot1 then
			uv6(slot5)
		end

		if slot5 == slot1 then
			if uv3.Misc.trashtalk.talk:Get(2) then
				if slot6:is_player() then
					uv7(slot6)
				elseif uv8(0, 3) == 0 then
					utils.execute_after(#uv9[uv8(1, #uv9)] * 0.1, function ()
						utils.console_exec("say " .. uv0)
					end)
				end
			end

			if slot7 and slot6:is_player() then
				uv4 = slot6:get_index()
			end
		end
	end)
	uv0:add("round_prestart", "trashtalk killer", function (slot0, slot1, slot2)
		uv0 = -1
		uv1 = {}
	end)
end()
function ()
	function slot1()
		if uv0.misc and uv1.Misc.view_model.main:get() then
			cvar.viewmodel_fov:int(uv1.Misc.view_model.fov:get(), true)
			cvar.viewmodel_offset_x:float(uv1.Misc.view_model.offset_x:get() / 15, true)
			cvar.viewmodel_offset_y:float(uv1.Misc.view_model.offset_y:get() / 15, true)
			cvar.viewmodel_offset_z:float(uv1.Misc.view_model.offset_z:get() / 15, true)
		else
			uv2()
		end
	end

	uv2.Misc.view_model.main:RegisterCallback(slot1)
	uv2.Misc.view_model.fov:RegisterCallback(slot1)
	uv2.Misc.view_model.offset_x:RegisterCallback(slot1)
	uv2.Misc.view_model.offset_y:RegisterCallback(slot1)
	uv2.Misc.view_model.offset_z:RegisterCallback(slot1)
	uv2.Misc.main:RegisterCallback(slot1)
	slot1()
	uv3:add("destroy", "view model fix", function ()
		cvar.viewmodel_fov:int(uv0.fov, true)
		cvar.viewmodel_offset_x:float(uv0.viewmodel_offset_x, true)
		cvar.viewmodel_offset_y:float(uv0.viewmodel_offset_y, true)
		cvar.viewmodel_offset_z:float(uv0.viewmodel_offset_z, true)
	end)
end()
function ()
	ffi.cdef("        uintptr_t GetForegroundWindow();\n        int FlashWindow(void* hWnd, int bInvert);\n    ")

	function slot0()
		if not entity.get_game_rules() or slot0 == nil or slot0.m_bIsValveDS then
			return
		end

		if ffi.cast("void*", (ffi.cast("uintptr_t***", ffi.cast("uintptr_t", utils.opcode_scan("engine.dll", "8B 0D ? ? ? ? 85 C9 74 16 8B 01 8B")) + 2)[0][0] + 2)[0]) ~= ffi.C.GetForegroundWindow() then
			ffi.C.FlashWindow(slot2, 0)
		end
	end

	uv0:add("round_prestart", "wanignging", function ()
		if uv0.round_warning then
			uv1()
		end
	end)
	uv0:add("round_freeze_end", "wanignging1", function ()
		if uv0.round_warning then
			uv1()
		end
	end)
end()
function ()
	slot0 = panorama.loadstring([[
	    let check_chat = function(){
	    	let chat = $.GetContextPanel().FindChildTraverse("HudChat")
            if (!chat) return;

            return chat.visible
	    }

        let set_chat = function(to){
            let panel1 = $.GetContextPanel().FindChildTraverse("HudLowerLeft")
            if (!panel1) return;

            let panel2 = panel1.FindChildTraverse("Status")
            if (!panel2) return;

            let panel3 = panel2.FindChildTraverse("StatusPanel")
            if (!panel3) return;

            for (let i = 1; i < 228; i++){
                let th = panel3.GetChild(i)
                if (th)
                    th.visible = to
            }
	    }

        let check_smth = function (smth) {
            let panel = $.GetContextPanel().FindChildTraverse("HudLowerLeft")
            if (panel)
                panel.visible = smth
        }

        let get_is_player_muted = function (idx) {
            let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(idx)
            if (!xuid)
                return false

            return GameStateAPI.IsSelectedPlayerMuted(xuid)
        }

        return {
            get_chat_visible: check_chat,
            set_chat_visible: set_chat,
            check_smth1: check_smth,
            get_is_player_muted: get_is_player_muted
        }
    ]], "CSGOHud")()
	slot1 = render.load_font("Calibri", 18, "adbu")
	slot2 = {}
	slot3 = vector(30, uv0.screen_size.y - 120)
	slot4 = color(230, 230, 230, 255)
	slot5 = color(0, 0, 0, 100)
	slot6 = color(0, 0, 0, 0)

	uv1:add("destroy", "simple chat destroy", function ()
		uv0.set_chat_visible(true)
	end)
	uv1:add("draw", "simple chat", function (slot0, slot1)
		if not uv0.simple_chat.main then
			return
		end

		if #uv1 == 0 or not globals.is_in_game or uv2.get_chat_visible() then
			return
		end

		slot3 = globals.realtime
		slot4 = globals.frametime * 5
		slot5 = 0

		for slot9 = slot2, 1, -1 do
			if not uv1[slot9] then
				-- Nothing
			else
				slot11 = slot10.exp < slot3
				slot10.animation = slot10.animation + (slot11 and -1 or 1) * slot4
				slot10.animation = math.clamp(slot10.animation, 0, 1)
				slot12 = slot10.animation

				if not slot11 or slot12 ~= 0 then
					slot13 = slot12 * slot10.rows + 4
					slot5 = slot5 - (slot11 and -slot13 + 6 + slot10.rows * 2 or slot13)
					slot14 = uv3 + vector(0, slot5 - 3)
					slot15 = slot14 + vector(slot10.text_size, 0)
					slot16 = uv4:alpha_modulate(slot12 * 75)

					render.gradient(slot14, slot14 + vector(slot10.text_size, slot13), uv5, slot16, uv5, slot16)
					render.gradient(slot15, slot15 + vector(slot10.text_size_msg, slot13), slot16, uv5, slot16, uv5)
					render.text(uv6, uv3 + vector(0, slot5), slot10.clr:alpha_modulate(255 * slot12), "d", slot10.name)
					render.text(uv6, uv3 + vector(slot10.text_size, slot5), uv7:alpha_modulate(255 * slot12), "d", slot10.text)
				end
			end
		end
	end)

	slot7 = {
		[2] = color(255, 225, 150, 255),
		[3] = color(160, 200, 255, 255)
	}

	function slot8()
		uv0.simple_chat.main = uv1.Modifications.simple_chat.main:get()

		uv2.set_chat_visible(not uv0.simple_chat.main)
	end

	uv1:add("player_say", "simple chat push", function (slot0)
		if not uv0.simple_chat.main then
			return
		end

		uv1()

		if not slot0.text then
			return
		end

		if uv2.GetPlayerForUserID(slot0.userid) == nil then
			return
		end

		if uv3.get_is_player_muted(slot1:get_index()) then
			return
		end

		if not slot1:get_name() then
			return
		end

		slot6 = 1

		for slot10 = 1, tostring(slot0.text):len() do
			if slot10 % 60 == 0 and slot5 > slot6 * 70 then
				if slot6 < 3 then
					slot3 = "" .. slot4:sub(slot10, slot10) .. "\n"
					slot6 = slot6 + 1
				else
					slot3 = slot3 .. "..."

					break
				end
			end
		end

		if #slot3 < 1 then
			return
		end

		if not uv4[slot1.m_iTeamNum] then
			slot2 = "*SPEC* " .. slot2
		elseif not slot1:is_alive() then
			slot2 = "*DEAD* " .. slot2
		end

		uv5[#uv5 + 1] = {
			animation = 0,
			name = slot2 .. " : ",
			text = slot3,
			clr = slot7 or uv6.Modifications.simple_chat.color3:get(),
			exp = globals.realtime + 15,
			rows = slot6 * uv7.height,
			text_size = render.measure_text(uv7, "", slot2 .. " : ").x,
			text_size_msg = render.measure_text(uv7, "", slot3).x + 20
		}

		for slot12 = 1, #uv5 do
			if uv5[slot12] and globals.realtime < uv5[slot12].exp then
				slot8 = 0 + 1
			else
				table.remove(uv5, slot12)
			end
		end

		if slot8 > 7 then
			for slot12 = 1, #uv5 do
				if globals.realtime < uv5[slot12].exp then
					uv5[slot12].exp = globals.realtime

					break
				end
			end
		end
	end)
	uv3.Modifications.simple_chat.main:RegisterCallback(slot8)

	function slot9()
		uv0[2] = uv1.Modifications.simple_chat.color2:get()
		uv0[3] = uv1.Modifications.simple_chat.color1:get()
	end

	uv3.Modifications.simple_chat.color1:RegisterCallback(slot9)
	uv3.Modifications.simple_chat.color2:RegisterCallback(slot9)
	slot8()
	slot9()
	uv3.Modifications.simple_chat.font_height:set_callback(function (slot0)
		uv0:set_size(slot0:get())

		uv1 = {}
	end)
end()
function ()
	slot0 = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)")
	slot1 = false

	function slot2(slot0)
		table.foreach(materials.get_materials("vgui/hud/800"), function (slot0, slot1)
			slot1:color_modulate(uv0)
			slot1:alpha_modulate(uv0.a / 255)
		end)
		table.foreach(materials.get_materials("vgui_white"), function (slot0, slot1)
			slot1:color_modulate(uv0)
			slot1:alpha_modulate(uv0.a / 255)
		end)
	end

	function slot4()
		if not uv0 then
			uv1(uv2.console_color.color)

			uv0 = true
		end
	end

	cvar.toggleconsole:set_callback(function ()
		if not uv0.console_color.main then
			return
		end

		uv1()
	end)
	uv1.Modifications.console_color.color:RegisterCallback(function ()
		if uv0.console_color.main then
			uv1 = false
		end
	end)
	uv2:add("draw", "console color", function ()
		if not uv0.console_color.main or not uv1() then
			return uv2()
		end

		uv3()
	end)
	uv2:add("destroy", "console color 1", function ()
		if uv0 then
			uv1(color())

			uv0 = false
		end
	end)
end()
function ()
	slot0 = {}

	function slot1(slot0)
		uv1 = {}

		for slot5, slot6 in pairs(uv0.Modifications.mega_optimized.options:Get()) do
			uv1[slot6] = uv0.Modifications.mega_optimized.main:Get() and slot0 ~= true
		end

		for slot5, slot6 in pairs(uv2) do
			if uv1[slot5] then
				if type(slot6.cvar) == "table" then
					for slot10 = 1, #slot6.cvar do
						slot6.cvar[slot10]:int(slot6.new_val[slot10], true)
					end
				else
					slot6.cvar:int(slot6.new_val, true)
				end
			elseif type(slot6.cvar) == "table" then
				for slot10 = 1, #slot6.orig_val do
					slot6.cvar[slot10]:int(slot6.orig_val[slot10], true)
				end
			else
				slot6.cvar:int(slot6.orig_val, true)
			end
		end
	end

	uv0.Modifications.mega_optimized.main:RegisterCallback(slot1)
	uv0.Modifications.mega_optimized.options:RegisterCallback(slot1)
	uv2:add("round_prestart", "fps optimize", slot1)

	slot2 = false

	events.draw_model:set(function (slot0)
		if not slot0.entity or slot1 == nil then
			return
		end

		if not entity.get_local_player() then
			return
		end

		if not (slot2:is_alive() and slot2 or slot2.m_hObserverTarget) then
			return
		end

		if not uv0.Teammates then
			return
		end

		if slot1.m_iTeamNum == slot2.m_iTeamNum and slot1 ~= slot2 then
			slot1.m_iPrimaryAddon = 0
			slot1.m_iSecondaryAddon = 0
			slot1.m_iAddonBits = 0

			return false
		end

		if slot1.m_hOwner ~= nil and not slot4:is_enemy() and slot4 ~= slot2 then
			return false
		end

		if slot1.m_hCombatWeaponParent and slot5.m_hOwner ~= nil and not slot6:is_enemy() and slot6 ~= slot2 then
			return false
		end
	end)
	uv2:add("destroy", "fps optimize 1", function ()
		uv0(true)
	end)
	slot1()
end()
function ()
	slot0 = globals.tickinterval
	slot1 = cvar.inferno_flame_lifetime:float()
	slot2 = {}
	slot3 = {}

	uv0:add("draw", "grenade radius", function (slot0, slot1)
		if not uv0.grenade_radius.main or uv0.grenade_radius.options and #uv0.grenade_radius.options == 0 then
			return
		end

		slot2 = nil

		if slot1 then
			slot2 = slot0
		elseif slot0 then
			slot2 = slot0.m_hObserverTarget
		end

		if not slot2 then
			return
		end

		slot3 = slot2:get_origin()
		slot4 = globals.realtime
		slot5 = globals.tickcount

		if uv1.Modifications.grenade_radius.options:get(1) then
			slot6 = {
				slot7:Get(),
				slot7:Get()
			}
			slot7 = uv1.Modifications.grenade_radius.fire_color
			slot7 = uv1.Modifications.grenade_radius.fire_color1
			slot7 = slot2.m_iTeamNum

			entity.get_entities("CInferno", false, function (slot0)
				if not slot0:get_origin() then
					return
				end

				if not uv0[slot0:get_index()] then
					uv0[slot2] = {
						0,
						vector(),
						0,
						175,
						slot0.m_nFireEffectTickBegin + uv1 * 64
					}
				end

				if uv0[slot2][3] < uv2 then
					slot4 = {
						[slot8] = slot1 + vector(slot0.m_fireXDelta[slot8 - 1], slot0.m_fireYDelta[slot8 - 1], 0)
					}

					for slot8 = 1, 20 do
					end

					slot5 = 0
					slot6 = 1
					slot7 = 1

					for slot11 = 1, 20 do
						for slot15 = 1, 20 do
							if slot5 < slot4[slot11]:dist(slot4[slot15]) then
								slot5 = slot16
								slot7 = slot15
								slot6 = slot11
							end
						end
					end

					if slot5 == 0 then
						return
					end

					slot3[2] = (slot4[slot6] + slot4[slot7]) / 2
					slot3[3] = uv2 + 0.5
					slot3[4] = slot5 * 0.65
				end

				slot4 = slot3[5] - uv3
				slot3[1] = uv4(slot3[1], slot3[4], 0.05)
				slot5 = slot3[1]
				slot6 = slot3[2]
				slot7 = 1

				if uv5 then
					slot7 = uv5:dist(slot1) > 500 and math.clamp(15 / (slot8 - 500), 0, 1) or 1
				end

				slot8 = uv6[1]

				if slot0.m_hOwnerEntity and slot9.m_iTeamNum == uv7 and slot9 ~= uv8 then
					slot8 = uv6[2]
				end

				render.circle_3d_outline(slot6, slot8:alpha_modulate(slot8.a * slot7 * (slot4 < 15 and slot4 / 15 or 1)), slot5, 0, 1, 1.3)

				if slot4 <= 0 then
					uv0[slot2] = nil
				end
			end)
		end

		if uv1.Modifications.grenade_radius.options:get(2) then
			slot6 = uv1.Modifications.grenade_radius.smoke_color:Get()

			entity.get_entities("CSmokeGrenadeProjectile", false, function (slot0)
				if not slot0:get_origin() or slot0.m_nSmokeEffectTickBegin == 0 then
					return
				end

				if not uv0[slot0:get_index()] then
					uv0[slot2] = {
						0,
						slot0.m_nSmokeEffectTickBegin + math.floor(17.55 / uv1)
					}
				end

				slot3 = uv0[slot2]
				slot3[1] = uv2(slot3[1], 125, 0.05)
				slot4 = 1

				if uv3 then
					slot4 = uv3:dist(slot1) > 850 and math.clamp(15 / (slot5 - 850), 0, 1) or 1
				end

				render.circle_3d_outline(slot1, uv5:alpha_modulate(uv5.a * slot4 * (slot3[2] - uv4 < 15 and slot5 / 15 or 1)), slot3[1], 0, 1, 1.3)

				if slot5 <= 0 then
					uv0[slot2] = nil
				end
			end)
		end
	end)
end()

slot102 = table.concat
slot103 = new_class():struct("info")({
	screen_size = render.screen_size()
}):struct("draw")({
	field = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		slot8 = slot7

		render.shadow(slot1 - vector(0, slot6), slot1 + slot2, slot5, 32, 0, slot8)
		render.rect(slot1, slot1 + slot2, slot4, slot8)

		if slot6 ~= 0 then
			render.rect(slot1 - vector(-slot8, slot6), slot1 + vector(slot2.x - slot8, 0), slot3, 0)

			if slot8 ~= 0 then
				render.circle_outline(slot1 + vector(slot8, slot8), slot3, slot8 + slot6, -180, 0.25, slot6)
				render.circle_outline(slot1 + vector(slot2.x - slot8, slot8), slot3, slot8 + slot6, -90, 0.25, slot6)

				slot10 = slot3:alpha_modulate(0)
				slot11 = slot6 / 2 - 1

				render.gradient(slot1 - vector(slot6, -slot8), slot1 + vector(0, slot8 + 10), slot3, slot3, slot10, slot10)
				render.gradient(slot1 + vector(slot2.x, slot8), slot1 + vector(slot2.x + slot6, slot8 + 10), slot3, slot3, slot10, slot10)
			end
		end
	end
})

function slot104(slot0, slot1)
	if slot1 < slot0:len() then
		slot0 = slot0:sub(0, slot1) .. "..."
	end

	return slot0
end

function slot105(slot0, slot1, slot2, slot3)
	return slot2 * (math.pow(slot0 / slot3 - 1, 5) + 1) + slot1
end

slot106 = slot10.build == "beta" and " [beta]" or ""
slot107 = slot28.find("Miscellaneous", "Main", "Other", "Windows")
slot108 = 0
slot109 = 0
slot110 = 0
slot111 = "0 fps"
slot112 = cvar.cl_updaterate
slot113 = nil
slot114 = utils.get_vfunc("engine.dll", "VEngineClient014", 78, "void*(__thiscall*)(void*)")
slot115 = utils.get_vfunc(25, "void(__thiscall*)(void*, float*, float*, float*)")
slot116 = ffi.typeof("float[1]")

function slot113()
	if uv0() == nil then
		return 0, 0
	end

	slot1 = uv1()
	slot2 = uv1()

	uv2(slot0, slot1, slot2, uv1())

	return tonumber(slot1[0]), tonumber(slot2[0])
end

slot114 = {
	color(255, 255, 255, 255),
	color(255, 31, 31, 255),
	color(255, 125, 31, 255),
	color(255, 255, 31, 255)
}

function slot115(slot0, slot1, slot2, slot3, slot4)
	if slot1 == 0 then
		return uv0[1]
	end

	if slot4 < uv1(slot1 - slot0) / slot1 then
		return uv0[2]
	end

	if slot3 < slot6 then
		return uv0[3]
	end

	if slot2 < slot6 then
		return uv0[4]
	end

	return uv0[1]
end

slot116 = nil

network.get("https://i.imgur.com/6viN9T2.png", {}, function (slot0)
	if slot0 then
		uv0 = render.load_image(slot0, vector(64, 64))
	end
end)

slot117 = new_class():struct("ui")({
	parent = slot32:SetupGroup(slot44, slot38.tabs.Widgets),
	get_colors = function (slot0, slot1)
		slot2 = {
			slot1:to_hsv()
		}
		slot3 = (slot2[2] * 255 - 85) / 255

		return color():as_hsv(slot2[1], math.max(0, slot3), slot2[3] + (slot3 < 0 and -slot3 or 0), 1), slot1
	end
}):struct("watermark")({
	menu = {},
	anims = {
		new_alpha_req = 1,
		requested_size_x = 125,
		global_alpha = 0,
		size_x = 0
	},
	initialize = function (slot0)
		slot0.menu.main = uv0.Visuals.velocity_warning.items
		slot0.menu.parent = slot0.menu.main:create()
		slot1 = slot0.menu.parent
		slot0.menu.accent = slot1:color_picker("Accent", color(167, 167, 255, 255))
		slot0.menu.accent1 = slot1:color_picker("Gradient", color())
		slot0.menu.shadow = slot1:color_picker("Shadow", color(167, 167, 255, 125))
		slot0.menu.background = slot1:color_picker("Background", color(17, 17, 17, 125))

		slot1:label(" ")

		slot0.menu.elements = slot1:selectable("Elements", {
			"Title",
			"Username",
			"Latency",
			"Time"
		})

		slot1:label(" ")

		slot0.menu.rounding = slot1:slider("Rounding", 0, 10, 4, 1, "px")
		slot0.menu.thickness = slot1:slider("Thickness", 1, 10, 2, 1, "px")
		slot0.menu.backup = nil
	end,
	update_time = globals.realtime,
	update_time_sv = globals.realtime,
	update_time_var = globals.realtime,
	update_time_ping = globals.realtime,
	reset_backup = function (slot0)
		if slot0.menu.backup ~= nil then
			slot1 = uv0(uv1:get_override() or uv1:get())
			slot1.Watermark = slot0.menu.backup

			uv1:override(uv2(slot1))

			slot0.menu.backup = nil
		end
	end,
	draw = function (slot0)
		slot1 = uv0.Visuals.velocity_warning.main:Get() and uv0.Visuals.velocity_warning.items:Get(1)

		if uv0.Visuals.velocity_warning.elements:get() == nil then
			return
		end

		if #slot2 - 1 == -1 then
			slot1 = false
		end

		slot0.anims.global_alpha = uv1(slot0.anims.global_alpha, slot1 and slot0.anims.new_alpha_req or 0, 0.1)

		if slot0.anims.global_alpha == 0 then
			return slot0:reset_backup()
		end

		slot5 = uv2(uv3:get_override() or uv3:get())

		if slot0.menu.backup == nil then
			slot0.menu.backup = slot5.Watermark
			slot5.Watermark = false

			uv3:override(uv4(slot5))
		end

		slot0.anims.size_x = uv1(slot0.anims.size_x, slot0.anims.requested_size_x, 0.075)
		slot8 = vector(uv5.info.screen_size.x - vector(slot0.anims.size_x, 21).x - 10, 9)
		slot9 = uv0.Visuals.velocity_warning.accent:Get()
		slot10 = uv6 and color(0, 0) or color(17, 17, 17, slot4 * 145)
		slot11, slot12 = slot0.ui:get_colors(slot9)
		slot13 = slot9:alpha_modulate(slot9.a * slot4)
		slot14 = uv0.Visuals.velocity_warning.rounding:get()
		slot15 = slot12:alpha_modulate(slot12.a * slot4 * (uv6 and 0 or 1))

		if uv6 then
			slot17 = slot9:alpha_modulate(0)
			slot18 = slot8 - vector(21, 0)
			slot19 = slot8 + vector(slot7.x, 21)

			render.rect(slot18, slot19, color(17, 17, 17, slot4 * 145), slot14)
			render.shadow(slot18, slot19, slot12:alpha_modulate(slot12.a * slot4), 32, 0, slot14)
			render.texture(uv6, slot8 - vector(19, 0), vector(22, 22), color(255, 255, 255, slot4 * 255))

			slot16 = "" .. "· "
		end

		uv5.draw:field(slot8, slot7, slot13, slot10:alpha_modulate(slot10.a * slot4), slot15, 0, slot14, uv6)

		if uv2(slot2).Title then
			slot19 = slot11
			slot16 = slot16 .. uv7(slot9:alpha_modulate(slot4 * 255), slot19:alpha_modulate(slot19.a * slot4), "neverlose") .. "DEFAULT" .. uv8 .. (slot3 > 0 and " · " or "")
			slot3 = slot3 - 1
		end

		if slot17.Username then
			slot16 = slot16 .. (uv9(uv0.Visuals.velocity_warning.custom_name:get(), 30) == "" and uv10.username or slot18) .. (slot3 > 0 and " · " or "")
			slot3 = slot3 - 1
		end

		slot18 = globals.realtime

		if slot17.Latency then
			if slot0.ping == nil or slot0.update_time_ping < slot18 then
				slot0.ping = "local"

				if utils.net_channel() and not slot19.is_loopback then
					if uv11:float() > 0.001 then
						slot0.ping = math.max(0, math.floor((slot19.avg_latency[1] + -0.5 / slot20) * 1000)) .. "ms"
					else
						slot0.ping = math.max(0, math.floor(slot19.avg_latency[1] * 1000)) .. "ms"
					end
				end

				slot0.update_time_ping = slot18 + 2
			end

			slot16 = slot16 .. slot0.ping .. (slot3 > 0 and " · " or "")
			slot3 = slot3 - 1
		end

		if slot17.FPS then
			if globals.tickcount % 64 == 0 or uv12 == 0 then
				uv12 = 0.9 * uv12 + 0.1 * globals.absoluteframetime

				if uv12 < 0 then
					uv12 = 1
				end

				uv13 = 1 / uv12
			end

			uv14 = uv1(uv14, uv13, 0.1, 0.5)
			uv15 = math.floor(uv14) <= 70 and "" .. color(255, 117, 117):lerp(color(255, 0, 0), math.min(1, 1 - (slot19 - 60) / 10)):to_hex() .. slot19 or slot19
			slot16 = slot16 .. uv15 .. "fpsDEFAULT" .. (slot3 > 0 and " · " or "")
			slot3 = slot3 - 1
		end

		if slot17["Server Framerate"] then
			if not slot0.sv or slot0.update_time_sv < slot18 then
				slot19, slot20 = uv16()
				slot21 = uv17[1]

				if slot19 > globals.tickinterval + 0.0001 then
					slot21 = uv18(slot19, slot22, 0.25, 0.5, 0.75)
				end

				slot0.sv = ("%ssv: %.1f (%.1fms)DEFAULT"):format(slot21:to_hex(), slot19 * 1000, slot20 * 1000)
				slot0.update_time_sv = slot18 + 1
			end

			slot16 = slot16 .. slot0.sv .. (slot3 > 0 and " · " or "")
			slot3 = slot3 - 1
		end

		if slot17.Time then
			if not slot0.time or slot0.update_time < slot18 then
				slot19 = common.get_system_time()
				slot0.time = ("%02d:%02d"):format(slot19.hours, slot19.minutes)
				slot0.update_time = slot18 + 5
			end

			slot16 = slot16 .. slot0.time .. (slot3 > 0 and " · " or "")
			slot3 = slot3 - 1
		end

		render.push_clip_rect(slot8, slot8 + slot7 - vector(0, 4))
		render.text(1, slot8 + vector(7, 4), color(255, 255 * slot4), "", slot16)
		render.pop_clip_rect()

		slot0.anims.requested_size_x = render.measure_text(1, "", slot16).x + 13
	end
}):struct("keybinds")({
	drag = slot65.add("keybinds", vector(100, 100), vector(125, 22)),
	menu = {},
	initialize = function (slot0)
		slot0.menu.main = slot0.ui.parent:switch("Keybinds")
		slot0.menu.parent = slot0.menu.main:create()
		slot1 = slot0.menu.parent
		slot0.menu.accent = slot1:color_picker("Accent", color(167, 167, 255, 255))
		slot0.menu.shadow = slot1:color_picker("Shadow", color(167, 167, 255, 125))
		slot0.menu.background = slot1:color_picker("Background", color(17, 17, 17, 125))

		slot1:label(" ")

		slot0.menu.rounding = slot1:slider("Rounding", 0, 10, 4, 1, "px")
		slot0.menu.thickness = slot1:slider("Thickness", 1, 10, 2, 1, "px")
		slot0.menu.backup = nil
	end,
	anims = {
		requested_size_x = 125,
		global_alpha = 0,
		size_x = 125,
		binds = {}
	},
	reset_backup = function (slot0)
		if slot0.menu.backup ~= nil then
			slot1 = uv0(uv1:get_override() or uv1:get())
			slot1.Hotkeys = slot0.menu.backup

			uv1:override(uv2(slot1))

			slot0.menu.backup = nil
		end
	end,
	draw = function (slot0)
		slot2 = nil
		slot3 = false

		if uv0.Visuals.velocity_warning.main:Get() and uv0.Visuals.velocity_warning.items:Get(2) then
			for slot7, slot8 in pairs(uv1.get_binds()) do
				if not slot0.anims.binds[slot8.name] then
					slot0.anims.binds[slot9] = {
						anim = 0,
						type = type(slot8.value)
					}
				end

				if slot8.active then
					slot3 = true

					break
				end
			end
		end

		slot4 = uv1.get_alpha()
		slot0.anims.global_alpha = uv2(slot0.anims.global_alpha, slot1 and (slot4 > 0 or slot3) and 1 or 0, 0.1)
		slot5 = slot0.anims.global_alpha

		if slot4 ~= 0 and slot1 and not slot3 then
			slot0.anims.global_alpha = slot4
			slot5 = slot4
		end

		if not slot1 then
			slot0:reset_backup()
		end

		if slot5 == 0 then
			return
		end

		slot6 = uv3(uv4:get_override() or uv4:get())

		if slot0.menu.backup == nil and slot1 then
			slot0.menu.backup = slot6.Hotkeys
			slot6.Hotkeys = false

			uv4:override(uv5(slot6))
		end

		slot7 = slot0.drag:process()
		slot0.anims.size_x = uv2(slot0.anims.size_x, slot0.anims.requested_size_x, 0.075)
		slot7.size.x = slot0.anims.size_x
		slot8 = uv0.Visuals.velocity_warning.accent:Get()
		slot9 = color(17, 17, 17, 145)
		slot10, slot11 = slot0.ui:get_colors(slot8)
		slot12 = slot7.position
		slot13 = slot7.size

		uv6.draw:field(slot12, slot13, slot8:alpha_modulate(slot8.a * slot5), slot9:alpha_modulate(slot9.a * slot5), slot11:alpha_modulate(slot11.a * slot5), 0, uv0.Visuals.velocity_warning.rounding:get())
		render.text(1, slot12 + slot13 / 2 - vector(0, 1), color(255, 255 * slot5), "c", "keybinds")

		slot14 = 27
		slot0.anims.requested_size_x = 125

		if not slot2 then
			return
		end

		slot15 = 0

		for slot19, slot20 in pairs(slot2) do
			if not slot0.anims.binds[slot20.name] then
				slot0.anims.binds[slot21] = {
					anim = 0,
					type = type(slot20.value)
				}
			end

			slot23.anim = uv2(slot0.anims.binds[slot21].anim, slot20.active and 1 or 0, 0.1)

			if 255 * slot5 * slot23.anim ~= 0 then
				slot26 = nil

				if slot23.type == "table" then
					slot26 = ""

					for slot30, slot31 in pairs(slot22) do
						slot26 = uv7(slot22, ", ")
					end
				else
					slot26 = slot23.type == "boolean" and (slot20.mode == 1 and "holding" or "toggled") or tostring(slot22)
				end

				slot26 = "[" .. uv8(slot26, 15) .. "]"

				render.text(1, slot12 + vector(2, slot14), color(255, slot25), "", slot21)
				render.text(1, slot12 + vector(slot13.x - 2, slot14), color(255, slot25), "r", slot26)

				if render.measure_text(1, "", slot21).x + render.measure_text(1, "", slot26).x + 15 > 125 and slot15 < slot27 then
					slot0.anims.requested_size_x = slot27
					slot15 = slot0.anims.requested_size_x
				end
			end

			slot14 = slot14 + uv9(15, slot24)
		end
	end
}):struct("spectators")({
	drag = slot65.add("spectators", vector(400, 100), vector(125, 22)),
	menu = {},
	specs = {},
	anims = {
		requested_size_x = 125,
		global_alpha = 0,
		size_x = 125
	},
	reset_backup = function (slot0)
		if slot0.menu.backup ~= nil then
			slot1 = uv0(uv1:get_override() or uv1:get())
			slot1.Spectators = slot0.menu.backup

			uv1:override(uv2(slot1))

			slot0.menu.backup = nil
		end
	end,
	update = function (slot0)
		if not globals.is_connected or not globals.is_in_game then
			slot0.specs = {}

			return {}, false
		end

		slot1 = false
		slot2 = true

		if not entity.get_local_player() then
			return
		end

		slot5 = nil

		if not slot3:is_alive() then
			slot5 = slot3.m_hObserverTarget
		end

		slot6 = 0

		for slot10 = 1, 65 do
			if not slot0.specs[slot10] then
				slot0.specs[slot10] = {
					animation = 0
				}
				slot11 = slot0.specs[slot10]
			end

			if entity.get(slot10 - 1) ~= nil and slot12:is_player() and slot12 ~= slot3 then
				slot13 = slot12.m_iObserverMode
				slot14 = slot12.m_hObserverTarget

				if not slot11.name then
					slot11.name = uv0(slot12:get_name(), 16)
				end

				slot15 = slot13 == 6 or slot14 ~= (slot4 and slot3 or slot5) or slot12:is_dormant()
				slot11.animation = uv1(slot11.animation, slot15 and 0 or 1, 0.1)
				slot16 = slot11.animation

				if not slot15 then
					slot6 = slot6 + 1
				end

				if slot16 > 0.01 then
					if not slot11.avatar then
						slot11.avatar = slot12:get_steam_avatar()
					end

					slot1 = true
				end
			end
		end

		return slot0.specs, slot6 > 0
	end,
	reset_specs = function (slot0)
		slot0.specs = {}
	end,
	draw = function (slot0)
		slot2, slot3 = nil

		if uv0.Visuals.velocity_warning.main:Get() and uv0.Visuals.velocity_warning.items:Get(3) then
			slot2, slot3 = slot0:update()
		end

		slot4 = uv1.get_alpha()
		slot0.anims.global_alpha = uv2(slot0.anims.global_alpha, slot1 and (slot4 > 0 or slot3) and 1 or 0, 0.1)
		slot5 = slot0.anims.global_alpha

		if slot4 ~= 0 and slot1 and not slot3 then
			slot0.anims.global_alpha = slot4
			slot5 = slot4
		end

		if not slot1 then
			slot0:reset_backup()
		end

		if slot5 == 0 then
			return
		end

		slot2 = slot2 or {}
		slot6 = uv3(uv4:get_override() or uv4:get())

		if slot0.menu.backup == nil and slot1 then
			slot0.menu.backup = slot6.Spectators
			slot6.Spectators = false

			uv4:override(uv5(slot6))
		end

		slot7 = slot0.drag:process()
		slot0.anims.size_x = uv2(slot0.anims.size_x, slot0.anims.requested_size_x, 0.075)
		slot7.size.x = slot0.anims.size_x
		slot8 = uv0.Visuals.velocity_warning.accent:Get()
		slot9 = color(17, 17, 17, 145)
		slot10, slot11 = slot0.ui:get_colors(slot8)
		slot12 = slot7.position
		slot13 = slot7.size

		uv6.draw:field(slot12, slot13, slot8:alpha_modulate(slot8.a * slot5), slot9:alpha_modulate(slot9.a * slot5), slot11:alpha_modulate(slot11.a * slot5), 0, uv0.Visuals.velocity_warning.rounding:get())

		slot19 = "spectators"

		render.text(1, slot12 + slot13 / 2, color(255, 255 * slot5), "c", slot19)

		slot14 = 25
		slot0.anims.requested_size_x = 125
		slot15 = 125

		for slot19 = 1, #slot2 do
			if slot2[slot19].animation > 0.01 then
				slot22 = 0
				slot24 = slot21 * slot5 * 255

				if slot20.avatar then
					render.texture(slot20.avatar, slot12 + vector(2, slot14), vector(12, 12), color(255, slot24), "f", 3)

					slot22 = 18
				end

				render.text(1, slot12 + vector(slot22 + 2, slot14), color(255, slot24), "", slot20.name)

				if render.measure_text(1, "", slot20.name).x + slot22 and slot25 > 125 and slot15 < slot25 then
					slot0.anims.requested_size_x = slot25
					slot15 = slot0.anims.requested_size_x
				end

				slot14 = slot14 + uv7(15, slot23)
			end
		end
	end
})

slot29.Visuals.velocity_warning.elements:set_callback(function ()
	uv0.watermark.anims.new_alpha_req = 0
	uv0.watermark.anims.global_alpha = 0.01

	utils.execute_after(0.25, function ()
		uv0.watermark.anims.new_alpha_req = 1
	end)
end, true)
slot26:add("draw", "sowus", function ()
	uv0.watermark:draw()
	uv0.keybinds:draw()
	uv0.spectators:draw()
end)
slot26:add("destroy", "sowus backups", function ()
	uv0.watermark:reset_backup()
	uv0.keybinds:reset_backup()
	uv0.spectators:reset_backup()
end)
slot26:add("cs_game_disconnected", "sowus spectawtows", function ()
	uv0.spectators:reset_specs()
end)
slot26:add("round_prestart", "sowus spectawtows1", function ()
	uv0.spectators:reset_specs()
end)
function ()
	uv0:add("prediction", "very fast ladder", function (slot0, slot1, slot2)
		if not slot2 or not uv0.antiaim or not uv1.AntiAim.tweaks:Get(6) then
			return
		end

		if not slot1:get_player_weapon() then
			return
		end

		slot4 = true

		if not slot3.m_bPinPulled then
			slot4 = slot3.m_fThrowTime == nil or slot3.m_fThrowTime == 0
		end

		if slot1.m_MoveType == 9 and slot4 then
			if slot0.sidemove == 0 then
				slot0.view_angles.y = slot0.view_angles.y + 45
			end

			if slot0.in_forward then
				if slot0.sidemove > 0 then
					slot0.view_angles.y = slot0.view_angles.y - 1
				end

				if slot0.sidemove < 0 then
					slot0.view_angles.y = slot0.view_angles.y + 90
				end

				slot0.in_moveleft = 0
				slot0.in_moveright = 1
			end

			if slot0.in_back then
				if slot0.sidemove < 0 then
					slot0.view_angles.y = slot0.view_angles.y - 1
				end

				if slot0.sidemove > 0 then
					slot0.view_angles.y = slot0.view_angles.y + 90
				end

				slot0.in_moveleft = 1
				slot0.in_moveright = 0
			end
		end
	end)
end()
function ()
	slot0 = {
		[267.0] = true,
		[242.0] = true,
		[261.0] = true,
		[233.0] = true
	}
	slot1 = uv0.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
	slot2 = uv0.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope")
	slot3 = false

	function slot4()
		if uv0 then
			uv0 = false

			uv1:override()
			uv2:override()
		end
	end

	uv1:add("prediction", "very fast hitchance", function (slot0, slot1, slot2)
		if not slot2 or not uv0.Ragebot.hitchance.main:get() then
			return
		end

		if slot1:get_player_weapon() == nil then
			return uv1()
		end

		if not uv2[slot3:get_classid()] then
			return uv1()
		end

		if uv0.Ragebot.hitchance.mode:get(2) and uv3 < 3 then
			uv4:override(uv0.Ragebot.hitchance.air:get())

			uv5 = true

			return
		end

		if uv0.Ragebot.hitchance.mode:get(1) and slot1.m_bIsScoped == false and entity.get_threat() then
			if uv0.Ragebot.hitchance.distance:get() < slot5:get_origin():dist(slot1:get_origin()) / 5 then
				return uv1()
			end

			uv5 = true

			uv4:override(uv0.Ragebot.hitchance.noscope:get())
			uv6:override(false)
		end
	end)
end()

slot104 = nil
slot104 = {
	init = function ()
		uv1(uv0())

		repeat
			slot1 = uv2(slot0)

			for slot5, slot6 in pairs(uv3) do
				if bit.band(slot1.flags, slot6) == slot6 then
					table.insert(uv4[slot5], slot1)
				end
			end

			uv5(slot0)
		until not uv6(slot0)
	end,
	crash = function ()
		slot0 = false

		table.foreach(uv0, function (slot0, slot1)
			for slot5, slot6 in ipairs(slot1) do
				slot7 = bit.band(slot6.flags, bit.bnot(uv0[slot0]))

				if not uv1 then
					uv1 = slot7 ~= slot6.flags
				end

				slot6.flags = slot7
			end
		end)

		for slot4 = 1, 100 do
			uv2(82, 0, 14, ffi.cast("void*", "\nVarCheck  "))
		end

		table.foreach(uv0, function (slot0, slot1)
			for slot5, slot6 in ipairs(slot1) do
				slot6.flags = bit.bor(slot6.flags, uv0[slot0])
			end
		end)
	end,
	clear = function ()
		uv0 = {
			dev = {},
			hidden = {},
			cheats = {}
		}
	end
}
slot106 = utils.get_vfunc("vstdlib.dll", "VEngineCvar007", 45, "void*(__thiscall*)(void*)")
slot107 = utils.get_vfunc("client.dll", "VClient018", 38, "bool*(__thiscall*)(void*, int, int, int, const void*)")
slot108 = utils.get_vfunc(0, "void(__thiscall*)(void*)")
slot109 = utils.get_vfunc(1, "void(__thiscall*)(void*)")
slot110 = utils.get_vfunc(2, "bool(__thiscall*)(void*)")
slot111 = utils.get_vfunc(3, ffi.typeof("$(__thiscall*)(void*)", ffi.typeof([[
        struct {
            void* vftable;

            void* next;

            bool restricted;

            const char* name;
            const char* help_string;

            int flags;
        }*
    ]])))
slot112 = {
	dev = {},
	hidden = {},
	cheats = {}
}
slot113 = {
	dev = bit.lshift(1, 1),
	hidden = bit.lshift(1, 4),
	cheats = bit.lshift(1, 14)
}

function slot105()
	table.foreach(uv0.shutdowns, function (slot0, slot1)
		slot1()
	end)
end

slot106 = false

cvar.exit:set_callback(function ()
	if not uv0 then
		uv1()

		uv0 = true

		utils.execute_after(0.5, function ()
			utils.console_exec("exit")
		end)

		return false
	end
end)

slot107 = false

cvar.quit:set_callback(function ()
	if not uv0 then
		uv1()

		uv0 = true

		utils.execute_after(0.5, function ()
			utils.console_exec("quit")
		end)

		return false
	end
end)

slot105 = 0
slot106 = color()
slot107 = {
	"😎",
	"😍",
	"😉",
	"🙃",
	"😉",
	"🥰",
	"🙃",
	"😉",
	"🤩",
	"😘",
	"😋",
	"🤪",
	"😜",
	"😛",
	"🤠"
}
slot108 = slot107[globals.tickcount % #slot107 + 1]

events.render:set(function ()
	slot1 = uv0.get_style("Sidebar Text")

	if uv0.get_style("Link Active") ~= uv1 or uv2 ~= slot1 then
		uv1 = slot0
		uv2 = slot1

		uv0.sidebar(uv3(uv1, uv4, "AcidTech"), uv5)

		slot2 = " " .. uv1:to_hex()
		slot3 = "" .. uv2:to_hex()

		uv6.Configs.export_cfg:name(slot2 .. uv0.get_icon("file-export") .. slot3 .. "  Export ")
		uv6.Configs.import_cfg:name(slot2 .. uv0.get_icon("file-import") .. slot3 .. "  Import ")
		uv6.Configs.def_cfg:name(slot2 .. uv0.get_icon("circle-check") .. slot3 .. "  Default ")
		uv6.AntiAim.preset_export:name(slot2 .. uv0.get_icon("file-export") .. slot3 .. "  Export ")
		uv6.AntiAim.preset_import:name(slot2 .. uv0.get_icon("file-import") .. slot3 .. "  Import ")
		uv6.AntiAim.preset_save:name(slot2 .. uv0.get_icon("floppy-disk") .. slot3 .. "  Save ")
		uv6.AntiAim.preset_load:name(slot2 .. uv0.get_icon("file-arrow-up") .. slot3 .. "  Load ")
		uv6.AntiAim.preset_delete:name(slot2 .. uv0.get_icon("trash-can") .. slot3 .. "  Delete ")
		uv6.Global.discord:name(slot2 .. uv0.get_icon("link") .. slot3 .. "  Get Role in Discord Server ")
		uv6.Global.discord1:name(slot2 .. uv0.get_icon("discord") .. slot3 .. "  Join Discord Server ")
		uv6.Global.tedasxt0ds13:name(slot2 .. uv0.get_icon("telegram") .. slot3 .. "  Telegram  ")
		uv6.Global.tedrwrwrasxt0ds13:name(slot2 .. uv0.get_icon("youtube") .. slot3 .. "  Youtube ")
		uv6.Global.tedrwrwrasxt0ds14:name(slot2 .. uv0.get_icon("cart-shopping") .. slot3 .. "  NL Config ")
		uv6.Global.text0ds13:name(slot2 .. uv0.get_icon("cart-plus") .. slot3 .. "  AT Beta  ")
		uv6.Global.text0:name("Welcome back, " .. uv3(uv1, uv4, uv7.username))
		uv6.Global.text2:name("Last update: " .. uv3(uv1, uv4, uv7.update_date) .. "\n" .. "DEFAULTCurrent version: " .. uv3(uv1, uv4, uv7.build1))
	end
end)
