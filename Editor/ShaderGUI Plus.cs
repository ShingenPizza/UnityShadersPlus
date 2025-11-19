// Based on the Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

// Created by ShingenPizza. More info in README.txt .

using UnityEditor;
using UnityEngine;

namespace ShingenPizza.Shaders.UnityPlus
{
    public class ShaderGUIPlus : ShaderGUI
    {
        private static class Styles
        {
            public static readonly GUIContent twoSidedEnabled = EditorGUIUtility.TrTextContent("Two Sided", "Render both front and back faces of the geometry.");
        }

        static readonly string[] visibility_columns = { "Normal", "Camera", "VRCLens", "Screenshot" };
        static readonly string[] visibility_rows = { "Normal", "Mirror" };
        const int visibility_width = 80;
        const int visibility_height = 20;

        MaterialProperty limited_visibility;
        readonly MaterialProperty[] visibility_values = new MaterialProperty[visibility_columns.Length * visibility_rows.Length];

        MaterialProperty light_volumes_on;
        MaterialProperty light_volumes_speculars;
        MaterialProperty light_volumes_dominant_speculars;

        protected MaterialProperty min_brightness;

        protected MaterialProperty cullMode;

        protected MaterialEditor m_MaterialEditor;

        protected void FindPropertiesPlus(MaterialProperty[] props)
        {
            FindPropertiesPlusVisibility(props);
            FindPropertiesPlusLightVolumes(props);
            FindPropertiesPlusMinBrightness(props);
            FindPropertiesPlusCull(props);
        }

        protected void FindPropertiesPlusVisibility(MaterialProperty[] props)
        {
            limited_visibility = FindProperty("_VRC_Limited_Visibility", props);
            visibility_values[0] = FindProperty("_VRC_Visible_Normal", props);
            visibility_values[1] = FindProperty("_VRC_Visible_Camera", props);
            visibility_values[2] = FindProperty("_VRC_Visible_VRCLens", props);
            visibility_values[3] = FindProperty("_VRC_Visible_Screenshot", props);
            visibility_values[4] = FindProperty("_VRC_Visible_Mirror", props);
            visibility_values[5] = FindProperty("_VRC_Visible_Mirror_Camera", props);
            visibility_values[6] = FindProperty("_VRC_Visible_Mirror_VRCLens", props);
            visibility_values[7] = FindProperty("_VRC_Visible_Mirror_Screenshot", props);
        }

        protected void FindPropertiesPlusLightVolumes(MaterialProperty[] props)
        {
            light_volumes_on = FindProperty("_LightVolumes", props);
            light_volumes_speculars = FindProperty("_Speculars", props);
            light_volumes_dominant_speculars = FindProperty("_DominantDirSpeculars", props);
        }

        protected void FindPropertiesPlusMinBrightness(MaterialProperty[] props)
        {
            min_brightness = FindProperty("_LightingMinLightBrightness", props);
        }

        public void FindPropertiesPlusCull(MaterialProperty[] props)
        {
            cullMode = FindProperty("_Cull", props);
        }

        protected void PlusOptions(Material material)
        {
            GUILayout.Label("Plus Options", EditorStyles.largeLabel);
            VisibilityOptions();
            LightVolumesOptions(material);
            OtherOptions();
        }

        protected void VisibilityOptions()
        {
            bool limited_visibility_mixed_values = limited_visibility.hasMixedValue;
            EditorGUI.showMixedValue = limited_visibility_mixed_values;
            bool tmp_lv = limited_visibility.floatValue != 0f;
            EditorGUI.BeginChangeCheck();
            tmp_lv = EditorGUILayout.Toggle(EditorGUIUtility.TrTextContent("Limited Visibility Options", "Keep off for minor performance boost if you want the material to be visible in all cases."), tmp_lv);
            if (EditorGUI.EndChangeCheck())
            {
                limited_visibility.floatValue = tmp_lv ? 1f : 0f;
            }
            EditorGUI.showMixedValue = false;

            if (!tmp_lv && !limited_visibility_mixed_values) { return; }

            GUILayout.BeginVertical();
            {
                GUILayout.BeginHorizontal();
                {
                    GUILayout.Label("", GUILayout.Width(visibility_width));

                    foreach (string label in visibility_columns)
                    {
                        GUILayout.Label(label, GUILayout.Width(visibility_width));
                    }
                }
                GUILayout.EndHorizontal();

                for (int row = 0; row < visibility_rows.Length; row++)
                {
                    GUILayout.BeginHorizontal();
                    {
                        GUILayout.Label(visibility_rows[row], GUILayout.Width(visibility_width));
                        for (int column = 0; column < visibility_columns.Length; column++)
                        {
                            int index = row * visibility_columns.Length + column;
                            EditorGUI.showMixedValue = visibility_values[index].hasMixedValue;
                            bool tmp = visibility_values[index].floatValue != 0f;
                            EditorGUI.BeginChangeCheck();
                            tmp = EditorGUILayout.Toggle(tmp, GUILayout.Width(visibility_width), GUILayout.Height(visibility_height));
                            if (EditorGUI.EndChangeCheck())
                            {
                                visibility_values[index].floatValue = tmp ? 1f : 0f;
                            }
                            EditorGUI.showMixedValue = false;
                        }
                    }
                    GUILayout.EndHorizontal();
                }
            }
            GUILayout.EndVertical();
        }

