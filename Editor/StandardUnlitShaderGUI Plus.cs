// Based on the Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

// Adapted to handle the Particle Standard Unlit shader by ShingenPizza. More info in README.txt .

using UnityEditor;
using UnityEngine;

namespace ShingenPizza.Shaders.UnityPlus
{
    public class StandardUnlitShaderGUIPlus : ShaderGUIPlus
    {
        private static class Styles
        {
            public static GUIContent alphaCutoffText = EditorGUIUtility.TrTextContent("Alpha cutoff", "Threshold for alpha cutoff");
        }

        MaterialProperty albedoMap = null;
        MaterialProperty alphaCutoff = null;
        MaterialProperty albedoColor = null;

        // MaterialEditor m_MaterialEditor; // moved to ShaderGUIPlus

        public void FindProperties(MaterialProperty[] props)
        {
            albedoMap = FindProperty("_MainTex", props, false);
            alphaCutoff = FindProperty("_Cutoff", props, false);
            albedoColor = FindProperty("_Color", props, false);

            FindPropertiesPlus(props);
        }

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
        {
            FindProperties(props); // MaterialProperties can be animated so we do not cache them but fetch them every event to ensure animated values are updated correctly
            m_MaterialEditor = materialEditor;
            Material material = materialEditor.target as Material;

            ShaderPropertiesGUI(material);
        }

        public void ShaderPropertiesGUI(Material material)
        {
            // Semi-recreated original GUI
            if (albedoMap != null) { m_MaterialEditor.ShaderProperty(albedoMap, material.shader.name.Contains("Transparent") ? "Base (RGB) Trans (A)" : "Base (RGB)"); }
            if (alphaCutoff != null) { m_MaterialEditor.ShaderProperty(alphaCutoff, Styles.alphaCutoffText, 0); }
            if (albedoColor != null) { m_MaterialEditor.ShaderProperty(albedoColor, "Main Color"); }
            EditorGUILayout.Space(12.0f);
            m_MaterialEditor.RenderQueueField();
            m_MaterialEditor.DoubleSidedGIField();

            // My stuff
            EditorGUILayout.Space();
            PlusOptions(material);
        }
    }
} // namespace ShingenPizza.Shaders.UnityPlus
