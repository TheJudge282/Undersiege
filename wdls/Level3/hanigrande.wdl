
bmap smoke_mapgaz1=<gaz_grenade_smokeg.tga>;

var MyIndecator = 0;
define __BompExplosion = 203; 

function TimedGazExpEvent()
{
	if (event_type == event_detect) && (MyIndecator == __BompExplosion)
	{		
		if (you!= null)
		{
			if (you._type == _type_player)
			{				
				my.event = null;																
				ssSmoke = 1;				
				showmessage(10,157);
				you = player;
				HeartPlayer(2);
				temp.x = my.x - player.x;
				temp.y = my.y - player.y;
				temp.z = 0;
				vec_to_angle( my_angle, temp);
				ShowEnemyPos(ang(my_angle.pan));			
				ssSmoke =0;
				wait(30);
				my.event = TimedGazExpEvent;
			}
		}
	}
}

function TimedGazExp
{
	play_entsound(my,smokeexp,500);
	my.enable_scan = on;
	my.enable_detect = on;
	my.event = TimedGazExpEvent;
	my.invisible=1;
	my.passable=1;
	my.flag1=1;
	my.skill1=0;
	my.flag3 = 1;	

	while(my.skill1<150)
	{

		temp.pan = 360;
		temp.tilt = 180;
		
		if (my.flag5 == 1)
		{
			temp.z = 500;
		}
		else
		{
			temp.z = 250;
		}
		
		MyIndecator = __BompExplosion;
		scan(my.pos ,my.pan ,temp);
		MyIndecator = 0;


		my.skill2=my.skill1+10;
		while(my.skill1<my.skill2)
		{

			my_angle.x = 50;
			my_angle.y = 75;
			my_angle.z = 50;
			effect( PartsThrow, 5, my.pos, my_angle);
			my.skill1+=1;			
		}
		wait (1);
	}

	create( <xplosion.mdl>, my.pos, ExplosionsTga);
	remove(me);
}

function h_free_throw()
{
	if(event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push)
	{
		exclusive_entity;
		my.skill4=180;	

		temp.x = 10;
		temp.y = 0;
		temp.z = 0;
		vec_to_angle(my.angle,bounce);
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);

		forces = my.skill12/7.5;
		if (forces<1)
		{
		 wait (100);
		 my.flag3 = 1;
		 create( <xplosion.mdl>, my.pos, ExplosionsTga);
		 remove me;
		 return;
		}
		hcirclethrow();


	}
}

define _DatenationTime = 100;
define _PlayerDatenation = 300;

function GasInplayerH()
{
	my.invisible = on;
	my.passable = on; 

	gunselect8();

	you = Pointer_To_Entity(player.WeaponMesh1);
	you.BoneName = IWeaponBone;
	morph (<granedG.mdl> , you);

	my.skill40 = 0;
	BomInPlayerHand = 1;
	while(1) 
	{		
		if (snd_playing(my.skill1) == 0)
		{
			play_entsound(my,smokeloop,300);
			my.skill1 = result;
		}
		
		if (playerded == 1)
		{
			return;
		}

		my.skill40 += 1;
		if (my.skill40 > 25)
		{
			my.skill40 = 0;

			ssSmoke = 1;
			showmessage(10,157);
			you = player;
			HeartPlayer(2);
			temp.x = my.x - player.x;
			temp.y = my.y - player.y;
			temp.z = 0;
			vec_to_angle( my_angle, temp);
			ShowEnemyPos(ang(my_angle.pan));			
			ssSmoke = 0;
			
		}
								
		if (BomInPlayerHand == 0)
		{												
			object1.visible= off;
			remove me;
			return;
		}

		
		temp.x = 30;
		temp.y = 0;
		temp.z = 0;
		
		vec_rotate(temp,camera.pan);
		vec_add(temp,camera.pos);
		vec_set(my.pos,temp);

		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 1, my.pos, my_angle);
		wait (1);
	}
}


function GazEGround()
{
	if (event_type == event_scan) && (indicator == 980) && (my.flag2 == 0)
	{				
		my.flag2 = 1;
		showmessage(10,163);
		
	}

	if (event_type == event_scan) && (indicator == _handle)
	{
		my.event = null;
		exclusive_entity;
		my.invisible = on;				
		remove(me);		
		object1.visible= on;
		temp.x = 10;
		temp.y = 0;
		temp.z = 0;
		vec_rotate(temp,player.pan);
		vec_add(temp,player.pos);		
		create(<granedG.MDL>,temp,GasInplayerH);
		return;
	}
}

