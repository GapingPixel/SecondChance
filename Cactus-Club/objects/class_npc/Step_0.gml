/// @description Pointer Update
// You can write your code in this editor
with instance_nearest(o_player.x,o_player.y, class_npc) {

	if distance_to_object(o_player) <= 24 and o_player.state_ == state.base {
		o_cursor.diag = true;
	} else {
		o_cursor.diag = false;
	}
}