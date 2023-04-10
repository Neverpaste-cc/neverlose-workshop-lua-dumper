slot0 = string.format
slot1 = table.concat
slot2 = table.remove
slot3 = {}
slot4 = {}
slot5 = {}
slot6 = {
	group_ref = ui.create("Scoreboard Equipment")
}

ui.sidebar("Scoreboard info", "FF00FFFF" .. ui.get_icon("toggle-on"))

slot6.enabled = slot6.group_ref:switch("Enabled", true)
slot6.enabled_cp = slot6.enabled:color_picker(color(255, 140))
slot6.team_only = slot6.group_ref:switch("Team Equipment", true)
slot6.local_player = slot6.group_ref:switch("Local Equipment", true)
slot12 = 50
slot6.scale = slot6.group_ref:slider("Scale", 10, 100, slot12)
slot7 = {
	team_only = false,
	local_player = false,
	enabled = false,
	scale = 50
}

for slot12, slot13 in pairs(slot6) do
	if slot12 ~= "group_ref" and slot12 ~= "enabled_cp" then
		slot13:set_callback(({
			enabled = function ()
				uv0.enabled = uv1.enabled:get()

				uv1.team_only:visibility(uv0.enabled)
				uv1.scale:visibility(uv0.enabled)
				uv1.local_player:visibility(uv0.enabled)
				ui.sidebar("Scoreboard info", ui.get_icon("toggle-" .. (uv0.enabled and "on" or "off")))
			end,
			team_only = function ()
				uv0.team_only = uv1.team_only:get()
			end,
			local_player = function ()
				uv0.local_player = uv1.local_player:get()
			end,
			scale = function ()
				uv0.scale = uv1.scale:get()
				uv2.m_times_recalled = 0
			end
		})[slot12], true)
	end
end

