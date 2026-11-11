/// oDialogue - Step Event
/// Goes to the next line when Space or Enter is pressed.

// If the box isn't open, do nothing
if (!global.dialogue_active) exit;

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
    line_index += 1;

    // After the last line, close the box
    if (line_index >= array_length(lines)) {
        global.dialogue_active = false;
        lines = [];
        line_index = 0;
    }
}