/// @description Insert description here
// You can write your code in this editor
depth = 10;
scr_input(global.pad[0]);

var hinput = right - left;
if hinput != 0 {
	//alarm[3] = room_speed*4; //hspeed_ += hinput*accelation_;
}

if (state_ == state.base) {
	scr_state_walk()
	
	if alarm[3] == -1 {
		alarm[3] = room_speed*3;	
	}
}

if state_ == state.idle {
	if right or left {
		state_ = state.base;
	}
}


#region Intro Chat
if chat == INTRO {
	
	if !instance_exists(o_text) {
		skip = false;
		alarm[0] = room_speed*1;
		scr_text("This is no way to start a morning.",0.5,view_xport[0]+125,view_yport[0]+250,choose(CHEST_PROT,CHEST_PROT_B) );
		alarm[2] = global.one_second*1;
		o_text.page = 1;
	}
	
	if mouse_check_button_pressed(mb_left)  and !skip {
		o_text.spd = 2;
		skip = true;
		alarm[1] = room_speed*.5;
	}
	
	if instance_exists(o_text) and mouse_check_button_pressed(mb_left) and mouse_y>245 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("It's afternoon, detective. Talk to people and see what they can tell us.",0.5,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
			alarm[0] = room_speed*1;
			o_text.page = 2;
			break;
			
			case 2:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I should ask around and see what they know about the guy?",0.5,view_xport[0]+125,view_yport[0]+250,choose(CHEST_PROT,CHEST_PROT_B));
			alarm[0] = room_speed*1;
			o_text.page = 3;
			break;
			
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Exactly, Find out as much as you can about our victim. That's the best place to start.",0.5,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
			//draw_text(view_xport[0]+125,view_yport[0]+250,"tuna salad");   //instance_create_layer(x,y,"UI", )
			///create_keyword("tuna salad",view_xport[0]+125,view_yport[0]+250,c_red);
			alarm[0] = room_speed*1;
			o_text.page = 4;
			break;
			
			case 4:
			alarm[0] = room_speed*1;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}
#endregion 

#region Eddyson Chat


if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Eddyson) and (state_ == state.base or state_ == state.idle )  && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover  {
	
	state_ = state.chat;
	scr_text("Hello, hello. What can I sell- er, help you with today?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
	alarm[2] = global.one_second*3;
	skip = false;
	alarm[0] = room_speed*1;
	o_text.page = PAGE_END;
	chat = EDDYSON;
}

if chat == EDDYSON {

if mouse_check_button_pressed(mb_left) and !skip {
	o_text.spd = 2;
	skip = true;
	alarm[1] = room_speed*.5;
}
	
if instance_exists(o_text) and mouse_check_button_pressed(mb_left) and mouse_y>245 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("A man's wallet tells you a lot about a man. You know, how much money he carries, where he lives, his credit card information...",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*1;
			o_text.page = 2;
			break;
			
			case 2:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Would you like to confess to something here, sir?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*1;
			o_text.page = 3;
			break;
			
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Nothing I did.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			//draw_text(view_xport[0]+125,view_yport[0]+250,"tuna salad");   //instance_create_layer(x,y,"UI", )
			///create_keyword("tuna salad",view_xport[0]+125,view_yport[0]+250,c_red);
			alarm[0] = room_speed*1;
			o_text.page = PAGE_END;
			break;
			
			case 5:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("She's a looker, ain't she boy? She could handcuff me any day, you catch my drift?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*1;
			o_text.page = 6;
			break;
			
			case 6:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I'd rather not catch anything of yours.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*1;
			o_text.page = PAGE_END;
			break;
			
			case 7:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I can tell just by looking at him! He used to be a senator but was caught doing illegal things so he retreated to Los Cactus to hide his identity and his shame. He couldn't take the pressures of society nor his guilt, so he flung himself from the building! The tragedy!",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*1;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*1;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}


}

#endregion

#region Heather Chat
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Heather) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("Make it quick, so I can get back to ignoring you.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = HEATHER;
}

if chat == HEATHER {

if mouse_check_button_pressed(mb_left)  and !skip {
	o_text.spd = 2;
	skip = true;
	alarm[1] = room_speed*.5;
}
	
if instance_exists(o_text) and mouse_check_button_pressed(mb_left) and mouse_y>245 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("He worked at Rook Law, up on the 6th floor. He's a weird guy. Well, was.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
			alarm[0] = room_speed*1;
			o_text.page = 2;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*1;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}

#endregion 

#region Stu Chat
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_reynolds) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("Steven Reynolds, at your service. Call me Stu.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = REYNOLDS;
}

if chat == REYNOLDS {

if mouse_check_button_pressed(mb_left)  and !skip {
	o_text.spd = 2;
	skip = true;
	alarm[1] = room_speed*.5;
}
	
if instance_exists(o_text) and mouse_check_button_pressed(mb_left) and mouse_y>245 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("That fella works in this building. I see him every morning. Don't know much else about him, except I've seen him for years.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
			alarm[0] = room_speed*1;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*1;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}

#endregion

#region Bizi Chat
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Bizi) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("Care for apple turnover? It used to be pie but then it is turned over.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = BIZI;
}

if chat == BIZI {

if mouse_check_button_pressed(mb_left)  and !skip {
	o_text.spd = 2;
	skip = true;
	alarm[1] = room_speed*.5;
}
	
if instance_exists(o_text) and mouse_check_button_pressed(mb_left) and mouse_y>245 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("He is quiet guy, he must be having affair! Or maybe he is government agent!",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
			alarm[0] = room_speed*1;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*1;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}

#endregion

#region Dina Chat
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Dina) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("Wish they would let me inside. I just want to see if my friend is okay!",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = DINA;
}

if chat == DINA {

if mouse_check_button_pressed(mb_left)  and !skip {
	o_text.spd = 2;
	skip = true;
	alarm[1] = room_speed*.5;
}
	
if instance_exists(o_text) and mouse_check_button_pressed(mb_left) and mouse_y>245 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I think maybe I've seen him around here before? ...I got nothing.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*1;
			o_text.page = 2;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*1;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Nah, that's just how she looks. That, or she hates everyone, which wouldn't surprise me.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*1;
			o_text.page = PAGE_END;
			break;
			
			
		}
	}
}

