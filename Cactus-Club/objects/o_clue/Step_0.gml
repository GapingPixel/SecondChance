/// @description Insert description here
// You can write your code in this editor
if !o_player.show_inventory { 
	instance_destroy(id,false); 
	exit;
}
if global.inventory_page != 1 then instance_destroy(id,false);


