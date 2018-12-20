if room == r_init then exit;

if paused_ 
{

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
if (device_mouse_y_to_gui(0) >= 171 and device_mouse_y_to_gui(0)<= 200) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = pauseoptions.resume;	
} else if (device_mouse_y_to_gui(0) >= 201 and device_mouse_y_to_gui(0)<= 231 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = pauseoptions.quit;	
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
		case pauseoptions.resume:
			//room_goto(r_Chance_Office); //Select to start at 
			//room_goto(r_protodung);
			scr_unpause();
			break;
		/*case options.credits:
			show_debug_message("Credits");
			break;*/
		case pauseoptions.quit:
			game_end();
			break;
	}
}
}



if o_input.pause_pressed_ 
{
	if !paused_ {
		paused_ = true;
		paused_sprite_ = sprite_create_from_surface(application_surface, 0 , 0, view_wport[0], view_hport[0], false, false, 0, 0);
		instance_deactivate_all(true)
		instance_activate_object(o_input);
		//audio_play(a_pause)
	}
	
}