slot9 = false
slot5 = {
	_array = {},
	_create = function (slot0, slot1)
		if slot1 == nil then
			return false
		end

		if slot0._array[slot1] ~= nil then
			return false
		end

		slot0._array[slot1] = {
			active = "no",
			weapons = {}
		}

		return true
	end,
	add = function (slot0, slot1, slot2)
		if slot2 == nil then
			return slot0._array[slot1]
		end

		if not slot0._array[slot1] then
			slot0:_create(slot1)
		end

		if not uv0.contains(slot0._array[slot1].weapons, slot2) then
			slot0._array[slot1].weapons[#slot0._array[slot1].weapons + 1] = slot2
		end

		return slot0._array[slot1]
	end,
	set = function (slot0, slot1, slot2)
		if slot2 == nil then
			return false
		end

		if not slot0._array[slot1] then
			slot0:_create(slot1)
		end

		slot0._array[slot1].weapons = slot2

		return slot0._array[slot1]
	end,
	get = function (slot0, slot1)
		if not slot0._array[slot1] then
			slot0:_create(slot1)
		end

		return slot0._array[slot1]
	end,
	active = function (slot0, slot1, slot2)
		if not slot0._array[slot1] then
			slot0:_create(slot1)
		end

		slot0:add(slot1, slot2)

		slot0._array[slot1].active = slot2

		return slot0._array[slot1]
	end,
	remove = function (slot0, slot1, slot2)
		if slot2 == nil then
			return slot0._array[slot1]
		end

		if not slot0._array[slot1] then
			slot0:_create(slot1)
		end

		if uv0.contains(slot0._array[slot1].weapons, slot2) then
			uv1(slot0._array[slot1].weapons, slot3)
		end

		return slot0._array[slot1]
	end,
	reset = function (slot0, slot1, slot2)
		if not slot0._array[slot1] then
			slot0:_create(slot1)
		end

		slot0._array[slot1] = {
			active = "no",
			weapons = {}
		}

		return slot0._array[slot1]
	end
}
slot11 = {
	get = function (slot0)
		if slot0 == nil then
			return
		end

		slot1 = slot0:get_index()
		slot2 = false

		if slot0:is_dormant() then
			if has_helmet and has_helmet[slot1 + 1] then
				uv0:add(slot1, "armor_helmet")

				slot2 = true
			end

			if has_armor and has_armor[slot1 + 1] > 0 and not slot2 then
				uv0:add(slot1, "armor")
			end

			if has_defusal and has_defusal[slot1 + 1] then
				uv0:add(slot1, "defuser")
			end

			return false
		end

		if slot0.m_iHealth < 1 then
			return uv0:reset(slot1)
		end

		if slot0:get_player_weapon() == nil then
			return uv0:reset(slot1)
		end

		slot5 = {}

		for slot9, slot10 in ipairs(slot0:get_player_weapon(true)) do
			slot11 = slot10:get_weapon_info()
			slot12 = slot11.weapon_name:gsub("weapon_", "")

			if slot11.is_revolver then
				slot12 = "revolver"
			end

			table.insert(slot5, slot12)
		end

		slot6 = slot0:get_resource()
		slot8 = slot6.m_iArmor > 0
		slot9 = slot6.m_bHasDefuser

		if slot6.m_bHasHelmet then
			table.insert(slot5, "armor_helmet")

			slot2 = true
		end

		if slot8 and not slot2 then
			table.insert(slot5, "armor")
		end

		if slot9 then
			table.insert(slot5, "defuser")
		end

		slot10 = slot3:get_weapon_info()
		slot11 = slot10.weapon_name:gsub("weapon_", "")

		if slot10.is_revolver then
			slot11 = "revolver"
		end

		return {
			index = slot1,
			weapons = slot5,
			active = slot11
		}
	end
}

({
	prev_update = 0,
	_init = function (slot0)
		slot0.methods = slot0.exec([[
            _scoreboardWeapons = function () {
    
                this.getContainer = function() {
                    var _m_cP = $.GetContextPanel();
                    var CSGOHud = _m_cP.FindChild("Hud");
                    return ScoreboardContainer = CSGOHud.FindChild("ScoreboardContainer");
                }
    
                this.weapon_priority = {armor_helmet: 397, armor: 398, defuser: 399, flashbang: 400, hegrenade: 401, smokegrenade: 402, molotov: 403, decoy: 404, incgrenade: 405, frag_grenade: 406, c4: 498, taser: 499, deagle: 500, elite: 501, fiveseven: 502, glock: 503, tec9: 504, hkp2000: 505, p250: 506, usp_silencer: 507, cz75a: 508, revolver: 509, ak47: 600, aug: 601, awp: 602, famas: 603, g3sg1: 604, galilar: 604, m249: 605, m4a1: 606, mac10: 607, p90: 608, mp5sd: 609, ump45: 610, xm1014: 611, bizon: 612, mag7: 613, negev: 614, sawedoff: 615, mp7: 616, mp9: 617, nova: 618, scar20: 619, sg556: 620, ssg08: 621, m4a1: 622}
    
                this.getXuid = function (entityIndex) { return entityIndex ? GameStateAPI.GetPlayerXuidStringFromEntIndex(entityIndex) : -1 }
            
                this.declaredChilds = []
    
                this.latest_array = []
                this.updatePlayer = function (playerArray, teamCheck, show_local, color, alpha, scale) {

                    const obj_hash = JSON.stringify(playerArray)
                    if (this.latest_array == obj_hash)
                        return

                    this.latest_array = obj_hash

                    if(playerArray == undefined)
                        playerArray = []

                    // entityIndex, weaponArray, activeWeapon
                
                    if(scale != undefined) 
                        scale = scale.toString() + "%"

                    var playerArrayV2 = []
                    const localXUID = GameStateAPI.GetLocalPlayerXuid()
                    const localTeam = GameStateAPI.GetAssociatedTeamNumber(localXUID)
    
                    for(var i in playerArray) {
                        var tempXuid = getXuid(playerArray[i].index)

                        if(tempXuid != -1 || tempXuid != 0) {

                            var temp_weapon_array = []

                            for(var j in playerArray[i].weapons) {
                                temp_weapon_array[Number(j) - 1] = playerArray[i].weapons[j]
                            }

                            playerArrayV2[tempXuid] = {weapons: temp_weapon_array, active: playerArray[i].active}
                        }
                    }
    
                    getContainer().FindChildrenWithClassTraverse("spectator-hidden").forEach(function (player_element) {
            
                        if (player_element["id"] !== "id-sb-name__nameicons") return false
            
                        var SteamID = 0
                        player_element.GetParent().Children().forEach(function (local_element) {
                            if (local_element["paneltype"] == "Label") {
                                SteamID = local_element.GetParent().GetParent()["m_xuid"];
                                return;
                            }
                        });
    
    
                        if (playerArrayV2.length == 0 || ( (SteamID != localXUID && teamCheck && GameStateAPI.GetAssociatedTeamNumber(SteamID) == localTeam) || ((show_local && SteamID == localXUID)) )) {
                            player_element.Children().forEach((elee) => {
                                if(elee.id.startsWith("nvl_"))
                                    elee.DeleteAsync(.0)
                            })
                            return false;
                        }
    
                        var weaponArray, activeWeapon
    
                        if(playerArrayV2[SteamID]) {
                            weaponArray = playerArrayV2[SteamID].weapons
                            activeWeapon = playerArrayV2[SteamID].active
                        } else { return false }
            
                        if (!declaredChilds[SteamID]) declaredChilds[SteamID] = []
            
                        for (var i in declaredChilds[SteamID]) {
                            var declaredFindChild = player_element.FindChild("nvl_" + declaredChilds[SteamID][i])
                            if (!declaredFindChild) continue
            
                            var currentExists = false
                            for (var j in weaponArray) {
                                if (declaredChilds[SteamID][i] == weaponArray[j]) {
                                    currentExists = true
                                    break;
                                }
                            }
                            if (!currentExists) {
                                declaredFindChild.DeleteAsync(.0)
                            }
                        }
    
                        function resort() {
    
                            var tempChilds = []
                            player_element.Children().forEach((elee) => {
                                if(elee.id.startsWith("nvl_"))
                                    tempChilds.push(elee)
                            })
    
                            let newArray = tempChilds.sort((a, b) => this.weapon_priority[b.id.replace("nvl_", "")] - this.weapon_priority[a.id.replace("nvl_", "")])
                            for(var i in newArray) {
                                let j = parseInt(i)
                                if(newArray[j + 1])  player_element.MoveChildBefore(newArray[j+1], newArray[j]) 
                            }
                        }
    
                        for (var w of weaponArray) {
            
                            if(w == "no") continue;
                            var alphaWeapon = w == activeWeapon ? Math.max(Math.min(1, alpha), 0.01) : Math.max(Math.min(1, alpha - 0.5), 0.01)
                            var new_el = player_element.FindChild("nvl_" + w)


                            if (declaredChilds[SteamID].indexOf(w) == -1) declaredChilds[SteamID].push(w)
            
            
                            if (!new_el) {
                                player_element.BCreateChildren(`<ItemImage id="nvl_${w}" registerforreadyevents="true" readyfordisplay="false" src="file://{images}/icons/equipment/${w}.svg" scaling="stretch-to-fit-preserve-aspect" style="transition-property: opacity; transition-duration: 0.1s; transition-timing-function: ease-in-out; margin-left: 2px; margin-right: 2px;ui-scale: ${scale}; vertical-align: middle; opacity: 0.001;wash-color: #${color};"/>`);
                                new_el = player_element.FindChild("nvl_" + w)
                                new_el.style.opacity = alphaWeapon
                            } else {
                                new_el.style.opacity = alphaWeapon
                                new_el.style.washColor = "#" + color
                                new_el.style["ui-scale"] = scale
                            }
                        }
    
                        resort()
                    })
                }
            
                return this;
            }
            return _scoreboardWeapons()
    ]])
	end,
	updatePlayer = function (slot0, slot1, slot2)
		slot3 = globals.realtime

		if not slot2 and slot3 < slot0.prev_update then
			return
		end

		slot8 = uv2.enabled_cp:get()

		slot0.methods.updatePlayer(uv0:convert_to_js(slot1), not uv1.team_only, not uv1.local_player, uv0.rgb_to_hex(slot8), slot8.a / 255, uv1.scale)

		slot0.prev_update = slot3 + 0.1
	end,
	exec = function (slot0)
		return panorama.loadstring(slot0, "CSGOHud")()
	end
}):_init()
({
	_init = function (slot0)
	end,
	rgb_to_hex = function (slot0)
		return slot0:to_hex():sub(1, 6)
	end,
	contains = function (slot0, slot1)
		if slot0 == nil or slot1 == nil then
			return false
		end

		for slot5, slot6 in pairs(slot0) do
			if slot6 == slot1 then
				return slot5
			end
		end

		return false
	end,
	convert_to_js = function (slot0, slot1)
		slot2 = {}

		if slot1 == nil then
			return {}
		end

		slot3 = {}
		slot4 = 1

		for slot9 = 1, #slot1 do
			slot10 = {
				weapons = {}
			}

			for slot15 = 1, #slot1[slot9].weapons do
				if uv0.methods.weapon_priority[slot11.weapons[slot15]] ~= nil then
					table.insert(slot10.weapons, slot16)
				end
			end

			slot10.active = slot11.active
			slot10.index = slot11.index

			table.insert(slot2, slot10)
		end

		return slot2
	end
}):_init()

slot12 = false

events.net_update_end:set(function (slot0)
	slot1 = globals.is_in_game

	if not uv0 and (not uv1.enabled or not slot1) then
		uv0 = true
		uv2._array = {}

		uv3.methods.updatePlayer({}, true)

		return
	end

	if not uv1.enabled or not slot1 then
		return
	end

	uv0 = false
	slot2 = entity.get_players(false, true)

	if uv4.get(slot2[globals.tickcount % #slot2 + 1]) and slot3.index ~= nil then
		uv2:set(slot3.index, slot3.weapons)
		uv2:active(slot3.index, slot3.active)
	end

	slot5 = 1

	for slot9 = 0, 64 do
		slot10 = uv2:get(slot9)
		slot5 = slot5 + 1
	end

	uv3:updatePlayer({
		[slot5] = {
			index = slot9,
			weapons = slot10.weapons,
			active = slot10.active
		}
	})
end)

for slot16, slot17 in pairs({
	item_equip = function (slot0)
		if not uv0.enabled then
			return
		end

		slot1 = entity.get(slot0.userid, true):get_index()
		slot2 = slot0.item

		if slot0.defindex == 64 then
			slot2 = "revolver"
		end

		uv1:active(slot1, slot2)
	end,
	item_remove = function (slot0)
		if not uv0.enabled then
			return
		end

		slot1 = entity.get(slot0.userid, true):get_index()
		slot2 = slot0.item

		if slot0.defindex == 64 then
			slot2 = "revolver"
		end

		uv1:remove(slot1, slot2)
	end,
	player_death = function (slot0)
		if not uv0.enabled then
			return
		end

		uv1:reset(entity.get(slot0.userid, true):get_index())
	end,
	item_purchase = function (slot0)
		if not uv0.enabled then
			return
		end

		slot2 = slot0.weapon:gsub("weapon_", "")

		uv1:add(entity.get(slot0.userid, true):get_index(), weaponname)
	end,
	item_pickup = function (slot0)
		if not uv0.enabled then
			return
		end

		slot1 = entity.get(slot0.userid, true):get_index()
		slot2 = slot0.item

		if slot0.defindex == 64 then
			slot2 = "revolver"
		end

		uv1:add(slot1, slot2)
	end
}) do
	events[slot16]:set(slot17)
end

events.shutdown:set(function ()
	uv0.methods.updatePlayer({}, true)
end)
