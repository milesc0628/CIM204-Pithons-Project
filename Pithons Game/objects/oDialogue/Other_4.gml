/// oDialogue - Room Start Event
/// Shows King Atlas's short reminder once, when the player comes
/// back to Room1 after dying.
///
/// Why it's here: Room1 is Persistent, so when the player returns,
/// the room is restored as it was and oGuideIntro (which deleted
/// itself after the first intro) does not run again. oDialogue
/// stays in the room, and Room Start runs on every entry.
///
/// The room check makes sure it only appears in Room1, not on the
/// Game Over screen or any other room oDialogue might be in.
///
/// First time in Room1: intro_seen doesn't exist yet, so this does
/// nothing and oGuideIntro plays the full intro instead.

if (room == Room1
    && variable_global_exists("intro_seen")
    && global.intro_seen) {
    start_dialogue("King Atlas", ["Rise, Alcyone. The Bull Moon has not yet risen. Try again."]);
}