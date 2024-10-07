//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec4 uv;
uniform vec2 texel;
uniform float amplitude;
uniform float period;

vec2 normalize_uv(vec2 tex,vec4 uv)
{
    return (tex-uv.xy)/(uv.zw-uv.xy);
}

void main()
{
	vec2 norm_texcoord=normalize_uv(v_vTexcoord,uv);
	vec2 texcoord=v_vTexcoord;
	texcoord.x+=amplitude*texel.x*sin(norm_texcoord.y*(1.0/period)+time);
	vec4 tex = (texcoord.x>uv.x && texcoord.x<uv.z) ? texture2D(gm_BaseTexture,texcoord) : vec4(vec3(0.),0.);
	tex.rgb = mix(tex.rgb, vec3(1.,0.,1.),0.1+0.1*0.5*(sin(time)+1.));
	gl_FragColor = tex;
}
