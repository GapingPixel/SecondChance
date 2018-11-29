/// @description 
display_set_gui_size(640,360);

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
	if mouse_check_button_released(mb_left) and (mouse_y >= 48 and mouse_y <= 68 ) and (mouse_x >= 125 and mouse_x <= 145 ) {
		global.inventory_page = 1;	
	}

	if mouse_check_button_released(mb_left) and (mouse_y >= 72 and mouse_y <= 92 ) and (mouse_x >= 125 and mouse_x <= 145 ) {
		global.inventory_page = 2;	
	}

	if mouse_check_button_released(mb_left) and (mouse_y >= 95 and mouse_y <= 115 ) and (mouse_x >= 125 and mouse_x <= 145 ) {
		global.inventory_page = 3;	
	}
	
	//Close inventory when clicking "x"
	if mouse_check_button_released(mb_left) and (mouse_y >= 10 and mouse_y <= 25 ) and (mouse_x >= 500 and mouse_x <= 516 ) {
		show_inventory = false;	
	}



} else {
	if instance_exists(o_inventory) then instance_destroy(o_inventory,false);
}





