local drain = false

function onCreatePost()
    luaDebugMode = true
    setProperty("camGame.visible", false)

    makeLuaSprite("whitebg", nil, -1000, -1000)
    makeGraphic("whitebg", 6000, 6000, "FFFFFF")
    addLuaSprite("whitebg")
    setProperty("whitebg.alpha", 0)

    setProperty("dad.visible", false)
    setProperty("iconP2.visible", false)

    makeLuaSprite("vignette", "vignettecolor", 0, 0)
    setObjectCamera("vignette", "camOther")
    scaleObject("vignette", 1.6, 1.2)
    setProperty("vignette.alpha", 0)
    setProperty("vignette.color", getColorFromHex "FF0000")
    addLuaSprite("vignette", true)

    runHaxeCode([[
        game.initLuaShader('aberration');
        shader0 = game.createRuntimeShader('aberration');
        game.camGame.setFilters([new ShaderFilter(shader0)]);
    
        shader0.setFloat('aberration',0.0015);
        shader0.setFloat('effectTime',0.0015);
    ]])

    makeLuaSprite("transbar1", nil, 0, (screenHeight / 2) - screenHeight)
    makeGraphic("transbar1", screenWidth, screenHeight / 2, "FFFFFF")
    setObjectCamera("transbar1", "camHUD")
    addLuaSprite("transbar1")

    makeLuaSprite("transbar2", nil, 0, screenHeight)
    makeGraphic("transbar2", screenWidth, screenHeight / 2, "FFFFFF")
    setObjectCamera("transbar2", "camHUD")
    addLuaSprite("transbar2")
end

function onSongStart()
    setProperty("camGame.visible", true)
    cameraFlash("camGame", "FFFFFF", .4)
end

function gfPers(lr)
    if lr == "left" then
        setObjectCamera("gf", "camHUD")
        setProperty("gf.visible", true)
        setProperty("gf.alpha", 0)
        doTweenAlpha("gfpersAlphaOpening", "gf", 0.75, 0.7, "smootherStepIn")
        setProperty("gf.y", 100)
        setProperty("gf.x", -120)
        setProperty("gf.scale.x", 1.2)
        setProperty("gf.scale.y", 1.2)
        doTweenX("gfpersleft", "gf", getProperty("gf.x") + 70, 2.5, "smootherStepIn")
    end
    if lr == "right" then
        setObjectCamera("gf", "camHUD")
        setProperty("gf.visible", true)
        setProperty("gf.alpha", 0)
        doTweenAlpha("gfpersAlphaOpening", "gf", 0.75, 0.7, "smootherStepIn")
        setProperty("gf.y", 100)
        setProperty("gf.x", 720)
        setProperty("gf.scale.x", 1.2)
        setProperty("gf.scale.y", 1.2)
        doTweenX("gfpersleft", "gf", getProperty("gf.x") - 70, 2.5, "smootherStepIn")
    end
end
local zoomval = 0.9

function transition(bool, duration, ease)
    if bool then
        doTweenY("transbar1_reveal", "transbar1", 0, duration, ease)
        doTweenY("transbar2_reveal", "transbar2", screenHeight / 2, duration, ease)
    else
        doTweenY("transbar1_reveal", "transbar1", (screenHeight / 2) - screenHeight, duration, ease)
        doTweenY("transbar2_reveal", "transbar2", screenHeight, duration, ease)
    end
end

function onTweenCompleted(t)
    if t == "swagzoom" then
        setProperty("defaultCamZoom", zoomval)
        setProperty("camZooming", true)
    end
    if t == "gfpersleft" or t == "gfpersright" then
        doTweenAlpha("gfpersleftalpha", "gf", 0, 0.4, "smootherStepInOut")
    end
end
local vignette = false
local flashColor = {
    "FF00BB",
    "BB00FF"
}
local bgflash = false
local doodoo = "FFFFFF"

