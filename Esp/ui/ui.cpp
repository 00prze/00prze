#include "Esp/ui/ui.hpp"
//#include "Esp/booleans.h"

#include "Esp/include/bytes.hpp"
//#include <examples/example_win32_directx11/include/keys_array.h>

#define xor_str(data) data
//define just in case
//for me it'll be easier to move into my hack
//you can remove or rebind it

void ui::init() {
  
    auto& io = ImGui::GetIO();

    auto& style = ImGui::GetStyle();
    style.Alpha = 1.0f;
    ImFontConfig font_cfg;
    font_cfg.FontDataOwnedByAtlas = false;
    ImFontConfig main_config;
    main_config.SizePixels = 18.f;

    font_primary = io.Fonts->AddFontFromMemoryTTF(kanit_400, kanit_400_size, 4.5f * 4, &main_config, io.Fonts->GetGlyphRangesCyrillic());
    
    ImFontConfig icons_config;
    icons_config.MergeMode = true;
    icons_config.SizePixels = 14.f;
    static const ImWchar icon_ranges[] = { ICON_MIN_FA, ICON_MAX_FA, 0x0 };

    font_icons = io.Fonts->AddFontFromMemoryTTF(font_awesome_binary, sizeof font_awesome_binary, 3.25f * 4, &icons_config, icon_ranges);

    font_primary_big = io.Fonts->AddFontFromMemoryTTF(kanit_400, kanit_400_size, 7.5f * 4, &main_config, io.Fonts->GetGlyphRangesCyrillic());
    font_icons_big = io.Fonts->AddFontFromMemoryTTF(font_awesome_binary, sizeof font_awesome_binary, 29, &icons_config, icon_ranges);

    font_primary_bold = io.Fonts->AddFontFromMemoryTTF(kanit_700, kanit_700_size, 18.f, &main_config, io.Fonts->GetGlyphRangesCyrillic());

    alacrium_logo = io.Fonts->AddFontFromMemoryTTF(alacrium_logo_font, alacrium_logo_font_size, 30, &main_config);


    style.ItemInnerSpacing = { 12, style.ItemInnerSpacing.y };
    style.ItemSpacing = { style.ItemSpacing.x, 12 };

    style.WindowRounding = 14;
    style.PopupRounding = 6;
    style.FrameRounding = 4;
    style.ScrollbarSize = 12;
    style.ScrollbarRounding = 2;
    style.GrabMinSize = 16;

    style.Colors[ImGuiCol_Border] = ImColor(24, 24, 24).Value;
    style.Colors[ImGuiCol_ScrollbarGrab] = helpers.get_accent_imvec4(1, 0.5f);
    style.Colors[ImGuiCol_ScrollbarGrabActive] = helpers.get_accent_imvec4(1, 0.5f);
    style.Colors[ImGuiCol_ScrollbarGrabHovered] = helpers.get_accent_imvec4(1, 0.5f);
    style.Colors[ImGuiCol_ScrollbarBg] = ImColor(24, 24, 24).Value;
    style.Colors[ImGuiCol_PopupBg] = ImColor(24, 24, 24).Value;
}

void radial_gradient_internal(ImDrawList* draw_list, const ImVec2& center, float radius, ImU32 col_in, ImU32 col_out)
{
    if (((col_in | col_out) & IM_COL32_A_MASK) == 0 || radius < 0.5f)
        return;

    draw_list->_PathArcToFastEx(center, radius, 0, IM_DRAWLIST_ARCFAST_SAMPLE_MAX, 0);
    const int count = draw_list->_Path.Size - 1;

    unsigned int vtx_base = draw_list->_VtxCurrentIdx;
    draw_list->PrimReserve(count * 3, count + 1);

    const ImVec2 uv = draw_list->_Data->TexUvWhitePixel;
    draw_list->PrimWriteVtx(center, uv, col_in);
    for (int n = 0; n < count; n++)
        draw_list->PrimWriteVtx(draw_list->_Path[n], uv, col_out);

    for (int n = 0; n < count; n++)
    {
        draw_list->PrimWriteIdx((ImDrawIdx)(vtx_base));
        draw_list->PrimWriteIdx((ImDrawIdx)(vtx_base + 1 + n));
        draw_list->PrimWriteIdx((ImDrawIdx)(vtx_base + 1 + ((n + 1) % count)));
    }
    draw_list->_Path.Size = 0;
}

ImColor c_a(ImColor i) {
    return (i.Value.x, i.Value.y, i.Value.z, i.Value.w * ImGui::GetStyle().Alpha);
}

ImColor c_a(int r, int g, int b, int a = 255) {
    return { r, g, b, static_cast<int>(a * ImGui::GetStyle().Alpha) };
}

float RandomFloat(float min, float max) {
    static std::random_device rd;
    static std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(min, max);
    return dis(gen);
}

