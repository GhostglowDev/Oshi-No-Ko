

function onEvent(n, v1, v2)
    if n == "Aberration Bop" then
        runHaxeCode([[
            var abbrTween:FlxTween;
            abbrTween = FlxTween.num(0.4, 0.015, 0.8, {ease: FlxEase.expoOut},
            function(num)
            {
                shader0.setFloat('aberration', num);
            });
            var effcTween:FlxTween;
            effcTween = FlxTween.num(0.005, 0.0015, 0.8, {ease: FlxEase.expoOut},
            function(num)
            {
                shader0.setFloat('effectTime', num);
            });
        ]])
    end
end