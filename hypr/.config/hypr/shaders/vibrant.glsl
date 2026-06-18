#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

const float saturation  = 1.10;
const float contrast    = 1.04;
const float warmth      = 0.01;
const float brightness  = 1.02;

vec3 rgb2hsl(vec3 c) {
    float mx = max(c.r, max(c.g, c.b));
    float mn = min(c.r, min(c.g, c.b));
    float l = (mx + mn) * 0.5;
    float s = 0.0;
    float h = 0.0;

    if (mx != mn) {
        float d = mx - mn;
        s = l > 0.5 ? d / (2.0 - mx - mn) : d / (mx + mn);

        if (mx == c.r) {
            h = (c.g - c.b) / d + (c.g < c.b ? 6.0 : 0.0);
        } else if (mx == c.g) {
            h = (c.b - c.r) / d + 2.0;
        } else {
            h = (c.r - c.g) / d + 4.0;
        }
        h /= 6.0;
    }

    return vec3(h, s, l);
}

float hue2rgb(float p, float q, float t) {
    if (t < 0.0) t += 1.0;
    if (t > 1.0) t -= 1.0;
    if (t < 1.0 / 6.0) return p + (q - p) * 6.0 * t;
    if (t < 1.0 / 2.0) return q;
    if (t < 2.0 / 3.0) return p + (q - p) * (2.0 / 3.0 - t) * 6.0;
    return p;
}

vec3 hsl2rgb(vec3 hsl) {
    float h = hsl.x;
    float s = hsl.y;
    float l = hsl.z;

    if (s == 0.0) {
        return vec3(l);
    }

    float q = l < 0.5 ? l * (1.0 + s) : l + s - l * s;
    float p = 2.0 * l - q;

    float r = hue2rgb(p, q, h + 1.0 / 3.0);
    float g = hue2rgb(p, q, h);
    float b = hue2rgb(p, q, h - 1.0 / 3.0);

    return vec3(r, g, b);
}

void main() {
    vec4 pixel = texture(tex, v_texcoord);
    vec3 col = pixel.rgb;

    vec3 hsl = rgb2hsl(col);
    hsl.y = clamp(hsl.y * saturation, 0.0, 1.0);
    col = hsl2rgb(hsl);

    col = (col - 0.5) * contrast + 0.5;

    col.r += warmth;
    col.b -= warmth;

    col *= brightness;

    col = clamp(col, 0.0, 1.0);
    fragColor = vec4(col, pixel.a);
}
