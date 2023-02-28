local rang=false
local num5=110
local exit=false
local rgbc=true


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

RegisterCommand('vip', function (source)
    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'vipsetting',{
        title='VIP Setting',
        align='top-right',
        elements={
            {label='Manage Ranks',value='manageranks'},
            {label='VIP Members',value='vipmembers'},
            {label='Manage Members',value='managemembers'}
        }},
    function (data,menu)
        menu.close()
        if data.current.value=='manageranks' then
            ESX.UI.Menu.Open('default',GetCurrentResourceName(),'manageranks',{
                title='Manage Ranks',
                align='top-right',
                elements={
                    {label='Add Rank',value='addrank'},
                    {label='Remove',value='vipmembers'},
                    {label='Manage Members',value='managemembers'}
                }},
            function (data,menu)
                menu.close()
                if data.current.value=='manageranks' then
                    print('Ranks..!')
                elseif data.current.value=='vipmembers' then
                    print('Memebers..!')
                elseif data.current.value=='managemembers' then
                    print('Manage..!')
                end
            end,function (data,menu) menu.close() end)
        elseif data.current.value=='vipmembers' then
            print('Memebers..!')
        elseif data.current.value=='managemembers' then
            print('Manage..!')
        end
    end,function (data,menu) menu.close() end)
end, false)

