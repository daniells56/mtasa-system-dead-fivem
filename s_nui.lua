addEventHandler ( "onPlayerDamage", getRootElement(), function ()
local health = getElementHealth( source )
    if health <= Config.Vida_Min then
        triggerClientEvent( source, 'openKilled', source )
    end
end)


addEventHandler("onPlayerLogin", root,
  function()
    local health = getElementHealth( source )
    if health <= Config.Vida_Min then
        triggerClientEvent( source, 'openKilled', source )
    end
  end
)


addEvent('kill', true)
addEventHandler('kill', getRootElement(), function (element)
    killPed(element)
end)