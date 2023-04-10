luajit version: 2.1
slot0 = false
slot1 = 120
slot2 = 0
slot3 = events["@voice_data"]
slot4 = cvar.voice_modenable
slot5 = cvar.cl_mute_enemy_team
slot6 = cvar.cl_mute_all_but_friends_and_party
slot7 = cvar.cl_mute_player_after_reporting_abuse
slot8 = 0
slot9 = 1
slot10 = {
	NEVERLOSE = "NL",
	ONETAP = "OT",
	FATALITY = "FT",
	PANDORA = "PD",
	PRIMORDIAL = "PRMD",
	NIXWARE = "NW",
	GAMESENSE = "GS"
}
slot11 = {
	[slot10.NEVERLOSE] = "9dvNoP3",
	[slot10.GAMESENSE] = "K4AUzJn",
	[slot10.PRIMORDIAL] = "8WtCszQ",
	[slot10.FATALITY] = "TSLXFBE",
	[slot10.ONETAP] = "cGMu5BM",
	[slot10.PANDORA] = "cQLhXyQ",
	[slot10.NIXWARE] = "aXsAm7M"
}
slot12 = require("neverlose/base64")

function slot13(...)
	slot0 = table.concat({
		...
	})
	slot1 = "64 0e 87 3c c8 9a e5 b1 4f 05"
	slot2 = #slot0

	ffi.copy(ffi.new("char[?]", slot2 + 1), slot0)
	ffi.copy(ffi.new("char[?]", #slot1 + 1), slot1)

	for slot9 = 0, slot2 - 1 do
		slot4[slot9] = bit.bxor(slot4[slot9], slot5[slot9 % slot3])
	end

	return ffi.string(slot4, slot2)
end

slot14, slot15 = nil
slot17, slot18 = pcall(function (slot0)
	return json.parse(uv0(uv1.decode(slot0)))
end, db["@voice_listener"])
slot14 = slot17 == true and slot18 or {}
db[slot15] = nil

function slot16(slot0, slot1)
	return slot0.is_reliable and slot1.amount < slot0.amount
end

function slot17()
	return globals.realtime
end

slot18, slot19 = nil

ffi.cdef("        void* VirtualAlloc(void* lpAddress, size_t dwSize, uint32_t flAllocationType, uint32_t flProtect);\n        int VirtualFree(void* lpAddress, size_t dwSize, uint32_t dwFreeType);\n    ")

slot22 = utils.get_vfunc("engine.dll", "VEngineClient014", 8, "bool(__thiscall*)(void*, int, $*)", ffi.typeof([[
        struct {
            uint64_t version;
            uint32_t xuid_low;
            uint32_t xuid_high;
            char name[128];
            int userid;
            char guid[33];
            uint32_t friendsid;
            char friendsname[128];
            bool isbot;
            bool ishltv;
            uint32_t customfiles[4];
            uint8_t filesdownloaded;
        }
    ]]))

function slot19(slot0)
	if type(slot0) ~= "number" then
		return
	end

	slot1 = uv0()
	slot1.version = nan

	if uv1(slot0, slot1) then
		return slot1
	end
end

slot18 = ffi.cast("bool(__fastcall*)(void*, uint32_t)", function (slot0)
	assert(type(slot0) == "table", "invalid shellcode")
	assert(ffi.C.VirtualAlloc(nil, #slot0, 4096, 64) ~= nil, "allocation failed")
	ffi.gc(slot2, function (slot0)
		ffi.C.VirtualFree(slot0, uv0, 32768)
	end)
	ffi.copy(slot2, ffi.new("char[?]", slot1, slot0), slot1)

	return slot2
end({
	129,
	236,
	76,
	1,
	0,
	0,
	83,
	85,
	86,
	139,
	241,
	137,
	84,
	36,
	84,
	51,
	219,
	199,
	68,
	36,
	16,
	104,
	51,
	5,
	151,
	87,
	199,
	68,
	36,
	24,
	54,
	6,
	212,
	234,
	191,
	0,
	1,
	0,
	0,
	139,
	70,
	16,
	139,
	78,
	20,
	137,
	68,
	36,
	48,
	139,
	70,
	40,
	137,
	68,
	36,
	56,
	139,
	70,
	36,
	137,
	68,
	36,
	60,
	139,
	70,
	44,
	137,
	68,
	36,
	64,
	139,
	195,
	199,
	68,
	36,
	28,
	79,
	196,
	164,
	62,
	199,
	68,
	36,
	32,
	133,
	178,
	172,
	15,
	137,
	76,
	36,
	52,
	137,
	92,
	36,
	40,
	136,
	68,
	4,
	92,
	64,
	59,
	199,
	114,
	247,
	138,
	243,
	139,
	243,
	138,
	84,
	52,
	92,
	139,
	198,
	131,
	224,
	15,
	138,
	68,
	4,
	20,
	2,
	194,
	2,
	240,
	15,
	182,
	206,
	138,
	68,
	12,
	92,
	136,
	68,
	52,
	92,
	70,
	136,
	84,
	12,
	92,
	59,
	247,
	114,
	219,
	138,
	227,
	139,
	251,
	189,
	128,
	0,
	0,
	0,
	138,
	244,
	254,
	198,
	15,
	182,
	246,
	138,
	84,
	52,
	92,
	2,
	226,
	15,
	182,
	204,
	138,
	68,
	12,
	92,
	136,
	68,
	52,
	92,
	136,
	84,
	12,
	92,
	131,
	237,
	1,
	117,
	225,
	254,
	198,
	15,
	182,
	246,
	138,
	84,
	52,
	92,
	138,
	218,
	2,
	220,
	15,
	182,
	203,
	138,
	68,
	12,
	92,
	136,
	68,
	52,
	92,
	136,
	84,
	12,
	92,
	138,
	68,
	52,
	92,
	2,
	194,
	15,
	182,
	192,
	138,
	68,
	4,
	92,
	138,
	227,
	48,
	68,
	60,
	48,
	71,
	131,
	255,
	20,
	114,
	203,
	51,
	255,
	137,
	124,
	36,
	44,
	139,
	239,
	199,
	68,
	36,
	36,
	15,
	0,
	0,
	0,
	139,
	124,
	36,
	36,
	209,
	237,
	137,
	108,
	36,
	72,
	15,
	183,
	76,
	172,
	50,
	139,
	193,
	15,
	191,
	201,
	137,
	68,
	36,
	84,
	15,
	183,
	68,
	172,
	52,
	189,
	133,
	142,
	213,
	145,
	139,
	208,
	137,
	76,
	36,
	68,
	139,
	216,
	137,
	84,
	36,
	76,
	139,
	193,
	15,
	183,
	240,
	43,
	221,
	36,
	15,
	139,
	213,
	138,
	200,
	209,
	194,
	102,
	211,
	203,
	139,
	234,
	102,
	139,
	195,
	209,
	197,
	102,
	51,
	198,
	43,
	242,
	15,
	183,
	216,
	138,
	203,
	128,
	225,
	15,
	102,
	211,
	206,
	102,
	51,
	240,
	15,
	183,
	206,
	15,
	183,
	198,
	131,
	239,
	1,
	117,
	203,
	139,
	124,
	36,
	40,
	139,
	197,
	43,
	216,
	137,
	108,
	36,
	36,
	51,
	92,
	36,
	80,
	131,
	199,
	2,
	139,
	108,
	36,
	72,
	209,
	192,
	43,
	200,
	137,
	124,
	36,
	40,
	139,
	68,
	36,
	76,
	51,
	76,
	36,
	44,
	15,
	183,
	192,
	137,
	68,
	36,
	80,
	139,
	68,
	36,
	84,
	15,
	183,
	192,
	102,
	137,
	92,
	172,
	52,
	102,
	137,
	76,
	172,
	50,
	137,
	68,
	36,
	44,
	131,
	255,
	9,
	15,
	130,
	69,
	255,
	255,
	255,
	139,
	68,
	36,
	48,
	139,
	76,
	36,
	88,
	193,
	248,
	16,
	193,
	249,
	16,
	51,
	193,
	185,
	36,
	36,
	0,
	0,
	95,
	94,
	102,
	59,
	193,
	93,
	15,
	148,
	192,
	91,
	129,
	196,
	76,
	1,
	0,
	0,
	195
}))

function slot20(slot0)
	if slot0.entity == nil then
		return nil
	end

	if uv0(slot0.entity:get_index()) == nil then
		return
	end

	if slot0.success then
		return uv1.NEVERLOSE, bit.lshift(slot0.sequence_bytes + slot0.section_number + slot0.uncompressed_sample_offset, 4) % 4294967296.0
	end

	if slot0.base_check == true then
		slot3 = slot0.buffer
		slot6 = vector(slot3:read_coord(), slot3:read_coord(), slot3:read_coord())
		slot8 = slot3:read_bits(7)
		slot9 = slot3:read_bits(32)

		slot3:reset()

		slot11 = globals.server_tick - slot3:read_bits(32)

		if entity.get(slot3:read_bits(7) + 1) and slot10:is_alive() and slot8 >= 0 and slot8 <= 127 and slot11 > 0 and slot11 * globals.tickinterval < 1 then
			if slot3:read_bits(16) == 48879 and math.abs(globals.curtime * 0.5 - slot0.packet) <= 2 then
				return uv1.NIXWARE, slot2
			end

			return nil
		end

		if uv2(slot0[0], slot1.xuid_low) then
			return uv1.GAMESENSE, slot2
		end

		if slot0.packet == 32762 then
			return uv1.FATALITY, slot2
		end

		if slot0.packet == 22522 then
			return uv1.ONETAP, slot2
		end

		if slot0.packet == 26971 then
			return uv1.PANDORA, slot2
		end

		return nil
	end

	slot3 = slot0.sequence_bytes

	if slot0.base_check == false and bit.band(bit.bxor(bit.band(slot3, 255), bit.band(bit.rshift(slot0.uncompressed_sample_offset, 16), 255)) - bit.rshift(slot3, 16), 255) == 77 and bit.band(bit.bxor(bit.rshift(slot3, 16), bit.rshift(slot3, 8)), 255) >= 1 and slot6 <= 64 and entity.get(slot6) and slot7 == slot0.entity then
		return uv1.PRIMORDIAL, slot2
	end

	return nil
end

function slot21(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.records) do
		slot7 = false

		for slot11, slot12 in pairs(slot1) do
			if slot12.signature == slot6.signature then
				slot12.amount = slot12.amount + 1
				slot12.time = math.max(slot12.time, slot6.time)

				if not slot12.is_reliable then
					slot12.is_reliable = slot12.amount > 4 or slot6.is_shared
				end

				slot7 = true

				break
			end
		end

		if not slot7 then
			slot1[#slot1 + 1] = {
				is_reliable = false,
				amount = 1,
				time = slot6.time,
				signature = slot6.signature
			}
		end
	end

	table.sort(slot1, uv0)

	slot0.sorted_records = slot1
end

function slot22(slot0)
	slot1 = uv0()

	if slot0 ~= true then
		if math.abs(uv1 - slot1) <= 1 then
			return
		end

		uv1 = slot1
	end

	slot3 = false

	function slot7(slot0)
		uv0[tostring(slot0:get_xuid())] = slot0
	end

	entity.get_players(false, true, slot7)

	for slot7, slot8 in pairs(uv2) do
		if ({})[slot7] == nil or slot1 < slot8.heartbeat or uv3 <= slot1 - slot8.heartbeat or #slot8.records <= 0 then
			uv2[slot7] = nil
			slot3 = true
		else
			slot9 = {}

			for slot13, slot14 in ipairs(slot8.records) do
				if slot14 ~= nil and slot1 < slot14.time or slot1 - slot14.time <= uv3 then
					slot9[#slot9 + 1] = slot14
				end
			end

			if #slot9 <= 0 then
				uv2[slot7] = nil
				slot3 = true
			else
				slot8.records = slot9

				uv4(slot8)
			end
		end
	end

	if slot3 == true then
		for slot8, slot9 in pairs(uv2) do
			if slot9 ~= nil then
				-- Nothing
			end
		end

		uv2 = {
			[slot8] = slot9
		}
	end

	return uv2
end

function slot23(slot0, slot1, slot2, slot3, slot4)
	if slot0 == nil or slot1 == nil then
		return
	end

	slot5 = false

	for slot9, slot10 in pairs(uv0) do
		if slot1 == slot10 then
			slot5 = true

			break
		end
	end

	if not slot5 then
		return
	end

	slot7 = tostring(slot0:get_xuid())
	slot2 = slot2 or false
	uv2[slot7] = uv2[slot7] or {
		heartbeat = 0,
		records = {},
		sorted_records = {}
	}
	slot8 = uv2[slot7]
	slot8.heartbeat = slot3 or uv1()

	if slot8.records and #slot9 > 0 then
		for slot14, slot15 in ipairs(slot9) do
			if false then
				break
			end

			if slot15.signature == slot1 then
				slot10 = true

				if math.abs(slot6 - slot15.time) <= 0.5 then
					return
				end
			end
		end
	end

	if #slot9 >= 16 then
		for slot13 = 16, #slot9 do
			table.remove(slot9, slot13)
		end
	end

	for slot13, slot14 in ipairs(slot9) do
		if slot4 ~= nil and slot4 == slot14.hash then
			return false
		end

		if slot1 == slot14.signature and slot6 < slot14.time then
			return false
		end
	end

	table.insert(slot9, 1, {
		signature = slot1,
		is_shared = slot2,
		time = slot6,
		hash = slot4
	})
	uv3(slot8)

	return true
end

function slot24(slot0, slot1)
	if slot0 == nil then
		return
	end

	if uv0[tostring(slot0:get_xuid())] == nil or #slot3.sorted_records <= 0 then
		return
	end

	slot4 = {}

	for slot9, slot10 in ipairs(slot3.sorted_records) do
		if not slot1 or slot10.is_reliable then
			slot4[#slot4 + 1] = {
				signature = slot10.signature,
				is_reliable = slot10.is_reliable,
				amount = slot10.amount / #slot3.records,
				heartbeat = uv1() - slot10.time
			}
		end
	end

	return #slot4 > 0 and slot4 or nil
end

function slot25(slot0)
	if slot0 == nil then
		return
	end

	if uv0[tostring(slot0:get_xuid())] == nil or #slot2.sorted_records <= 0 then
		return
	end

	if not slot2.sorted_records[1].is_reliable then
		return
	end

	return {
		signature = slot3.signature,
		amount = slot3.amount / #slot2.records,
		heartbeat = uv1() - slot3.time
	}
end

function slot26(slot0)
	if uv0[slot0] then
		return string.format("https://i.imgur.com/%s.png", slot1)
	end
end

function slot27()
	return uv0
end

slot22(true)
events.render(slot22)
events.shutdown(function ()
	for slot5 in pairs(uv0(true)) do
		slot1 = 0 + 1
	end

	db[uv1] = slot1 > 0 and uv2.encode(uv3(json.stringify(slot0))) or nil
end)
events.render(function ()
	if math.abs(globals.realtime - uv0) <= 0.1 then
		return
	end

	uv1:int(1, true)
	uv2:int(0, true)
	uv3:int(0, true)
	uv4:int(0, true)

	uv0 = slot0
end)
events.shutdown(function ()
	uv0:int(tonumber(uv0:string()))
	uv1:int(tonumber(uv1:string()))
	uv2:int(tonumber(uv2:string()))
	uv3:int(tonumber(uv3:string()))
end)
slot3(function (slot0)
	if slot0.entity == nil then
		return
	end

	slot2, slot3 = uv0(slot0)

	if slot2 == nil then
		return
	end

	uv1(slot1, slot2, false, nil, slot3)
end)

slot32 = nil
slot33 = {
	RV_PLAYER_REQUEST = 1,
	ID = 2976579765.0,
	RV_PLAYER_SEND = 2
}

function slot34(slot0)
	slot1 = type(slot0) == "number"
	slot2 = ffi.typeof(slot1 and "union { uint32_t num; char bytes[5]; }" or "union { char bytes[5]; uint32_t num; }")(slot0)

	return slot1 and ffi.string(slot2.bytes) or slot2.num
end

function slot35(slot0, slot1)
	slot2 = bit.bxor(slot0, slot1)

	return (slot2 + bit.lshift(slot2, 1) + bit.lshift(slot2, 4) + bit.lshift(slot2, 7) + bit.lshift(slot2, 8) + bit.lshift(slot2, 24)) % 4294967296.0
end

function slot36(slot0, slot1, slot2)
	uv0:call(function (slot0)
		slot1 = globals.server_tick

		slot0:write_bits(uv1.ID, 32)
		slot0:write_bits(uv1.RV_PLAYER_SEND, 4)
		slot0:write_bits(slot1, 32)
		slot0:write_bits(uv0(slot1, uv1.ID), 32)
		slot0:write_bits(uv2:get_index() - 1, 7)
		slot0:write_bits(uv3(uv4), 32)
		slot0:write_bits(uv5, 16)
	end)
end

function slot37()
	uv0:call(function (slot0)
		slot1 = globals.server_tick

		slot0:write_bits(uv1.ID, 32)
		slot0:write_bits(uv1.RV_PLAYER_REQUEST, 4)
		slot0:write_bits(slot1, 32)
		slot0:write_bits(uv0(slot1, uv1.ID), 32)
	end)
end

slot3(function (slot0)
	if slot0.entity == nil then
		return
	end

	if slot0.buffer:read_bits(32) ~= uv0.ID then
		return
	end

	if slot1:read_bits(4) == uv0.RV_PLAYER_REQUEST then
		if to_time(globals.server_tick - slot1:read_bits(32)) < 1 and slot1:read_bits(32) == uv1(slot4, uv0.ID) then
			uv2 = true

			entity.get_players(false, true, function (slot0)
				if uv0(slot0) ~= nil then
					utils.execute_after(uv1, uv2, slot0, slot1.signature, to_ticks(slot1.heartbeat))

					uv1 = uv1 + to_time(5)
				end
			end)
			utils.execute_after(0, function ()
				uv0 = false
			end)
		end

		return
	end

	if slot3 == uv0.RV_PLAYER_SEND then
		if to_time(globals.server_tick - slot1:read_bits(32)) < 1 and slot1:read_bits(32) == uv1(slot4, uv0.ID) then
			slot6 = entity.get(slot1:read_bits(7) + 1)
			slot8 = to_time(slot1:read_bits(16))
			slot9 = nil

			for slot13, slot14 in pairs(uv6) do
				if uv5(slot1:read_bits(32)) == slot14 then
					slot9 = slot13

					break
				end
			end

			if slot6 ~= nil and slot9 and slot8 < 120 then
				slot10 = uv7(slot6, slot7, true, uv8() - slot8)
			end
		end
	end
end)

if globals.is_in_game then
	for slot43 in pairs(slot14) do
		slot39 = 0 + 1
	end

	if slot39 == 0 then
		slot37()
	end
end

events.player_connect_full(function (slot0)
	if entity.get(slot0.userid, true) == entity.get_local_player() then
		uv0()
	end
end)

slot28 = {
	get_all = slot24,
	get_software = slot25,
	get_icon = slot26,
	is_syncing = slot27
}
slot30 = nil

function slot30()
	return bit.lshift(utils.random_int(65535, math.huge), 64)
end

events.render:set(function ()
	uv0 = uv1()
end)

return setmetatable({}, {
	__metatable = false,
	__pow = function (slot0, slot1)
		return uv0 == slot1 and uv1 or error("security measurement failure", 2)
	end,
	__index = function (slot0, slot1)
		return slot1 == "SIGNED" and uv0 or error("security measurement failure", 2)
	end
})
