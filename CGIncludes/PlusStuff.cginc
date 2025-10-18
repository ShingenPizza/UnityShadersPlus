// ShingenPizza's Secret Shader Sauce. More info in README.txt .
// Contains code by Hirabiki, the creator of VRCLens.

#ifndef SHINGENPIZZA_PLUS_STUFF
#define SHINGENPIZZA_PLUS_STUFF

float _VRChatCameraMode;
float _VRChatMirrorMode;

float _VRC_Limited_Visibility;
float _VRC_Visible_Normal;
float _VRC_Visible_Camera;
float _VRC_Visible_VRCLens;
float _VRC_Visible_Screenshot;
float _VRC_Visible_Mirror;
float _VRC_Visible_Mirror_Camera;
float _VRC_Visible_Mirror_VRCLens;
float _VRC_Visible_Mirror_Screenshot;

float _LightingMinLightBrightness;


void check_visibility()
{
    if (!_VRC_Limited_Visibility) { return; }

    if (_VRChatCameraMode == 0 || _VRChatCameraMode == -1) { // _VRChatCameraMode == -1 is looking at it in the Unity editor
        // Hirabiki's code, checking for being rendered in VRCLens
#ifndef USING_STEREO_MATRICES
        if (abs(unity_CameraProjection._m11 - 1.73205) > 0.00001 // If it's not 60.000 degree camera
            && (_ScreenParams.y / _ScreenParams.x == 0.5625 || _ScreenParams.y / _ScreenParams.x == 1.125) // And is 16:9 or 8:9 (3D)
            ) {
            if (_VRChatMirrorMode == 0) { if (!_VRC_Visible_VRCLens) { discard; } }
            else { if (!_VRC_Visible_Mirror_VRCLens) { discard; } }
        }
        else
#endif
        {
            if (_VRChatMirrorMode == 0) { if (!_VRC_Visible_Normal) { discard; } }
            else { if (!_VRC_Visible_Mirror) { discard; } }
        }
    }
    else if (_VRChatCameraMode == 1 || _VRChatCameraMode == 2) {
        if (_VRChatMirrorMode == 0) { if (!_VRC_Visible_Camera) { discard; } }
        else { if (!_VRC_Visible_Mirror_Camera) { discard; } }
    }
    else if (_VRChatCameraMode == 3) {
        if (_VRChatMirrorMode == 0) { if (!_VRC_Visible_Screenshot) { discard; } }
        else { if (!_VRC_Visible_Mirror_Screenshot) { discard; } }
    }
}

#endif // SHINGENPIZZA_PLUS_STUFF
