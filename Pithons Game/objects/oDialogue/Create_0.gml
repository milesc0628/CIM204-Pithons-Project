/// oDialogue - Create Event
/// Sets up the dialogue box.

lines = [];          // The lines to show
line_index = 0;      // Which line is showing right now
speaker = "Guide";   // Name shown at the top of the box

// Tells the rest of the game whether the box is open
global.dialogue_active = false;

/// Starts a conversation with a name and a list of lines.
start_dialogue = function(_speaker, _lines) {
    speaker = _speaker;
    lines = _lines;
    line_index = 0;
    global.dialogue_active = true;
};

// TEMPORARY TEST - we'll remove this later
start_dialogue("Guide", ["This is a test line.", "Press Space or Enter to continue.", "Last line!"]);