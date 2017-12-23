/// @description Insert description here
// You can write your code in this editor
if(o_Player != pointer_null && o_Player2 != pointer_null && point_distance(x,y,o_Player.x,o_Player.y) < point_distance(x,y,o_Player2.x,o_Player2.y)){
	target = o_Player;
}else if(o_Player != pointer_null && o_Player2 != pointer_null && point_distance(x,y,o_Player.x,o_Player.y) > point_distance(x,y,o_Player2.x,o_Player2.y)){
	target = o_Player2;
}else if (o_Player == pointer_null && o_Player2 != pointer_null){
	target = o_Player2;
}else if(o_Player != pointer_null && o_Player2 == pointer_null){
	target = o_Player;
}else{
	target = pointer_null;
}