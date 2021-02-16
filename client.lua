----------------MENU HEADER------------------
_menuPool  = NativeUI.CreatePool()
mainMenu   = NativeUI.CreateMenu('Jobcenter', nil)
_menuPool:Add(mainMenu)
----------------MENU HEADER------------------

----- Main Part ------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distanceToMarkerInfo = GetDistanceBetweenCoords(playerCoords, Config.Menu.Pos.x,Config.Menu.Pos.y,Config.Menu.Pos.z, true)

        if distanceToMarkerInfo < Config.ShowDistance then
            DrawMarker(Config.Marker.id,Config.Menu.Pos.x,Config.Menu.Pos.y,Config.Menu.Pos.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.radius*1.5, Config.Marker.radius*1.5, Config.Marker.radius, Config.Marker.colour.r, Config.Marker.colour.g, Config.Marker.colour.b, Config.Marker.colour.a, false, false, 2, false, false, false, false)
            if distanceToMarkerInfo < 1.5 then
                ShowInputNotification(Config.Menu.String)
                _menuPool:ProcessMenus()  
                if IsControlJustReleased(1, 38) then --38 = E Key
                    mainMenu:Visible(not mainMenu:Visible())
                end
            end
        end
    end
end)


Citizen.CreateThread(function()

    local blip = AddBlipForCoord(Config.MapBlip.Pos.x, Config.MapBlip.Pos.y, Config.MapBlip.Pos.z)
  
    SetBlipSprite (blip, Config.MapBlip.Sprite)
    SetBlipDisplay(blip, Config.MapBlip.Display)
    SetBlipScale  (blip, Config.MapBlip.Scale)
    SetBlipColour (blip, Config.MapBlip.Colour)
    SetBlipAsShortRange(blip, true)
  
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.MapBlip.Name)
    EndTextCommandSetBlipName(blip)
  
  end)
----- Main Part ------
----- Functions ------
function ShowInputNotification(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function InfoMenu(menu)

    for k, v in pairs(Config.Jobs) do

        local CategorySub = _menuPool:AddSubMenu(mainMenu, v.category)
        for k2, v2 in pairs(v.jobs) do
            local jobItem = NativeUI.CreateItem(v2.name, '~b~')
            CategorySub:AddItem(jobItem)

            jobItem.Activated = function(sender, index)
                TriggerServerEvent('infocenter:setJob', v2.job)
                ShowNotification('~g~You got the job ~w~' .. v2.name)
            end
        end
    end
end
----- Functions ------
------ Struktur ------
InfoMenu(mainMenu)
_menuPool:RefreshIndex()
_menuPool:MouseControlsEnabled (false)
_menuPool:MouseEdgeEnabled (false)
_menuPool:ControlDisablingEnabled(false)
------ Struktur ------