path <..\\data>;

entity blackface
{
	type = <darks.tga>;
	view = camera;
	layer = 100;
	flags = visible;
	scale_x = 0.1;
	scale_y = 0.1;
	x = 10;
	y = 0;
	z = 0;
	alpha = 0;
}

entity helpKeys
{
	type = <keys.tga>;
	view = camera;
	//flags = visible;
	scale_x = 0.1;
	scale_y = 0.1;
	x = 60;
	y = 0;
	z = 0;
}
entity PreesEnter
{
	type = <pressmsg2.tga>;
	view = camera;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = -20;
	layer = 5;
}
entity splashscreen
{
	type = <Lev5MLoad1.bmp>;
	view = camera;
	flags = visible;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = 0;

	layer = 4;
}



path <music>;
path <sounds>;
path <weapons>;
string level_str = <level52h.WMB>; // give file names in angular brackets
string hintsc,<Lev5HintM.bmp>;

var hSolderPointer[7] = 0,0,0,0,0,0,0;
var hAxcelNumber[7] = 0,0,0,0,0,0,0;

function CreateRandomSold(iCounter);
include <definations.wdl>;
include <variabls1.wdl>;
include <Mathe.wdl>;
include <Links.wdl>;
include <sounds.wdl>;

include <gui.wdl>;
include <SaveGui.wdl>;
include <MainGui.wdl>;
include <grande.wdl>;
include <pazoka.wdl>;
include <flashes.wdl>;
include <Ammo.wdl>;
include <WeaponFx.wdl>;
include <bullet.wdl>;
include <weapon.wdl>;
include <inpot1.wdl>;
include <cars.wdl>;
include <Compars2.wdl>;
include <tplayer1.wdl>;
include <initiazation.wdl>;
include <equipments.wdl>;
include <SolderFx.wdl>;
include <SolderActS.wdl>;
//include <Solders.wdl>;
include <SolderLeader.wdl>;
include <rain.wdl>;

var video_mode = 7;
var video_depth = 16;

string mmm = <missionLev05_03.tga>;

function main()
{
	str_cpy(levelpath,"level5pa.pts");
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;

	play_sound(SSound1,100);
	StartSoundH = result;

	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
	level.z=2;
	initilization();
	
	camera.fog = 8;
	totalbullets[4] = 60;
	totalbullets[5] = 60;
	totalbullets[0] = 18;
	morph (mmm,MisionsMsg2);
	MisionsMsg2.visible = 1;
	

	wait(50);
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	
	
}

function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(2DSPlaying);
	stop_sound(3DSPlaying);
}

function SetViewBright(CMBr)
{
		camera.ambient = CMBr-100;
		blackface.alpha = abs(min(0, camera.ambient)/3);

}
function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}
function terraintexture()
{
 my.tex_scale=2.4;
}


function temp_mve()
{
	return;
}

function weap_m16()
{
	return;
}

function temp_fire()
{
	return;
}

function sparkgun()
{	
	return;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

//				My Global Decleration

//////////////////////////////////////////////////////////////////////////////////////////////////////


var General = 0;
var AhmeedPointer = 0;

var GeneralAlife =1;


var PlaGotTheGe = 0;


////@ Just For Test things
//function TestShowArrow()
//{
//	my.passable = on;
//	temp.x= 0;
//	temp.y = 0;
//	temp.z = 50;
//	vec_rotate(temp,my.pan);
//	vec_add(temp,my.pos);
//	vec_set(my.pos,temp);
//
//	my.skill20 = 1;
//	my.tilt = 180;
//	while (my.flag1 == 0)
//	{
//		
//		my.skill30 += 1;
//		if (my.skill30 > 20)
//		{
//			my.skill30 = 0;
//			if (my.skill20 == 1)
//			{
//				my.scale_x = 0.5;
//				my.scale_y = 0.5;
//				my.scale_z = 0.5;
//				my.skill20 *= -1; 
//			}
//			else
//			{
//				my.scale_x = 1;
//				my.scale_y = 1;
//				my.scale_z = 1;
//				my.skill20 *= -1;
//			}
//		}
//
//		wait(1);
//	}
//	remove(my);
//}
//


//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Comon Functons
//
//////////////////////////////////////////////////////////////////////////////////////////////////////


function CameraCarier()
{
	my.passable = 1;
	my.visible = 0;
	ent_path("CameraPath");
	ent_waypoint(my._target_x,1);
	
	my.x = my._target_x;
	my.y = my._target_y;
	my.z = my._target_z;

	temp.x= my._target_x - my.x;
	temp.y= my._target_y - my.y;
	temp.z= my._target_z - my.z;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;
	
	
	
	while (1)
	{		
		temp.x= my._target_x - my.x;
		temp.y= my._target_y - my.y;
		temp.z= my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle.pan,1.3*(speed/200));
		my.tilt = nearangle(my.tilt,my_angle.tilt,1.3*(speed/200));
						
		temp.x = 0;
		temp.y = 0;
		temp.z = 190;
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);
		vec_set(camera.pos,temp);
		camera.pan = my.pan;
		
		temp.x = speed/25;		
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector);

		if (vec_dist(my.x ,my._target_x ) < 60)
		{
			ent_nextpoint(my._target_x);
		}

		wait(1);
	}	
}

