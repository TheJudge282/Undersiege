function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}

/*action followplayer
{
	wait(50);
	my.skill17 = 0;
	my._type = _type_player1;
	while (1)
	{
		if (objectposition != null)
		{
			//you=Pointer_To_Entity(objectposition);
			ObjecPos.frame = 1;
			temp.x = objectposition.x - player.x;
			temp.y = objectposition.y - player.y;
			temp.z = objectposition.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos.roll = player.pan - temp.pan;
		}
		else
		{
			ObjecPos.frame = 2;
		}
		if (objectposition1 != null)
		{
			//you=Pointer_To_Entity(objectposition);
			ObjecPos1.frame = 1;
			temp.x = objectposition1.x - player.x;
			temp.y = objectposition1.y - player.y;
			temp.z = objectposition1.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos1.roll = player.pan - temp.pan;
		}
		else
		{
			ObjecPos1.frame = 2;
		}

		wait(1);
	}
}*/

////////////////////////////////////////////////////////////////////////////////////////////////////////
function NexttargetOffset(init,offs,pnum)
{
	if (init)
	{
		vec_set( temp, my.x);
		ent_waypoint( my._old_position_x, pnum);
	}
	else
	{
		vec_set( temp, my._old_position_x);
		my._move_count_flage = ent_nextpoint( my._old_position_x);

	}

	my_angle.x = my._old_position_x - temp.x;
	my_angle.y = my._old_position_y - temp.y;
	my_angle.z = my._old_position_z - temp.z;
	vec_to_angle( my_angle, my_angle);
	my._target_x = offs;
	my._target_y = 0;
	my._target_z = 0;
	my_angle.pan += 90;
	my_angle.tilt = 0;
	vec_rotate( my._target_x, my_angle);
	vec_add( my._target_x, my._old_position_x);
}
///////////////////////////////////////////////////////////////////////////////////////////////////
function FidaieFlash()
{
	play_entsound(my,AhmedShot,500);
	if (my._type == _type_soldier)
	{Short_GunFlash(me,62, 98);	
	}
	else
	{Short_GunFlash(me,62, 98);
	}
	
	vec_for_vertex ( p, my, 33);
	p2.x = 10000;
	p2.y = 0;
	p2.z = 0;
	my_angle.pan = my.pan + random(20)-10;
	my_angle.tilt = random(20)-10;
	vec_rotate( p2, my_angle);
	vec_add( p2, my.pos);
	Blt_Line();
}

function FidaieShot(RandDist)
{
	you = pointer_to_entity( my.enemyid);
	vec_set(FirstPoint , my.x);
	if (you != null )
	{
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle;
		//damage = Weap_damage[my.weaponnumber -1];  
		damage = 2;
		SecondPoint.x = RandDist;
		SecondPoint.y = 0;
		SecondPoint.z = 0;
		my_angle.x = random(360);
		my_angle.y = random(360);
		vec_rotate( SecondPoint, my_angle);
		SecondPoint.x +=  you.x - my.x;
		SecondPoint.y +=  you.y - my.y;
		SecondPoint.z +=  you.z - my.z + my.EnemyHeight;
		vec_to_angle( my_angle, SecondPoint);
		if (my._type == _type_soldier)
		{ShotAndDamage(50,1,1,62);
		}

	}else
	{
		my_angle.x = random(10)-5;
		my_angle.y = random(10)-5;
		vec_add( my_angle, my.pan);
	}

	SecondPoint.x =  10000;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, FirstPoint);
	my.epassable = 1;
	gun_shot_Damge();
	my.epassable = 0;
}

function FidaieHit()
{
	my._state = _state_hit;
	while (1)
	{
		if (my.GotHit==100)
		{
			Hitter_sound(2000);
		}
		if (my._health <-200)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
			return;
		}
		my.GotHit = nearnumber( my.GotHit, 0, 1*speed/100);
		ent_frame( "Fhit", 100-frc(my.GotHit/50)*100);
		if (my.GotHit==0)
		{
		 break;
		}
		wait(1);
	}
	Pointer_To_Function( my.LastState, 0, 0, 0);
}


