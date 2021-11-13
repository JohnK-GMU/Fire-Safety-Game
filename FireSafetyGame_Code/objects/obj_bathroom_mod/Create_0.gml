//window - independent
//take towel, wet it, put it under door.

depth = 6; 

//1 - hanger
towel_taken = false;
hanger_x = 211;
hanger_y = 111;

//2 - wet it in the toilet
wet_taken = false;
wet_x = 60;
wet_y = 240;

//3 - put inder door
door_taken = false;
door_x = 518;
door_y = 204 ;

//4 - window
window_taken = false;
window_x = 65;
window_y = 65;

//5 - phone
phone_taken = false;
phone_x = 400;
phone_y = 65;

red_door = false;

obj_player.x = 306;
obj_player.y = 252;
obj_player.mode = "cutscene";

global.popUp_blank = true;
global.popUp_sub = 6;
global.popUp_turnNormal = true;
instance_create_layer(0, 0, "Instances", obj_popUp);


//prompt stuff
prompt = "";
show_prompt = false;
pop = 0;
offset_x = -20;
offset_y = -120;

fading = false;

//bring this shit back
animate = false;
animate_index = 0;


smoke_frame = 0;

depth = 5;