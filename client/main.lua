lib.callback.register('fsg_scratchgunserial:progressBar', function(duration)
    if lib.progressBar({
        duration = duration,
        label = locale('scratching_gun_serial'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            combat = true,
            sprint = true
        },
        anim = {
            dict = 'missmic4',
            clip = 'michael_tux_fidget'
        },
    }) then return true else return false end
end)