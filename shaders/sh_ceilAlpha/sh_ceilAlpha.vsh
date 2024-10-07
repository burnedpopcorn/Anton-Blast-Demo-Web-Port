attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;
varying vec2 v_TextureCoord;
varying vec4 v_Colour;
void main(){
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*vec4(in_Position.xyz,1.);
	
	v_Colour = in_Colour;
	v_TextureCoord = in_TextureCoord;
}
