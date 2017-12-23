/// @description Insert description here
// You can write your code in this editor
if(hpGUITimer > 0){
	perc = hp/maxhp * 100;
	draw_healthbar(x - 12.5, y - 17.5, x + 12.5, y - 22.5, perc ,c_black, c_red, c_lime, 0, true, true)
}