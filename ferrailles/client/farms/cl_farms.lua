Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- Récolte de boulont ---

local mainMenu = RageUI.CreateMenu('~p~Récolte', '~p~ferrailles')

function OpenMenuRecolte()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 

			RageUI.Button("Commencer la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecolte()
				end
			})

			RageUI.Button("Stopper la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopRecolte()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---
function StopRecolte()
    if recoltepossible then
    	recoltepossible = false
    end
end

function StartRecolte()
    if not recoltepossible then
        recoltepossible = true
    while recoltepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('recolteferrailles')
    end
    else
        recoltepossible = false
    end
end

----OUVRIR LE MENU------------

local position = {
	{x = -492.594, y = -1755.53, z = 18.288}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 4.0 then
            wait = 0
            DrawMarker(20, -492.594, -1755.53, 18.288, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 79, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~p~récolter", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuRecolte()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end

end)

--- Traitement des boulont ---

local mainMenu = RageUI.CreateMenu('~p~Traitement', '~p~pieces detacher')

function OpenMenuTraitement()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 

			RageUI.Button("Commencer le Traitement", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartTraitement()
				end
			})

			RageUI.Button("Stopper le Traitement", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopTraitement()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---

function StopTraitement()
    if traitementpossible then
    	traitementpossible = false
    end
end

function StartTraitement()
    if not traitementpossible then
        traitementpossible = true
    while traitementpossible do
            Citizen.Wait(2000)
            TriggerServerEvent('traitementpieces_detacher')
    end
    else
        traitementpossible = false
    end
end

----OUVRIR LE MENU------------

local position = {
	{x = 473.4066, y = -1312.24, z = 29.207}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 4.0 then
            wait = 0
            DrawMarker(20, 473.4066, -1312.24, 29.207, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 79, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~p~traiter", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuTraitement()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end

end)


local blips = {

	{title="Recolte de ferrailles ", colour=5, id=540,  x = -492.594, y = -1755.53, z = 18.288},
	{title="Traitement de pieces detacher ", colour=5, id=540,  x = 473.4066, y = -1312.24, z = 29.207},
	{title="Vente de pieces detacher ", colour=5, id=540,  x = 1562.245, y = -2151.81, z = 77.522}
 }

Citizen.CreateThread(function()

	 recolteorange = AddBlipForCoord(-492.594, -1755.53, 18.288)
	 SetBlipSprite(recolteorange, 540)
	 SetBlipScale(recolteorange, 0.7)
	 SetBlipColour(recolteorange, 5)
	 SetBlipAsShortRange(recolteorange, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString("Recolte de ferrailles")
	 EndTextCommandSetBlipName(recolteorange)
   end)
  
Citizen.CreateThread(function()

	 traitementorange = AddBlipForCoord(473.4066, -1312.24, 29.207)
	 SetBlipSprite(traitementorange, 540)
	 SetBlipScale(traitementorange, 0.7)
	 SetBlipColour(traitementorange, 5)
	 SetBlipAsShortRange(traitementorange, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString("Traitement de pieces detacher")
	 EndTextCommandSetBlipName(traitementorange)
   end)

Citizen.CreateThread(function()

	 venteorange = AddBlipForCoord(1562.245, -2151.81, 77.522)
	 SetBlipSprite(venteorange, 540)
	 SetBlipScale(venteorange, 0.7)
	 SetBlipColour(venteorange, 5)
	 SetBlipAsShortRange(venteorange, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString("Vente de pieces detacher")
	 EndTextCommandSetBlipName(venteorange)
   end)

