show_debug_message("Current room: " + room_get_name(room));
global.restart_game = true;
room_goto(Room1);

show_debug_message("Room after goto: " + room_get_name(room));
health = 100;
