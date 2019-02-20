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
						global.bizi_block_ = false;
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
						
						case people.Grace:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I introduced myself already. It's Grace Anney, and you'll be working under me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Chase:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Sounds like an interesting guy. Keep an eye on him, he's got to be here for a reason.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						/*case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He seems like a good guy with a keen eye.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;*/
						
						case people.Carrie:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's definitely hiding something. Make it your goal to find out what.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Harold:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He doesn't sound particularly athletic. Keep that in mind when examining his alibi.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
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
					
					case HEATHER:
					switch o_inventory.people_i[1] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Yes, that's me. What about me?",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's nice enough. He sometimes just looks at me for no reason though. That's weird.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Dina's an old friend. She's a sweetheart and a damn good lawyer.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Chase:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("If there's one thing I can say about Chase is he's a real charmer. He's doesn't tone his flirting down even though he broke his arm.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Tall:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Yes, we're dating. Engaged, actually. He bought me a ring last week.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 8;
						break;
						
					    case people.Bizi:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Don't say her name, she might appear.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Carrie:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's stone-cold. Won't give me the time of day. I don't trust her.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Ursula:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's... difficult. She means well... probably. Actually no, she's just a bitch.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						default:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I don't care enough to have remembered them.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						
					}
					break;
					
					case DINA:
					switch o_inventory.people_i[1] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("My best-est friend! We went to high school together. She's the nicest human I know!",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's the barrier between me and Heather right now! Nice guy, but he needs to LET ME IN.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Geez, if you want to know so much ask me on a date! I’m not on chatting time!",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Chase:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's harmless! Under his bravado he’s just like a kid.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 22;
						break;
						
						case people.Tall:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He reminds me of a vulture. Don't say that in front of Heather though.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 24;
						break;
						
						case people.Yasmin:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's very interesting...I don't get her bee thing. She keeps me up to date on all the crime dramas on TV though, so I like her.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Mikayla:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I found an avian on the 5th floor fire escape. Could that have something to do with Wally?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 27;
						break;
						
						
					}
					break;
					
					case EDDYSON:
					switch o_inventory.people_i[1] {
					
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That man wouldn't let me inside to do a sales pitch. He's a real bully.",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Tried to sell her my patented episodic Bill of Rights, receive a new Right each week! No bite though.",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Wendy:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She buckled and bought a pair of earrings. Can I sell, or can I sell?",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						default:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I don't know anything, care to give me their contact information?",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
					}
					break;
					
					case BIZI:
					switch o_inventory.people_i[1] {
					
						case people.Grace:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That girl who here with you? I figure you know her well enough. Wink.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 11;
						break;
					
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That lawyer? She handled fifth divorce, left bastard on the streets with just his pants. Very good lawyer.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("You think she owns the building how she sits at desk. Girl needs to learn to respect her elders.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 15;
						break;
						
						case people.Wally:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Poor dear, he was such a charming boy, so very respectful. He didn't kill himself I know it. You better find the culprit!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Carrie:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That girl is twitchy, always seems to have ants in her pants? Like big red fire ants. That bite.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Yasmin:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's one girl who just won't shut up, she's always telling me about these dramas she watches in excruciating detail. She needs more friends her age...hey, you're still single.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page =14;
						break;
						
						case people.Tall:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's not that tall but I hear he's a real charmer off the clock.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Palmer:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("The most amazing boss of the most amazing company with the most amazing company, or so he'd like everyone to believe. Unfortunately not many people are gullible enough to fall for      	his practised speeches and borrowed words of wisdom. Good fun for a romp in the sack, if you catch my meaning.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 17;
						break;
						
						case people.Ursula:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("A genius who is also completely inept at anything social. Sometimes I wonder if her icy exterior is a mask for a genuinely fun person, but that seems an impossibility!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Harold:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Such a jolly man, he would make a great mall Santa, I don't know what he's doing in that boring dead end job.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 20;
						break;
						
						case people.Chance:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I would've had him and then some in my youth!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 24;
						break;
						
						case people.Mikayla:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Doesn't ring a bell, sorry.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Such a charmer! They don't make 'em like that anymore.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Wendy:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("A little girl playing adult. Then again aren't we all a little like that?",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Peter:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Er, he's...I think he's been here a while...um...sorry, I've forgotten everything about him.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("The lotus flower of the building. Wherever she walks happiness blossoms.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 26;
						break;
						
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He runs this store down on Herald St. It's all just useless knickknacks with silly names, but I swear he uses black magic and you walk out of there with a handful of the junk! No returns!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						default:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I don't know anything, care to give me their contact information?",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
					}
					break;
					
					case people.Stu:
					switch o_inventory.people_i[1] {
					
						case people.Grace:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Seems like a nice, put-together kind of girl. That’s important in a partner.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Heather's friend? It warms my heart to see them together, I never see Heather smile nearly as much as when she's not with Dina.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Our newest secretary, we seem to go through them a little too fast. She's competent and respectful enough, I just wish she wasn't so guarded. I'm only trying to be friendly.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Wally:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Although he was pretty silent, it was evident he was a good guy. Hard to imagine someone wanting to hurt the fella.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Carrie:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That girl is stressed as all hell. If she keeps taking so many smoke breaks she's going to burn herself out before she reaches forty.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 20;
						break;
						
						case people.Yasmin:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Lovely girl. She's keen hearing about my days on the force, though sometimes she seems to fixate mainly on the violent aspects of my career for some reason.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Tall:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Can't say much about him. I just know him from afar: he doesn't seem to be interested to make friends with anyone aside from his fiancée Heather.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Palmer:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Good guy, if a little overenthusiastic. Rather a happy boss is better than a grumpy one.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Ursula:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's always carrying around strange equipment and  mysterious substances. It is suspicious, but doubtfully the kind of suspicious you're looking for.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Harold:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Some people are the butt of everyone's joke, Harold has the unfortunate luck of being in that select category, I've tried to tell him to stand up for himself, but fat good that's done.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 27;
						break;
						
						case people.Chase:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's always smelling of smelly and expensive perfume. I don't know whether to envy or pity him.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						
						
						case people.Mikayla:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Never heard of that person.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Wendy:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("The new girl. She's so earnest and eager to prove herself. The Cullridges are a family of fortune, but she wants to start from the bottom and make a name for herself. Truly admirable. I fear someone will take advantage of her wide eyed innocence.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Peter:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("A total wallflower. He's hard to notice and easy to forget. Took me a month to remember his name.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Charming woman, huh? She might be incapable of keeping silent, but she's like the building mascot.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He sells a lot of useful stuff but you gotta be careful or you'll end up with more than you bargained for. Literally!",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						default:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I'm afraid I'm not too familiar with them, sorry!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
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
						global.bizi_block_ = false;
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
						global.bizi_block_ = false;
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
						global.bizi_block_ = false;
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