struct Particle {
    ImVec2 position;
    ImVec2 velocity;
    ImVec4 color;
    float size;
    animation alpha;
    float speedFactor;
    bool done = false;
};

std::vector<Particle> particles;

void fx() {
    for (int i = 0; i < 5; i++) {
        if (i != 4) continue;
        Particle newParticle;
        newParticle.position = ImVec2(RandomFloat(20, ImGui::GetWindowSize().x - 20), RandomFloat(20, ImGui::GetWindowSize().y - 20));
        newParticle.velocity = ImVec2(RandomFloat(-2, 2), RandomFloat(-2, 2));
        newParticle.color = ui::helpers.get_accent_imvec4();
        newParticle.size = RandomFloat(1, 4);
        newParticle.speedFactor = RandomFloat(0.4f, 0.6f);
        particles.push_back(newParticle);
    }

    for (int it = 0; it < particles.size(); it++) {
        auto& particle = particles[it];

        particle.position += particle.velocity * particle.speedFactor;

        if (!particle.done)
            particle.alpha.update(1, 0.15f);

        if (particle.alpha.value >= 0.8f)
            particle.done = true;

        if (particle.done)
            particle.alpha.update(0, 0.15f);

        if (particle.alpha.value < 0.001f) {
            particles.erase(particles.begin() + it);
            continue;
        }

        ImVec2 p0 = ImVec2(particle.position.x - particle.size, particle.position.y + particle.size);
        ImVec2 p1 = ImVec2(particle.position.x, particle.position.y - particle.size);
        ImVec2 p2 = ImVec2(particle.position.x + particle.size, particle.position.y + particle.size);

        ImDrawList* draw_list = ImGui::GetWindowDrawList();
        draw_list->AddTriangleFilled(ImGui::GetWindowPos() + p0, ImGui::GetWindowPos() + p1, ImGui::GetWindowPos() + p2, ImColor(particle.color.x, particle.color.y, particle.color.z, particle.alpha.value * ImGui::GetStyle().Alpha));
    }
}

//#define AUTH

