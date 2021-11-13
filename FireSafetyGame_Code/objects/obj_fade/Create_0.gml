if (global.fade_mode == 1){ a = 1; } else {a = 0;}

fade = 1;

depth = -15;


/*
INFO ON THIS....

This object works in conjuction with doors. When the player collides with a door. The door 
create an instance of this object. This object will draw the black fade over the camera view.
Once it reaches maximum heights(the door is constantly checking in the step event), the door
will transition the player to the next room. Then this object will be fading out and destroy itelf.
*/

//plan changed

//debug = 0;