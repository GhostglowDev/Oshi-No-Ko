local util = {}

util.doTweenNum = function(var, from, target, duration, ease) -- this shit took 2 hours for me to figure out
    if ease == nil then ease = "linear" end
    runHaxeCode([[
        setVar("]]..var..[[",]]..from..[[);
        var numTween:FlxTween;
        numTween = FlxTween.num(]]..from..[[, ]]..target..[[, ]]..duration..[[, {ease: FlxEase.]]..ease..[[, onComplete: 
        function(){
            game.callOnLuas("onTweenCompleted", ["]]..var..[["]);
        }},
        function(num){ 
            setVar("]]..var..[[", num);
        });
    ]])
end

util.getHealthColor = function(char)
    char = char:lower()
    if not char == "boyfriend" or not char == "dad" then
        if char == "bf" then char = "boyfriend" else
            debugPrint("[GhostUtil] Valid values: \"bf\", \"dad\", \"boyfriend\"")
            debugPrint("[GhostUtil] ERROR WHILST TRYING TO CALL THE FUNCTION: \"getHealthColor()\" - Unknown value: \""..char.."\" for 1st parameter (char)")
        end
    end
    return "0xFF"..util.rgbToHex(getProperty(char..".healthColorArray[0]"), getProperty(char..".healthColorArray[1]"), getProperty(char..".healthColorArray[2]"));
end

util.rgbToHex = function(r,g,b)
    return string.format("%02X%02X%02X", r, g, b)
end

util.setWindowTitle = function(title)
    setPropertyFromClass("lime.app.Application", "current.window.title", title)
end

util.quickText = function(tag, txt, fieldWidth, x, y, scale, instantAdd, alignment, color, isCentered, centerType)
    makeLuaText(tag, txt, fieldWidth, x, y)
    if scale == "" or scale == nil then
        setTextSize(tag, 24)
    else
        setTextSize(tag, scale)
    end
    if alignment == "" or alignment == nil or not alignment == "left" or not alignment == "center" or not alignment == "right" then
        setTextAlignment(tag, "left")
    else
        setTextAlignment(tag, alignment)
    end
    if not color == nil or not color == "" then
        setTextColor(tag, color)
    end
    if instantAdd then
        addLuaText(tag)
    end
    if isCentered then
        if centerType == "center" then
            screenCenter(tag, "xy")
        else
            screenCenter(tag, centerType)
        end
    end
end

util.traceLuaObject = function(objType, obj)
    local exists = false
    if objType:lower() == "sound" then
        exists = luaSoundExists(obj)
    elseif objType:lower() == "sprite" then
        exists = luaSpriteExists(obj)
    elseif objType:lower() == "text" or objType:lower() == "txt" then
        exists = luaTextExists(obj)
    else
        debugPrint("[GhostUtil] Valid values: \"sound\", \"sprite\", \"text\", \"txt\"")
        debugPrint("[GhostUtil] ERROR WHILST TRYING TO CALL THE FUNCTION: \"traceLuaObject()\" - Unknown value \""..objType.."\" for 1st parameter (objType)")
    end

    return exists
end

return util