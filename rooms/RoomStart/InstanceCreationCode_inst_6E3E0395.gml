window_set_cursor(cr_none);
cursor_sprite = sBomb;

global.costModifier = 1;
global.selectedTower = noone;
global.coins = infinity;
global.difficulty = "easy";
global.sandbox = false;

//var mapsButton = instance_create_depth(320, 94, -1, oButton);
//mapsButton.text = "Maps";
//mapsButton._width = 192;
//mapsButton._height = 64;
////mapsButton.colors = {color:c_white, hover:c_green, bgcolor:c_white}
//mapsButton.colors = {main: merge_color(c_blue,c_white, 0.2), outline:merge_color(c_black,c_white, 0.1), hover:c_blue, bgcolor:c_white, text:c_black};
//mapsButton.func = function () { room_goto(RoomMaps); };

var mapsButton = instance_create_depth(320, 205, -1, oButton);
mapsButton.text = "Maps";
mapsButton._width = 192;
mapsButton._height = 64;
//mapsButton.colors = {color:c_white, hover:c_green, bgcolor:c_white}
mapsButton.colors = {main: merge_color(c_blue,c_white, 0.2), outline:merge_color(c_black,c_white, 0.1), hover:c_blue, bgcolor:c_white, text:c_black};
mapsButton.func = function () { room_goto(RoomMaps); };

var sandboxButton = instance_create_depth(320, 316, -1, oButton);
sandboxButton.text = "Sandbox";
sandboxButton._width = 192;
sandboxButton._height = 64;
sandboxButton.colors = {main: c_aqua, outline:c_white, hover:c_orange, bgcolor:c_white, text:c_black};
sandboxButton.func = function () { global.difficulty = "sandbox"; global.sandbox = true; room_goto(RoomSandbox); };
var exitButton = instance_create_depth(320, 427, -1, oButton);
exitButton.text = "Exit";
exitButton._width = 192;
exitButton._height = 64;
exitButton.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
exitButton.func = function () { game_end(); };