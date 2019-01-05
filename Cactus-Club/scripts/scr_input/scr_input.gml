///Input

//argument0 = global.pad[0];
///Put here all the Inputs!
if max ( keyboard_check(vk_right), keyboard_check(vk_left), keyboard_check(vk_up), keyboard_check(vk_down), 
keyboard_check_pressed(vk_right), keyboard_check_pressed(vk_left),  keyboard_check_pressed(vk_up),  
keyboard_check_pressed(vk_down), mouse_check_button_pressed(mb_left), keyboard_check_pressed(vk_space), 
mouse_check_button_pressed(mb_right), keyboard_check_pressed(vk_enter),
keyboard_check_pressed(ord("I")) ) == true then global.gamepad_active = false;

if max ( gamepad_button_check(argument0, gp_face1), gamepad_button_check(argument0, gp_face2), gamepad_button_check(argument0, gp_face3),gamepad_button_check(argument0,gp_face4), gamepad_button_check(argument0,gp_shoulderl), gamepad_button_check(argument0,gp_shoulderlb), 
gamepad_button_check_pressed(argument0,gp_shoulderr), gamepad_button_check(argument0,gp_shoulderrb), gamepad_button_check(argument0,gp_start),  gamepad_button_check(argument0,gp_select), gamepad_axis_value(argument0,gp_axislh), gamepad_axis_value(argument0,gp_axisrh), gamepad_axis_value(argument0,gp_axislv), gamepad_axis_value(argument0,gp_axisrv), gamepad_button_check(argument0,gp_padd), gamepad_button_check(argument0,gp_padl), gamepad_button_check(argument0,gp_padr), gamepad_button_check(argument0,gp_padu)   ) != 0 
then global.gamepad_active = true;

switch (global.coop) {
	
	case false:
	
	switch (global.gamepad_active) {
		
		case false:
	
	
		right= max(keyboard_check(vk_right), gamepad_axis_value(0,gp_axislh) > 0 );
		left = max(keyboard_check(vk_left), gamepad_axis_value(0,gp_axislh) < 0);

		inventory = keyboard_check_pressed(ord("I"));
		action_one = keyboard_check_released(ord("E"));
		
		right_ = keyboard_check(vk_right);
		left_  = keyboard_check(vk_left); 
		up_    = keyboard_check(vk_up) ;
		down_  = keyboard_check(vk_down);
		right_pressed_ = keyboard_check_pressed(vk_right);
		left_pressed_ = keyboard_check_pressed(vk_left);
		up_pressed_ = keyboard_check_pressed(vk_up);
		down_pressed_ = keyboard_check_pressed(vk_down);
		action_one_ = mouse_check_button(mb_left);
		action_one_pressed_ = mouse_check_button_pressed(mb_left);
		action_two_pressed_ = keyboard_check_pressed(vk_space); 
		action_three_pressed_ = mouse_check_button_pressed(mb_right);
		action_three_released_ = mouse_check_button_released(mb_right);
		action_four_pressed_ = keyboard_check_pressed(ord("F"));
		start = keyboard_check_pressed(vk_enter);
		xdir_ = mouse_x;
		ydir_ = mouse_y;
		pause_pressed_ = keyboard_check_pressed(vk_escape);
		select_ = max(mouse_check_button_pressed(mb_left),keyboard_check_pressed(vk_space),keyboard_check_pressed(vk_enter));
		respawn_ = mouse_check_button_pressed(mb_left);
		dialog_next_ = mouse_check_button_released(mb_left);
		break;
		
		case true:
		
		/*xaxis = right_ - left_;
		yaxis = down_ - up_pressed_;

		xaxis = gamepad_axis_value(argument0, gp_axislh) + (right_ - left_);
		yaxis = gamepad_axis_value(argument0, gp_axislv) + (down_ - up_);*/
		
		right= max(keyboard_check(vk_right), gamepad_axis_value(0,gp_axislh) > 0 );
		left = max(keyboard_check(vk_left), gamepad_axis_value(0,gp_axislh) < 0);

		inventory = keyboard_check_pressed(ord("I"));
		action_one = keyboard_check_released(ord("E"));
		
		left_ = gamepad_axis_value(argument0,gp_axislh) < 0;
		right_ = gamepad_axis_value(argument0,gp_axislh) > 0;
		down_ = gamepad_axis_value(argument0,gp_axislv) > 0;
		up_ = gamepad_axis_value(argument0,gp_axislv) < 0;
		
		left_pressed_ = gamepad_axis_value(argument0,gp_axislh) < -0.3 or gamepad_button_check_released(argument0,gp_padl);
		right_pressed_ = gamepad_axis_value(argument0,gp_axislh) > 0.3 or gamepad_button_check_released(argument0,gp_padr);
		down_pressed_ = gamepad_axis_value(argument0,gp_axislv) > 0.3 or gamepad_button_check_released(argument0,gp_padd); 
		up_pressed_ = gamepad_axis_value(argument0,gp_axislv) < -0.3 or gamepad_button_check_released(argument0,gp_padu);

		action_one_ = gamepad_button_check(argument0,gp_shoulderrb);
		action_one_pressed_ = max (gamepad_button_check_pressed(argument0,gp_face3),gamepad_button_check_pressed(argument0,gp_shoulderrb) );
		action_two_pressed_ = max (gamepad_button_check_pressed(argument0,gp_face1), gamepad_button_check_pressed(argument0, gp_shoulderlb) );
		action_three_pressed_ = max (gamepad_button_check_pressed(argument0,gp_shoulderl) ,gamepad_button_check_pressed(argument0,gp_shoulderr));
		action_three_released_ = gamepad_button_check_released(argument0,gp_shoulderr);
		action_four_pressed_ = gamepad_button_check_pressed(argument0,gp_face1);
		start = gamepad_button_check_pressed(argument0,gp_start);
		pause_pressed_ = gamepad_button_check_pressed(argument0,gp_start);
		select_ = max(gamepad_button_check_pressed(argument0,gp_face1),gamepad_button_check_pressed(argument0,gp_start));
		respawn_ = gamepad_button_check_pressed(argument0,gp_face1);
		dialog_next_ = gamepad_button_check_released(argument0,gp_face1);
		break;
	}
	break;
/*
dash_key = max(gamepad_button_check_released(device, gp_face1),keyboard_check_pressed(   ));
attack_key = max(gamepad_button_check_pressed(device, gp_face3),keyboard_check_pressed(    ));
hold_press_attack = max(gamepad_button_check(device, gp_face3),keyboard_check(     ));
switch_weapon = max(gamepad_button_check_pressed(device, gp_face4),keyboard_check_pressed(   ));*/
	case true:
	break;

}