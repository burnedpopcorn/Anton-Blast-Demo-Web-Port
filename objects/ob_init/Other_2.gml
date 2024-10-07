global.fontMain = font_add_sprite_ext(fn_placeholder, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.&,-~@!?()[]:'", 0, 0)
global.fontMain2 = font_add_sprite_ext(fn_placeholder_1, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.&,-~@!?()[]:'", 0, 0)
global.fontLevelName = font_add_sprite_ext(fn_levelName, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.&,-~@!?()[]:'/_", true, -1)
global.fontTimer = font_add_sprite_ext(fn_timerCounter, "0123456789:", 0, 0)
global.fontSlotCounter = font_add_sprite_ext(fn_slotCounter, "0123456789-", 0, 0)
global.fontPointCounter = font_add_sprite_ext(fn_pointCounter, "0123456789-", 0, 0)
global.fontComboCounter = font_add_sprite_ext(fn_comboCounter, "0123456789", 0, 0)
enum playerstates
{
	normal,
	clutch,
	airhammer,
	crouch,
	slide,
	roll,
	assblast,
	ladderclimb,
	clutchhit,
	rollhit,
	hurt,
	layerjump,
	dummy,
	death,
	reactcannon,
}
enum enemystates
{
	normal,
	turn,
	revup,
	charge,
	stunned,
	getup,
	death,
	paletteshift,
}