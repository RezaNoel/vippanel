------------سرور تا ساخت ایونت ها پیش رفت فقط باید در کلاینت استفاده بشه


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function AddVip(target, name, cb)
	local identifier = GetPlayerIdentifier(target, 0)

	MySQL.Async.execute('INSERT INTO vip_user (Name, Owner) VALUES (@Name, @Owner)', {
		['@Name']  = name,
		['@Owner'] = identifier
	}, function(rowsChanged)
		if cb ~= nil then
			cb()
		end
	end)
end

function RemoveVip(target, name, cb)
	local identifier = GetPlayerIdentifier(target, 0)

	MySQL.Async.execute('DELETE FROM vip_user WHERE Name = @Name AND Owner = @Owner', {
		['@Name']  = name,
		['@Owner'] = identifier
	}, function(rowsChanged)
		if cb ~= nil then
			cb()
		end
	end)
end

function GetVip(name, cb)
	MySQL.Async.fetchAll('SELECT * FROM vip WHERE Name = @Name', {
		['@Name'] = name
	}, function(result)
		local data = {
			name  = name,
			label = result[1].label
		}

		cb(data)
	end)
end

function GetVips(target, cb)
	local identifier = GetPlayerIdentifier(target, 0)

	MySQL.Async.fetchAll('SELECT * FROM vip_user WHERE Owner = @Owner', {
		['@Owner'] = identifier
	}, function(result)
		local vip   = {}
		local asyncTasks = {}

		for i=1, #result, 1 do

			local scope = function(name)
				table.insert(asyncTasks, function(cb)
					MySQL.Async.fetchAll('SELECT * FROM vip WHERE Name = @Name', {
						['@Name'] = name
					}, function(result2)
						table.insert(vip, {
							Name  = name,
							label = result2[1].label
						})

						cb()
					end)
				end)
			end

			scope(result[i].name)

		end

		Async.parallel(asyncTasks, function(results)
			cb(vip)
		end)

	end)
end

function CheckVip(target, name, cb)
	local identifier = GetPlayerIdentifier(target, 0)

	MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM vip_user WHERE Name = @Name AND Owner = @Owner', {
		['@Name']  = name,
		['@Owner'] = identifier
	}, function(result)
		if tonumber(result[1].count) > 0 then
			cb(true)
		else
			cb(false)
		end

	end)
end

function GetVipList(cb)
	MySQL.Async.fetchAll('SELECT * FROM vip', {
		['@Name'] = name
	}, function(result)
		local vip = {}

		for i=1, #result, 1 do
			table.insert(vip, {
				name  = result[i].name,
				label = result[i].label
			})
		end

		cb(vip)
	end)
end

RegisterNetEvent('vippanel:addvip')
AddEventHandler('vippanel:addvip', function(target, name, cb)
	AddVip(target, name, cb)
end)

RegisterNetEvent('vippanel:removevip')
AddEventHandler('vippanel:removevip', function(target, name, cb)
	RemoveVip(target, name, cb)
end)

AddEventHandler('vippanel:getvip', function(name, cb)
	GetVip(name, cb)
end)

AddEventHandler('vippanel:getvips', function(target, cb)
	GetVips(target, cb)
end)

AddEventHandler('vippanel:checkvip', function(target, name, cb)
	CheckVip(target, name, cb)
end)

AddEventHandler('vippanel:getvipList', function(cb)
	GetVipList(cb)
end)

ESX.RegisterServerCallback('vippanel:getvip', function(source, cb, name)
	GetVip(name, cb)
end)

ESX.RegisterServerCallback('vippanel:getvips', function(source, cb, target)
	GetVips(target, cb)
end)

ESX.RegisterServerCallback('vippanel:checkvip', function(source, cb, target, name)
	CheckVip(target, name, cb)
end)

ESX.RegisterServerCallback('vippanel:getvipList', function(source, cb)
	GetVipList(cb)
end)