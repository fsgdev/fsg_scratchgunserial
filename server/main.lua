local inv = exports.ox_inventory
local config = require 'config.server'

if config.item then
    exports('serialscratcher', function(event, item, inventory, slot, data)
        if event == 'usedItem' then
            return scratchGunSerial(inventory.id)
        end
    end)
end

if config.command then
    lib.addCommand('scratchgunserial', {
        help = 'Scratch the current gun\'s serial'
    }, function(source)
        scratchGunSerial(source)
    end)
end

scratchGunSerial = function(source)
    local weapon = inv:GetCurrentWeapon(source)
    if weapon ~= nil then
        if config.progressBar.enabled then
            weapon.metadata.serial = locale('serial_number')
            local progressbar = lib.callback.await('fsg_scratchgunserial:progressBar', source, config.progressBar.duration)
            if progressbar then
                inv:SetMetadata(source, weapon.slot, weapon.metadata)
                if config.chatNotify.enabled then
                    TriggerClientEvent("chat:addMessage", source, {
                        template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 300%; word-break: break-word; "> ^4[INFO]^0 '..weapon.label..': '..locale('serial_removed')..' </div>',
                    })
                end
                if config.NotifySystem.enabled then
                    return config.NotifySystem.Notification(weapon.label..': '..locale('serial_removed'), 5000, 'success')
                end
            end
        else
            inv:SetMetadata(source, weapon.slot, weapon.metadata)
            if config.chatNotify.enabled then
                TriggerClientEvent("chat:addMessage", source, {
                    template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 300%; word-break: break-word; "> ^4[INFO]^0 '..weapon.label..': '..locale('serial_removed')..' </div>',
                })
            end
            if config.NotifySystem.enabled then
                return config.NotifySystem.Notification(weapon.label..': '..locale('serial_removed'), 5000, 'success')
            end
        end
    else
        if config.chatNotify.enabled then
            TriggerClientEvent("chat:addMessage", source, {
                template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 300%; word-break: break-word; "> ^4[INFO]^0 '..locale('doesnt_have_weapon')..' </div>',
            })
        end
        if config.NotifySystem.enabled then
            return config.NotifySystem.Notification(locale('doesnt_have_weapon'), 5000, 'error')
        end
    end
end
