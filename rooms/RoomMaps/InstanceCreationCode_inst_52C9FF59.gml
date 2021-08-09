var map1 = instance_create_depth(128, 160, -1, oButton); // 64x64
map1.text = "";
map1._width = 128;
map1._height = 128;
map1.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
map1.func = function () { 
	global.map = 1;
	room_goto(RoomDifficulty); };
map1.image = sMap1;
var map2 = instance_create_depth(320, 160, -1, oButton);
map2.text = "";
map2._width = 128;
map2._height = 128;
map2.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
map2.func = function () { 
	global.map = 2;
	room_goto(RoomDifficulty); };
map2.image = sMap1;
var map3 = instance_create_depth(512, 160, -1, oButton);
map3.text = "";
map3._width = 128;
map3._height = 128;
map3.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
map3.func = function () { 
	global.map = 3;
	room_goto(RoomDifficulty); };
map3.image = sMap1;

var map4 = instance_create_depth(128, 352, -1, oButton);
map4.text = "";
map4._width = 128;
map4._height = 128;
map4.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
map4.func = function () { 
	global.map = 4;
	room_goto(RoomDifficulty); };
map4.image = sMap1;
var map5 = instance_create_depth(320, 352, -1, oButton);
map5.text = "";
map5._width = 128;
map5._height = 128;
map5.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
map5.func = function () { 
	global.map = 5;
	room_goto(RoomDifficulty); };
map5.image = sMap1;
var map6 = instance_create_depth(512, 352, -1, oButton);
map6.text = "";
map6._width = 128;
map6._height = 128;
map6.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
map6.func = function () { 
	global.map = 6;
	room_goto(RoomDifficulty); };
map6.image = sMap1;





var backButton = instance_create_depth(48, 463, -1, oButton);
backButton.text = "Back";
backButton._width = 96;
backButton._height = 32;
backButton.colors = {main: merge_color(c_blue,c_white, 0.2), outline:merge_color(c_black,c_white, 0.1), hover:c_blue, bgcolor:c_white, text:c_black};
backButton.func = function () { room_goto(RoomStart); };
var exitButton = instance_create_depth(591, 462, -1, oButton);
exitButton.text = "Exit";
exitButton._width = 96;
exitButton._height = 32;
exitButton.colors = {main: c_aqua, outline:c_white, hover:c_orange, bgcolor:c_white, text:c_black};
exitButton.func = function () { game_end(); };