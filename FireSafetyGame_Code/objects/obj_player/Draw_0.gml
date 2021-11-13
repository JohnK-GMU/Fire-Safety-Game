if (mode == "cutscene"){exit;}

//draw shoes
//draw_self();
draw_sprite(spr_shadow, 0, x , y);

index += 0.25;

//temporary fix
if (p_direction == "up"){p_direction = 0;}
if (p_direction == "down"){p_direction = 4;}
if (p_direction == "left"){p_direction = 6;}
if (p_direction == "right"){p_direction = 2;}
	
if ((hsp == 0 && vsp == 0) || mode == "fixed"){
		//draw_sprite(spr_leon_idle, p_direction ,x, y);
		draw_sprite(spr_player_still, 0 ,x, y);
	}
else{
		//draw_sprite_ext(sprites_holder[walking_sprite], index, x, y, image_flip, 1, 0, c_white , 1);
		draw_sprite(spr_player_walking, index, x, y);

	}
	
//draw_text(x, y - 20, string(depth));
//draw_text(x, y - 20, string(x) + ", " + string(y));