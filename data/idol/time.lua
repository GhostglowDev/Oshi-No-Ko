-- holy shit is that the fake time with lua real no clickbaiter batur motur master of baiter !!
local fakeLength = 78000
local timeBarTypes = {
    ["song name"] = function()
        return songName
    end,

    ["time left"] = function()
        return formatTime(fakeLength - (getSongPosition() - noteOffset))
    end,

    ["time elapsed"] = function()
        return formatTime(getSongPosition() - noteOffset)
    end
}

function formatTime(ms)
    local s = math.floor(ms/1000)

    return string.format("%01d:%02d", (s/60) % 60, s % 60)
end

function onStepHit()
    if curStep == 864 then
        runHaxeCode([[
            fakey = ]]..fakeLength..[[;
            var guhTween:FlxTween;
            if (guhTween != null) guhTween.cancel();
            guhTween = FlxTween.num(78000, ]]..songLength..[[, 2, {ease: FlxEase.smootherStepOut},
            function(num) { fakey = num; });
        ]])
    end
end

function onUpdatePost(e)
    if curStep >= 863 then
        fakeLength = runHaxeCode("return fakey")
    end

    timeBarType = getPropertyFromClass("ClientPrefs", "timeBarType")
    setProperty("songPercent", getSongPosition() / fakeLength)
    setProperty("timeTxt.text", timeBarTypes[string.lower(timeBarType)]())
end