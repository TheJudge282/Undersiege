
function WalkRunSound()
{
my.invisible = 1;
my.passable = 1;
if (random(10)>5)
{
play_entsound(me,Solderstep1,300);
}else
{
if (random(10)>5)
{
play_entsound(me,Solderstep2,300);
}else
{
if (random(10)>5)
{
play_entsound(me,Solderstep3,300);
}else
{
play_entsound(me,Solderstep4,300);

} 

} 
}


waitt(150);
remove me;

}

function SolderAlarm();

function Boxed_event()
{

	if event_type == event_stuck
	{	
		return;
	}
}

function anythingtomoveme()
{
	//my.invisible=  1;
	my.enable_stuck = 1;
	my.event=  Boxed_event;
}

function MoveTurnFallAnim2Target(MSForce,AnimForce)
{
var res;
	//create3Dline();
	 my.FrameAnim += MSForce*2*speed/600*AnimForce;
	 if ( my.FrameAnim<0)
	 { my.FrameAnim+=100; }

	 my.SoundWR += MSForce*2*speed/300*AnimForce;

	 if ( my.SoundWR<0)
	 { create( <black_hole.tga>, my.pos, WalkRunSound);
	 my.SoundWR+=100; }

	 if ( my.SoundWR>100)
	 { create( <black_hole.tga>, my.pos, WalkRunSound);
	 my.SoundWR-=100; }

	 temp.x = my._target_x ; 
	 temp.y = my._target_y ; 
	 temp.z = my._target_z ;

	 trace_mode = = ignore_me+ignore_you+ ignore_models+ ignore_passable;
	 res = trace( my.x, temp);
	if (res!=0)&&(you==0)
	{  
		return(1);
	}
	 temp.x = my._target_x - my.x; 
	 temp.y = my._target_y - my.y; 
	 temp.z = 0;
  
	 vec_to_angle( my_angle, temp);
	 if (vec_length(temp)>10)
	 {
		my.pan = nearangle(my.pan,my_angle.pan,MSForce*10*speed/600);
	 }

	 temp.x = min(MSForce*speed/600,vec_length(temp));
	 temp.y = 0;
	 temp.z = -CheckTheFLoor(4000);
	 move( me, temp, nullskill);
	/* create( <point1.MDL>,my.pos , anythingtomoveme);
	 vec_set( you.angle, my.angle);
	 move( you, temp, nullskill);
	if (result==0)
	{
		//my.unlit = 1;
		remove you;
		return(1);
	}
	my.unlit = (result==0);
	 vec_set( my.pos, you.pos);
	 remove you;*/
	if (MSForce>5)
	{
		ent_cycle( AllAnimations[ my.AnimRun], my.FrameAnim);
	}else
	{
		ent_cycle( AllAnimations[ my.AnimWalk], my.FrameAnim);
	}
	return(0);

}

function TakeAlarmStep()
{
if (spot_point2(Pointer_To_Entity( my.EnemyId))==0)
{
	my.HiddenPoint =0;
	if (spot2_point(Pointer_To_Entity( my.EnemyId))!=0)
	{
		return(1);
	}
}else
{
	my.HiddenPoint =1;
		return(1);
}
return(0);
}

function FallowTargetDirection()
{
	temp.x = my.x - my._old_position_x;
	temp.y = my.y - my._old_position_y;
	temp.z = my.z - my._old_position_z;
	vec_to_angle( my_angle, temp);
	my_angle.x = 180+ my_angle.x;
	my_angle.y = 90;

if (spot6_point(0))
{
while (1)
{

	if (LeaderCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SolderAlarm");

	 return;
	}

	my._signal = 0;
	temp.pan = 180;
	temp.tilt = 360;
	temp.z = 10000;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
	 SolderShoting();
	 return;
	}

	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)>5) 
	{
	 MoveTurnFallAnim2Target(10*50/my.wieght,0.25);

	}else
	{
	temp.x = my.x - my._old_position_x;
	temp.y = my.y - my._old_position_y;
	temp.z = my.z - my._old_position_z;
	vec_to_angle( my_angle, temp);
	my_angle.x = 180+ my_angle.x;
	my_angle.y = 90;
	if (spot6_point(0)==0)
	{
		SolderFallow();
		return;
	}
	}
