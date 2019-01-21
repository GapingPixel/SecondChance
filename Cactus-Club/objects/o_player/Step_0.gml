/// @description Insert description here
// You can write your code in this editor
depth = 10;
scr_input(global.pad[0]);

var hinput = right - left;
if hinput != 0 {
	//alarm[3] = room_speed*4; //hspeed_ += hinput*accelation_;
}

if (state_ == state.base) {
	if !show_inventory {
		scr_state_walk()
	}
	if alarm[3] == -1 {
		alarm[3] = room_speed*3;	
	}
}

if state_ == state.idle {
	if right or left {
		state_ = state.base;
	}
}


#region Wally Corpse 

if action_one && position_meeting(mouse_x, mouse_y, o_dead_body) and (state_ == state.base or state_ == state.idle )  && alarm[0] <= 0 and cursor_sprite  == s_clue_cursor {
	
	state_ = state.inspect;
	scr_text("Not much I can tell by just looking at the guy.",5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
	alarm[2] = global.one_second*3;
	skip = false;
	alarm[0] = room_speed*.5;
	o_text.page = 1;
	chat = WALLYBODY;
}

if chat == WALLYBODY {

if action_one_pressed_ and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}
	
if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Try asking around to find out more about him.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}


}

#endregion

#region Bus Stop

if action_one && position_meeting(mouse_x, mouse_y, o_bus_stop) and (state_ == state.base or state_ == state.idle )  && alarm[0] <= 0 and cursor_sprite  == s_clue_cursor {
	
	state_ = state.inspect;
	scr_text("I should probably stay at the crime scene... though I do crave a burger.",5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
	alarm[2] = global.one_second*3;
	skip = false;
	alarm[0] = room_speed*.5;
	o_text.page = PAGE_END;
	chat = BUSSTOP;
}

if chat == BUSSTOP {

if action_one_pressed_ and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}


if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}

#endregion

#region Gate to Alley

