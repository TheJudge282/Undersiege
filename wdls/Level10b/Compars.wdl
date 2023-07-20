function soldier_sound(SndVol);

function CreateNew3DSound()
{
my.passable = 1;
my.invisible = 1;
wait(1);
soldier_sound(10000);
wait(20);
remove me;
}

function MoveTurnFall2Anim2Target(MSForce)
{
	 my.FrameAnim += MSForce*2*speed/600;
	 if (my.FrameAnim<100)
	 {my.FrameAnim+=100; }

	 temp.x = my._target_x - my.x; 
	 temp.y = my._target_y - my.y; 
	 temp.z = my._target_z - my.z; 
	 vec_to_angle( my_angle, temp);
	 my.pan = nearangle(my.pan,my_angle.pan,MSForce*5);

	 temp.x = min(MSForce*speed/600,vec_length(temp)); temp.y = 0;

	 temp.z = -CheckTheFLoor2(4000);
	 move( me, temp, nullskill);
 }

/////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////


// uses ScaleCollision
// uses Grenader, PatrolAfter, Hunt, Hide
action SoldColl
{

my.passable = 1;
if ( my.ScaleCollision<=0)
{
	my.ScaleCollision = 1;
}

//wait(10);
my.VertexCount = GetVertexNum(me)-20;
my.WeaponNumber = my.skill8;
Sold_Coll2();
}


function ShotM16(V1,v2)
{
	var MyState= my._state;
	my.FrameAnim = 0;
	ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
	wait(random(20));
	var bltnumbers=0;
	var Firewait=0;
	while (my._state == MyState)
	{
		you = Pointer_To_Entity( my.EnemyId);
		if (vec_dist( my.x , you.x)<1200)
		{
			if (bltnumbers==0)
			{
				if (random(10)>5)
					{play_entsound(me,m16rfire1,10000);}
				else
					{play_entsound(me,m16rfire2,10000);}
			}
		}
		else
		{
			WeaponSound3d( my.WeaponNumber);
		}
		temp.x = speed/2;
		tune_sound( result, 0, temp.x);
		bltnumbers+=1;
		Short_GunFlash(me,v1,v2);
		my.FrameAnim = 0;
		ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
		temp.pan = 360;
		temp.tilt = 360;
		temp.z = 10000;
		indicator = _gunfire;
		scan (my.x,my.pan,temp);
		ShotAndDamage(50,1,1,v1);
		while (my.FrameAnim<100 )
		{
			my.FrameAnim +=speed/4;
			ent_frame( AllAnimations[ my.AnimShot], my.FrameAnim);
			if (my._state !=  MyState)
			{
				return;
			} 
			wait(1);
		}
		Firewait = 0;
		while (Firewait<(Weap_fire_time[ my.WeaponNumber]*2))
		{
			Firewait+=1;
			if (my._state !=  MyState)
			{return;} 
		wait(1);
		}
		you = Pointer_To_Entity( my.EnemyId);
		if (vec_dist( my.x , you.x)>1200)
			{wait(10);}
		else
		{
			if (bltnumbers>3)
			{
			bltnumbers=0;
			while (bltnumbers<(20+random(20)))
			{
				bltnumbers+=1;
				if (my._state !=  MyState)
				{return;} 
			wait(1);
			}
			bltnumbers=0;
				bltnumbers=0;
			}
		}
	}
}

function ShotOnHim(V1,v2)
{
if ( my.WeaponNumber == m16 || my.WeaponNumber == galili)
{
	ShotM16(V1,v2);
	return;
}
	var MyState= my._state;
	wait(random(10));
	var bltnumbers=0;
	var Firewait=0;
	while (my._state == MyState)
	{
		bltnumbers+=1;
		Short_GunFlash(me,v1,v2);
		WeaponSound3d( my.WeaponNumber);
		my.FrameAnim = 0;
		ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
		temp.pan = 360;
		temp.tilt = 360;
		temp.z = 10000;
		indicator = _gunfire;
		scan (my.x,my.pan,temp);
		ShotAndDamage(50,1,1,v1);
		while (my.FrameAnim<100 )
		{
			my.FrameAnim +=speed/4;
			ent_frame( AllAnimations[ my.AnimShot], my.FrameAnim);
			if (my._state !=  MyState)
			{
				return;
			} 
			wait(1);
		}
		Firewait = 0;
		while (Firewait<(Weap_fire_time[ my.WeaponNumber]*2))
		{
			Firewait+=1;
			if (my._state !=  MyState)
			{return;} 
		wait(1);
		}
		if (my.WeaponNumber == pumaction)
		{
		bltnumbers=0;
		while (bltnumbers<10)
		{
			bltnumbers+=1;
			if (my._state !=  MyState)
			{return;} 
		wait(1);
		}
		 play_entsound( me, pumaction_reload_sound, 1000);
		bltnumbers=0;
		while (bltnumbers<20)
		{
			bltnumbers+=1;
			if (my._state !=  MyState)
			{return;} 
		wait(1);
		}
		 }

		if (bltnumbers>10+random(10))
		{
			bltnumbers=0;
			while (bltnumbers<100)
			{
				bltnumbers+=1;
				if (my._state !=  MyState)
				{return;} 
			wait(1);
			}
			bltnumbers=0;
		}
	}
}



