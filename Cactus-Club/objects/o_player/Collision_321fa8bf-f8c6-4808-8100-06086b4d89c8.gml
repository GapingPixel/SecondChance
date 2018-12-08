/// @description Insert description here
// You can write your code in this editor
//global.player_start_position = other.start_;
if (action_one) {
	persistent = true;
	global.player_start_position = other.start_;
	room_goto(other.room_);
	o_player.dir_ = other.dir;
} 

//instance_create_depth(0,0,-10000,o_room_transition_fx);