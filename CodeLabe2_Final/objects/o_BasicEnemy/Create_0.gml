/// @description Insert description here
// You can write your code in this editor

enum enemyStates{
 idle,
 chase,
 detonate
}

eState = enemyStates.idle;

target = pointer_null;

spd = .5;
my_dir = irandom_range(0,359);

hsp = lengthdir_x(spd, my_dir);
vsp = lengthdir_y(spd, my_dir);


walksp = 4;
fireDelay = 0;

hp = 3;
maxhp = 3;
hpGUITimer = 0;

flash = 0;