function TakeNewStep()
{
you = Pointer_To_Entity( my.EnemyId);
if (you == null)
{return(0);
}
if (my.Hide)
{
if (spot_point2(Pointer_To_Entity( my.EnemyId))!=0)
{
	my.HiddenPoint =1;
	return(1);
}
}

my.HiddenPoint =0;
you = Pointer_To_Entity( my.EnemyId);
	if (vec_dist(you.x,my.x)>500)
	{
		if (spot2_point(Pointer_To_Entity( my.EnemyId))!=0)
		{
			return(1);
		}
	}
return(0);
}

function SolderHit()
{
	my._state = _state_hit;
	while (1)
	{
		if (my._health <=-200)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
		  return;
		}
		if (my.GotHit==100)
		{
			Hitter_sound(2000);
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

function SoldCheckIfHealthy()
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

function HideThenAttack()
{
 exclusive_entity;
 my._state = _state_standby;
 get_nextH_point(me);
 vec_set( my._Target_x, PointParameters[ PointPos]);
if (PointParameters[PointLeft]<=1)
{
	while (1)
	{
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "HideThenAttack");
			return;
		}

	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)<20) 
	{ break;	}

	 my.FrameAnim += 20*speed/600;
	 temp.x = my._target_x - my.x; 
	 temp.y = my._target_y - my.y; 
	 temp.z = 0; 
	 vec_to_angle( my_angle, temp);
	 my.pan = my_angle.pan;

	 temp.x = min(20*speed/600,vec_length(temp)); temp.y = 0;

	 temp.z = -CheckTheFLoor(4000);
	 move( me, temp, nullskill);
	ent_cycle( "1run", my.FrameAnim);

	wait(1);
	}
	get_nextH_point(me);
	vec_set( my._Target_x, PointParameters[ PointDirction]);

	//my.x = PointParameters[ PointPos];
	//my.y = PointParameters[ PointPos+1];

	temp.x = my.x -  my._Target_x;
	temp.y = my.y -  my._Target_y;
	temp.z = 0;
	vec_to_angle( my_angle, temp);

	if (PointParameters[PointLeft]==0)
	{my.pan = my_angle.pan -90;}else
	{my.pan = my_angle.pan +90;}

	ent_cycle( "stnd", 10);
}
 
 var TimeOfAttack=0;
  while ((TimeOfAttack<100)&&(my._state==_state_standby))
  {
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "HideThenAttack");
			return;
		}
	TimeOfAttack+=1;
  wait(1);
  }

	get_nextH_point(me);
	AttackThenHideNoMove();

}



function AttackThenHide()
{
 exclusive_entity;
 var TimeOfAttack=0;
 my._state = _state_attack;
	ShotOnHim(GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
	get_nextH_point(me);

	vec_set( my._Target_x, PointParameters[ PointDirction]);
	my.x = PointParameters[ PointPos];
	my.y = PointParameters[ PointPos+1];

	temp.x = my.x -  my._Target_x;
	temp.y = my.y -  my._Target_y;
	temp.z = 0;
	vec_to_angle( my_angle, temp);

			    var Len;
			    var Lang;
	if (PointParameters[PointLeft]==0)
	{
		my.pan = my_angle.pan -90;
			    temp.x = my.x - my._Target_x;
			    temp.y = my.y - my._Target_y;
			    temp.z = 0;
			    vec_to_angle( my_angle, temp);
			    vec_set( Lang, my_angle);
			    len = vec_length(temp);
			    len.z = 5;
			    len.y = len.z*180/len;
			    my.FrameAnim=0;
		while (Len>0)
		{	
			if (SoldCheckIfHealthy())
			{ 
			     my.LastState = Function_To_Pointer( "AttackThenHideNoMove");
				return;
			}

			    my.FrameAnim+=len.z*2;
			    temp.x = -min( len.z, len);
			    temp.y = 0;
			    temp.z = 0;
			    len -= len.z;
			    vec_rotate( temp, Lang);
			    temp.z = -CheckTheFLoor(4000);
			    vec_add( my.x, temp);
			    my.pan-=len.y;
			    ent_cycle( "3run", my.FrameAnim);
			wait(1);
		}
		my.AnimShot = IUpSnipFire;

	}else
	{
		my.pan = my_angle.pan +90;

			    temp.x = my.x - my._Target_x;
			    temp.y = my.y - my._Target_y;
			    temp.z = 0;
			    vec_to_angle( my_angle, temp);
			    vec_set( Lang, my_angle);
			    len = vec_length(temp);
			    len.z = 5;
			    len.y = len.z*180/len;
			    my.FrameAnim=0;
		while (Len>0)
		{	
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "AttackThenHideNoMove");
			return;
		}

			    my.FrameAnim+=len.z*2;
			    temp.x = -min( len.z, len);
			    temp.y = 0;
			    temp.z = 0;
			    len -= len.z;
			    vec_rotate( temp, Lang);
			    temp.z = -CheckTheFLoor(4000);
			    vec_add( my.x, temp);
			    my.pan+=len.y;
			    ent_cycle( "2run", my.FrameAnim);
			wait(1);
		}
		my.AnimShot = IUpSnipFire;
	}
	you = Pointer_To_Entity( my.EnemyId);
	vec_set( temp, you.pos);
	vec_sub( temp,my.pos);
	vec_to_angle( my_angle, temp);
	my.pan = my_angle.pan; wait(1);
  while ((TimeOfAttack<100)&&(my._state==_state_attack))
  {
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "AttackThenHide");
			return;
		}
	TimeOfAttack+=1;

	you = Pointer_To_Entity( my.EnemyId);
	vec_set( temp, you.pos);
	vec_sub( temp,my.pos);
	vec_to_angle( my_angle, temp);
	my.pan = my_angle.pan;

  wait(1);
  }


