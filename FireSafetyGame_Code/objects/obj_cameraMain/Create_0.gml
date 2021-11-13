//https://www.youtube.com/watch?v=Pd54vNc2N4E&ab_channel=ShaunSpalding
/*
camera = camera_create();

var vm = matrix_build_lookat (x,y,-10, x, y, 0,0,1,0);
var pm = matrix_build_projection_ortho(640, 480,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;
*/
/**

This object manages our camera. For the most part...
x = player.x
y = player.y

but during a cutscene, we may want to turn on bobbing, bobbing 
is its own thing, you either turn it on or off. 

boolean bobbing, x , y

but aside from that, if you want to move the camera to focus on 
other thing than the player. You do a jump

x = thing.x
y = thing.y

note that the scene object will control the camera, camera just
switches modes and stuff, but also do traget_xy

so if you want the camera to shift to a thing without teleporting,
then the object sets 

traget_x

traget_y

target_speed

and the camera will move to that thing until it reaches its target

anything else (like earth quake shaking)
will be instructed and controlled by the cutscene object, the camera
goes to submissive mode and etc.

**/

mode = "follow cam";
//"follow target"
//"be managed"
//"follow target standard"

target_x = 0;
target_y = 0;

target_speed_x = 1;
target_speed_y = 1;

depth = -25

//FOR DRBUG DRAW VARS
corner_x = 0;
corner_y = 0;