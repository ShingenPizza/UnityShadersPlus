
rm -rf "./export"


mkdir "./export"


mkdir "./export/CGIncludes"

cp "./CGIncludes/PlusStuff.cginc" "./export/CGIncludes/PlusStuff.cginc"
cp "./CGIncludes/UnityStandardCore Plus.cginc" "./export/CGIncludes/UnityStandardCore Plus.cginc"
cp "./CGIncludes/UnityStandardCoreForward Plus.cginc" "./export/CGIncludes/UnityStandardCoreForward Plus.cginc"
cp "./CGIncludes/UnityStandardCoreForwardSimple Plus.cginc" "./export/CGIncludes/UnityStandardCoreForwardSimple Plus.cginc"
cp "./CGIncludes/UnityStandardMeta Plus.cginc" "./export/CGIncludes/UnityStandardMeta Plus.cginc"
cp "./CGIncludes/UnityStandardParticleEditor Plus.cginc" "./export/CGIncludes/UnityStandardParticleEditor Plus.cginc"
cp "./CGIncludes/UnityStandardParticles Plus.cginc" "./export/CGIncludes/UnityStandardParticles Plus.cginc"
cp "./CGIncludes/UnityStandardParticleShadow Plus.cginc" "./export/CGIncludes/UnityStandardParticleShadow Plus.cginc"
cp "./CGIncludes/UnityStandardShadow Plus.cginc" "./export/CGIncludes/UnityStandardShadow Plus.cginc"


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

cp "./license.txt" "./export/license.txt"
