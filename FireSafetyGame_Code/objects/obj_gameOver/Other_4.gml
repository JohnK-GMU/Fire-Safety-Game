//when the game starts, this variable is false
global.generic_flag2 = !global.generic_flag2;


//if true, show controls and go to kitchen
if (global.generic_flag2 == true){
	
	layer_set_visible("Background1", true);
	next_room = Room_kitchen;
	
}
else {//if false, show game over and go to main menu
	
	layer_set_visible("Background0", true);
	instance_create_layer(0, 0, "Instances", obj_links);
	next_room = Room_mainMenu;
	
}