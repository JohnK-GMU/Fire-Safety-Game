obj_player.mode = "cutscene";
obj_cameraMain.mode = "follow cam";

//electric room
if(global.generic_flag == 0){	
layer_set_visible("Background0", true);
next_room = Room_electric;
instance_create_layer( 320, 192, "Instances", obj_1stPPP_fire);
instance_create_layer( 320, 300, "Instances", obj_1stPPP_fireExtinguisher);
}

//if in the office evacuation
else if (global.generic_flag == 1){
layer_set_visible("Background1", true);
next_room = Room_floor8;
instance_create_layer( 320, 192 + 100, "Instances", obj_1stPPP_fire);
instance_create_layer( 200, 192 + 100, "Instances", obj_1stPPP_fire);
instance_create_layer( 440, 192 + 100, "Instances", obj_1stPPP_fire);
instance_create_layer( 320, 300 + 100, "Instances", obj_1stPPP_fireExtinguisher);
}

instance_create_layer(0, 0 , "Instances", obj_popUp_PASS);