//draw black bg
if (global.popUp_blank == true){
	draw_set_color(c_black);
	draw_set_alpha(fade);
	draw_rectangle(
	camera_get_view_x(view_camera[0]), 
	camera_get_view_y(view_camera[0]), 
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 
	0);
	draw_set_alpha(1);
}

//draw the pop up
switch (stage){
	case 0: draw_sprite_ext(spr_popUps, global.popUp_sub, x, y, scale, scale, 0, c_white, 1); break;
	
	case 1: draw_sprite(spr_popUps, global.popUp_sub, x, y); break;
	
	case 2: draw_sprite_ext(spr_popUps, global.popUp_sub, x, y, scale, scale, 0, c_white, 1); break;
	
	case 3: break;
}