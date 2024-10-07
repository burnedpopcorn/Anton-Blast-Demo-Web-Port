function series() constructor
{
    static getSize = function()
    {
        return ds_priority_size(methods);
    }

    static addMethod = function(argument0, argument1, argument2)
    {
        if (argument2 == undefined)
            argument2 = 0
        ds_priority_add(methods, 
        {
            myMethod: argument0,
            params: argument1
        }
		, argument2)
        ds_priority_add(priorityPairs, argument2, argument2)
    }

    static execute = function(argument0)
    {
        while (self.getSize() > 0 && ds_priority_find_min(priorityPairs) <= argument0)
        {
            var _methodData = ds_priority_delete_min(methods)
            function_execute(_methodData.myMethod, _methodData.params)
            ds_priority_delete_min(priorityPairs)
        }
    }

    static clear = function()
    {
        ds_priority_clear(methods)
        ds_priority_clear(priorityPairs)
    }

    static destroy = function()
    {
        ds_priority_destroy(methods)
        ds_priority_destroy(priorityPairs)
    }
    methods = ds_priority_create()
    priorityPairs = ds_priority_create()
}

function seriesData(argument0, argument1, argument2) constructor
{
    myMethod = argument0
    params = argument1
    position = (nc_set(argument2) ? global.nc_val : 0)
}

