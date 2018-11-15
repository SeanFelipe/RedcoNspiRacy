attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord0;

uniform mat4 u_projTrans;
uniform vec4 u_color;
varying vec2 v_texCoords;

void main()
{
    gl_Position = a_Position;
    gl_PointSize = 10.0;
}
