///Animation
// You can write your code in this editor
depth = 10;
image_speed = 0.8;
hspeed_ = 4;
vspeed_ = 4;
gravity_ = 1;
global.player_start_position = noone;

enum state {
	base = 0,
	action = 1,
	chat = 2,
	idle = 3
}

enum anim {
	idle = 0,
	walk = 1,
	talk = 2,
	sleep = 3
}

face_right = 0;
face_left = 1;
dir_ = face_left;

//state = state.chat;
state_ = state.chat;

scr_input(global.pad[0]);

debug_text = false;

show_inventory = false;

page = 1;

chat = INTRO;

anim_ = anim.idle;

skip = false;


	