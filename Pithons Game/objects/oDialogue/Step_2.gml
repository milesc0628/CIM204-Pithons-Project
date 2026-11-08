/// oDialogue - End Step Event
/// While dialogue is open, undo any damage or movement so the
/// player is safe and nothing sneaks up on them while reading.
/// End Step runs after enemies and collisions each frame.

if (!global.dialogue_active) exit;

// Keep the player's health and position the same
health = frozen_health;

if (instance_exists(oPlayer)) {
    oPlayer.x = frozen_x;
    oPlayer.y = frozen_y;
}

// Put every walking enemy back where it was when dialogue started.
// The check skips any enemy created after the box opened.
with (oEnemy) {
    if (variable_instance_exists(id, "dialogue_freeze_x")) {
        x = dialogue_freeze_x;
        y = dialogue_freeze_y;
    }
}