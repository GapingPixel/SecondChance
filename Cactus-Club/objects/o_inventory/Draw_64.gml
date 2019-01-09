/// @description Insert description here
// You can write your code in this editor
if !o_player.show_inventory then exit;


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
draw_self();

/*
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;
repeat(inv_slots) {

	xx = slots_x+80 + ((cell_size+x_buffer)*ix); 
	yy = slots_y + ( (cell_size+y_buffer)*iy); 
	
	iitem = inv_grid [# 0, ii ];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	
	//if iitem > 0 {
		draw_sprite_part_ext(spr_inv_items,image_number,sx, sy, cell_size, cell_size, xx, yy, image_xscale, image_yscale, image_blend, image_alpha);
	///}
	
	ii += 1;
	ix = ii mod inv_slots_width;
	iy = ii mod inv_slots_width;

}