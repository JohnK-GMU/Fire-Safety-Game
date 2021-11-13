//entrance animation
/*
if (index < 60 && !instance_exists(obj_popUp)){
	//index ++; increments in the draw event
	if(index == 60){obj_player.mode = "normal";}
	exit;	
}
*/

//depth managment - only for fire 
depth = inst.depth -1;
/*
if(obj_player.x > 272 && depth != 4){ depth = 4; }
else if(obj_player.x <= 272){ 
	//hardcode an issue with fire depth 
	
}
*/


prompt = "";
show_prompt = false;

if (die){exit;}

//level end
if (reset != -1){
	
	if (instance_exists(obj_popUp)){exit;} //wait for this
	
	if (fading == false){
		global.fade_color = c_black;
		global.fade_mode = 2;
		global.fade_speed = 0.1;
		global.fade_turnNormal = false;
		obj_player.mode = "cutscene";
		instance_create_layer(0,0, "Instances", obj_fade);
		fading = true;
	}
	
	if(!instance_exists(obj_fade)){exit;} 
	
	if (obj_fade.a == 1){
		//repeat this level - finished fading in n out - reset variables
		if(reset == 0 || reset == 1){
			fire_off = false;
			stove_done = false;
			fire_index = 0;
			fire_size = 1;
			hands_full = false;
			in_hand = 0;
			obj_player.x = 300;
			obj_player.y = 200;
			obj_player.mode = "normal";
			reset = -1; 
			fading = false;
			draw_pot = false;
			
		}
		//we're done with this level
		else if (reset == 2){
			room_goto(Room_electric);
		}
	}
}

//pick up water
if (water_done == false && hands_full == false && fire_off == false && obj_player.mode == "normal"){
	if (collision_rectangle(water_x -60, water_y-20, water_x+32, water_y+32, obj_player, false, false) != noone){
		prompt = "Take water";
		global.prompt_bar = 2;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			hands_full = true;
			water_done = true;
			in_hand = 1;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
	}
}

//pick up baking soda
if (soda_done == false && hands_full == false && fire_off == false && obj_player.mode == "normal"){
	if (collision_rectangle(soda_x -32, soda_y, soda_x+32, soda_y+55, obj_player, false, false) != noone){
		prompt = "Take baking soda";
		global.prompt_bar = 5;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			hands_full = true;
			soda_done = true;
			in_hand = 2;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
	}	
}

//pick up pot lid
if (lid_done == false && hands_full == false && fire_off == false && obj_player.mode == "normal"){
	if (collision_rectangle(lid_x -50, lid_y-10, lid_x+10, lid_y+20, obj_player, false, false) != noone){
		prompt = "Take pot lid";
		global.prompt_bar = 3;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			hands_full = true;
			lid_done = true;
			in_hand = 3;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
	}
}


//turning off heat source (stove)
if (fire_off == true && obj_player.mode == "normal" && !instance_exists(obj_popUp) && stove_done == false){
	if (collision_rectangle(fire_x, fire_y, fire_x+50, fire_y+64, obj_player, false, false) != noone){
		prompt = "Turn off stove";
		global.prompt_bar = 3;
		show_prompt = true;
		if (keyboard_check_pressed(ord("X"))){
			//hands_full = true;
			//stove_done = true;
			animate = true;
			animate_index = 0;
			stove_done = true;
			obj_player.mode = "cutscene";
			
			//if we done all the correct approaches, let's move to next level
			if (soda_done == true && lid_done == true){
				reset = 2;
				global.popUp_blank = false;
				global.popUp_sub = 3;
				global.popUp_turnNormal = false;
				instance_create_layer(0, 0, "Instances", obj_popUp);
			}
			
			//if we didn't complete all correct approaches, let's repeat the level
			else{
				reset = 1;
				global.popUp_blank = false;
				global.popUp_sub = 2;
				global.popUp_turnNormal = false;
				instance_create_layer(0, 0, "Instances", obj_popUp); 
			}
		}
	}
}


//apply item to the fire
if (hands_full == true && obj_player.mode == "normal"){
	if (collision_rectangle(fire_x, fire_y, fire_x+50, fire_y+64, obj_player, false, false) != noone){
		global.prompt_bar = 2;
		prompt = "Put off fire";
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			hands_full = false;
			switch(in_hand){
				
				//water
				case 1:
					obj_player.mode = "cutscene";
					die = true; //set this flag
				break;
				//soda
				case 2:					
					fire_off = true;
					animate = true;
					animate_index = 0;
					obj_player.mode = "cutscene";
				break;
				//lid
				case 3:
					fire_off = true;
					animate = true;
					animate_index = 0;
					draw_pot = true;
					obj_player.mode = "cutscene";
				break;
			}
		}
	}
}


//depth = -100;
