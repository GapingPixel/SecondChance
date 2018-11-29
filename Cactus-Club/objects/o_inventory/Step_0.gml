/// @description Insert description here
// You can write your code in this editor
if global.inventory_page == 1 {
	if !instance_exists(o_clue) { 
		instance_create_layer(camera_get_view_border_x(view_camera[0])+146,camera_get_view_border_y(view_camera[0])+24,"UI",o_clue);
	}
} 

if global.inventory_page == 3 {
	if !instance_exists(o_POQ) { 
		instance_create_layer(camera_get_view_border_x(view_camera[0])+146,camera_get_view_border_y(view_camera[0])+24,"UI",o_POQ);
	}
} 