draw_self();

draw_sprite(spr_house1_pcLight, 0 ,  x+ end_pt_x, y + end_pt_y);

draw_text(x, y, color);
draw_text(x, y+ 20, "x: " + string (end_pt_x));
draw_text(x, y+ 40, "y: " + string (end_pt_y));

draw_sprite(spr_house1_pcLight, 0 , end_pt_x + x, abs(end_pt_y)+y);