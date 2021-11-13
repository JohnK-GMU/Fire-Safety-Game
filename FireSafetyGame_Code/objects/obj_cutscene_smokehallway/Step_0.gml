//if (instance_exists(obj_fade)){exit;}????????????????????????????????

switch(stage){	
	
	//stop player
	case -1:
		obj_player.mode = "cutscene";
		obj_player.x = start_x;
		obj_player.y = start_y;
		stage++;
	break; 
	
	//wait a second
	case 0:
		counter++;
		if (counter = 60){
			counter = 0; stage ++;
			global.popUp_blank = false;
			global.popUp_sub = 7;
			global.popUp_turnNormal = false;
			instance_create_layer(0, 0, "Instances", obj_popUp);
			}
	break; 
	
	
	//info pop up, wait for X
	case 1:
		if(!instance_exists(obj_popUp)){
			stage++;	
		}
	break; 
	
    //drop 
	case 2:
		counter+= 0.15
		if(counter >= 4){
			counter = 0;
			stage++;	
		}
	break; 
	
	
	//crawl through the hallway
	case 3:
		pressed = false;
		if(keyboard_check(vk_up) || keyboard_check(vk_left)){
			distance += 3;	
			pressed = true;
		}
		else if(keyboard_check(vk_right) || keyboard_check(vk_down)){
			distance -= 3;	
			pressed = true;
		}
		if (distance < 0){distance = 0;} 
		
		if(distance >= 1100){		
			stage++;
			counter = 4;
		}
		obj_cameraMain.x = start_x - distance;
		obj_cameraMain.y = start_y-100 + (distance/3);
	break; 
	
	//get up
	case 4:
		counter -= 0.15
		if(counter <= 0){
			counter = 0;
			stage++;	
			//fade options
			global.fade_turnNormal = true; //turn player to normal after finishing the fade
			global.fade_speed = 0.05;
			global.fade_mode = 2;// 0 fade to black, 1 fade to normal, 2 both.
			global.fade_color = c_black;
			instance_create_layer(0, 0, "Instances", obj_fade);
		}
	break;
	
	//fade to black and transition
	case 5:
		if(instance_exists(obj_fade)){
			//show_debug_message(obj_fade.a);
			if (obj_fade.a == 1){
				obj_player.x = 699;
				obj_player.y = 277;
				obj_player.mode = "fixed";
				global.current_room = "floor8";
				obj_cameraMain.mode = "follow cam";
				instance_destroy();
			}
		}

	break;	
	
}