void ui::draw() {
    using namespace ImGui;

#ifndef AUTH

    SetNextWindowSize(menu_size);


      

    if (MenDeal)
        alpha.update(1);
    else
        alpha.update(0);

    PushStyleVar(ImGuiStyleVar_Alpha, alpha.value);
    PushStyleVar(ImGuiStyleVar_WindowPadding, { 0, 0 });
    PushStyleColor(ImGuiCol_WindowBg, ImColor(helpers.get_accent_imcolor(GetStyle().Alpha, 0.07f)).Value);

    if (alpha.value > 0.001f) {
        Begin(xor_str ("cheat status : ud"), nullptr, ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoScrollbar);

        {
            const auto& window = GetCurrentWindow();

            static animation multiplier;
            static int rand_num = rand() % -100 + 100;
            multiplier.update(rand_num);
            if (multiplier.value == rand_num)
                rand_num = rand() % -100 + 100;

            ImRect win_bb(
                ImVec2(window->Pos),
                ImVec2(window->Pos + window->Size)
            );

            window->DrawList->AddRectFilled(win_bb.Max - ImVec2(20, win_bb.GetHeight()), win_bb.Max, helpers.get_accent_imcolor(GetStyle().Alpha, 0.1f), GetStyle().WindowRounding, ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight);
            window->DrawList->AddRectFilledMultiColor(win_bb.Min, win_bb.Max - ImVec2(20, 0), helpers.get_accent_imcolor(0, 0.01f), helpers.get_accent_imcolor(GetStyle().Alpha, 0.1f), helpers.get_accent_imcolor(GetStyle().Alpha, 0.1f), helpers.get_accent_imcolor(0, 0.01f));

            window->DrawList->AddRectFilled(win_bb.Max - ImVec2(20, win_bb.GetHeight()), win_bb.Max, c_a(24, 24, 24, 50), GetStyle().WindowRounding, ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight);
            window->DrawList->AddRectFilledMultiColor(win_bb.Min, win_bb.Max - ImVec2(20, 0), c_a(24, 24, 24, 0), c_a(24, 24, 24, 50), c_a(24, 24, 24, 50), c_a(24, 24, 24, 0));

            fx();

            window->DrawList->AddRectFilled(win_bb.Min, win_bb.Min + ImVec2(20, win_bb.GetHeight()), helpers.get_accent_imcolor(GetStyle().Alpha, 0.15f), GetStyle().WindowRounding, ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersTopLeft);
            window->DrawList->AddRectFilledMultiColor(win_bb.Min + ImVec2(20, 0), win_bb.Max, helpers.get_accent_imcolor(GetStyle().Alpha, 0.15f), helpers.get_accent_imcolor(0, 0.1f), helpers.get_accent_imcolor(0, 0.1f), helpers.get_accent_imcolor(GetStyle().Alpha, 0.15f));

            radial_gradient_internal(window->DrawList, win_bb.Max - ImVec2(-100, win_bb.GetHeight() / 2 - multiplier.value), 300, helpers.get_accent_imcolor(GetStyle().Alpha * 0.2f, 1.f), helpers.get_accent_imcolor(0, 1.f));
        }

        static const auto& tabs_predecl_size = ImVec2(80, 80);

        SetCursorPos({ 0, 0 });
        //poneslas...

        BeginChild(xor_str ("tabs"), { tabs_predecl_size.x, GetContentRegionAvail().y }, false, ImGuiWindowFlags_NoScrollbar); {
            const auto& window = GetCurrentWindow();

            ImRect rect_bb(
                ImVec2(window->Pos + tabs_rect.value),
                ImVec2(window->Pos + tabs_rect.value + tabs_predecl_size)
            );

            window->DrawList->AddRectFilled(rect_bb.Min + ImVec2(15, 15), rect_bb.Max - ImVec2(15, 15), helpers.get_accent_imcolor(GetStyle().Alpha * 0.5f, 0.1f), GetStyle().WindowRounding / 2);

            for (int it = 0; it < tabs.size(); it++) {
                auto& tab = tabs[it];

                if (selected_tab == it)
                    tabs_rect.update(GetCursorPos());

                const auto& cur = GetCursorScreenPos();
                const auto& icon_size = CalcTextSize(tab.icon);

                ImRect tab_bb(
                    ImVec2(cur),
                    ImVec2(cur + tabs_predecl_size)
                );

                if (InvisibleButton(tab.icon, tabs_predecl_size)) {
                    selected_tab_struct = tab;
                    selected_tab = it;

                    alpha_2.value = 0;
                }

                tab.bg_color.interpolate(helpers.get_accent_imvec4(GetStyle().Alpha), helpers.get_accent_imvec4(0), (selected_tab == it));
                tab.text_color.interpolate(helpers.get_accent_imvec4(GetStyle().Alpha), c_a(100, 100, 100, 255).Value, (selected_tab == it));

                window->DrawList->AddRectFilled(ImVec2(tab_bb.Min.x, tab_bb.Min.y) + ImVec2(0, 20), ImVec2(tab_bb.Min.x + 3, tab_bb.Max.y) - ImVec2(0, 20), ImColor(tab.bg_color.value), 2);
                window->DrawList->AddText(tab_bb.GetCenter() - icon_size / 2, ImColor(tab.text_color.value), tab.icon);

                SetCursorPosY(GetCursorPosY() - 16);
            }

            // --- //

            EndChild();
        }

        {
            const auto& window = GetCurrentWindow();

            ImRect win_bb(
                ImVec2(window->Pos),
                ImVec2(window->Pos + window->Size)
            );

            window->DrawList->AddRectFilled(win_bb.Max - ImVec2(20, win_bb.GetHeight()), win_bb.Max, c_a(0, 0, 0, 50), GetStyle().WindowRounding, ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight);
            window->DrawList->AddRectFilledMultiColor(win_bb.Min, win_bb.Max - ImVec2(20, 0), c_a(0, 0, 0, 10), c_a(0, 0, 0, 50), c_a(0, 0, 0, 50), c_a(0, 0, 0, 10));
        }

        SetCursorPos({ tabs_predecl_size.x, 0 });

        alpha_2.update(1, 0.2f);
        PushStyleVar(ImGuiStyleVar_Alpha, alpha_2.value * alpha.value);

        BeginChild(xor_str ("##premain"), GetContentRegionAvail(), false, ImGuiWindowFlags_NoScrollbar); {
            BeginChild(xor_str ("##submain"), { GetContentRegionAvail().x, 55 }, false, ImGuiWindowFlags_NoScrollbar); {
                const auto& icon_size = CalcTextSize(selected_tab_struct.icon);
                const auto& label_size = CalcTextSize(selected_tab_struct.name);

                SetCursorPos({ 8, (79 * alpha_2.value) / 2 - icon_size.y / 2 });

                TextColored(helpers.get_accent_imvec4(), selected_tab_struct.icon);

                SetCursorPos({ 8 + icon_size.x + 8, (79 * alpha_2.value) / 2 - label_size.y / 2 });

                TextColored(ImColor(100, 100, 100).Value, selected_tab_struct.name);

                // --- //

                EndChild();
            }

            {
                    if (selected_tab == 0) {
                        const ImVec2& offset = { 14, 14 + (100 * (1.0f - alpha_2.value)) };

                        const auto& width = GetContentRegionAvail().x / 2;

                        const auto& y = GetCursorPosY() + offset.y;
                        SetCursorPosY(y);

                        using namespace elems;

                        helpers.custom_child(xor_str ("ESP"), { width - offset.x, GetContentRegionAvail().y - offset.y }); {

                            static ImVec4 col;
                            //color_picker(xor_str ("color"), col);
                            /*static int key;
                            keybind(xor_str ("keybind"), &key);*/
                            static bool niggersex;
                            checkbox("Line", &GlobalConfig.ESPMenu.Line);
                            checkbox("Skeleton", &GlobalConfig.ESPMenu.Skeleton);
                            checkbox("Name", &GlobalConfig.ESPMenu.Name);
                            checkbox("Health", &GlobalConfig.ESPMenu.Health);
                            checkbox("Box", &GlobalConfig.ESPMenu.Box);
                            checkbox("Match Info", &niggersex);
                            checkbox("Weapon", &niggersex);

                            static int int_slider_example;
                            slider_int("Distance", &int_slider_example, 0, 500);


                            helpers.end_child();
                        }

                        SetCursorPos({ width, y });

                        helpers.custom_child(xor_str ("World"), { width - offset.x, GetContentRegionAvail().y - offset.y }); {

                            static ImVec4 col;
                            static bool niggersex;

                            checkbox("Nigger", &niggersex);
                           /* ImGui::SameLine(0.f, 30.f);
                            color_picker(xor_str (" "), col);*/
                          
                            static const char* items[] = { "None", "Rain", "Snow", "Blizzard" };
                            static int combo_rn = 0;
                            combo("Weather", &combo_rn, items, IM_ARRAYSIZE(items), -1);

                            // Boolean flags for different weather conditions
                            
                            // Check the selected weather and set the booleans accordingly
                            if (combo_rn == 0) // None
                            {
                                g_Memory.Rain = false;
                                g_Memory.Snow = false;
                                g_Memory.Blizzard = false;
                            }
                            else if (combo_rn == 1) // Rain
                            {
                                g_Memory.Rain = true;
                                g_Memory.Snow = false;
                                g_Memory.Blizzard = false;
                            }
                            else if (combo_rn == 2) // Snow
                            {
                                g_Memory.Rain = false;
                                g_Memory.Snow = true;
                                g_Memory.Blizzard = false;
                            }
                            else if (combo_rn == 3) // Blizzard
                            {
                                g_Memory.Rain = false;
                                g_Memory.Snow = false;
                                g_Memory.Blizzard = true;
                            }

                            // Debug output (optional)


                            static char buf[50];


                            helpers.end_child();
                        }

                    }
                    if (selected_tab == 1) {
                        const ImVec2& offset = { 14, 14 + (100 * (1.0f - alpha_2.value)) };

                        const auto& width = GetContentRegionAvail().x / 2;

                        const auto& y = GetCursorPosY() + offset.y;
                        SetCursorPosY(y);

                        using namespace elems;

                        helpers.custom_child(xor_str ("Aimbot"), { width - offset.x, GetContentRegionAvail().y - offset.y }); {

                            static ImVec4 col;
                            //color_picker(xor_str ("color"), col);
                            /*static int key;
                            keybind(xor_str ("keybind"), &key);*/
                            static bool niggersex;
                            checkbox("Enable", &niggersex);
                            checkbox("Draw FOV", &niggersex);
                            checkbox("Ignore Knocked", &niggersex);
                            checkbox("Ignore Ai", &niggersex);
                            checkbox("Visibility Check", &niggersex);
                            static const char* items[] = { "Auto", "Head", "Body"};
                            static int combo_rn = 0;
                            combo("Bone", &combo_rn, items, IM_ARRAYSIZE(items), -1);

                            static int int_slider_example;
                            slider_int("Field Of View", &int_slider_example, 0, 360);
                            static int int_slider_example1;
                            slider_int("Disrance", &int_slider_example1, 0, 500);

                            helpers.end_child();
                        }

                        SetCursorPos({ width, y });

                        helpers.custom_child(xor_str ("Silent Aim"), { width - offset.x, GetContentRegionAvail().y - offset.y }); {

                            static ImVec4 col;
                            //color_picker(xor_str ("color"), col);
                            /*static int key;
                            keybind(xor_str ("keybind"), &key);*/
                            static bool niggersex;
                            checkbox("Enable", &preferences.Config.SilentAim.Enable);
                              slider_float("Cross Yaw", &g_Memory.CurRotYaw, -360, 360);
                                slider_float("Cross Pitch", &g_Memory.CurRotPitch, -360, 360);
                                slider_float("Cross Roll", &g_Memory.CurRotRoll, -360, 360);

                            checkbox("Draw FOV", &niggersex);
                            checkbox("Ignore Knocked", &preferences.Config.SilentAim.IgnoreKnocked);
                            checkbox("Ignore Ai", &preferences.Config.SilentAim.IgnoreBot);
                            checkbox("Visibility Check", &preferences.Config.SilentAim.VisCheck);
                            checkbox("Trigger Bot", &g_Memory.triggerbot);
                            static const char* items[] = { "Auto", "Head", "Body" };
                            static int combo_rn = 0;
                            combo("Bone", &combo_rn, items, IM_ARRAYSIZE(items), -1);

                            static int int_slider_example;
                            slider_int("Field Of View", &preferences.Config.SilentAim.Cross, 0, 720);
                            static int int_slider_example1 = 500;
                            slider_float("Distance", &g_Memory.g_disstance, 0.f, 500.f);

                            helpers.end_child();
                        }

                    }
                    if (selected_tab == 2) {
                        const ImVec2& offset = { 14, 14 + (100 * (1.0f - alpha_2.value)) };

                        const auto& width = GetContentRegionAvail().x / 2;

                        const auto& y = GetCursorPosY() + offset.y;
                        SetCursorPosY(y);

                        using namespace elems;

                        helpers.custom_child(xor_str("Exploits"), { width - offset.x, GetContentRegionAvail().y - offset.y }); {

                            static ImVec4 col;

                            
                            checkbox("Instant Hit", &g_Memory.InstantHit);
                            checkbox("No Recoil", &g_Memory.Norecoil);
                            checkbox("Rapid Fire", &g_Memory.rapidfire);
                            checkbox("Speed Knock", &g_Memory.SpeedKnock);
                            checkbox("Bigger Hitboxes", &g_Memory.magicpidor);
                            checkbox("Animation Breaker", &g_Memory.animbreak);
                            checkbox("Custom Hitmarker", &g_Memory.XHIT666);
                            checkbox(" zhuiluo", &g_Memory.zhuiluo);
                            checkbox("Air Strafer", &g_Memory.AirControl666);
                            checkbox("Fix Damage", &g_Memory.Blacksky);
                            checkbox("Weapon Scale", &g_Memory.WeaponScale);
                                if (g_Memory.WeaponScale)
                            {   
                                Text("Scale");

                                slider_float("Weapon Scale X", &g_Memory.WeaponScaleChangerX, -20, 20);
                                slider_float("Weapon Scale Y", &g_Memory.WeaponScaleChangerY, -20, 20);
                                slider_float("Weapon Scale Z", &g_Memory.WeaponScaleChangerZ, -20, 20);  

                                Text("Location");

                                slider_float("Weapon Location X", &g_Memory.WeaponRelativeLocX, -100, 100);
                                slider_float("Weapon Location Y", &g_Memory.WeaponRelativeLocY, -100, 100);
                                slider_float("Weapon Location Z", &g_Memory.WeaponRelativeLocZ, -100, 100);   

                                Text("Rotation");

                                slider_float("Weapon Rotation X", &g_Memory.WeaponRelativeRotX, 0, 360);
                                slider_float("Weapon Rotation Y", &g_Memory.WeaponRelativeRotY, 0, 360);
                                slider_float("Weapon Rotation Z", &g_Memory.WeaponRelativeRotZ, 0, 360);

                            }
                            checkbox("No Gravity For Cars", &g_Memory.crazycar);
                            checkbox("Pitch Down", &g_Memory.DamageFix);
                            static bool pedik;
                            checkbox("Wide View", &g_Memory.WideView);
                                if (g_Memory.WideView)
                            { 
                                slider_int("Field Of View ", &g_Memory.WideValue, 90, 180);
                            }

                            helpers.end_child();
                        }

                        SetCursorPos({ width, y });

                        helpers.custom_child(xor_str("Anti Aim"), { width - offset.x, GetContentRegionAvail().y - offset.y }); {

                            static ImVec4 col;
                            checkbox("Enable", &g_Memory.isEnabled);

                            static const char* items[] = { "None", "Static", "Jitter", "Spin" };
                            
                            combo("Type", &g_Memory.combo_rn555, items, IM_ARRAYSIZE(items), -1);

                            switch (g_Memory.combo_rn555)
{
    case 0:
        g_Memory.isStatic = false;
        g_Memory.isJitter = false;
        g_Memory.isSpin = false;
        break;
    case 1: // Static
        g_Memory.isStatic = true;
        g_Memory.isJitter = false;
        g_Memory.isSpin = false;
        Text("Yaw");
        slider_float("Yaw Offset", &g_Memory.staticYawOffset, 0, 360);
        Text("Pitch");
        slider_float("Pitch Offset", &g_Memory.staticPitchOffset, -180, 180);
        break;
    case 2: // Jitter
        g_Memory.isStatic = false;
        g_Memory.isJitter = true;
        g_Memory.isSpin = false;
       // slider_float("Jitter Interval", &jitterInterval, 0.001f, 1.f);
        Text("Yaw");
        slider_float("Yaw Offset - 1", &g_Memory.jitterYawOffset1, 0, 360);
        slider_float("Yaw Offset - 2", &g_Memory.jitterYawOffset2, 0, 360);
        Text("Pitch");
        slider_float("Pitch Offset - 1", &g_Memory.jitterPitchOffset1, -180, 180);
        slider_float("Pitch Offset - 2", &g_Memory.jitterPitchOffset2, -180, 180);
        break;
    case 3: // Spin
        g_Memory.isStatic = false;
        g_Memory.isJitter = false;
        g_Memory.isSpin = true;
        slider_float("Yaw Offset", &g_Memory.spinYawOffset, 0, 360);
        slider_float("Pitch Offset", &g_Memory.spinPitchOffset, 0, 360);
        break;
}

                            helpers.end_child();
                        }

                    }
            }

            // --- //

            EndChild();
        }

        PopStyleVar();

        // --- //

        End();
    }

    PopStyleVar(2);
    PopStyleColor();
#else

    const ImVec2& auth_size = {400, 300};

    SetNextWindowSize(menu_size);


        menu_opened = !menu_opened;

    if (menu_opened)
        alpha.update(1);
    else
        alpha.update(0);

    PushStyleVar(ImGuiStyleVar_Alpha, alpha.value);
    PushStyleVar(ImGuiStyleVar_WindowPadding, { 0, 0 });
    PushStyleColor(ImGuiCol_WindowBg, ImColor(helpers.get_accent_imcolor(GetStyle().Alpha, 0.07f)).Value);

    if (alpha.value > 0.001f) {
        Begin(xor_str ("t.me/imguiseller | best menus"), nullptr, ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoScrollbar);

        {
            const auto& window = GetCurrentWindow();

            static animation multiplier;
            static int rand_num = rand() % -100 + 100;
            multiplier.update(rand_num);
            if (multiplier.value == rand_num)
                rand_num = rand() % -100 + 100;

            ImRect win_bb(
                ImVec2(window->Pos),
                ImVec2(window->Pos + window->Size)
            );

            window->DrawList->AddRectFilled(win_bb.Max - ImVec2(20, win_bb.GetHeight()), win_bb.Max, helpers.get_accent_imcolor(GetStyle().Alpha, 0.1f), GetStyle().WindowRounding, ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight);
            window->DrawList->AddRectFilledMultiColor(win_bb.Min, win_bb.Max - ImVec2(20, 0), helpers.get_accent_imcolor(0, 0.01f), helpers.get_accent_imcolor(GetStyle().Alpha, 0.1f), helpers.get_accent_imcolor(GetStyle().Alpha, 0.1f), helpers.get_accent_imcolor(0, 0.01f));

            window->DrawList->AddRectFilled(win_bb.Max - ImVec2(20, win_bb.GetHeight()), win_bb.Max, c_a(24, 24, 24, 50), GetStyle().WindowRounding, ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight);
            window->DrawList->AddRectFilledMultiColor(win_bb.Min, win_bb.Max - ImVec2(20, 0), c_a(24, 24, 24, 0), c_a(24, 24, 24, 50), c_a(24, 24, 24, 50), c_a(24, 24, 24, 0));

            fx();

            window->DrawList->AddRectFilled(win_bb.Min, win_bb.Min + ImVec2(20, win_bb.GetHeight()), helpers.get_accent_imcolor(GetStyle().Alpha, 0.15f), GetStyle().WindowRounding, ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersTopLeft);
            window->DrawList->AddRectFilledMultiColor(win_bb.Min + ImVec2(20, 0), win_bb.Max, helpers.get_accent_imcolor(GetStyle().Alpha, 0.15f), helpers.get_accent_imcolor(0, 0.1f), helpers.get_accent_imcolor(0, 0.1f), helpers.get_accent_imcolor(GetStyle().Alpha, 0.15f));

            radial_gradient_internal(window->DrawList, win_bb.Max - ImVec2(-100, win_bb.GetHeight() / 2 - multiplier.value), 300, helpers.get_accent_imcolor(GetStyle().Alpha * 0.2f, 1.f), helpers.get_accent_imcolor(0, 1.f));
        }

        {
            const auto& window = GetCurrentWindow();

            ImRect win_bb(
                ImVec2(window->Pos),
                ImVec2(window->Pos + window->Size)
            );

            window->DrawList->AddRectFilled(win_bb.Max - ImVec2(20, win_bb.GetHeight()), win_bb.Max, c_a(0, 0, 0, 50), GetStyle().WindowRounding, ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight);
            window->DrawList->AddRectFilledMultiColor(win_bb.Min, win_bb.Max - ImVec2(20, 0), c_a(0, 0, 0, 10), c_a(0, 0, 0, 50), c_a(0, 0, 0, 50), c_a(0, 0, 0, 10));
        }

        SetCursorPos({ 0, 0 });
        BeginChild(xor_str ("what ama doin bruthaano oo"), GetContentRegionAvail(), false); {
            PushFont(ui::alacrium_logo);

            const auto& logo_size = CalcTextSize(xor_str ("A"));
            SetCursorPos({ GetWindowSize().x / 2 - logo_size.x / 2, 140 / 2 - logo_size.y / 2});
            TextColored(helpers.get_accent_imvec4(), xor_str ("A"));

            PopFont();

            const auto& center = GetWindowSize() / 2;

            const ImVec2& next_child_size = {GetWindowSize().x / 3, 175};

            SetCursorPos({center.x - next_child_size.x / 2, center.y - next_child_size.y / 2 + 40});
            BeginChild(xor_str ("subchild"), next_child_size, false); {
                static char buf[50];

                elems::input_text(xor_str ("Key"), buf, IM_ARRAYSIZE(buf));
                elems::button(xor_str ("Login"));
                elems::alternative_button(xor_str ("Buy key"));
                TextColored(ImColor(100, 100, 100).Value, xor_str ("Your data is "));
                SameLine(0, 0);
                TextColored(helpers.get_accent_imvec4(), xor_str ("not shared"));

                EndChild();
            }

            // --- //

            EndChild();
        }

        // --- //

        End();
    }

    PopStyleVar(2);
    PopStyleColor();
#endif
}