HideThenAttack();
}



function AttackThenHideNoMove()
{
 exclusive_entity;
	get_nextH_point(me);

	vec_set( my._Target_x, PointParameters[ PointPos]);
		while (1)
			{
//				create3Dline();
				if (SoldCheckIfHealthy())
				{ 
				      my.LastState = Function_To_Pointer( "AttackThenHideNoMove");
				      return;
				}

				if (MoveTurnFallAnim2Target( 20*50/my.wieght, 1))
				{	
					if (TakeNewStep()==0)
					{
						if (CheckVisEnemy(GunFlashFront[my.skill6])==0)
						{

							PathToEnemy();
						}else
						{wait(1);
							SolderShoting();
						}
						return;
					}else
					{
						SolderShoting();
					}
					return;
				} 
				vec_set(point_move.x,my._target_x);
				if ( EDistance(point_move,me)<20) 
				{
					break;
				}
				wait(1);}
	get_nextH_point(me);

	vec_set( my._Target_x, PointParameters[ PointDirction]);
	my.x = PointParameters[ PointPos];
	my.y = PointParameters[ PointPos+1];

	temp.x = my.x -  my._Target_x;
	temp.y = my.y -  my._Target_y;
	temp.z = 0;
	vec_to_angle( my_angle, temp);

	if (PointParameters[PointLeft]==0)
	{
		my.pan = my_angle.pan +90;
		my.AnimShot = IRightShot;
		goto Conit;
	}
	if (PointParameters[PointLeft]==1)
	{
		my.pan = my_angle.pan -90;
		my.AnimShot =  ILeftShot;
		goto Conit;
	}
		my.pan = my_angle.pan -90;
		my.AnimShot = IHandUpShot;
		my.z-=CheckTheFLoor(4000);
Conit :

 var TimeOfAttack=0;
 my._state = _state_attack;
 ShotOnHim(GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
 while ((TimeOfAttack<100)&&(my._state==_state_attack))
  {
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "AttackThenHideNoMove");
			return;
		}

	TimeOfAttack+=1;
	if (my.HiddenPoint)
	{
		if (CheckTHPoint(Pointer_To_Entity( my.EnemyId))==0)
		{ 
			my.AnimShot = IGunFire;
			SolderTRStep();
			return;

			if (TakeNewStep()==0)
			{
				PathToEnemy();
				return;
			}else
			{
			
			if (my.HiddenPoint==0){
				SolderShoting();
				return;
			}

			}
		}
	}

  wait(1);
  }

get_nextH_point(me);
my.x = PointParameters[ PointPos];
my.y = PointParameters[ PointPos+1];
HideThenAttack();
}

function SolderMove()
{
 exclusive_entity;

 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;
 wait(1);

 if (TakeNewStep()==0)
	{
		if (CheckVisEnemy(GunFlashFront[my.skill6])==0)
		{
			PathToEnemy();
		}else
		{
			SolderShoting();			
		}
		return;
	}
 				if (my.HiddenPoint==1)
				{
					AttackThenHideNoMove();				
					return;
				}
my._state = _state_move;
  while (my._state == _state_move)
  {
//	create3DEline();
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SolderMove");
			return;
		}
	if (random(10)>9)
	{
	if (CheckVisPosEnemy()!=0)
		{
			SolderShoting();			
			return;
		}
	}

	 MoveTurnFallAnim2Target( 20*50/my.wieght, 1);
	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)<20) 
	{
			if (TakeNewStep()==0)
			{
				if (CheckVisEnemy(GunFlashFront[my.skill6])==0)
				{

					PathToEnemy();
				}else
				{wait(1);
					SolderShoting();			
				}
				return;
			}else
			{
				if (my.HiddenPoint==0)
				{
					SolderShoting();
					return;
				}else
				{	
					wait(1);
					AttackThenHideNoMove();				
					return;
				}
			}
	}


   wait(1);
  }

}

function SolderThrowGrenade(NextFunc)
{
exclusive_entity;
my._state = _state_attack;

you = Pointer_To_Entity( my.EnemyId);
temp.x = my._target_x - my.x;
temp.y = my._target_y - my.y;
temp.z = my._target_z - my.z;
vec_to_angle( my_angle, temp);
my.pan = my_angle;

str_for_entfile( GrenadeThrower,my);
GrenadeThrow[ 0 ] = me;
GrenadeThrow[ 1 ] = my.weaponnumber;
morph ( <ckgre.mdl>, me);

my.VertexCount = GetVertexNum(me)-20;
my.FrameAnim =0;
while ( (my._state == _state_attack)&&(my.FrameAnim <15))
{
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SolderShoting");
			return;
		}
	my.FrameAnim +=2*speed/100;
	ent_cycle( UpSnipFire, my.FrameAnim);
	wait(1);
}
vec_for_vertex( temp, my, 94);
vec_set( ScanValues[0], temp);
vec_set( ScanValues[3], temp);
ScanValues[5] += 50;


