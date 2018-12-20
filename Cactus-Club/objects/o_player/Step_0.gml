/// @description Insert description here
// You can write your code in this editor
scr_input(global.pad[0]);

var hinput = right - left;
if hinput != 0 {
	//hspeed_ += hinput*accelation_;
}

if (state_ = !state.chat) {
	scr_state_walk()
}

if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, o_npc) and state == state.base && alarm[0] <= 0 {
	
	state = state.chat;
	//instance_create_layer(view_xport[0]+134,view_yport[0]+273,"UI",o_chest);
	//instance_create_layer(view_xport[0]+125,view_yport[0]+250,"UI",o_text);
	scr_text("Hello, Chance",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
	alarm[0] = room_speed*1;
	o_text.page = 1;
}
if !instance_exists(o_inventory) {	
	if mouse_check_button_released(mb_left) && !position_meeting(mouse_x, mouse_y, o_npc) && !position_meeting(mouse_x, mouse_y, o_text) and state == state.chat {
		if instance_exists(o_text) 
			instance_destroy(o_text,false);
			state = state.base;
	}
}

if !instance_exists(o_text) { 
	state = state.base;
}

if state == state.chat {
	if instance_exists(o_text) and mouse_check_button_released(mb_left) && !position_meeting(mouse_x,mouse_y, o_keyword) and ( position_meeting(mouse_x, mouse_y, o_npc) or position_meeting(mouse_x, mouse_y, o_text)  )  && alarm[0] <= 0 {
		
		switch (o_text.page) {
			case 0:
			/*instance_destroy(o_text,false);
			scr_text("la wea wnnn",0.5,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
			alarm[0] = room_speed*1;
			o_text.page = 1;*/
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


/*switch (state) {
	
	case state.base:
	//scr_state_walk();
	break;
	
	case state.chat:
	/*if mouse_check_button_released(mb_left) && !position_meeting(mouse_x, mouse_y, o_npc) {
	if instance_exists(o_text) 
		instance_destroy(o_text,false);
		state = state.base;
	}*//*
	break;

}*/
switch (anim) {
	
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
	break;
	
	
	case anim.talk:
	break;
}



