/// oGuideTrigger - Step Event
/// Starts the dialogue the first time the player touches this zone.

// Already played? Do nothing
if (triggered) exit;

// Wait if another conversation is already on screen
if (global.dialogue_active) exit;

// Make sure the dialogue box exists
if (!instance_exists(oDialogue)) exit;

// Is the player inside this zone?
if (place_meeting(x, y, oPlayer)) {
    triggered = true;

    // Copy this trigger's text so oDialogue can use it
    var _speaker = speaker;
    var _lines = trigger_lines;

    with (oDialogue) {
        start_dialogue(_speaker, _lines);
    }
}