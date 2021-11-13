if (operate == false){
	
	operate = true;
	obj_player.mode = "fixed";
	global.fade_color = c_black;
	global.fade_mode = 2;
	global.fade_speed = 0.1;
	global.fade_turnNormal = false;
	instance_create_layer(0, 0, "Instances", obj_fade);

}