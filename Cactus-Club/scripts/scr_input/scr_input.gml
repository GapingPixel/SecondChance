right= max(keyboard_check(vk_right), gamepad_axis_value(0,gp_axislh) > 0 );
left = max(keyboard_check(vk_left), gamepad_axis_value(0,gp_axislh) < 0);

inventory = keyboard_check_pressed(ord("I"));
action_one = keyboard_check_released(ord("E"));