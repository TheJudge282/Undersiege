
function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}
function playerCouph()
{
	while (GazPazokanum < 3)
	{
		if (Game_State[0]==-73)
		{break;
		}
		if (my == null)
		{
			return;
		}
		if (snd_playing(my.skill30)==0)&&(my.skill31 > 0)
		{
			play_sound( HitSound7, 1000);
			my.skill30 = result;
			my.skill31 = -100;
		}
		if (my.skill31 <= 0)
		{my.skill31 +=2;
		}
		wait(1);
	}	

}

function GazPazoka()
{
	my.visible = 0; 
	GazPazokanum += 1;
	you = player;
	my.passable = 1;
	while ( edistance(my, player)> 10)
	{
		if (snd_playing(my.skill30)==0)
		{
			play_entsound( me, GazThrow, 3000);
			my.skill30 = result;
		}
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle( my.pan, temp);

		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 5, my.pos, my_angle);
		temp.x = min( vec_dist( player.x , my.x), 75);
		temp.y = 0;
		temp.z = 0;
		move( me, temp, nullskill);
		wait(1);
	}
	play_entsound( me, gazExplosion,10000);
	if (GazPazokanum == 1)
	{
		
		BlackScreen.visible = 1;
		BlackScreen.alpha=0;
		while (1)
		{
			BlackScreen.alpha+=5;
			if (BlackScreen.alpha>35)
			{GazPazokanum.z = -100;break;}
			wait(1);
		}

		if (level.z == 1)
		{
			playerCouph();
			Play_My_Sounds(35,0);
			ShowMessage(5,186);
		}
		else
		{
			playerCouph();
			Play_My_Sounds(12,0);
			ShowMessage(5,156);
		}
	}
	if (GazPazokanum == 3)
	{
		MovieOrSucess = 1;
		RemoveAllKeys();
		VictoryScream();
		stop_sound(CurrentSong);
		play_loop VictoryPlayer, 5000;
		h_VictoryPlayer = result;
		on_enter = finalization;
		PreesNextLvl.visible = 1;
		GazPazokanum.y = -100;
		Game_State[0]=-73;
		ZoomOut();
		HideEveryThing();
		Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
	}
	else
	{
		while (GazPazokanum.y >= 0)
		{
			if (snd_playing(my.skill30)==0)
			{
				play_entsound( me, GazThrow, 1000);
				my.skill30 = result;
			}
			my_angle.x = 50;
			my_angle.y = 75;
			my_angle.z = 50;
			effect( PartsThrow, 5, my.pos, my_angle);

			wait(1);
		}
	}
	

}

