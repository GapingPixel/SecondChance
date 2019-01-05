/// @description Cursor Update
// You can write your code in this editor
//cursor_sprite = s_cursor;
x=mouse_x;
y=mouse_y;

if position_meeting(x,y,class_npc) and diag {
	cursor_sprite  = s_dialogue_hover;
} else {
	cursor_sprite  = s_cursor;
}