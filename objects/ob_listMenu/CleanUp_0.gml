ds_stack_destroy(pageHistory)
var __i = 0
if (__i < array_length(pages))
    var _page = pages[0]
while (__i < array_length(pages))
{
    ds_list_destroy(_page)
    __i++
    if (__i < array_length(pages))
        _page = pages[__i]
}
