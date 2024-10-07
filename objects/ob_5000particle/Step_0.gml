if b_growing
    spriteScale += 0.1
if (room == rm_VBJam)
    sprite_index = sp_5000particleVB
if (spriteScale >= 1 && b_growing)
{
    spriteScale = 1
    b_growing = 0
    alarm[0] = 30
}
if b_shrinking
    spriteScale -= 0.1
if (spriteScale <= 0)
    instance_destroy(self)
verticalSpeed -= 0.1
y += verticalSpeed