function ApatchiEvent()
{

	if event_type == event_detect && you._type == _type_player
	{
		my.EnemyId = Entity_To_Pointer( you);
		if(CheckVisEnemy(0)==1)
		{
			my._signal = _detecte_enemy;
		}
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{
		my._health -= damage/5;
		my.GotHit = 100;
	}
}

function apatchilaexplosion()
{
	my.passable = 1;
	if (game_state[0] == -100)
	{return;}
	exclusive_entity;
	var oldz;
	if (Game_State[0] > 5)&&(my.skill6 == 0)//&&(my.skill7 == PlaneNum)
	{
		create(<plane.mdl>,PlanePos,CarryerAuto);
	}
	you   = Pointer_To_Entity(my.pathid);
	remove you;
	entiy = Pointer_To_Entity(my.LeaderId);
	you   = Pointer_To_Entity(entiy.LeaderId);
	remove you;
	remove entiy;
	removecoll(my);
	you = pointer_to_entity( my.skill35);
	remove you;
	play_entsound( me, MallaExplosion, 1000000);

	morph <explane.mdl>,me;
	my.passable = 1;
	if (my.flag7 ==1)&&(level.z == 1)
	{
		ShowMessage(5,178);
		MisionsMsg7.ambient=-100;
		MisionsMsg8.visible=1;
		ShowMessionsAuto();
		Game_State[0]=6;

	}

	my.force = 0;
	my.passable = 1;
	while (1)
	{
		sonar me, 4000;
		my.force +=1;
		if (result>my.max_z)
		{
			my.z-=min(my.force, result);
		}else
		{
			my.z -=10;
			break;
		}
		my.pan += 10;
		SmokeMeSome();
		wait(1);
	}
	   create( <dust.mdl>, my.pos,AtomicExplosion);
	   CameraMoveExplo();
	   my.skill1= 0;
		while (my.skill1<100)
		{
		 SmokeMeSome();
		 my.skill1+= 1;
		 wait(4);
		}
	remove me;

}

function lmgsolderPilot()
{
	ent_frame( "2shot" , 1);
	my.passable = 1;
	my.PathId = Entity_To_Pointer( you);
}

function ShotFromMySolder()
{
		you = me;

		my = Pointer_To_Entity( my.PathId);
		my._move_count_flage = 1;
		my.enemyid = you.enemyid;
		WeaponSound3d( lmg);
		Short_GunFlash( my, 37, 49);
		MalalehDamege(50,1,1,37);

		 my.FrameAnim = 0;
		 ent_frame(  "3Dshot", my.FrameAnim);
		 wait(1);
		 while ( my.FrameAnim<100 )
		  {
			my.FrameAnim +=50*speed/200;
			ent_frame( "3Dshot", my.FrameAnim);
			wait(1);
		  }
		my._move_count_flage = 0;

}

function ShotFromRBgSolder()
{
		you = me;

		my = Pointer_To_Entity( my.PathId);
		my._move_count_flage = 1;
		my.enemyid = you.enemyid;
		Short_GunFlash( my, 8, 2);

		 my.FrameAnim = 0;
		 ent_frame(  "2Dshot", my.FrameAnim);
		 vec_for_vertex( temp, my, 20);
		 create( <Wgraned.mdl>, my.pos, GazPazoka);
		 wait(1);
		 while ( my.FrameAnim<100 )
		  {
			my.FrameAnim +=50*speed/200;
			ent_frame( "2Dshot", my.FrameAnim);
			wait(1);
		  }
		  my._move_count_flage = 0;
}

function SolderCarryLink(forc)
{

	ApatchiLinks();
	entiy = Pointer_To_Entity( my.leaderid);
	entiy.invisible = forc == 0;
	entiy = Pointer_To_Entity( my.PathId);
	vec_for_vertex( entiy.x, me, 327);
}

function apachiscan()
{
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 2200;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
		return(1);
	}
	return(0);
}

function apatchiattack()
{
exclusive_entity;
while(1)
{
	if (my._health<-200)
	{
		apatchilaexplosion();
		return;
	}

	if ( my._health<=-50) && (random(10)>5 )
	{
		SmokeMeSome();
	}

	you = Pointer_To_Entity(my.EnemyId);
	entiy = Pointer_To_Entity(my.PathId);
	temp.x = you.x - entiy.x;
	temp.y = you.y - entiy.y;
	temp.z = you.z - entiy.z;
	vec_to_angle( my_angle, temp);

	entiy.pan = my_angle.pan;
	my.pan    = nearangle( my.pan, my_angle.pan+90,2);

	if (entiy._move_count_flage == 0)
	{
		ShotFromMySolder();
	}

	if(CheckVisEnemy(0)==0)
	{
		Carryermove();
		return;
	}
	SolderCarryLink(1);
	wait (1);
}
}


function apatchiini
{
	if (my.CarWieght ==0)
	{
		my.CarWieght = 100;
	}

	my.ShocksForce = 1;
	my.passable = 1;
	my.ShocksMaxAngle = 10;
	my.CarBreakerForce = 0.5;
	my.CarLevel = 0;
	my._type = _type_Apachi;
	my.CarCurrentGear= 4;
	my.EngineForce= 5;
	my.GearSpeed = 1;
	my.scale_x = 2;
	my.scale_y = 2;
	my.scale_z = 2;
	create( <ambulance.mdl>, my.pos, CarEngine);

	you = Pointer_To_Entity(my.LeaderId);

	you.max_x *= 2.2;
	you.max_z *= 1;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	you.CollFunction  = Function_To_Pointer("MallaCollision");
	you.enable_detect = 1;
	you.enable_scan = 1;
	you.event = apatchievent;
	AddColl(you);

}



sound  aptchifly, <Heloop01.wav>;
string flyframes, "frame";
define FlySound, skill1;
define EngineId, skill35;

function Uppart()
{
	my.passable = 1;
}

 function SmokeMeSome()
 {
	temp.x = 0;
	temp.y = 0;
	temp.z = 0;
	my_angle.x = 50-random(100);
	my_angle.y = 50-random(100);
	my_angle.z = -random(25);
	vec_add( my_angle, my.pos);
	effect( Blacksmokeup, 1, my_angle, temp);

 }

