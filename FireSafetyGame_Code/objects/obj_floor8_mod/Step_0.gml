
prompt = "";
show_prompt = false;

if (fire_killed){
	
	obj_cameraMain.mode = "be managed";
	obj_cameraMain.x = 2200;
	obj_cameraMain.y = 280;
	obj_player.mode = "cutscene";
	
	
	counter++;
	if (counter == 60){
		global.fade_color = c_white;
		global.fade_mode = 0;
		global.fade_speed = 0.006;
		instance_create_layer(0, 0, "Instances", obj_fade);
	}
	
	if (counter >= 70 && !instance_exists(obj_fade)){
		room_goto(Room_gameOver);	
		room_persistent = false;	
	}
	exit;
}


//pick up ext - 2
if (ext_taken == false){
	if (collision_rectangle(ext_x -32, ext_y-32, ext_x+32, ext_y+32, obj_player, false, false) != noone){
		prompt = "Take fire extingusiher";
		global.prompt_bar = 6;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			ext_taken = true;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
	}	
}


//apply item to the fire
if (ext_taken == true){
	if (collision_rectangle(2125, 257, 2282,298, obj_player, false, false) != noone){
		prompt = "Put off fire";
		global.prompt_bar = 2;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
					room_goto(Room_1stPPP);
					fire_killed = true;
		}
	}
}