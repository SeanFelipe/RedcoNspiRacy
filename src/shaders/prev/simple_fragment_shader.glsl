#ifdef GL_ES
    precision mediump float;
#endif

uniform vec4 u_color;
varying vec2 v_texCoords;
uniform sampler2D u_texture;
uniform mat4 u_projTrans;

void main()
{
    gl_FragColor = u_Color;
}
