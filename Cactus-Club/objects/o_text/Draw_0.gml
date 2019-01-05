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
	x + padding+75,
	y + padding,
	print,
	font_size+(font_size/2),
	maxlength
);

//Chest and Char Name
draw_sprite(character,0,x+18,y+59);
var name;
switch (character) {
	
	case CHEST_GRACE:
	name = "Grace"
	break;
	
	case CHEST_PROT:
	name = "Chance"
	break;
	
}
//draw_set_halign(fa_center);
draw_text(x+27,y+65,name)

draw_set_alpha(1);