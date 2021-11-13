//pop ups
global.popUp_sub = 0;
global.popUp_blank = true;
global.popUp_turnNormal = true;

global.current_room = "livingroom";
global.current_floor = 8;

//fade options
global.fade_turnNormal = true; //turn player to normal after finishing the fade
global.fade_speed = 0.05;
global.fade_mode = 0;// 0 fade to black, 1 fade to normal, 2 both.
global.fade_color = c_black;

global.generic_flag = 0;

//this will be used for the GameOver/ Controls room, so we know which 
//background is approperiate for that room
global.generic_flag2 = false;

global.prompt_bar = 0;

room_goto(Room_mainMenu);