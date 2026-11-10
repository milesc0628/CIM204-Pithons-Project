/// oOutroTrigger - Create Event
/// Invisible zone that plays the ending when the player walks in.
/// Princess Maia speaks first, then King Atlas. After the last
/// line closes, the game goes to rmVictory.
///
/// Place this over the princess's cage. Until the princess exists,
/// it can sit anywhere for testing.

// Lines for each speaker (edit freely)
princess_lines = [
    "Alcyone? You found me!",
    "I knew someone would come. Let's leave this castle before the Bull Moon rises."
];

king_lines = [
    "Maia! My daughter is safe. You have done it, Alcyone.",
    "Many doubted my choice of so young a wizard. One day I will tell you why I chose you.",
    "Come home, both of you. The Pleiades Kingdom is in your debt."
];

// Which part of the outro is playing:
// 0 = not started, 1 = princess talking, 2 = king talking
stage = 0;