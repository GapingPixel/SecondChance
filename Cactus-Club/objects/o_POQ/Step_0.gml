/// @description Insert description here
// You can write your code in this editor
if !o_player.show_inventory { 
	instance_destroy(); 
	//exit;
}
if global.inventory_page != 3 then instance_destroy(id,false);

x = camera_get_view_border_x(view_camera[0])+146;
y = camera_get_view_border_y(view_camera[0])+24;