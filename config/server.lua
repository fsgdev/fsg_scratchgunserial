return {
    command = true,
    chatNotify = {
        enabled = false -- can be both chat and notifysystem
    },
    progressBar = {
        enabled = true,
        duration = 10000
    },
    NotifySystem = {
        enabled = true,
        Notification = function(message, time, type)
            TriggerClientEvent('ox_lib:notify', source, {
                description = message,
                duration = time,
                type = type
            })
        end
    },
    item = {
        enabled = true
    }
}