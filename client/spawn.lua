ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function CreateCar(car)
	mainMenu:Visible(not mainMenu:Visible())

	ESX.Game.SpawnVehicle(car, Config.zones.VehicleSpawnPoint.Pos, 57.76, function(vehicle)
		local playerPed   = GetPlayerPed(-1)
		
		SetVehicleOnGroundProperly(vehicle)
		SetVehicleEngineOn(vehicle, true, true, true)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
		SetModelAsNoLongerNeeded(vehicle)
		
	end)
end

RegisterNetEvent("carflex:createcar")
AddEventHandler("carflex:createcar",  function(car)
	CreateCar(car)
end)

RegisterNetEvent("carflex:moneyInvalid")
AddEventHandler("carflex:moneyInvalid", function()
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName("Sie haben nicht genug Geld!\n")
	SetNotificationMessage("CHAR_BLOCKED", "CHAR_BLOCKED", true, 4, "CarFlex", "", "~r~Sie konnten sich kein Fahrzeug Mieten!\n")
	DrawNotification(false, true)
end)
