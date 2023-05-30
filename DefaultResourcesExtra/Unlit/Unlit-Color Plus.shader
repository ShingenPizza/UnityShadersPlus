// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

// Unlit shader. Simplest possible colored shader.
// - no lighting
// - no lightmap support
// - no texture

// Unity's Unlit Color shader edited by ShingenPizza. More info in README.txt .

Shader "ShingenPizza/Unlit Color Plus" {
Properties {
    _Color ("Main Color", Color) = (1,1,1,1)

    [Toggle] _VRC_Limited_Visibility("Limited Visibility", Float) = 0.0
    [ToggleOff] _VRC_Visible_Normal("Visible Normally", Float) = 1.0
    [ToggleOff] _VRC_Visible_Camera("Visible To Cameras", Float) = 1.0
    [ToggleOff] _VRC_Visible_VRCLens("Visible To VRCLens", Float) = 1.0
    [ToggleOff] _VRC_Visible_Screenshot("Visible On Screenshots", Float) = 1.0
    [ToggleOff] _VRC_Visible_Mirror("Visible In Mirrors", Float) = 1.0
    [ToggleOff] _VRC_Visible_Mirror_Camera("Visible In Mirrors To Cameras", Float) = 1.0
    [ToggleOff] _VRC_Visible_Mirror_VRCLens("Visible In Mirrors To VRCLens", Float) = 1.0
    [ToggleOff] _VRC_Visible_Mirror_Screenshot("Visible In Mirrors On Screenshots", Float) = 1.0
    [HideInInspector] _Cull("__cull", Float) = 2.0
}

SubShader {
    Tags { "RenderType"="Opaque" }
    LOD 100
    Cull [_Cull]

    Pass {
        CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 2.0
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "CGIncludes/PlusStuff.cginc"

            struct appdata_t {
                float4 vertex : POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f {
                float4 vertex : SV_POSITION;
                UNITY_FOG_COORDS(0)
                UNITY_VERTEX_OUTPUT_STEREO
            };

            fixed4 _Color;

            v2f vert (appdata_t v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                o.vertex = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                check_visibility();

                fixed4 col = _Color;
                UNITY_APPLY_FOG(i.fogCoord, col);
                UNITY_OPAQUE_ALPHA(col.a);
                return col;
            }
        ENDCG
    }
}

Fallback "Unlit/Color"
CustomEditor "ShingenPizza.Shaders.UnityPlus.StandardUnlitShaderGUIPlus"
}
