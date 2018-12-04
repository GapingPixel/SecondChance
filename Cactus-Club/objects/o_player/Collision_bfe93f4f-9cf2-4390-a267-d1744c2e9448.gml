/// @description Elevator Text
//scr_text("Where do I want to go?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
if (action_one and state_ == state.base) {
if !instance_exists(o_text_elevator) then scr_elevator("Where do I want to go?",0.5,camera_get_view_x(view_camera[0])+125,camera_get_view_y(view_camera[0])+250);
state_ = state.chat;
} else if action_one and state_ == state.chat {
	instance_destroy(o_text_elevator,false);
	state_ = state.base;
}
