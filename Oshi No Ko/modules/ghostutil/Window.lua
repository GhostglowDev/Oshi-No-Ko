local win = {};
---@class Window

win.doTweenWindow = function(xy, val, duration, ease)
    addHaxeLibrary("Application", "lime.app")
    if ease == nil or ease == "" then ease = "linear" end
    if xy:lower() == "x" then
        runHaxeCode([[
            var winTweenX:FlxTween;
            if(winTweenX != null) winTweenX.cancel()
            winTweenX = FlxTween.num(Application.current.window.x, ]]..tostring(val)..[[, ]]..tostring(duration)..[[, {ease: FlxEase.]]..ease..[[},
            function(num){ Application.current.window.x = num;});
        ]])
    elseif xy:lower() == "y" then
        runHaxeCode([[
            var winTweenY:FlxTween;
            if(winTweenY != null) winTweenY.cancel()
            winTweenY = FlxTween.num(Application.current.window.y, ]]..tostring(val)..[[, ]]..tostring(duration)..[[, {ease: FlxEase.]]..ease..[[},
            function(num){ Application.current.window.y = num;});
        ]])
    end
end

win.setWindowProperty = function(var, val)
    if var == "borderless" then
        setPropertyFromClass("lime.app.Application", "current.window.borderless", val)
    elseif var == "height" then
        setPropertyFromClass("lime.app.Application", "current.window.height", val)
    elseif var == "width" then
        setPropertyFromClass("lime.app.Application", "current.window.width", val)
    elseif var == "x" then
        setPropertyFromClass("lime.app.Application", "current.window.x", val)
    elseif var == "y" then
        setPropertyFromClass("lime.app.Application", "current.window.y", val)
    elseif var == "fullscreen" then
        setPropertyFromClass("lime.app.Application", "current.window.fullscreen", val)
    elseif var == "title" then
        setPropertyFromClass("lime.app.Application", "current.window.title", val)
    elseif var == "resizable" then
        setPropertyFromClass("lime.app.Application", "current.window.resizable", val)
    elseif var == "icon" then -- wip
        runHaxeCode("Application.current.window.setIcon("..tostring(val)..");")
    end
end

win.getWindowProperty = function(var)
    if var == "borderless" then
        getPropertyFromClass("lime.app.Application", "current.window.borderless")
    elseif var == "height" then
        getPropertyFromClass("lime.app.Application", "current.window.height")
    elseif var == "width" then
        getPropertyFromClass("lime.app.Application", "current.window.width")
    elseif var == "x" then
        getPropertyFromClass("lime.app.Application", "current.window.x")
    elseif var == "y" then
        getPropertyFromClass("lime.app.Application", "current.window.y")
    elseif var == "fullscreen" then
        getPropertyFromClass("lime.app.Application", "current.window.fullscreen")
    elseif var == "title" then
        getPropertyFromClass("lime.app.Application", "current.window.title")
    elseif var == "resizable" then
        getPropertyFromClass("lime.app.Application", "current.window.resizable")
    end
end

return win;