/// @description Insert description here
// You can write your code in this editor
global.player_start_position = xy_gameStart;
instance_create_depth(mouse_x,mouse_y,-9999,o_cursor);
global.inventory_page = 1;
global.grace_pescatarian = false;
#macro PAGE_CIGG 7

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);