if action_one && position_meeting(mouse_x, mouse_y, o_gateToAlley) and (state_ == state.base or state_ == state.idle )  && alarm[0] <= 0 and cursor_sprite  == s_clue_cursor {
	
	state_ = state.inspect;
	scr_text("It's locked, and I don't have a key. ",5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
	alarm[2] = global.one_second*3;
	skip = false;
	alarm[0] = room_speed*.5;
	o_text.page = PAGE_END;
	chat = GATE;
}

if chat == GATE {

if action_one_pressed_ and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}

#endregion

#region Intro Chat
if chat == INTRO {
	
	if !instance_exists(o_text) {
		skip = false;
		alarm[0] = room_speed*.5;
		scr_text("This is no way to start a morning.",1,view_xport[0]+125,view_yport[0]+250,choose(CHEST_PROT,CHEST_PROT_B) );
		alarm[2] = global.one_second*1;
		o_text.page = 1;
	}
	
	if action_one_pressed_  and !skip {
		o_text.spd = 5;
		skip = true;
		alarm[1] = room_speed*.5;
	}
	
	if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("It's afternoon, detective. Talk to people and see what they can tell us.",1,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
			alarm[0] = room_speed*.5;
			o_text.page = 2;
			break;
			
			case 2:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I should ask around and see what they know about the guy?",1,view_xport[0]+125,view_yport[0]+250,choose(CHEST_PROT,CHEST_PROT_B));
			alarm[0] = room_speed*.5;
			o_text.page = 3;
			break;
			
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Exactly, Find out as much as you can about our victim. That's the best place to start.",1,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
			//draw_text(view_xport[0]+125,view_yport[0]+250,"tuna salad");   //instance_create_layer(x,y,"UI", )
			///create_keyword("tuna salad",view_xport[0]+125,view_yport[0]+250,c_red);
			alarm[0] = room_speed*.5;
			o_text.page = 4;
			break;
			
			case 4:
			alarm[0] = room_speed*.5;
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


if action_one && position_meeting(mouse_x, mouse_y, o_Eddyson) and (state_ == state.base or state_ == state.idle )  && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	
	first_line = true;	
	state_ = state.chat;
	scr_text("    >Talk                     >Interact                          >Nevermind        Hello, hello. What can I sell- er, help you with today?",5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
	draw_sprite(s_arrow_select1,0,view_xport[0]+125,view_yport[0]+250);
	alarm[2] = global.one_second*3;
	skip = false;
	alarm[0] = room_speed*.5;
	o_text.page = PAGE_END;
	chat = EDDYSON;
}

if chat == EDDYSON {

if action_one_pressed_ and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
} else if o_text.option = 2 and action_one {
	show_inventory = true;
} else if o_text.option = 3 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
}
	
if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		first_line = false;	
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("A man's license tells you a lot about a man. You know, where he lives, his medical service number, his age, his weight and height…",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = 2;
			break;
			
			case 2:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Would you like to confess to something here, sir?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 3;
			break;
			
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Nothing I did.",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			//draw_text(view_xport[0]+125,view_yport[0]+250,"tuna salad");   //instance_create_layer(x,y,"UI", )
			///create_keyword("tuna salad",view_xport[0]+125,view_yport[0]+250,c_red);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			case 5:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("She's a looker, ain't she boy? She could handcuff me any day, you catch my drift?",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = 6;
			break;
			
			case 6:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I'd rather not catch anything of yours.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			case 7:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I can tell just by looking at him! He used to be a senator but was caught doing illegal things so he retreated to Los Cactus to hide his identity and his shame. He couldn't take the pressures of society nor his guilt, so he flung himself from the building! The tragedy!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			case 10:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("    >Talk                     >Interact                    >Nevermind",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
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
if action_one && position_meeting(mouse_x, mouse_y, o_Heather) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	first_line = true;
	skip = false;
	alarm[0] = room_speed*.5;
	state_ = state.chat;
	scr_text("    >Talk                     >Interact                          >Nevermind            Make it quick, so I can get back to ignoring you.",5,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = HEATHER;
}

if chat == HEATHER {

if action_one_pressed_  and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
} else if o_text.option = 2 and action_one {
	show_inventory = true;
} else if o_text.option = 3 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
}
	
if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip  {
		skip = false;
		first_line = false;
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("He worked at Rook Law, up on the 6th floor. He's a weird guy. Well, was.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
			alarm[0] = room_speed*.5;
			o_text.page = 2;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
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
if action_one && position_meeting(mouse_x, mouse_y, o_reynolds) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	first_line = true;
	skip = false;
	alarm[0] = room_speed*.5;
	state_ = state.chat;
	scr_text("    >Talk                     >Interact                          >Nevermind         Steven Reynolds, at your service. Call me Stu.",5,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = REYNOLDS;
}

if chat == REYNOLDS {

if action_one_pressed_  and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
} else if o_text.option = 2 and action_one {
	show_inventory = true;
} else if o_text.option = 3 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
}
	
if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		first_line = false;
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("That fella works in this building. I see him every morning. Don't know much else about him, except I've seen him for years.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
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
if action_one && position_meeting(mouse_x, mouse_y, o_Bizi) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	first_line = true;
	skip = false;
	alarm[0] = room_speed*.5;
	state_ = state.chat;
	scr_text("    >Talk                     >Interact                          >Nevermind          Care for apple turnover? It used to be pie but then it is turned          over.",5,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = BIZI;
}

if chat == BIZI {

if action_one_pressed_  and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
} else if o_text.option = 2 and action_one {
	show_inventory = true;
} else if o_text.option = 3 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
}
	
if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		first_line = false;
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("He is quiet guy, he must be having affair! Or maybe he is government agent!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
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
if action_one && position_meeting(mouse_x, mouse_y, o_Dina) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	first_line = true;
	skip = false;
	alarm[0] = room_speed*.5;
	state_ = state.chat;
	scr_text("    >Talk                     >Interact                          >Nevermind         Wish they would let me inside. I just want to see if my friend is okay!",5,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = DINA;
}

if chat == DINA {

if action_one_pressed_  and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
} else if o_text.option = 2 and action_one {
	show_inventory = true;
} else if o_text.option = 3 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
}
	
if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		first_line = false;
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I think maybe I've seen him around here before? ...I got nothing.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = 2;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Nah, that's just how she looks. That, or she hates everyone, which wouldn't surprise me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			
		}
	}
}

#endregion

#region Grace Chat
if action_one && position_meeting(mouse_x, mouse_y, o_Grace) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	first_line = true;
	skip = false;
	alarm[0] = room_speed*.5;
	state_ = state.chat;
	scr_text("    >Talk                     >Interact                          >Nevermind            What have you found, detective?",5,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = GRACE;
}

if chat == GRACE {

if action_one_pressed_  and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
} else if o_text.option = 2 and action_one {
	show_inventory = true;
} else if o_text.option = 3 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
}
	
