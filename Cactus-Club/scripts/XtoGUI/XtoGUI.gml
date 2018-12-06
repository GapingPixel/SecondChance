///XtoGUI(x)

var t = application_get_position();
return (argument0 - camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) * 0.5))* (t[2] - t[0]);