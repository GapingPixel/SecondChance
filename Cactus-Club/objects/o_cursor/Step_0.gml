/// @description Cursor Update
// You can write your code in this editor
//cursor_sprite = s_cursor;
x=mouse_x;
y=mouse_y;

if position_meeting(x,y,diag) {
	cursor_sprite  = s_dialogue_hover;
} else if position_meeting(x,y,inspec) {
	cursor_sprite  = s_clue_cursor;
	if mouse_check_button_pressed(mb_left) {
		global.wallyclue = true;
	}
} else {
	cursor_sprite  = s_cursor;
}