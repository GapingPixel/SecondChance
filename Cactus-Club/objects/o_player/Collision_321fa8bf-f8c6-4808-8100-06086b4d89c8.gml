/// @description Insert description here
// You can write your code in this editor
//global.player_start_position = other.start_;
persistent = true;
global.player_start_position = other.start_;
room_goto(other.room_);

//instance_create_depth(0,0,-10000,o_room_transition_fx);