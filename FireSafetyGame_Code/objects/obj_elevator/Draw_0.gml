if (animate == "interact"){	
	
	switch(stage){
		
	//door open	
	case 0:
		draw_sprite(spr_elevator, 1, x , y);
		
		draw_sprite_part(spr_elevator, 0, 0, 24, 33 - animate_index, 140, x, y);
		draw_sprite_part(spr_elevator, 0, 33+animate_index, 24, 41-animate_index, 140,x + 33 + animate_index, y);
		
		draw_sprite(spr_elevatorMask, 0, x , y);
		draw_sprite(spr_player_still, 0, obj_player.x , obj_player.y);
		animate_index ++;
		
		if (animate_index == 33){
		stage++;
		animate_index = 0;
		}
	break;
	
	//walk in there
	case 1:
		draw_sprite(spr_elevator, 1, x , y);
		draw_sprite(spr_elevatorMask, 0, x , y);
		draw_sprite(spr_player_walking, animate_index/6, obj_player.x+animate_index, obj_player.y - (animate_index/3));
		animate_index ++;
		if(animate_index == 50){ animate_index = 0; stage++;}
		draw_sprite(spr_elevatorMask, 1, x , y);
	break;
	
	//shit falls
	case 2:
		draw_sprite(spr_elevator, 1, x , y + animate_index);
		draw_sprite(spr_player_still, 0, obj_player.x+ 50, obj_player.y -(50/3) + animate_index);
		animate_index += 6;
		if(animate_index == 120){ stage++; animate_index = 0;}
		draw_sprite(spr_elevator, 2, x , y +  animate_index);
		draw_sprite(spr_elevatorMask, 0, x , y);
	break;
	
	//wait a sec
	case 3:
		animate_index ++ 
		if(animate_index == 80){ 
			animate_index = 0; 
			global.popUp_blank = false;
			global.popUp_sub = 8;
			global.popUp_turnNormal = false;
			instance_create_layer(0, 0, "Instances", obj_popUp);
			stage++;
		}
	break;
	
	//wait for popup to finish, launch fade
	case 4:
		if (!instance_exists(obj_popUp)){
			global.fade_color = c_black;
			global.fade_mode = 2;
			global.fade_speed = 0.02;
			global.fade_turnNormal = false;
			instance_create_layer(0, 0, "Instances", obj_fade);
			stage++;
		}
		
	//wait for the moment to reset
	case 5:
		if (instance_exists(obj_fade)){
		if (obj_fade.a == 1){
			room_persistent = false;
			room_restart();
		}
		}
	break;

	}
exit;
}

//draw closed elevator door
draw_sprite(spr_elevator, 0, x , y);

//draw prompt
draw_set_font(font_prompt);
if(show_prompt == true || pop > 0){
if (show_prompt == true){
	if(pop < 1){pop+= 0.2;}
}
else{pop-= 0.2;}
	draw_sprite_ext( spr_buttonBar, global.prompt_bar, x + offset_x, y + offset_y,
	pop, pop, 0, c_white, pop );
	draw_sprite_ext( spr_keyboardBindings, 0, x + offset_x, y + offset_y,
	pop, pop, 0, c_white, pop );
	draw_text(x + 20 + offset_x, y+ 2 +offset_y, prompt);
}