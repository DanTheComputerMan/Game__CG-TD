// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mouseInArea(xx, yy, _width, _height){
	return point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + _width, yy + _height);
}