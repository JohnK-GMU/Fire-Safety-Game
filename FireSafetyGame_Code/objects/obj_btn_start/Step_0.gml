//if mouse hovers over this button
if (mouse_x > x && mouse_x < x + 333 && mouse_y > y && mouse_y < y + 123){
	//if the mouse clicks on this button
	if(mouse_check_button_pressed(mb_left)){pressed = true;}
	if (opacity < 1) {opacity += 0.1;}
}
else {if (opacity > 0) {opacity-= 0.1;}}

if (pressed == true && mouse_check_button_released(mb_left)){
	//go to game
	room_goto(Room_gameOver);
	//Room_floor8
	//Room_kitchen
}