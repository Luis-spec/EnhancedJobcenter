ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('infocenter:setJob')
AddEventHandler('infocenter:setJob', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.setJob(job, 0)
end)
