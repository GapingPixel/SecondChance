/// @description Insert description here
// You can write your code in this editor
x=camera_get_view_x(view_camera[0])+125;
y=camera_get_view_y(view_camera[0])+250;

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
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
draw_text_ext(
	x + padding,
	y + padding,
	print,
	font_size+(font_size/2),
	maxlength
);


draw_text(x+padding+20, y+padding*3, "Floor 1");
draw_text(x+82,y+padding*3, "Floor 3" );
draw_text(x+132,y+padding*3, "Floor 5" );
draw_text(x+182,y+padding*3, "Floor 6" );

switch (select) {

	case 1:
	draw_sprite(s_arrow_select,0,x+padding,y+padding*3);
	break;
	
	case 2:
	draw_sprite(s_arrow_select,0,x+62,y+padding*3);
	break;
	
	case 3:
	draw_sprite(s_arrow_select,0,x+112,y+padding*3);
	break;
	
	case 4:
	draw_sprite(s_arrow_select,0,x+162,y+padding*3);
	break;
}

if keyboard_check_pressed(vk_left) and select >= 2 {
	select--;
} else if keyboard_check_pressed(vk_right) and select <= 3 {
	select++;
}

if keyboard_check_pressed(vk_enter) {
	
	switch (select) {
	
		case 1:
		o_player.persistent = true;
		global.player_start_position = xy_ascensorTolobby;
		room_goto(r_FLR_01_Lobby);
		o_player.dir_ = o_player.face_left;
		break;
	
		case 2:
		o_player.persistent = true;
		global.player_start_position = xy_ascensorTofl3hallway;
		room_goto(r_FLR3_hallway);
		o_player.dir_ = o_player.face_left;
		break;
	
		case 3:
		o_player.persistent = true;
		global.player_start_position = xy_ascensorTofl5hallway;
		room_goto(r_FLR_05_Hallway);
		o_player.dir_ = o_player.face_left;
		break;
	
		case 4:
		o_player.persistent = true;
		global.player_start_position = xy_ascensorTofl6hallway;
		room_goto(r_FLR_06_Hallway);
		o_player.dir_ = o_player.face_left;
		break;
	}
}

draw_set_alpha(1);