/// oGuideTrigger - Create Event
/// Sets up an invisible trigger zone that starts dialogue
/// when the player walks into it.
///
/// The boss-door lines are stored here in the object, so they
/// travel with the Local Package. (Instance Creation Code does not.)
/// An instance's Creation Code can still replace these lines,
/// because Creation Code runs after this event.

speaker = "King Atlas";   // Name shown in the dialogue box

trigger_lines = [         // Lines shown when the player enters
    "I sense great power beyond this door, Alcyone.",
    "Prepare yourself."
];

triggered = false;        // Becomes true after it fires once