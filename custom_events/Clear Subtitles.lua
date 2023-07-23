function onEvent(n, v1, v2)
    if n == "Clear Subtitles" then
        doTweenAlpha("subAlpha", "sub", 0, 0.7, "expoOut")
        doTweenY("subby1", "bar1", -200, 1.075, "expoOut")
        doTweenY("subby2", "bar2", 820, 1.075, "expoOut")
    end
end