if not instance_exists(target_) exit;

with target_ {
	if place_meeting(x,y,o_x_lock) /*and point_distance(x,y,o_x_lock.x,o_x_lock.y) < 50*/ { 
		o_camera.x_lock = true;
	} else { 
		o_camera.x_lock = false;
	}
	
	if place_meeting(x,y,o_y_lock) /*and point_distance(x,y,o_x_lock.x,o_x_lock.y) < 50*/ { 
		o_camera.y_lock = true;
	} else { 
		o_camera.y_lock = false;
	}
	
	if place_meeting(x,y,o_xy_lock) /*and point_distance(x,y,o_x_lock.x,o_x_lock.y) < 50*/ { 
		o_camera.xy_lock = true;
	} else { 
		o_camera.xy_lock = false;
	}
	
	
	
} 



x += random_range(-screenshake_, screenshake_);
y += random_range(-screenshake_, screenshake_);

if x_lock {
	var x_lock_ = instance_nearest(o_player.x,o_player.y,o_x_lock);
	var _target_x = x_lock_.x;
	var _target_y = target_.y;

} else if y_lock {

	var y_lock_ = instance_nearest(o_player.x,o_player.y,o_y_lock);
	var _target_x = target_.x;
	var _target_y = y_lock_.y;

} else if xy_lock {

	var xy_lock_ = instance_nearest(o_player.x,o_player.y,o_xy_lock);
	var _target_x = xy_lock_.x;
	var _target_y = xy_lock_.y;

} else {
	
var _target_x = target_.x;
var _target_y = target_.y;

}

x = lerp(x, _target_x, 0.1);
y = lerp(y, _target_y-8, 0.1);
x = round_n(x, 1/scale_);
y = round_n(y, 1/scale_);

var lock_ = x-width_/2;
lock_ = clamp(lock_,0,room_width);
camera_set_view_pos(view_camera[0], lock_, y-height_/1.2);


//room_width