vec_set( ScanValues[6],  my._target_x);
vec_set( ScanValues[9],  my._target_x);
ScanValues[8] += 50;

vec_for_vertex( temp, my, 94);
my.Grenader = 0;//min(max(my.Grenader-0.6,0),1);
forces = 100;
my_angle.x = 0;
create(<Wgraned.MDL>,temp,Grenade_Throw);

while ( (my._state == _state_attack)&&(my.FrameAnim <100))
{
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SolderShoting");
			morph (  GrenadeThrower, me);
			my.VertexCount = GetVertexNum(me)-20;
			GrenadeThrow[ 0 ] = 0;
			return;
		}
	my.FrameAnim +=2*speed/100;
	ent_cycle( UpSnipFire, my.FrameAnim);
	wait(1);
}


my.weaponnumber = GrenadeThrow[ 1 ];
morph (  GrenadeThrower, me);
my.VertexCount = GetVertexNum(me)-20;
GrenadeThrow[ 0 ] = 0;


Pointer_To_Function( NextFunc, 0, 0, 0);

}

function SolderShotting()
{
	exclusive_entity;
	my._state = _state_attack;
	var AttackTime = 0;
	AttackTime.y = random(100)+100;
	ShotOnHim(GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
	CheckCloseFire();
	while ((AttackTime< AttackTime.y) && (my._state == _state_attack))
	{
		//               create3Dline();
		if (SoldCheckIfHealthy())
		{
			my.LastState = Function_To_Pointer( "SolderShoting");
			return;
		}
		if (CheckVisPosEnemy()==0)
		{
			SolderMove();
			return;
		}
		you = Pointer_To_Entity( my.EnemyId);
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan = my_angle;
		AttackTime +=1;
		wait(1);
	}
	SolderMove();
}


function SolderShoting()
{
	if (random(100)>99)
		{create( <point1.mdl>, my.pos, CreateNew3DSound);}
	if (my.Grenader)
	{
		you = GrenadeThrow[ 0 ];
		if ( you == null )
		{
			you = Pointer_To_Entity( my.EnemyId);
			if (you.Enemy_Count>1)
			{
				temp.x = EDistance(you,my);
				if ((random(you.Enemy_Count)>you.Enemy_Count / 2)&&(temp.x>300 && temp.x<2000))
				{
					you  = Pointer_To_Entity( my.EnemyId);
					vec_set( my._target_x, you.x);
					SolderThrowGrenade( Function_To_Pointer("SolderShotting"));
					return;
				}
			}
		}
	}
	SolderShotting();
}

function CheckCloseFire()
{

my.AnimShot = IGunFire;
  while (my._state == _state_attack)
  {
	if (random(10)>9)
	{
		my.AnimShot = IGunFire;
		vec_set( my_angle, my.pan);
		my_angle.pan += 180;
		temp.pan = 180;
		temp.tilt = 180;
		temp.z = 1000;
		indicator = CloseShot;
		scan (my.x,my_angle,temp);
	}
	wait(1);
  }
}

function SSolderDie()
{
 SnipersCount -= 1;
 SnipersCount.y += 1;

 SolderDie();
}

function SolderDie()
{

SolderCounter-=1;

if (my.flag6) && (my.flag7 == 0)
{
	DedSolders.y +=1;
}
if (my.flag6 == 0) && (my.flag7 == 0)
{
	DedSolders.x +=1;
}


wait(1);
you = Pointer_To_Entity( my.EnemyId);
if (you)
{
	you.Enemy_Count -= 1;
}


 //exclusive_entity;
 if (my.HiddenPoint)
 {
	Free_HPoint(me);
 }else
 {
	Free_Point(me);
 }
PointParameters[ PointLength] = my.PathId;
UnLocatePoint();
 my._state = _state_die;

str_for_entfile( name, me);
PTempstr = GetDieString( name, me);
if (PTempstr!=0){
	morph (  PTempstr, me);
}else
{
  morph ( <rdie.mdl>, me);
}
RemoveColl(me);
 my.skill1=0;
 while (my.skill1<100)
  {
	ent_frame( LonelyAnimat [ my.AnimDie ] , my.skill1);
	my.skill1 += 10*speed/200;
	wait(1);
  }
  if (my.weaponnumber == 4)
{
	create( <point1.mdl>, my.pos, PickUpAmmo);
	my.weaponnumber = 8;
	create( <point1.mdl>, my.pos, PickUpAmmo);
}
else
{create( <point1.mdl>, my.pos, PickUpAmmo);
}
 my.skill1=0;
  while (my.skill1<20)
  {

	//my.scale_z /= max( 0.11*speed/200, 1);
	//my.z -= 0.2*speed/200;

	  my.skill1 += 0.3*speed/200;
  wait(1);
  }
remove me;
}



function solderevent()
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

	if event_type == event_scan && indicator == _gunfire && (my._state == _state_wait || my._state == _state_Walk )
	{	
		if (you._type == _type_player)
		{	
			you = player;
			my.EnemyId = you.BodyLnk;
		}
		else
		{my.EnemyId = you.EnemyId;
		}
		my._signal = _hear_fire;
		BellAct = 1;
		return;
	}

	if event_type == event_detect && you._type == _type_soldier && indicator == _GrenadeTest
	{
		ScanValues[4]+=1;
		return;
	}

	if event_type == event_detect && you._type == _type_player
	{
		my.EnemyId = Entity_To_Pointer( you);

		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			my._signal = _detecte_enemy;
			you= Pointer_To_Entity( my.EnemyId); 
			you.Enemy_Count += 1;
			BellAct = 1;
		}
		return;
	}
	////	luai add
	if event_type == event_detect && you._type == _type_actor
	{
		my.EnemyId = Entity_To_Pointer( you);
		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			BellAct = 1;
			you = player;
			my.EnemyId = you.BodyLnk;
			my._signal = _hear_fire;

		}
		return;
	}
	////

	if event_type == event_detect && indicator == CloseShot && you._type != _type_player && you._state == _state_attack
	{
		 my.AnimShot = IDownSnipFire;
		 return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
}

