function onCreatePost()
    setProperty("dad.visible", false)
    setProperty("iconP2.visible", false)
    makeLuaSprite("bg", nil, 0, 0)
    makeGraphic("bg", 10000, 10000, "FFFFFF")
    addLuaSprite("bg")
    setProperty("bg.color", getColorFromHex "000000")
    setProperty("boyfriend.alpha", 0)
    setProperty("gf.alpha", 0)
    setProperty("camHUD.alpha", 0)
end

local tween = true
local flash = false
local doodooColor = "000000"
local flashColor = {
    "FF00BB",
    "BB00FF"
}

function onSongStart()
    doTweenAlpha("bfIntro", "boyfriend", 0.6, 12, "smootherStepInOut")
    doTweenAlpha("gfIntro", "gf", 0.6, 12, "smootherStepInOut")
end

function onStepHit()
    if curStep == 88 then
        doodooColor = "6B6B6B"
        tween = false
        doTweenColor("bgcolortrans", "bg", doodooColor, 8, "smootherStepInOut")
        doTweenAlpha("hudIntro", "camHUD", 1, 3, "smootherStepIn")
        
        cancelTween("bfIntro")
        cancelTween("gfIntro")

        setProperty("boyfriend.alpha", 1)
        setProperty("gf.alpha", 1)
        setProperty("boyfriend.color", getColorFromHex "6B6B6B")
        setProperty("gf.color", getColorFromHex "6B6B6B")

        doTweenColor("bfIntro2", "boyfriend", "FFFFFF", 1, "smootherStepInOut")
        doTweenColor("gfIntro2", "gf", "FFFFFF", 1, "smootherStepInOut")
    end
    if curStep == 176 then
        doodooColor = "FFFFFF"
        flash = true
        tween = true
        setProperty("bg.color", getColorFromHex "FFFFFF")
        cameraFlash("camGame", "FFFFFF", .5)
    end
    if curStep == 576 then
        doodooColor = "000000"
        doTweenAlpha("gfAlpha", "gf", 0, 1.2, "cubeInOut")
        flashColor = {
            "FF0303",
            "C40202"
        }
        setProperty("sub.color", getColorFromHex "FF0303")
    end
    if curStep == 606 then
        setProperty("sub.color", getColorFromHex "FFFFFF")
    end

    if curStep == 640 then
        setProperty("sub.color", getColorFromHex "C40202")
    end
    if curStep == 674 then
        setProperty("sub.color", getColorFromHex "FFFFFF")
    end
    if curStep == 688 then
        flash = false
    end
    if curStep == 704 then
        setProperty("gf.alpha", 1)
        setProperty("gf.color", getColorFromHex "000000")
        cameraFlash("camGame", "FF0000", .5)
        flash = true
        flashColor = {
            "FF0303",
            "000000"
        }
    end
    if curStep == 926 then
        flash = false
    end
    if curStep == 960 then
        doTweenColor("gfAppear", "gf", "FFFFFF", 0.6, "cubeOut")
        doodooColor = "FFFFFF"
        flashColor = {
            "FF00BB",
            "BB00FF"
        }
        flash = true
    end
    if curStep == 1090 then
        flash = false
    end
    if curStep == 1102 then
        doodooColor = "000000"
    end
    if curStep == 1166 then
        setProperty("sub.color", getColorFromHex "C40202")
    end
    if curStep == 1202 then
        setProperty("sub.color", getColorFromHex "FFFFFF")
    end
    if curStep == 1232 then
        doodooColor = "FFFFFF"
    end
    if curStep == 1488 then
        setProperty("sub.color", getColorFromHex "02C4BE")
        doodooColor = "000000"
        setProperty("bg.color", getColorFromHex "000000")

        cameraFlash("camHUD", "000000", 1)
        setProperty("gf.alpha", 0)
    end
    if curStep == 1608 then
        flash = true
        doodooColor = "FFFFFF"
        doTweenAlpha("gf.xml", "gf", 0.6, 10, "smootherStepInOut")
        setProperty("sub.color", getColorFromHex "FFFFFF")
    end
    if curStep == 1728 then
        setProperty("sub.color", getColorFromHex "02C4BE")
        setProperty("gf.alpha", 1)
        cancelTween("gf.xml")
        cameraFlash("camHUD", "FFFFFF", .6)
        flashColor = {
            "02C4BE",
            "FFFFFF"
        }
    end
    if curStep == 1950 then
        flash = false
    end
    if curStep == 1980 then
        cameraFlash("camHUD", "FFFFFF", .4)
        tween = false
        doTweenAlpha("byelmao", "bg", 0.25, 30)
    end
    if curStep == 2221 then
        cameraFlash("camHUD", "000000", .6)
        setProperty("bg.visible", false)
    end
end

function onBeatHit()
    if flashingLights and flash then
        if curBeat % 4 == 0 then
            setProperty("bg.color", getColorFromHex(flashColor[1]))
        elseif curBeat % 2 == 0 then
            setProperty("bg.color", getColorFromHex(flashColor[2]))
        end
    end
    if tween then
        doTweenColor("bgcolor", "bg", doodooColor, 1.3, "expoOut")
    end
end