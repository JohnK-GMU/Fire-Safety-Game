if (keyboard_check_pressed(vk_enter)){
	
		//if we're in game over screen, make sure to reset anything needs resetting
		if (global.generic_flag2 == false){
		obj_player.mode = "cutscene";
		obj_player.x = 0;
		obj_player.y = 0;
		obj_cameraMain.x = 0;
		obj_cameraMain.y = 0;
		obj_cameraMain.mode = "follow cam";
		
		//From initilizer 
		//pop ups
		global.popUp_sub = 0;
		global.popUp_blank = true;
		global.popUp_turnNormal = true;
		global.current_room = "livingroom";
		global.current_floor = 8;
		//fade options
		global.fade_turnNormal = true; //turn player to normal after finishing the fade
		global.fade_speed = 0.05;
		global.fade_mode = 0;// 0 fade to black, 1 fade to normal, 2 both.
		global.fade_color = c_black;
		global.generic_flag = 0;
		global.prompt_bar = 0;
		}

		room_goto(next_room);
	}