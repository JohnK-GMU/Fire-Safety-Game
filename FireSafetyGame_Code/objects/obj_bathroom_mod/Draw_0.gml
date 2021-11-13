//draw the hanger
if (towel_taken == false){
	draw_sprite(spr_hanger, 0, hanger_x, hanger_y);
} else{draw_sprite(spr_hanger, 1, hanger_x, hanger_y);}

//draw still player
if (instance_exists(obj_popUp) || instance_exists(obj_fade)){
	draw_sprite(spr_player_still, 0, obj_player.x,  obj_player.y);
}

//draw door handle
if(red_door){draw_sprite(spr_hotDoor, 0, 506, 144);}

//draw phone
draw_sprite(spr_phone, 0, phone_x, phone_y);

//draw the smoke
if (door_taken == false){
	draw_sprite_ext(spr_lowsmoke, smoke_frame, door_x, door_y+25, 1, 1, 0, c_white, 0.5);
	smoke_frame+= 0.15;
} else{draw_sprite(spr_towel, 0, 490, 200);}

//draw window
if (window_taken == false){
	draw_sprite(spr_window, 0, window_x, window_y);
} else{draw_sprite(spr_window, 1, window_x, window_y);}

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


/*
draw_rectangle(hanger_x, hanger_y+32, hanger_x+50, hanger_y+75, true);
draw_rectangle(wet_x -32, wet_y-32, wet_x+32, wet_y+40, true);
draw_rectangle(door_x-32, door_y+0, door_x+32, door_y+32, true);
draw_rectangle(window_x+32, window_y+20, window_x+100+32, window_y+160, true);
draw_rectangle(phone_x, phone_y+20, phone_x+32, phone_y+140, true);
*/