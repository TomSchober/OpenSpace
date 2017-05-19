/*****************************************************************************************
 *                                                                                       *
 * OpenSpace                                                                             *
 *                                                                                       *
 * Copyright (c) 2014                                                                    *
 *                                                                                       *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this  *
 * software and associated documentation files (the "Software"), to deal in the Software *
 * without restriction, including without limitation the rights to use, copy, modify,    *
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to    *
 * permit persons to whom the Software is furnished to do so, subject to the following   *
 * conditions:                                                                           *
 *                                                                                       *
 * The above copyright notice and this permission notice shall be included in all copies *
 * or substantial portions of the Software.                                              *
 *                                                                                       *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,   *
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A         *
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT    *
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF  *
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE  *
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                         *
 ****************************************************************************************/

// in vec4 gs_color;
// in vec3 gs_color;
in float gs_depth;

uniform vec4 color;
//uniform bool classification;
//uniform vec4 fieldLineColor;

#include "fragment.glsl"
#include "PowerScaling/powerScaling_fs.hglsl"

Fragment getFragment() {
    vec4 fragColor;
    if (color.a == 0) {
        discard;
    }
  //  if (classification) {
        // fragColor = vec4(gs_color,.45);
        // fragColor = gs_color;
        fragColor = color;
        // fragColor = vec4(1.0,0,0,0.5);
    //} else {
    //    fragColor = vec4(fieldLineColor.rgb * fieldLineColor.a , 1.0);
    //}

    //float depth = pscDepth(vs_position);

    Fragment frag;
    // frag.depth = 1.0;
    frag.depth = gs_depth;
    frag.color = fragColor;
    return frag;
}