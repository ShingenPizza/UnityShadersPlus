
## Unity Shaders Plus
This repository holds a copy of Unity's built-in shaders,
some of them edited to add some minor features,
while keeping compatibility with those standard shaders that people are commonly using already.

Initially created for the [Cleanup Crew](https://cleanupcrew.show/) crew,
to allow videographers to be visible to actors and each other,
while being invisible to each other's cameras.

Created to be used in VRChat, but feel free to use it wherever.

Please use the [Releases](https://github.com/ShingenPizza/UnityShadersPlus/releases) page for prepared .unitypackage files.<br>
**Do not** simply download and unpack this repository into your Unity project because it **will not work** that way.


### Edited shaders
- Standard
- Standard (Specular setup)
- Particle Standard Surface
- Particle Standard Unlit
- Unlit Color
- Unlit Texture
- Unlit Transparent
- Unlit Transparent Cutout


### Features
- **Limited Visibility**<br>
<img src="https://github.com/user-attachments/assets/73ed7cc1-2a30-4c45-ba2a-e31ebf947a05" width="512" alt="presenting the Limited Visibility feature" /><br>
toggles for visibility in VRChat when seen directly, in mirrors, on screenshots, and on cameras (separately the default VRChat one and Hirabiki's VRCLens).
- [**VRC Light Volumes**](https://github.com/REDSIM/VRCLightVolumes)<br>
<img src="https://github.com/user-attachments/assets/2cfe3af9-1d6c-470c-901a-218bae1a55cf" width="512" alt="presenting the VRC Light Volumes support" /><br>
support for the cool new "voxel based light probes replacement" (v2.1).
- **Two Sided**<br>
turning off backface culling if you need a mesh to be visible from both sides, to avoid having to duplicate mesh faces\*.

\* Available in some built-in shaders, simply copied to the others. Also, see "Known issues" section below.


### Example
Check out this [example avatar](https://vrchat.com/home/avatar/avtr_5f4f7749-d344-400e-9e2a-e8feccc5abdc) using the Standard Plus shader.


### Compatibility
They are available in packages based on built-in shaders of Unity versions:
- 2019.4.40f1 (meant to be used in projects of Unity 2019.4.31f1, which actual shaders are broken)
- 2022.3.6f1
- 2022.3.22f1

All of those versions, when used in Unity editor of the respective version, seem to work correctly in VRChat as of it using version 2022.3.22f1.<br>
I intend on updating all packages of versions that VRChat allows uploading content from, as long as it's not too big of a chore... but you kinda should be using the newest allowed Unity version. \:x


### Usage
After importing the package to your project, you can find these shaders in materials' shader selection under "ShingenPizza" category.

Example of usage for videographers:
1. Change the shader in your avatar's materials with one of my edits.
2. In those materials' GUIs in Inspector check "Limited Visibility Options".
3. To become invisible to regular VRChat cameras, uncheck checkboxes under "Camera". 
4. To become invisible to VRCLens, uncheck the checkboxes under "VRCLens".

Voilà!<br>
- If you need to be able to toggle this effect, you can animate the above checkboxes or just swap the entire material the usual Unity/VRChat way.
- Hint: if every videographer in given production is using only VRCLens, you can remain visible to regular cameras, in order to appear in the behind-the-scenes photos taken by spectators!


### Known issues:
- The Two Sided option doesn't work when toggled in VRChat - it needs to be set before upload.
- Since I had to create a custom editor for Unlit shaders, the Inspector view doesn't look exactly the way the default one does. (The shaders themselves work just fine, though.)


### Contact
- [Telegram: @ShingenPizza](https://t.me/ShingenPizza)
- [Discord: @shingen](https://discord.com/users/107929823900360704) (no need to add me to friends, I may ignore random requests, just send me a dm straight away, they're open)
- [Twitter/X: @ShingenPizza](https://x.com/ShingenPizza)
- [Bsky: @shingenpizza.bsky.social](https://bsky.app/profile/shingenpizza.bsky.social)


### Requests
If you'd like me to add a support for these features to other built-in shaders, feel free to create an [Issue](https://github.com/ShingenPizza/UnityShadersPlus/issues) or contact me through other means.


### Contributing
(This is only a short list of my own _requirements_ in that topic, not a guide of how to contribute code on GitHub - there should be many tutorials about it elsewhere, if you need one)
If you want to contribute some features/add the current ones to other shaders - cool!
Preferably just add them to the main branch. I should be able to handle backporting them, unless you want to handle that too.

Your changes need to:
- Not affect the behavior/look of the shader and already existing features when not used (to keep compatibility), and preferably also when used, unless that's their whole point, or there's an obvious unresolvable conflict between them.
- Not be excessively heavy on the GPU.


### Credits
- Unity Technologies, for the shader and editor code it's all based on.
- Hirabiki, for the VRCLens detection code bits.


### That's all Folks!
Have fun recording and being not recorded!