function GazGround()
{
	exclusive_entity;
	my.enable_scan = on;
	my.passable = on; 
	my.event = GazEGround;
	my.flag3 = 1;	
	my.skill1 = 0;
	while (my.flag3)
	{
		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 1, my.pos, my_angle);
		if (my.skill1>_DatenationTime)
		{ break;
		}
		my.skill1 += 1;
		wait(1);
	}
	create( <xplosion.mdl>, my.pos, ExplosionsTga);
	remove me;
}

function h_free_throwgaz()
{
	
	if (event_type == event_scan) && (indicator == _handle)
	{
		my.event = null;
		exclusive_entity;
		remove(me);
		
		object1.visible= on;
		temp.x = 10;
		temp.y = 0;
		temp.z = 0;
		vec_rotate(temp,player.pan);
		vec_add(temp,player.pos);
		create(<granedG.MDL>,temp,GasInplayerH);
		
		return;
	}
	
	
	if(event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push
		)
	{
		exclusive_entity;		
		my.skill4=180;	

		temp.x = 10;
		temp.y = 0;
		temp.z = 0;
		vec_to_angle(my.angle,bounce);
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);

		forces = my.skill12/7.5;						
		if ( forces < 1 ) && (my.flag4 ==0)
		{
			
			my.flag4 = 1;
			GazGround();
		}
		else
		{
			hcirclethrow();
		} 
	}	
}

function hcirclethrow {
	my.skill12= forces;
	wait (1);
	my.skill1 = my.skill12;
	my.skill2 = 0;
	my.skill3 = 0;
	vec_rotate( my.skill1, my.pan);
	vec_add( my.skill1, my.pos);
	my.skill4=0;	
	while(my.skill4<180)
	{
		my.tilt = 90-my.skill4;
		temp.x = my.skill12/25;
		temp.y = 0;
		temp.z = -my.skill4/5-my.skill12/10;
		move( my, temp, nullskill);
		my.skill4 += 0.5;
		wait (1);
	}
}

function hgazcirclethrow {
	my.skill12= forces;
	wait (1);
	my.skill1 = my.skill12;
	my.skill2 = 0;
	my.skill3 = 0;
	vec_rotate( my.skill1, my.pan);
	vec_add( my.skill1, my.pos);
	my.skill4=0;	
	while(my.skill4<180)
	{
		play_entsound(my,smokeloop,300);

		my.tilt = 90-my.skill4;
		temp.x = my.skill12/25;
		temp.y = 0;
		temp.z = -my.skill4/5-my.skill12/10;
		move( my, temp, nullskill);
		my.skill4 += 0.5;

		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 1, my.pos, my_angle);
		wait (1);
	}
}

function hfreethrow()
{
	my.enable_block = on;
	my.enable_entity = on;
	my.enable_stuck = on;
	my.enable_impact = on;
	my.enable_push = on;
	my.event = h_free_throw;
	my.scale_x = 1.2;
	my.scale_y = 1.2;
	my.scale_z = 1.2;
	
	hcirclethrow();

}

function hfreethrowgaz()
{
	my.enable_block = on;
	my.enable_entity = on;
	my.enable_stuck = on;
	my.enable_impact = on;
	my.enable_push = on;
	my.enable_scan = on;

	my.event = h_free_throwgaz;
	my.scale_x = 2;
	my.scale_y = 2;
	my.scale_z = 2;
	
	hgazcirclethrow();

}

function hthrowthegrenade(throwerentity,forcesd,gaz,scan_thekeys)
{
	var Ggernade= gaz;

	 me = throwerentity;
	 var ThrowFrame = 0;
	 var throwkey = key_lastpressed;
	 var scan_thekey = scan_thekeys;

	 while( ThrowFrame < 10 )
	 {
	  ThrowFrame +=1;
	  ent_frame("4shot", ThrowFrame);
	  wait (1);
	 }
		if (scan_thekey)
		{
		while (key_pressed(throwkey)==1)
		{
		wait (1);
		}
		}

	ThrowFrame  = 10;
	 while( ThrowFrame  < 25 )
	 {
	  ThrowFrame +=1;
	  ent_frame("4shot", ThrowFrame);
	  wait (1);
	 }
	 forces = forcesd;

	 vec_for_vertex(temp,me,410);
	 if (Ggernade)
	 {
	 create(<granedG.MDL>,temp,hfreethrowgaz);
	 
	 }
	 else
	 {
	 create(<Wgraned.MDL>,temp,hfreethrow);

	 }
	 vec_set(you.pan,me.pan);

	 ThrowFrame  = 25;
	 while( ThrowFrame < 100 )
	 {
	  ThrowFrame +=1;
	  ent_frame("4shot", ThrowFrame);
	  wait (1);
	 }
}
