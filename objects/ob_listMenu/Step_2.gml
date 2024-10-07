if is_undefined(currentPage)
    self.changePage((bookMode ? pages[0] : array_get_last(pages)), 0)
if (instance_exists(disabledInputTimer))
{
	if disabledInputTimer.active()
		return;
}
self.changeItem((inputObject.down - inputObject.up))
if inputObject.cancel
    self.menuCancel()
else if (selectedItemIndex != -1)
    ds_list_find_value(currentPage, selectedItemIndex).interact()
if bookMode
{
    var _startPage = bookPage
    bookPage = clamp(((bookPage + inputObject.rb) - inputObject.lb), 0, (array_length(pages) - 1))
    if (bookPage != _startPage)
        self.changePage(pages[bookPage])
}