void ui::watermark() {
    const ImVec2& screen_offset = { 20, 20 };
    const ImVec2& text_offset = { 8, 8 };
std::string gomo = (g_Memory.vis666) ? "visible" : "invisible";
std::string loli = std::to_string(g_Memory.ass) ;
    std::string str_pl = "Enemies : " + std::to_string(g_Memory.totalEnemiesAndBots) ;

    const auto& username = std::string(str_pl);
    const auto& hack_name = std::string("aw");
    const auto& hack_icon = std::string(ICON_FA_GLOBE);

    const auto& username_size = ImGui::CalcTextSize(username.c_str());
    const auto& hack_name_size = ImGui::CalcTextSize(hack_name.c_str());
    const auto& hack_icon_size = ImGui::CalcTextSize(hack_icon.c_str());

    const auto& draw = ImGui::GetBackgroundDrawList();

    const ImRect full_wm_bb(
        ImVec2(screen_offset),
        ImVec2(screen_offset + ImVec2(username_size.x + hack_name_size.x + hack_icon_size.x + text_offset.x * 4, username_size.y + text_offset.y) + text_offset)
    );

    draw->PushClipRect(full_wm_bb.Min, full_wm_bb.Max);
    //draw_blur(draw);
    draw->PopClipRect();

    draw->AddRectFilled(full_wm_bb.Min, full_wm_bb.Max, helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 0.15f), ImGui::GetStyle().WindowRounding / 4);
    draw->AddRect(full_wm_bb.Min, full_wm_bb.Max, helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 0.2f), ImGui::GetStyle().WindowRounding / 4);

    draw->AddText(full_wm_bb.Min + text_offset, helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 1.f), hack_icon.c_str());
    draw->AddText(full_wm_bb.Min + text_offset + ImVec2(hack_icon_size.x + text_offset.x, -1), ImColor(255, 255, 255), hack_name.c_str());

    draw->AddRectFilled(full_wm_bb.Min + ImVec2(hack_icon_size.x + text_offset.x + hack_name_size.x + text_offset.x + text_offset.x, 0), full_wm_bb.Max, helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 0.2f), ImGui::GetStyle().WindowRounding / 4);
    draw->AddRect(full_wm_bb.Min + ImVec2(hack_icon_size.x + text_offset.x + hack_name_size.x + text_offset.x + text_offset.x, 0), full_wm_bb.Max, helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 0.25f), ImGui::GetStyle().WindowRounding / 4);
    draw->AddRect(full_wm_bb.Min + ImVec2(hack_icon_size.x + text_offset.x + hack_name_size.x + text_offset.x + text_offset.x, 0) + ImVec2(2, 2), full_wm_bb.Max - ImVec2(2, 2), helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 0.3f), ImGui::GetStyle().WindowRounding / 4);

    draw->AddText(full_wm_bb.Min + text_offset + ImVec2(hack_icon_size.x + text_offset.x + hack_name_size.x + text_offset.x + text_offset.x, -1), ImColor(255, 255, 255), username.c_str());
}