function FidaiedDie()
{
	morph(<sldie.mdl>,me);
	death_sound(100);
	RemoveColl(me);
	my.skill1=0;
	while (my.skill1<100)
	{
		ent_frame( LonelyAnimat [ my.AnimDie ] , my.skill1);
		my.skill1 += 10*speed/200;
		wait(1);
	}
	if (player.x > -400)
	{
		temp.x = Fidaie_Posx[1];
		temp.y = Fidaie_Posy[1];
		temp.z = 25;
	}
	else
	{
		temp.x = Fidaie_Posx[0];
		temp.y = Fidaie_Posy[0];
		temp.z =25;
	}
	create(<slm16.mdl>,temp,Fidaie);
	you.skill7 = my.skill37;
	you.skill6 = my.skill37;
	you.flag3 = 1;
	if (my.flag1 == on)
	{you.flag1 = on;
	}
	else
	{you.flag1 = off;
	}
	my.weaponnumber = m4;
	create( <point1.mdl>, my.pos, PickUpAmmo);
	my.skill1=0;
	while (my.skill1<20)
	{
		my.skill1 += 0.3*speed/200;
		wait(1);
	}
	remove me;
}

function FidaieEvent()
{

	if (event_type == event_scan) && (indicator == _explode) && (Game_State[0] > 0)
	{	
		my._health-=1000;
		my.GotHit = 100;
		return;
	}

	if (event_type == event_shoot) && (indicator == _gunfire )&&(my.skill7 > 0)&&(you._type == _type_soldier)
	{ 
		//my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my._health -= 5;
		my.GotHit = 100;
	}
	if event_type == event_detect && you._type == _type_soldier
	{
		my.EnemyId = Entity_To_Pointer( you);
		if(CheckVisEnemy(196)==1) 
		{			
			my._signal = _detecte_enemy;
			you= Pointer_To_Entity( my.EnemyId); 
			you.Enemy_Count += 1;
		}
		else
		{my.EnemyId = null;
		}
		return;
	}
}
function FidaieMessage()
{	
	var reanmessage = 0;
	var iCounter = 0;
	iCounter.x = 0;
	iCounter.y = 0;
	var SoundP = 0;
	wait(int(random(300)));
	iCounter.y = 250 + random(100);
	while (1)
	{
		reanmessage=int(random(7));
		if (reanmessage == 0)
		{play_entsound(me,S_M_L10_27,2000);SoundP = result;goto EndSoun;
		}
		if (reanmessage == 1)
		{play_entsound(me,S_M_L10_28,2000);SoundP = result;goto EndSoun;
		}
		if (reanmessage == 2)
		{play_entsound(me,S_M_L10_29,2000);SoundP = result;goto EndSoun;
		}
		if (reanmessage == 3)
		{play_entsound(me,S_M_L10_30,2000);SoundP = result;goto EndSoun;
		}
		if (reanmessage == 4)
		{play_entsound(me,S_M_L10_38,2000);SoundP = result;goto EndSoun;
		}
		if (reanmessage == 5)
		{play_entsound(me,S_M_L10a_22,2000);SoundP = result;goto EndSoun;
		}
		if (reanmessage == 6)
		{play_entsound(me,S_M_L10a_23,2000);SoundP = result;goto EndSoun;
		}
		if (reanmessage == 7)
		{play_entsound(me,S_M_L10a_24,2000);SoundP = result;goto EndSoun;
		}
		
		EndSoun:
		
		while (1)
		{
			if (snd_playing(p2dSound))
			{
				stop_sound(SoundP);
			}
			iCounter.x += 1;
			if (iCounter.x > iCounter.y)
			{
				iCounter = 0;
				iCounter.y = 250 + random(100);
				break;
			}
			
			wait(1);
		}
		
		wait(1);
		//wait(max(301,int(random(600))));
	}
}
function Fidaie_Wait()
{
	var NumShot = 0;
	my.FrameAnim = 0;
	FidaieMessage();
	FidaieCounter +=1;
	if (my.flag1== 0)
	{ent_cycle("6shot" ,my.FrameAnim );
	}
	else
	{ent_cycle("2shot" ,my.FrameAnim );
	}
	if (my.flag2 == 1)
	{ent_cycle("DownShot" ,my.FrameAnim );
	}
	if (my.skill7 == 1)
	{my.pan = 6;goto EndPan;
	}
	if (my.skill7 == 2)
	{my.pan = 85;my.skill8 = 2;goto EndPan;
	}
	if (my.skill7 == 3)
	{my.pan = 95;my.skill8 = 3;goto EndPan;
	}
	if (my.skill7 == 4)
	{my.pan = -2;goto EndPan;
	}
	if (my.skill7 == 5)
	{my.pan = -150;goto EndPan;
	}
	if (my.skill7 == 6)
	{my.pan = -88;goto EndPan;
	}
	if (my.skill7 == 7)
	{my.pan = -163;goto EndPan;
	}
	if (my.skill7 == 8)
	{my.pan = -163;goto EndPan;
	}
	EndPan:
	my.skill8 = my.skill7;
	my.skill6 = 0;
	while (1)
	{
		if (game_state[0] == 101)
		{remove me;break;
		}
		if (NumShot < 8)
		{
			if (my.flag1== 0)
			{ent_cycle("6shot" ,my.FrameAnim );
			}
			else
			{ent_cycle("2shot" ,my.FrameAnim );
			}
			if (my.flag2 == 1)
			{ent_cycle("DownShot" ,my.FrameAnim );
			}
			my.FrameAnim += speed/5;
			if (my.FrameAnim > 100)
			{
				 my.FrameAnim = 0;
				 FidaieFlash();
				 FidaieShot(100);
				// ShotEffect();
			}
			you = pointer_to_entity( my.enemyid);
			if (you == null)
			{
				temp.pan = 180;
				temp.tilt = 180;
				temp.z = 1700;
				indicator = _watch;
				scan (my.x,my.pan,temp);
			}
			else
			{
				if(CheckVisEnemy(196)==1) 
				{
				FidaieShot(100);
				}
				else
				{my.enemyid = null;
				}
			}
			NumShot += 1*(speed/200);
		}
		else
		{
			NumShot += 1*(speed/200);
			NumShot.y = my.pan;
			if ((my.skill8 == 3)||(my.skill8 == 8))&&(NumShot.z > 10)
			{
				if (my.skill8 == 3)
				{my.pan = 110;
				}
				ent_cycle("3run" ,my.FrameAnim );
				my.FrameAnim+=speed/10;
				if (my.FrameAnim > 100)
				{my.FrameAnim = 0;
				}
				if (my.skill6 == 0)
				{temp.y = speed/50;
				}
				else
				{temp.y = -speed/50;
				}
				
				temp.x = 0;
				temp.z = 0;
				my.z-=CheckTheFLoor(4000);
				move( my, temp, nullskill);
			}
		}
		if (NumShot.z > 10)
		{my.flag7 = 1;
		}
		else
		{my.flag7 = 0;
		}
		if (NumShot > 50)
		{
			NumShot=0;
			NumShot.z = int(random(20));
			if (my.flag7 == 1)
			{
				if (my.skill6 == 0)
				{my.skill6 = -1;
				}
				else
				{my.skill6 = 0;my.pan=NumShot.y;
				}
			}
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("Fidaie_Wait");
			return;
		}				
		wait(1);
	}
}
function FidaieWaiting()
{
	var NumShot = 0;
	my.FrameAnim = 0;
	if (my.skill6 == -2)
	{
		Fidaie_Wait();
		return;
	}
	while (1)
	{
		if (game_state[0] == 101)
		{remove me;break;
		}
		ent_cycle("sit" ,my.FrameAnim );
		my.FrameAnim += speed/50;
		if (my.FrameAnim > 100)
		{
			 my.FrameAnim = 0;
		}
		wait(1);
	}
}