if instance_exists(o_text) and action_one_pressed_ and mouse_y>270 && alarm[0] <= 0 and skip {
		skip = false;
		first_line = false;
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*5;
			instance_destroy(o_text,false);
			scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me. ",1,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
			alarm[0] = room_speed*2;
			o_text.page = PAGE_END;
			break;
			
			case PAGE_END:
			alarm[0] = room_speed*.5;
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
	anim_ = anim.idle;
	/*if !instance_exists(o_inventory) {
		instance_create_layer(80,0,"UI",o_inventory); 
	}*/
		
	//22x21 Pixels, each tab selection cell
	if action_one and (device_mouse_y_to_gui(0) >=  48 and device_mouse_y_to_gui(0) <= 68 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 1;	
	}

	if action_one and (device_mouse_y_to_gui(0) >= 72 and device_mouse_y_to_gui(0) <= 92 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 2;	
	}

	if action_one and (device_mouse_y_to_gui(0) >= 95 and device_mouse_y_to_gui(0) <= 115 ) and (device_mouse_x_to_gui(0) >= 125 and device_mouse_x_to_gui(0) <= 145 ) {
		global.inventory_page = 3;	
	}
	if action_one and (device_mouse_y_to_gui(0) >= 10 and device_mouse_y_to_gui(0)<= 25 ) and (device_mouse_x_to_gui(0) >= 500 and device_mouse_x_to_gui(0) <= 516 ) {
		show_inventory = false;	
		if state_ = state.chat {
			alarm[0] = room_speed*.5;
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
		}
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
			create_description("A wallet, it belongs to Wally"/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
			o_cursor.show_des = 1;
		}

		if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
		//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
			skip = false;
			first_line = false;
			if state.chat {
				
				switch (chat) {
				
				case EDDYSON:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("A man's license tells you a lot about a man. You know, where he lives, his medical service number, his age, his weight and height...",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
				alarm[0] = room_speed*.5;
				o_text.page = 2;
				
				break;
				
				case HEATHER:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("What about it? He never drove anywhere, he lives down a few blocks.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				
				break;
				
				case REYNOLDS:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("Are you going to drive Wally’s car? You two don’t look anything alike.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				
				break;
				
				case BIZI:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I remember before people need driver license. Easy solution, drive better!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				
				break;
				
				case DINA:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("It looks like it expired a couple months ago. He won’t need to renew it now.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				
				break;
				
				}
			}
			show_inventory = false;
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
			create_description("A Blond girl"/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
			o_cursor.show_des = 3;
		}

		if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
		//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
			skip = false;
			first_line = false;
			alarm[0] = room_speed*.5;
			if state.chat {
				
				switch (chat) {
				
				case EDDYSON:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("She's a looker, ain't she boy? She could handcuff me any day, you catch my drift?",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
				alarm[0] = room_speed*.5;
				o_text.page = 6;
				break;
				
				case HEATHER:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I don't know anything about her. Just saw her this morning, that's all.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				break;
				
				case REYNOLDS:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("Seems like a nice, put-together kind of girl. That's important in a partner.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				break;
				
				case BIZI:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("She very pretty. Too pretty for you. Get prettier, Jihui.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				break;
				
				case DINA:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("She's been glaring at me since I got here. Does she hate me?",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = 3;
				break;
				
				}
			}
			show_inventory = false;
		}

		}
	  
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 242/*192*/ and device_mouse_x_to_gui(0) <= 288 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=4 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				switch (o_inventory.people_i[1]) {
		
					case people.Heather:
					create_description("She perpetually has that look of a mother who's just lost all faith she will ever get the grandkids she's been wanting when she looks at you. Her hair rivals the moon in size. If the moon were slightly smaller than her hair. She is a receptionist."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Stu:
					create_description("He's not the tallest or the brightest looking guy, but he looks like the type of guy you'd spill all your secrets to after a terrible breakup to gain the conviction to run after your one love before they board on a plane to a faraway country never to return. He's also Head of Security, it seems."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Bizi:
					create_description("Long as you can remember, Ms. Bizi has lived at the Palmer building. She smells like pie and cats. Rightfully so, as she bakes a lot of pies and keeps a lot of cats. Don’t mix those two verbs up. She also loves to tell fortunes, but she is like a senile fortune cookie on a good day."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Eddyson:
					create_description("If ever the old adage of -a well-oiled machine- were applied to a man, this would be him. Emphasis on the oil. His greasy bleach blond hair and botox-smile are the mask for what you can only perceive as a knick-knack paddy whack no-good crook in an inside-out cafe apron."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
				}
				o_cursor.show_des = 4;
			}

			if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				first_line = false;
				switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[1] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
					}
					
					
					break;
				}
			
				show_inventory = false;
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
					create_description("She perpetually has that look of a mother who's just lost all faith she will ever get the grandkids she's been wanting when she looks at you. Her hair rivals the moon in size. If the moon were slightly smaller than her hair. She is a receptionist."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Stu:
					create_description("He's not the tallest or the brightest looking guy, but he looks like the type of guy you'd spill all your secrets to after a terrible breakup to gain the conviction to run after your one love before they board on a plane to a faraway country never to return. He's also Head of Security, it seems."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Bizi:
					create_description("Long as you can remember, Ms. Bizi has lived at the Palmer building. She smells like pie and cats. Rightfully so, as she bakes a lot of pies and keeps a lot of cats. Don’t mix those two verbs up. She also loves to tell fortunes, but she is like a senile fortune cookie on a good day."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Eddyson:
					create_description("If ever the old adage of -a well-oiled machine- were applied to a man, this would be him. Emphasis on the oil. His greasy bleach blond hair and botox-smile are the mask for what you can only perceive as a knick-knack paddy whack no-good crook in an inside-out cafe apron."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
				}
			}

			if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				first_line = false;
				alarm[0] = room_speed*.5;
				switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[2] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
					}
					
					
					break;
				}
			
			show_inventory = false;
			}
	
		}
		
		
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 374/*192*/ and device_mouse_x_to_gui(0) <= 420 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=6 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				switch (o_inventory.people_i[3]) {
		
					case people.Heather:
					create_description("She perpetually has that look of a mother who's just lost all faith she will ever get the grandkids she's been wanting when she looks at you. Her hair rivals the moon in size. If the moon were slightly smaller than her hair. She is a receptionist."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Stu:
					create_description("He's not the tallest or the brightest looking guy, but he looks like the type of guy you'd spill all your secrets to after a terrible breakup to gain the conviction to run after your one love before they board on a plane to a faraway country never to return. He's also Head of Security, it seems."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Bizi:
					create_description("Long as you can remember, Ms. Bizi has lived at the Palmer building. She smells like pie and cats. Rightfully so, as she bakes a lot of pies and keeps a lot of cats. Don’t mix those two verbs up. She also loves to tell fortunes, but she is like a senile fortune cookie on a good day."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Eddyson:
					create_description("If ever the old adage of -a well-oiled machine- were applied to a man, this would be him. Emphasis on the oil. His greasy bleach blond hair and botox-smile are the mask for what you can only perceive as a knick-knack paddy whack no-good crook in an inside-out cafe apron."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
				}
				o_cursor.show_des = 6;
			}

			if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				first_line = false;
				alarm[0] = room_speed*.5;
				switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[3] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
					}
					
					
					break;
				}
			
			show_inventory = false;
			}
	
		}
		
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 440/*192*/ and device_mouse_x_to_gui(0) <= 504 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=7 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				switch (o_inventory.people_i[4]) {
		
					case people.Heather:
					create_description("She perpetually has that look of a mother who's just lost all faith she will ever get the grandkids she's been wanting when she looks at you. Her hair rivals the moon in size. If the moon were slightly smaller than her hair. She is a receptionist."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Stu:
					create_description("He's not the tallest or the brightest looking guy, but he looks like the type of guy you'd spill all your secrets to after a terrible breakup to gain the conviction to run after your one love before they board on a plane to a faraway country never to return. He's also Head of Security, it seems."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Bizi:
					create_description("Long as you can remember, Ms. Bizi has lived at the Palmer building. She smells like pie and cats. Rightfully so, as she bakes a lot of pies and keeps a lot of cats. Don’t mix those two verbs up. She also loves to tell fortunes, but she is like a senile fortune cookie on a good day."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
		
					case people.Eddyson:
					create_description("If ever the old adage of -a well-oiled machine- were applied to a man, this would be him. Emphasis on the oil. His greasy bleach blond hair and botox-smile are the mask for what you can only perceive as a knick-knack paddy whack no-good crook in an inside-out cafe apron."/*"A nearly full pack of cigarettes of the SEAGULL brand."*/, 1, o_inventory.x+450, o_inventory.y+28);
					break;
				}
				
				o_cursor.show_des = 7;
			}

			if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				first_line = false;
				alarm[0] = room_speed*.5;
				switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[4] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
					}
					
					
					break;
				}
			
			show_inventory = false;
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
			create_description("Wally is dead!!", 1, o_inventory.x+450, o_inventory.y+28);
		/*if !global.grace_pescatarian {
			create_description("Grace is vegetarian", 1 o_inventory.x+450, o_inventory.y+28);
		} else {
			create_description("Grace is pescatarian", .5, o_inventory.x+450, o_inventory.y+28);
		}*/
		o_cursor.show_des = 2;
		}


		if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {	
			/*if !global.grace_pescatarian {
				if state.chat {
					instance_destroy(o_text,false);
					scr_text("Aren't you a vegetarian, Grace?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
					//global.grace_pescatarian = true;
					alarm[0] = room_speed*.5;
					o_text.page = 6;
				}
			}*/
			skip = false;
			first_line = false;
			alarm[0] = room_speed*.5;
			if state.chat {
				
				switch (chat) {
				
				case EDDYSON:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I can tell just by looking at him! He used to be a senator but was caught doing illegal things so he retreated to Los Cactus to hide his identity and his shame. He couldn't take the pressures of society nor his guilt, so he flung himself from the building! The tragedy!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
				alarm[0] = room_speed*.5;
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
				scr_text("He worked at Rook Law, up on the 6th floor. He's a weird guy. Well, was.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
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
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				break;
				
				case REYNOLDS:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("That fella works in this building. I see him every morning. Don't know much else about him, except I've seen him for years.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
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
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				break;
				
				case BIZI:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("He is quiet guy, he must be having affair! Or maybe he is government agent!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
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
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				break;
				
				case DINA:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I think maybe I've seen him around here before? ...I got nothing.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
				//global.grace_pescatarian = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				break;
				
				}
			}
		show_inventory = false;	
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
	
	case state.inspect:
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

/*if !instance_exists(o_text) and state_ == state.base { 
	state_ = state.base;
} else if instance_exists(o_text) {
	state_ = state.chat;
}*/

#region OLD

/*if !instance_exists(o_inventory) {	
	if action_one_pressed_ && !position_meeting(mouse_x, mouse_y, o_Grace) && mouse_y < 244 and state_ == state.chat {
		if instance_exists(o_text) 
			instance_destroy(o_text,false);
			state_ = state.base;
	}
}*/


/*

if state == state.chat {
	if instance_exists(o_text) and action_one && !position_meeting(mouse_x,mouse_y, o_keyword) and ( position_meeting(mouse_x, mouse_y, o_Grace) or position_meeting(mouse_x, mouse_y, o_text)  )  && alarm[0] <= 0 {
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			instance_destroy(o_text,false);
			scr_text("Hello, Grace. What did you have for lunch today?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			
			alarm[0] = room_speed*.5;
			o_text.page = 2;
			break;
			
			case 2:
			instance_destroy(o_text,false);
			scr_text("I had tuna salad. Here try a bite.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			//draw_text(view_xport[0]+125,view_yport[0]+250,"tuna salad");   //instance_create_layer(x,y,"UI", )
			///create_keyword("tuna salad",view_xport[0]+125,view_yport[0]+250,c_red);
			with ( instance_create_layer(239,270, "UI",o_keyword)) {
				sprite_index = s_tunasalad;
				page_ = 3;
			}
			alarm[0] = room_speed*.5;
			o_text.page = 3;
			break;
			
			case 3:
			instance_destroy(o_text,false);
			state = state.base;
			break;
			
			case 5:
			instance_destroy(o_text,false);
			if instance_exists(o_keyword) then instance_destroy(o_keyword,false);
			scr_text("Aren't you a vegetarian, Grace?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 6;
			break;
			
			case 6:
			instance_destroy(o_text,false);
			scr_text("I'm pescatarian, actually.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			global.grace_pescatarian = true;
			alarm[0] = room_speed*.5;
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





