/// @description 

//Inventory Code
enum evidence {
	none = 0,
	suitcase = 1,
	blood = 2,
	briefcase = 3,
	wallyid = 4,
	towerid = 5,
	notes = 6,
	calendar = 7,
	dart = 8,
	medic = 9,
	feathers = 10,
	photo = 11,
	carkey = 12,
	book = 13,
	shotgun = 14,
	key = 15,
	gloves = 16,
	cigaretteBox = 17,
	cake = 18
}

enum people {
	none = 0,
	Chance = 1,
	Grace = 2,
	Wally = 3,
	Eddyson = 4,
	Dina = 5,
	Bizi = 6,
	Heather = 7,
	Harold = 8,
	Ursula = 9,
	Peter = 10,
	Tall = 11,
	Palmer = 12,
	Carrie = 13,
	Chase = 14,
	Wendy = 15,
	Stu = 16,
	Yasmin = 17,
	Mikayla = 18,
	Leslie = 19
}	

enum POQS {
	none = 0,
	POQgrace = 1,
	POQwally = 2,
	POQeddyson = 3,
	POQdina = 4,
	POQbizi = 5,
	POQheather = 6,
	POQharold = 7,
	POQursula = 8,
	POQpeter = 9,
	POQtall = 10,
	POQpalmer = 11,
	POQcarrie = 12,
	POQchase = 13,
	POQwendy = 14,
	POQstu = 15,
	POQyasmin = 16,
	POQmikayla = 17,
	POQleslie = 18,
	POQvictim = 19,
	POQ5 = 20,
	POQbriefcase = 21,
	POQdart = 22,
	POQshotgin = 23
}
page = 1;

inv_slots = 15;
inv_slots_width = 3;
inv_slots_height = 5;

x_buffer = 21//15;
y_buffer = 13//7;

cell_size = 44;

spr_inv_items = s_evidence;

slots_x = 99;
slots_y = 58;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

ds_inventory = ds_grid_create(2, inv_slots);

ds_inventory[# 0, 0] = evidence.medic;
ds_inventory[# 0, 1] = 1;

randomize();

var yy = 0; repeat(inv_slots) {
	ds_inventory[# 0, yy] = irandom_range(1, 15);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	yy += 1;
}
//Items
global.peopleHeather = false;
global.peopleBizi = false;
global.peopleStu = false;
global.peopleEddyson = false;


people_i[4] = noone;
people_i[3] = noone;
people_i[2] = noone;
people_i[1] = noone;
people_i[0] = people.Grace;