/// @description Insert description here
// You can write your code in this editor
draw_self();

if o_player.state_ != state.chat then instance_destroy();

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
	case CHEST_GRACE_B:
	name = "   Grace"
	break;
	
	case CHEST_PROT:
	case CHEST_PROT_B:
	name = "  Chance"
	break;
	
	case CHEST_COP:
	name = "Cactus Cop"
	break;
	
	case CHEST_DINA:
	name = "    Dina"
	break;
	
	case CHEST_EDDYSON:
	name = "Eddyson"
	break;
	
	case CHEST_HEATHER:
	name = " Heather"
	break;
	
	case CHEST_LESLIE:
	name = "Leslie"
	break;
	
	case CHEST_REYNOLDS:
	name = "     Stu"
	break;
	
	case CHEST_BIZI:
	name = "    Bizi"
	break;
	
	case CHEST_CARRIE:
	name = "  Carrie"
	break;
	
	case CHEST_CHASE:
	name = "  Chase"
	break;
	
	case CHEST_HAROLD:
	name = "Harold"
	break;
	
	case CHEST_URSULA:
	name = "Ursula"
	break;
	
	case CHEST_DUNCAN:
	name = " Duncan"
	break;
	
	case CHEST_WENDY:
	name = " Wendy"
	break;
}

//draw_set_halign(fa_center);
draw_text(x+27,y+65,name)

draw_set_alpha(1);

if o_player.state_ == state.chat and page == PAGE_END and o_player.first_line == true	 {
	
	if  (device_mouse_y_to_gui(0) >= 250 and device_mouse_y_to_gui(0) <= 280 ) and (device_mouse_x_to_gui(0) >= 220 and device_mouse_x_to_gui(0) <= 270 ) {
		draw_sprite(s_arrow_select1,0,view_xport[0]+125+87,view_yport[0]+250+12);
		option = 1;
	
	} else if (device_mouse_y_to_gui(0) >= 250 and device_mouse_y_to_gui(0) <= 280 ) and (device_mouse_x_to_gui(0) >= 310 and device_mouse_x_to_gui(0) <= 390 ) {
		draw_sprite(s_arrow_select1,0,view_xport[0]+302,view_yport[0]+250+12);
		option = 2;
	
	} else if (device_mouse_y_to_gui(0) >= 250 and device_mouse_y_to_gui(0) <= 280 ) and (device_mouse_x_to_gui(0) >= 410 and device_mouse_x_to_gui(0) <= 500 ) {
		draw_sprite(s_arrow_select1,0,view_xport[0]+422,view_yport[0]+250+12);
		option = 3;
	} else {
		option = noone;
	}
	
}

if o_player.first_line == false then option = noone;