function Ssolderevent()
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


	if event_type == event_entity && you != 0
	{ 
		if(you.owntype == TypeOfEngines) 
		{
			my._health -= 100;
		}
		return;
	}

	if event_type == event_scan && indicator == _gunfire && my._state == _state_wait
	{
		my.EnemyId = you.EnemyId;
		my._signal = _hear_fire;
		return;
	}

	if event_type == event_scan && indicator == StepSound && my._state == _state_wait
	{
		my.EnemyId = Entity_To_Pointer( you);
		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			my._signal = _detecte_enemy;
		}
		return;
	}

	if event_type == event_detect && you._type == _type_player
	{
		my.EnemyId = Entity_To_Pointer( you);

		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			my._signal = _detecte_enemy;
			you= Pointer_To_Entity( my.EnemyId); 
			you.Enemy_Count += 1;
		}
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
}

function Lmgsolderevent()
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

	if event_type == event_detect && you._type == _type_player
	{
		my.EnemyId = Entity_To_Pointer( you);

		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			my._signal = _detecte_enemy;
		}
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
}




function SolderGuard()
{
 exclusive_entity;
 my.AnimRun = 1;
 my._signal = 0;

 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;

 temp.x=0;
 temp.y=360;
 my_angle.x=10000;
 my_angle.y=100;
 my_angle.z=0;
 you = Pointer_To_Entity( my.EnemyId);

 my._state = _state_Walk;
while (my._state == _state_Walk)
{

		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SolderGuard");
			return;
		}
	MoveTurnFallAnim2Target( 5*50/my.wieght, 1);

	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)<20) 
	{
		ent_nextpoint(my._target_x);
	}
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

	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 500;
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

	if (BellAct.y == 1)
	{
		SolderShoting();
		return;
	}
	
	wait(1);
}


}



function SolderWalking()
{
		exclusive_entity;
		my._signal = 0;

 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;

		temp.x=0;
		temp.y=360;
		my_angle.x=10000;
		my_angle.y=100;
		my_angle.z=0;
		you = Pointer_To_Entity( my.EnemyId);
		spot3_point(0);

		my._state = _state_Walk;
	vec_set( my._target_x, my.x);
while (my._state == _state_Walk)
{

		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SolderWalking");
			return;
		}

	MoveTurnFallAnim2Target( 5*50/my.wieght, 1);

	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)<20) 
	{
		spot3_point(0);
	}
	temp.pan = 180;
	temp.tilt = 360;
	temp.z = 1700;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
	SolderShoting();
	return;
	}

	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 700;
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
	
	wait(1);
}
}

function SolderTRStep()
{
		exclusive_entity;
		my._signal = 0;

 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;

		temp.x=0;
		temp.y=360;
		my_angle.x=1000;
		my_angle.y=0;
		my_angle.z=0;
		you = Pointer_To_Entity( my.EnemyId);
		spot3_point(0);

		my._state = _state_Walk;
while (my._state == _state_Walk)
{

		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SolderTRStep");
			return;
		}

	MoveTurnFallAnim2Target( 500/my.wieght, 1);

	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)<20) 
	{
		SolderWait();
		return;
	}
	temp.pan = 180;
	temp.tilt = 360;
	temp.z = 1700;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
	SolderShoting();
	return;
	}

	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 700;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
		SolderShoting();
		return;
	}
/*
	if (my._signal == _hear_fire)
	{ 
		SolderShoting();
		return;
	}*/
	
	wait(1);
}

}


function SolderWait()
{
		exclusive_entity;
		my._signal = 0;

 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;

		temp.x=0;
		temp.y=360;
		my_angle.x=10000;
		my_angle.y=100;
		my_angle.z=0;
		you = Pointer_To_Entity( my.EnemyId);

		my._state = _state_wait;
	vec_set( my._target_x, my.x);
while (my._state == _state_wait)
{
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SolderTRStep");
			return;
		}

	ent_cycle( stnd, my.FrameAnim*speed/200);

	temp.pan = 180;
	temp.tilt = 360;
	temp.z = 1700;
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
	SolderShoting();
	return;
	}

	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 700;
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
	
	wait(1);
}
}