function FidaieNextPoint()
{	
	//my._move_count_flage = ent_nextpoint(my._target_x);
	if (int(random(2))>0)
	{NexttargetOffset( 0,int(random(100)), 0);
	}
	else
	{NexttargetOffset( 0,-int(random(100)), 0);
	}
	if (my.skill7 == 1)&&(my._move_count_flage == 4)
	{
		temp.x = Friend_posx[3];
		temp.y = Friend_posy[3];
		temp.z = Friend_posz[3];
		vec_set(my._target_x,temp);
		my.skill6 = -1;
	}
		if (my.skill7 == 2)&&(my._move_count_flage == 3)
		{
			temp.x = Friend_posx[0];
			temp.y = Friend_posy[0];
			temp.z = Friend_posz[0];
			vec_set(my._target_x,temp);
			my.skill6 = -1;
		}
		if (my.skill7 == 3)&&(my._move_count_flage == 3)
		{
			temp.x = Friend_posx[1];
			temp.y = Friend_posy[1];
			temp.z = Friend_posz[1];
			vec_set(my._target_x,temp);
			my.skill6 = -1;
		}
		if (my.skill7 == 4)&&(my._move_count_flage == 3)
		{
			temp.x = Friend_posx[2];
			temp.y = Friend_posy[2];
			temp.z = Friend_posz[2];
			vec_set(my._target_x,temp);
			my.skill6 = -1;
		}
		if (my.skill7 == 5)&&(my._move_count_flage == 5)
		{
			temp.x = Friend_posx[4];
			temp.y = Friend_posy[4];
			temp.z = Friend_posz[4];
			vec_set(my._target_x,temp);
			my.skill6 = -1;
		}
		if (my.skill7 == 6)&&(my._move_count_flage == 6)
		{
			temp.x = Friend_posx[5];
			temp.y = Friend_posy[5];
			temp.z = Friend_posz[5];
			vec_set(my._target_x,temp);
			my.skill6 = -1;
		}
		if (my.skill7 == 7)&&(my._move_count_flage == 6)
		{
			temp.x = Friend_posx[6];
			temp.y = Friend_posy[6];
			temp.z = Friend_posz[6];
			vec_set(my._target_x,temp);
			my.skill6 = -1;
		}
		if (my.skill7 == 8)&&(my._move_count_flage == 6)
		{
			temp.x = Friend_posx[7];
			temp.y = Friend_posy[7];
			temp.z = Friend_posz[7];
			vec_set(my._target_x,temp);
			my.skill6 = -1;
		}
	FidaieRun();
}

