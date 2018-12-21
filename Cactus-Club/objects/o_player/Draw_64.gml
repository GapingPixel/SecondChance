/// @description 
//display_set_gui_size(640,360);

if inventory {
	show_inventory = !show_inventory
}

if show_inventory {
	
	if !instance_exists(o_inventory) {
		instance_create_layer(80,0,"UI",o_inventory); 
	}
		
	switch (global.inventory_page) {
		case 1:
		//draw_sprite(spr_inventory_pg1,0,0+80,0);
		o_inventory.image_index = 0;
		break;
		
		case 2:
		//draw_sprite(spr_inventory_pg2,0,0+80,0);
		o_inventory.image_index = 1;
		break;
		
		case 3:
		//draw_sprite(spr_inventory_pg3,0,0+80,0);
		o_inventory.image_index = 2;
		break;
	}
	
	//22x21 Pixels, each tab selection cell
	if mouse_check_button_released(mb_left) and (device_mouse_y_to_gui(0) >=  48 and device_mouse_y_to_gui(0) <= 68 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 1;	
	}

	if mouse_check_button_released(mb_left) and (device_mouse_y_to_gui(0) >= 72 and device_mouse_y_to_gui(0) <= 92 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 2;	
	}

	if mouse_check_button_released(mb_left) and (device_mouse_y_to_gui(0) >= 95 and device_mouse_y_to_gui(0) <= 115 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 3;	
	}
	if mouse_check_button_released(mb_left) and (device_mouse_y_to_gui(0) >= 10 and device_mouse_y_to_gui(0)<= 25 ) and (device_mouse_x_to_gui(0) >= 500 and device_mouse_x_to_gui(0) <= 516 ) {
		show_inventory = false;	
	}
	
	
	if global.inventory_page == 1 {
	//Close inventory when clicking "x"
	
	if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >=177  and device_mouse_x_to_gui(0) <=222  ) {
		if (instance_exists(o_description) and o_cursor.show_des !=1 ) {
			instance_destroy(o_description,false);
		}

		if (!instance_exists(o_description)) {
			create_description("A nearly full pack of cigarettes of the SEAGULL brand.", .5, o_inventory.x+450, o_inventory.y+28);
			o_cursor.show_des = 1;
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

	}
	}
	
	if global.inventory_page == 3 {
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >=177  and device_mouse_x_to_gui(0) <=222  ) {
	
		if (instance_exists(o_description) and o_cursor.show_des !=2 ) {
	instance_destroy(o_description,false);
}

if (!instance_exists(o_description)) {
	if !global.grace_pescatarian {
		create_description("Grace is vegetarian", .5, o_inventory.x+450, o_inventory.y+28);
	} else {
		create_description("Grace is pescatarian", .5, o_inventory.x+450, o_inventory.y+28);
	}
	o_cursor.show_des = 2;
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
		
		}
	
	
} } else {
	if instance_exists(o_inventory) then instance_destroy(o_inventory,false);
}





