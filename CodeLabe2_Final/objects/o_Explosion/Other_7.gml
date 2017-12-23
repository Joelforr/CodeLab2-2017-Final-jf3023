/// @description Insert description here
// You can write your code in this editor

if(collision_circle(x,y,48,o_Player,false,false)){
	o_Player.hpGUITimer = 180;
	o_Player.flash = 3;
	o_Player.hp --;
}
	
if(collision_circle(x,y,48,o_Player2,false,false)){
	o_Player2.hpGUITimer = 180;
	o_Player2.flash = 3;
	o_Player2.hp --;
}

instance_destroy();