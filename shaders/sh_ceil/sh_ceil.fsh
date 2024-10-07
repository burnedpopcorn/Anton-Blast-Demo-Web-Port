//
// Ceils all values, so all pixels get drawn as either (1,1,1,1) or (0,0,0,0)
//
varying vec2 v_TextureCoord;

void main()
{
	float val = ceil(texture2D(gm_BaseTexture, v_TextureCoord).a);
    gl_FragColor = vec4(val, val, val, val);
}
