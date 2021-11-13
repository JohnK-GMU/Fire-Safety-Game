if (instance_exists(obj_popUp_PASS)){exit;}

//********** X and Y stuff
x = mouse_x;
y = mouse_y;

if (x > 601){x = 601;}
if (x < 32){x = 32;}


if (y > 314){y = 314;}
if (y < 31){y = 31;}
//**************************

//shooting gas
target = noone;
if(instance_exists(obj_1stPPP_fire) && mouse_check_button(mb_left)){
target = collision_rectangle(x - 388, y - 156, x, y, obj_1stPPP_fire, false, false);
}
if (target != noone){
	target.amount -= 5;
}


if (!instance_exists(obj_1stPPP_fire))
{obj_player.mode = "normal"; room_goto(obj_1stPPP_mod.next_room);}