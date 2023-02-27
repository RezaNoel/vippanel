RegisterCommand("addvip", function (source)
    _source=source
    local identifier = GetPlayerIdentifier(source, 0)
    TriggerEvent('vippanel:addvip', _source, 'rank1',function ()
    print('Vip added to '.. identifier ..'..!')
    end)
end, false)

RegisterCommand("removevip", function (source)
    _source=source
    local identifier = GetPlayerIdentifier(source, 0)
    TriggerEvent('vippanel:removevip', _source, 'rank1',function ()
    print('Vip removed from '.. identifier ..'..!')
    end)
end, false)

RegisterCommand("checkvip", function (source)
    _source=source
    local identifier = GetPlayerIdentifier(source, 0)
    TriggerEvent('vippanel:getvips', _source,'rank1',function ()
        if cb()== true then
            print('true')
        else
            print('false')
        end
    end)
end, false)