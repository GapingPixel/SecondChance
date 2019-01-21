/// @description Pointer Update
// You can write your code in this editor
with instance_nearest(o_player.x,o_player.y, class_npc) {

	if distance_to_object(o_player) <= 24 and (o_player.state_ == state.base or o_player.state_ == state.idle) {
		o_cursor.diag = id;
	} else {
		o_cursor.diag = noone;
	}
}

if o_player.state_ != state.chat then exit; 

with instance_nearest(o_player.x,o_player.y, class_npc) {
if o_player.state_ == state.chat and o_player.chat != INTRO {

	if o_player.x < x {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
	
	if x > o_player.x {
		if o_player.dir_ == o_player.face_left {
			o_player.dir_ = o_player.face_right;
		}
	} else if x < o_player.x {
		if o_player.dir_ == o_player.face_right {
			o_player.dir_ = o_player.face_left;
		}
	}
	
	
} else {
	image_xscale = 1;
}
}