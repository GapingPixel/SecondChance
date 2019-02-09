///Animation
// You can write your code in this editor
depth = 10;
image_speed = 0.8;
hspeed_ = 4;
vspeed_ = 4;
gravity_ = 1;
global.player_start_position = noone;
global.wallyclue = false;
enum state {
	base = 0,
	action = 1,
	chat = 2,
	idle = 3,
	inspect = 4
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

first_line = true;	


///Diag Line Count
diagDina = 1;
diagHeather = 1;
diagEddyson = 1;
diagStu = 1;
diagGrace = 1;
diagCarrie = 1;
diagChase = 1;
diagUrsula = 1;
diagDuncan = 1;
diagYasmin = 1;
diagHarold = 1;