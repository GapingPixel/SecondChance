/// @description Insert description here
// You can write your code in this editor
draw_self();

if ( time < text_length ) {
	time += spd;
	print = string_copy(text,0,time);
	
}

///Render textbox and text
draw_set_alpha(alpha);
if (alpha <1) alpha += spd/10; else alpha = 1;

draw_set_font(font);
draw_set_color(c_gray);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext(
	x + 5,//padding,
	y + padding+4,
	print,
	font_size+(font_size/2),
	maxlength
);

//draw_set_halign(fa_center);
//draw_text(x+27,y+65,name)

draw_set_alpha(1);

if (!o_player.show_inventory) then instance_destroy(id,false);