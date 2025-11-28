
if exist ".\export\" del ".\export" /Q /S
if exist ".\export\" rmdir ".\export" /Q /S


mkdir ".\export"


mkdir ".\export\CGIncludes"

copy ".\CGIncludes\LightVolumes.cginc" ".\export\CGIncludes\LightVolumes.cginc"
copy ".\CGIncludes\PlusStuff.cginc" ".\export\CGIncludes\PlusStuff.cginc"
copy ".\CGIncludes\UnityGlobalIllumination_Plus.cginc" ".\export\CGIncludes\UnityGlobalIllumination_Plus.cginc"
copy ".\CGIncludes\UnityImageBasedLighting_Plus.cginc" ".\export\CGIncludes\UnityImageBasedLighting_Plus.cginc"
copy ".\CGIncludes\UnityLightingCommon_Plus.cginc" ".\export\CGIncludes\UnityLightingCommon_Plus.cginc"
copy ".\CGIncludes\UnityPBSLighting_Plus.cginc" ".\export\CGIncludes\UnityPBSLighting_Plus.cginc"
copy ".\CGIncludes\UnityStandardBRDF_Plus.cginc" ".\export\CGIncludes\UnityStandardBRDF_Plus.cginc"
copy ".\CGIncludes\UnityStandardCore_Plus.cginc" ".\export\CGIncludes\UnityStandardCore_Plus.cginc"
copy ".\CGIncludes\UnityStandardCoreForward_Plus.cginc" ".\export\CGIncludes\UnityStandardCoreForward_Plus.cginc"
copy ".\CGIncludes\UnityStandardCoreForwardSimple_Plus.cginc" ".\export\CGIncludes\UnityStandardCoreForwardSimple_Plus.cginc"
copy ".\CGIncludes\UnityStandardInput_Plus.cginc" ".\export\CGIncludes\UnityStandardInput_Plus.cginc"
copy ".\CGIncludes\UnityStandardMeta_Plus.cginc" ".\export\CGIncludes\UnityStandardMeta_Plus.cginc"
copy ".\CGIncludes\UnityStandardParticleEditor_Plus.cginc" ".\export\CGIncludes\UnityStandardParticleEditor_Plus.cginc"
copy ".\CGIncludes\UnityStandardParticles_Plus.cginc" ".\export\CGIncludes\UnityStandardParticles_Plus.cginc"
copy ".\CGIncludes\UnityStandardParticleShadow_Plus.cginc" ".\export\CGIncludes\UnityStandardParticleShadow_Plus.cginc"
copy ".\CGIncludes\UnityStandardShadow_Plus.cginc" ".\export\CGIncludes\UnityStandardShadow_Plus.cginc"


mkdir ".\export\Editor"

copy ".\Editor\ShaderGUI Plus.cs" ".\export\Editor\ShaderGUI Plus.cs"
copy ".\Editor\StandardParticlesShaderGUI Plus.cs" ".\export\Editor\StandardParticlesShaderGUI Plus.cs"
copy ".\Editor\StandardShaderGUI Plus.cs" ".\export\Editor\StandardShaderGUI Plus.cs"
copy ".\Editor\StandardUnlitShaderGUI Plus.cs" ".\export\Editor\StandardUnlitShaderGUI Plus.cs"


copy ".\DefaultResourcesExtra\Particle Standard Surface Plus.shader" ".\export\Particle Standard Surface Plus.shader"
copy ".\DefaultResourcesExtra\Particle Standard Unlit Plus.shader" ".\export\Particle Standard Unlit Plus.shader"
copy ".\DefaultResourcesExtra\Standard Plus.shader" ".\export\Standard Plus.shader"
copy ".\DefaultResourcesExtra\StandardSpecular Plus.shader" ".\export\StandardSpecular Plus.shader"
copy ".\DefaultResourcesExtra\Unlit\Unlit-Alpha Plus.shader" ".\export\Unlit-Alpha Plus.shader"
copy ".\DefaultResourcesExtra\Unlit\Unlit-AlphaTest Plus.shader" ".\export\Unlit-AlphaTest Plus.shader"
copy ".\DefaultResourcesExtra\Unlit\Unlit-Color Plus.shader" ".\export\Unlit-Color Plus.shader"
copy ".\DefaultResourcesExtra\Unlit\Unlit-Normal Plus.shader" ".\export\Unlit-Normal Plus.shader"

copy ".\README.md" ".\export\README.md"
copy ".\version.txt" ".\export\version.txt"

copy ".\license.txt" ".\export\license.txt"