/*vec_set( PointParameters[ PointPos], my.x);
vec_set( PointParameters[ PointDirction], my._target_x);
createline();*/
wait(1);
}
}else
	{// nshowmessage("dddddddd");
		SolderFallow();
		return;
	}

}

function EscapeByLeader(ThenFunc)
{
//my.AnimRun = ISwatWalkFront;
//my.AnimWalk = ISwatWalkFront;

you = ThemLeader[my.LeaderIndex];
//GetPosFromLeader( you.LeaderId, my);

	temp.x = my._old_position_x - my.x;
	temp.y = my._old_position_y - my.y;
	temp.z = my._old_position_z - my.z;
	vec_to_angle( my_angle, temp);

if (random(100)>50)
{
	my_angle.x = ang(my_angle.x+90);
}else
{
	my_angle.x = ang(my_angle.x-90);

}

if (spot5_point(0))
{
while (1)
{

	if (LeaderCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SolderAlarm");

	 return;
	}

	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)>5) 
	{
	 MoveTurnFallAnim2Target( 15*50/my.wieght, 1);

	}else
	{
	break;}
  wait(1);
}
}

Pointer_To_Function( ThenFunc, 0, 0, 0);

}

function StandForWhile(Value,ThenFunc,TThenFunc)
{
my.FrameAnim=0;
while (my.FrameAnim < Value)
{

	if (LeaderCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SolderAlarm");
	 return;
	}

	my.FrameAnim+=1;
wait(1);
}
Pointer_To_Function( ThenFunc, TThenFunc, 0, 0);

}

function SniperShot()
{
	ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
	var kLet = 0;
	while ( kLet<(10+random(20)))
	{
		kLet += 1;
		if (my._state != _state_attack)
		{ return; }
		wait(1);
	}
	while ( my._state == _state_attack)
	{
		if (my.EnemyHide==0)
		{
			you = Pointer_To_Entity( my.EnemyId);
			temp.x = you.x - my.x;
			temp.y = you.y - my.y;
			temp.z = you.z - my.z;
			vec_to_angle( my_angle, temp);
			my.pan = my_angle;
			my.FrameAnim = 0;
			ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
			WeaponSound3d( my.WeaponNumber);
			vec_for_vertex(temp,me, 25);
			//Short_GunFlash(me,GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
			effect( FlashFire, 100, temp, my_angle);
			//effect( Sniper_Smoke, 10, temp, temp);
			temp.pan = 360;
			temp.tilt = 360;
			temp.z = 10000;
			indicator = _gunfire;
			scan (my.x,my.pan,temp);
			ShotAndDamage(50,0,1,623);
			while (my._state == _state_attack && my.FrameAnim<100 )
			{
				my.FrameAnim +=50*speed/200;
				ent_frame( AllAnimations[ my.AnimShot], my.FrameAnim);
				wait(1);
			}
			while (my._state == _state_attack && my.FrameAnim>0 )
			{
				my.FrameAnim = max( my.FrameAnim- 40*speed/200, 0);
				ent_frame( AllAnimations[ my.AnimShot], my.FrameAnim);
				wait(1);
			}
		}
		wait(20);
	}
}

function SniperState()
{
SniperShot();
ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
my._state = _state_attack;
while ( my._state == _state_attack)
{

	if (LeaderCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SniperState");
	 return;
	}
 you = Pointer_To_Entity( my.EnemyId);
 temp.x = you.x - my.x;
 temp.y = you.y - my.y;
 temp.z = you.z - my.z;
 vec_to_angle( my_angle, temp);
 my.pan = my_angle;

	if(CheckVisEnemy(GunFlashFront[my.skill6])!=1) {
		my.EnemyHide += 1;
		}else
		{
		my.EnemyHide = 0;
		
		}

 wait(1);
}
}

sound lmgrso,<LmgRFire.wav>;

