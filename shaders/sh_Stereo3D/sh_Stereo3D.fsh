varying vec2 v_texcoord;
varying vec4 v_color;

uniform float displacement;

void main()
{
    vec2 uv = v_texcoord.xy;
    vec4 tex_color;
    tex_color.r = texture2D(gm_BaseTexture, vec2(uv.x + displacement, uv.y)).x;
    tex_color.g = texture2D(gm_BaseTexture, vec2(uv.x, uv.y)).y;
    tex_color.b = texture2D(gm_BaseTexture, vec2(uv.x - displacement, uv.y)).z;
    tex_color.a = texture2D(gm_BaseTexture, vec2(uv.x, uv.y)).a;
    gl_FragColor.rgba = tex_color;
}
