/// @description Description POQ
// You can write your code in this editor
if (mouse_check_button_pressed(mb_left)) {
	//create_descripton("Grace is vegetarian", .5, camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
	if (instance_exists(o_description)) then instance_destroy(o_description,false);
	if !global.grace_pescatarian {
		create_description("Grace is vegetarian", .5, o_inventory.x+450, o_inventory.y+28);
	} else {
		create_description("Grace is pescatarian", .5, o_inventory.x+450, o_inventory.y+28);
	}
	if !global.grace_pescatarian {
		if state.chat {
			instance_destroy(o_text,false);
			scr_text("Aren’t you a vegetarian, Grace?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			//global.grace_pescatarian = true;
			alarm[0] = room_speed*1;
			o_text.page = 6;
		}
	}
}