function LmgShot()
{
wait(random(10));
var bltnumbers=0;

 while (my._state == _state_attack)
 {
	/*tempent = Pointer_To_Entity( my.EnemyId);
	trace_mode = ignore_me + ignore_passable + ignore_sprites;
	vec_set( temp, my.pos);
	temp.z+=my.max_z*0.75;
	trace( temp, tempent.pos);
	if ( you == tempent)
	{*/
	 my.FrameAnim = 0;
	 ent_cycle(  AllAnimations[ my.AnimShot], my.FrameAnim);

	 WeaponSound3d( my.WeaponNumber);

	 bltnumbers+=1;
	if (CheckVisEnemy(GunFlashFront[my.skill6])==0)
	{
		LmgWait();
		break;
	}

	 Short_GunFlash(me,GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
	 ShotAndDamage(50,1,1,GunFlashFront[my.skill6]);
		while (my._state == _state_attack && my.FrameAnim<100 )
		 {
			my.FrameAnim +=50*speed/200;
			ent_frame( AllAnimations[ my.AnimShot], my.FrameAnim);
			wait(1);
		 }
		if (bltnumbers>6)
		{
			wait(10+random(20));
			bltnumbers=0;
		}

	//}

  wait(1);
 }
}

function LmgState()
{
LmgShot();
 my._state = _state_attack;
 ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
while ( my._state == _state_attack)
{

//	create3Dline();
	if (LeaderCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "LmgState");
	 return;
	}
 you = Pointer_To_Entity( my.EnemyId);
 temp.x = you.x - my.x;
 temp.y = you.y - my.y;
 temp.z = you.z - my.z;
 vec_to_angle( my_angle, temp);
 my.pan = my_angle;

 wait(1);
}
}

function SolderAlarm()
{
if (my.weaponnumber==s99sniper)
{
 my.AnimShot  =  IDownSnipFire;
 ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
 my.EnemyId = player.bodylnk;
 SniperState();
 return;
}
if (my.weaponnumber==lmg)
{
 my.EnemyId = player.bodylnk;
 my.AnimShot  = IGunFire;
 LmgState();
 return;
}
  my.EnemyId = player.bodylnk;
  ent_cycle( AllAnimations[ IHandUpStand], my.FrameAnim);
  StandForWhile( 10, Function_To_Pointer( "EscapeByLeader"), Function_To_Pointer( "SolderShoting"));
}

function LeaderAlarm()
{
my._signal = 0;
my.FrameAnim=0;
while (1)
{

	if (LeaderCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SolderAlarm");

	 return;
	}
	my.FrameAnim+=1;
	ent_cycle( "5stand", my.FrameAnim);

	temp.pan = 180;
	temp.tilt = 360;
	temp.z = 1000;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
	 SolderShoting();	 
	 return;
	}

	if (my._signal == _hear_fire)
	{
	 SolderShoting();	 
	 return;
	}
/*vec_set( PointParameters[ PointPos], my.x);
you = my.LeaderId;
you = you.LeaderId;
vec_set( PointParameters[ PointDirction], you._old_position_x);
createline();*/
wait(1);
}
}


function LeaderHit()
{
	exclusive_entity;
	my._state = _state_hit;
	while (1)
	{
	if (my.GotHit==100)
	{
		Hitter_sound(2000);
	}
		if (my._health <-200)
		{
		 SldLeaderDie();
		  return;
		}
		my.GotHit = nearnumber( my.GotHit, 0, 1*speed/100);
		ent_frame( my.string2, 100-frc(my.GotHit/100)*100);
		if (my.GotHit==0)
		{
		 break;
		}
		wait(1);
	}
	Pointer_To_Function( my.LastState, 0, 0, 0);
}

function FolowerHit()
{
	exclusive_entity;
	my._state = _state_hit;
	while (1)
	{
	if (my.GotHit==100)
	{
		Hitter_sound(2000);
	}
		if (my._health <-200)
		{
		 SldFallowerDie(); 
		  return;
		}
		my.GotHit = nearnumber( my.GotHit, 0, 1*speed/100);
		ent_frame( my.string2, 100-frc(my.GotHit/100)*100);
		if (my.GotHit==0)
		{
		 break;
		}
		wait(1);
	}
	Pointer_To_Function( my.LastState, 0, 0, 0);
}

function LeaderCheckIfHealthy()
{

	if (my._health <=-200)
	{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
	  goto Retl;
	}

	if (my.GotHit)
	{
			Pointer_To_Function( my.HitEvent, 0, 0, 0);
	  goto Retl;
	}
	return(0);
	Retl :
		return(1);
}

