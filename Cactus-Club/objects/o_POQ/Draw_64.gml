/// @description GUI DEPTH
// You can write your code in this editor
if !o_player.show_inventory then exit;
draw_self();
depth = o_inventory.depth -1;

x = camera_get_view_border_x(view_camera[0])+146;
y = camera_get_view_border_y(view_camera[0])+24;