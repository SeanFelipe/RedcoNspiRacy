#ifdef GL_ES
    precision mediump float;
#endif

uniform vec4 u_Color;
varying vec2 v_texCoords;
uniform sampler2D u_texture;

void main() {
  gl_FragColor = u_Color;
}
