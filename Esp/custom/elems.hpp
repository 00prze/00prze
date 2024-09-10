#pragma once

#include "IMGUI/imgui.h"
#include "IMGUI/imgui_internal.h"

namespace elems {
    bool checkbox(const char* label, bool* v);
    bool color_picker(const char* label, ImVec4& color, ImGuiColorEditFlags misc_flags = 0);
    bool slider_int(const char* label, int* v, int v_min, int v_max, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool slider_float(const char* label, float* v, float v_min, float v_max, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool button(const char* label, const ImVec2& size_arg = { 0, 0 });
    bool alternative_button(const char* label, const ImVec2& size_arg = { 0, 0 });
    bool combo(const char* label, int* current_item, bool (*items_getter)(void*, int, const char**), void* data, int items_count, int popup_max_height_in_items = -1);
    bool combo(const char* label, int* current_item, const char* items_separated_by_zeros, int height_in_items = -1);
    bool combo(const char* label, int* current_item, const char* const items[], int items_count, int height_in_items = -1);
    bool selectable(const char* label, bool* p_selected, ImGuiSelectableFlags flags, const ImVec2& size_arg);
    bool selectable(const char* label, bool selected, ImGuiSelectableFlags flags, const ImVec2& size_arg);
   // bool keybind(const char* label, int* key);
    bool input_text(const char* label, char* buf, size_t buf_size, ImGuiInputTextFlags flags = 0, ImGuiInputTextCallback callback = 0, void* user_data = nullptr);
    bool input_text(const char* label, const char* hint, char* buf, size_t buf_size, ImGuiInputTextFlags flags = 0, ImGuiInputTextCallback callback = 0, void* user_data = nullptr);
    bool input_text_ex(const char* label, const char* hint, char* buf, int buf_size, const ImVec2& size_arg, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* callback_user_data);
    bool color_picker_4(const char* label, float col[4], ImGuiColorEditFlags flags, const float* ref_col);
}
