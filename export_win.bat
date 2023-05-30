
if exist ".\export\" del ".\export" /Q /S
if exist ".\export\" rmdir ".\export" /Q /S


mkdir ".\export"


mkdir ".\export\CGIncludes"

copy ".\CGIncludes\PlusStuff.cginc" ".\export\CGIncludes\PlusStuff.cginc"
copy ".\CGIncludes\UnityStandardCore Plus.cginc" ".\export\CGIncludes\UnityStandardCore Plus.cginc"
copy ".\CGIncludes\UnityStandardCoreForward Plus.cginc" ".\export\CGIncludes\UnityStandardCoreForward Plus.cginc"
copy ".\CGIncludes\UnityStandardCoreForwardSimple Plus.cginc" ".\export\CGIncludes\UnityStandardCoreForwardSimple Plus.cginc"
copy ".\CGIncludes\UnityStandardMeta Plus.cginc" ".\export\CGIncludes\UnityStandardMeta Plus.cginc"
copy ".\CGIncludes\UnityStandardParticleEditor Plus.cginc" ".\export\CGIncludes\UnityStandardParticleEditor Plus.cginc"
copy ".\CGIncludes\UnityStandardParticles Plus.cginc" ".\export\CGIncludes\UnityStandardParticles Plus.cginc"
copy ".\CGIncludes\UnityStandardParticleShadow Plus.cginc" ".\export\CGIncludes\UnityStandardParticleShadow Plus.cginc"
copy ".\CGIncludes\UnityStandardShadow Plus.cginc" ".\export\CGIncludes\UnityStandardShadow Plus.cginc"


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

copy ".\license.txt" ".\export\license.txt"
