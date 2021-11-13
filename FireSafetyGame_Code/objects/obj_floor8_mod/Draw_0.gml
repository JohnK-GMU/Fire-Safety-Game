if (fire_killed){
draw_sprite(spr_player_still, 0, 2200 , 280);
}


if (ext_taken == false){
	draw_sprite(spr_ext, 0, ext_x , ext_y);
}


if (!fire_killed){
	draw_sprite_ext(spr_fire, fire_frame, 2200 , 271, 1, 1, 0, c_white, 0.8);
	draw_sprite_ext(spr_fire, fire_frame, 2251 , 304, 1, 1, 0, c_white, 0.8);
	draw_sprite_ext(spr_fire, fire_frame, 2220 , 290, 1, 1, 0, c_white, 0.8);
	fire_frame += 0.15;
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