#pragma once
#include "IMGUI/imgui.h"
#include "IMGUI/imgui_internal.h"

#include "Esp/include/alacrium_logo_font.hpp"
#include "Esp/include/fonts.hpp"
#include "Esp/include/hashes.hpp"

#include "Esp/custom/helpers.hpp"
#include "Esp/custom/ryukoutils.hpp"
#include "Esp/custom/elems.hpp"

//#include "../blur/blur.hpp"
#include "Esp/Memory.hpp"
//#include <windows.h>
#include <random>

struct tab {
    const char* name;
    const char* icon;
    animation_vec4 text_color, bg_color = {};
};

namespace ui {
    inline int selected_tab = 0;
    inline std::vector<tab> tabs {
        { ("Visual"), ICON_FA_EYE },
        { ("Aim Assistance"), ICON_FA_SHIELD },
        { ("Memory"), ICON_FA_SYRINGE },
        { ("Config"), ICON_FA_COG },
    };
    inline tab selected_tab_struct = tabs[0];

    inline animation_vec2 tabs_rect;
    inline animation alpha;
    inline animation alpha_2;

    inline ImFont* alacrium_logo;
    inline ImFont* font_primary;
    inline ImFont* font_primary_bold;
    inline ImFont* font_icons;
    inline ImFont* font_icons_big;
    inline ImFont* font_primary_big;

    inline ImVec2 menu_size = { 600, 500 };

    inline ui_helpers helpers;

    inline bool menu_opened;

    extern void watermark();
    extern void draw();
    extern void init();
}
extern bool MenDeal;
// namespace keybinds {
//     extern void draw(bool is_menu_open);
//     extern void handle(std::string name, int& key, bool& value, bool hold); //todo
// }



// extern bool InstantHit;
// extern bool Norecoil;
// extern bool rapidfire;
// extern bool magicpidor;
// extern bool animbreak;
// extern bool XHIT666;
// extern bool AirControl666;
// extern bool SpeedKnock;
// extern bool WeaponScale;
// extern bool crazycar;
// extern bool WideView;
// extern int WideValue;
// extern bool Rain;
// extern bool Snow;
// extern bool Blizzard;
// extern float jitterInterval;
// extern   bool isEnabled;           
// extern  bool isStatic;            
// extern  bool isJitter;            
// extern   bool isSpin;              

// extern   float staticYawOffset;
// extern   float staticPitchOffset;

// extern   float jitterYawOffset1;
// extern   float jitterYawOffset2;
// extern   float jitterPitchOffset1;
// extern  float jitterPitchOffset2;

// extern float spinYawOffset;
// extern float spinPitchOffset;

//   extern int combo_rn555;

// extern bool DamageFix;
// extern float hit_size;
//         extern bool EspLine;
//         extern int totalEnemiesAndBots;                    
// extern bool EspSkeleton;
// extern bool EspHealth;