function MoveTarget(MSForce)
{
	 entiy    = pointer_to_entity( my.EngineId);
	 my.force = nearnumber( my.force, MSForce, 1);
	 temp.x = min(my.force*speed/600,vec_length(temp));
	 temp.y = 0;
	 temp.z = 0;
	 move( entiy, temp, nullskill);
	 vec_set( my.x, entiy.x);
 }

function MoveTurnTarget(MSForce)
{
	 entiy = pointer_to_entity( my.EngineId);

	 temp.x = my._target_x - my.x;
	 temp.y = my._target_y - my.y;
	 temp.z = my._target_z - my.z;
	 vec_to_angle( my_angle, temp);

	 entiy.pan = nearangle(entiy.pan,my_angle.pan,MSForce/12.5);
	 entiy.tilt = nearangle(entiy.tilt,my_angle.tilt,MSForce/12.5);
	 my.tilt = nearangle(my.tilt, sin( my.pan- my_angle.pan)* 10,MSForce/25);
	 my.roll = nearangle(my.roll, cos( my.pan- my_angle.pan)* 10,MSForce/12.5);
	 MSForce -= sin( (my.pan- my_angle.pan)/4)*MSForce/2;
	 MoveTarget(MSForce);
}

function ApatchiLinks()
{
		you = pointer_to_entity( my.leaderid);
		entiy = pointer_to_entity( you.leaderid);
		you.frameanim += 20;
		set_cycle( you, flyframes, you.frameanim);
		vec_set( you.pos, my.pos);
		vec_set( you.pan, my.pan);
		set_cycle(entiy , flyframes, you.frameanim);
		vec_set( entiy.pos, my.pos);
		vec_set( entiy.pan, my.pan);
		if (snd_playing(you.FlySound)==0)
		{
			play_entsound( you, aptchifly, 100000);
			you.FlySound = result;
		}

}

function ApatchiExplosion()
{
if (level.z == 1)
{Game_State[0]=6;
}


my.passable  = 1;
you = pointer_to_entity( my.EngineId);
remove you;
morph ( <exapache.mdl>, me);
you = pointer_to_entity( my.leaderid);
entiy = pointer_to_entity( you.leaderid);
remove you;
remove entiy;
RemoveColl(me);

my.force = 0;
while (1)
{
	sonar me, 4000;
	my.force +=1;
	if (result>10)
	{
		my.z-=min(my.force, result);
	}else
	{
		break;
	}
	my.pan += 10;
	SmokeMeSome();
	wait(1);
}
   create( <dust.mdl>, my.pos,AtomicExplosion);
   CameraMoveExplo();
   my.skill1= 0;
	while (my.skill1<100)
	{
	 SmokeMeSome();
	 my.skill1+= 1;
	 wait(4);
	}
	remove me;

}

var aptchiGunesS[4] = 118, 136, 297, 315;
var aptchiGunesD[4] = 135, 153, 314, 332;

