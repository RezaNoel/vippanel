
    -------------------ساخت آر جی بی-------------------
    function RGBRainbow( frequency )
        local result = {}
        local curtime = GetGameTimer() / 1000
    
        result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
        result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
        result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
        
        return result
    end
    
    
    -------------------ست کردن آر جی بی-------------------
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
