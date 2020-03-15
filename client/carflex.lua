StartPoints = {
	{x= -966.66, y= -2610.65, z=12.98},
}

local function CreateCarFlexBlips()
	for k,v in pairs(StartPoints) do
		blip = AddBlipForCoord(v.x, v.y, v.z-1)
		SetBlipSprite(blip, 89)
		SetBlipColour(blip, 1)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("CarFlex")
		EndTextCommandSetBlipName(blip)
	end
end

function IsPlayerNearAirport()
	for k,v in pairs(StartPoints) do
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), true), v.x, v.y, v.z, true) < 80.0 then
			if not IsPedInAnyVehicle(PlayerPedId()) then
				if not _menuPool:IsAnyMenuOpen() then
				end
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), true), v.x, v.y, v.z, true) < 2.0 then
			if not _menuPool:IsAnyMenuOpen() then
				if not IsHelpMessageBeingDisplayed() then
					BeginTextCommandDisplayHelp("STRING")
					AddTextComponentSubstringPlayerName(GetLabelText("MATC_DPADRIGHT"))
					EndTextCommandDisplayHelp(0, 0, 1, -1)
				end
			else
				ClearAllHelpMessages()
			end
			return true
		end
	end
end

Citizen.CreateThread(function()
	CreateCarFlexBlips()
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_y_business_03"))
	
    while not HasModelLoaded(GetHashKey("a_m_y_business_03")) do
        Wait(1)
    end
	
	for _, item in pairs(Config.ped) do
		local npc = CreatePed(4, 0xA1435105, item.x, item.y, item.z, item.heading, false, true)
			
		SetEntityHeading(npc, item.heading)
		FreezeEntityPosition(npc, true)
		SetEntityInvincible(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)
	end
end)