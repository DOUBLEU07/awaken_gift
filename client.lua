ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
	PlayerData = ESX.GetPlayerData()
end)


Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169,
	["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162,
	["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199,
	["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82,
	["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61,
	["N9"] = 118
}

local status = false

Citizen.CreateThread(function()
	while true do
		Wait(1)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.Santa.gift.coords, true) < 15 then
			ShowToolTipGift("<font face ='font4thai'>กด ~b~E~s~ เพื่อรับของเริ่มต้นผู้เล่นใหม่ แล้วกระโดดลงไปเลย (พยายามอย่าชนตึก) "
				, Config.X, Config.Y, Config.Z + 1)
			if IsControlJustReleased(0, Keys['E']) then
				ESX.TriggerServerCallback('w_gift:CheckonSql', function(check)
					if status == false then
						status = true
						if check == 0 then
							status = true
							TriggerServerEvent('w_gift:CheckStatus', novamatricula) --- สำหรับแอดรถ
							TriggerEvent("pNotify:SendNotification",
								{ text = " <center><b style ='color:red'>คุณได้รับของขวัญ </center>",
									type = "alert", timeout = 5000,
									layout = "bottomCenter" })
						end
					else
						TriggerEvent("pNotify:SendNotification",
							{ text = " <center><b style ='color:red'>คุณได้ร่วมกิจกรรมไปแล้ว  </center>",
								type = "alert", timeout = 5000,
								layout = "bottomCenter" })
					end
				end)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.Santa.gift.coords, true) < 15 then
			for k, v in pairs(Config.Npc) do
				if Config.Npc ~= nil then
					local x, y, z = table.unpack(v.coords)
					RequestModel(GetHashKey(v.NPC.Model))
					while not HasModelLoaded(GetHashKey(v.NPC.Model)) do
						Wait(1)
					end

					local playerPed = CreatePed(4, v.NPC.Model, x, y, z - 1.0, v.NPC.heading, false, true)
					FreezeEntityPosition(playerPed, true)
					SetEntityInvincible(playerPed, true)
					SetBlockingOfNonTemporaryEvents(playerPed, true)
					print(v.NPC.Animation)
					SetPedHeadBlendData(playerPed, v.NPC.Cloth.face1, v.NPC.Cloth.face1, v.NPC.Cloth.face1, v.NPC.Cloth.skin,
						v.NPC.Cloth.skin, v.NPC.Cloth.skin, 1.0, 1.0, 1.0, true)
					SetPedEyeColor(playerPed, v.NPC.Cloth.eye_color, 0, 1) -- Eyes color
					SetPedComponentVariation(playerPed, 2, v.NPC.Cloth.hair_1, v.NPC.Cloth.hair_2, 2) -- Hair
					SetPedHairColor(playerPed, v.NPC.Cloth.hair_color_1, v.NPC.Cloth.hair_color_2) -- Hair Color
					SetPedComponentVariation(playerPed, 11, v.NPC.Cloth.torso_1, v.NPC.Cloth.torso_2, 2) -- torso parts
					SetPedComponentVariation(playerPed, 8, v.NPC.Cloth.tshirt_1, v.NPC.Cloth.tshirt_2, 2) -- Tshirt
					SetPedComponentVariation(playerPed, 3, v.NPC.Cloth.arms, v.NPC.Cloth.arms_2, 2) -- Amrs
					SetPedComponentVariation(playerPed, 4, v.NPC.Cloth.pants_1, v.NPC.Cloth.pants_2, 2) -- pants
					SetPedComponentVariation(playerPed, 6, v.NPC.Cloth.shoes_1, v.NPC.Cloth.shoes_2, 2) -- shoes
					SetPedComponentVariation(playerPed, 10, v.NPC.Cloth.decals_1, v.NPC.Cloth.decals_2, 2) -- decals
					SetPedComponentVariation(playerPed, 1, v.NPC.Cloth.mask_1, v.NPC.Cloth.mask_2, 2)
					SetPedComponentVariation(playerPed, 9, v.NPC.Cloth.bproof_1, v.NPC.Cloth.bproof_2, 2)
					SetPedComponentVariation(playerPed, 7, v.NPC.Cloth.chain_1, v.NPC.Cloth.chain_2, 2)
					SetPedComponentVariation(playerPed, 5, v.NPC.Cloth.bags_1, v.NPC.Cloth.bags_2, 2)
					SetPedPropIndex(playerPed, 2, v.NPC.Cloth.ears_1, v.NPC.Cloth.ears_2, 2) -- Ears Accessories
					SetPedPropIndex(playerPed, 0, v.NPC.Cloth.helmet_1, v.NPC.Cloth.helmet_2, 2)
					SetPedPropIndex(playerPed, 1, v.NPC.Cloth.glasses_1, v.NPC.Cloth.glasses_2, 2)
					SetPedPropIndex(playerPed, 6, v.NPC.Cloth.watches_1, v.NPC.Cloth.watches_2, 2)
					SetPedPropIndex(playerPed, 7, v.NPC.Cloth.bracelets_1, v.NPC.Cloth.bracelets_2)
					SetPedHeadOverlay(playerPed, 1, v.NPC.Cloth.beard_1, (v.NPC.Cloth.beard_2 / 10) + 0.0)
					SetPedHeadOverlayColor(playerPed, 1, 1, v.NPC.Cloth.beard_3, v.NPC.Cloth.beard_4) -- Beard Color
					SetPedHeadOverlay(playerPed, 2, v.NPC.Cloth.eyebrow_type, (v.NPC.Cloth.eyebrow_size / 10) + 0.0) -- Eyebrows + opacity
					SetPedHeadOverlayColor(playerPed, 2, 1, v.NPC.Cloth.eyebrow_color_1, v.NPC.Cloth.eyebrow_color_2) -- Eyebrows Color
					SetPedHeadOverlay(playerPed, 4, v.NPC.Cloth.makeup_type, (v.NPC.Cloth.makeup_thickness / 10) + 0.0) -- Makeup + opacity
					SetPedHeadOverlay(playerPed, 8, v.NPC.Cloth.lipstick_type, (v.NPC.Cloth.lipstick_thickness / 10) + 0.0) -- Lipstick + opacity
					SetPedHeadOverlay(playerPed, 5, v.NPC.Cloth.blush, (v.NPC.Cloth.blush_1 / 10) + 0.0) -- Blush + opacity
					SetPedHeadOverlay(playerPed, 6, v.NPC.Cloth.complexion, (v.NPC.Cloth.complexion_1 / 10) + 0.0) -- Complexion + opacity
					SetPedHeadOverlay(playerPed, 7, v.NPC.Cloth.sun, (v.NPC.Cloth.sun_1 / 10) + 0.0) -- Sun Damage + opacity
					SetPedHeadOverlay(playerPed, 9, v.NPC.Cloth.freckles, (v.NPC.Cloth.freckles_1 / 10) + 0.0) -- Moles/Freckles + opacity
					SetPedHeadOverlay(playerPed, 10, v.NPC.Cloth.chest_hair, (v.NPC.Cloth.chest_hair_1 / 10) + 0.0) -- Chest Hair + opacity
					SetPedHeadOverlay(playerPed, 11, v.NPC.Cloth.bodyb, (v.NPC.Cloth.bodyb_size / 10) + 0.0) -- Body Blemishes + opacity
					SetPedHeadOverlayColor(playerPed, 10, 1, v.NPC.Cloth.chest_color) -- Torso Color
					SetPedHeadOverlayColor(playerPed, 4, 1, v.NPC.Cloth.makeup_color_1, v.NPC.Cloth.makeup_color_2) -- Makeup Color
					SetPedHeadOverlayColor(playerPed, 5, 2, v.NPC.Cloth.blush_color) -- Blush Color
					SetPedHeadOverlayColor(playerPed, 8, 1, v.NPC.Cloth.lipstick_color_1, v.NPC.Cloth.lipstick_color_2) -- Lipstick Color
					ApplyPedOverlay(playerPed, GetHashKey(v.NPC.collection), GetHashKey(v.NPC.nameHash))
				end
				if v.NPC.Animation then
					if v.NPC.Animation.Scenario then
						TaskStartScenarioInPlace(playerPed, v.NPC.Animation.AnimationScene, 0, false)
					else
						RequestAnimDict(v.NPC.Animation.AnimationDirect)
						while (not HasAnimDictLoaded(v.NPC.Animation.AnimationDirect)) do Citizen.Wait(0) end
						Wait(100)
						TaskPlayAnim(playerPed, v.NPC.Animation.AnimationDirect, v.NPC.Animation.AnimationScene, 20.0, -20.0, -1, 1, 0,
							false, false, false)
					end
				end
			end
		end
	end
end)





function Draw3DTextForJob(x, y, z, textInput, fontId, scaleX, scaleY)
	local px, py, pz = table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
	local scale = (1 / dist) * 20
	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov
	SetTextScale(scaleX * scale, scaleY * scale)

	SetTextFont(fontIdThai)
	SetTextProportional(0)
	fontIdThai = RegisterFontId(Config.Fonts)
	RegisterFontFile('Mitr')
	SetTextColour(26, 169, 198, 255)
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x, y, z + 2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end

function ShowToolTipGift(msg, x, y, z)
	AddTextEntry('Test', msg)
	SetFloatingHelpTextWorldPosition(1, x, y, z)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('Test')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

function Draw3DTextsss(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local px, py, pz = table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

	local scale = (1 / dist)
	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov
	RegisterFontFile('font4thai')
	fontId = RegisterFontId('font4thai')

	if onScreen then
		SetTextScale(1.0 * scale, 1.75 * scale)
		SetTextFont(fontId)
		SetTextProportional(1)
		-- SetTextScale(0.0, 0.55)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(2, 0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x, _y)
	end
end