// namespace keybinds {
//     struct bind {
//         std::string name;
//         std::string key;
//         bool hold = false;
//         bool erased = false;
//         animation anim = {};
//         animation_vec2 anim_vec2 = {};
//     };
//     std::vector<bind> vec;

//     bind find(std::string s1, std::string s2) {
//         for (int i = 0; i < vec.size(); i++) {
//             if (vec[i].name == s1 && vec[i].key == s2)
//                 return vec[i];
//         }
//         return { xor_str("null"), xor_str ("null") };
//     }

//     void handle(std::string name, int key, bool& value, bool hold) {
//         if (hold) {
//             if (GetAsyncKeyState(key))
//                 value = true;
//             else
//                 value = false;
//         }
//         else {
//             if (GetAsyncKeyState(key) & 1)
//                 value = !value;
//         }

//         auto struc = find(name, KeyNames[key]);
//         if (value && struc.name == xor_str ("null")) {
//             if (key != 0)
//                 vec.push_back({ name, KeyNames[key], hold });
//         }
//         else if (!value && struc.name != xor_str ("null")) {
//             for (int i = 0; i < vec.size(); i++) {
//                 if (vec[i].name == struc.name)
//                     vec[i].erased = true;
//                     //vec.erase(vec.begin() + i);
//             }
//         }
//     }