        protected void LightVolumesOptions(Material material)
        {
            GUILayout.Label("Light Volumes", EditorStyles.boldLabel);

            EditorGUI.showMixedValue = light_volumes_on.hasMixedValue;
            bool tmp_lv = light_volumes_on.floatValue != 0f;
            EditorGUI.BeginChangeCheck();
            tmp_lv = EditorGUILayout.Toggle(EditorGUIUtility.TrTextContent("Enable Light Volumes", "Disable to never use LV. If enabled, it will still fall back to Light Probes if there are no LV in the world."), tmp_lv);
            if (EditorGUI.EndChangeCheck())
            {
                light_volumes_on.floatValue = tmp_lv ? 1f : 0f;
                SetKeyword(material, "_LIGHTVOLUMES_ON", tmp_lv);
            }
            EditorGUI.showMixedValue = false;

            bool light_volumes_speculars_mixed_values = light_volumes_speculars.hasMixedValue;
            EditorGUI.showMixedValue = light_volumes_speculars_mixed_values;
            bool tmp_lv_s = light_volumes_speculars.floatValue != 0f;
            EditorGUI.BeginChangeCheck();
            tmp_lv_s = EditorGUILayout.Toggle(EditorGUIUtility.TrTextContent("Speculars", "Specular LV reflections - independent from the \"Enable Light Volumes\" setting, just like in the original example."), tmp_lv_s);
            if (EditorGUI.EndChangeCheck())
            {
                light_volumes_speculars.floatValue = tmp_lv_s ? 1f : 0f;
                SetKeyword(material, "_SPECULARS_ON", tmp_lv_s);
            }
            EditorGUI.showMixedValue = false;

            if (!tmp_lv_s && !light_volumes_speculars_mixed_values) { return; }

            EditorGUI.showMixedValue = light_volumes_dominant_speculars.hasMixedValue;
            bool tmp_lv_s_d = light_volumes_dominant_speculars.floatValue != 0f;
            EditorGUI.BeginChangeCheck();
            tmp_lv_s_d = EditorGUILayout.Toggle(EditorGUIUtility.TrTextContent("Dominant Dir Speculars", "To quote LV docs: \"Better for hard surface PBR shaders.\""), tmp_lv_s_d);
            if (EditorGUI.EndChangeCheck())
            {
                light_volumes_dominant_speculars.floatValue = tmp_lv_s_d ? 1f : 0f;
                SetKeyword(material, "_DOMINANTDIRSPECULARS_ON", tmp_lv_s_d);
            }
            EditorGUI.showMixedValue = false;
        }

        protected void OtherOptions()
        {
            GUILayout.Label("Other Options", EditorStyles.boldLabel);
            MinBrightnessOptions();
            TwoSidedPopup();
        }

        protected void MinBrightnessOptions()
        {
            m_MaterialEditor.ShaderProperty(min_brightness, EditorGUIUtility.TrTextContent(min_brightness.displayName));
        }

        protected void TwoSidedPopup()
        {
            if (cullMode == null) { return; }

            // Taken from Unity's StandardParticlesShaderGUI.cs
            EditorGUI.showMixedValue = cullMode.hasMixedValue;
            var enabled = (cullMode.floatValue == (float)UnityEngine.Rendering.CullMode.Off);

            EditorGUI.BeginChangeCheck();
            enabled = EditorGUILayout.Toggle(Styles.twoSidedEnabled, enabled);
            if (EditorGUI.EndChangeCheck())
            {
                m_MaterialEditor.RegisterPropertyChangeUndo("Two Sided Enabled");
                cullMode.floatValue = enabled ? (float)UnityEngine.Rendering.CullMode.Off : (float)UnityEngine.Rendering.CullMode.Back;
            }

            EditorGUI.showMixedValue = false;
        }

        protected static void SetKeyword(Material m, string keyword, bool state)
        {
            if (state)
                m.EnableKeyword(keyword);
            else
                m.DisableKeyword(keyword);
        }

        # region Logging stuff
        protected const string LOG_INFO = "[<color=yellow>Shingen</color><color=red>Pizza</color>][<color=cyan>Unity Shaders Plus</color>]";
        // ReSharper disable once UnusedMember.Global
        protected void Log(object message) { Debug.Log($"{LOG_INFO} {message}"); }
        // ReSharper disable once UnusedMember.Global
        protected void LogWarning(object message) { Debug.LogWarning($"{LOG_INFO} {message}"); }
        // ReSharper disable once UnusedMember.Global
        protected void LogError(object message) { Debug.LogError($"{LOG_INFO} {message}"); }
        # endregion
    }
} // namespace ShingenPizza.Shaders.UnityPlus
