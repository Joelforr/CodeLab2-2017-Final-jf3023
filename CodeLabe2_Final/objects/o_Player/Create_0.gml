/// @description Insert description here
// You can write your code in this editor

enum states{
 idle,
 walking,
 jumping,
 falling
}

state = states.idle;

hsp = 0;
vsp = 0;
haclGround = 3;
haclAir = 1;
maxhspGround = 3;
maxhspAir = 2;
grv = .3;
quickJumpBonusGrv = .5;

walksp = 3;
jumpSpeed = -10;
shootKick = 0;
fireDelay = 0;
jumpFlag = false;
safety = true;

hp = 10;
maxhp = 10;
hpGUITimer = 0;

flash = 0;
tilemap = layer_tilemap_get_id("Collision");