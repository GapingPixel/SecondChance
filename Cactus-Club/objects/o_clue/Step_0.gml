/// @description Insert description here
// You can write your code in this editor
if !o_player.show_inventory { 
	instance_destroy(id,false); 
	exit;
}
if global.inventory_page != 1 then instance_destroy(id,false);


//x = XtoGUI(x+20) //camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) * 0.5) +120;//o_player.x //camera_get_view_border_x(view_camera[0])+200;
//y = camera_get_view_border_y(view_camera[0])+24;

