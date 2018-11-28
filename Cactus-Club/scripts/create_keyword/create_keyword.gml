///@param0 text
///@param1 x
///@param2 y
///@param3 color
/*with ( instance_create_layer(x,y,"UI",o_keyword) ) {
	text = argument0;
	text_x = argument1;
	text_y = argument2;
	color = argument3;
	depth = -9999;
}*/

txt = instance_create_layer(argument2,argument3,"UI",o_text);
with (txt)
{
	padding = 12;
	var right_padding = 90;
	maxlength = sprite_width-right_padding; //view_get_wport(view_wport[0]);
	text = argument0;
	spd = argument1;
	font = fn_10;
	character = argument4;
	
	text_length = string_length(text);
	font_size = font_get_size(font);
	
	draw_set_font(font);
	
	text_width = string_width_ext(text,font_size+(font_size/2),maxlength);
	text_height = string_height_ext(text,font_size+(font_size/2),maxlength);
	
	boxwidth = text_width + (padding*2);
	boxheight = text_height + (padding*2);
	
	
}