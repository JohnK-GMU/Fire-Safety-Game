target = pointer_null;

//blow smoke 
if(mouse_check_button(mb_left) && (!instance_exists(obj_popUp_PASS))){
	//draw_sprite(spr_1stPPP_gas,0, x, y);
	draw_sprite(spr_muzzleOn, shot_index, x, y);
	shot_index += 0.2;
}
else
{
 draw_sprite(spr_muzzleOff, 0, x, y);
}


draw_sprite(spr_1stPPP_fireExtinguisher,0, 100, 300);