function CheckIfAlarm(Lead)
{
	you = ThemLeader[my.LeaderIndex];
	you =  Pointer_To_Entity( you.LeaderId);
	if (you.alarm)
	{
	 if (Lead)
	 {
		LeaderAlarm();
	 }else
	 {
		SolderAlarm();
	 
	 }
	return(1);
	}
	return(0);
}

function GroupAlarm(AYou)
{
	my = AYou;
if (my.alarm)
{
	return;
}
	my.alarm = 1;
	wait(10);
	my.alarm = 0;
}

function LeaderEvent()
{



	if event_type == event_scan && indicator == _explode
	{	
		if (you.flag1)
		{
			my._health-=1000;
		}
		my.string2 = AllAnimations[ IDownHit];
		my.GotHit = 100;
		return;
	}

	if event_type == event_scan && indicator == _gunfire && (my._state == _state_wait || my._state == _state_Walk  ||my._state == _state_fallow)
	{	
		my.EnemyId = you.EnemyId;
		my._signal = _hear_fire;
		you =  Pointer_To_Entity( my.LeaderId);
		GroupAlarm(you);
		return;
	}

	if event_type == event_detect && you._type == _type_player
	{
		my.EnemyId = Entity_To_Pointer( you);

		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			my._signal = _detecte_enemy;
		}
		you =  Pointer_To_Entity( my.LeaderId);
		GroupAlarm(you);
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
		vec_set( temp, you.x);
		you =  Pointer_To_Entity( my.LeaderId);
		GroupAlarm(you);
		you =  Pointer_To_Entity( my.LeaderId);
		you =  Pointer_To_Entity( you.LeaderId);
		vec_set( you._old_position_x, temp);
	}
}

function SldFLeaderEvent()
{



	if event_type == event_scan && indicator == _explode
	{	
		if (you.flag1)
		{
			my._health-=1000;
		}
		my.string2 = AllAnimations[ IDownHit];
		my.GotHit = 100;
		return;
	}

	if event_type == event_scan && indicator == _gunfire && (my._state == _state_wait || my._state == _state_Walk  ||my._state == _state_fallow)
	{	
		my.EnemyId = you.EnemyId;
		my._signal = _hear_fire;
		you = ThemLeader[my.LeaderIndex];
		you =  Pointer_To_Entity( you.LeaderId);
		GroupAlarm(you);
		return;
	}

	if event_type == event_entity && you != 0
	{ 
		if(you.owntype == TypeOfEngines) 
		{
			my._health -= 100;
		}
		return;
	}

	if event_type == event_detect && you._type == _type_player
	{
		my.EnemyId = Entity_To_Pointer( you);

		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			my._signal = _detecte_enemy;
		}
		you = ThemLeader[my.LeaderIndex];
		you =  Pointer_To_Entity( you.LeaderId);
		GroupAlarm(you);
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
		temp.x = you;
		vec_set( temp, you.x);
		you = ThemLeader[my.LeaderIndex];
		you =  Pointer_To_Entity( you.LeaderId);
		GroupAlarm(you);
		you = ThemLeader[my.LeaderIndex];
		you =  Pointer_To_Entity( you.LeaderId);
		you =  Pointer_To_Entity( you.LeaderId);
		vec_set( you._old_position_x, temp);
	}
}

function LeaderEState()
{
 you.LeaderId = entity_to_pointer( me);
 my.invisible =1;
 my.passable = 1;
}

function LeaderCommands()
{
 you.LeaderId = entity_to_pointer( me);
 create ( <rcol.mdl>, my.x, LeaderEState);
 my.invisible =1;
 my.passable = 1;
 my.Alarm = 0;
 while (1)
 {
  if (key_u)
  {
	my.skill1+=1;
	if (my.skill1>2)
	{my.skill1=0;
	}
	while (key_u)
	{
	wait(1);
	}
  }
// CheckMyTactic(me);
 wait(1);
 }
}

