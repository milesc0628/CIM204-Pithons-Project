/// oDialogue - Room Start Event
/// Shows King Atlas's short reminder when the player comes back
/// to this room after dying.
///
/// Why it's here: Room1 is Persistent, so when the player returns,
/// the room is restored as it was and oGuideIntro (which deleted
/// itself after the first intro) does not run again. oDialogue
/// stays in the room, and Room Start runs on every entry.
///
/// First time in the room: intro_seen doesn't exist yet, so this
/// does nothing and oGuideIntro plays the full intro instead.

if (variable_global_exists("intro_seen") && global.intro_seen) {
    start_dialogue("King Atlas", ["Rise, Alcyone. The Bull Moon has not yet risen. Try again."]);
}