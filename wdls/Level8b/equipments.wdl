//////////////////////////////////////////////////
// luai l8

function  Auto_Move(Kind)
{
	
	wait(1);
	if (Kind == 1)
	{
		//my.unlit = 1;
		while(my.skill1<50)
		{
			if (my.skill19 == 1)
			{my.x-=10;goto endopen;
			}
			if (my.skill19 == 2)
			{my.x+=10;goto endopen;
			}
			if (my.skill19 == 3)
			{my.y-=10;goto endopen;
			}
			if (my.skill19 == 4)
			{my.y+=10;goto endopen;
			}
			endopen:my.skill1+=10;
			wait(1);
		}
		my.flag7=off;
	}
	else
	{
		while(my.skill1>0)
		{
			if (my.skill19 == 1)
			{my.x+=10;goto endclose;
			}
			if (my.skill19 == 2)
			{my.x-=10;goto endclose;
			}
			if (my.skill19 == 3)
			{my.y+=10;goto endclose;
			}
			if (my.skill19 == 4)
			{my.y-=10;goto endclose;
			}
			//my.y+=10*sin(ang(my.pan));
			endclose:my.skill1-=10;
			wait(1);
		}
		my.flag7=on;
	}
}

function AutomaticDoor_Event()
{

/*	if(event_type == event_detect )&&(my.ActiveOpen==1)
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
	}*/

	if (event_type==event_scan)&&(indicator == _Open_Door)
	{Auto_Move(1);return;
	} 
	if (event_type==event_scan)&&(indicator == _Close_Door)
	{Auto_Move(2);return;
	} 
	

}

action AutomaticDoor
{
	wait(50);
	vec_set(my.skill10,my.x);
	my.event = AutomaticDoor_Event;
	my.skill1=0;
	my.enable_scan = on;
	my.enable_detect = on;
	my.push = 10;
	my.ActiveOpen = 0; 
	//my._type = 200; 
	my._type = _type_elevator;
	//add_ent(me);
	my.skill27 = 0;
	my.lightrange = 20;
	my.red = 0;
	my.green = 0;
	my.blue = 0;
	my.flag7=on;
	while (1)
	{
		if (my.flag7!=off)
		{
			if (my.skill27 < 15)
			{
				my.skill27 +=1;
				my.red += 17;
			}
			else
			{
				my.skill27 +=1;
				my.red -= 17;
				if (my.skill27 > 30)
				{my.skill27 = 0;my.red=0;
				}
				
			}
		}
		wait(1);
	}
}

// end luai



action open_close
{
	Play_My_Sounds(16,0);
	wait(1);
restore_open:

		my.skill14=0;
		my.flag1=on;
		my.flag7=off;
		while(my.skill1<50)
		{
			if (my.skill19 == 1)
			{my.x-=10;goto endopen;
			}
			if (my.skill19 == 2)
			{my.x+=10;goto endopen;
			}
			if (my.skill19 == 3)
			{my.y-=10;goto endopen;
			}
			if (my.skill19 == 4)
			{my.y+=10;goto endopen;
			}
			
			//my.y-=10*sin(ang(my.pan));
			endopen:my.skill1+=5;
			wait(1);
		}
/*		my.ActiveOpen=0;
		wait(100);
		my.flag1=off;
		my.flag7=on;
		while(my.skill1>0)
		{
			temp.pan =360;
			temp.tilt =360;
			temp.z =200;
			indicator=_clossing;
			scan_entity(my.skill10,temp);
			if(my.skill14==1)
			{goto restore_open;}
			if (my.skill19 == 1)
			{my.x+=10;goto endclose;
			}
			if (my.skill19 == 2)
			{my.x-=10;goto endclose;
			}
			if (my.skill19 == 3)
			{my.y+=10;goto endclose;
			}
			if (my.skill19 == 4)
			{my.y-=10;goto endclose;
			}
			//my.y+=10*sin(ang(my.pan));
			endclose:my.skill1-=5;
			wait(1);
		}*/
		my.event = 0;
		return;
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
{
	wait(50);
	my.lightrange = 15;
	my.red = 255;
	my.green = 0;
	my.blue = 0;
	vec_set(my.skill10,my.x);
	my.event = l_door_event;
	my.skill1=0;
	my.enable_scan = on;
	my.enable_detect = on;
	my.push = 10;
	my.ActiveOpen = 0; 
	//my._type = 200; 
	my._type = _type_elevator;
	//add_ent(me);
	// luai l8
	my.skill27 = 0;
	my.lightrange = 15;
	my.red = 0;
	my.green = 0;
	my.blue = 0;
	my.flag7=on;
	while (1)
	{
		if (my.flag7!=off)
		{
			if (my.skill27 < 15)
			{
				my.skill27 +=1;
				my.red += 17;
			}
			else
			{
				my.skill27 +=1;
				my.red -= 17;
				if (my.skill27 > 30)
				{my.skill27 = 0;my.red=0;
				}
				
			}
		}
		if (my.skill11 > 200)&&(vec_dist(my.pos,player.pos)<100)
		{
			my.skill11 =0;
			showmessage(5,195);
		}
		my.skill11 += 1*(speed/200);

		wait(1);
	}
	// end
}

action mwindow
{
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = 310;
	my.passable = 1;	
	add_ent(me);
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
		play_sound VictoryPlayer, 100;
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


action ElevatorDoor
{
my._type = _type_elevator;
}
