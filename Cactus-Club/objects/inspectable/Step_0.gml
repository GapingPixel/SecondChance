/// @description Insert description here
// You can write your code in this editor
with instance_nearest(o_player.x,o_player.y, inspectable) {

	if distance_to_object(o_player) <= 24 and (o_player.state_ == state.base or o_player.state_ == state.idle) {
		o_cursor.inspec = id;
	} else {
		o_cursor.inspec = noone;
	}
}

//if o_player.state_ != state.inspect then exit; 

with instance_nearest(o_player.x,o_player.y, inspectable) {

if o_player.state_ == state.inspect and o_player.chat != INTRO {
	if x > o_player.x {
		if o_player.dir_ == o_player.face_left {
			o_player.dir_ = o_player.face_right;
		}
	} else if x < o_player.x {
		if o_player.dir_ == o_player.face_right {
			o_player.dir_ = o_player.face_left;
		}
	}
} 
}