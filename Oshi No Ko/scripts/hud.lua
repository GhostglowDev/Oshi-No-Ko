func = require 'mods.Oshi No Ko.modules.ghostutil.Functions' -- pretty useless. i haven't messed with this yet
modc = require 'mods.Oshi No Ko.modules.ghostutil.Modcharts' -- modcharts is currently broken
math = require 'mods.Oshi No Ko.modules.ghostutil.Math'
util = require 'mods.Oshi No Ko.modules.ghostutil.Util'
game = require 'mods.Oshi No Ko.modules.ghostutil.Game'
window = require 'mods.Oshi No Ko.modules.ghostutil.Window'

local y = 677
local pby = 60
function onCreatePost()
    if downscroll then
        y = 115.2
        pby = 650
    end

    luaDebugMode = true;
    
    util.quickText("accTxt", -- tag for the text
       nil, -- the text
       0, -- text's field width
       50, -- x position
       y - 7, -- y position
       20, -- the text size
       true, -- instantAdd (adds the text after created)
       "center", -- alignment type
       nil, -- text color
       nil, -- centered on screen?
       nil -- center type (x, y, xy)
    )

    util.quickText("healthTxt",
       nil,
       0,
       0, 
       y - 2,
       20, 
       true, 
       "center", 
       nil, 
       true, 
       "x"
    )

    util.quickText("playbackTxt",
       "Playback: "..getProperty("playbackRate").."x",
       0,
       0, 
       pby,
       16, 
       true, 
       "center", 
       nil, 
       true, 
       "x"
    )
    setProperty("playbackTxt.alpha", 0)

    for i = 0,3 do
        if downscroll then setPropertyFromGroup("opponentStrums", i, "y", -1000) else setPropertyFromGroup("opponentStrums", i, "y", 1000) end
    end
end

function onSongStart()
    doTweenAlpha("pbTxtAlpha", "playbackTxt", 1, 0.4)
    runTimer("dadtimebar", 0.001)
end

function onUpdatePost(e)
    if ratingFC ~= "" then
        setProperty("scoreTxt.text", "Score: "..getProperty("songScore").." // Misses: "..getProperty("songMisses").." ["..getProperty("ratingFC").."]")
    else
        setProperty("scoreTxt.text", "Score: "..getProperty("songScore").." // Misses: "..getProperty("songMisses").." [N/A]")
    end
    setProperty("scoreTxt.x", 400)

    setProperty("accTxt.text", "Accuracy: "..math.floorDecimal(getProperty("ratingPercent")*100, 2).."%")
    setProperty("healthTxt.text", "Health: "..getProperty("healthBar.percent"))
    screenCenter("playbackTxt", "x")
    screenCenter("healthTxt", "x")

    setProperty("accTxt.scale.x", getProperty("scoreTxt.scale.x"))
    setProperty("accTxt.scale.y", getProperty("scoreTxt.scale.y"))

    if getProperty("health") >= 0.6 then
        setTextColor("healthTxt", "FFFFFF")
    else
        setTextColor("healthTxt", "FF1303")
    end
end

function noteMiss(i, d, t, s)
    if not s then
        setTextColor("accTxt", "FF1303")
        setTextColor("scoreTxt", "FF1303")
        doTweenColor("swag1", "accTxt", "FFFFFF", 0.9, "expoOut")
        doTweenColor("swag2", "scoreTxt", "FFFFFF", 0.9, "expoOut")
    end
    cameraShake("camHUD", 0.01, 0.05)
end

function onGhostTap(a)
    setTextColor("accTxt", "C4C4C4")
    setTextColor("scoreTxt", "C4C4C4")
    doTweenColor("swag1", "accTxt", "FFFFFF", 0.9, "expoOut")
    doTweenColor("swag2", "scoreTxt", "FFFFFF", 0.9, "expoOut")
end

local allowEnd = false

function onTimerCompleted(t, l, ll)
    if t == "dadtimebar" then
        doTweenColor("swagTimeBar", "timeBar", getHealthColor('dad'), 1)
        runTimer("bftimebar", 5)
    elseif t == "bftimebar" then
        doTweenColor("swagTimeBar", "timeBar", getHealthColor('boyfriend'), 1)
        runTimer("dadtimebar", 5)
    end
end

function onEndSong()
end

function getHealthColor(arg)
    return "0xFF"..rgbToHex(getProperty(arg..".healthColorArray[0]"), getProperty(arg..".healthColorArray[1]"), getProperty(arg..".healthColorArray[2]"));
end

function rgbToHex(r,g,b)
    return string.format("%02X%02X%02X", r, g, b)
end