if room == r_init then exit;

if paused_ 
{

switch page {

	case pausemenu.main:
	option_[pauseoptions.resume] = "Resume";
	option_[pauseoptions.options] = "Options";
	option_[pauseoptions.quit] = "Quit";
	//option_length_ = array_length_1d(option_);
	option_length_ = 3;
	break;
	
	case pausemenu.options:
	option_[pauseoptions2.fullscreen] = "Fullscreen";
	option_[pauseoptions2.musicvol] = "Music Volume";
	option_[pauseoptions2.sfxvol] = "SFX Volume";
	option_[pauseoptions2.back] = "Back";
	option_length_ = 4;
	break;
}



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
} else if (device_mouse_y_to_gui(0) >= 201 and device_mouse_y_to_gui(0)<= 230 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = pauseoptions.options;	
} else if (device_mouse_y_to_gui(0) >= 231 and device_mouse_y_to_gui(0)<= 260 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = pauseoptions.quit;	
} else if page == pausemenu.options and (device_mouse_y_to_gui(0) >= 261 and device_mouse_y_to_gui(0)<= 290 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = pauseoptions2.back;	
}
}

if o_input.select_
{
	
	switch page {
		
	case pausemenu.main:
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
			
		case pauseoptions.options:
		page = pausemenu.options;
		break;
		/*case options.credits:
			show_debug_message("Credits");
			break;*/
		case pauseoptions.quit:
			game_end();
			break;
	}
	break;
	
	case pausemenu.options:
	switch (index_)
	{
		case pauseoptions2.fullscreen:
			global.fullscreen = !global.fullscreen;
			window_set_fullscreen(global.fullscreen);
			break;
		case pauseoptions2.musicvol:
			
			
			break;
		
		case pauseoptions2.sfxvol:
			
			break;
		case pauseoptions2.back:
			page = pausemenu.main;
			break;
	}
	break;
	
	}
}

//Volume
if page == pausemenu.options {
	show_volume = true;
	if index_ == pauseoptions2.musicvol {
	
		if o_input.right_pressed_ {
			if global.vol < 1 global.vol += 0.05;
			audio_master_gain(global.vol);
			alarm[1] = room_speed*.25;
		}

		if o_input.left_pressed_ {
			if global.vol > 0 global.vol -= 0.05;
			audio_master_gain(global.vol);
			alarm[1] = room_speed*.25;
		}
	}
	
} else {
	show_volume = false;
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
