/// @description Insert description here
// You can write your code in this editor
depth = 10;
scr_input(global.pad[0]);

var hinput = right - left;
if hinput != 0 {
	//hspeed_ += hinput*accelation_;
}

if (state_ == state.base) {
	scr_state_walk()
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


if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Eddyson) and state_ == state.base && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover  {
	
	state_ = state.chat;
	scr_text("Hello, hello. What can I sell- er, help you with today?",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
	alarm[2] = global.one_second*3;
	skip = false;
	alarm[0] = room_speed*1;
	o_text.page = 1;
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

#region Heather Chat
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Heather) and state_ == state.base && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("Make it quick, so I can get back to ignoring you.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
	alarm[2] = global.one_second*1;
	o_text.page = 1;
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
			
			case 2:
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
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_reynolds) and state_ == state.base && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("Steven Reynolds, at your service. Call me Stu.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
	alarm[2] = global.one_second*1;
	o_text.page = 1;
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
			o_text.page = 2;
			break;
			
			case 2:
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
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Bizi) and state_ == state.base && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("Care for apple turnover? It used to be pie but then it is turned over.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
	alarm[2] = global.one_second*1;
	o_text.page = 1;
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
			o_text.page = 2;
			break;
			
			case 2:
			alarm[0] = room_speed*1;
			o_text.page = 0;
			if instance_exists(bizi_block) {
				instance_destroy(bizi_block, false);
			}
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}

#endregion

#region Dina Chat
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Dina) and state_ == state.base && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("Wish they would let me inside. I just want to see if my friend is okay!",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
	alarm[2] = global.one_second*1;
	o_text.page = 1;
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
			
			case 2:
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

#region Grace Chat
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Grace) and state_ == state.base && alarm[0] <= 0 and cursor_sprite  == s_dialogue_hover {
	skip = false;
	alarm[0] = room_speed*1;
	state_ = state.chat;
	scr_text("What have you found, detective?",0.5,view_xport[0]+125,view_yport[0]+250,choose(CHEST_GRACE,CHEST_GRACE_B));
	alarm[2] = global.one_second*1;
	o_text.page = 1;
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
			o_text.page = 2;
			break;
			
			case 2:
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



/*#region Reynolds Chat
if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, o_Heather) and state_ == state.base && alarm[0] <= 0 {
	state_ = state.chat;
	scr_text("Steven Reynolds, at your service. Call me Stu.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
	alarm[2] = global.one_second*1;
	o_text.page = 1;
	chat = REYNOLDS;
}

if chat == HEATHER {

if mouse_check_button_released(mb_left)  and !skip {
	o_text.spd = 2;
	skip = true;
	alarm[1] = room_speed*.5;
}
	
if instance_exists(o_text) and mouse_check_button_released(mb_left) and mouse_y>245 && alarm[0] <= 0 and skip {
		skip = false;
		
		switch (o_text.page) {
			case 0:
			
			break;
			
			case 1:
			alarm[2] = global.one_second*3;
			instance_destroy(o_text,false);
			scr_text("He worked at Rook Law, up on the 6th floor. He's a weird guy. Well, was.",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
			alarm[0] = room_speed*1;
			o_text.page = 2;
			break;
			
			case 2:
			o_text.page = 0;
			instance_destroy(o_text,false);
			state_ = state.base;
			chat = noone;
			break;
			
		}
	}
}

#endregion */

/*if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_Grace) and state == state.base && alarm[0] <= 0 {
	
	state = state.chat;
	//instance_create_layer(view_xport[0]+134,view_yport[0]+273,"UI",o_chest);
	//instance_create_layer(view_xport[0]+125,view_yport[0]+250,"UI",o_text);
	scr_text("Hello, Chance",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
	alarm[0] = room_speed*1;
	o_text.page = 1;
}*/


/*if !instance_exists(o_inventory) {	
	if mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, o_Grace) && mouse_y < 244 and state_ == state.chat {
		if instance_exists(o_text) 
			instance_destroy(o_text,false);
			state_ = state.base;
	}
}*/

if !instance_exists(o_text) { 
	state_ = state.base;
} else {
	state_ = state.chat;
}
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
			o_text.page = PAGE_CIGG;
			break;
			
			case PAGE_CIGG:
			instance_destroy(o_text,false);
			state = state.base;
			break;
			
		}
	}
}
*/

/*switch (state) {
	
	case state.base:
	//scr_state_walk();
	break;
	
	case state.chat:
	/*if mouse_check_button_released(mb_left) && !position_meeting(mouse_x, mouse_y, o_Grace) {
	if instance_exists(o_text) 
		instance_destroy(o_text,false);
		state = state.base;
	}*//*
	break;

}*/

#region Animation

switch state_ {

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

