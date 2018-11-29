/// @description Description Clue 
// You can write your code in this editor
if (instance_exists(o_description) and show_des !=1 ) {
	instance_destroy(o_description,false);
}

if (!instance_exists(o_description)) {
	create_description("A nearly full pack of cigarettes of the SEAGULL brand.", .5, o_inventory.x+450, o_inventory.y+28);
	show_des = 1;
}

if (mouse_check_button_pressed(mb_left)) {
	//create_descripton("Grace is vegetarian", .5, camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
	if state.chat {
		instance_destroy(o_text,false);
		scr_text("That has nothing to do with tuna salad.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
		//global.grace_pescatarian = true;
		alarm[0] = room_speed*1;
		o_text.page = PAGE_CIGG;
	}
}