//     void decorations(ImDrawList* draw) {
//         using namespace ImGui;

//         ImRect bb(
//             GetWindowPos(),
//             GetWindowPos() + ImVec2(150, 16 + GetFontSize())
//         );

//         draw->AddRectFilled(bb.Min, bb.Max, ui::helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 0.15f), ImGui::GetStyle().WindowRounding);
//         draw->AddRect(bb.Min, bb.Max, ui::helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 0.2f), ImGui::GetStyle().WindowRounding);

//         draw->AddText(bb.Min + ImVec2(8, 8), ui::helpers.get_accent_imcolor(ImGui::GetStyle().Alpha, 1.f), xor_str(ICON_FA_ARROW_TO_RIGHT));
//         draw->AddText(bb.Min + ImVec2(16 + CalcTextSize(ICON_FA_ARROW_TO_RIGHT).x, 8 - 1), ImColor(255, 255, 255), xor_str ("Keybinds"));
//     }

//     // void binds_list(ImDrawList* draw) {
//     //     using namespace ImGui;

//     //     const auto& window = GetCurrentWindow();

//     //     static const ImVec2& offset = { 10, 8 };
//     //     const ImVec2& begin = { window->Pos.x, window->Pos.y + (20 + GetFontSize()) };

//     //     for (int it = 0; it < vec.size(); it++) {
//     //         const auto& label_size = ImGui::CalcTextSize(vec[it].name.c_str());

