TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Farm

RegisterNetEvent('recolteferrailles')
AddEventHandler('recolteferrailles', function()
    local item = "ferrailles"
    local limiteitem = 100
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)

RegisterNetEvent('traitementpieces_detacher')
AddEventHandler('traitementpieces_detacher', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local ferrailles = xPlayer.getInventoryItem('ferrailles').count
    local pieces_detacher = xPlayer.getInventoryItem('pieces_detacher').count

    if pieces_detacher > 250 then
        TriggerClientEvent('esx:showNotification', source, '~r~Il semble que tu ne puisses plus porter de  ferrailles...')
    elseif ferrailles < 2 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de  ferrailles pour traiter...')
    else
        xPlayer.removeInventoryItem('ferrailles', 2)
        xPlayer.addInventoryItem('pieces_detacher', 1)
    end
end)


RegisterServerEvent('sellpiecesdetacher')
AddEventHandler('sellpiecesdetacher', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local pieces_detacher = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "pieces_detacher" then
			pieces_detacher = item.count
		end
	end
    
    
    if pieces_detacher > 0 then
        xPlayer.removeInventoryItem('pieces_detacher', 1)
        xPlayer.addMoney(120)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous avez gagner ~b~40$~g~ pour chaque vente d'un  Pieces detacher")
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'avez plus Pieces detacher à vendre")
    end
end)


--viande

RegisterServerEvent('sellviande')
AddEventHandler('sellviande', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local viande = 0

    for i=1, #xPlayer.inventory, 1 do
        local item = xPlayer.inventory[i]

        if item.name == "viande" then
            viande = item.count
        end
    end
    
    
    if viande > 0 then
        xPlayer.removeInventoryItem('viande', 1)
        xPlayer.addMoney(210)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous avez gagner ~b~210$~g~ pour chaque vente d'un  Poissons")
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'avez plus de poisson à vendre")
    end
end)