function aptchifire()
{
you = pointer_to_entity( my.enemyid);
vec_set( my._target_x, you.x);
my._target_z = my.z ;
while (1)
{
		you = pointer_to_entity( my.enemyid);
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan = nearangle(my.pan,my_angle.pan,1);

		if ( my._health<=-400 ){
			ApatchiExplosion();
			return;
		}

		if ( my._health<=-50) && (random(10)>5 )
		{
			SmokeMeSome();
		}
		entiy = pointer_to_entity( my.enemyid);
		trace_mode = ignore_me+ ignore_passable;
		trace( my.pos, entiy.pos);
		if (you == entiy)
		{
			if (random(10)>5)
			{
				WeaponSound3d( lmg);
				temp2.x = int(random(4));
				Short_GunFlash( me, aptchiGunesS[temp2.x], aptchiGunesD[temp2.x]);
				ShotAndDamage(50,1,1,aptchiGunesS[temp2.x]);
				if (random(100)>50)
				{
					you = pointer_to_entity( my.enemyid);
					temp.x = you.x - my.x;
					temp.y = you.y - my.y;
					temp.z = you.z - my.z;
					vec_to_angle( my_angle, temp);
					if (abs(ang(my.pan - my_angle.pan))<10)&&(abs(ang(my.y - my_angle.y))<10)
					{
						FirstPoint.x = 200;
						FirstPoint.y = 0;
						FirstPoint.z = 0;
						vec_rotate( FirstPoint, my.pan);
						vec_add( FirstPoint, my.pos);
						create ( <bullet_rbg.mdl>, FirstPoint, pazoka_bullet);
						you.tilt = my.tilt;
					}
				}
			}
		}
		else
		{
			if (level.z == 2)
			{
				Aptchimove();
				break;
			}
		}
		ApatchiLinks();
wait(1);
}
}
/*
function apachiscan()
{

my = Pointer_To_Entity(my.LeaderId);
	if (my._signal == _hear_fire)
	{
		return(1);
	}
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 2200;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
		return(1);
	}
return(0);
}
*/
function Aptchimove()
{
	var WattingAttack = 0;
	while (1)
	{
		if ( my._health<=-400 ){
			ApatchiExplosion();
			return;
		}
		if ( my._health<=-50) && (random(10)>5 )
		{
			SmokeMeSome();
		}

		MoveTurnTarget(40);
		ApatchiLinks();
		vec_set(point_move.x,my._target_x);
		if (level.z == 2)
		{
			entiy = pointer_to_entity( bullettarget);
			if (entiy != null)
			{
				trace_mode = ignore_me+ ignore_passable;
				trace( my.pos, entiy.pos);
				if (you == entiy)
				{
					WattingAttack += 1;
					if (WattingAttack > 50)
					{
						my.enemyid = bullettarget;
						aptchifire();
						return;
					}
				}
			}
		}
		if ( EDistance(point_move,me)<50)
		{
			my.pathid+=1;
			if (level.z == 1)
			{
				if (my.pathid>=3)
				{
					my.enemyid = bullettarget;
					aptchifire();
					return;
				}
			}
			ent_nextpoint(my._target_x);
		}
		wait(1);
	}
}

function AptchiBeva()
{
	wait(10);

	create( <AptchiUPart.mdl>, my.pos, Uppart);
	my.leaderid = entity_to_pointer( you);
	entiy = you;
	create( <AptchiUPart2.mdl>, my.pos, Uppart);
	//you.shadow  = 1;
	entiy.leaderid = entity_to_pointer( you);

	create( <AptchiDPart.mdl>, my.pos, Uppart);
	my.EngineId = entity_to_pointer( you);
	you.invisible = 1;
	ent_path("Apatchi");
	ent_waypoint(my._target_x,1);

	my.enable_detect = 1;
	my.enable_scan = 1;
	my.epassable = 0;
	my.passable  = 1;
//	my.shadow  = 1;
	my.owntype = TypeOfEngines;
	my.max_x  *= 2.5;
	my.max_z  *= 0.5;
	my.weaponnumber = lmg;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.CollFunction = Function_To_Pointer( "ComparsCollision");
	my.event = ApatchiEvent;
	my.pathid = 0;
	malalehpoint[3]=Entity_To_Pointer(me);
	Aptchimove();
}

/////////////////////////////////////////////////////////////////////////////////

function MRuner()
{
	//exclusive_entity;
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if ( my.SoundWR==0)
		{ play_entsound(me,Solderstep4,300);
		my.SoundWR=-100; }
		my.SoundWR+=10;
		if (SoldCheckIfHealthy())
		{
		        my.LastState = Function_To_Pointer( "MRuner");
			break;;
		}
		if (vec_dist(my.x ,my._target_x ) < 50)
		{

			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
		}
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/35;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);

		my.pan=nearangle(my.pan,my_angle.pan,35);
		temp.x = speed/50;
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		wait(1);
	}
}


action MareinsRuner
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}


	my.VertexCount = GetVertexNum(me)-20;

	SolderCounter+=1;
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	my.wieght = 50;

	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimShot = IUpSnipFire;
	my.AnimDie = 0;
	my.hunt = 1;
	my.hide = 1;
	my.Grenader = 1;
	my.z-=CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 0;
	my.GotHit = 0;
	my._type = _type_soldier;
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = solderevent;
	my.pan = random(360);
	my.WeaponNumber = m16;
	my.DieEvent = Function_To_Pointer( "SolderDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	if (int(random(2))==1)
	{	Mareinspos.x+=int(random(1000))/10;
	}
	else
	{	Mareinspos.x-=int(random(1000))/10;
	}
	if (int(random(2))==1)
	{	Mareinspos.y-=int(random(1000))/10;
	}
	else
	{	Mareinspos.y+=int(random(1000))/10;
	}

	vec_set(my._target_x,Mareinspos);
	MRuner();

}

