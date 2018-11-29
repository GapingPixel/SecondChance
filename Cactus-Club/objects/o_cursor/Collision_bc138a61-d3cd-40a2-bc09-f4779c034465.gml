/// @description Description POQ
// You can write your code in this editor

if (instance_exists(o_description) and show_des !=2 ) {
	instance_destroy(o_description,false);
}

if (!instance_exists(o_description)) {
	if !global.grace_pescatarian {
		create_description("Grace is vegetarian", .5, o_inventory.x+450, o_inventory.y+28);
	} else {
		create_description("Grace is pescatarian", .5, o_inventory.x+450, o_inventory.y+28);
	}
	show_des = 2;
}


if (mouse_check_button_pressed(mb_left)) {	
	if !global.grace_pescatarian {
		if state.chat {
			instance_destroy(o_text,false);
			scr_text("Aren't you a vegetarian, Grace?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			//global.grace_pescatarian = true;
			alarm[0] = room_speed*1;
			o_text.page = 6;
		}
	}
}