function onStepHit()
    if curStep == 32 then
        toZoom(0.9, 0.25, "smootherStepOut")
    end
    if curStep == 64 then
        toZoom(0.8, 0.25, "smootherStepOut")
    end
    if curStep == 128 then
        toZoom(1, 0.25, "smootherStepOut")
    end
    if curStep == 152 then
        toZoom(0.75, 0.5, "smootherStepOut")
    end
    if curStep == 128 then
        toZoom(1, 0.5, "smootherStepOut")
    end
    if curStep == 175 then
        toZoom(0.9, 3, "smootherStepInOut")
    end
    if curStep == 270 then
        toZoom(1.05, 0.35, "sineOut")
    end
    if curStep == 286 then
        toZoom(0.9, 0.35, "sineOut")
    end
    if curStep == 320 then
        toZoom(1.1, 0.25, "sineOut")
    end
    if curStep == 336 then
        toZoom(1.2, 0.25, "sineOut")
    end
    if curStep == 352 then
        toZoom(0.9, 0.3, "sineOut")
    end
    if curStep == 374 then
        toZoom(1.05, 0.45, "sineOut")
    end
    if curStep == 384 then
        toZoom(1.1, 0.25, "sineOut")
    end
    if curStep == 400 then
        toZoom(1.2, 0.25, "sineOut")
    end
    if curStep == 410 then
        toZoom(0.9, 0.5, "sineOut")
    end
    if curStep == 448 then
        toZoom(0.75, 0.75, "smootherStepInOut")
        doTweenAlpha("white", "whitebg", 1, 0.3, "smootherStepInOut")
        doTweenColor("silhouetteBf", "boyfriend", "080808", 0.25, "smootherStepInOut")
        doTweenColor("silhouetteGf", "gf", "000000", 0.25, "smootherStepInOut")
    end
    if curStep == 504 then
        setProperty("camGame.visible", false)
    end
    if curStep == 505 then
        toZoom(0.5, 0.0001, "linear")
        setProperty("camGame.visible", true)
    end
    if curStep == 506 then
        setProperty("camGame.visible", false)
    end
    if curStep == 507 then
        toZoom(0.4, 0.0001, "linear")
        setProperty("camGame.visible", true)
    end
    if curStep == 508 then
        toZoom(0.75, 0.0001, "sineOut")
        setProperty("camGame.visible", false)
    end
    if curStep == 509 then
        toZoom(0.9, 3, "linear")
        setProperty("camGame.visible", true)
        setProperty("whitebg.alpha", 0)
        setProperty("boyfriend.color", getColorFromHex "FFFFFF")
        setProperty("gf.color", getColorFromHex "FFFFFF")
    end
    if curStep == 608 then
        vignette = true
    end

    if curStep == 664 then
        toZoom(1.2, 0.001, "linear")
        setProperty("camGame.angle", -3)
    end
    if curStep == 668 then
        toZoom(1.4, 0.001, "linear")
        setProperty("camGame.angle", 4.5)
    end
    if curStep == 671 then
        toZoom(0.9, 0.001, "linear")
        cameraFlash("camGame", "FFFFFF", 1)
        setProperty("camGame.angle", 0)
    end

    if curStep == 856 then
        vignette = false
    end
    if curStep == 864 then
        cameraShake("camGame", 0.0075, 0.65)
        cameraShake("camHUD", 0.0055, 0.6)
        cameraFlash("camHUD", "000000", 1)
        setProperty("gf.color", getColorFromHex "000000")
        setProperty("boyfriend.color", getColorFromHex "9E9E9E")
        setProperty("whitebg.alpha", 1)
        setProperty("whitebg.color", getColorFromHex "000000")
        runHaxeCode([[
            var abbrTween:FlxTween;
            abbrTween = FlxTween.num(0.8, 0.015, 1.2, {ease: FlxEase.expoOut},
            function(num)
            {
                shader0.setFloat('aberration', num);
            });
            var effcTween:FlxTween;
            effcTween = FlxTween.num(0.005, 0.0015, 1.2, {ease: FlxEase.expoOut},
            function(num)
            {
                shader0.setFloat('effectTime', num);
            });
        ]])
    end
    if curStep == 928 then
        cameraShake("camGame", 0.0075, 0.3)
        cameraShake("camHUD", 0.0055, 0.15)
    end
    if curStep == 992 then
        toZoom(1.3, 0.25, "smootherStepOut")
        drain = true
        setProperty("boyfriend.color", getColorFromHex "000000")
        cameraFlash("camHUD", "FF0000", .4)
        setProperty("gf.color", getColorFromHex "FF0000")
        setProperty("gf.alpha", 0.2)
        setProperty("whitebg.color", getColorFromHex "FF0000")
    end
    if curStep == 1056 then
        runHaxeCode([[
            var abbrTween:FlxTween;
            abbrTween = FlxTween.num(0.015, 1.2, 4.9, {ease: FlxEase.smootherStepIn},
            function(num)
            {
                shader0.setFloat('aberration', num);
            });
            var effcTween:FlxTween;
            effcTween = FlxTween.num(0.0015, 0.5, 4.9, {ease: FlxEase.smootherStepIn},
            function(num)
            {
                shader0.setFloat('effectTime', num);
            });
        ]])
        toZoom(0.65, 4.9, "smootherStepIn")
    end
    if curStep == 1112 then
        cameraFlash("camHUD", "FF0000", .4)
        setProperty("camGame.visible", false)
    end
    if curStep == 1120 then
        setProperty("camGame.visible", true)
        toZoom(0.9, 0.001, "linear")
        drain = false
        cameraFlash("camHUD", "FFFFFF", 1)
        setProperty("whitebg.alpha", 0)
        setProperty("boyfriend.color", getColorFromHex "FFFFFF")
        setProperty("gf.color", getColorFromHex "FFFFFF")
        setProperty("gf.alpha", 1)
        runHaxeCode([[
            shader0.setFloat('aberration',0.015);
            shader0.setFloat('effectTime',0.0015);
        ]])
    end

    if curStep == 1176 then
        toZoom(1.2, 0.001, "linear")
        setProperty("camGame.angle", -3)
    end
    if curStep == 1180 then
        toZoom(1.4, 0.001, "linear")
        setProperty("camGame.angle", 4.5)
    end
    if curStep == 1184 then
        toZoom(0.9, 0.001, "linear")
        cameraFlash("camGame", "FFFFFF", 1)
        setProperty("camGame.angle", 0)
    end

    if curStep == 1272 then
        toZoom(1, 0.15, "sineOut")
    end
    if curStep == 1274 then
        toZoom(0.9, 0.15, "sineOut")
    end
    if curStep == 1276 then
        toZoom(1, 0.15, "sineOut")
    end
    if curStep == 1278 then
        toZoom(0.9, 0.15, "sineOut")
    end

    if curStep == 1336 then
        toZoom(1, 0.15, "sineOut")
    end
    if curStep == 1338 then
        toZoom(0.9, 0.15, "sineOut")
    end
    if curStep == 1340 then
        toZoom(1, 0.15, "sineOut")
    end
    if curStep == 1342 then
        toZoom(0.9, 0.15, "sineOut")
    end

    if curStep == 1376 then
        setProperty("gf.visible", false)
        setProperty("whitebg.alpha", 1)
        setProperty("whitebg.color", getColorFromHex "FFFFFF")
        cameraFlash("camGame", "FFFFFF", .4)
        doodoo = "FFFFFF"
        bgflash = true
    end

    if curStep == 1388 then
        toZoom(1, 0.15, "sineOut")
    end
    if curStep == 1390 then
        toZoom(1.15, 0.15, "sineOut")
    end
    if curStep == 1392 then
        toZoom(0.9, 0.15, "sineOut")
    end

    if curStep == 1404 then
        toZoom(1, 0.15, "sineOut")
    end
    if curStep == 1406 then
        toZoom(1.15, 0.15, "sineOut")
    end
    if curStep == 1408 then
        toZoom(0.9, 0.15, "sineOut")
    end

    if curStep == 1420 then
        toZoom(1, 0.15, "sineOut")
    end
    if curStep == 1422 then
        toZoom(1.15, 0.15, "sineOut")
    end
    if curStep == 1424 then
        toZoom(0.9, 0.15, "sineOut")
    end

    if curStep == 1436 then
        toZoom(1, 0.15, "sineOut")
    end
    if curStep == 1438 then
        toZoom(1.15, 0.15, "sineOut")
    end
    if curStep == 1440 then
        cameraFlash("camHUD", "FFFFFF", .4)
        toZoom(0.9, 0.15, "sineOut")
    end

    if curStep == 1442 then
        gfPers("right")
    end
    if curStep == 1458 then
        gfPers("left")
    end
    if curStep == 1504 then
        bgflash = false
        setProperty("camGame.alpha", 0)
    end
    if curStep == 1517 then
        setProperty("whitebg.alpha", 1)
        setProperty("whitebg.color", getColorFromHex "000000")
        doTweenAlpha("camhehaeua", "camGame", 0.6, 2, "smootherStepIn")
    end
    if curStep == 1584 then
        toZoom(1, 0.25, "sineOut")
    end
    if curStep == 1647 then
        setProperty("camGame.alpha", 0)
    end
    if curStep == 1658 then

        -- setting up back gf
        setObjectCamera("gf", "camGame")
        scaleObject("gf", 1, 1)
        setProperty("gf.x", defaultGirlfriendX)
        setProperty("gf.y", defaultGirlfriendY)
        setProperty("gf.visible", true)
        setProperty("gf.alpha", 1)

        setProperty("gf.color", getColorFromHex "ABABAB")
        setProperty("boyfriend.color", getColorFromHex "ABABAB")
        setProperty("whitebg.alpha", 0.75)

        doTweenAlpha("OMG BEAT DROPPP", "camGame", 1, 0.2, "smootherStepIn")
    end

    if curStep == 1720 then -- beat drop
        cameraFlash("camGame", "FFFFFF", .4)
        setProperty("whitebg.alpha", 0)
        setProperty("gf.color", getColorFromHex "FFFFFF")
        setProperty("boyfriend.color", getColorFromHex "FFFFFF")
        setProperty("camGame.alpha", 1)
        toZoom(1.2, 0.001, "linear")
        setProperty("camGame.angle", -3)
    end
    if curStep == 1725 then
        toZoom(1.4, 0.001, "linear")
        setProperty("camGame.angle", 4.5)
    end
    if curStep == 1728 then
        toZoom(0.9, 0.001, "linear")
        cameraFlash("camHUD", "FFFFFF", 2)
        setProperty("camGame.angle", 0)
        vignette = true
    end
    
    if curStep == 1919 then
        toZoom(0.75, 5, "sineOut")
        vignette = false
    end

    if curStep == 1965 then
        toZoom(1.1, 0.15, "sineOut")
    end
    if curStep == 1970 then
        toZoom(1.15, 0.15, "sineOut")
    end
    if curStep == 1974 then
        toZoom(1.2, 0.15, "sineOut")
    end
    if curStep == 1976 then
        toZoom(1.25, 0.15, "sineOut")
    end
    if curStep == 1985 then
        toZoom(0.75, 0.001, "sineOut")
        cameraFlash("camGame", "FFFFFF", 3)
        vignette = true
    end

    if curStep == 2160 then
        vignette = false
        transition(true, 2, "expoOut")
        setProperty("transbar1.color", getColorFromHex "000000")
        setProperty("transbar2.color", getColorFromHex "000000")
    end
    if curStep == 2185 then
        setProperty("transbar1.color", getColorFromHex "030FFC")
        setProperty("transbar2.color", getColorFromHex "030FFC")
    end

    if curStep == 2192 then
        showScoreShit()
    end

    if curStep == 2198 then
        setProperty("yougot.alpha", 1)
        setProperty("endScore.alpha", 1)
        setProperty("endMisses.alpha", 1)
        setProperty("endAccuracy.alpha", 1)
        setProperty("endSicks.alpha", 1)
        setProperty("endGoods.alpha", 1)
        setProperty("endBads.alpha", 1)
        setProperty("endShits.alpha", 1)
        setProperty("rankText.alpha", 1)
    end

    if curStep > 2180 and curStep < 2185 then
        local guh = getRandomInt(1,3)
        if guh == 1 then
            setProperty("transbar1.color", getColorFromHex "000000")
            setProperty("transbar2.color", getColorFromHex "000000")
        elseif guh == 2 then
            setProperty("transbar1.color", getColorFromHex "FFFFFF")
            setProperty("transbar2.color", getColorFromHex "FFFFFF")
        elseif guh == 3 then
            setProperty("transbar1.color", getColorFromHex "030FFC")
            setProperty("transbar2.color", getColorFromHex "030FFC")
        end
    end

    if curStep > 2192 and curStep < 2198 then
        local guh = getRandomInt(1,2)
        if guh == 1 then
            setProperty("yougot.alpha", 1)

            setProperty("endScore.alpha", 1)
            setProperty("endMisses.alpha", 1)
            setProperty("endAccuracy.alpha", 1)

            setProperty("endSicks.alpha", 1)
            setProperty("endGoods.alpha", 1)
            setProperty("endBads.alpha", 1)
            setProperty("endShits.alpha", 1)

            setProperty("rankText.alpha", 1)
        else
            setProperty("yougot.alpha", 0)

            setProperty("endScore.alpha", 0)
            setProperty("endMisses.alpha", 0)
            setProperty("endAccuracy.alpha", 0)

            setProperty("endSicks.alpha", 0)
            setProperty("endGoods.alpha", 0)
            setProperty("endBads.alpha", 0)
            setProperty("endShits.alpha", 0)

            setProperty("rankText.alpha", 0)
        end
    end

    if curStep >= 992 and curStep <= 1112 then
        cameraShake("camGame", 0.0025, 0.065)
        cameraShake("camHUD", 0.0015, 0.065)
    end
