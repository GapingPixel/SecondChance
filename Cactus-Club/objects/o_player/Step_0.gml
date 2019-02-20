/// @description Dialogs
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

///Clues
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

///Chats

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

if o_text.option = 1 and action_one and diagEddyson <= 2 {
	alarm[0] = room_speed*.5;
	alarm[2] = global.one_second*3;
	if instance_exists(o_text) then instance_destroy(o_text,false);
	//Diag 1 
	switch (diagEddyson) {
	
		case 1:
		scr_text("The name is Eddyson, Thomas Eddyson! I sell everyday items for your everyday needs! Buy now, regret later!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
		o_text.page = 11;
		break;
	
		case 2:
		scr_text("There was a loud scream, then a thundering crash! The man was dead! But I saw NOTHING!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
		o_text.page = 15;
		break;
	}
	diagEddyson++;
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
			
			
			#region Diag1
			case 11:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I have wares that can help people in this time of upheaval! For a cheap fee, you'll be feeling free!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = 12;
			break;
			
			case 12:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("So, you're here to profit off this man's death.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 13;
			break;
			
			case 13:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("That's a nasty way of putting it. I call my practice SOPE: Service-Oriented Philanthropic Entrepreneurship.",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = 14;
			break;
			
			case 14:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("SOPE? That's a fancy way of saying you want to clean me out.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			#endregion
			
			#region Diag2
			case 15:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Okay.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT_B);
			alarm[0] = room_speed*.5;
			o_text.page = 16;
			break;
			
			case 16:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("...but I would have if I were wearing my CrimeBuster Glasses of Omnipresence™! They can be yours for only $19.99! You'll really SEE the difference!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = 17;
			break;
			
			case 17:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Could I convince you to give me a law enforcement discount?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 18;
			break;
			
			case 18:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("D-discount? In my dictionary, there's nothing between the words Disco and Discovery. I don't plan to fill it with a strange foreign word you just made up!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = 19;
			break;
			
			case 19:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("So you didn't witness anything and won't sell me the gadget for cheap.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 20;
			break;
			
			case 20:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Wait, ask again and I'll think of something good to have witnessed.",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			#endregion
			
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

if action_one_pressed_ and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one and diagHeather == 1 {
	alarm[0] = room_speed*.5;
	alarm[2] = global.one_second*3;
	if instance_exists(o_text) then instance_destroy(o_text,false);
	//Diag 1 
	switch (diagHeather) {
	
		case 1:
		scr_text("Name's on the nameplate.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
		o_text.page = 2;
		diagHeather++
		break;
	}
	
	
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
			
			case 2:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Heather Mollingue.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 3;
			break;
			
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Congrats, you can read.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
			alarm[0] = room_speed*.5;
			o_text.page = 4;
			break;
			
			case 4:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("What do you think the cause of death is?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 5;
			break;
			
			case 5:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I'll take a wild guess and say the ground.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
			alarm[0] = room_speed*.5;
			o_text.page = 6;
			break;
			
			case 6:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I'm more asking who are you, not who are you. Get it?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 7;
			break;
			
			case 7:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("No. I'm the building receptionist, not much else to it.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//People Tall
			case 8:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Congratulations! So, will there be many hot bridesmaids?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 9;
			break;
			
			case 9:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("You're not invited to the wedding.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
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

if o_text.option = 1 and action_one and diagStu > 2 {
	alarm[0] = room_speed*.5;
	alarm[2] = global.one_second*3;
	if instance_exists(o_text) then instance_destroy(o_text,false);
	//Diag 1 
	switch (diagStu) {
	
		case 1:
		scr_text("My name is Steven Reynolds, but you can call me Stu. I'm the security guard of this building on weekdays.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
		o_text.page = PAGE_END;
		diagStu++
		break;
		
		case 2:
		scr_text("I was just coming back from my smoke break when the body fell. Gave me a shock. I called the police right away.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
		o_text.page = PAGE_END;
		diagStu++
		break;
	}
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

if o_text.option == 1 and action_one {
	alarm[0] = room_speed*.5;
	instance_destroy(o_text,false);
	state_ = state.base;
	chat = noone;
} else if o_text.option == 2 and action_one {
	show_inventory = true;
} else if o_text.option == 3 and action_one {
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

if o_text.option == 1 and action_one and diagDina <= 7  {
	alarm[0] = room_speed*.5;
	alarm[2] = global.one_second*3;
	if instance_exists(o_text) then instance_destroy(o_text,false);
	//Diag 1 
	switch (diagDina) {
	
	case 1:
	scr_text("The name is Dina Felds, lawyer extraordinaire! Nice to meet you.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
	o_text.page = 5;
	add_people(people.Dina);
	break;
	
	case 2:
	scr_text("You look a bit tired.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
	o_text.page = 7;
	break;
	
	case 3:
	scr_text("Thirty years in the force, then ten more as a private investigator. He was passionate about helping people, that's what I loved about him.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
	o_text.page = 12;
	break;
	
	case 4:
	scr_text("This pie is delicious, what's the recipe?",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
	o_text.page = 14;
	break;
	
	case 5:
	scr_text("Sorry I'm just going to need some time…to think about things... gross.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
	o_text.page = 18;
	break;
	
	case 6:
	scr_text("Oh my god! Are you alright?",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
	o_text.page = 20;
	break;
	
	}
	diagDina++;
	

} else if o_text.option == 2 and action_one {
	show_inventory = true;
} else if o_text.option == 3 and action_one {
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
			
			//People Grace
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Nah, that's just how she looks. That, or she hates everyone, which wouldn't surprise me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//Diag 1
			case 5:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I'm Chance, as you might have heard.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 6;
			break;
			
			case 6:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text(" I didn't. You're a detective? My pop was one as well. Ask me anything!",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//Diag 2
			case 7:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I sprinted three blocks to get over here as soon as Heather told me about the body.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = 8;
			break;
			
			case 8:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Heather?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 9;
			break;
			
			case 9:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("She's the receptionist, the really pretty one inside?",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = 10;
			add_people(people.Heather);
			break;
			
			case 10:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("You must be the really pretty one outside.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 11;
			break;
			
			case 11:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("You're sweet, but maybe don't hit on me in front of a dead body?",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			//End Diag 2//
			
			//Diag 3//
			case 12:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Ever consider joining the force yourself?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			case 13:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Too much action and gross stuff. I'll stick to lawyering, thanks.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//Diag 4 
			case 14:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("First you must befriend an old lady, then find her cat, then she gives you pie.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 15;
			break;
			
			case 15:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("You were so close to impressing me, you know.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = 16;
			break;
			
			case 16:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("And then I blew it?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 17;
			break;
			
			case 17:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("You blew it.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//Diag 5 
			case 18:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("You're regretting thinking about things.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 19;
			break;
			
			case 19:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Bingo. Excuse me while I try not to vomit again.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//Diag 6
			case 20:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I'm a bit short of breath, could you kiss my mouth to make me feel better?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 21;
			break;
			
			case 21:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Don't push it just because you're cute.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//Person Chase
			case 22:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Emphasis on the boy in playboy.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 23;
			break;
			
			case 23:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Exactly! Both Heather and I have known him a long time. He’s like a brother. An extremely irritating and lawsuit-waiting-to-happen brother.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			//Person Tall
			case 24:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("She likes him?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 25;
			break;
			
			case 25:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("They've been engaged for four months now. I'd hope it's more than “like”.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//Person Mikayle
			case 26:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("It seems somewhat likely. Maybe you can introduce us? I would like to speak with her.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
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

if o_text.option = 1 and action_one and diagGrace <= 4 {
	alarm[0] = room_speed*.5;
	alarm[2] = global.one_second*3;
	if instance_exists(o_text) then instance_destroy(o_text,false);
	//Diag 1 
	switch (diagGrace) {
	
		case 1:
		scr_text("There appear to be no signs of struggle before he hit the ground. The most likely explanation is that it was suicide, but we must still suspect foul play until proof is found that he jumped on his own accord.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
		o_text.page = PAGE_END;
		diagGrace = 4;
		break;
		
		case 4:
		scr_text("So I climbed into the furnace...",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
		o_text.page = 2;
		diagGrace++
		break;
	}
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
			
			#region Text 4
			case 2:
			alarm[2] = global.one_second*5;
			instance_destroy(o_text,false);
			scr_text("You climbed into the furnace?",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			alarm[0] = room_speed*2;
			o_text.page = 3;
			break;
			
			case 3:
			alarm[2] = global.one_second*5;
			instance_destroy(o_text,false);
			scr_text("Yes, keep up Grace. I went looking in the furnace, and suddenly it all started to heat up. Someone locked me inside the furnace-they were trying to kill me!",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*2;
			o_text.page = 4;
			break;
			
			case 4:
			alarm[2] = global.one_second*5;
			instance_destroy(o_text,false);
			scr_text("That's pretty ballsy, to do that to a detective like yourself. The perimeter is secured, so we don't have to worry about the perp getting away.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			alarm[0] = room_speed*2;
			o_text.page = 5;
			break;
			
			case 5:
			alarm[2] = global.one_second*5;
			instance_destroy(o_text,false);
			scr_text("Show a little concern!",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*2;
			o_text.page = 6;
			break;
			
			case 6:
			alarm[2] = global.one_second*5;
			instance_destroy(o_text,false);
			scr_text("I'm glad you're okay, Chance, but you're not dead and Wally still is, so get out there and get sleuthing!",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			alarm[0] = room_speed*2;
			o_text.page = PAGE_END;
			break;
			#endregion
			
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

#region Carrie Chat
if action_one && position_meeting(mouse_x, mouse_y, o_Carrie) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	first_line = true;
	skip = false;
	alarm[0] = room_speed*.5;
	state_ = state.chat;
	scr_text("    >Talk                     >Interact                          >Nevermind         ",5,view_xport[0]+125,view_yport[0]+250,CHEST_CARRIE);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = CARRIE;
}

if chat == CARRIE {

if action_one_pressed_  and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one and diagCarrie <= 2 {
	alarm[0] = room_speed*.5;
	alarm[2] = global.one_second*3;
	if instance_exists(o_text) then instance_destroy(o_text,false);
	//Diag 1 
	switch (diagCarrie) {
	
		case 1:
		scr_text("I'm Carrie Rhodes. I work here, 'nuff said.",1,view_xport[0]+125,view_yport[0]+250,CHEST_CARRIE);
		o_text.page = 2;
		diagCarrie++
		break;
		
		case 2:
		scr_text("Me? I was polishing my gun while waiting for this whole mess to clear up, so I can get outta this dump.",1,view_xport[0]+125,view_yport[0]+250,CHEST_CARRIE);
		o_text.page = 4;
		diagCarrie++
		break;
	}
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
			
			case 2:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("That doesn't tell me very much about you.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 3;
			break;
			
			case 3:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("Good, 'cause that's the intention.",1,view_xport[0]+125,view_yport[0]+250,CHEST_CARRIE);
			alarm[0] = room_speed*.5;
			o_text.page = PAGE_END;
			break;
			
			//Diag2
			case 4:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text(" You mind if I take a look at it?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*.5;
			o_text.page = 5;
			break;
			
			case 5:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I do mind. I've been wiping 'er clean from my last outing, and I don't need your dirty little hands all over 'er.",1,view_xport[0]+125,view_yport[0]+250,CHEST_CARRIE);
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

#region Chase Chat
if action_one && position_meeting(mouse_x, mouse_y, o_Chase) and ( state_ == state.base or state_ == state.idle ) && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	first_line = true;
	skip = false;
	alarm[0] = room_speed*.5;
	state_ = state.chat;
	scr_text("    >Talk                     >Interact                          >Nevermind         ",5,view_xport[0]+125,view_yport[0]+250,CHEST_CHASE);
	alarm[2] = global.one_second*1;
	o_text.page = PAGE_END;
	chat = CHASE;
}

if chat == CHASE {

if action_one_pressed_  and !skip {
	o_text.spd = 5;
	skip = true;
	alarm[1] = room_speed*.5;
}

if o_text.option = 1 and action_one and diagChase <= 2 {
	alarm[0] = room_speed*.5;
	alarm[2] = global.one_second*3;
	if instance_exists(o_text) then instance_destroy(o_text,false);
	//Diag 1 
	switch (diagChase) {
	
		case 1:
		scr_text("My name is Chase Tauropolous. Mouthful, I know. I'm the highest performing monkey here. I'm also a pro with the rifle. Basically, I'm awesome.",1,view_xport[0]+125,view_yport[0]+250,CHEST_CHASE);
		o_text.page = PAGE_END;
		diagChase++
		break;
		
		case 2:
		scr_text("Yeah, fell down a flight of stairs yesterday. It got real ugly. Wanna sign my cast?",1,view_xport[0]+125,view_yport[0]+250,CHEST_CHASE);
		o_text.page = 2;
		diagChase++
		break;
	}
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
			
			case 2:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("I'll pass.",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
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
				
				people_description(1);
				o_cursor.show_des = 4;
			}

			if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				first_line = false;
				
				people_text(1);	
					
					
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
				people_description(2);
			}

			if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				first_line = false;
				alarm[0] = room_speed*.5;
				people_text(2);
			
			show_inventory = false;
			}
	
		}
		
		
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 374/*192*/ and device_mouse_x_to_gui(0) <= 420 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=6 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				people_description(3);
				o_cursor.show_des = 6;
			}

			if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				first_line = false;
				alarm[0] = room_speed*.5;
				people_text(3);
			
			show_inventory = false;
			}
	
		}
		
		if (device_mouse_y_to_gui(0) >= 56 and device_mouse_y_to_gui(0) <= 102 ) and (device_mouse_x_to_gui(0) >= 440/*192*/ and device_mouse_x_to_gui(0) <= 504 ) {
			if (instance_exists(o_description) and o_cursor.show_des !=7 ) {
				instance_destroy(o_description,false);
			}	

			if (!instance_exists(o_description)) {
				
				people_description(4);
				
				o_cursor.show_des = 7;
			}

			if ( instance_exists(o_text) and action_one_pressed_ && alarm[0] <= 0 and skip ) {
				//create_descripton("Grace is vegetarian", 1 camera_get_view_border_x(view_camera[0])+500, camera_get_view_border_y(view_camera[0]));
				skip = false;
				first_line = false;
				alarm[0] = room_speed*.5;
				people_text(4);
					
					
			}
			
			show_inventory = false;
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
				add_people(people.Eddyson);
				break;
				
				case HEATHER:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("He worked at Rook Law, up on the 6th floor. He's a weird guy. Well, was.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
				global.peopleHeather = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				add_people(people.Heather);
				break;
				
				case REYNOLDS:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("That fella works in this building. I see him every morning. Don't know much else about him, except I've seen him for years.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
				//global.grace_pescatarian = true;
				global.peopleStu = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				add_people(people.Stu);
				break;
				
				case BIZI:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("He is quiet guy, he must be having affair! Or maybe he is government agent!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
				global.peopleBizi = true;
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				add_people(people.Bizi);
				break;
				
				case DINA:
				alarm[2] = global.one_second*3;
				instance_destroy(o_text,false);
				scr_text("I think maybe I've seen him around here before? ...I got nothing.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
				alarm[0] = room_speed*.5;
				o_text.page = PAGE_END;
				add_people(people.Dina);
				break;
				
				}
			}
		show_inventory = false;	
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

//OLD

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






