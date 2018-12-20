if o_input.up_pressed_ and o_input.alarm[0] <= 0
{
	index_ = max(--index_, 0)
	o_input.alarm[0] = global.one_second*.15;
}

if o_input.down_pressed_ and o_input.alarm[0] <= 0
{
	index_ = min(++index_, option_length_-1)
	o_input.alarm[0] = global.one_second*.15;
}
if !global.gamepad_active 
{
if (device_mouse_y_to_gui(0) >= 390 and device_mouse_y_to_gui(0)<= 425) and (device_mouse_x_to_gui(0) >= 500 and device_mouse_x_to_gui(0) <= 700 ) {
		index_ = options.new_game;	
} else if (device_mouse_y_to_gui(0) >= 426 and device_mouse_y_to_gui(0)<= 460 ) and (device_mouse_x_to_gui(0) >= 500 and device_mouse_x_to_gui(0) <= 700 ) {
		index_ = options.quit;	
} /*else if (device_mouse_y_to_gui(0) >= 201 and device_mouse_y_to_gui(0)<= 230 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 270 ) {
		index_ = options.credits;	
} else if (device_mouse_y_to_gui(0) >= 231 and device_mouse_y_to_gui(0)<= 260 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 270 ) {
		index_ = options.quit;	
}*/
}

if o_input.select_
{
	switch (index_)
	{
		/*case options.continue_game:
			show_debug_message("Continue");
			break;*/
		case options.new_game:
			room_goto(r_Chance_Office); //Select to start at 
			//room_goto(r_protodung);
			break;
		/*case options.credits:
			show_debug_message("Credits");
			break;*/
		case options.quit:
			game_end();
			break;
	}
}