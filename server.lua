local inv = exports.ox_inventory

lib.addCommand('scratchgunserial', {
    help = 'Scratch the current gun\'s serial'
}, function(source, args, raw)
    local weapon = inv:GetCurrentWeapon(source)
    if weapon ~= nil then
        weapon.metadata.serial = 'The serial has been scratched off.'
        inv:SetMetadata(source, weapon.slot, weapon.metadata)
        TriggerClientEvent("chat:addMessage", source, {
            template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 300%; word-break: break-word; "> ^4[INFO]^0 '..weapon.label..': The serial has been removed </div>',
        })
    else
        TriggerClientEvent("chat:addMessage", source, {
            template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 300%; word-break: break-word; "> ^4[INFO]^0 You do not have a weapon to scratch the serial from. </div>',
        })
    end
end)
