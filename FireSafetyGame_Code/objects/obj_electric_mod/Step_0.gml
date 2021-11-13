prompt = "";
show_prompt = false;

if (die){exit;}

//OPENING ANIMATION*****************************************************************************************
if (!opening && !instance_exists(obj_popUp)){
	switch(sequence){
		
		//keep standing next the box
		case 0:
			index++;
			if (index == 80){index = 0; sequence++;}
		break;
		
		//box explodes
		case 1:
			index += 0.2;
			if(index >= 3){
				index = 0;
				sequence++;
				blow = true;
				global.popUp_blank = false;
				global.popUp_sub = 5;
				global.popUp_turnNormal = false;
				instance_create_layer(0, 0, "Instances", obj_popUp);
				}	
		break;
		
		//wait for popup"drop, roll" pop up
		case 2:
			if (!instance_exists(obj_popUp)){
				sequence++;	
				fire_off = false;
			}
		break;
		
		//drop
		case 3:
			index+= 0.2;
			if(index >= 4){
				index = 0;
				sequence++;
			}
		break;
		
		//roll
		case 4:
			index++;
			if(index == 70){
				index = 4;
				sequence++;
			}
		break;
		
		//get up
		case 5:
			index-= 0.2;
			if(index <= 0){
				index = 0;
				//sequence =0;
				opening = true;
				obj_player.mode = "normal";
				obj_player.x = 390 - 140 + 174;
				obj_player.y = 180 + 70 + 50;
				depth = 6;
			}
		break;
	}	
	exit;	
}
//****************************************************************************************************

//level end
if ((switch_done && fire_off) || reset == 0){ //we won || we lost
	
		if(instance_exists(obj_fade)){
			if (obj_fade.a == 1){
				if (reset == 0){
					//reset values
					obj_player.mode = "normal";
					fire_off = false;
					fire_frame = 0;
					hands_full = false;
					in_hand = 0;//1, 2, 3
					die = false;
					die_frame = 0;
					explode_frame = 0;
					animate = false;
					animate_index = 0;
					fading = false;
					reset = -1;
					}
				else{ //we won
					room_persistent = false;	
					room_goto(Room_bathroom);
				}
			}
		} else {// if fade don't exists
			global.fade_color = c_black;
			global.fade_mode = 2;
			global.fade_speed = 0.01;
			global.fade_turnNormal = false;
			instance_create_layer(0, 0, "Instances", obj_fade);
		}
}

//******************************************************************************************
//pick up water  - 1
if (water_done == false && hands_full == false && fire_off == false && obj_player.mode == "normal"){
	if (collision_rectangle(water_x -20, water_y-20, water_x+32, water_y+50, obj_player, false, false) != noone){
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

//pick up ext - 2
if (ext_done == false && hands_full == false && obj_player.mode == "normal"){
	if (collision_rectangle(ext_x -32, ext_y-32, ext_x+32, ext_y+32, obj_player, false, false) != noone){
		prompt = "Take fire extingusiher";
		global.prompt_bar = 6;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			hands_full = true;
			ext_done = true;
			in_hand = 2;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
	}	
}


//apply item to the fire
if (hands_full == true && obj_player.mode == "normal"){
	if (collision_rectangle(box_x-32, box_y+64, box_x+32, box_y+100, obj_player, false, false) != noone){
		prompt = "Put off fire";
		global.prompt_bar = 2;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			hands_full = false;
			switch(in_hand){
				
				//water - 1
				case 1:
					obj_player.mode = "cutscene";
					die = true; //set this flag
				break;
				
				//extinguisher
				case 2:					
					room_goto(Room_1stPPP);
					fire_off = true;
				break;
			}
		}
	}
}



//turning off electicity
if (switch_done == false && collision_rectangle(switch_x-10, switch_y, switch_x+32, switch_y+100, obj_player, false, false) != noone){
		prompt = "Turn off elecricity";
		global.prompt_bar = 5;
		show_prompt = true;
		if (keyboard_check_pressed(ord("X"))){
			switch_done = true;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}		
}