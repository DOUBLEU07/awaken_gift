ESX = nil 
 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 


ESX.RegisterServerCallback('w_gift:CheckonSql', function (source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchScalar('SELECT gift FROM users WHERE identifier=@identifier', {
		['@identifier']   = xPlayer.identifier
	}, function(result)
		cb(result)
	end)
end)

RegisterServerEvent('w_gift:CheckStatus')
AddEventHandler('w_gift:CheckStatus', function (matricularecebida)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchScalar('SELECT gift FROM users WHERE identifier=@identifier', {
		['@identifier']   = xPlayer.identifier
	}, function(resultadorecebeu)
		if resultadorecebeu == 0 then
			local matriculazinha = matricularecebida
        
					xPlayer.addInventoryItem(Config.Item1, Config.Item1Amount)
					xPlayer.addInventoryItem(Config.Item2, Config.Item2Amount)
					xPlayer.addInventoryItem(Config.Item3, Config.Item3Amount)
					xPlayer.addInventoryItem(Config.Item5, Config.Item5Amount)
					xPlayer.addInventoryItem(Config.Item6, Config.Item6Amount)
					xPlayer.addInventoryItem(Config.Item7, Config.Item7Amount)
					xPlayer.addInventoryItem(Config.Item8, Config.Item8Amount)
					xPlayer.addInventoryItem(Config.Item9, Config.Item9Amount)

                    MySQL.Sync.execute("UPDATE users SET gift=1 WHERE identifier=@identifier", 
						{   ['@identifier']   = xPlayer.identifier,	}
					)

		end
	end)

end)


