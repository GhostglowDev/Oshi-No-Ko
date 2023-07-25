local modchart = {}
local t1 = "ghostutil_"

modchart.downScroll = function(n, dirScr, d, e)
    local t2 = "downScrollToggle_"; -- t = tag
    local dsOfs = 470;
    local randChar = {"q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m"}
    local randTag = (randChar[getRandomInt(1, #randChar)]..randChar[getRandomInt(1, #randChar)]..math.random(10000,99999)):upper() -- dont ask lmao
    if dirScr:lower() == "downscroll" then
        if downscroll then
            if n >= 0 and n <= 3 then 
                noteTweenY(t1..t2.."norm_ds_op"..randTag, n, defaultOpponentStrumY, d, e); -- op = opponent, pl = player
                setPropertyFromGroup("opponentStrums", n, "downScroll", false)
            else
                noteTweenY(t1..t2.."norm_ds_pl"..randTag, n, defaultPlayerStrumY, d, e);
                setPropertyFromGroup("playerStrums", (n - 4), "downScroll", false)
            end
        else
            if n >= 0 and n <= 3 then 
                noteTweenY(t1..t2.."norm_ds_op"..randTag, n, defaultOpponentStrumY + dsOfs, d, e); -- op = opponent, pl = player
                setPropertyFromGroup("opponentStrums", n, "downScroll", true)
            else
                noteTweenY(t1..t2.."norm_ds_pl"..randTag, n, defaultPlayerStrumY + dsOfs, d, e);
                setPropertyFromGroup("playerStrums", (n - 4), "downScroll", true)
            end
        end
    elseif dirScr:lower() == "upscroll" then
        if downscroll then
            if n >= 0 and n <= 3 then 
                noteTweenY(t1..t2.."norm_us_op"..randTag, n, defaultOpponentStrumY - dsOfs, d, e); -- op = opponent, pl = player
                setPropertyFromGroup("opponentStrums", n, "downScroll", true)
            else
                noteTweenY(t1..t2.."norm_us_pl"..randTag, n, defaultPlayerStrumY - dsOfs, d, e);
                setPropertyFromGroup("playerStrums", (n - 4), "downScroll", true)
            end
        else
            if n >= 0 and n <= 3 then 
                noteTweenY(t1..t2.."norm_us_op"..randTag, n, defaultOpponentStrumY, d, e); -- op = opponent, pl = player
                setPropertyFromGroup("opponentStrums", n, "downScroll", false)
            else
                noteTweenY(t1..t2.."norm_us_pl"..randTag, n, defaultPlayerStrumY, d, e);
                setPropertyFromGroup("playerStrums", (n - 4), "downScroll", false)
            end
        end
    else
        debugPrint("[GhostUtil] Valid values: downscroll and upscroll")
        debugPrint("[GhostUtil] ERROR WHILST TRYING TO CALL THE FUNCTION: \"downScroll()\" - Unknown value \""..dirScr.."\" for 2nd parameter (dirScr)")
    end
end

modchart.middleScroll = function(midScr, durDad, durBf, ease, spin)
    if not middlescroll then
        if midScr then
            noteTweenX(t1.."middle_ms_op_0", 0, defaultOpponentStrumX0 - (322 * 2), durDad, ease)
            noteTweenX(t1.."middle_ms_op_1", 1, defaultOpponentStrumX1 - (322 * 2), durDad, ease)
            noteTweenX(t1.."middle_ms_op_2", 2, defaultOpponentStrumX2 - (322 * 2), durDad, ease)
            noteTweenX(t1.."middle_ms_op_3", 3, defaultOpponentStrumX3 - (322 * 2), durDad, ease)

            noteTweenX(t1.."middle_ms_pl_4", 4, defaultPlayerStrumX0 - 322, durBF, ease)
            noteTweenX(t1.."middle_ms_pl_5", 5, defaultPlayerStrumX1 - 322, durBF, ease)
            noteTweenX(t1.."middle_ms_pl_6", 6, defaultPlayerStrumX2 - 322, durBF, ease)
            noteTweenX(t1.."middle_ms_pl_7", 7, defaultPlayerStrumX3 - 322, durBF, ease)

            if spin then
                for i = 0,3 do
                    noteTweenAngle(t1..'middle_ms_op_spinin'..i, i, 360 * 2, durDad, ease)
                end
                for i = 4,7 do
                    noteTweenAngle(t1..'middle_ms_op_spinin'..i, i, 360 * -2, durBf, ease)
                end
            end
        end

        if not midScr then
            noteTweenX(t1.."middle_ms_op_0", 0, defaultOpponentStrumX0, durDad, ease)
            noteTweenX(t1.."middle_ms_op_1", 1, defaultOpponentStrumX1, durDad, ease)
            noteTweenX(t1.."middle_ms_op_2", 2, defaultOpponentStrumX2, durDad, ease)
            noteTweenX(t1.."middle_ms_op_3", 3, defaultOpponentStrumX3, durDad, ease)

            noteTweenX(t1.."middle_ms_pl_4", 4, defaultPlayerStrumX0, durBF, ease)
            noteTweenX(t1.."middle_ms_pl_5", 5, defaultPlayerStrumX1, durBF, ease)
            noteTweenX(t1.."middle_ms_pl_6", 6, defaultPlayerStrumX2, durBF, ease)
            noteTweenX(t1.."middle_ms_pl_7", 7, defaultPlayerStrumX3, durBF, ease)

            if spin then
                for i = 0,3 do
                    noteTweenAngle(t1..'middle_ms_op_spinout'..i, i, 360 * -1, durDad, ease)
                end
                for i = 4,7 do
                    noteTweenAngle(t1..'middle_ms_pl_spinout'..i, i, 360 * 1, durBF, ease)
                end
            end
        end
    else
        if midScr then
            noteTweenX(t1..'middle_ms_op_0', 0, defaultOpponentStrumX0 - (322 * 1), durDad, ease)
            noteTweenX(t1..'middle_ms_op_1', 1, defaultOpponentStrumX1 - (322 * 1), durDad, ease)
            noteTweenX(t1..'middle_ms_op_2', 2, defaultOpponentStrumX2 + (322 * 1), durDad, ease)
            noteTweenX(t1..'middle_ms_op_3', 3, defaultOpponentStrumX3 + (322 * 1), durDad, ease)
        else
            noteTweenX(t1..'middle_ms_op_4', 0, defaultOpponentStrumX0 + (322 * 1), durDad, ease)
            noteTweenX(t1..'middle_ms_op_5', 1, defaultOpponentStrumX1 + (322 * 1), durDad, ease)
            noteTweenX(t1..'middle_ms_op_6', 2, defaultOpponentStrumX2 - (322 * 1), durDad, ease)
            noteTweenX(t1..'middle_ms_op_7', 3, defaultOpponentStrumX3 - (322 * 1), durDad, ease)
        end

        if spin then
            for i = 0,1 do
                noteTweenAngle(t1..'middle_ms_op_spin'..i, i, 360 * -2, durDad, ease)
            end
            for i = 2,3 do
                noteTweenAngle(t1..'middle_ms_pl_spin'..i, i, 360 * 2, durDad, ease)
            end
        end
    end
end

modchart.visibleStrum = function(visStr)
    local t2 = "visibleStrum_"
    if visStr:lower() == "boyfriend" or visStr:lower() == "bf" or visStr:lower() == "player" then
        for i = 4,7 do
            doTweenAlpha(t1..t2..'visStr_pl_'..i, i, 1, 1, "expoOut")
        end
        for i = 0,3 do
            doTweenAlpha(t1..t2..'visStr_op_'..i, i, 0, 1, "expoOut")
        end
    elseif visStr:lower() == "dad" or visStr:lower() == "opponent" then
        for i = 0,3 do
            doTweenAlpha(t1..t2..'visStr_op_'..i, i, 1, 1, "expoOut")
        end
        for i = 4,7 do
            doTweenAlpha(t1..t2..'visStr_pl_'..i, i, 0, 1, "expoOut")
        end
    elseif visStr:lower() == "all" then
        for i = 0,7 do
            doTweenAlpha(t1..t2..'visStr_all_'..i, i, 1, 1, "expoOut")
        end
    else
        debugPrint("[GhostUtil] Valid values are: opponent, dad, boyfriend, bf, player and all")
        debugPrint("[GhostUtil] ERROR WHILST TRYING TO CALL THE FUNCTION: \"visibleStrum()\" - Unknown value \""..visStr.."\" for 1st parameter (visStr)")
    end
end

return modchart