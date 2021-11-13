x = obj_player.x;
y = obj_player.y;

if (global.current_room == "floor8"){
	if (x<230){x = 230;}
	if (x > 800){ x = 800;}
	if (y < 240){y = 240;}
	if (y > 360){y = 360;}	
}
else if (global.current_room == "floor1"){
	
	if (x< 1740){x = 1740;}
	if (x > 2240){ x = 2240;}
	if (y < 240){y = 240;}
	if (y > 360){y = 360;}	
}
