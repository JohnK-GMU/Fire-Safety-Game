/*
water :ballot_box_with_check: 
baking soda  :ballot_box_with_check: 
lid cover  :ballot_box_with_check: 
put out heat source 
*/

depth = -6; 

//postion the player
obj_player.x = 300;
obj_player.y = 200;

//1
water_done = false;
water_x = 383;
water_y = 264;

//2
soda_done = false;
soda_x = 317;
soda_y = 128;

//3
lid_done = false;
lid_x = 486;
lid_y = 227 ;



stove_done = false;
draw_pot = false;

fire_x = 180;
fire_y = 170;
fire_off = false;
fire_index = 0;
fire_size = 1;

hands_full = false;
in_hand = 0;//1, 2, 3

//also opening
index = 60; 

reset = -1; //0 bad, 1 good, 2 next 

obj_player.mode = "cutscene";
global.popUp_blank = true;
global.popUp_sub = 0;
instance_create_layer(0, 0, "Instances", obj_popUp);


//prompt stuff
prompt = "";
show_prompt = false;
pop = 0;
offset_x = -20;
offset_y = -120;

fading = false;

die = false;
die_frame = 0;
explode_frame = 0;


//bring this shit back
animate = false;
animate_index = 0;

//for depth shit
inst = instance_nearest(236,210, obj_furnitureDepth);
