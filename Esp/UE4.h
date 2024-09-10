// Created by Saudgl on 3/22/23.
#define IM_PI                   3.14159265358979323846f
#define RAD2DEG( x )  ( (float)(x) * (float)(180.f / IM_PI) )
#define DEG2RAD( x ) ( (float)(x) * (float)(IM_PI / 180.f) )
#import "../SDK.hpp"
#include <array>
using namespace SDK;
 






void ClampAngles(FRotator inRot) {
    FRotator outRot = inRot;
    if (outRot.Pitch > 180)
        outRot.Pitch -= 360;
    if (outRot.Pitch < -180)
        outRot.Pitch += 360;

    if (outRot.Pitch < -75.f)
        outRot.Pitch = -75.f;
    else if (outRot.Pitch > 75.f)
        outRot.Pitch = 75.f;

    while (outRot.Yaw < -180.0f)
        outRot.Yaw += 360.0f;
    while (outRot.Yaw > 180.0f)
        outRot.Yaw -= 360.0f;
}

uint32_t Colors[] = {0x9241EB, 0x9EFF00, 0x006EF4, 0xCA2876, 0x0A31DE, 0xBAA7FD, 0xCEDB3F, 0x286A45, 0x58F014, 0x45CAE6, 0x773702, 0xB0CEF0, 0x3C5F51, 0x453CD7, 0x364024, 0x439997, 0x4CB612, 0xC6B564, 0x17F250, 0xE41BC0, 0xAF8E27, 0x8E382E, 0x47A101, 0x9DAC33, 0x66F4CF, 0x59A9F0, 0x798D1A, 0x2EBB59, 0xBF66C3, 0x4BD8FB, 0xBBFA54, 0x6B9881, 0x144967, 0xBAA3AE, 0xE80B9D, 0x7BA552, 0x96A456, 0x17D7B4, 0x130C39, 0x3C06A8, 0x62737E, 0xA87E89, 0xB6D3E4, 0x66B77D, 0x66E304, 0x1B80E1, 0x7A06BC, 0xBFFB1B, 0x618506, 0x7E4D34};



int skeletonByDistance(int distance){
    int _colorByDistance;
    if (distance < 450)
        _colorByDistance = 0xFF7600FF;
    if (distance < 100)
        _colorByDistance = 0xFFD7FF40;
    if (distance < 80)
        _colorByDistance = 0xFF0096FF;
    if (distance < 50)
        _colorByDistance = 0xFF7600FF;
    return _colorByDistance;
}
FLinearColor GetRandomColorByIndex(int index) {
    srand(index);

    float a = 255;
    float r = ((Colors[rand() % sizeof(Colors)] & 0xFF0000) >> 16);
    float g = ((Colors[rand() % sizeof(Colors)] & 0x00FF00) >> 8);
    float b = (Colors[rand() % sizeof(Colors)] & 0x0000FF);

    return {r / 255, g / 255, b / 255, a / 255};
}
uint32_t ColorsBack[] =
		{
				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800,

				0x818181,
				0x0096FF,
				0xE91E63,
				0xFF00E1,
				0xAB00FF,
				0x6100FF,
				0x0051FF,
				0x00BCFF,
				0x00E4FF,
				0x00FFAE,
				0x00FF79,
				0x00FF31,
				0x8FFF00,
				0xE2FF00,
				0xE2FF00,
				0xFFC900,
				0xFF8000,
				0xB00082,
				0xA700B0,
				0x7600B0,
				0x4100B0,
				0x003EB0,
				0x0074B0,
				0x009BB0,
				0x00B07B,
				0x00B019,
				0x51B000,
				0x98B000,
				0xB08B00,
				0xB05800

		};