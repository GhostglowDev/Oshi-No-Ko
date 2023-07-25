--[[
    Adding other modules so you can use the other modules' functions and
    variables in this module!
]]
local util = require 'ghostutil.Util';
local math = require 'ghostutil.Math';

-- idk what this does but yes
---@class MyModule : omg what is this

-- The variable that is responsible for this module
local mymodule = {};

--[[
    a variable in this module that can return the value "Hello World"
    for example, in another script:

    mymodule = require 'ghostutil.custommodules.MyModule';
    
    function onSongStart()
        debugPrint(mymodule.text);
    end
]]
mymodule.text = "Hello World";

--[[
    This is a custom function..
    This custom function name is "func". Let's try it on another script..


    mymodule = require 'ghostutil.custommodules.MyModule';

    mymodule.func("What's up?");


    What the code above does is debug print the text "What's up?"
]]
mymodule.func = function(argument)
    debugPrint(argument);
end

return mymodule;