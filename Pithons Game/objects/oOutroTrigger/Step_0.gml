/// oOutroTrigger - Step Event
/// Runs the ending in order:
///   stage 0: wait for the player to walk in, then start the princess's lines
///   stage 1: when her lines close, start the king's lines
///   stage 2: when his lines close, go to the victory room
///   stage 3: finished (does nothing)

// The dialogue box must exist for any of this to work
if (!instance_exists(oDialogue)) exit;

if (stage == 0) {
    // Wait until no other dialogue is open and the player touches the zone
    if (!global.dialogue_active && place_meeting(x, y, oPlayer)) {
        stage = 1;
        var _lines = princess_lines;   // copied, because inside with() names refer to oDialogue's
        with (oDialogue) {
            start_dialogue("Princess Maia", _lines);
        }
    }
}
else if (stage == 1) {
    // Princess finished talking: King Atlas speaks next
    if (!global.dialogue_active) {
        stage = 2;
        var _lines = king_lines;
        with (oDialogue) {
            start_dialogue("King Atlas", _lines);
        }
    }
}
else if (stage == 2) {
    // King finished talking: the game is won
    if (!global.dialogue_active) {
        stage = 3;
        room_goto(rmVictory);
    }
}