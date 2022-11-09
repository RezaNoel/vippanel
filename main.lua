local rang=false
local num5=110
local exit=false
local rgbc=true


ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


    ------------------بازکردن منو-------------------
local function vipmenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vippanel', {
        title = 'VIP Panel',
        align = 'top-left',
        elements = {
            { label = 'Fix Car', value = 'fix' },
            { label = 'Clean Car', value = 'clean' },
            { label = 'Change Color', value = 'color' },
        }
    }, 
    function(data, menu)
    if data.current.value == 'color' then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'colorchanger', {
            title = 'Color Changer',
            align = 'top-left',
            elements = {
                { label = 'Primary Color', value = 'primary' },
                { label = 'Lights Color', value = 'light' },
                { label = 'Neon Color', value = 'neon' },
                { label = 'Reset Defult', value = 'reset' },
            }
        }, 
        function(data, menu)
        if data.current.value == 'primary' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'colors', {
                title = 'Primary',
                align = 'top-left',
                elements = {
                    { label = 'Red', value = 'red' },
                    { label = 'Black', value = 'black' },
                    { label = 'White', value = 'white' },
                    { label = 'Random', value = 'random' },
                    { label = 'RGB', value = 'rgb' },
                }
            }, 
            function(data, menu)
                if data.current.value == 'red' then
                    cc("primary",255,0,0)
                elseif data.current.value == 'black' then
                    cc("primary",0,0,0)
                elseif data.current.value == 'white' then
                    cc("primary",255,255,255)
                elseif data.current.value == 'random' then
                    red = math.random(0, 255)
                    green = math.random(0, 255)
                    blue = math.random(0, 255)
                    cc("primary",red,green,blue)
                elseif data.current.value == 'rgb' then
                    rgbc=true
                    rgbcolor("primary")
                end
            end,function(data, menu)menu.close()end)
        elseif data.current.value == 'light' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lights', {
                title = 'Lights',
                align = 'top-left',
                elements = {
                    { label = 'Red', value = 'red' },
                    { label = 'Black', value = 'black' },
                    { label = 'White', value = 'white' },
                    { label = 'Random', value = 'random' },
                    { label = 'RGB', value = 'rgb' },
                }
            }, 
            function(data, menu)             
                if data.current.value == 'red' then
                    cc("light",255,0,0)
                elseif data.current.value == 'black' then
                    cc("light",0,0,0)
                elseif data.current.value == 'white' then
                    cc("light",255,255,255)
                elseif data.current.value == 'random' then
                    red = math.random(0, 255)
                    green = math.random(0, 255)
                    blue = math.random(0, 255)
                    cc("light",red,green,blue)
                elseif data.current.value == 'rgb' then
                    rgbl=true
                    rgbcolor("light")
                end
            end,function(data, menu)menu.close()end)         
        elseif data.current.value == 'neon' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'neons', {
                title = 'Neons',
                align = 'top-left',
                elements = {
                    { label = 'Red', value = 'red' },
                    { label = 'Black', value = 'black' },
                    { label = 'White', value = 'white' },
                    { label = 'Random', value = 'random' },
                    { label = 'RGB', value = 'rgb' },
                }
            }, 
            function(data, menu)
                if data.current.value == 'red' then
                    cc("neon",255,0,0)
                elseif data.current.value == 'black' then
                    cc("neon",0,0,0)
                elseif data.current.value == 'white' then
                    cc("neon",255,255,255)
                elseif data.current.value == 'random' then
                    red = math.random(0, 255)
                    green = math.random(0, 255)
                    blue = math.random(0, 255)
                    cc("neon",red,green,blue)
                elseif data.current.value == 'rgb' then
                    rgbn=true
                    rgbcolor("primary")
                end
            end,function(data, menu)menu.close()end)
        elseif data.current.value == 'reset' then
            cc("reset",255,255,255)
            menu.close()
        end
        end,function(data, menu)menu.close()end)
    elseif data.current.value == 'fix' then
                SetVehicleFixed(veh)
    elseif data.current.value == 'clean' then
                SetVehicleDirtLevel(veh,0.0)
    end-----First If

end,function(data, menu)menu.close()end)-----First Open Menu
end----Function

    ------------------گرفتن رنگ اولیه و ریست-------------------
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
                end

            end

end
end)