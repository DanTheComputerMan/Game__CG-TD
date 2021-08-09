// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// function Script1(){
	
// }

var xx = argument0;
var yy = argument1;
var width = argument2;
var height = argument3;

if (!(xx && yy && width && height)) return false;

xx = (xx - width/2);
yy = (yy - height/2);

if(mouse_x > xx && mouse_x < xx + width) {
	if(mouse_y > yy && mouse_y < yy + width) {
		return true;
	}else return false;
}else return false;