function FidaieRun()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if (my.passable == 0)
		{my.passable = 1;
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("FidaieRun");
			return;
		}
		//
		vec_set( point_move.x, my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{break;
		}
		//
/*
		if (vec_dist(my.x ,my._target_x ) < 25)
		{break;
		}
*/		
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/50;
		if (my.FrameAnim > 100)
		{my.FrameAnim = 0;
		}
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan=nearangle(my.pan,my_angle.pan,10);
		//my.pan = my_angle.pan;
		temp.x = speed/35;
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		wait(1);
	}
	if (my.skill6 > 0)
	{FidaieNextPoint();
	}
	else
	{Fidaie_Wait();
	}
	
}
function FidaieStartRun()
{
	wait(int(random(25)));
	my.pan = 90;
	my.skill27 = 0;
	while (1)
	{
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/50;
		if (my.FrameAnim > 100)
		{my.FrameAnim = 0;
		}
		temp.x = speed/35;
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		my.skill27 += 1;
		if (my.skill27 > 100)
		{break;
		}
		wait(1);
	}
	if (my.skill7 == 1)
	{ent_path("Friend_Path1");
	}
	if (my.skill7 == 2)||(my.skill7 == 3)||(my.skill7 == 4)
	{ent_path("Friend_Path2");
	}
	if (my.skill7 == 5)||(my.skill7 == 6)||(my.skill7 == 7)||(my.skill7 == 8)
	{ent_path("Friend_Path3");
	}
	if (my.skill7 > 0)
	{
		NexttargetOffset( 1, int(random(200)), 0);
		FidaieRun();
		return;
	}
	return;
}
action Fidaie
{
	//FidaieMessage();
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
/*	if (my.skill7 < 6)
	{my.skin = my.skill7;
	}
	else
	{my.skin = my.skill7 - 5;
	}*/
	my.skin = int(random(5));
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = lmg;
	wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	my.wieght = 50;
	wait(20);
	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimShot = IUpSnipFire;
	my.AnimDie =  0;
	my.z-=CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 0;
	my.GotHit = 0;
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = _type_compars;
	my.event = FidaieEvent;
	my.DieEvent = Function_To_Pointer("FidaiedDie");
	my.HitEvent = Function_To_Pointer("FidaieHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	my.skill37 = my.skill7;
	if (my.flag3 == 1)
	{
		FidaieStartRun();
		return;
	}
	if (my.skill7 == 1)
	{ent_path("Friend_Path1");
	}
	if (my.skill7 == 2)||(my.skill7 == 3)||(my.skill7 == 4)
	{ent_path("Friend_Path2");
	}
	if (my.skill7 == 5)||(my.skill7 == 6)||(my.skill7 == 7)||(my.skill7 == 8)
	{ent_path("Friend_Path3");
	}
	if (my.skill7 > 0)
	{
		NexttargetOffset( 1, int(random(200)), 0);
		FidaieRun();
	}
	else
	{
		FidaieWaiting();
		
	}
	return;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////
function IsrailEvent()
{
	if (event_type == event_shoot && indicator == _gunfire && you._type == _type_player)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		//my._health -= 50;
		my.GotHit = 100;
	}
	if event_type == event_detect && ((you._type == _type_compars)||(you._type == _type_player))
	{
		my.EnemyId = Entity_To_Pointer( you);
		if(CheckVisEnemy(196)==1) 
		{			
			my._signal = _detecte_enemy;
			you= Pointer_To_Entity( my.EnemyId); 
			you.Enemy_Count += 1;
		}
		else
		{my.EnemyId = null;
		}
		return;
	}
}


function IsrailDie()
{
	if (my._type == _type_soldier)
	{morph(<ckdie.mdl>,me);
	}
	else
	{morph(<sdie.mdl>,me);
	}
	
	death_sound(100);
	RemoveColl(me);
	my.skill1=0;
	while (my.skill1<100)
	{
		ent_frame( LonelyAnimat [ my.AnimDie ] , my.skill1);
		my.skill1 += 10*speed/200;
		wait(1);
	}
	temp.x = Solder_posx[my.skill8+6];
	temp.y = Solder_posy[my.skill8+6];
	temp.z = Solder_posz[my.skill8+6];
	create(<ckm16.mdl>,temp,Israil);
	you.skill6 = my.skill8;
	you.skill7 = my.skill8;
	if (my.flag1 == on)
	{you.flag1 = on;
	}
	else
	{you.flag1 = off;
	}
	my.weaponnumber = m4;
	my.skill6 = 18;
	create( <point1.mdl>, my.pos, PickUpAmmo);
	my.skill1=0;
	while (my.skill1<20)
	{
		my.skill1 += 0.3*speed/200;
		wait(1);
	}
	remove me;

}

function IsrailShot(RandDist)
{
	you = pointer_to_entity( my.enemyid);
	vec_set(FirstPoint , my.x);
	if (you != null )
	{
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle;
		//damage = Weap_damage[my.weaponnumber -1];  
		damage = 2;
		SecondPoint.x = RandDist;
		SecondPoint.y = 0;
		SecondPoint.z = 0;
		my_angle.x = random(360);
		my_angle.y = random(360);
		vec_rotate( SecondPoint, my_angle);
		SecondPoint.x +=  you.x - my.x;
		SecondPoint.y +=  you.y - my.y;
		SecondPoint.z +=  you.z - my.z + my.EnemyHeight;
		vec_to_angle( my_angle, SecondPoint);
		if (my._type == _type_soldier)
		{ShotAndDamage(50,1,1,62);
		}

	}else
	{
		my_angle.x = random(10)-5;
		my_angle.y = random(10)-5;
		vec_add( my_angle, my.pan);
	
	}

	SecondPoint.x =  10000;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, FirstPoint);
	my.epassable = 1;
	gun_shot_Damge();
	//ShotEffect();
	my.epassable = 0;
}
function Israil_Wait()
{
	var NumShot = 0;
	my.FrameAnim = 0;
	my.FrameAnim = 0;
	my.skill6 = 0;
	if (my.flag1== 0)
	{ent_cycle("7shot" ,my.FrameAnim );
	}
	else
	{ent_cycle("2shot" ,my.FrameAnim );
	}
	if (my.skill7 == 1)
	{my.pan=-90;goto EndPan1;
	}
	if (my.skill7 == 2)
	{my.pan=-106;goto EndPan1;
	}
	if (my.skill7 == 3)
	{my.pan=-170;goto EndPan1;
	}
	if (my.skill7 == 4)
	{my.pan=-175;goto EndPan1;
	}
	if (my.skill7 == 5)
	{my.pan=25;goto EndPan1;
	}
	if (my.skill7 == 6)
	{my.pan=105;goto EndPan1;
	}
	if (my.skill7 == 7)
	{my.pan=30;goto EndPan1;
	}
	EndPan1:
	while (1)
	{
		if (game_state[0] == 101)
		{remove me;break;
		}
		if (NumShot < 8)
		{
			my.FrameAnim += speed/5;
			if (my.FrameAnim > 100)
			{
				 my.FrameAnim = 0;
				 FidaieFlash();
				 IsrailShot(100);
			}
			you = pointer_to_entity( my.enemyid);
			if (you == null)
			{
				temp.pan = 180;
				temp.tilt = 180;
				temp.z = 1700;
				indicator = _watch;
				scan (my.x,my.pan,temp);
			}
			else
			{
				if(CheckVisEnemy(196)==1) 
				{
				IsrailShot(100);
				}
				else
				{my.enemyid = null;
				}
			}
			NumShot += 1*(speed/200);
		}
		else
		{
			NumShot += 1*(speed/200);
			NumShot.y = my.pan;
			if (my.flag8 == 1)&&(NumShot.z > 10)
			{
				my.pan = 110;
				ent_cycle("3run" ,my.FrameAnim );
				my.FrameAnim+=speed/25;
				if (my.FrameAnim > 100)
				{my.FrameAnim = 0;
				}
				if (my.skill6 == 0)
				{temp.y = speed/50;
				}
				else
				{temp.y = -speed/50;
				}
				
				temp.x = 0;
				temp.z = 0;
				my.z-=CheckTheFLoor(4000);
				move( my, temp, nullskill);
			}
		}
		if (NumShot.z > 10)
		{my.flag7 = 1;
		}
		else
		{my.flag7 = 0;
		}
		if (NumShot > 50)
		{
			NumShot=0;
			NumShot.z = int(random(20));
			if (my.flag7 == 1)
			{
				if (my.skill6 == 0)
				{my.skill6 = -1;
				}
				else
				{my.skill6 = 0;my.pan=NumShot.y;
				}
			}
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("Israil_Wait");
			return;
		}				
		wait(1);
	}
}
function IsrailNextPoint()
{	
	my._move_count_flage = ent_nextpoint(my._target_x);
	if( my._move_count_flage == 4)
	{
		temp.x = Solder_posx[my.skill6-1];
		temp.y = Solder_posy[my.skill6-1];
		temp.z = Solder_posz[my.skill6-1];
		vec_set(my._target_x,temp);
		my.skill6 = -1;
	}
	IsrailRun();
}