function Sold_Coll2()
{
	//wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	SolderCounter+=1;
	my.hunt = 1;
	if (my.WeaponNumber == 5)
	{my.hide = 0;
	}
	else
	{my.hide = 1;
	}
	my.wieght = 50;
	//wait(20);
	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimShot = IUpSnipFire;
	my.AnimDie = 0;

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
	//my.pan = random(360);

	my.DieEvent = Function_To_Pointer( "SolderDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	/*
	// luai l8
	if (my.skill17 == 8)
	{
		temp.x = player.x - my.x;
		temp.y = player.y - my.y;
		temp.z = player.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle;
	}
	
	if (my.defaultstate==0)
	{
		my.EnemyId = player.bodylnk;
		PathToEnemy();
		return;
	}
	if (my.defaultstate==1)
	{
		if (my.x > 100)
		{ent_path("patrol2");goto pat;
		}
		if (my.x < -100)
		{ent_path("patrol1");goto pat;
		}
		else
		{ent_path("patrol3");
		}
		pat:
		ent_waypoint(my._target_x,1);
		SolderGuard();
		return;
	}
	if (my.defaultstate==3)
	{
		if (my.x > 100)
		{ent_path("patrol1");
		}
		else
		{ent_path("patrol2");
		}
		ent_waypoint(my._target_x,1);
		SolderGuard();
		return;
	}
	if (my.defaultstate==7)
	{
		if (my.x > 100)
		{ent_path("enter1");
		}
		else
		{ent_path("enter2");
		}
		ent_waypoint(my._target_x,1);
		SolderGuard();
		return;
	}
	if (my.defaultstate==10)
	{
		SolderWalking();
		return;
	}
	if (game_state[0] == 5)&&(my.defaultstate==5)
	{my.pan=270;
	}
	*/
	SolderWait();
}

function AngYouAndTarget(Dist)
{
var ang1;
you = Pointer_To_Entity( my.EnemyId);

temp.x = you.x - my.x;
temp.y = you.y - my.y;
temp.z = you.z - my.z;
vec_to_angle( my_angle, temp);
ang1 = my_angle.x;

temp.x = my._target_x - my.x;
temp.y = my._target_y - my.y;
temp.z = my._target_z - my.z;
vec_to_angle( my_angle, temp);
ang1 = abs(ang(my_angle.x - ang1));
if (ang1<=dist)
{
return(1);
}else
{
return(0);
}
}

function PathToEnemy()
{
exclusive_entity;

my.AnimWalk = IWalkFront;
my.AnimRun  = IRunFront;

vec_set( my._target_x,  my.x);
temp.x = FindPath2Him( Pointer_To_Entity( my.EnemyId));
my._state = _state_path;
var TimeToCheck=0;
while (my._state==_state_path)
{
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "PathToEnemy");
			return;
		}
	if (random(10)>9)
	{
	if (CheckVisPosEnemy()!=0)
		{
			SolderShoting();			
			return;
		}
	}

	if (MoveTurnFallAnim2Target( 10*50/my.wieght, 1))
	{
		wait(1);
		SolderMove();
		return;
	}


	vec_set(point_move.x,my._target_x);
	if ( EDistance(point_move,me)<20) 
	{

		temp.x = FindNext2Him(Pointer_To_Entity( my.EnemyId));
		if (temp.x==0)
		{wait(1);
		
		if (my.PatrolAfter)
		{
			SolderWalking();
		}else
		{ 
			 SolderWait();
		}
			return;
		}
		if (temp.x<=3)
		{
		if (my.grenader)
		{
			ScanValues[4] =0;
			ScanValues.x = 360; ScanValues.y = 180; ScanValues.z=300;
			Indicator = _GrenadeTest;
			scan( my._target_x, my.pan, ScanValues);
			if (ScanValues[4] == 0)
			{
			you = Pointer_To_Entity( my.EnemyId);
			
			if (vec_dist( my.x, my._target_x)>200) {
			if (vec_dist( you.x, my._target_x)<500) {
				wait(1);
				SolderThrowGrenade(Function_To_Pointer("SolderMove"));
				return;
			}
			}
			}
		}else
		{
		if (my.Hide)
			{
			if (spot_point2(Pointer_To_Entity( my.EnemyId))!=0)
			{
				my.HiddenPoint =1;
				wait(1); 
				AttackThenHideNoMove();				
				return;
			}
			}
		
		}
		}

		if ((temp.x==1)||((temp.x==2)&&(PointParameters[ PointLeft])))
		{
			wait(1);
			if (TakeNewStep()!=0)
			{
				SolderMove();
				return;
			}else
			{ create3DEline();
			 goto checkifacuo;
			}

		}else
		{
checkifacuo :	if (PointParameters[ PointLeft])
		{ 
		TimeToCheck =0;
		while (TimeToCheck<100)
		{
		if (CheckVisPosEnemy()!=0)
			{
				SolderShoting();			
				return;
		}
		TimeToCheck +=1;
		 if (SoldCheckIfHealthy())
		 { 
		        my.LastState = Function_To_Pointer( "SolderTRStep");
			return;
		 }
		ent_cycle( Stnd, TimeToCheck*speed/200);
		wait(1);
		}
		}
		
		}
		
	}


	wait(1);
}
}

