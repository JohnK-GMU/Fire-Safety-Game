
//*****video taken from shawn spadeling but been altered
//manage fade

if(global.fade_mode == 0){ //fade to black
	a = clamp(a + ( 1 * global.fade_speed), 0 , 1); 
	if (a >= 1)
	{
		show_debug_message("a: " + string(a));
		if (global.fade_turnNormal == true){obj_player.mode = "normal";}
		instance_destroy();
	}
}

else if(global.fade_mode == 1){ //fade to normal
	a = clamp(a + ( -1 * global.fade_speed), 0 , 1); 
	if (a <= 0)
	{
		if (global.fade_turnNormal == true){obj_player.mode = "normal";}
		instance_destroy ();
	}
}

else /* if (global.fade_mode == 2) */{ //if fade into black and fade out
	a = clamp(a + (fade * global.fade_speed), 0 , 1); 
	if (a >= 1)
	{
		fade = -1;
	}
	if (a <= 0) && (fade == -1)
	{
		if (global.fade_turnNormal == true){obj_player.mode = "normal";}
		instance_destroy ();
	}
}


//draw the fade
draw_set_color(global.fade_color);
draw_set_alpha(a);
draw_rectangle( //view_xview[0], view_yview[0] , view_xview[0] + view_wview[0], 3000, 0);
	camera_get_view_x(view_camera[0]), // view_xview[0],
	camera_get_view_y(view_camera[0]), //view_yview[0],
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), //3000, //view_xview[0] + camera_get_view_width(view_camera[0]),
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), //3000, //view_yview[0] + display_get_gui_width(), 
	0
)
draw_set_alpha(1); 

//debug
/*
draw_set_color(c_black);
x = obj_cameraMain.x;
y = obj_cameraMain.y;
draw_self();
draw_text(x,y, string(debug));
debug++;
*/