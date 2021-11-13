if (global.current_room == my_room){
	
	if(y < obj_player.y/* && depth == dep_front*/){depth = dep_back;}
	else if(y > obj_player.y/* && depth == dep_back*/){depth = dep_front;}
	
	draw_sprite(spr, sub, x, y);
	//draw_text(x, y - 20, "depth:" + string(depth));
}

