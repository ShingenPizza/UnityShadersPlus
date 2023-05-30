// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

// Unlit alpha-blended shader.
// - no lighting
// - no lightmap support
// - no per-material color

// Unity's Unlit Transparent shader edited by ShingenPizza. More info in README.txt .

Shader "ShingenPizza/Unlit Transparent Plus" {
Properties {
    _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}

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
    Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
    LOD 100
    Cull [_Cull]

    ZWrite Off
    Blend SrcAlpha OneMinusSrcAlpha

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
                float2 texcoord : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f {
                float4 vertex : SV_POSITION;
                float2 texcoord : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                UNITY_VERTEX_OUTPUT_STEREO
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata_t v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                check_visibility();

                fixed4 col = tex2D(_MainTex, i.texcoord);
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
        ENDCG
    }
}

Fallback "Unlit/Transparent"
CustomEditor "ShingenPizza.Shaders.UnityPlus.StandardUnlitShaderGUIPlus"
}