function CheckWhereGo(cyou)
{
 me = cyou;
 vec_set( temp, PointParameters[0]);
 temp2.x = PointParameters[0];
 temp2.y = 0;
 temp2.z = 0;
 
 my_angle.x = my.Pan;
 my_angle.y = 0;

 vec_rotate( temp, my_angle);
 vec_rotate( temp2, my_angle);
 vec_add( temp, my.x);
 vec_add( temp2, my.x);
 trace_mode = ignore_me + ignore_passable + ignore_sprites;
 result = trace( temp2, temp);
 if (result!=0)
 {
   temp.x = target.x - my.x;
   temp.y = target.y - my.y;
   temp.z = target.z - my.z;
   vec_to_angle( my_angle, temp);
   temp.x = max( vec_length(temp)-75, 0);
   temp.y = 0;
   temp.z = 0;
   vec_rotate( temp, my_angle);
   vec_add( temp, my.x);
 }

}

function SolderFollow()
{

 SolderCounter+=1;
 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;
 my.AnimShot = IUpSnipFire;
 my.AnimDie = 0;

 my.wieght = PointParameters[0];
 my.WeaponNumber = PointParameters[1];
 my.LeaderIndex = LeaderCount;

 if ( my.ScaleCollision<=0)
 {
	my.ScaleCollision = 1;
 }
 my.VertexCount = GetVertexNum(me)-20;

 me.skill46 = -10;
 me.Find_HidePoint = -10;
 me._find_point_flag = -10;
 my.passable = 1;
 my.shadow = shadowenable;
 my.enable_detect = 1;
 my.enable_scan = 1;
 my.event = SldFLeaderEvent;
 wait(10);
 CollisionOffset.x = 0;
 CollisionOffset.y = 0;
 CollisionOffset.z = 0;
 AddColl(me);
 my.epassable = 0;
 my._health = 0;
 my.GotHit = 0;


 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;

you = ThemLeader[my.LeaderIndex];
AddSmallEntity( Pointer_To_Entity( you.LeaderId), me);
GetPosFromLeader( Pointer_To_Entity( you.LeaderId), my);
CheckWhereGo(you);
vec_set( my.x, temp);
sonar(me,4000);
my.z -= result;

my.DieEvent = Function_To_Pointer( "SldFallowerDie");
my.HitEvent = Function_To_Pointer( "FolowerHit");
my.CollFunction = Function_To_Pointer( "TraceCollision");

SolderFallow();
}

function SolderFallow()
{
 exclusive_entity;
 wait(1);
 my._signal = 0;
 my._state = _state_fallow;
 var MaxDist=0;
 while (my._state == _state_fallow)
 {

	if (LeaderCheckIfHealthy())
	{
	 my.LastState =Function_To_Pointer( "SolderAlarm");

	 return;
	}
	if (CheckIfAlarm(0))
	{
		
		return;
	}
	you = ThemLeader[my.LeaderIndex];
	if (you==0)
	{ wait(1);continue;	}
	if (you.LeaderId==0)
	{ wait(1);continue;	}
	GetPosFromLeader( Pointer_To_Entity( you.LeaderId), my);
	CheckWhereGo(you);
	you = point_move;
	vec_set( point_move.x, temp);
	temp.x = EDistance(you,me);
	vec_set(my._target_x,you.x);
	if ( temp.x>1) 
	{

	 MaxDist.x = max( 0, MaxDist.x -3);

	if ( (temp.x>500) || (MaxDist.x>0) )
	{ if (MaxDist.x == 0) { MaxDist.x =500; }
		MoveTurnFallAnim2Target(10*50/my.wieght,1);
	 }else
	 {	MoveTurnFallAnim2Target(5*50/my.wieght,1);
	 }
		//spot3_point(0);
	}


	temp.pan = 180;
	temp.tilt = 360;
	temp.z = 1500;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
	SolderShoting();
	return;
	}
if (random(10)>5)
{
	my._signal = 0;
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 400;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
		SolderShoting();
		return;
	}
}

	if (my._signal == _hear_fire)
	{
		SolderShoting();
		return;
	}

	/*else
	{
	you = ThemLeader[my.LeaderIndex];
	 temp.x = you.x - my.x; 
	 temp.y = you.y - my.y; 
	 temp.z = you.z - my.z; 
	 vec_to_angle( my_angle, temp);
	 my.pan = nearangle(my.pan,my_angle.pan,20);
	 ent_cycle( "stnd", my.FrameAnim);
	
	}*/
	
 
 wait(1);
 }
}

