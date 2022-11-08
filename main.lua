rang=false
num5=110
exit=false
rgbc=true
rgbl=true
rgbn=true
enterc=false
enterl=false
entern=false
rx,gx,bx=240,240,240

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end
function rgbcolor()
    if enterc==true then
    Citizen.CreateThread( function()
        while true do
            Wait( 0 )
            if rgbc==false then
                break
            end
            rgb = RGBRainbow(5)
            SetVehicleCustomPrimaryColour(veh, rgb.r, rgb.g, rgb.b)
          
            
            
            
        end
    end)
end
end
function rgblight()
    if enterl==true then
    Citizen.CreateThread( function()
        while true do
            Wait( 0 )
            if rgbc==false then
                break
            end
            rgb = RGBRainbow(5)
            ToggleVehicleMod(veh, 22, true)
            SetVehicleXenonLightsCustomColor(veh,rgb.r, rgb.g, rgb.b)
          
            
            
            
        end
    end)
end
end
function rgbneon()
    if entern==true then
    Citizen.CreateThread( function()
        while true do
            Wait( 0 )
            if rgbn==false then
                break
            end
            rgb = RGBRainbow(5)
            SetVehicleNeonLightEnabled(veh,0,true)
            SetVehicleNeonLightEnabled(veh,1,true)
            SetVehicleNeonLightEnabled(veh,2,true)
            SetVehicleNeonLightEnabled(veh,3,true)
            SetVehicleNeonLightsColour(veh,rgb.r, rgb.g, rgb.b)
            
            
            
        end
    end)
end

end
function maxspeed()
    Citizen.CreateThread( function()
        while true do
            Wait( 0 )
            SetVehicleCheatPowerIncrease(veh,0.2)
         
            
        end
    end)
end




function openmenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vippanel', {

        title = 'VIP Panel',

        align = 'top-left',

        elements = {
            { label = 'Fix Car', value = 'fix' },
            { label = 'Clean Car', value = 'clean' },
            { label = 'Change Color', value = 'color' },


        }


    }, function(data, menu)
        if data.current.value == 'color' then

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'colorchanger', {

        title = 'Color Changer',

        align = 'top-left',

        elements = {
            { label = 'Primery Color', value = 'primery' },
            { label = 'Lights Color', value = 'light' },
            { label = 'Neon Color', value = 'neon' },
            { label = 'Reset Defult', value = 'reset' },

        }


    }, function(data, menu)
        if data.current.value == 'primery' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'colors', {

                title = 'Primery',

                align = 'top-left',

                elements = {
                    { label = 'Red', value = 'red' },
                    { label = 'Green', value = 'green' },
                    { label = 'White', value = 'white' },
                    { label = 'Random', value = 'random' },
                    { label = 'RGB', value = 'rgb' },

                }


            }, function(data, menu)

                if data.current.value == 'red' then
                    rgbc=false
                    enterc=true
                    rgbcolor()
                    SetVehicleCustomPrimaryColour(veh, 255, 0,0)
                elseif data.current.value == 'green' then
                    rgbc=false
                    enterc=true
                    rgbcolor()
                    SetVehicleCustomPrimaryColour(veh, 0, 255, 0)
                elseif data.current.value == 'white' then
                    rgbc=false
                    enterc=true
                    rgbcolor()
                    SetVehicleCustomPrimaryColour(veh, 255, 255, 255)
                elseif data.current.value == 'random' then
                    rgbc=false
                    enterc=true
                    rgbcolor()
                    red = math.random(0, 255)
                    green = math.random(0, 255)
                    blue = math.random(0, 255)
                    SetVehicleCustomPrimaryColour(veh, red, green, blue)
                elseif data.current.value == 'rgb' then
                    enterc=true
                    rgbc=true
                    rgbcolor()
                   

                end

            end,

                function(data, menu)

                    menu.close()
                end)

          


            elseif data.current.value == 'light' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lights', {

                title = 'Lights',

                align = 'top-left',

                elements = {
                    { label = 'Red', value = 'red' },
                    { label = 'Green', value = 'green' },
                    { label = 'White', value = 'white' },
                    { label = 'Random', value = 'random' },
                    { label = 'RGB', value = 'rgb' },

                }


            }, function(data, menu)

                if data.current.value == 'red' then
                    rgbl=false
                    enterl=true
                    rgbcolor()
                    ToggleVehicleMod(veh, 22, true)
                    SetVehicleXenonLightsCustomColor(veh, 255, 0, 0)
                elseif data.current.value == 'green' then
                    rgbl=false
                    enterl=true
                    rgbcolor()
                    ToggleVehicleMod(veh, 22, true)
                    SetVehicleXenonLightsCustomColor(veh, 0, 255, 0)
                elseif data.current.value == 'white' then
                    rgbl=false
                    enterl=true
                    rgbcolor()
                    ToggleVehicleMod(veh, 22, true)
                    SetVehicleXenonLightsCustomColor(veh, 255, 255, 255)
                elseif data.current.value == 'random' then
                    rgbl=false
                    enterl=true
                    rgbcolor()
                    red = math.random(0, 255)
                    green = math.random(0, 255)
                    blue = math.random(0, 255)
                    ToggleVehicleMod(veh, 22, true)
                    SetVehicleXenonLightsCustomColor(veh, red, green, blue)
                elseif data.current.value == 'rgb' then
                    enterl=true
                    rgbl=true
                    rgblight()
                   

                end

            end,

                function(data, menu)

                    menu.close()
                end)

          
            elseif data.current.value == 'neon' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'neons', {

                title = 'Neons',

                align = 'top-left',

                elements = {
                    { label = 'Red', value = 'red' },
                    { label = 'Green', value = 'green' },
                    { label = 'Blue', value = 'blue' },
                    { label = 'Random', value = 'random' },
                    { label = 'RGB', value = 'rgb' },

                }


            }, function(data, menu)

                if data.current.value == 'red' then
                    rgbn=false
                    entern=true
                    rgbcolor()
                    SetVehicleNeonLightEnabled(veh,0,true)
                    SetVehicleNeonLightEnabled(veh,1,true)
                    SetVehicleNeonLightEnabled(veh,2,true)
                    SetVehicleNeonLightEnabled(veh,3,true)
                    SetVehicleNeonLightsColour(veh,255,0,0)
                elseif data.current.value == 'green' then
                    rgbn=false
                    entern=true
                    rgbcolor()
                    SetVehicleNeonLightEnabled(veh,0,true)
                    SetVehicleNeonLightEnabled(veh,1,true)
                    SetVehicleNeonLightEnabled(veh,2,true)
                    SetVehicleNeonLightEnabled(veh,3,true)
                    SetVehicleNeonLightsColour(veh,0,255,0)
                elseif data.current.value == 'blue' then
                    rgbn=false
                    entern=true
                    rgbcolor()
                    SetVehicleNeonLightEnabled(veh,0,true)
                    SetVehicleNeonLightEnabled(veh,1,true)
                    SetVehicleNeonLightEnabled(veh,2,true)
                    SetVehicleNeonLightEnabled(veh,3,true)
                    SetVehicleNeonLightsColour(veh,0,0,255)
                elseif data.current.value == 'random' then
                    rgbn=false
                    entern=true
                    rgbcolor()
                    red = math.random(0, 255)
                    green = math.random(0, 255)
                    blue = math.random(0, 255)
                    SetVehicleNeonLightEnabled(veh,0,true)
                    SetVehicleNeonLightEnabled(veh,1,true)
                    SetVehicleNeonLightEnabled(veh,2,true)
                    SetVehicleNeonLightEnabled(veh,3,true)
                    SetVehicleNeonLightsColour(veh,red,green,blue)
                elseif data.current.value == 'rgb' then
                    entern=true
                    rgbn=true
                    rgbneon()
                   

                end

            end,

                function(data, menu)

                    menu.close()
                end)


            elseif data.current.value == 'reset' then
            rgbc=false
                rgbl=false
                rgbn=false
                enterc=true
                enterl=true
                entern=true
                rgbcolor()
            rgb=false
            ToggleVehicleMod(veh, 22, true)
            SetVehicleXenonLightsCustomColor(veh,rx,gx,bx)
            SetVehicleCustomPrimaryColour(veh, r, g, b)
            SetVehicleNeonLightEnabled(veh,0,false)
            SetVehicleNeonLightEnabled(veh,1,false)
            SetVehicleNeonLightEnabled(veh,2,false)
            SetVehicleNeonLightEnabled(veh,3,false)

            menu.close()

        end

    end,

        function(data, menu)

            menu.close()
        end)
        elseif data.current.value == 'fix' then
                SetVehicleFixed(veh)
        elseif data.current.value == 'clean' then
                SetVehicleDirtLevel(veh,0.0)
                maxspeed()    
        end-----First If

    end,

        function(data, menu)

            menu.close()
        end)

end







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
                    openmenu()
                end 
            else
                if exit==false then                               
                rgbc=false
                rgbl=false
                rgbn=false
                enterc=true
                enterl=true
                entern=true
                rgbcolor()
                exit=true
                rang=false
                ToggleVehicleMod(veh, 22, true)
                SetVehicleXenonLightsCustomColor(veh,rx,gx,bx)
                SetVehicleCustomPrimaryColour(veh, r, g, b)
                SetVehicleNeonLightEnabled(veh,0,false)
                SetVehicleNeonLightEnabled(veh,1,false)
                SetVehicleNeonLightEnabled(veh,2,false)
                SetVehicleNeonLightEnabled(veh,3,false)
                end

            end

end
end)
       



