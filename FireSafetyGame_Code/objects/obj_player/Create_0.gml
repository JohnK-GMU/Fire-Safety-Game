mode = "cutscene";// you walk around normally
// fixed? Don't think we'll ever need this
// cutscene: this object remains, but it de-activated until its back to normal

//shawn spadling on youtube - movements
hsp  = 0;
vsp = 0;
walksp = 3;
slip_offset = 20;
slip_speed = 1;
//Things to do:
/*
1- buttery slippery around the edges
2- diagonal wall (each room must have 1 wall somewhere, and each wall object has x-shift and w
y-shift in thier creation code so we handle all cases
3- facing directions needs to be fixed
4- speed, diagonal speed specifically.
5- accelration for smooth rotation.
*/

//my shit
p_direction = 0; //[0,7]
image_flip = -1;
walking_sprite = 0;

index = 0;

my_room = "livingroom";

depth = 0;