    --------------------ساخت آر جی بی--------------------
function RGBRainbow( frequency )
        local result = {}
        local curtime = GetGameTimer() / 1000
    
        result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
        result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
        result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
        
        return result
end
    -------------------ست کردن آر جی بی------------------
function rgbcolor(mode)
    Citizen.CreateThread( function()
        while true do
            Wait( 0 )
            if rgbc==false then
                break
            elseif rgbc==true then
                rgb = RGBRainbow(5)
                if mode=="primary" then
                    SetVehicleCustomPrimaryColour(veh, rgb.r, rgb.g, rgb.b)
                elseif mode=="light" then
                    ToggleVehicleMod(veh, 22, true)
                    SetVehicleXenonLightsCustomColor(veh,rgb.r, rgb.g, rgb.b)
                elseif mode=="neon" then
                    SetVehicleNeonLightEnabled(veh,0,true)
                    SetVehicleNeonLightEnabled(veh,1,true)
                    SetVehicleNeonLightEnabled(veh,2,true)
                    SetVehicleNeonLightEnabled(veh,3,true)
                    SetVehicleNeonLightsColour(veh,rgb.r, rgb.g, rgb.b)
                else
                    TriggerEvent("chatMessage","[Error]",{255,255,0},"rgb moshakhas nashode baraye kojast..!")
                end
            else
                TriggerEvent("chatMessage","[Error]",{255,255,0},"rgbc tarif nashode ast..!")
            end               
        end
    end)
end
    -------------------ست کردن رنگ ثابت-------------------
function cc(cmode,cr,cg,cb)
rgbc=false
rgbcolor()
if cmode=="primary" then
    SetVehicleCustomPrimaryColour(veh, cr, cg,cb)
elseif cmode=="light" then
    ToggleVehicleMod(veh, 22, true)
    SetVehicleXenonLightsCustomColor(veh, cr,cg,cb)
elseif cmode=="neon" then
    SetVehicleNeonLightEnabled(veh,0,true)
    SetVehicleNeonLightEnabled(veh,1,true)
    SetVehicleNeonLightEnabled(veh,2,true)
    SetVehicleNeonLightEnabled(veh,3,true)
    SetVehicleNeonLightsColour(veh,cr,cg,cb)
elseif cmode=="reset" then
    ToggleVehicleMod(veh, 22, true)
    SetVehicleXenonLightsCustomColor(veh,cr,cg,cb)
    SetVehicleCustomPrimaryColour(veh, r, g, b)
    SetVehicleNeonLightEnabled(veh,0,false)
    SetVehicleNeonLightEnabled(veh,1,false)
    SetVehicleNeonLightEnabled(veh,2,false)
    SetVehicleNeonLightEnabled(veh,3,false)
else
    TriggerEvent("chatMessage","[Error]",{255,255,0},"rang moshakhas nashode baraye kojast..!")
end
end

    ------------------بازکردن منو-------------------
function vipmenu()
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
                    rgbc=true
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
                    rgbc=true
                    rgbcolor("neon")
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

