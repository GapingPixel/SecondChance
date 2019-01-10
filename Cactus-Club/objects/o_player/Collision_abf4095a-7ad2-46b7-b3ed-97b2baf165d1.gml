/// @description Elevator Text
//scr_text("Where do I want to go?",01view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
if (action_one and state_ == state.base) {
	if !instance_exists(o_text_stairs) then scr_stairs("Where do I want to go?",1,camera_get_view_x(view_camera[0])+125,camera_get_view_y(view_camera[0])+250);
state_ = state.chat;
} else if action_one and state_ == state.chat {
	instance_destroy(o_text_elevator,false);
	state_ = state.base;
}
