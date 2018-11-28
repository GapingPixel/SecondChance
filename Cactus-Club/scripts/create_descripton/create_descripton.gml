///@description parameterss
///@param text
///@param spd
///@param x
///@param y

//scr_text("Text",speed,x,y);

txt = instance_create_layer(argument2,argument3,"UI",o_description);
with (txt)
{
	padding = 20;
	var right_padding = 3;
	maxlength = sprite_width-right_padding; //view_get_wport(view_wport[0]);
	text = argument0;
	spd = argument1;
	font = fn_10;

	
	text_length = string_length(text);
	font_size = font_get_size(font);
	
	draw_set_font(font);
	
	text_width = string_width_ext(text,font_size+(font_size/2),maxlength);
	text_height = string_height_ext(text,font_size+(font_size/2),maxlength);
	
	boxwidth = text_width + (padding*2);
	boxheight = text_height + (padding*2);
	
	
}