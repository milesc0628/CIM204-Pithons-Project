/// oDialogue - End Step Event
/// While dialogue is open, undo any damage or movement
/// so the player is safe and stays put while reading.
/// End Step runs after enemies and collisions each frame.

if (!global.dialogue_active) exit;

// Undo any damage taken this frame
health = frozen_health;

// Keep the player in place
if (instance_exists(oPlayer)) {
    oPlayer.x = frozen_x;
    oPlayer.y = frozen_y;
}