#endregion

#region Grace Chat
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Grace) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("What have you found, detective?",0.5,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = GRACE;
}

if chat == GRACE {

if mouse_check_button_pressed(mb_left)  and !skip {
	o_text.spd = 2;
	skip = true;
	alarm[1] = room_speed*.5;
}
	
if instance_exists(o_text) and mouse_check_button_pressed(mb_left) and mouse_y>245 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*5;
			instance_destroy(o_text,false);
			scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me. ",0.5,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
			alarm[0] = room_speed*2;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*1;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}

#endregion

#region Inventory
if inventory and chat != INTRO {
	show_inventory = !show_inventory
}

if show_inventory {
	
	/*if !instance_exists(o_inventory) {
		instance_create_layer(80,0,"UI",o_inventory); 
	}*/
		
	//22x21 Pixels, each tab selection cell
	if mouse_check_button_released(mb_left) and (device_mouse_y_to_gui(0) >=  48 and device_mouse_y_to_gui(0) <= 68 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 1;	
	}

	if mouse_check_button_released(mb_left) and (device_mouse_y_to_gui(0) >= 72 and device_mouse_y_to_gui(0) <= 92 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 2;	
	}

	if mouse_check_button_released(mb_left) and (device_mouse_y_to_gui(0) >= 95 and device_mouse_y_to_gui(0) <= 115 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 3;	
	}
	if mouse_check_button_released(mb_left) and (device_mouse_y_to_gui(0) >= 10 and device_mouse_y_to_gui(0)<= 25 ) and (device_mouse_x_to_gui(0) >= 500 and device_mouse_x_to_gui(0) <= 516 ) {
		show_inventory = false;	
	}
	#endregion
	
#region InvPage 1
	if global.inventory_page == 1 {
	//Close inventory when clicking "x"
	
	if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >=177  and device_mouse_x_to_gui(0) <=222  ) {
		if (instance_exists(o_description) and o_cursor.show_des !=1 ) {
			instance_destroy(o_description,false);
		}

		if (!instance_exists(o_description)) {
			create_description("A wallet, it belongs to Wally"/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
			o_cursor.show_des = 1;
		}

		if ( instance_exists(o_text) and mouse_check_button_pressed(mb_left) && alarm[0] <= 0 and skip ) {
		//create_descripton("Grace is vegetarian", .5, camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
			skip = false;
			
			if state.chat {
				
				switch (chat) {
				
				case EDDYSON:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("A man's wallet tells you a lot about a man. You know, how much money he carries, where he lives, his credit card information...",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
				alarm[0] = room_speed*1;
				o_text.page = 4;
				break;
				
				case HEATHER:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I know better than to rifle through somebody's wallet, even a dead somebody's. Put that thing back where it came from or so help me.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case REYNOLDS:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("Looks like genuine leather. Name brand too, it's not cheap stuff. Must've been quite the breadwinner, if he were married.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case BIZI:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("You pay me to keep quiet? You are not first, Jihui. I will not bow!",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case DINA:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("There's nothing in this wallet that would help me help you solve this case, sorry.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				}
			}
		}

	}
	}
	#endregion
	
#region InvPage 2
	if global.inventory_page == 2 {
	
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >=177  and device_mouse_x_to_gui(0) <=222  ) {
		if (instance_exists(o_description) and o_cursor.show_des !=3 ) {
			instance_destroy(o_description,false);
		}

		if (!instance_exists(o_description)) {
			create_description("A Blond girl"/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
			o_cursor.show_des = 3;
		}

		if ( instance_exists(o_text) and mouse_check_button_pressed(mb_left) && alarm[0] <= 0 and skip ) {
		//create_descripton("Grace is vegetarian", .5, camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
			skip = false;
			
			if state.chat {
				
				switch (chat) {
				
				case EDDYSON:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("She's a looker, ain't she boy? She could handcuff me any day, you catch my drift?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
				alarm[0] = room_speed*1;
				o_text.page = 6;
				break;
				
				case HEATHER:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I don't know anything about her. Just saw her this morning, that's all.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case REYNOLDS:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("Seems like a nice, put-together kind of girl. That's important in a partner.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case BIZI:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("She very pretty. Too pretty for you. Get prettier, Jihui.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case DINA:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("She's been glaring at me since I got here. Does she hate me?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = 3;
				break;
				
				}
			}
		}

		}
	  
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 242/*192*/ and device_mouse_x_to_gui(0) <= 288 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=4 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				switch (o_inventory.people_i[1]) {
		
					case people.Heather:
					create_description("She perpetually has that look of a mother who's just lost all faith she will ever get the grandkids she's been wanting when she looks at you. Her hair rivals the moon in size. If the moon were slightly smaller than her hair. She is a receptionist."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Stu:
					create_description("He's not the tallest or the brightest looking guy, but he looks like the type of guy you'd spill all your secrets to after a terrible breakup to gain the conviction to run after your one love before they board on a plane to a faraway country never to return. He's also Head of Security, it seems."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Bizi:
					create_description("Long as you can remember, Ms. Bizi has lived at the Palmer building. She smells like pie and cats. Rightfully so, as she bakes a lot of pies and keeps a lot of cats. Don’t mix those two verbs up. She also loves to tell fortunes, but she is like a senile fortune cookie on a good day."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Eddyson:
					create_description("If ever the old adage of -a well-oiled machine- were applied to a man, this would be him. Emphasis on the oil. His greasy bleach blond hair and botox-smile are the mask for what you can only perceive as a knick-knack paddy whack no-good crook in an inside-out cafe apron."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
				}
				o_cursor.show_des = 4;
			}

			if ( instance_exists(o_text) and mouse_check_button_pressed(mb_left) && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", .5, camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				
				switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[1] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						break;
					}
					
					
					break;
				}
			
			
			}
	
		}
		
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 308/*192*/ and device_mouse_x_to_gui(0) <= 354 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=5 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				o_cursor.show_des = 5;
				switch (o_inventory.people_i[2]) {
		
					case people.Heather:
					create_description("She perpetually has that look of a mother who's just lost all faith she will ever get the grandkids she's been wanting when she looks at you. Her hair rivals the moon in size. If the moon were slightly smaller than her hair. She is a receptionist."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Stu:
					create_description("He's not the tallest or the brightest looking guy, but he looks like the type of guy you'd spill all your secrets to after a terrible breakup to gain the conviction to run after your one love before they board on a plane to a faraway country never to return. He's also Head of Security, it seems."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Bizi:
					create_description("Long as you can remember, Ms. Bizi has lived at the Palmer building. She smells like pie and cats. Rightfully so, as she bakes a lot of pies and keeps a lot of cats. Don’t mix those two verbs up. She also loves to tell fortunes, but she is like a senile fortune cookie on a good day."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Eddyson:
					create_description("If ever the old adage of -a well-oiled machine- were applied to a man, this would be him. Emphasis on the oil. His greasy bleach blond hair and botox-smile are the mask for what you can only perceive as a knick-knack paddy whack no-good crook in an inside-out cafe apron."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
				}
			}

			if ( instance_exists(o_text) and mouse_check_button_pressed(mb_left) && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", .5, camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				
				switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[2] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						break;
					}
					
					
					break;
				}
			
			
			}
	
		}
		
		
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 374/*192*/ and device_mouse_x_to_gui(0) <= 420 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=6 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				switch (o_inventory.people_i[3]) {
		
					case people.Heather:
					create_description("She perpetually has that look of a mother who's just lost all faith she will ever get the grandkids she's been wanting when she looks at you. Her hair rivals the moon in size. If the moon were slightly smaller than her hair. She is a receptionist."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Stu:
					create_description("He's not the tallest or the brightest looking guy, but he looks like the type of guy you'd spill all your secrets to after a terrible breakup to gain the conviction to run after your one love before they board on a plane to a faraway country never to return. He's also Head of Security, it seems."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Bizi:
					create_description("Long as you can remember, Ms. Bizi has lived at the Palmer building. She smells like pie and cats. Rightfully so, as she bakes a lot of pies and keeps a lot of cats. Don’t mix those two verbs up. She also loves to tell fortunes, but she is like a senile fortune cookie on a good day."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Eddyson:
					create_description("If ever the old adage of -a well-oiled machine- were applied to a man, this would be him. Emphasis on the oil. His greasy bleach blond hair and botox-smile are the mask for what you can only perceive as a knick-knack paddy whack no-good crook in an inside-out cafe apron."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
				}
				o_cursor.show_des = 6;
			}

			if ( instance_exists(o_text) and mouse_check_button_pressed(mb_left) && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", .5, camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				
				switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[3] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						break;
					}
					
					
					break;
				}
			
			
			}
	
		}
		
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 440/*192*/ and device_mouse_x_to_gui(0) <= 504 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=7 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				switch (o_inventory.people_i[4]) {
		
					case people.Heather:
					create_description("She perpetually has that look of a mother who's just lost all faith she will ever get the grandkids she's been wanting when she looks at you. Her hair rivals the moon in size. If the moon were slightly smaller than her hair. She is a receptionist."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Stu:
					create_description("He's not the tallest or the brightest looking guy, but he looks like the type of guy you'd spill all your secrets to after a terrible breakup to gain the conviction to run after your one love before they board on a plane to a faraway country never to return. He's also Head of Security, it seems."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Bizi:
					create_description("Long as you can remember, Ms. Bizi has lived at the Palmer building. She smells like pie and cats. Rightfully so, as she bakes a lot of pies and keeps a lot of cats. Don’t mix those two verbs up. She also loves to tell fortunes, but she is like a senile fortune cookie on a good day."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Eddyson:
					create_description("If ever the old adage of -a well-oiled machine- were applied to a man, this would be him. Emphasis on the oil. His greasy bleach blond hair and botox-smile are the mask for what you can only perceive as a knick-knack paddy whack no-good crook in an inside-out cafe apron."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, .5, o_inventory.x+450, o_inventory.y+28);
					break;
				}
				
				o_cursor.show_des = 7;
			}

			if ( instance_exists(o_text) and mouse_check_button_pressed(mb_left) && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", .5, camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				
				switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[4] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*1;
						o_text.page = PAGE_END;
						break;
					}
					
					
					break;
				}
			
			
			}
	
		}
		
		
		
		
		
	}
	#endregion
	
#region InvPage 3
	if global.inventory_page == 3 {
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >=177  and device_mouse_x_to_gui(0) <=222  ) {
	
		if (instance_exists(o_description) and o_cursor.show_des !=2 ) {
			instance_destroy(o_description,false);
		}

		if (!instance_exists(o_description)) {
			create_description("Wally is dead!!", .5, o_inventory.x+450, o_inventory.y+28);
		/*if !global.grace_pescatarian {
			create_description("Grace is vegetarian", .5, o_inventory.x+450, o_inventory.y+28);
		} else {
			create_description("Grace is pescatarian", .5, o_inventory.x+450, o_inventory.y+28);
		}*/
		o_cursor.show_des = 2;
		}


		if ( instance_exists(o_text) and mouse_check_button_pressed(mb_left) && alarm[0] <= 0 and skip ) {	
			/*if !global.grace_pescatarian {
				if state.chat {
					instance_destroy(o_text,false);
					scr_text("Aren't you a vegetarian, Grace?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
					//global.grace_pescatarian = true;
					alarm[0] = room_speed*1;
					o_text.page = 6;
				}
			}*/
			skip = false;
			
			if state.chat {
				
				switch (chat) {
				
				case EDDYSON:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I can tell just by looking at him! He used to be a senator but was caught doing illegal things so he retreated to Los Cactus to hide his identity and his shame. He couldn't take the pressures of society nor his guilt, so he flung himself from the building! The tragedy!",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				global.peopleEddyson= true;
				if o_inventory.people_i[1] == noone {
					o_inventory.people_i[1] = people.Eddyson;
				} else if o_inventory.people_i[2] == noone {
					o_inventory.people_i[2] = people.Eddyson;
				} else if o_inventory.people_i[3] == noone {
					o_inventory.people_i[3] = people.Eddyson;
				} else if o_inventory.people_i[4] == noone {
					o_inventory.people_i[4] = people.Eddyson;
				}
				break;
				
				case HEATHER:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("He worked at Rook Law, up on the 6th floor. He's a weird guy. Well, was.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
				global.peopleHeather = true;
				if o_inventory.people_i[1] == noone {
					o_inventory.people_i[1] = people.Heather;
				} else if o_inventory.people_i[2] == noone {
					o_inventory.people_i[2] = people.Heather;
				} else if o_inventory.people_i[3] == noone {
					o_inventory.people_i[3] = people.Heather;
				} else if o_inventory.people_i[4] == noone {
					o_inventory.people_i[4] = people.Heather;
				}
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case REYNOLDS:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("That fella works in this building. I see him every morning. Don't know much else about him, except I've seen him for years.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
				//global.grace_pescatarian = true;
				global.peopleStu = true;
				if o_inventory.people_i[1] == noone {
					o_inventory.people_i[1] = people.Stu;
				} else if o_inventory.people_i[2] == noone {
					o_inventory.people_i[2] = people.Stu;
				} else if o_inventory.people_i[3] == noone {
					o_inventory.people_i[3] = people.Stu;
				} else if o_inventory.people_i[4] == noone {
					o_inventory.people_i[4] = people.Stu;
				}
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case BIZI:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("He is quiet guy, he must be having affair! Or maybe he is government agent!",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
				//global.grace_pescatarian = true;
				global.peopleBizi = true;
				if o_inventory.people_i[1] == noone {
					o_inventory.people_i[1] = people.Bizi;
				} else if o_inventory.people_i[2] == noone {
					o_inventory.people_i[2] = people.Bizi;
				} else if o_inventory.people_i[3] == noone {
					o_inventory.people_i[3] = people.Bizi;
				} else if o_inventory.people_i[4] == noone {
					o_inventory.people_i[4] = people.Bizi;
				}
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				case DINA:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I think maybe I've seen him around here before? ...I got nothing.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*1;
				o_text.page = PAGE_END;
				break;
				
				}
			}
			
		}
		
		}
	
	
	} 


}
#endregion

#region Animation

switch state_ {

	case state.idle:
	anim_ = anim.sleep;
	switch ( dir_ ) {
	
			case face_right:
			sprite_index = s_prot_idle_anim_right;
			break;
	
			case face_left:
			sprite_index = s_prot_idle_anim_left;
			break;
	
	}
	break;
	
	case state.base:

	switch (anim_) {
	
		case anim.idle:
	
		switch ( dir_ ) {
	
			case face_right:
			sprite_index = spr_prot;
			break;
	
			case face_left:
			sprite_index = spr_prot_left;
			break;
	
		}
		break;
	
		case anim.walk:
	
		switch ( dir_ ) {
	
			case face_right:
			sprite_index = spr_prot_walking;
			break;
	
			case face_left:
			sprite_index = spr_prot_walking_left;
			break;
		}
	}
	break;
	
	
	
	case state.chat:
	anim_ = anim.idle;
	switch ( dir_ ) {
	
			case face_right:
			sprite_index = spr_prot;
			break;
	
			case face_left:
			sprite_index = spr_prot_left;
			break;
	}
	break;


}

#endregion

if !instance_exists(o_text) and state_ == state.base { 
	state_ = state.base;
} else if instance_exists(o_text) {
	state_ = state.chat;
}

#region OLD

/*if !instance_exists(o_inventory) {	
	if mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, o_Grace) && mouse_y < 244 and state_ == state.chat {
		if instance_exists(o_text) 
			instance_destroy(o_text,false);
			state_ = state.base;
	}
}*/


/*

if state == state.chat {
	if instance_exists(o_text) and mouse_check_button_released(mb_left) && !position_meeting(mouse_x,mouse_y, o_keyword) and ( position_meeting(mouse_x, mouse_y, o_Grace) or position_meeting(mouse_x, mouse_y, o_text)  )  && alarm[0] <= 0 {
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			instance_destroy(o_text,false);
			scr_text("Hello, Grace. What did you have for lunch today?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			
			alarm[0] = room_speed*1;
			o_text.page = 2;
			break;
			
			case 2:
			instance_destroy(o_text,false);
			scr_text("I had tuna salad. Here try a bite.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			//draw_text(view_xport[0]+125,view_yport[0]+250,"tuna salad");   //instance_create_layer(x,y,"UI", )
			///create_keyword("tuna salad",view_xport[0]+125,view_yport[0]+250,c_red);
			with ( instance_create_layer(239,270, "UI",o_keyword)) {
				sprite_index = s_tunasalad;
				page_ = 3;
			}
			alarm[0] = room_speed*1;
			o_text.page = 3;
			break;
			
			case 3:
			instance_destroy(o_text,false);
			state = state.base;
			break;
			
			case 5:
			instance_destroy(o_text,false);
			if instance_exists(o_keyword) then instance_destroy(o_keyword,false);
			scr_text("Aren't you a vegetarian, Grace?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*1;
			o_text.page = 6;
			break;
			
			case 6:
			instance_destroy(o_text,false);
			scr_text("I'm pescatarian, actually.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			global.grace_pescatarian = true;
			alarm[0] = room_speed*1;
			//o_text.page = 5;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			instance_destroy(o_text,false);
			state = state.base;
			break;
			
		}
	}
}
*/
#endregion





