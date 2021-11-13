if (blow == false){draw_sprite(spr_electricBox, 0, box_x, box_y);}
else{draw_sprite(spr_electricBox, 1, box_x, box_y);}


if(switch_done) {draw_sprite(spr_switch, 0, switch_x, switch_y);}
else {draw_sprite(spr_switch, 1, switch_x, switch_y);}

//draw fire
if (!fire_off){
	draw_sprite(spr_fire, fire_frame, fire_x, fire_y);
	fire_frame+= 0.2;
}

if (!opening){
	switch(sequence){
		
		//keep standing next the box
		case 0:
			//draw_sprite(spr_electricBox, 0, box_x, box_y);
			draw_sprite(spr_shadow, 0, 390+174, 180+62);
			draw_sprite(spr_player_still, 0, 390+174, 180+62);
		break;
		
		//box explodes
		case 1:
			draw_sprite(spr_shadow, 0, 390+174, 180+62);
			draw_sprite(spr_player_still, 0, 390+174, 180+62);
			draw_sprite(spr_shock, index, box_x, box_y);
		break;
		
		//wait for popup"drop, roll"
		case 2:
			draw_sprite(spr_shadow, 0, 390+174, 180+62);
			draw_sprite(spr_player_still, 0, 390+174, 180+62);
			draw_sprite_ext(spr_fire, 0, 390+174, 180+62, 2, 2, 0, c_white, 0.5);
		break;
		
		//drop
		case 3:
			draw_sprite(spr_shadow, 0, 390+174, 180+62);
			draw_sprite(spr_player_fall, index, 390+174, 180+62);
			draw_sprite_ext(spr_fire, index, 390+174, 180+62 - index, 2, 2, 0, c_white, 0.5);
		break;
		
		//roll
		case 4:
			draw_sprite(spr_shadow, 0, 390+150 - (index*3), 180+62 + index - 10);
			draw_sprite(spr_player_roll, index/5, 390+150 - (index*3), 180+62 + index - 10);
			draw_sprite_ext(spr_fire, index/5, 390+150- (index*3), 180+62 + index - 10, 2 - (2*(((index*100)/70)/100)), 2 - (2*(((index*100)/70)/100)), 0, c_white, 0.8);
		break;
		
		//get up
		case 5:
			draw_sprite(spr_shadow, 0, 390+174 - 140, 180+62 + 70);
			draw_sprite(spr_player_fall, index, 390+174 - 140, 180+62 + 70);
		break;
	}	
}

//draw water bucket
if (water_done == false){
	draw_sprite(spr_bottle, 0, water_x, water_y);
}

//draw extingusher
if (ext_done == false){
	draw_sprite(spr_ext, 0, ext_x , ext_y);
}


//draw interaction animation
if (animate){
	draw_sprite(spr_shadow, 0, obj_player.x , obj_player.y);
	draw_sprite(spr_player_interact, animate_index, obj_player.x, obj_player.y);
	animate_index += 0.15;
	if (animate_index >= 7){animate = false; obj_player.mode = "normal";}
	
}


//draw prompt
draw_set_color(c_white);
draw_set_font(font_prompt);
if(show_prompt == true || pop > 0){
if (show_prompt == true){
	if(pop < 1){pop+= 0.2;}
}
else{pop-= 0.2;}
	draw_sprite_ext(spr_buttonBar,  global.prompt_bar, obj_player.x + offset_x, obj_player.y + offset_y,
	pop, pop, 0, c_white, pop );
	draw_sprite_ext( spr_keyboardBindings, 0, obj_player.x + offset_x, obj_player.y + offset_y,
	pop, pop, 0, c_white, pop );
	draw_text(obj_player.x + 20 + offset_x, obj_player.y+ 2 +offset_y, prompt);
}



if (die){
	draw_sprite(spr_player_fall, die_frame, obj_player.x, obj_player.y);
	if (die_frame < 3) {die_frame+= 0.15;}
	draw_sprite(spr_boom, explode_frame, fire_x, fire_y);
	explode_frame+= 0.15;
	
	if (explode_frame >= 5){
		die = false;
		reset = 0;
		global.popUp_blank = false;
		global.popUp_sub = 9;
		global.popUp_turnNormal = false;
		instance_create_layer(0, 0, "Instances", obj_popUp);
	}
}


/*
draw_rectangle(water_x -20, water_y-20, water_x+32, water_y+50, true);
draw_rectangle(ext_x -32, ext_y-32, ext_x+32, ext_y+32, true);
draw_rectangle(box_x-32, box_y+64, box_x+32, box_y+100, true);
draw_rectangle(switch_x-10, switch_y, switch_x+32, switch_y+100, true);
*/