end

function floorDec(v, d)
    addHaxeLibrary("Highscore")
    return runHaxeCode("return Highscore.floorDecimal("..v..", "..d..");")
end

local rank = "N/A"
local rankColor = "FFFFFF"

function showScoreShit()
    local ofs = 250
    local accuracy = floorDec(getProperty("ratingPercent") * 100, 2)
    makeLuaText("yougot", "You got:", 0, 70, ofs - 20)
    setTextSize("yougot", 30)
    addLuaText("yougot")

    makeLuaText("endScore", "Score: "..getProperty("songScore"), 0, 70, (25 * 1) + ofs)
    setTextSize("endScore", 24)
    addLuaText("endScore")

    makeLuaText("endMisses", "Misses: "..getProperty("songMisses"), 0, 70, (25 * 2) + ofs)
    setTextSize("endMisses", 24)
    addLuaText("endMisses")

    makeLuaText("endAccuracy", "Accuracy: "..accuracy.."%", 0, 70, (25 * 3) + ofs)
    setTextSize("endAccuracy", 24)
    addLuaText("endAccuracy")


    makeLuaText("endSicks", "Sicks: "..getProperty("sicks"), 0, 70, (25 * 5) + ofs)
    setTextSize("endSicks", 24)
    addLuaText("endSicks")

    makeLuaText("endGoods", "Goods: "..getProperty("goods"), 0, 70, (25 * 6) + ofs)
    setTextSize("endGoods", 24)
    addLuaText("endGoods")

    makeLuaText("endBads", "Bads: "..getProperty("bads"), 0, 70, (25 * 7) + ofs)
    setTextSize("endBads", 24)
    addLuaText("endBads")

    makeLuaText("endShits", "Shits: "..getProperty("shits"), 0, 70, (25 * 8) + ofs)
    setTextSize("endShits", 24)
    addLuaText("endShits")

    makeLuaText("rankText", "Rank:", 0, 770, ofs - 40)
    setTextSize("rankText", 30)
    addLuaText("rankText")

    runTimer("showRank", 2)