function droop_solders(cmy)
{
	var DroopPos;
	//PlaneNum.y=100;
	my.skill6 = 100;
	me=cmy;
	my.FrameAnim = 0;
	my.Frame = 2;
	my.tilt = 0;
	my.roll = 0;
	while (1)
	{
		if (my.FrameAnim > 1000)
		{
			my.FrameAnim = 0;
			break;
		}
		SolderCarryLink(1);
		my.FrameAnim +=20;
		wait(1);
	}
/*	if (PlaneNum == 2)
	{
			temp.x=-5767;
			temp.y=-626;	
			temp.z=1500;
			create( <plane.mdl>, temp, GazPlane);

	}*/
	if (PlaneNum == 1)
	{
		GroupExist=0;
		Game_State[0]=7;
	}

	vec_for_vertex(temp,me,315);
	//create(<Hala.MDL>,temp,hsmoke_explosion);Moa
	vec_for_vertex(temp,me,307);
	//create(<Hala.MDL>,temp,hsmoke_explosion);Moa
	vec_for_vertex(DroopPos,me,304);
	create( <ckm16.mdl>, DroopPos, MareinsRuner );
	create( <ckm16.mdl>, DroopPos, MareinsRuner );
	create( <ckm16.mdl>, DroopPos, MareinsRuner );
	create( <ckm16.mdl>, DroopPos, MareinsRuner );
	create( <ckm16.mdl>, DroopPos, MareinsRuner );
	while (1)
	{
		if (my.FrameAnim > 1000)
		{
			my.FrameAnim = 0;
			break;
		}
		SolderCarryLink(1);
		my.FrameAnim +=20;
		wait(1);
	}
	vec_for_vertex(temp,me,410);
	//create(<Hala.MDL>,temp,hsmoke_explosion);moa
	entiy    = pointer_to_entity( my.EngineId);
	entiy.tilt = 0;
	Carryermove();

}
var PlanePoint = 0;
function CarryerPoint
{
	PlanePoint = ent_nextpoint(my._target_x);
	if (PlanePoint == 6)
	{vec_set(Mareinspos,my._target_x);
	}
	if (PlanePoint == 7)
	{
		
		droop_solders(me);
		if (PlanePoint == 7)&&(PlaneNum == 2)
		{
				temp.x=-5767;
				temp.y=-626;	
				temp.z=1500;
				create( <plane.mdl>, temp, GazPlane);
		}
		return;
	}
/*	if (PlanePoint == 9)
	{
		if (Game_State[0] == 6)&&(PlaneNum == 1)// airforce two
		{
			Game_State[0]=7;
			GroupExist=0;
		}
		if (Game_State[0] == 7)&&(PlaneNum == 2)// airforce three
		{
			Game_State[0]=8;
			GroupExist=0;
		}

	}*/
	if (PlanePoint == 14)
	{
		you   = Pointer_To_Entity(my.pathid);
		remove you;
		entiy = Pointer_To_Entity(my.LeaderId);
		you   = Pointer_To_Entity(entiy.LeaderId);
		remove you;
		remove entiy;
		removecoll(my);
		remove my;
		return;
	}
	//vec_set(Mareinspos,my._target_x);
	Carryermove();
}

function Carryermove()
{
	exclusive_entity;
	my._signal = 0;
	//vec_set( my._target_x, my.x);
	while (1)
	{
		if ( my._health<-400)
		{
			apatchilaexplosion();
			return;
		}
		if ( my._health<=-50) && (random(10)>5 )
		{
			SmokeMeSome();
		}
		vec_set(point_move.x,my._target_x );
		if EDistance(point_move,me)<50
		{
			CarryerPoint();
			return;
		}
		if (my.FrameAnim > 100)
		{
			my.FrameAnim = 0;
		}
		my.FrameAnim +=speed/10;
		if ( apachiscan() )&&(PlaneNum.y!=100)
		{
			apatchiattack();
			return;
		}
		else
		{
			MoveTurnTarget(70);
			temp.x = my._target_x - my.x;
			temp.y = my._target_y - my.y;
			temp.z = my._target_z - my.z;
			vec_to_angle( temp, temp);
			my.pan = nearangle( my.pan, temp.x, 1);
		}
		SolderCarryLink(1);
		wait(1);
	}

}