function SniperAttack()
{
my._state = _state_attack;

while ( my._state == _state_attack)
{

	if (SoldCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SniperAttack");
	 return;
	}
	vec_set( point_move.x, my._target_x);
	if ( EDistance( point_move, me)>5) 
	{
	 MoveTurnFallAnim2Target( 15*50/my.wieght, 1);

	}else
	{
		break;
	}

 wait(1);
}
if (get_nextH_point(me))
{
 temp.x = PointParameters[ PointDirction]     -  PointParameters[ PointPos];
 temp.y = PointParameters[ PointDirction+ 1]  -  PointParameters[ PointPos+ 1];
 temp.z = PointParameters[ PointDirction+ 2]  -  PointParameters[ PointPos+ 2];
 vec_to_angle( my_angle, temp);
 my.pan = my_angle;
}
 my.EnemyHide = 0;
 SniperShot();
while ( my._state == _state_attack)
{

//	create3Dline();
	if (SoldCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SniperAttack");
	 return;
	}

	if (CheckTHPoint(Pointer_To_Entity( my.EnemyId))==0)
	{
	if(CheckVisEnemy(GunFlashFront[my.skill6])!=1) {
		my.EnemyHide += 1;
		if (my.EnemyHide>0)
		{
		 SniperMove();
		 return;
		}
		}else
		{
		my.EnemyHide = 0;
		
		}
	}else
	{
		my.EnemyHide = 0;
	}
	wait(1);
}
}

function SniperMove()
{

 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;
 my._state = _state_move;
 my.EnemyHide =0;
while (my._state == _state_move)
{
	if (SoldCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SniperMove");
	 return;
	}
 if (SniperSpot_point(Pointer_To_Entity( my.EnemyId)))
 {
 SniperFindPath2Him(Pointer_To_Entity( my.EnemyId),0);
 while (my._state == _state_move)
  {
	if (SoldCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SniperMove");
	 return;
	}
	vec_set( point_move.x, my._target_x);
	if ( EDistance( point_move, me)>5) 
	{
	 MoveTurnFallAnim2Target( 20*50/my.wieght, 1);

	}else
	{
	if (SniperFindPath2Him(Pointer_To_Entity( my.EnemyId),1)==0)
	{
		 wait(1);
		SniperAttack();
		return;
	}
	}

  wait(1);
  }
}else
{
my.EnemyHide+=1;
if (my.EnemyHide>00)
{
	wait(1);
	SniperStand();
	return;
}
}

wait(5);
}

}

function SniperStand()
{
ent_cycle(  AllAnimations[ my.AnimShot], my.FrameAnim);
my._signal = 0;
my._state = _state_wait;
while (my._state == _state_wait)
{
	if (SoldCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "SniperStand");
	 return;
	}


	if (my._signal == _detecte_enemy)
	{
	wait(1);
	my.unlit = 0;
	 vec_set( my._target_x, my.x);
	 SniperAttack();
	 return;
	 }

	temp.pan = 180;
	temp.tilt = 360;
	temp.z = 100000;
	indicator = _watch;
	scan (my.x,my.pan,temp);

	if (my._signal == _detecte_enemy)
	{
	wait(1);
	 vec_set( my._target_x, my.x);
	 SniperAttack();
	 return;
	 }

	if (my._signal == _hear_fire)
	{
	wait(1);
	 vec_set( my._target_x, my.x);
	 SniperAttack();
	 return;
	 }
wait(1);
}

}

function SolderSniper()
{
 SolderCounter += 1;
 SnipersCount  += 1;
 if ( my.ScaleCollision<=0)
 {
	my.ScaleCollision = 1;
 }


 wait(10);
 my.AnimWalk = IWalkFront;
 my.AnimRun  = IRunFront;
 if (my.z > 280)
 {
 my.AnimShot = IDownSnipFire  ;
 }else
 {
  my.AnimShot = IUpSnipFire  ;

 }
 my.AnimDie = 0;

 my.VertexCount = GetVertexNum(me)-20;

 CollisionOffset.x = 0;
 CollisionOffset.y = 0;
 CollisionOffset.z = 0;
 AddColl(me);

 my.epassable = 0;
 my.Find_HidePoint = -100;
 my.enable_detect = 1;
 my.enable_scan = 1;
 my.event = SSolderevent;

 my.DieEvent = Function_To_Pointer( "SSolderDie");
 my.HitEvent = Function_To_Pointer( "SolderHit");
 my.CollFunction = Function_To_Pointer( "TraceCollision");

 my.WeaponNumber = s99sniper;
 my.wieght = 75;
// my.EnemyId = ptr_for_handle( player.bodylnk);
 my.passable = 1;
 my.HiddenPoint = 1;
 my._type = _type_soldier;
 //create( <Hala.MDL>, my.pos, halashow);
 SniperStand();
 }


