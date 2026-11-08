/// oGuideIntro - Step Event
/// Plays King Atlas's intro the first time the game starts.
/// After a restart, plays a short reminder instead.
/// Runs once, then removes itself.

// Wait until the dialogue box exists in the room
if (!instance_exists(oDialogue)) exit;

// Make the "intro seen?" flag the first time.
// Global variables keep their value even when the room restarts.
if (!variable_global_exists("intro_seen")) {
    global.intro_seen = false;
}

if (!global.intro_seen) {
    // First time playing: full intro
    with (oDialogue) {
        start_dialogue("King Atlas", [
            "Alcyone, can you hear me? It is I, King Atlas, speaking to you through magic.",
            "You stand inside Castle Astra. Five magic users have taken my daughter, Princess Maia, somewhere within these walls.",
            "Defeat their monsters and find her before the Bull Moon rises.",
            "Move with W, A, S, and D.",
            "Click the left mouse button to cast a magic bolt.",
            "Spells use mana, the blue bar, and it slowly refills. The red bar is your health. Guard it well.",
            "Hold a direction and press Shift to dash. It costs mana, so use it wisely.",
            "If you ever get stuck, press R to return to where you began.",
            "Now go, Alcyone. My daughter is counting on you."
        ]);
    }
    global.intro_seen = true;
} else {
    // After a restart: short reminder
    with (oDialogue) {
        start_dialogue("King Atlas", ["Rise, Alcyone. The Bull Moon has not yet risen. Try again."]);
    }
}

// Job done, remove this object
instance_destroy();