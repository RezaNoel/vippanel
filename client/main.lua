local rang=false
local num5=110
local exit=false
local rgbc=true

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


    ------------------گرفتن و تغییر به رنگ اولیه ، بسته شدن منو-------------------
CreateThread(function ()
    while true do
        Wait(0)
            veh = GetVehiclePedIsIn(GetPlayerPed(-1), -1)
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                if IsControlPressed(0, num5) then  
                    if rang==false then
                        rang = true
                        exit = false
                        r, g, b = GetVehicleCustomPrimaryColour(veh)
                    end  
                    vipmenu()
                    
                end 
            else
                if exit==false then                               
                rgbc=false
                exit=true
                rang=false
                cc("reset",255,255,255)
                ESX.UI.Menu.CloseAll()

                end

            end

end
end)

