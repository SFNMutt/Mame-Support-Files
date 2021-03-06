// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying 
#define COMPAT_ATTRIBUTE attribute 
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     float _frame_rotation;
COMPAT_VARYING     vec2 _pixel_no;
COMPAT_VARYING     vec2 _c11;
struct tex_coord {
    vec2 _c11;
    vec2 _pixel_no;
};
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
vec4 _oPosition1;
input_dummy _IN1;
vec4 _r0006;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 COLOR;
COMPAT_VARYING vec4 COL0;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec4 _oColor;
    tex_coord _coords;
    _r0006 = VertexCoord.x*MVPMatrix[0];
    _r0006 = _r0006 + VertexCoord.y*MVPMatrix[1];
    _r0006 = _r0006 + VertexCoord.z*MVPMatrix[2];
    _r0006 = _r0006 + VertexCoord.w*MVPMatrix[3];
    _oPosition1 = _r0006;
    _oColor = COLOR;
    _coords._c11 = TexCoord.xy;
    _coords._pixel_no = TexCoord.xy*TextureSize;
    gl_Position = _r0006;
    COL0 = COLOR;
    TEX1.xy = TexCoord.xy;
    TEX2.xy = _coords._pixel_no;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     float _frame_rotation;
COMPAT_VARYING     vec2 _pixel_no1;
COMPAT_VARYING     vec2 _c11;
struct tex_coord {
    vec2 _c11;
    vec2 _pixel_no1;
};
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
vec4 _ret_0;
vec4 _TMP0;
vec2 _TMP1;
float _TMP4;
float _TMP5;
uniform sampler2D Texture;
vec3 _TMP10;
float _TMP14;
vec2 _delta0015;
float _len0023;
float _TMP24;
float _x0025;
float _len0029;
float _TMP30;
float _x0031;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    _TMP0 = COMPAT_TEXTURE(Texture, TEX1.xy);
    _TMP1 = fract(TEX2.xy);
    _delta0015 = _TMP1 - vec2( 5.00000000E-01, 5.00000000E-01);
    _TMP4 = dot(_delta0015, _delta0015);
    _TMP5 = inversesqrt(_TMP4);
    _TMP14 = 1.00000000E+00/_TMP5;
    if (_TMP14 > 2.00000003E-01 && _TMP14 < 3.49999994E-01) { 
        _TMP10 = _TMP0.xyz;
    } else {
        if (_TMP14 >= 3.49999994E-01) { 
            _len0023 = _TMP14 - 3.49999994E-01;
            _x0025 = -6.00000000E+00*_len0023;
            _TMP24 = pow(2.71828198E+00, _x0025);
            _TMP10 = _TMP0.xyz*_TMP24;
        } else {
            if (_TMP14 <= 2.00000003E-01) { 
                _len0029 = 2.00000003E-01 - _TMP14;
                _x0031 = -6.00000000E+00*_len0029;
                _TMP30 = pow(2.71828198E+00, _x0031);
                _TMP10 = _TMP0.xyz*_TMP30;
            } else {
                _TMP10 = vec3( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00);
            } 
        } 
    } 
    _ret_0 = vec4(_TMP10.x, _TMP10.y, _TMP10.z, 1.00000000E+00);
    FragColor = _ret_0;
    return;
} 
#endif
