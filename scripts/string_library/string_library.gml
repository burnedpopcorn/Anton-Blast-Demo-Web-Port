var _e;
function string_pos_parentheses(argument0, argument1, argument2)
{
    var _startPos = string_pos(argument1, argument0)
    var _endPos = _startPos
    var _setCount = 1
    while (_setCount > 0)
    {
        if (string_length(argument0) <= _endPos)
            break
        else
        {
            _endPos++
            var _char = string_char_at(argument0, _endPos)
            if (_char == argument1)
                _setCount += 1
            if (_char == argument2)
                _setCount -= 1
        }
    }
    return [_startPos, _endPos];
}

function string_copy_within_characters(argument0, argument1, argument2)
{
    var _positions = string_pos_parentheses(argument0, argument1, argument2)
    return string_copy(argument0, (_positions[0] + 1), ((_positions[1] - _positions[0]) - 1));
}

function string_delete_within_characters(argument0, argument1, argument2)
{
    var _positions = string_pos_parentheses(argument0, argument1, argument2)
    return string_delete(argument0, _positions[0], ((_positions[1] - _positions[0]) + 1));
}

function string_parse(argument0)
{
    if is_array(argument0)
    {
        for (var i = 0; i < array_length(argument0); i++)
            argument0[i] = string_parse(argument0[i])
        return argument0;
    }
    if (!is_string(argument0))
        return argument0;
    switch argument0
    {
        case "true":
            return 1;
        case "false":
            return 0;
        case "infinity":
            return infinity;
        case "undefined":
            return undefined;
        case "noone":
            return -4;
        case "c_white":
            return c_white;
        case "c_black":
            return c_black;
        case "bm_subtract":
            return 3;
        case "":
            return argument0;
    }

    var _parseVarsExists = (is_struct(self) ? variable_struct_exists(self, "parseVars") : variable_instance_exists(id, "parseVars"))
    if (_parseVarsExists && ds_map_exists(parseVars, argument0))
        return ds_map_find_value(parseVars, argument0);
    var _methodPos = string_pos("(", argument0)
    var _arrayPos = string_pos("[", argument0)
    var _doMethod = _methodPos != 0
    var _doArray = _arrayPos != 0
    if (_doMethod && _doArray)
    {
        if (_methodPos < _arrayPos)
            _doArray = 0
        else
            _doMethod = 0
    }
    if _doMethod
    {
        var _parameterString = ""
        _parameterString = string_copy_within_characters(argument0, "(", ")")
        argument0 = string_delete_within_characters(argument0, "(", ")")
        var _functionInd = string_parse(argument0)
        var _parameters = []
        if (_parameterString != "")
            _parameters = string_split(_parameterString, ",", 1)
        return function_execute(_functionInd, _parameters);
    }
    if _doArray
    {
        var _arrayString = string_copy_within_characters(argument0, "[", "]")
        return string_split(_arrayString, ",", 1);
    }
    var _numberString = string_replace(argument0, "-", "")
    _numberString = string_replace(_numberString, ".", "")
    if (_numberString == string_digits(argument0))
        return real(argument0);
    if variable_global_exists(argument0)
        return variable_global_get(argument0);
    if (string_pos(".", argument0) != 0)
    {
        var _varStringArray = string_split(argument0, ".", 0)
        var _objectString = _varStringArray[0]
        var _varString = _varStringArray[1]
        var _object = asset_get_index(_objectString)
        var _inst = instance_nearest(ob_player.x, ob_player.y, _object)
        return variable_instance_get(_inst, _varString);
    }
    if (asset_get_type(argument0) != -1)
        return asset_get_index(argument0);
    return argument0;
}

function string_split(argument0, argument1, argument2)
{
    if (argument1 == undefined)
        argument1 = ""
    if (argument2 == undefined)
        argument2 = 0
    var _out = []
    if (argument1 == "")
    {
        var _stringLength = string_length(argument0)
        for (var i = 0; i < _stringLength; i++)
            _out[i] = string_char_at(argument0, (i + 1))
    }
    else
    {
        i = 0
        while 1
        {
            var _delimiterPos = string_pos(argument1, argument0)
            if (_delimiterPos == 0)
            {
                _out[i] = argument0
                break
            }
            else
            {
                _out[i] = string_copy(argument0, 1, (_delimiterPos - 1))
                argument0 = string_delete(argument0, 1, _delimiterPos)
                i += 1
            }
        }
    }
    if argument2
        _out = string_parse(_out)
    return _out;
}

function string_capitalize(argument0)
{
    var _char = string_char_at(argument0, 1)
    var _charCapped = string_upper(_char)
    return string_replace(argument0, _char, _charCapped);
}

function string_replace_multiple()
{
    var _string = argument[0]
    for (var i = 1; i < argument_count; i++)
    {
        var _replaceData = argument[i]
        _string = string_replace_all(_string, _replaceData[0], string(_replaceData[1]))
    }
    return _string;
}

function string_backspace(argument0, argument1)
{
    if (argument1 == undefined)
        argument1 = 1
    if (string_length(argument0) <= argument1)
        return "";
    return string_delete(argument0, ((string_length(argument0) - argument1) + 1), argument1);
}

function string_clean(argument0)
{
    argument0 = string_replace_all(argument0, "_", " ")
    for (var i = 1; i <= string_length(argument0); i++)
    {
        var _currentChar = string_char_at(argument0, i)
        if (_currentChar == string_upper(string_letters(_currentChar)))
        {
            argument0 = string_delete(argument0, i, 1)
            argument0 = string_insert((" " + string_lower(_currentChar)), argument0, i)
        }
    }
    while (string_char_at(argument0, 1) == " ")
        argument0 = string_delete(argument0, 1, 1)
    for (i = 1; i <= string_length(argument0); i++)
    {
        if (string_char_at(argument0, i) == " " && string_char_at(argument0, (i + 1)) == " ")
            argument0 = string_delete(argument0, i, 1)
    }
    return string_capitalize(argument0);
}

function string_concat()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	return _string;
}
