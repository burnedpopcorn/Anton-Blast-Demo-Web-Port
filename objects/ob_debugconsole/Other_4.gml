if (DEBUG)
{
	with (ob_block_par)
	{
		if (object_index == ob_block_BG || object_index == ob_block_FG)
			debugvisible = other.showcollisions
	}
	with (ob_slope_BG)
		debugvisible = other.showcollisions
	with (ob_slope_FG)
		debugvisible = other.showcollisions
	with (ob_passthrough_BG)
		debugvisible = other.showcollisions
	with (ob_passthrough_FG)
		debugvisible = other.showcollisions
}