function hideAllGui()
{
	MovieOrSucess = 1;
	WeaponPan2.visible = 0;	
	WeaponPan.visible = 0;
	WeaponStore.visible = 0;
	DWeaponStore.visible = 0;
	WeaponStore.visible = 0;
	VWeaponSprite.visible = 0;
	VWeaponSprite1.visible = 0;
	ObjecPos.visible = 0;
	ObjecPos1.visible = 0;
	outcompass.visible = 0;
	EnemyPos.visible = 0;
	Compass.visible = 0;
	HldBk.visible = 0;
	HldSld.visible = 0;
	VWeaponSprite1.visible = 0;
	CPointer.visible = 0;
	looprun=0;
	mesges.visible = 0;
	CloseSong(CurrentSong);		
	object5.visible = 0;
}

function VictoryCamera()
{
	ZoomOut();
	hideAllGui();

	MovieOrSucess = 1;
	ObjecPos.visible = 0;	
	outcompass.visible = 0;
	EnemyPos.visible = 0;
	Compass.visible = 0;
	HldBk.visible = 0;
	HldSld.visible = 0;
	ObjecPos1.visible = 0;		
	VWeaponSprite1.visible = 0;
	looprun=0;
	mesges.visible = 0;
	CloseSong(CurrentSong);			
	camra2player = 0;
	
	temp.x = player.x;
	temp.y = player.y;
	temp.z = player.z;
	create(<point1.mdl>,temp,CameraCarier);
	you.pan = 10;
	camera.pan = 10;
	camera.tilt = 0;
	//PlayloopSound(-1);
	RemoveAllKeys();
	on_enter = finalization;
	PreesNextLvl.visible = 1;
	Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));

}

/* ---------------------------------------------------------------------------------------- */
sound S_M_L5a_16 , <M_L5a_16.wav>;
sound S_M_L5a_18 , <M_L5a_18.wav>;
sound S_M_L5a_19 , <M_L5a_19.wav>;
sound S_M_L5a_20 , <M_L5a_20.wav>;
sound S_M_L5a_21 , <M_L5a_21.wav>;
sound S_M_L5a_25 , <M_L5a_25.wav>;
sound S_M_L5a_29 , <M_L5a_29.wav>;
sound S_M_L5a_30 , <M_L5a_30.wav>;
sound S_M_L5a_32 , <M_L5a_32.wav>;
sound S_M_L5a_33 , <M_L5a_33.wav>;

function Play2DSound(iNumber)
{
	stop_sound(2DSPlaying);
	
	if (iNumber == 1)
	{
		play_sound(S_M_L5a_32,100);
		2DSPlaying = result;
		return;
	}	
	if (iNumber == 2)
	{
		play_sound(S_M_l5a_18,100);
		2DSPlaying = result;
		return;
	}	
	if (iNumber == 3)
	{
		play_sound(S_M_L5a_19,100);
		2DSPlaying = result;
		return;
	}	
	if (iNumber == 4)
	{
		play_sound(S_M_L5a_20,100);
		2DSPlaying = result;
		return;
	}	
	if (iNumber == 5)
	{
		play_sound(S_M_L5a_25,100);
		2DSPlaying = result;
		return;
	}	
}


