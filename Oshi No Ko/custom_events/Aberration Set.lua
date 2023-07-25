function onEvent(n, v1, v2)
    if n == "Aberration Set" then
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.0015);
            shader0.setFloat('effectTime',0.0015);
        ]])
    end
end