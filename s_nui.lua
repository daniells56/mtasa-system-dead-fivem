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

--setPedAnimation(corpo, 'ped', 'ko_shot_front', -1, false, false, false, true)

addEvent('startAnim', true)
addEventHandler('startAnim', getRootElement(), function (element)
  setPedAnimation(element, 'ped', 'ko_shot_front', -1, false, false, false, true)
  toggleAllControls( element, true )
end)

addEvent('stopAnim', true)
addEventHandler('stopAnim', getRootElement(), function (element)
  setPedAnimation(element)
  toggleAllControls( element, false )
end)