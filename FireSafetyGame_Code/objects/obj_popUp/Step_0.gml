switch (stage){
	
	case 0: scale+= 0.1; if (scale == 1) {stage++;} break;
	
	case 1: if (keyboard_check_pressed(vk_enter)) {stage++;} break;
	
	case 2:scale -= 0.1; if (scale == 0) {stage++;} break;
	
	case 3: fade -= 0.05; if (fade == 0) {instance_destroy(); 
		//obj_kitchen_mod.opening = 0;
		if (global.popUp_turnNormal){obj_player.mode = "normal";}
		} break;

}