if (!instance_exists(myInstance))
{
    instance_destroy()
    return;
}
if (!is_undefined(time))
{
    time -= 1
    if (time <= 0)
    {
        if (!is_undefined(myMethod))
            self.myMethod()
        if (time <= 0)
            time = undefined
    }
}