//     //         if (vec[it].erased && vec[it].anim.value <= 0.005f) {
//     //             vec.erase(vec.begin() + it);
//     //             return;
//     //         }

//     //         if (vec[it].erased)
//     //             vec[it].anim.update(0);
//     //         else
//     //             vec[it].anim.update(1);

//     //         if (!vec[it].erased)
//     //             vec[it].anim_vec2.update({ begin.x, begin.x + offset.x * 2 + 150 - offset.x * 2 });
//     //         else
//     //             vec[it].anim_vec2.update({ 0, 0});

//     //         ImRect bind_rect_bb(
//     //             ImVec2(vec[it].anim_vec2.value.x, begin.y + ((ImGui::GetFontSize() + offset.y * 2) * it)),
//     //             ImVec2(vec[it].anim_vec2.value.y, begin.y + ((ImGui::GetFontSize() + offset.y * 2) * it) + label_size.y + offset.y * 2)
//     //         );

//     //         draw->AddRectFilled(bind_rect_bb.Min + ImVec2(4, 4), bind_rect_bb.Max - ImVec2(4, 4), ImColor(0, 0, 0, int(160 * vec[it].anim.value)), GetStyle().WindowRounding);

//     //         draw->AddText(bind_rect_bb.Min + ImVec2(offset.x, offset.y), ui::helpers.get_accent_imcolor(vec[it].anim.value), vec[it].key.c_str());
//     //         draw->AddText(ImVec2(bind_rect_bb.Max.x - offset.x, bind_rect_bb.Min.y + offset.y) - ImVec2(CalcTextSize(vec[it].name.c_str()).x, 0), ImColor(255, 255, 255, int(255 * vec[it].anim.value)), vec[it].name.c_str());
//     //     }
//     // }

//     void draw(bool MenDeal) {
//         using namespace ImGui;

//         static bool test_example;
//         handle(xor_str ("Example keybind"), 0x76, test_example, false);
//         static bool test_example2;
//         handle(xor_str ("Example keybind 2"), 0x77, test_example2, false);

//         const float& spacing = 18;
        
//         PushStyleVar(ImGuiStyleVar_WindowRounding, GetStyle().WindowRounding / 4);
//         PushStyleVar(ImGuiStyleVar_WindowPadding, {0, 0});

//         SetNextWindowSize({ 150, (16 + GetFontSize()) + (spacing * vec.size()) });
//         Begin(xor_str ("keybinds"), nullptr, ImGuiWindowFlags_NoBackground | ImGuiWindowFlags_NoDecoration);
//         decorations(GetForegroundDrawList());
//         binds_list(GetForegroundDrawList());
//         End();

//         PopStyleVar(2);
//     }
// }