function IsrailRun()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if (vec_dist(my.pos,player.pos) < 250)
		{
			temp.x = Solder_posx[my.skill8+6];
			temp.y = Solder_posy[my.skill8+6];
			temp.z = Solder_posz[my.skill8+6];
			create(<ckm16.mdl>,temp,Israil);
			you.skill6 = my.skill8;
			you.skill7 = my.skill8;
			if (my.flag1 == on)
			{you.flag1 = on;
			}
			else
			{you.flag1 = off;
			}
			my.weaponnumber = m4;
			my.skill6 = 18;	
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			SolderCounter += 1;
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			goto endrun;
		
		}
		if (my.passable == 0)
		{my.passable = 1;
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("IsrailRun");
			return;
		}				
		if (vec_dist(my.x ,my._target_x ) < 25)
		{break;
		}		
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/50;
		//if (my.FrameAnim > 100)
		//{my.FrameAnim = 0;
		//}
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		//my.pan=nearangle(my.pan,my_angle.pan,50);
		my.pan = my_angle.pan;
		temp.x = speed/35;
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		wait(1);
	}
	if (my.skill6 > 0)
	{IsrailNextPoint();
	}
	else
	{Israil_Wait();
	}
	
	endrun:
}

//-----------------------------------------
//@ hani code
function ScanPlayerDist()
{
	while (player == null) { wait(1); }
	while (vec_dist(my.pos ,player.pos ) > 800)
	{						
		wait(1);
	}
	
	exclusive_entity;						
	my.skill6 = 20;
	SoldColl();	
}
//-----------------------------------------

