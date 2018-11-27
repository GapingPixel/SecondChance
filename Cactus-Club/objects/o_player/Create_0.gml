///Animation
// You can write your code in this editor
image_speed = 0.8;
hspeed_ = 4;
vspeed_ = 4;
gravity_ = 1;
global.player_start_position = noone;

enum state {
	base = 0,
	action = 1,
	chat = 2,
}

enum anim {
	idle = 0,
	walk = 1,
	talk = 2,
}

face_right = 0;
face_left = 1;
dir_ = face_right;

state = state.base;

scr_input();

debug_text = false;

show_inventory = false;

page = 1;