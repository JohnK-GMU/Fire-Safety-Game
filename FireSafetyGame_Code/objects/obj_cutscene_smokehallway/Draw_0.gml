switch(stage){
	
	//stop player
	case -1:
		draw_sprite(spr_shadow, 0, start_x , start_y);
		draw_sprite(spr_player_still, 0, start_x, start_y);	
	break; 
	
	//wait a second
	case 0:
		draw_sprite(spr_shadow, 0, start_x , start_y);
		draw_sprite(spr_player_still, 0, start_x, start_y);
	break; 
	
	//info pop up, wait for X
	case 1:
		draw_sprite(spr_shadow, 0, start_x , start_y);
		draw_sprite(spr_player_still, 0, start_x, start_y);
		//draw_sprite(spr_leon_idle, 1, 1470, 1210);
		//draw_sprite(spr_infoBoxes, 0, camera_get_view_x(view_camera[0]) + 100, camera_get_view_y(view_camera[0]) + 100);
	break; 
	
	//drop
	case 2:
		draw_sprite(spr_shadow, 0, start_x , start_y);
		draw_sprite(spr_player_fall, counter, start_x, start_y);
	break; 
	
	//crawl through the hallway
	case 3:
		draw_sprite(spr_shadow, 0, start_x-distance, start_y+distance/3.2);
		draw_sprite(spr_player_crawl, counter, start_x-distance, start_y+distance/3.2);
		if (pressed){counter += 0.15;}
	break; 
	
	//get up
	case 4:
		draw_sprite(spr_shadow, 0, start_x-distance, start_y+distance/3.2);
		draw_sprite(spr_player_fall, counter, start_x-distance, start_y+distance/3.2);
	break;
	
	//wait
	case 5:
		draw_sprite(spr_shadow, 0, start_x-distance, start_y+distance/3.2);
		draw_sprite(spr_player_still, 0, start_x-distance, start_y+distance/3.2);
	break;

}

//animate smoke
draw_sprite_ext(spr_smokehallway_smoke, smoke_index, 800,1550, 1, 1, 0, c_white, 0.6);
smoke_index += 0.15;