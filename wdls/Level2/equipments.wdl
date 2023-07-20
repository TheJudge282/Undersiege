//////////////////////////////////////////////////
action open_close
{
	
	wait(1);
restore_open:

		my.skill14=0;
		my.flag1=on;
		while(my.skill1<my.max_y+20)
		{
			my.x-=10*cos(ang(my.pan));
			my.y-=10*sin(ang(my.pan));
			my.skill1+=10;
			wait(1);
		}
		my.ActiveOpen=0;
		wait(100);
		my.flag1=off;
		while(my.skill1>0)
		{
			temp.pan =360;
			temp.tilt =360;
			temp.z =200;
			indicator=_clossing;
			scan_entity(my.skill10,temp);
			if(my.skill14==1)
			{goto restore_open;}
			my.x+=10*cos(ang(my.pan));
			my.y+=10*sin(ang(my.pan));
			my.skill1-=10;
			wait(1);
		}
}

function l_door_event()
{

	if(event_type == event_detect )
	{
		if( you._type != 200){
		my.skill14=1;}
		return;
	}

	if (event_type==event_scan && indicator == _door_handle)
	{
		you._door_id=me;
		indicator=0;
		return;
	}

	if (event_type!=event_scan || indicator != _handle || my.ActiveOpen!=0 || my.flag1!=off ) 
	{
		return; 
	} 
	indicator=0;
	my.ActiveOpen=1;
	open_close();

}

function opn_d(doore)
{
	my = doore;
	my.ActiveOpen=1;
	open_close();

}

action mdoor
{remove me;return;
	vec_set(my.skill10,my.x);
	my.event = l_door_event;
	my.skill1=0;
	my.enable_scan = on;
	my.enable_detect = on;
	my.push = 10;
	my.ActiveOpen = 0; 
	my._type = 200; 
}

action mwindow
{
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = 310;
	my.passable = 1;	
}



function flagevent()
{
 if (event_type == event_detect && you._type == _type_flag)
 {
 ShowUsesMission();
 if (PressedKeys[Key_Use])
  {
   if ( SolderCounter==0 )
    {
		my.flag1 = 1;
		msggdd( 19 );
		Fade2black( 1, 1, Function_To_Pointer( "finalization"));
		//play_sound VictoryPlayer, 100;
		play_loop VictoryPlayer, 100;
    }else
    {
	msggdd( 17);
    }
  }
 }
}

function scanerplayer()
{
my.invisible = 1;
my.passable = 1;
my.flag1 = 0;
my.event = flagevent;
my.enable_detect = 1;
my.enable_scan = 1;
my.EnemyId = Entity_To_Pointer( you);

while (1)
{
	temp.x = 90;
	temp.y = 360;
	temp.z = 200;
	scan( player.x, player.pan, temp);
	if (my.flag1)
	{
		you = Pointer_To_Entity( my.EnemyId);
		you.skin = 2;
		remove me;
		return;
	}

 if ((player.x<1925.989)&&(player.x>444.438)&&(player.y<1308.427)&&(player.y>-776.839))
 {
  break;}
 wait(1);
}
 
	 my.skill1=0;
	 while (my.skill1<14)
	 {
		if (random(10)>5)
		{
		  temp.x = -468.622 + random(100)-50;
		  temp.y = -1785.840 + random(100)-50;
		  temp.z = 50;
		}else
		{
		  temp.x = 3597 + random(100)-50;
		  temp.y = 643 + random(100)-50;
		  temp.z = 50;
		}

		 create( <ckm16.mdl>, temp, SoldColl);
		 you.grenader = 1;
		 you.hide = 1;
		 my.skill1+=1;
		 wait(10);
	 }

while (1)
{
	temp.x = 90;
	temp.y = 360;
	temp.z = 200;
	scan( player.x, player.pan, temp);
	if (my.flag1)
	{
		you = Pointer_To_Entity( my.EnemyId);
		you.skin = 2;
		remove me;
		return;
	}

 wait(1);
}

}

action FlagAction
{
wait(10);
create( <point1.MDL>, player.pos, scanerplayer);
my.enable_detect = 1;
my.enable_scan = 1;
my._type = _type_flag;

while (1)
{
 my.frameanim +=4*speed/200;
 ent_cycle( "flag" , my.frameanim);
 wait(1);
}
}