function AnimDie()
{
 RemoveColl(me);
 if (my.HiddenPoint)
 {
	Free_HPoint(me);
 }else
 {
	Free_Point(me);
 }
 my._state = _state_die;
 morph ( <rdie.mdl>, me);
 my.skill1=0;
 while (my.skill1<100)
  {
	ent_frame( "head", my.skill1);
	my.skill1+=1*speed/200;
	wait(1);
  }
 
 remove me;

}

function SldLeaderDie()
{
 exclusive_entity;
 ThemLeader[my.LeaderIndex] = leaderdie(Pointer_To_Entity( my.LeaderId));
 you = ThemLeader[my.LeaderIndex];
 if (you!=null)
 {
  you.LeaderId = my.LeaderId;
  you.event = my.event;
  you.DieEvent = my.DieEvent;
  you.HitEvent = my.HitEvent;
  vec_set( you._target_x, my.x);
}else
 {
my.entity1 = Pointer_To_Entity( my.LeaderId);
remove my.entity1;
 }
 //AnimDie();
 SolderDie();
 if (you!=null)
 {
  my = you;
  LeaderMove(0);

 }
 
}

function SldFallowerDie()
{
 exclusive_entity;
 you = ThemLeader[my.LeaderIndex];
 SubSmallEntity( Pointer_To_Entity( you.LeaderId), my);
 SolderDie();
}

function LeaderMove(Lead)
{
exclusive_entity;
wait(1);

my._state = _state_Walk;

if (Lead)
{
	vec_set( my._target_x, my.x);
}

while (my._state == _state_Walk)
{

	if (LeaderCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "LeaderAlarm");
	 return;
	}
	if (CheckIfAlarm())
	{
		you = ThemLeader[my.LeaderIndex];
		you =  Pointer_To_Entity( you.LeaderId);
		you =  Pointer_To_Entity( you.LeaderId);
		vec_set( my._old_position_x, you._old_position_x);
		return;
	}

	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)>10) 
	{
	if (my.flag1==0)
	{
	 my.FrameAnim += 10*speed/600;
	 if (my.FrameAnim<0)
	 {
		my.FrameAnim += 100;
	 }
	 temp.x = my._target_x - my.x; 
	 temp.y = my._target_y - my.y; 
	 temp.z = my._target_z - my.z; 
	 vec_to_angle( my_angle, temp);
	 my.pan = nearangle(my.pan,my_angle.pan,10);

	 temp.x = min(5*speed/600,vec_length(temp)); temp.y = 0;
	 temp.z = -CheckTheFLoor(4000);
	 move( me, temp, nullskill);

	ent_cycle( "2walk", my.FrameAnim);
	}else
	{
	 my.FrameAnim += 20*speed/600;
	 if (my.FrameAnim<0)
	 {
		my.FrameAnim += 100;
	 }
	 temp.x = my._target_x - my.x; 
	 temp.y = my._target_y - my.y; 
	 temp.z = my._target_z - my.z; 
	 vec_to_angle( my_angle, temp);
	 my.pan = nearangle(my.pan,my_angle.pan,50);

	 temp.x = min(10*speed/600,vec_length(temp)); temp.y = 0;
	 temp.z = -CheckTheFLoor(4000);
	 move( me, temp, nullskill);

	ent_cycle( "1run", my.FrameAnim);
	
	}
	}else
	{
		ent_nextpoint(my._target_x);
		//spot4_point(0);
		//my.flag1=random(100)>25;
	}

	my._signal = 0;
	temp.pan = 180;
	temp.tilt = 360;
	temp.z = 1500;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
	SolderShoting();
	return;
	}

if (random(10)>5)
{
	my._signal = 0;
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 400;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
		SolderShoting();
		return;
	}
}

	if (my._signal == _hear_fire)
	{
		SolderShoting();
		return;
	}

wait(1);
}

}

