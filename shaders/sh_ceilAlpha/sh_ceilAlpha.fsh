//
// Ceils alpha, ignoring it when drawing
//
varying vec2 v_TextureCoord;
varying vec4 v_Colour;

void main()
{
	gl_FragColor = v_Colour * texture2D( gm_BaseTexture, v_TextureCoord);
    gl_FragColor.a = ceil(gl_FragColor.a);
}
