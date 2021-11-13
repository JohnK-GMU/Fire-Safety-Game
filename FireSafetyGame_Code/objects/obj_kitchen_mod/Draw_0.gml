//entrance
index ++;
/*
if (index < 60){
	draw_sprite(spr_leon_walkRight, index, 0 + index, 200);
	//draw_sprite(spr_doorModes, 1, 0 , 200);
}
*/

if (reset == 0){
	draw_sprite(spr_player_fall, 3, obj_player.x, obj_player.y);
}

//red light indicator
if(!stove_done){draw_sprite(spr_redLight, 0, 130, 153); }
else {draw_sprite(spr_redLight, 1, 130, 153); }

//draw fire
if (!die && fire_size != 0){
	draw_sprite_ext(spr_fire, fire_index, fire_x, fire_y, fire_size, fire_size, 0, c_white, fire_size);
	if (fire_off && fire_size != 0){fire_size-= 0.05;}
	fire_index += 0.2;
	if (fire_index == 100){fire_index = 0;}
}

if (draw_pot){draw_sprite(spr_lidCover, 0, fire_x-2, fire_y - 15);}


if((instance_exists(obj_popUp) && animate == false && reset != 0
 || (instance_exists(obj_fade) && reset != 0)) && obj_player.mode == "cutscene"){
	draw_sprite(spr_shadow, 0, obj_player.x , obj_player.y);
	draw_sprite(spr_player_still, 0, obj_player.x, obj_player.y);	
}


//draw interaction animation
if (animate){
	draw_sprite(spr_shadow, 0, obj_player.x , obj_player.y);
	draw_sprite(spr_player_interact, animate_index, obj_player.x, obj_player.y);
	animate_index += 0.2;
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
	draw_sprite_ext(spr_buttonBar, global.prompt_bar, obj_player.x + offset_x, obj_player.y + offset_y,
	pop, pop, 0, c_white, pop );
	draw_sprite_ext( spr_keyboardBindings, 0, obj_player.x + offset_x, obj_player.y + offset_y,
	pop, pop, 0, c_white, pop );
	draw_text(obj_player.x + 20 + offset_x, obj_player.y+ 2 +offset_y, prompt);
}

/*
//draw collision boxes
if (water_done == false){draw_rectangle(water_x -60, water_y-20, water_x+32, water_y+32, true);}
if (lid_done == false)draw_rectangle(lid_x -50, lid_y-10, lid_x+10, lid_y+20, true);
if (soda_done == false)draw_rectangle(soda_x -32, soda_y, soda_x+32, soda_y+55, true);
if (fire_off == false)draw_rectangle(fire_x, fire_y, fire_x+50, fire_y+64, true);
//if (water_done == true)draw_rectangle(stove_x, stove_y, stove_x+64, stove_y+64, true);
*/


if (die){
	draw_sprite(spr_shadow, 0, obj_player.x , obj_player.y);
	draw_sprite(spr_player_fall, die_frame, obj_player.x, obj_player.y);
	if (die_frame < 3) {die_frame+= 0.15;}
	draw_sprite(spr_boom, explode_frame, fire_x, fire_y);
	explode_frame+= 0.15;
	
	if (explode_frame >= 5){
		die = false;
		reset = 0;
		global.popUp_blank = false;
		global.popUp_sub = 1;
		global.popUp_turnNormal = false;
		instance_create_layer(0, 0, "Instances", obj_popUp);
	}
}