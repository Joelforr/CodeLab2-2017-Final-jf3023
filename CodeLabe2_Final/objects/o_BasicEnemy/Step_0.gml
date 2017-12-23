/// @description Insert description here
// You can write your code in this editor



if(target != pointer_null){
if(eState == enemyStates.idle){
	
	my_dir = irandom_range(0,359);
	hsp = lengthdir_x(spd, my_dir);
	vsp = lengthdir_y(spd, my_dir);
	
	
	if(collision_circle(x,y,512,target,false,false)){
	eState = enemyStates.chase;
	}
}

if(eState == enemyStates.chase){
	my_dir = point_direction(x,y,target.x,target.y);
	hsp = lengthdir_x(spd, my_dir);
	vsp = lengthdir_y(spd, my_dir);
	
	if(!collision_circle(x,y,512,target,false,false)){
	eState = enemyStates.idle;
	}
	
	if(collision_circle(x,y,16,target,false,false)){
	eState = enemyStates.detonate;
	}
}

if(eState == enemyStates.detonate){
	
	instance_create_layer(x,y, "Explosions", o_Explosion);
	instance_destroy();
}
}

//Horizontal Collision
if(place_meeting(x+hsp,y,o_Wall)){
	while(!place_meeting(x+sign(hsp),y,o_Wall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x += hsp; //Add horizontal move speed


//Vertical Collision
if(place_meeting(x,y+vsp,o_Wall)){
	while(!place_meeting(x,y+sign(vsp),o_Wall)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
y += vsp; //Add vertical move speed

if(hp <= 0){
	instance_destroy();
}
		