/// @description Insert description here
// You can write your code in this editor

//Input Variables
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("W"));

var move = key_right - key_left;

//Collision Variables
grounded = place_meeting(x,y+1,o_Wall);




#region 
if(state == states.idle){
	if(move != 0) state = states.walking;
	if(key_jump){
		state = states.jumping;
	}
}

if(state == states.walking){
	//hsp = move * walksp;
	
	
}
#endregion

//Calculate Movement
var move = key_right - key_left; // var variable are temp (last 1 fram)
//hsp = move * walksp;



if(grounded && (key_jump)){
	vsp = jumpSpeed;
}

//Shoot Bullet
if(!grounded && fireDelay < 0 && key_jump){
	sprite_index = s_Player2Shoot;
	vsp = min(shootKick, vsp);
	fireDelay = 3;
	audio_play_sound(snd_Bullet,10,false);
	with(instance_create_layer(x,y+28,"Bullets", o_Bullet2)){
		direction = 270;
		speed = 10;	
	}
}

var accel = haclGround;
var mx = maxhspGround;
if(!grounded){
	vsp += grv;
	accel = haclAir;
	mx = maxhspAir;
}
 
if(vsp < 0 && !keyboard_check(ord("W"))){
	vsp += quickJumpBonusGrv;
}
hsp += move * accel;
hsp = clamp(hsp,-mx,mx);
if(move == 0) hsp = 0;

#region Horizontal Collision
if(place_meeting(x+hsp,y,o_Wall)){
	while(!place_meeting(x+sign(hsp),y,o_Wall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
#endregion



#region Vertical Collision
if(place_meeting(x,y+vsp,o_Wall)){
	while(!place_meeting(x,y+sign(vsp),o_Wall)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
#endregion


fireDelay--;

x += hsp; //Add horizontal move speed
y += vsp; //Add vertical move speed


move_wrap(true,true,15);

//Animation
if(sign(hsp)!= 0) image_xscale = sign(hsp);
	
if(!place_meeting(x,y+1,o_Wall)){
	if(sign(vsp) > 0){
		sprite_index = s_Player2Fall;
	}else{
		sprite_index = s_Player2Jump;
	}
}else{
	if(hsp == 0){
		sprite_index = s_Player2Idle;
	}else{
		sprite_index = s_Player2R;
	}
}

if(hp <= 0){
	instance_destroy();
}
		