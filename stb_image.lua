source_file = "binding_source.c"

function prepend_to_cpp()
    return [[
#include <memory>
#include "../binding_source.c"
]]
end

function prepend_to_cheez()
    return [[
#lib("./lib/binding.lib")

FILE :: struct {}

#export_scope

]]
end

function on_global_variable(decl, name, type)
    return true, nil
end

function on_typedef(decl, name, text)
    if name == "resample_row_func" then
        return ""
    end
    index = name:find("stbi")
    -- print("typedef " .. name .. " '" .. text .. "'")
    if (index == nil)
    then
        return nil
    else
        return ""
    end
end

special_macros = {
}

function on_macro(decl, name)
    return true, nil
end

function on_function(decl, name)
    index = name:find("stbi")
    if (index == nil)
    then
        -- doesn't start with glfw*, so don't emit anything
        return true, nil
    else
        -- starts with glfw*, so emit default
        return false, nil
    end
end

function on_struct(decl, name)
    print("struct " .. name)
    index = name:find("stbi")
    if (index == nil)
    then
        -- doesn't start with GLFW*, so don't emit anything
        return true, nil
    else
        -- starts with GLFW*, so emit default
        return false, nil
    end
    -- return false, nil
end

function on_union(decl, name)
    return true, nil
end

function on_enum(enum)
    return nil
end