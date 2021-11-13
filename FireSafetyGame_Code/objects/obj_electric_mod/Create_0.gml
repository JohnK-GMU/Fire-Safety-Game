obj_player.mode = "cutscene";
room_persistent = true;
global.generic_flag = 0;
obj_player.y = 296;

depth = 1;

blow = false;

opening = false; //'finished openining'
sequence = 0;
index = 0;

fire_off = true;
fire_frame = 0;
fire_x =  574 //(+174)
fire_y = 157 //(+62)

//1 - bottle
water_done = false;
water_x = 317;
water_y = 128;

//2 - fire extingusher
ext_done = false;
ext_x = 55;
ext_y = 239;

//3 - lightswitch
switch_done = false;
switch_x = 194;
switch_y = 116 ;

//4 - box
box_x = 574;
box_y = 157;

hands_full = false;
in_hand = 0;//1, 2, 3


obj_player.mode = "cutscene";
global.popUp_blank = true;
global.popUp_sub = 4;
global.popUp_turnNormal = false;
instance_create_layer(0, 0, "Instances", obj_popUp);


//prompt stuff
prompt = "";
show_prompt = false;
pop = 0;
offset_x = -20;
offset_y = -120;

die = false;
die_frame = 0;
explode_frame = 0;


//bring this shit back
animate = false;
animate_index = 0;


fading = false;
reset = -1;