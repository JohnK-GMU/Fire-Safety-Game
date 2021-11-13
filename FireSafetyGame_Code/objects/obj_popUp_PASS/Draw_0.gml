//draw the pop up
switch (stage){
	case 0: draw_sprite_ext(spr_PASS, phase, x, y, scale, scale, 0, c_white, 1); break;
	
	case 1: draw_sprite(spr_PASS, phase, x, y); break;
	
	case 2: draw_sprite_ext(spr_PASS, phase, x, y, scale, scale, 0, c_white, 1); break;
	
	case 3: break;
}