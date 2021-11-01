local x, y = guiGetScreenSize()
local link = "http://mta/"..getResourceName(getThisResource()).."/nui/nui.html"
local browser = createBrowser(x, y, true, true, false)
local deathtimer = Config.Tempo


addEventHandler("onClientBrowserCreated", browser, function()
   loadBrowserURL(source, link)
   triggerEvent( "loadBrowserFunctions", getRootElement( ), browser )
end)


function SendNUIMessage(browser, table)
   if isElement(browser) and type(table) == "table" then
      return executeBrowserJavascript(browser, 'window.postMessage('..toJSON(table)..'[0])')
   end
end

local onNui = false
local nocauteado = false

function dxNUI() -- Função que renderiza o NUI.
   dxDrawImage(0, 0, x, y, browser) -- cria o browser

   if deathtimer > 0 then
   SendNUIMessage(browser, {
      setDisplay = true,
      setDisplayDead = false,
      deathtimer = deathtimer
   })
else
   SendNUIMessage(browser, {
      setDisplay = false,
      setDisplayDead = true,
      deathtimer = deathtimer
   })
   end -- mta.triggerEvent('desistir')
end

addEvent('openKilled', true)
addEventHandler('openKilled', getRootElement(), function ()
   if onNui == false then 
      onNui = true
      nocauteado = true
      addEventHandler('onClientRender', getRootElement(), dxNUI)
      showCursor(true)
      triggerServerEvent( 'startAnim', localPlayer, localPlayer )
      setTimer(function ()
         if deathtimer > 0 and nocauteado then 
         deathtimer = deathtimer - 1
         else
            setElementData(localPlayer, "Morto", true)
         end
      end, 1000, 0)
   end
end)


addEvent('desistir', true)
addEventHandler('desistir', getRootElement(), function ()

   nocauteado = false
   setElementData(localPlayer, "Morto", false)
   removeEventHandler('onClientRender', getRootElement(), dxNUI)
   deathtimer = Config.Tempo
   triggerServerEvent( 'kill', localPlayer, localPlayer )
   triggerServerEvent( 'stopAnim', localPlayer, localPlayer )
   SendNUIMessage(browser, {
		setDisplay = false,
		setDisplayDead = false,
		deathtimer = deathtimer
	})
   showCursor(false)
   onNui = false
   local timers = getTimers( 1000 )
   for timerKey, timerValue in ipairs(timers) do
         killTimer ( timerValue )
   end

end)


addEvent('closeKilled', true)
addEventHandler('closeKilled', getRootElement(), function ()
   if onNui then
      nocauteado = false
      setElementData(localPlayer, "Morto", false)
      removeEventHandler('onClientRender', getRootElement(), dxNUI)
      deathtimer = Config.Tempo
      triggerServerEvent( 'kill', localPlayer, localPlayer )
      triggerServerEvent( 'stopAnim', localPlayer, localPlayer )
      SendNUIMessage(browser, {
         setDisplay = false,
         setDisplayDead = false,
         deathtimer = deathtimer
      })
      showCursor(false)
      onNui = false
      local timers = getTimers( 1000 )
      for timerKey, timerValue in ipairs(timers) do
            killTimer ( timerValue )
      end
   end
end)

--[[ Exemplo de como se reviver, ai você da seus pulos pra fazer isso virar um comando pro samu ou sla...
addCommandHandler( 'reviver', function () 
local state = getElementData(localPlayer, 'Morto')
   if not state and nocauteado == true then
      triggerEvent( 'closeKilled', localPlayer )
      setElementHealth ( localPlayer, 100 )      
   end
end)

]]