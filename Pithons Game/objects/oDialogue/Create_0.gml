/// oDialogue - Create Event
/// Sets up the dialogue box.

lines = [];          // The lines to show
line_index = 0;      // Which line is showing right now
speaker = "Guide";   // Name shown at the top of the box

// Saved player state while dialogue is open (used in End Step)
frozen_health = 100;
frozen_x = 0;
frozen_y = 0;

// Tells the rest of the game whether the box is open
global.dialogue_active = false;

/// Starts a conversation with a name and a list of lines.
start_dialogue = function(_speaker, _lines) {
    speaker = _speaker;
    lines = _lines;
    line_index = 0;
    global.dialogue_active = true;

    // Remember the player's health and position right now
    frozen_health = health;
    if (instance_exists(oPlayer)) {
        frozen_x = oPlayer.x;
        frozen_y = oPlayer.y;
    }
};