end

function onTimerCompleted(t, l, ll)
    if t == "showRank" then
        local ofs = 250
        local x = 770
        if rank == "S+" or rank == "A+" then x = 620 end
        makeLuaText("rankThingy", rank, 0, x, ofs - 170)
        setTextSize("rankThingy", 360)
        addLuaText("rankThingy")
        setProperty("rankThingy.alpha", 0)
        setProperty("rankThingy.angle", -2)
        scaleObject("rankThingy", 2, 2)
        doTweenAlpha("rankShow", "rankThingy", 1, 1.2, "cubeOut")
        doTweenX("rankScaleX", "rankThingy.scale", 1, 1, "cubeIn")
        doTweenY("rankScaleY", "rankThingy.scale", 1, 1, "cubeIn")
        doTweenAngle("rankAngle", "rankThingy", 4, 1.2, "smootherStepInOut")
        runTimer("showColor", 1)
    end
    if t == "showColor" then
        doTweenColor("rankColor", "rankThingy", rankColor, 1, "cubeOut")
    end
end

function onBeatHit()
    if vignette then
        if curBeat % 4 == 0 then
            setProperty("vignette.color", getColorFromHex(flashColor[1]))
        elseif curBeat % 2 == 0 then
            setProperty("vignette.color", getColorFromHex(flashColor[2]))
        end

        if curBeat % 2 == 0 then
            setProperty("camHUD.angle", -2.5)
        else
            setProperty("camHUD.angle", 2.5)
        end
        cancelTween("vignette")
        setProperty("vignette.alpha", 1)
        doTweenAlpha("vignette", "vignette", 0, 0.8, "expoOut")

        doTweenAngle("cambeathudangle", "camHUD", 0, 0.8, "expoOut")
    end
    if bgflash then
        if curBeat % 4 == 0 then
            setProperty("whitebg.color", getColorFromHex(flashColor[1]))
        end
        doTweenColor("whitebgcool", "whitebg", doodoo, 1.2, "expoOut")
    end
end

function toZoom(val, duration, ease)
    cancelTween("swagZoom")
    zoomval = val
    doTweenZoom("swagzoom", "camGame", val, duration, ease)
    setProperty("camZooming", false)
end

function onUpdate(e)
    if drain and getProperty("health") > 0.4 then
        setProperty("health", getProperty("health") - 0.0015)
    end

    local accuracy = floorDec(getProperty("ratingPercent") * 100, 2)
    if accuracy <= 5 then
        rank = "F"
        rankColor = "FF0000"
    elseif accuracy <= 20 then
        rank = "E"
        rankColor = "9E3F3F"
    elseif accuracy <= 40 then
        rank = "D"
        rankColor = "FF7403"
    elseif accuracy <= 50 then
        rank = "C"
        rankColor = "FF6C03"
    elseif accuracy <= 70 then
        rank = "B"
        rankColor = "03ABFF"
    elseif accuracy <= 90 then
        rank = "A"
        rankColor = "03FFA7"
    elseif accuracy <= 95 then
        rank = "A+"
        rankColor = "07FF03"
    elseif accuracy <= 99 then
        rank = "S"
        rankColor = "FFC003"
    elseif accuracy == 100 then
        rank = "S+"
        rankColor = "FFA203"
    end
end