action Israil
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = lmg;
	wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	my.wieght = 50;
	wait(20);
	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimShot = IUpSnipFire;
	my.AnimDie =  0;
	my.z-=CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 0;
	my.GotHit = 0;
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = _type_soldier;
	my.event = IsrailEvent;
	my.DieEvent = Function_To_Pointer("IsrailDie");
	my.HitEvent =  Function_To_Pointer( "SolderHit");//Function_To_Pointer("FidaieHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	my.skill8 = my.skill6;
	if (my.skill6 == 1)
	{ent_path("Solder_Path1");
	}
	if (my.skill6 == 2)
	{ent_path("Solder_Path3");
	}
	if (my.skill6 == 3)
	{ent_path("Solder_Path6");
	}
	if (my.skill6 == 4)
	{ent_path("Solder_Path7");
	}
	if (my.skill6 == 5)
	{ent_path("Solder_Path9");
	}
	if (my.skill6 == 6)
	{ent_path("Solder_Path10");
	}
	if (my.skill6 == 7)
	{ent_path("Solder_Path12");
	}
	ent_waypoint(my._target_x,1);
	
	// ---------------------
	//hani code
	//ScanPlayerDist();
	// ---------------------
	IsrailRun();
	return;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
function fulling_boom()
{
	
	my.invisible = on;
	my.passable = on;
	var camrock = -1;
	while (1)
	{
		play_entsound(me,BoomComing,200);
		sonar(me,5000);
		if (result < 15)
		{
			create( <xplosion.mdl>, my.pos, ExplosionsTga);
			camrock = 1;
			break;		
		}
		my.z-=10;
		wait(1);
	}

	if (vec_dist(player.pos,my.pos)<2000)&&(camrock == 1)
	{
		camrock = 50;
		while (1)
		{
			camrock-=5;
			if (my.flag8 == 0)
			{my.flag8=1;camera.roll+=1.5;
			}else
			{my.flag8=0;camera.roll-=1.5;
			}
			if (camrock == 0)
			{break;
			}
			wait(1);
		}
		camrock+=25;
		while (1)
		{
			camrock-=5;
			if (my.flag8 == 0)
			{my.flag8=1;camera.roll-=1.8;
			}else
			{my.flag8=0;camera.roll+=1.8;
			}
			if (camrock == 0)
			{break;
			}
			wait(1);
		}
		camrock = 0;
		camera.roll=0;
	}
	remove(me);
}