action SldLeader
{ 
 SolderCounter+=1;

 if (LeaderCount>19)
 {
	return;
 }
 if ( my.ScaleCollision<=0)
 {
	my.ScaleCollision = 1;
 }

 my.VertexCount = GetVertexNum(me)-20;

 my.passable = 1;
 my.shadow = shadowenable;
 my.WeaponNumber = m16;

 me.skill46 = -10;
 me.Find_HidePoint = -10;
 me._find_point_flag = -10;

 wait(10);
 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;
 my.AnimShot = IUpSnipFire;
 my.AnimDie = 0;

 CollisionOffset.x = 0;
 CollisionOffset.y = 0;
 CollisionOffset.z = 0;
 AddColl(me);

 my.epassable = 0;
 my._health = 0;
 my.GotHit = 0;
 my.Grenader = 1;
 my.enable_detect = 1;
 my.enable_scan = 1;
 my.event = LeaderEvent;

 my.DieEvent = Function_To_Pointer( "SldLeaderDie");
 my.HitEvent = Function_To_Pointer( "LeaderHit");
 my.CollFunction = Function_To_Pointer( "TraceCollision");
 my.wieght = 50;
 my.LeaderIndex = LeaderCount;
 ThemLeader[LeaderCount] = me;
 create( <Rcol.mdl>, my.pos, LeaderCommands );

 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );
 you.Grenader = 1;
 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );
 you.Grenader = 1;
 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );
 you.Grenader = 1;
/* PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );
 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );*/
 PointParameters[0] = 100;
 PointParameters[1] = Lmg;
 create( <cklmg.mdl>, my.pos, SolderFollow );
/* PointParameters[0] = 75;
 PointParameters[1] = s99sniper;
 create( <cksnp.mdl>, my.pos, SolderFollow );
*/
 LeaderCount+=1;
 str_for_entname(name,my);
 ent_path(name);
 ent_waypoint(my._target_x,1);
wait(10);
LeaderMove(0);
}

action SldAnyLeader
{ 
if (you==0)
{
remove me;
return;
}

var MyLeader;
 MyLeader = you;
 if (LeaderCount>19)
 {
	return;
 }


 my.passable  = 1;
 my.invisible = 1;

 my.LeaderIndex = LeaderCount;
 ThemLeader[LeaderCount] = me;
 create( <Rcol.mdl>, my.pos, LeaderCommands );
 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <rm16.mdl>, my.pos, SolderFollow );
 you.Grenader = 1;
 you.Hide = 1;
 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );
 you.Grenader = 1;
 you.Hide = 1;
 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );
 you.Grenader = 1;
 you.Hide = 1;
 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );
 you.Grenader = 1;
 you.Hide = 1;
 PointParameters[0] = 50;
 PointParameters[1] = m16;
 create( <ckm16.mdl>, my.pos, SolderFollow );
 you.Grenader = 1;
 you.Hide = 1;
 PointParameters[0] = 100;
 PointParameters[1] = Lmg;
 create( <cklmg.mdl>, my.pos, SolderFollow );
 PointParameters[0] = 75;
 PointParameters[1] = s99sniper;
 create( <cksnp.mdl>, my.pos, SolderFollow );

 LeaderCount+=1;
 you = Pointer_To_Entity( my.LeaderId);
 you.skill1 =2;
 wait(10);
 you = MyLeader;
 while ( you != 0)
 {
        you = MyLeader;
	vec_set( my.x, you.x);
	vec_set( my.pan, you.pan);
	
	wait(1);
 }
}

function LmgWait()
{
my._signal = 0;
my._state = _state_wait;
ent_cycle( "3shot", my.FrameAnim);
while (my._state == _state_wait)
{
	if (SoldCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SniperStand");
	 return;
	}

	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 5000;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
	wait(1);
	 vec_set( my._target_x, my.x);
	 LmgState();
	 return;}

wait(1);
}

}

action LmgSolder
{

// SolderCounter+=1;
 if ( my.ScaleCollision<=0)
 {
	my.ScaleCollision = 1;
 }
 my.WeaponNumber = my.skill8;


 wait(10);

 my.VertexCount = GetVertexNum(me)-20;

 CollisionOffset.x = 0;
 CollisionOffset.y = 0;
 CollisionOffset.z = 0;
 AddColl(me);

 my.passable = 1;
 my.epassable = 0;
 my.enable_detect = 1;
 my.enable_scan = 1;
 my.event = Lmgsolderevent;
 my._type = _type_soldier;

 my.DieEvent = Function_To_Pointer( "SolderDie");
 my.HitEvent = Function_To_Pointer( "SolderHit");
 my.CollFunction = Function_To_Pointer( "TraceCollision");

 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;
 my.AnimDie = 0;
 my.AnimShot  = IGunFire  ;

 LmgWait();
}

