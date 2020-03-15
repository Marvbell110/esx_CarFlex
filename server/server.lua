ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("carflex:payTicket")
AddEventHandler("carflex:payTicket", function(price, car)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
		TriggerClientEvent("carflex:createcar", _source, car)
	elseif xPlayer.getBank() >= price then
		xPlayer.removeBank(price)
		TriggerClientEvent("carflex:createcar", _source, car)
	else
		TriggerClientEvent("carflex:moneyInvalid", _source)
	end
end)