function RandomBooming()
{
	var boom_location;
	while (1)
	{
		if (game_state[0] == 101)
		{break;
		}
		boom_location = int(random(10));
		temp.x = BoomPosX[boom_location];
		temp.y = BoomPosy[boom_location];
		temp.z = BoomPosz[boom_location];
		create(<rocket.mdl>,temp,fulling_boom);
		//create(<Hala.MDL>,temp,dust_explosion);
		boom_location = int(random(5))+5;
		temp.x = BoomPosX[boom_location];
		temp.y = BoomPosy[boom_location];
		temp.z = BoomPosz[boom_location];
		create(<rocket.mdl>,temp,fulling_boom);
		//create(<Hala.MDL>,temp,dust_explosion);
		wait(100);
	}

}


///////////////////////////////////////////////////////////////////////////////////////////////////////
function rokett()
{
	var soundstringth = 0;
	var boom;
	var camrock = 0;
	if (BoompingWall == 1)
	{return;
	}
	BoompingWall = 1;
	play_entsound(me,boomcomiing,1000);
	while (1)
	{
		soundstringth+=speed/200;
		if (soundstringth > 50)
		{break;
		}
		wait(1);
	}
	temp2.x = 0;
	temp2.y = 0;//(200 - random(400));
	temp2.z = 0;//(100 - random(200));
	vec_rotate( temp2, my_angle);
	vec_add( temp2, my.pos);
	vec_set( normal, my.pan);
	normal.x -= 90;
	create( <xplosion.mdl>, temp2, ExplodedWall);
	boom = vec_dist(my.pos,player.pos);
	if (boom < 250)
	{HeartPlayer(50000/boom);
	}
	camrock+=50;
	while (1)
	{
		camrock-=5;
		if (my.flag2 == 0)
		{my.flag2=1;camera.roll+=1.5;
		}else
		{my.flag2=0;camera.roll-=1.5;
		}
		if (camrock == 0)
		{break;
		}
		wait(1);
	}
	camrock+=25;
	while (1)
	{
		camrock-=5;
		if (my.flag2 == 0)
		{my.flag2=1;camera.roll-=1.8;
		}else
		{my.flag2=0;camera.roll+=1.8;
		}
		if (camrock == 0)
		{break;
		}
		wait(1);
	}
	camrock = 0;
	camera.roll=0;
	BoompingWall = 0;
}

function ExplosionEnterance()
{
	my._type = _type_elevator;
	wait(50);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	while (1)
	{
		if (vec_dist(my.pos,player.pos) < 350)&&(BoompingWall == 0)

		{
			if (vec_dist(my.pos,player.pos) < 400)
			{
				rokett();
			}
		}
		wait(1);
	}
}
