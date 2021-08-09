
var easyDifficulty = instance_create_depth(320, 116, -1, oButton);
easyDifficulty.text = "Easy";
easyDifficulty._width = 96;
easyDifficulty._height = 32;
easyDifficulty.colors = {main: c_silver, outline:c_white, hover:c_green, bgcolor:c_white, text:c_black};
easyDifficulty.func = function () { global.difficulty = "easy"; room_goto(RoomGame); };
var mediumDifficulty = instance_create_depth(320, 180, -1, oButton);
mediumDifficulty.text = "Medium";
mediumDifficulty._width = 96;
mediumDifficulty._height = 32;
mediumDifficulty.colors = {main: c_silver, outline:c_white, hover:c_blue, bgcolor:c_white, text:c_black};
mediumDifficulty.func = function () { global.difficulty = "medium"; room_goto(RoomGame); };
var hardDifficulty = instance_create_depth(320, 244, -1, oButton);
hardDifficulty.text = "Hard";
hardDifficulty._width = 96;
hardDifficulty._height = 32;
hardDifficulty.colors = {main: c_silver, outline:c_white, hover:c_orange, bgcolor:c_white, text:c_black};
hardDifficulty.func = function () { global.difficulty = "hard"; room_goto(RoomGame); };
var expertDifficulty = instance_create_depth(320, 308, -1, oButton);
expertDifficulty.text = "Expert";
expertDifficulty._width = 96;
expertDifficulty._height = 32;
expertDifficulty.colors = {main: c_silver, outline:c_white, hover:c_red, bgcolor:c_white, text:c_black};
expertDifficulty.func = function () { global.difficulty = "expert"; room_goto(RoomGame); };
var insaneDifficulty = instance_create_depth(320, 372, -1, oButton);
insaneDifficulty.text = "Insane";
insaneDifficulty._width = 96;
insaneDifficulty._height = 32;
insaneDifficulty.colors = {main: c_silver, outline:c_white, hover:c_black, bgcolor:c_white, text:c_red};
insaneDifficulty.func = function () { global.difficulty = "insane"; room_goto(RoomGame); };





var backButton = instance_create_depth(48, 463, -1, oButton);
backButton.text = "Back";
backButton._width = 96;
backButton._height = 32;
backButton.colors = {main: merge_color(c_blue,c_white, 0.2), outline:merge_color(c_black,c_white, 0.1), hover:c_blue, bgcolor:c_white, text:c_black};
backButton.func = function () { room_goto(RoomMaps); };
var exitButton = instance_create_depth(591, 462, -1, oButton);
exitButton.text = "Exit";
exitButton._width = 96;
exitButton._height = 32;
exitButton.colors = {main: c_aqua, outline:c_white, hover:c_orange, bgcolor:c_white, text:c_black};
exitButton.func = function () { game_end(); };