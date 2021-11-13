//Debug
//draw_self();

exit;
//Debug
draw_set_color(c_black);
draw_rectangle(
corner_x, 
corner_y, 
corner_x + 95,
corner_y + 90,
false);

draw_set_color(c_white);
draw_set_font(font_digital);
draw_text(corner_x,corner_y, "--Debug--");
//draw_text(corner_x,corner_y + 15, "current_floor: "  + string(global.current_floor));
draw_text(corner_x,corner_y + 25, "current_room: " + string(global.current_room));

exit; 

draw_set_color(c_black);
draw_rectangle(
corner_x, 
corner_y, 
corner_x + 95,
corner_y + 90,
false);

draw_set_color(c_white);
draw_set_font(font_digital);
draw_text(corner_x,corner_y, "-obj_cameraMain-");
draw_text(corner_x,corner_y + 15, "mode: "  + string(mode));
draw_text(corner_x,corner_y + 25, "target_x: " + string(target_x));
draw_text(corner_x,corner_y + 35, "target_y: " + string(target_y));
draw_text(corner_x,corner_y + 48, "x: " + string(x));
draw_text(corner_x,corner_y + 58, "y: " + string(y));
draw_text(corner_x,corner_y + 68, "current_room: " + string(global.current_room));