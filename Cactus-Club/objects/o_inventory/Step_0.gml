/// @description Insert description here
// You can write your code in this editor
if global.inventory_page == 1 {
	if !instance_exists(o_clue) { 
		instance_create_layer(camera_get_view_border_x(view_camera[0])+146,camera_get_view_border_y(view_camera[0])+24,"UI",o_clue);
	}
}

if global.inventory_page == 2 {
	if !instance_exists(o_people) { 
		instance_create_layer(camera_get_view_border_x(view_camera[0])+147,camera_get_view_border_y(view_camera[0])+26,"UI",o_people);
	}
	
	
	switch (people_i[1]) {
		
		case people.Heather:
		if !instance_exists(o_people_Heather)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+212,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Heather);
		}
		break;
		
		case people.Stu:
		if !instance_exists(o_people_Stu)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+212,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Stu);
		}
		break;
		
		case people.Bizi:
		if !instance_exists(o_people_Bizi)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+212,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Bizi);
		}
		break;
		
		case people.Eddyson:
		if !instance_exists(o_people_Eddyson)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+212,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Eddyson);
		}
		break;
	}
	
	switch (people_i[2]) {
		
		case people.Heather:
		if !instance_exists(o_people_Heather)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+277,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Heather);
		}
		break;
		
		case people.Stu:
		if !instance_exists(o_people_Stu)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+277,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Stu);
		}
		break;
		
		case people.Bizi:
		if !instance_exists(o_people_Bizi)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+277,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Bizi);
		}
		break;
		
		case people.Eddyson:
		if !instance_exists(o_people_Eddyson)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+277,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Eddyson);
		}
		break;
	}
	
	switch (people_i[3]) {
		
		case people.Heather:
		if !instance_exists(o_people_Heather)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+342,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Heather);
		}
		break;
		
		case people.Stu:
		if !instance_exists(o_people_Stu)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+342,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Stu);
		}
		break;
		
		case people.Bizi:
		if !instance_exists(o_people_Bizi)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+342,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Bizi);
		}
		break;
		
		case people.Eddyson:
		if !instance_exists(o_people_Eddyson)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+342,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Eddyson);
		}
		break;
	}
	
	switch (people_i[4]) {
		
		case people.Heather:
		if !instance_exists(o_people_Heather)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+407,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Heather);
		}
		break;
		
		case people.Stu:
		if !instance_exists(o_people_Stu)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+407,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Stu);
		}
		break;
		
		case people.Bizi:
		if !instance_exists(o_people_Bizi)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+407,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Bizi);
		}
		break;
		
		case people.Eddyson:
		if !instance_exists(o_people_Eddyson)  { 
			instance_create_layer(camera_get_view_border_x(view_camera[0])+407,camera_get_view_border_y(view_camera[0])+26,"UI",o_people_Eddyson);
		}
		break;
	}
	
	
	if !instance_exists(o_people_Stu) and global.peopleStu { 
		
	}
	
	if !instance_exists(o_people_Bizi) and global.peopleBizi { 
		
	}
	
	if !instance_exists(o_people_Eddyson) and global.peopleEddyson { 
		
	}
}

if global.inventory_page == 3 and global.wallyclue {
	if !instance_exists(o_POQ) { 
		instance_create_layer(camera_get_view_border_x(view_camera[0])+146,camera_get_view_border_y(view_camera[0])+24,"UI",o_POQ);
	}
} 
