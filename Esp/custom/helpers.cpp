#include "Esp/custom/helpers.hpp"

ImColor ui_helpers::get_accent_imcolor(const float& alpha, const float& whitepoint) {
    return { accent_color.Value.x * whitepoint, accent_color.Value.y * whitepoint, accent_color.Value.z * whitepoint, alpha };
}

ImVec4 ui_helpers::get_accent_imvec4(const float& alpha, const float& whitepoint) {
    return { accent_color.Value.x * whitepoint, accent_color.Value.y * whitepoint, accent_color.Value.z * whitepoint, alpha };
}

bool ui_helpers::custom_child(const char* label, const ImVec2& size) {
    using namespace ImGui;

    if (BeginChild(label, size, false)) {
        SetCursorPos({ 0, 0 });

        ImRect heading_bb(
            GetWindowPos(),
            GetWindowPos() + ImVec2(GetWindowSize().x, 30)
        );

        const auto& label_size = CalcTextSize(label);

        GetWindowDrawList()->AddRectFilled(heading_bb.Min + ImVec2(0, heading_bb.GetHeight()), heading_bb.Min + GetWindowSize(), get_accent_imcolor(GetStyle().Alpha * 0.8f, 0.10f), GetStyle().WindowRounding / 2, ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersBottomLeft);

        GetWindowDrawList()->AddRect(heading_bb.Min + ImVec2(0, heading_bb.GetHeight()), heading_bb.Min + GetWindowSize(), get_accent_imcolor(GetStyle().Alpha, 0.15f), GetStyle().WindowRounding / 2, ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersBottomLeft);

        GetWindowDrawList()->AddRectFilled(heading_bb.Min, heading_bb.Max, get_accent_imcolor(GetStyle().Alpha, 0.15f), GetStyle().WindowRounding / 2, ImDrawFlags_RoundCornersTopRight | ImDrawFlags_RoundCornersTopLeft);

        GetWindowDrawList()->AddText(heading_bb.Min + ImVec2(heading_bb.GetWidth() / 2 - label_size.x / 2, heading_bb.GetHeight() / 2 - label_size.y / 2), get_accent_imcolor(GetStyle().Alpha), label);

        SetCursorPos({ 14, heading_bb.GetHeight() + 14 });

        PushStyleColor(ImGuiCol_ChildBg, {0, 0, 0, 0});

        BeginChild((std::string(label) + "##features").c_str(), GetContentRegionAvail() - ImVec2(14, 14));

        PopStyleColor();

        return true;
    }

    return false;
}

void ui_helpers::end_child() {
    for (int i = 0; i < 2; i++)
        ImGui::EndChild();
}

void ui_helpers::bold_text(const char* value, ImFont* bold_font) {
    //ImGui::PushFont(bold_font);
    ImGui::Text(value);
    //ImGui::PopFont();
}
