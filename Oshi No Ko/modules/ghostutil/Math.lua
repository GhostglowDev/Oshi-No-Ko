local math = {}

math.lerp = function(a, b, c)
    return (1 - c) * a + c * b
end

math.boundTo = function(v, mx, mn) -- thanks lazt
    if v < mn then
        return mn
    elseif v > mx then
        return mx
    else
        return v
    end
end

math.floorDecimal = function(v, d)
    addHaxeLibrary("Highscore")
    return runHaxeCode("return Highscore.floorDecimal("..v..", "..d..");")
end

math.getMidpoint = function(x, y)
    return (x + y) / 2
end

return math