addEvent( 'loadBrowserFunctions', true )
addEventHandler('loadBrowserFunctions', getRootElement( ), function (browser)
    
    addEventHandler("onClientClick", root,
    function(button, state)
        if state == "down" then
            injectBrowserMouseDown(browser, button)
        else
            injectBrowserMouseUp(browser, button)
        end 
    end
)

    addEventHandler("onClientCursorMove", root,
        function (relativeX, relativeY, absoluteX, absoluteY)
            injectBrowserMouseMove(browser, absoluteX, absoluteY)
        end
    )

    addEventHandler("onClientClick", root,
	function(button, state)
		if state == "down" then
			injectBrowserMouseDown(browser, button)
		else
			injectBrowserMouseUp(browser, button)
		end
	end
)

function onKey(button)
	if button == "mouse_wheel_down" then
		injectBrowserMouseWheel(browser, -40, 0)
	elseif button == "mouse_wheel_up" then
		injectBrowserMouseWheel(browser, 40, 0)
	end
end
addEventHandler("onClientKey", root, onKey)

end)