define __MarVolume = 600;
function Play3Dsound(iNumber)
{
	stop_sound(3DSPlaying);
	
	if (iNumber == 1)
	{
		play_entsound(my,S_M_L5a_16,__MarVolume);
		3DSPlaying = result;
		return;
	}	
	if (iNumber == 2)
	{
		play_entsound(my,S_M_L5a_29,__MarVolume);
		3DSPlaying = result;
		return;
	}
	/*
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
		return;
	}
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
		return;
	}
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
		return;
	}
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
		return;
	}
	*/
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Cars Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////

var hPlayerCar = 0;

action PlayerCar
{	
	hPlayerCar = Entity_To_Pointer(my);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Soldier Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////
/*
var SolPathArray_x[15];
var SolPathArray_y[15];
var SolPathArray_z[15];
/*
//@ soldier path points.
action HSolPath
{
	my.invisible = on;
	my.passable = on;
	my.scale_x = 2;
	my.scale_y = 2;
	my.scale_z = 2;
	
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);	
	wait(3);
	
	SolPathArray_x[my.skill1] = my.x;
	SolPathArray_y[my.skill1] = my.y;
	SolPathArray_z[my.skill1] = my.z;
	
	remove(my);	
}

/* ------------------------------------------------------------------------------------------------- */

var FirA_Position[3];
var SecA_Position[3];
var ThuA_Position[3];
var FouA_Position[3];
var FifA_Position[3];
var iOfset = 0;

function NexttargetOffset(init,offs,pnum)
{
		if (init)
		{
				vec_set( temp, my.x);
				ent_waypoint( my._old_position_x, pnum);
		}else
		{
				vec_set( temp, my._old_position_x);
				ent_nextpoint( my._old_position_x);
	
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

function MoveTurnFallAnimAndTarget(MSForce,AnimForce)
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
	if (MSForce>5)
	{
		ent_cycle( AllAnimations[ my.AnimRun], my.FrameAnim);
	}else
	{
		ent_cycle( AllAnimations[ my.AnimWalk], my.FrameAnim);
	}
	return(0);

}

function StartRuning()
{
	var s = 1;
	vec_set( my._old_position_x, my._target_x);

	while (1)
	{

		MoveTurnFallAnimAndTarget( 20, 0.5);
		
		
		
		vec_set( point_move.x, my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{	

			NexttargetOffset( 0, my.flag8*100, 0);

			my.skill30+=1;

			if (my.flag7)
			{
				my.EnemyId = player.bodylnk;
				SolderShoting();
				return;
			}

			if (my.skill30 > my.skill40)
			{
				break;
			}
		}
		
		if ( EDistance( my ,player) < 600)
		{
			my.enemyid = player.bodylnk;
		        SolderShoting();
			return;
		}
		if (SoldCheckIfHealthy())
		{ 
			my.enemyid = player.bodylnk;
		        my.LastState = Function_To_Pointer("SolderShoting");
			return;
		}
		wait(1);
	}
		
	my.EnemyId = player.bodylnk;	
	PathToEnemy();
}

/* ------------------------------------------------------------------------------------------------- */

define __wait = 40;



var ik = 0;
//var testtt = 0;
function Run_fire()
{	
	//create(<arrow.mdl> , my.pos, null);
	//you.passable = 1;
	//you.scale_x = 10;
	//you.scale_y = 10;
	//you.scale_z = 10;
	//you.z += 1000;

	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = m16;	
	my.skill6 = 1;
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;	
	SolderCounter+=1;
	my.wieght = 50;
	wait(20);
	my.AnimWalk = IWalkFront ;
	my.AnimRun  = IRunFront  ;
	my.AnimShot = IUpSnipFire ;
	my.AnimDie =  0;	
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
	my.DieEvent = Function_To_Pointer("SolderDie");
	my.HitEvent =Function_To_Pointer("SolderHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");			
	my.skill30 = iOfset;
	my.skill40 = my.skill30 + 2;
	
	my.enemyid = Pointer_To_Entity( player.BodyLnk);
	wait(10);
	/*
	test_num1 += 1;
	testtt += 1;
	test_num6 += 1;	
	if (testtt == 1)
	{
		test_num2 =  my.skill7;
	}
	if (testtt == 2)
	{
		test_num3 =  my.skill7;
	}
	if (testtt == 3)
	{
		test_num4 =  my.skill7;
		testtt = 0;
	}
*/
	if (my.skill7 == 1)
	{
		ent_path("Axcel1Path");
		ent_waypoint(my._target_x,1);
		goto setp5;
	}
	if (my.skill7 == 2)
	{
		ent_path("Axcel2Path");
		ent_waypoint(my._target_x,1);
		goto setp5;
	}
	if (my.skill7 == 3)
	{
		ent_path("Axcel3Path");
		ent_waypoint(my._target_x,1);
		goto setp5;
	}
	if (my.skill7 == 4)
	{
		ent_path("Axcel4Path");
		ent_waypoint(my._target_x,1);
		goto setp5;
	}
	if (my.skill7 == 5)
	{
		ent_path("Axcel5Path");
		ent_waypoint(my._target_x,1);
	}
	setp5:
	

	var i = 0;
	while (hSolderPointer[i] != 0)
	{				
		i += 1;
		
		if (i>6)
		{ 
			removecoll(me);
			remove (me);
			return;
		}
	}
	my.LeaderId = i;
	hSolderPointer[ my.LeaderId] = Entity_To_Pointer(my);
	hAxcelNumber[ my.LeaderId] = my.skill7;

	StartRuning();
}

var idieddosomething = 0;

function SolderAhmDie()
{
idieddosomething = 0;
death_sound(100);
wait(1);
you = Pointer_To_Entity( my.EnemyId);
if (you)
{
	you.Enemy_Count -= 1;
}
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
  create( <point1.mdl>, my.pos, PickUpAmmo);
  my.skill1=0;
  while (my.skill1<20)
  {
	  my.skill1 += 0.3*speed/200;
  wait(1);
  }
wait(30);
 remove me;
}

function ShotOnAhmad(V1,v2)
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
		you = pointer_to_entity( my.enemyid);
		you._health -= (random( 1)+1)*level.y;
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
		while (Firewait<(Weap_fire_time[ my.WeaponNumber]*5))
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

function SoldAhmAttack()
{
  my._state = _state_attack;
  ShotOnAhmad(176,170);
	while (my._state == _state_attack)
	{
		you = Pointer_To_Entity( my.EnemyId);
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan = my_angle;

		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer("SoldAhmAttack");
			return;
		}
		wait(1);
	}
}

function walktoAhm()
{
  my._state = _state_walk;
  var walkspeed = 10;
	while (my._state == _state_walk)
	{
		if (hPlayerWins == 1)
		{my._health -=1000;
		}
		walkspeed = max( 5, walkspeed - 0.05);
		MoveTurnFallAnimAndTarget( walkspeed, 1);
		vec_set( point_move.x, my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{	
			ent_nextpoint(my._target_x);
			my.leaderid += 1;
			if (my.leaderid >= 2)
			{
				SoldAhmAttack();
				return;
			}
		}

		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer("walktoAhm");
			return;
		}
		wait(1);
	}
}

function KillAhmad()
{
	idieddosomething = entity_to_pointer( me);
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}

	my.VertexCount  = GetVertexNum(me)-20;
	my.WeaponNumber = s99sniper;

	my.passable    = 1;
	my.wieght      = 50;

	my.AnimWalk = IDuckWalk;
	my.AnimRun  = IRunFront;
	my.AnimShot = IDownSnipFire ;
	my.AnimDie  =  0;
	my.z       -= CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health   = 0;
	my.GotHit    = 0;
	my._type     = _type_soldier;
	my.leaderid  = 0;

	my.event        = solderevent;
	my.DieEvent     = Function_To_Pointer("SolderAhmDie");
	my.HitEvent     = Function_To_Pointer("SolderHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	
	my.enemyid      = AhmeedPointer;
	wait(1);

	ent_path("PathToAhmad");
	ent_waypoint(my._target_x,1);
	walktoAhm();
}

var LastEnemy;

function Rotate2Object()
{
me = 0;
while (1)
{
	you = pointer_to_entity( LastEnemy);
	if (you)
	{
		ObjecPos.frame = 1;
		temp.x = you.x - player.x;
		temp.y = you.y - player.y;
		temp.z = you.z - player.z;
		vec_to_angle( temp, temp);
		ObjecPos.roll = player.pan - temp.pan;
	}
	else
	{
		ObjecPos.frame = 2;
	}

	if (idieddosomething != 0)
	{
		you = pointer_to_entity( idieddosomething);
		ObjecPos1.frame = 1;
		temp.x = you.x - player.x;
		temp.y = you.y - player.y;
		temp.z = you.z - player.z;
		vec_to_angle( temp, temp);
		ObjecPos1.roll = player.pan - temp.pan;
	}
	else
	{
		ObjecPos1.frame = 2;
	}
wait(1);
}

}
/* ------------------------------------------------------------------------------------------------- */		

//@ responsible of creating the soldier form the axcles randomly.
function CreateRandomSold(iCounter)
{
	//@ skill7  --> 1 : Soldier in Axcel 1.		[Path: 0  ,1  ,2  ], Offset 0.
	//@	    --> 2 : Soldier in Axcel 2.		[Path: 3  ,4  ,5  ], Offset 3.			
	//@	    --> 3 : Soldier in Axcel 3.		[Path: 6  ,7  ,8  ], Offset 6.
	//@         --> 4 : Soldier in Axcel 4.		[Path: 9  ,10 ,11 ], Offset 9.
	//@	    --> 5 : Soldier in Axcel 5.		[Path: 12 ,13 ,14 ], Offset 12.
	me = 0;
	FlashEntity(Compass);

	AxcelEngaged += 1;
		
	//@ Acel 1
	if (iCounter == 0 )
	{
		iOfset = 0;		
		if (VerginAxcel[iCounter] == 0)
		{
			create(<vkm16.mdl>,FirA_Position,Run_fire);			
			you.skill7 = iCounter +1 ;
			hSoldierCount[iCounter] += 1;
			you.flag7 = 1;
			you.flag1 = 1;
			//wait(__wait /2);
		}
		else
		{
			VerginAxcel[iCounter] = 0;
		}

		if (int(random(2)) == 0)
		{
			create(<vkm16.mdl>,FirA_Position,Run_fire);
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;
			you.flag8 = 1;
			
			//wait(__wait);
			create(<vkm16.mdl>,FirA_Position,Run_fire);			
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;			
			hSoldierCount[iCounter] += 2;
								
		}
		else
		{
			create(<vkm16.mdl>,FirA_Position,Run_fire);
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;			
			hSoldierCount[iCounter] += 1;
		}
		//test_num5 = hSoldierCount[iCounter];
		LastEnemy = entity_to_pointer( you);
		return;
	}
	//@ Acel 2
	if (iCounter == 1)
	{		
//	nshowmessage("1");	
		iOfset = 3;		
		if (VerginAxcel[iCounter] == 0)
		{
			create(<vkm16.mdl>,SecA_Position,Run_fire);			
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;
			you.flag7 = 1;			
			hSoldierCount[iCounter] += 1;
			//wait(__wait /2);
		}
		else
		{
			VerginAxcel[iCounter] = 0;
		}

		if (int(random(2)) == 0)
		{
			create(<vkm16.mdl>,SecA_Position,Run_fire);
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;			
			you.flag8 = 1;
			//wait(__wait);
			create(<vkm16.mdl>,SecA_Position,Run_fire);
			you.skill7 = iCounter +1 ;
			hSoldierCount[iCounter] += 2;
		}
		else
		{
			create(<vkm16.mdl>,SecA_Position,Run_fire);
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;			
			hSoldierCount[iCounter] += 1;
		}
		//test_num5 = hSoldierCount[iCounter];
		LastEnemy = entity_to_pointer( you);
		return;
	}
			
	//@ Acel 3
	if (iCounter == 2 )
	{
//	nshowmessage("2");	
		iOfset = 6;
		create(<vkm16.mdl>,ThuA_Position,Run_fire);
		you.skill7 = iCounter +1 ;
		you.flag1 = 1;		
		you.enemyid = Pointer_To_Entity( player.BodyLnk);
		you.flag8 = 1;
		//wait(__wait);
		create(<vkm16.mdl>,ThuA_Position,Run_fire);
		you.skill7 = iCounter +1 ;
		you.flag1 = 1;		
		hSoldierCount[iCounter] = 2;
		//test_num5 = hSoldierCount[iCounter];
		LastEnemy = entity_to_pointer( you);
		return;
	}
	
	//@ Acel 4
	if (iCounter == 3 )
	{			
//	nshowmessage("3");	
		iOfset = 9;
		if (int(random(2)) == 0)
		{
			create(<vkm16.mdl>,FouA_Position,Run_fire);
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;			
			you.flag8 = 1;
			//wait(__wait);
			create(<vkm16.mdl>,FouA_Position,Run_fire);
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;
			
			hSoldierCount[iCounter] = 2;
		}
		else
		{
			create(<vkm16.mdl>,FouA_Position,Run_fire);
			you.skill7 = iCounter +1 ;
			you.flag1 = 1;			
			hSoldierCount[iCounter] = 1;
		}
		//test_num5 = hSoldierCount[iCounter];
		LastEnemy = entity_to_pointer( you);
		return;
	}
	
	//@ Acel 5
	if (iCounter == 4 )
	{					
//	nshowmessage("4");	
		iOfset = 12;
		if (int(random(2)) == 0)
		{						
			create(<vkm16.mdl>,FifA_Position,Run_fire);
			you.skill7 = iCounter[iCounter] +1 ;
			you.flag1 = 1;			
			you.flag8 = 1;
			//wait(__wait);
			create(<vkm16.mdl>,FifA_Position,Run_fire);
			you.skill7 = iCounter[iCounter] +1 ;
			you.flag1 = 1;			
			hSoldierCount[iCounter] = 2;
			
		}
		else
		{
			create(<vkm16.mdl>,FifA_Position,Run_fire);
			you.skill7 = iCounter[iCounter] +1 ;
			you.flag1 = 1;			
			hSoldierCount=1;
		}
		//test_num5 = hSoldierCount[iCounter];
		LastEnemy = entity_to_pointer( you);
		return;
	}				 			 	
}


/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

//@ this function store the location of the axcles.
action MySoldier
{
	//@ Skill7   1  -- 20  : Axcel 1.
	//@          21 -- 40  : Axcel 2.
	//@          41 -- 60  : Axcel 3.
	//@	     61 -- 80  : Axcel 4.
	//@	     81 -- 100 : Axcel 5.
	
	morph (<vkm16.mdl>,me);
	my.invisible = 1;
	my.passable = 1;
	
	sonar(my,10000);
	my.z -= result;
	wait(3);
	if (my.skill7 ==1)
	{
		vec_set(FirA_Position,my.pos);
		wait(1);
		remove(my);
		return;
	}
	if (my.skill7 ==2)
	{
		vec_set(SecA_Position,my.pos);
		wait(1);
		remove(my);
		return;
	}

	if (my.skill7 ==3)
	{
		vec_set(ThuA_Position,my.pos);
		wait(1);
		remove(my);
		return;
	}

	if (my.skill7 ==4)
	{
		vec_set(FouA_Position,my.pos);
		wait(1);
		remove(my);
		return;
	}
	if (my.skill7 ==5)
	{
		vec_set(FifA_Position,my.pos);
		wait(1);
		remove(my);
		return;
	}	
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				General Function
//
///////////////////////////////////////////////////////////////////////////////////////////////////

var GSoundPlaying = 0;
//var GHidPoint_x[10];
//var GHidPoint_y[10];
//var GHidPoint_z[10];

define __LostDest = 500;
define __ColisionDest = 100;
define __PlayPussGe = 60;
define __GeneralVolume = 800;


sound S_M_HM5_18, <M_HM5_18.wav>; //184
sound S_M_HM5_19, <M_HM5_19.wav>; //185
sound S_M_HM5_20, <M_HM5_20.wav>; //186
sound S_M_HM5_21, <M_HM5_21.wav>; //187
sound S_M_HM5_22, <M_HM5_22.wav>; //188
sound S_M_HM5_23, <M_HM5_23.wav>; //189
sound S_M_HM5_24, <M_HM5_24.wav>; //190
sound S_M_HM5_25, <M_HM5_25.wav>; //191


function GeneralEvent()
{	
	if (event_type == event_scan) && (indicator == _handle)
	{
		PlaGotTheGe = 1;
		my.flag5 = 1;
				
	}
	if (event_type == event_shoot) && (indicator == _gunfire)
	{ 
		my._health -= 50;
		stop_sound(GSoundPlaying);
		showmessage(1,184);
		play_entsound(my,S_M_HM5_18,__GeneralVolume);
		GSoundPlaying = result;
		
	}
	if (event_type == event_scan) && (indicator == _explode)
	{	
		my._health-=1000;
		
	}	
}

/* ------------------------------------------------------------------------------------------------- */

function GeneralDie()
{		
	GeneralAlife = 0;
	if (hPlayerWins == 1)
	{
		my.event = null;
		return;
	}
	stop_sound(GSoundPlaying);
	death_sound(100);		
	RemoveColl(me);
	my.skill1=0;
	
	while (my.skill1<100)
	{		
		if (my.flag2 == 1)
		{
			ent_frame("Dsur" ,my.skill1 );
		}
		else
		{
			ent_frame("head", my.skill1);
		}
		
		my.skill1 += 10*speed/200;
		wait(1);
	}
	
	showmessage(1,140);
	Play2DSound(1);
	while (snd_playing(2DSPlaying))
	{
		wait(1);
	}
	wait(3);
	zoomout();
	me = 0;
	play_sound( PlDed,100);
	h_PlDed = result;
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;	
}

/* ------------------------------------------------------------------------------------------------- */

function GoWithPlayer()
{	
	var iCounter = 0;

	stop_sound(GSoundPlaying);
	play_entsound(my,S_M_HM5_18,__GeneralVolume);
	showmessage(1,184);
	var s =0;
	my.AnimWalk = IWalkFront ;
	my.AnimRun  = IWalkFront  ;
	while (1)
	{		

		you =  Pointer_To_Entity(AhmeedPointer);
		vec_set( my._target_x, you.x);
		MoveTurnFallAnimAndTarget( 20, 0.5);
		
		you =  Pointer_To_Entity(AhmeedPointer);
		my.skill30 = edistance(my ,you);
		

=
		if (my.skill30 < __ColisionDest)
		{
			my.frameanim = 0;
			while (edistance(my ,you) < __ColisionDest*2)
			{
				my.frameanim +=10;
				ent_frame("DnSr" ,my.frameanim );
				
				if (my._health < 0)
				{
					GeneralDie();
					return;
				}

				wait(1);
			}
			my.frameanim = 100;
			while ( my.frameanim > 10)
			{
				my.frameanim -=10;
				ent_frame("DnSr" ,my.frameanim );
				
				if (my._health < 0)
				{
					GeneralDie();
					return;
				}

				wait(1);
			}
			iCounter=0;
		}
		
		

		if (my._health < 0)
		{
			GeneralDie();
			return;
		}

		
		wait(1);
	}
	
}

/* ------------------------------------------------------------------------------------------------- */

action haniSafari
{	
	you = Pointer_To_Entity(General);
	while (you.flag1 == 0)
	{
		wait(1);
	}

	my.FrameAnim = 0;
	while (my.FrameAnim < 100)
	{
		ent_frame("Shut" ,my.FrameAnim );
		my.FrameAnim += speed/25;		
		wait(1);
	}	
}

function GeneralWaiting()
{	
	my.flag1 = 0;
	while (my.flag1 == 0)
	{
		ent_frame("DnSr" ,80 );
		if (my._health < 0)
		{
			GeneralDie();
			return;
		}
		wait(1);
	}
	my.FrameAnim = 0;
	wait(10);
	while ( my.FrameAnim<200)
	{
		ent_cycle("BWsur" ,my.FrameAnim );
		my.FrameAnim += speed/25;
		temp.x = 1;
		temp.y = 0;
		temp.z = 0;
		vec_rotate( temp, my.pan);
		vec_add( my.x, temp);
		wait(1);
	}
	GoWithPlayer();
}

/* ------------------------------------------------------------------------------------------------- */

action TheGeneral
{	
	General = Entity_To_Pointer(my);
	
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	wait(random(10));
	my.VertexCount = GetVertexNum(me)-20;	
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 200;
	my.GotHit = 0;
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = _type_compars;
	my.event = GeneralEvent;		
	my.CollFunction = Function_To_Pointer("MallaCollision");		
	sonar(my,1000);
	my.z = target.z +abs(my.min_z);
	my.invisible = off;
	
	temp.x = 0;
	temp.y = 0;
	temp.z = my.max_z + 30;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);
	//create(<arrow.mdl>,temp,GeneralArrow);
	ent_frame("DnSr",80);
	GeneralWaiting();	
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Ahmed Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////

function ahmeddie()
{
	my = Pointer_To_Entity(AhmeedPointer);
	
	exclusive_entity;
	morph (<ahdie.mdl>,my); 
	my.FrameAnim = 0;
	while (my.FrameAnim < 100)
	{
		ent_frame("head" ,my.FrameAnim );
		my.FrameAnim += speed/30;
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */
/*
//@ path points used by ahmed, to get to the general.
action HPathPoints
{	
	//@  Skill1     0,1,2,3...   path point
	
	my.invisible = on;
	my.passable = on;
	my.scale_x = 2;
	my.scale_y = 2;
	my.scale_z = 2;

	wait(3);
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);	
	wait(3);
	
	GHidPoint_x[my.skill1] = my.x;
	GHidPoint_y[my.skill1] = my.y;
	GHidPoint_z[my.skill1] = my.z;
		
	remove(my);		
}

/* ------------------------------------------------------------------------------------------------- */


sound HLmgFiS,<lmgfire.wav>;
function AhmedGunFlash()
{			
	my.scale_x = 0.09;
	my.scale_y = 0.09;
	my.scale_z = 0.09;
	my.alpha = 50;
	wait (1);
	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */

function AhmedFlash()
{
	play_entsound( my ,HLmgFiS,500);
	Short_GunFlash(me,33, 51);	
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

/* ------------------------------------------------------------------------------------------------- */


function AhmadShot(RandDist)
{
	you = pointer_to_entity( my.enemyid);

	damage = Weap_damage[my.weaponnumber -1];    
	vec_set(FirstPoint , my.x);
	
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

	SecondPoint.x =  10000;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, FirstPoint);
	my.epassable = 1;
	gun_shot_Damge();
	my.epassable = 0;
}

function AMoveOnPath()
{
	
	var iCounter = 0;
	var bultnum = 0;
	
	my.flag5 = 0;	
	my.skill40 = 25;

	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.weaponnumber  = lmg;

	while (1)
	{				

					
		while (1)
		{
			//@ run code her
			
			MoveTurnFallAnimAndTarget( 20, 0.5);

			vec_set(point_move.x,my._target_x);
			if ( EDistance(point_move,me)< 50) 
			{
				break;
			}

			if (hPlayerWins == 2)
			{
				ahmeddie();
				return;
			}
			wait(1);
		}

		if (iCounter > 4)
		{
			ent_nextpoint(my._target_x);}
		else
		{
			ent_prevpoint(my._target_x);}
		
		if (iCounter == 3)
		{
			my.FrameAnim = 0;
			my.flag2 = 1;
			bultnum = 0;
			while (AxcelEngaged < 8)
			{
				if (my.flag2)
				{
					ent_cycle("6shot" ,my.FrameAnim );
					my.FrameAnim += speed/5;
					if (my.FrameAnim>100)
					{
						bultnum += 1;
						my.FrameAnim = 0;
						AhmedFlash();
					}
					if (bultnum > 30)
					{
						my.FrameAnim = 0;
						my.flag2 = 0;
					}
				}
				else
				{
					my.FrameAnim += 1;
					if (my.FrameAnim > 200)
					{
						my.flag2 = 1;
						my.FrameAnim =0;
					}
				}
				wait(1);
			}
		}

		if (iCounter == 5)
		{
			you = Pointer_To_Entity(General);
			you.flag1 = 1;
			my.skill40 = 35;
			wait(20);
		}
		
		if (my.flag5 == 1)
		{
			break;
		}
		bultnum = 0;
		var i = 0;
		my.FrameAnim = 0;
		while (bultnum< 30)
		{
			ent_cycle("6shot" ,my.FrameAnim );
			my.FrameAnim += speed/5;
			if (my.FrameAnim > 100)
			{
			 bultnum += 1;
			 my.FrameAnim = 0;
			 AhmedFlash();
				if (iCounter == 0)
				{
				 my.enemyid = 0;
				 while (i < 7)
				 {
					if (hSolderPointer[i] != 0)
					{
						my.enemyid = hSolderPointer[i];	
						break;
					}
					i += 1;
				 }
				 if (my.enemyid)
				 {
					AhmadShot(50);
				 }
				}
			}
			wait(1);
		}
		iCounter +=1;
		

		if (iCounter > 9)
		{
			my.flag5 = 1;
			iCounter = 0;
		}
		
		
		wait(1);
	}

	my.FrameAnim = 0;
	while (1)
	{		
		ent_cycle("1run" ,my.FrameAnim);
		my.FrameAnim += speed/25;
				
		you = Pointer_To_Entity(hPlayerCar);
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle.pan;

		temp.x = speed/my.skill40;
		temp.y =0;
		temp.z = 0;
		move(my ,temp ,nullskill);
		sonar(my,500);
		my.z = target.z +abs(my.min_z);
		
		you = Pointer_To_Entity(hPlayerCar);
		if (edistance(my ,you ) < 80)
		{
			break;
		}
		if (hPlayerWins == 2)
		{
			ahmeddie();
			return;
		}
		wait(1);
	}

	DontHeartPlayer = 1;
	ent_frame("stnd" ,0 );
	if (GeneralAlife == 1)
	{
		hPlayerWins = 1;
		showmessage(1,174);
		Play3Dsound(2);

		while (snd_playing(3DSPlaying))
		{
			wait(1);
		}
		//Fade2black( 1, 1, Function_To_Pointer( "finalization"));
		
		
		
		var i= 0;
		while (i <7)
		{
			you = Pointer_To_Entity(hSolderPointer[i]);
			if (you != null)
			{
				removecoll(you);
				remove(you);
			}
			i += 1;
			wait(1);
		}
		
		VictoryScream();
		VictoryCamera();
		CloseSong(CurrentSong);
		play_loop(VictoryPlayer, 100);
		h_VictoryPlayer = result;
	}
//	else
//	{
//		showmessage(1,140);
//		Play2DSound(1);
//		while (snd_playing(2DSPlaying))
//		{
//			wait(1);
//		}
//		wait(3);
//		zoomout();
//		play_sound( PlDed,100);
//		h_PlDed = result;
//		me = 0;
//		VisMainMenu(1);
//		MBackMenu.visible = 0;
//		on_esc = 0;
//		on_enter = LLoadLastSave;		
//	}		
}

/* ------------------------------------------------------------------------------------------------- */

action AhmedCom
{
	AhmeedPointer = Entity_To_Pointer(my);
	
	wait(20);
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	wait(random(10));
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;	
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 0;
	my._type = _type_player1;
	my.CollFunction = Function_To_Pointer("ComparsCollision");
	
	ent_frame("stnd" ,0 );
	sonar(my,1000);
	my.z = target.z +abs(my.min_z);
	
	while (LetTheGameBegin == 0)
	{
		wait(1);
	}
	
	myShowmessions();
	wait(5);
	showmessage(1,164);
	Play3Dsound(1);
	while (snd_playing(3DSPlaying))
	{
		wait(1);
	}
	
	ent_path("AhmedPath");
	ent_waypoint(my._target_x,1);
	AMoveOnPath();
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				player fucntions 
//
///////////////////////////////////////////////////////////////////////////////////////////////////

action FollowPlayer
{		
	wait(1);
	remove(my);
	return;	
}

/* ------------------------------------------------------------------------------------------------- */

define __POutOfRange = 700;
define __PTooOutOfRange = 900;

action CheckPlayerpos()
{
	my.flag7 = 1;
	my.skill30 = 0;
	while (player == null)
	{
		wait(1);
	}
	wait(30);
	Rotate2Object();
	CreateRandomSold(0);

	my.skill25 = 500;
	while (1)
	{		
		if ( idieddosomething == 0)
		{
			if (hPlayerWins == 1)
			{break;
			}
			idieddosomething.y += 1;
			if (level.y==1)&&(idieddosomething.y>2000)
			{
				idieddosomething.y = 0;
				create( <vksnp.mdl>, SecA_Position, KillAhmad);		
			}
			idieddosomething.y += 1;
			if (level.y==2)&&(idieddosomething.y>1000)
			{
				idieddosomething.y = 0;
				create( <vksnp.mdl>, SecA_Position, KillAhmad);		
			}
			idieddosomething.y += 1;
			if (level.y==3)&&(idieddosomething.y>100)
			{
				idieddosomething.y = 0;
				create( <vksnp.mdl>, SecA_Position, KillAhmad);		
			}
		}else
		{
			idieddosomething.y = 0;
		}
		/*if (hPlayerWins != 0)
		{
			exclusive_entity;
			break;
		}*/
				
		if (vec_dist(my.pos ,player.pos ) > __POutOfRange)
		{			
			my.skill25 +=1;
			if (my.skill25 > 200)
			{
				my.skill25 = 0;				
				if (int(random(2)) == 0)
				{
					showmessage(1,165);
					Play2DSound(2);
				}
				else
				{
					showmessage(1,166);
					Play2DSound(3);
				}
			}
		}
		else
		{
			my.skill25 = 200;
		}

		you = Pointer_To_Entity(AhmeedPointer);
		if (vec_dist(my.pos ,player.pos ) >__PTooOutOfRange)||( you._health<-200 )
		{						
			hPlayerWins = 2;

			showmessage(1,172);
			Play2DSound(5);

			
			you = my;
			my = Pointer_To_Entity(AhmeedPointer);
	
			exclusive_entity;
			morph (<ahdie.mdl>,my); 
			my.FrameAnim = 0;
			while (my.FrameAnim < 100)
			{
				ent_frame("head" ,my.FrameAnim );
				my.FrameAnim += speed/30;
				wait(1);
			}
			my = you;
			ZoomOut();
			play_sound( PlDed,100);
			h_PlDed = result;
			me = 0;
			VisMainMenu(1);
			MBackMenu.visible = 0;
			on_esc = 0;
			on_enter = LLoadLastSave;
			return;
		}
		wait(1);
	}	
}
