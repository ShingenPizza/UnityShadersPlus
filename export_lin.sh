
rm -rf "./export"


mkdir "./export"


mkdir "./export/CGIncludes"

cp "./CGIncludes/LightVolumes.cginc" "./export/CGIncludes/LightVolumes.cginc"
cp "./CGIncludes/PlusStuff.cginc" "./export/CGIncludes/PlusStuff.cginc"
cp "./CGIncludes/UnityGlobalIllumination_Plus.cginc" "./export/CGIncludes/UnityGlobalIllumination_Plus.cginc"
cp "./CGIncludes/UnityImageBasedLighting_Plus.cginc" "./export/CGIncludes/UnityImageBasedLighting_Plus.cginc"
cp "./CGIncludes/UnityLightingCommon_Plus.cginc" "./export/CGIncludes/UnityLightingCommon_Plus.cginc"
cp "./CGIncludes/UnityPBSLighting_Plus.cginc" "./export/CGIncludes/UnityPBSLighting_Plus.cginc"
cp "./CGIncludes/UnityStandardBRDF_Plus.cginc" "./export/CGIncludes/UnityStandardBRDF_Plus.cginc"
cp "./CGIncludes/UnityStandardCore_Plus.cginc" "./export/CGIncludes/UnityStandardCore_Plus.cginc"
cp "./CGIncludes/UnityStandardCoreForward_Plus.cginc" "./export/CGIncludes/UnityStandardCoreForward_Plus.cginc"
cp "./CGIncludes/UnityStandardCoreForwardSimple_Plus.cginc" "./export/CGIncludes/UnityStandardCoreForwardSimple_Plus.cginc"
cp "./CGIncludes/UnityStandardInput_Plus.cginc" "./export/CGIncludes/UnityStandardInput_Plus.cginc"
cp "./CGIncludes/UnityStandardMeta_Plus.cginc" "./export/CGIncludes/UnityStandardMeta_Plus.cginc"
cp "./CGIncludes/UnityStandardParticleEditor_Plus.cginc" "./export/CGIncludes/UnityStandardParticleEditor_Plus.cginc"
cp "./CGIncludes/UnityStandardParticles_Plus.cginc" "./export/CGIncludes/UnityStandardParticles_Plus.cginc"
cp "./CGIncludes/UnityStandardParticleShadow_Plus.cginc" "./export/CGIncludes/UnityStandardParticleShadow_Plus.cginc"
cp "./CGIncludes/UnityStandardShadow_Plus.cginc" "./export/CGIncludes/UnityStandardShadow_Plus.cginc"


mkdir "./export/Editor"

cp "./Editor/ShaderGUI Plus.cs" "./export/Editor/ShaderGUI Plus.cs"
cp "./Editor/StandardParticlesShaderGUI Plus.cs" "./export/Editor/StandardParticlesShaderGUI Plus.cs"
cp "./Editor/StandardShaderGUI Plus.cs" "./export/Editor/StandardShaderGUI Plus.cs"
cp "./Editor/StandardUnlitShaderGUI Plus.cs" "./export/Editor/StandardUnlitShaderGUI Plus.cs"


cp "./DefaultResourcesExtra/Particle Standard Surface Plus.shader" "./export/Particle Standard Surface Plus.shader"
cp "./DefaultResourcesExtra/Particle Standard Unlit Plus.shader" "./export/Particle Standard Unlit Plus.shader"
cp "./DefaultResourcesExtra/Standard Plus.shader" "./export/Standard Plus.shader"
cp "./DefaultResourcesExtra/StandardSpecular Plus.shader" "./export/StandardSpecular Plus.shader"
cp "./DefaultResourcesExtra/Unlit/Unlit-Alpha Plus.shader" "./export/Unlit-Alpha Plus.shader"
cp "./DefaultResourcesExtra/Unlit/Unlit-AlphaTest Plus.shader" "./export/Unlit-AlphaTest Plus.shader"
cp "./DefaultResourcesExtra/Unlit/Unlit-Color Plus.shader" "./export/Unlit-Color Plus.shader"
cp "./DefaultResourcesExtra/Unlit/Unlit-Normal Plus.shader" "./export/Unlit-Normal Plus.shader"

cp "./README.md" "./export/README.md"
cp "./version.txt" "./export/version.txt"

cp "./license.txt" "./export/license.txt"
