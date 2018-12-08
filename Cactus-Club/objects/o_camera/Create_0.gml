/// @description Insert description here
// You can write your code in this editor
target_ = o_player;
width_ = camera_get_view_width(view_camera[0]); 
height_ = camera_get_view_height(view_camera[0]); 
scale_ = view_wport[0] / width_ ;

screenshake_ = 0;
/*camera = camera_create();
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(480,320,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;*/

//instance_create_layer(x,y, "Instances", o_parallax);

y_lock = false;
x_lock = false;
xy_lock = false;