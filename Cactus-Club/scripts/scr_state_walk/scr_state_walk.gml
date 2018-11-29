gml_pragma("forceinline");

if right {
	hspeed_ = 2.5;
	anim = anim.walk;
	dir_ = face_right;
} else if left {
	hspeed_ = -2.5;
	anim = anim.walk;
	dir_ = face_left;
} else {
	hspeed_ = 0;
	anim = anim.idle;
}

if !place_meeting(x,y+1, o_solid) {
	vspeed_ += gravity_;
} else {
	//jump code if needed
}

if place_meeting(x+hspeed_,y, o_solid) {
	/*while !place_meeting(x+sign(hspeed_),y, o_solid) {
		//x += sign(hspeed_);
	}  */
	hspeed_ = 0;
}

x += hspeed_;

if place_meeting(x,y+vspeed_, o_solid) {
	while !place_meeting(x,y+sign(vspeed_), o_solid) {
		y +=sign(vspeed_);
	}
	vspeed_ = 0;
}
y += vspeed_;

