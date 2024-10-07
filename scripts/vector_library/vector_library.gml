// Note: This library is very incomplete due to it failing to decompile
// and as a result me having to try and remake the entire library from scratch.
function vector2(_x = 0, _y = 0) constructor
{
	static set = function(_x, _y)
	{
		x = _x;
		y = _y;
	};
	static setvector = function(_vector)
	{
		x = _vector.x;
		y = _vector.y;
	};
	static add = function(_x, _y)
	{
		x += _x;
		y += _y;
	};
	static addvector = function(_vector)
	{
		x += _vector.x;
		y += _vector.y;
	};
	static multiply = function(_amount)
	{
		x *= _amount;
		y *= _amount;
	};
	static divide = function(_x, _y)
	{
		x /= _x;
		y /= _y;
	};
	static multiplyvector = function(_vector)
	{
		x *= _vector.x;
		y *= _vector.y;
	};
	static dividevector = function(_vector)
	{
		x /= _vector.x;
		y /= _vector.y;
	};
	static lerpTowards = function(_vector, _amount)
	{
		x = lerp(x, _vector.x, _amount)
		y = lerp(y, _vector.y, _amount)
	};
	x = _x;
	y = _y;
}