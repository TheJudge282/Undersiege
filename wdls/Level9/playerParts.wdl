
function player_event()
{

	if event_type == event_scan && indicator == _explode
	{	
		HeartPlayer(50);
		return;
	}
}

function PlayerBody()
{
	you.BodyLnk = Entity_To_Pointer( me);
	vec_set( my.scale_x, you.scale_x);
	my.scale_x *= 1.2;
	my.scale_y *= 1.2;
	my.invisible = 1;
	my._type= _type_player;
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = player_event;
}
