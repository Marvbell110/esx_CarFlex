_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("CarFlex", "~s~Vehicle Rental")
_menuPool:Add(mainMenu)

_menuPool:ControlDisablingEnabled(false)
_menuPool:MouseControlsEnabled(false)

function AddCarFlexMenu(menu)
	Panto = NativeUI.CreateItem("Panto", "Vehicle rental for "..Config.price.moneyCurrency .."" ..Config.price.ticketPricePanto)
	Faggio = NativeUI.CreateItem("Faggio", "Vehicle rental for  "..Config.price.moneyCurrency .."" ..Config.price.ticketPriceFaggio)

    menu:AddItem(Panto)
	menu:AddItem(Faggio)
    menu.OnItemSelect = function(sender, item, index)
        if item == Panto then
			car = "panto"
        	TriggerServerEvent('carflex:payTicket', Config.price.ticketPricePanto, car)
		elseif item == Faggio then
			car = "faggio"
        	TriggerServerEvent('carflex:payTicket', Config.price.ticketPriceFaggio, car)
        end
    end
end

AddCarFlexMenu(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		_menuPool:ProcessMenus()
	end
end)