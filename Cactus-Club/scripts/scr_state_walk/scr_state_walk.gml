gml_pragma("forceinline");

if right and !left {
	hspeed_ = 4;
	anim_ = anim.walk;
	dir_ = face_right;
} else if left and !right {
	hspeed_ = -4;
	anim_ = anim.walk;
	dir_ = face_left;
} else {
	hspeed_ = 0;
	anim_ = anim.idle;
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

