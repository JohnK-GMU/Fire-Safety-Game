obj_player.mode = "cutscene";

depth  = -25; //?

scale = 0;
fade = 1;
stage = 0;

//stage 0 - image pop up
//stage 1 - wait for Enter
//stage 2 - image pop down
//stage 3 - fading out


//set up the position
x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2);  
y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2);