function soldier_sound(SndVol)
{
	var order = 0;
	order = int(random(22));
	if (order == 0)
		{order == 22;}
	if (order == 1)
	{
		play_entsound(me,SolderSound1,SndVol);
		goto  sound_out;
	}
	if (order == 2)
	{
		play_entsound(me,SolderSound2,SndVol);
		goto  sound_out;
	}
	if (order == 3)
	{
		play_entsound(me,SolderSound3,SndVol);
		goto  sound_out;
	}
	if (order == 4)
	{
		play_entsound(me,SolderSound4,SndVol);
		goto  sound_out;
	}
	if (order == 5)
	{
		play_entsound(me,SolderSound5,SndVol);
		goto  sound_out;
	}
	if (order == 6)
	{
		play_entsound(me,SolderSound6,SndVol);
		goto  sound_out;
	}
	if (order == 7)
	{
		play_entsound(me,SolderSound7,SndVol);
		goto  sound_out;
	}
	if (order == 8)
	{
		play_entsound(me,SolderSound8,SndVol);
		goto  sound_out;
	}
	if (order == 9)
	{
		play_entsound(me,SolderSound9,SndVol);
		goto  sound_out;
	}
	if (order == 10)
	{
		play_entsound(me,SolderSound10,SndVol);
		goto  sound_out;
	}
	if (order == 11)
	{
		play_entsound(me,SolderSound11,SndVol);
		goto  sound_out;
	}
	if (order == 12)
	{
		play_entsound(me,SolderSound12,SndVol);
		goto  sound_out;
	}
	if (order == 13)
	{
		play_entsound(me,SolderSound13,SndVol);
		goto  sound_out;
	}
	if (order == 14)
	{
		play_entsound(me,SolderSound14,SndVol);
		goto  sound_out;
	}
	if (order == 15)
	{
		play_entsound(me,SolderSound15,SndVol);
		goto  sound_out;
	}
	if (order == 16)
	{
		play_entsound(me,SolderSound16,SndVol);
		goto  sound_out;
	}
	if (order == 17)
	{
		play_entsound(me,SolderSound17,SndVol);
		goto  sound_out;
	}
	if (order == 18)
	{
		play_entsound(me,SolderSound18,SndVol);
		goto  sound_out;
	}
	if (order == 19)
	{
		play_entsound(me,SolderSound19,SndVol);
		goto  sound_out;
	}
	if (order == 20)
	{
		play_entsound(me,SolderSound20,SndVol);
		goto  sound_out;
	}
	if (order == 21)
	{
		play_entsound(me,SolderSound21,SndVol);
		goto  sound_out;
	}
	if (order == 22)
	{
		play_entsound(me,SolderSound22,SndVol);
		goto  sound_out;
	}
	

	sound_out:
	return;
}

function death_sound(SndVol)
{
	var order = 0;
	order = int(random(4));
	if (order == 0)
		{order == 4;}
	if (order == 1)
	{
		play_entsound(me,DeathSound1,SndVol);
		goto  sound_out1;
	}
	if (order == 2)
	{
		play_entsound(me,DeathSound2,SndVol);
		goto  sound_out1;
	}
	if (order == 3)
	{
		play_entsound(me,DeathSound3,SndVol);
		goto  sound_out1;
	}
	if (order == 4)
	{
		play_entsound(me,DeathSound4,SndVol);
		goto  sound_out1;
	}
	sound_out1:
	return;
}

function Hitter_sound(SndVol)
{
	var order = 0;
	order = int(random(6));

	if (order == 0)
		{order == 6;}

	if (order == 1)
	{
		play_entsound(me,HitSound1,SndVol);
		goto  sound_out1;
	}

	if (order == 2)
	{
		play_entsound(me,HitSound2,SndVol);
		goto  sound_out1;
	}

	if (order == 3)
	{
		play_entsound(me,HitSound5,SndVol);
		goto  sound_out1;
	}

	if (order == 4)
	{
		play_entsound(me,HitSound4,SndVol);
		goto  sound_out1;
	}

	if (order == 5)
	{
		play_entsound(me,HitSound5,SndVol);
		goto  sound_out1;
	}

	if (order == 6)
	{
		play_entsound(me,HitSound6,SndVol);
		goto  sound_out1;
	}

	sound_out1:
	return;
}

action SoldCollS
{

my.passable = 1;
if ( my.ScaleCollision<=0)
{
	my.ScaleCollision = 1;
}

wait(10);
my.VertexCount = GetVertexNum(me)-20;
my.WeaponNumber = my.skill8;
Sold_CollS2();
}
function solderevent1()
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
	////	luai add
	if event_type == event_detect && (you._type == _type_compars)
	{
		my.EnemyId = Entity_To_Pointer( you);
		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			my._signal = _detecte_enemy;
		}
		return;
	}
/*	if event_type == event_detect && (you._type == _type_player)
	{
		my.EnemyId = Entity_To_Pointer( you);

		if(CheckVisEnemy(GunFlashFront[my.skill6])==1) 
		{
			my._signal = _detecte_enemy;
			you= Pointer_To_Entity( my.EnemyId); 
			you.Enemy_Count += 1;
			BellAct = 1;
		}
		return;
	}*/
	////
	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		//my.EnemyId = Entity_To_Pointer( you);
		//my._signal = _detecte_enemy;
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
}

function Sold_CollS2()
{
	wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	SolderCounter+=1;
	my.Grenader = 1;
	my.hunt = 1;
	my.wieght = 50;
	wait(20);
	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimShot = IUpSnipFire;
	my.AnimDie = 0;
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
	my.event = solderevent1;
	my.DieEvent = Function_To_Pointer( "SolderDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	//PathToEnemy();
	//SolderWait();
	//SolderShoting();
	 LmgWait();
	return;
}