function Carryerevent()
{

	if event_type == event_detect && you._type == _type_player
	{
		my.EnemyId = Entity_To_Pointer(you);

		if(CheckVisEnemy(0)==1)
		{
			my._signal = _detecte_enemy;
		}
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire )//&& my.skill6 == 0)
	{
		my._health -= damage/5;
		my.GotHit = 100;
	}
}

function Carryerini
{

	create( <soldercaryup2.mdl>, my.pos, Uppart);
	my.leaderid = entity_to_pointer( you);
	entiy = you;
	create( <soldercaryup1.mdl>, my.pos, Uppart);
	entiy.leaderid = entity_to_pointer( you);
	create( <cklmg.mdl>, my.pos, lmgsolderPilot);
	my.PathId = entity_to_pointer( you);

	create( <plane.mdl>, my.pos, Uppart);
	my.EngineId = entity_to_pointer( you);
	you.invisible = 1;
	ent_path("Carear1");
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.epassable = 0;
	my.passable  = 1;
	my.owntype = TypeOfEngines;
	my.max_x  *= 2.5;
	my.max_z  *= 0.5;
	my.weaponnumber = lmg;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.CollFunction = Function_To_Pointer( "ComparsCollision");
	my._health = 1000;
	my.event = Carryerevent;
}

function CarryerAuto()
{
	Carryerini();
	PlaneNum.y=0;
	my.skill7 = PlaneNum;
	if (PlaneNum == 1)
	{	ent_path("Carear1");
	}
	if (PlaneNum == 2)
	{	ent_path("Carear2");
	}
	if (PlaneNum == 3)
	{	ent_path("Carear3");
	}
	ent_waypoint(my._target_x,1);
	Carryermove();
}

function PlaneGazShot()
{
	my.skill6 = 320;
	while (1)
	{
		/*if ( my._health<-200)
		{
			apatchilaexplosion();
			return;
		}*/
		if (GazPazokanum.y == -100)
		{remove me;break;
		}
		if ( my._health<=-50) && (random(10)>5 )
		{
			SmokeMeSome();
		}

		if (my.FrameAnim > 100)
		{
			my.FrameAnim = 0;
		}
		my.FrameAnim +=speed/10;

		you = Pointer_To_Entity(my.enemyid);
		entiy = Pointer_To_Entity(my.PathId);
		temp.x = you.x - entiy.x;
		temp.y = you.y - entiy.y;
		temp.z = you.z - entiy.z;
		vec_to_angle( my_angle, temp);

		entiy.pan = my_angle.pan;
		my.pan    = nearangle( my.pan, my_angle.pan+90,2);
		my.skill6 += 1;
		if (entiy._move_count_flage == 0)&&(my.skill6 > 400)//&&(soldercounter < 3)
		{
			ShotFromRBgSolder();my.skill6 = 0;
		}


		SolderCarryLink(1);
		wait(1);
	}


}

function PlaneGazMove()
{
	my._signal = 0;
/*	if (level.z == 2)
	{
 	 PlaneGazShot();
	 return;
	}*/

	vec_set( my._target_x, my.x);
	while (1)
	{
/*		if ( my._health<-200)
		{
			apatchilaexplosion();
			return;
		}*/
		if ( my._health<=-200) && (random(10)>5 )
		{
			SmokeMeSome();
		}
		vec_set(point_move.x,my._target_x );
		if EDistance(point_move,me)<50
		{
			PlanePoint = ent_nextpoint(my._target_x);
			if (PlanePoint == 3)
			{
			 PlaneGazShot();
			 return;
			}
		}
		if (my.FrameAnim > 100)
		{
			my.FrameAnim = 0;
		}
		my.FrameAnim +=speed/10;
		MoveTurnTarget(30);

		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( temp, temp);
		my.pan = nearangle( my.pan, temp.x, 1);

		SolderCarryLink(1);
		wait(1);
	}

}

function GazPlane()
{
	Carryerini();
	my.enemyid = player.bodylnk;
	ent_path("GazPath");
	PlaneGazMove();
}
