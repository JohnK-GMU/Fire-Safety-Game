//debug
/*
draw_set_color(c_black);
x = obj_cameraMain.x;
y = obj_cameraMain.y + 32;
draw_self();
draw_text(x,y, string(debug));
debug++;
*/

//Debug
draw_set_color(c_black);
draw_rectangle(
corner_x, 
corner_y, 
corner_x + 95,
corner_y + 90,
false);

draw_set_color(c_white);
draw_text(corner_x,corner_y, "--Debug--");
draw_text(corner_x,corner_y + 15, "current_floor: "  + string(global.current_floor));
draw_text(corner_x,corner_y + 25, "current_room: " + string(global.current_room));
