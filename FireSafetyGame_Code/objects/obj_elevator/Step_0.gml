prompt = "";
show_prompt = false;

if (collision_rectangle(x, y+50, x+74, y+120, obj_player, false, false) != noone && animate  == "null"){
		prompt = "Use elevator";
		show_prompt = true;
		global.prompt_bar = 3;
		if keyboard_check_pressed(ord("X")){
			animate = "interact";
			animate_index = 0;
			obj_player.mode = "cutscene";
			obj_cameraMain.mode = "be managed";
			obj_player.y = y + 117;
			obj_player.x = x + 15;
		}	
}
