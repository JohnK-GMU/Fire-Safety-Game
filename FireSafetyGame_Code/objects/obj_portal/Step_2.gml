if (operate){
	
	if (instance_exists(obj_fade)){
		if (obj_fade.a == 1){
			obj_player.p_direction = direction_to_be;
			obj_player.x = target_x;
			obj_player.y = target_y;

			//also given in the creation code
			layer_set_visible(current_room, false);
			layer_set_visible(next_room, true);
			global.current_room = next_room;
		}
	}
	
	if (!instance_exists(obj_fade)){
			obj_player.mode = "normal";
			operate = false;
	}
	
}