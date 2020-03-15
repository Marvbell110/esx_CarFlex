Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPlayerNearAirport() then
			if IsControlJustPressed(0, 38) then
				mainMenu:Visible(not mainMenu:Visible())
			end
		else
			if  _menuPool:IsAnyMenuOpen() then
				mainMenu:Visible(not mainMenu:Visible())
			end				
		end
	end
end)