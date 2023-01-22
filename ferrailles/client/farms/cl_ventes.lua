

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('~p~Ventes', '~p~pieces detacher')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function VentesMeca()
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

			RageUI.Button("Vendre pieces detacher", nil, {RightLabel = "~r~120€"}, true , {
				onSelected = function()
                    TriggerServerEvent('sellpiecesdetacher')
				end
			}, subMenu)

		   end)
		Wait(0)
	   end
	end)
 end
end
		-------------------------------------------------------------------------------------------------------

local position = {
	{x = 1562.245, y = -2151.81, z = 77.522}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 4.0 then
            wait = 0
			DrawMarker(20, 1562.245, -2151.81, 77.522, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 1.0, 1.0, 1.0, 136, 14, 79, 255, true, true, p19, true)   

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~p~intéragir", 1) 
                if IsControlJustPressed(1,51) then
					VentesMeca()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end)


--

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('~p~Ventes', '~p~Viande')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function VentesViande()
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

			RageUI.Button("Vendre Viande", nil, {RightLabel = "~r~120€"}, true , {
				onSelected = function()
                    TriggerServerEvent('sellviande')
				end
			}, subMenu)

		   end)
		Wait(0)
	   end
	end)
 end
end
		-------------------------------------------------------------------------------------------------------

local position = {
	{x = 983.0964, y = -2126.03, z = 30.475}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 4.0 then
            wait = 0
			DrawMarker(20, 983.0964, -2126.03, 30.475, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.6, 0.6, 0.6, 136, 14, 79, 255, true, true, p19, true)   

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~p~intéragir", 1) 
                if IsControlJustPressed(1,51) then
					VentesViande()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end)
