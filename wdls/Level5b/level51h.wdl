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
	type = <PressMsg.tga>;
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
	type = <Lev5ALoad1.bmp>;
	view = camera;
	flags = visible;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = 0;

	layer = 4;
}

string hintsc,<Lev5HintA.bmp>;

path <music>;
path <sounds>;
path <weapons>;
string level_str = <level51h.WMB>; // give file names in angular brackets

var ahSoldPointer[12];
var ahSoldSkill[12];

include <definations.wdl>;
include <variabls.wdl>;
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
include <inpot.wdl>;
include <cars.wdl>;
include <Compars.wdl>;
include <tplayer.wdl>;
include <initiazation.wdl>;
include <equipments.wdl>;

include <SolderFx.wdl>;
include <SolderActS.wdl>;
//include <Solders.wdl>;
include <SolderLeader.wdl>;
include <rain.wdl>;

var video_mode = 7;
var video_depth = 16;


function main()
{
	str_cpy(levelpath,"level5pa.pts");
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;

	play_sound(sStartSound,100);
	StartSoundH = result;

	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
	level.z=1;
	initilization();

	camera.fog = 5;
	ObjecPos1.visible = 0;
	MisionsMsg1.visible = 1;			
	totalbullets[6] = 400;
	totalbullets[13] = 400;
	Beeping();

	wait(50);
	if (level.y == 3)
	{
	MovieOrSucess = 1;
	}
}



function NewlevelOrloaded()
{
	//PlayloopSound(-1);
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

var General = 0;
var MariamP = 0;
var PlayerGotGeneral = 0;

//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Comon Functons
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

function RemoveDrivSold(iGroupNumber)
{
	var i ;
	while (i < 12)
	{
		if (ahSoldSkill[i] == iGroupNumber)
		{
			you = Pointer_to_Entity(ahSoldPointer[i]);
			if (you != null)
			{
				you._health = -1000;
			}
			
		}
		i += 1;
		wait(1);
	}
	
}

/* --------------------------------------------------------------------------------------------- */

var pPlayerCar = 0;

/* --------------------------------------------------------------------------------------------- */

function hideAllGui_2()
{
	ZoomOut();
	ObjecPos.visible = 0;	
	outcompass.visible = 0;
	EnemyPos.visible = 0;
	Compass.visible = 0;
	HldBk.visible = 0;
	HldSld.visible = 0;
	ObjecPos1.visible = 0;		
	VWeaponSprite1.visible = 0;
	looprun=0;
	CPointer.visible = 0;
	mesges.visible = 0;
	WeaponStore.visible = 0;
	DWeaponStore.visible = 0;
	WeaponPan.visible = 0;
	WeaponPan2.visible = 0;
	//object1.visible = 0;
	//object2.visible = 0;

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
	hideAllGui_2();
}

function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}

function SetFinalCamera()
{
	//you = pointer_to_entity(pPlayerCar);
	var cc;
	cc = camera.z;
	camra2player = 0;
	while (1)
	{
		you = pointer_to_entity(pPlayerCar);
		camera.pan = you.pan;
		camera.tilt = 0;
		camera.roll = 0;
		temp.x = 0;
		temp.y = 0;
		temp.z = cc;
		vec_add(temp,you.pos);
		vec_set(camera.pos,temp);
		wait(1);
	}
}

function VictoryCamera()
{
	SetFinalCamera();
	ZoomOut();
	hideAllGui();
	MovieOrSucess = 1;
	PlayloopSound(-1);
	RemoveAllKeys();
	on_enter = finalization;
	PreesNextLvl.visible = 1;
	wait(10);
	Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));
}

/* --------------------------------------------------------------------------------------------- */

function hMisionfail()
{	
	messionfailed = 1;
	wait(10);
	
	ZoomOut();

	play_sound( PlDed,100);	
	h_PlDed = result;
	
	me = 0;
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;

}

/* --------------------------------------------------------------------------------------------- */

sound S_M_L5_01 , <M_L5_01.wav>;
sound S_M_L5_02 , <M_L5_02.wav>;
sound S_M_L5_03 , <M_L5_03.wav>;
sound S_M_L5_04 , <M_L5_04.wav>;
sound S_M_L5_05 , <M_L5_05.wav>;
sound S_M_L5_06 , <M_L5_06.wav>;
sound S_M_L5_07 , <M_L5_07.wav>;
sound S_M_L5_08 , <M_L5_08.wav>;
sound S_M_L5_09 , <M_L5_09.wav>;
sound S_M_L5_11 , <M_L5_11.wav>;
sound S_M_L5_12 , <M_L5_12.wav>;
sound S_M_L5_13 , <M_L5_13.wav>;
sound S_M_L5_14 , <M_L5_14.wav>;
sound S_M_L5_15 , <M_L5_15.wav>;
sound S_M_L5_16 , <M_L5_16.wav>;
sound S_M_L5_17 , <M_L5_17.wav>;
sound S_M_L5_19 , <M_L5_19.wav>;
sound S_M_L5_20 , <M_L5_20.wav>;
sound S_M_L5_21 , <M_L5_21.wav>;
sound S_M_L5_22 , <M_L5_22.wav>;

sound S_M_L5a_27 , <M_L5a_27.wav>;
sound S_M_L5a_31 , <M_L5a_31.wav>;
sound S_M_L5a_04 , <M_L5a_04.wav>;
sound S_M_L5a_09 , <M_L5a_09.wav>;
sound S_MandASound , <MandASound.wav>;
function Play2DSound(iNumber)
{
	stop_sound(2DSPlaying);
	
	if (iNumber == 1)
	{
		play_sound(S_M_L5_12,100);
		2DSPlaying = result;
		return;
	}
	if (iNumber == 2)
	{
		play_sound(S_M_L5_13,100);
		2DSPlaying = result;
		return;
	}
	if (iNumber == 3)
	{
		play_sound(S_M_L5_11,100);
		2DSPlaying = result;
		return;
	}
	
	if (iNumber == 4)
	{
		play_sound(S_M_L5_15,100);
		2DSPlaying = result;
		return;
	}
	/*
	if (iNumber == 5)
	{
		play_sound(S_M_L5_11,100);
		2DSPlaying = result;
		return;
	}
	*/
}

/* --------------------------------------------------------------------------------------------- */

define __MarVolume = 600;
function Play3Dsound(iNumber)
{
	stop_sound(3DSPlaying);
	if (iNumber == 1)
	{
		play_entsound(my,S_M_l5_09,__MarVolume);
		3DSPlaying = result;
	}
	/*
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
	}
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
	}
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
	}
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
	}
	if (iNumber == 1)
	{
		play_entsound(my,,__MarVolume);
		3DSPlaying = result;
	}
	*/
}

/* --------------------------------------------------------------------------------------------- */

action HHealth
{
	sonar(me,4000);
	my.z -= result;
	
	my.invisible = 1;
	while (DrivingGame == 0)
	{
		wait(1);
	}
	my.invisible = 0;

	while (player == null)
	{
		wait(1);
	}
	
	while (1)
	{
		if (vec_dist(my.pos ,player.pos) < 200)
		{
			entiy =  Pointer_To_Entity( player.BodyLnk);
			if(entiy._health==0) { return; }
			entiy._health = min( 0, entiy._health + 25);
			HldSld.u =max(entiy._health*16/25,-64);
			play_sound(GetMedik, 100);
			wait(1);
			msggdd( 47+doubleuzi+1);
			break;
			
		}

		if (level.y == 3)
		{
			remove(my);
			return;
		}
		if (level.y == 2)
		{
			if (my.skill20 == 1)
			{
				remove(me);
				return;
			}
		}	
		//if (my.skill7 == 0)
		//{
		//	my.scale_x=2.5;
		//	my.scale_y=2.5;
		//	my.scale_z=2.5;
	//		my.skill7 = 1;
	//	}
	//	else
	//	{
	//		my.scale_x=2;
	//		my.scale_y=2;
	//		my.scale_z=2;
	//		my.skill7 = 0;
	//	}
		wait(1);
	}

	remove(me);
}


sound CarStart1 , <CarStart1.wav>;
sound Playerbreak,<Playerbreak.wav>;

//@ the main function of the player car in the second part of the game.
/* --------------------------------------------------------------------------------------------- */

sound nissan_dirt,<nissan_dirt.wav>;
sound nissanG ,<nissan.wav>;
sound nissan_loop, <nissan_loop.wav>;

sound caracc1,<carcrash.wav>;
sound caracc2,<carcrash2.wav>;

sound CDirec1,<skid01.wav>;
sound CDirec2,<skid02.wav>;
sound CDirec3,<skid03.wav>;


function CameraExplosionMove()
{
	var Myflh=0;
	var Myflhk=0;

	while (Myflhk<10)
	{
		Myflhk +=1;
		Myflh    = abs(Myflh -1);
		camera.roll+= cos(Myflh *180)*1.5;
		wait(1);
	}
	camera.roll = 0;
}


function CarFixedEvent()
{
 if (event_type  == event_entity)&&(indicator == CarAccedant)
 {
if (random(10)>5)
{
	play_entsound( me, caracc1, 10000);
}else
{
	play_entsound( me, caracc2, 10000);
}
	CameraExplosionMove();
	var Newtargetx = target.x;
	var Newtargety = target.y;
	var Newtargetz = target.z;

	var youx = you.x;
	var youy = you.y;
	var youz = you.z;
	var ggg = 0;

	ggg = abs(you.CarForce)*you.wieght;
	you.CarForce = -you.CarForce*0.5;
	my.epassable = 1;
	 while (ggg>0)
	 {
		temp.x = Newtargetx - youx;
		temp.y = Newtargety - youy;
		temp.z = Newtargetz - youz;
		vec_to_angle( my_angle, temp);
		my_angle.pan -= my.pan;
		my_angle.tilt = 0;
		temp.x = abs(ggg)/my.wieght;
		temp.y = 0;
		temp.z = 0;
		vec_rotate( temp, my_angle);
		sonar me ,4000;
		temp.z-= maxminnum( 10 ,result);
		move( my, temp, nullskill);
		ggg = nearnumber( ggg, 0, my.wieght); 
		temp.x = my.x - Newtargetx;
		temp.y = my.y - Newtargety;
		temp.z = my.z - Newtargetz;
		vec_to_angle( my_angle, temp);
		my.pan = nearangle( ang(my.pan), ang(my_angle), 1);

	 wait(1);
	 } 
 	my.epassable = 0;
}
}

action ExplodedThing
{

	CameraMoveExplo();
	my.CollFunction  = Function_To_Pointer("ComparsCollision");
	my.OwnType = TypeOfEngines;
	my.epassable = 0;
	my.passable = 0;

	my.wieght = 150;
	my.event = CarFixedEvent;
	my.skill6= 0;
	while (my.skill6<100)
	{
	 temp.x = 0;
	 temp.y = 0;
	 temp.z = 0;
	 my_angle.x = 50-random(100);
	 my_angle.y = 50-random(100);
	 my_angle.z = -random(25);
	 vec_add( my_angle, my.pos);
	 effect( Blacksmokeup, 1, my_angle, temp);	
	 my.skill6+= 1;
	 wait(4);
	}
}


action Moving_Car
{
	wait(10);
//	my.passable = 1;
	my.OwnType = TypeOfCars;
	my.CarBlend = 0;

	my.max_x *= 2.2;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	AddColl(me);
	my.wieght = 50;
	my.event = CarFixedEvent;
	while (1)
	{
	if (Camra2Player==0){
		TPsCamera(me);}

		my.CarForce = nearnumber(max(min( my.CarForce +key_force.y*10,90),-100),0,2.5);
		my.unlit =TestACollsion( my);

		temp.x = my.CarForce ;
		temp.y = 0;
		result = NSonar(me);
		temp.z = -result;

		move( me, temp, nullskill);
		my.pan = nearangle( my.pan , my.pan-key_force.x, 1);
		my.MyTilt += key_pgup - key_pgdn;
	wait(1);
	}

}
/*************************************************************************************************
**************************************************************************************************

				Game Part 2

**************************************************************************************************
**************************************************************************************************/

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Cars Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////
/*
var hCarArray_x[30];
var hCarArray_y[30];
var hCarArray_z[30];

//@ main function of the cars path points
action aCarPath
{
	//@ 28 , 29 for the humer3
	my.invisible = on;
	my.passable = on;
	my.scale_x = 2;
	my.scale_y = 2;
	my.scale_z = 2;

	wait(3);
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);	

	wait(3);
	
	hCarArray_x[my.skill1] = my.x;
	hCarArray_y[my.skill1] = my.y;
	hCarArray_z[my.skill1] = my.z;
		
	remove(my);	
}

/* --------------------------------------------------------------------------------------------- */

var DirveGArray[10]  = 0,0,0,0,0,0,0,0,0,0; //@ This Arry Control the driving part soldiers,there appear time
var HummersArray[10] = 0,0,0,0,0,0,0,0,0,0; //@ like the previous arry, but control the humers
					    //@    0: wait.
					    //@    1: GoGoGo.
					    //@    2: I Exploded.

define __HamerWait = 0;
define __HamerGoGoGo = 1;
define __HamerExploded = 2;

define _CarNumber    , skill1 ;
define _PointNumber , skill30;
define _MySoldier   , skill6;

function PlayCDirect(id,vol)
{
id = int( id);
if (id==0)
{
	play_sound( CDirec1, vol);
	return;
}

if (id==1)
{
	play_sound( CDirec2, vol);
	return;
}

play_sound( CDirec3, vol);

}

function PlayloopSound(Id)
{

	if (hPlayerWins == 2)
	{
		stop_sound(hCarSound);
		return;
	}
	if (hCarSound.y != id)
	{	
		stop_sound(hCarSound);
		hCarSound.y = id;
	}
	if (Id == 5)
	{
		
		if(snd_playing(hCarSound)){return;}
		play_sound(nissan_dirt,40);
		hCarSound = result;
		return;
	}
	
	if (Id == 6)
	{
		
		if(snd_playing(hCarSound)){return;}
		play_sound(nissanG,40);
		hCarSound = result;
		return;
	}
	if (Id == 7)
	{
		
		if(snd_playing(hCarSound)){return;}
		play_sound(nissan_loop,40);
		hCarSound = result;
		return;
	}
	stop_sound(WindowWeSou);
}

function PCarSound(Id)
{
	
	if (hCarSound.y != id)
	{	
		stop_sound(hCarSound);
		hCarSound.y = id;
	}
	if (Id == 1)// key on
	{
		play_sound(CarStart1,100);
		hCarSound = result;
		return;
	}
	if (Id == 3) // stop sound
	{		
		//stop_sound(hCarSound.y);
		play_sound(Playerbreak,100);
		hCarSound = result;
		return;
	}
	
	
}

/* --------------------------------------------------------------------------------------------- */

var lastcar;


function settempyou(cyou)
{
	you = cyou;
	vec_to_angle( my_angle, temp);
	temp.x = vec_length(temp);
	temp.y = 0;
	temp.z = 0;
	my_angle.pan += you.pan;
	vec_rotate( temp, my_angle);
	vec_add( temp, you.x);
}

function lnkplayertome()
{
		temp.x = 0;
		temp.y = 0;
		temp.z = 30 ;
		//vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);		
		vec_set(player.pos,temp);
		you = Pointer_To_Entity(player.BodyLnk);
		vec_set(you.pos,temp);		
}
define __SoundVol = 100;
function CarDriving()
{
	ent_path("PlyaerCarP");
	ent_waypoint(my._target_x,1);
	var s = 1;
	var s1 = 1;
	MisionsMsg2.ambient = -100;
	MisionsMsg3.visible = 1;			
	myShowmessions();
	while (player == null)
	{
		wait(1);
	}
	
	my.passable = 1;
	my.OwnType  = TypeOfEngines;
	my.max_x *= 2.2;
	my.max_z *= 0.5;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.CollFunction  = Function_To_Pointer("ComparsCollision");
	my.wieght = 200;
	my.event  = CarFixedEvent;

	//@ skills and flags used.	
	my.skill20 = 0;
	my.skill21 = 0; //@ used in car shake.
	my.skill22 = 0; //@ used in car shake.
	my.skill26 = 10; //@ Control the speed of the car
	my._PointNumber = 0; //@ point counter

	my.flag2 = 0; //@ Signal The Car To Start Shaking or to Stop it.	
	my.flag5 = 0; //@ Car SlowDown.
	my.flag6 = 0; //@ Car SpeedUp.
	my.flag8 = 0; //@ A Switch used in car movements.
	
	
	PCarSound(1);	
	while (snd_playing(hCarSound))
	{
		lnkplayertome();
		wait(1);
	}

	while (1)
	{
		if (my._PointNumber >= 1)&&(my._PointNumber < 4)
		{ 
			PlayloopSound(5);
		}
		else
		{
			if ( my.flag5 != 1)
			{
				PlayloopSound(6);
			}
			
		}
		//dustmerain();		
		if (hPlayerWins == 1)
		{
			break;
		}
		if (hPlayerWins == 2)
		{
			return;
		}
		
		//@ Car SlowDown.
		if (my.flag5)
		{
			if (s == 1)
			{
				PCarSound(3);
				s = 0;
			}
			//PCarSound(2);
			my.skill26 += 10;
			hCameraTilt -= 10;
			if (my.skill26 > 150)
			{				
				s = 1;
				my.flag5 = 0;
				hCameraTilt = 0;
				if (my._PointNumber == 5)
				{
					while (HummersArray[0] != 2)
					{
							//@ Puts The Player On Top of the car.
						lnkplayertome();
						TestACollsion( my);
						PlayloopSound(7);
						wait(1);
					}
					
				}
				
				if (my._PointNumber == 17)
				{
					while (HummersArray[2] != 2)
					{
						//@ Puts The Player On Top of the car.
						lnkplayertome();
						PlayloopSound(7);
						TestACollsion( my);
						wait(1);
					}
					
				}
								
				my.skill26 = 1000;
				my.flag6 = 1;
			}
		}
		
		//@ Car SpeedUp.
		if (my.flag6)
		{
			if (s1 == 1)
			{
				PCarSound(2);
				s1 = 0;
			}
			my.skill26 -=30;
			if (my.skill26 < 10)
			{
				s1 = 1;
				my.flag6 = 0;
				my.skill26 = 10;
				
			}
		}
		
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;			
		vec_to_angle(my_angle,temp);
		temp2.x = my.pan;
		my.pan = nearangle(my.pan,my_angle,5*(speed/200));
			player.pan += my.pan - temp2.x;
		my.skill20 = my.z;
		
		my.CarForce = nearnumber(my.CarForce,speed/my.skill26,1);
		temp.x = my.CarForce;
		temp.y = 0;
		sonar(my,500);
		temp.z = -result;
		move(my ,temp ,nullvector );
		my.skill21 = my.skill20 - my.z;
		TestACollsion( my);
				
		//@ [ my.skill21  > 0 ] car moved down.
		//@ [ my.skill21  < 0 ] car moved up.
		if (abs(my.skill21) > 0) && (abs(my.skill21) < 3)
		{
			hCameraTilt = 0;
		}
		else
		{
			hCameraTilt = my.skill21;// * 200 ;
		}
				
		
		//@ Puts The Player On Top of the car.
		lnkplayertome();
		
		
	
		
		if (my.flag2)		
		{
			if (my.flag8)
			{				
				hCamVar = 0.5;				
				my.flag8 = 0;
			}
			else
			{			
				
				hCamVar = -0.5; 				
				my.flag8 = 1;
			}
		}
		
			
		
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ \\
		//		Checking The Points
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ \\
		
		
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{
			ent_nextpoint(my._target_x);
			my._PointNumber+=1;			

			if (my._PointNumber == 1)
			{		
				DirveGArray[0] = 1;
				
				my.flag8 = 1;
				my.flag2 = 1;
				goto end3;
			}

			if (my._PointNumber == 2)
			{
				goto end3;
				
			}

			if (my._PointNumber == 3)
			{
				HummersArray[0] = 1;
				DirveGArray[1] = 1;
				play_sound(S_M_L5_03,__SoundVol); 
				showmessage(1,133);
				
				goto end3;
				
			}
						
			if (my._PointNumber == 4)
			{
				my.flag2 =0;
				
				my.roll -= 7;						
				my.tilt += 18;			
				my._PointNumber = 0;
				while (my._PointNumber < 14)
				{
					my._PointNumber += 1;
										
					temp.x = my._target_x - my.x;
					temp.y = my._target_y - my.y;
					temp.z = my._target_z - my.z;
					
					vec_to_angle(my_angle,temp);
					temp2.x = my.pan;
					my.pan = nearangle(my.pan,my_angle,5*(speed/200));
						player.pan += my.pan - temp2.x;
					temp.x = speed/15;
					temp.y = 0;
					temp.z = 0;
					move(my ,temp ,nullvector );
					
					lnkplayertome();

					if (my._PointNumber > 9)
					{
						my.roll = 0;
						my.tilt = 10;
					}
					wait(1);
				}
				my._PointNumber = 4;									
				my.tilt = 0;
			
				RemoveDrivSold(1);
				goto end3;	
				
			}
			temp.x = my._target_x - my.x;
			temp.y = my._target_y - my.y;
			temp.z = 0;
			vec_to_angle(my_angle,temp);
			if (abs(ang(my.pan-my_angle))>45)
			{
				PlayCDirect( random(3), 100);
			}

			if (my._PointNumber == 5)
			{				
				if (HummersArray[0] != 2)
				{
					my.flag5 = 1;
				}								
				goto end3;
			}
			if (my._PointNumber == 6)
			{
				play_sound(S_M_L5a_09,__SoundVol);
				showmessage(1,158);
			}

			if (my._PointNumber == 7)
			{				
				HummersArray[1] = 1;
				DirveGArray[2] = 1;
				DirveGArray[3] = 1;
				goto end3;
			}
			
			if (my._PointNumber == 9)
			{
				play_sound(S_M_L5_05,__SoundVol);
				showmessage(1,135);
				goto end3;
			}
			if (my._PointNumber == 10)
			{
				DirveGArray[4] = 1;
				HummersArray[2] = 1;
				RemoveDrivSold(2);				
				goto end3;
			}
												
			if (my._PointNumber == 13 )
			{
				RemoveDrivSold(3);
				DirveGArray[5] = 1;
				goto end3;
			}

			if (my._PointNumber == 15)
			{
				play_sound(S_M_L5_07,__SoundVol);
				showmessage(1,137);
				goto end3;
			}
			if (my._PointNumber == 15)
			{
				RemoveDrivSold(4);
				RemoveDrivSold(5);								
				goto end3;
			}

			if (my._PointNumber == 17 )
			{
				if (HummersArray[2] != 2)
				{
					my.flag5 = 1;
				}
				temp.x = -4893.527;
				temp.y = 1005.426;
				temp.z = 1000;
				create( <vkm16.mdl>, temp, FlayAbleSoldier);
				play_sound(S_M_L5_04,__SoundVol);
				showmessage(1,134);
				goto end3;
			}
			
			if (my._PointNumber == 20)
			{
				HummersArray[5] = 1;
				goto end3;
			}
			
			if (my._PointNumber == 23)
			{
				RemoveDrivSold(6);
				HummersArray[4] = 1;
				play_sound(S_M_L5_12,__SoundVol);
				showmessage(1,141);
			}
			
			end3:
			if (my._PointNumber > 24)
			{
				my._PointNumber = 0;
				//break;
			}
		}

	wait(1);
	}
	ent_path("DrivCar");
	my._PointNumber = 2;
	ent_waypoint( temp, my._PointNumber);
	settempyou(Pointer_To_Entity(lastcar));
	vec_set( my._target_x, temp);

	while (1)
	{
		PlayloopSound(6);
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = 0;
		vec_to_angle(my_angle,temp);
		temp2.x = my.pan;
		my.pan = nearangle(my.pan,my_angle,my.CarForce*(speed/200));
			player.pan += my.pan - temp2.x;
		my.CarForce = nearnumber(my.CarForce,20,1);
		temp.x = min( vec_length( temp), my.CarForce);
		temp.y = 0;
		sonar(my,500);
		temp.z = -result;
		move(my ,temp ,nullvector );

		lnkplayertome();
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{
			my._PointNumber += 1;
			ent_waypoint( temp, my._PointNumber);
			settempyou(Pointer_To_Entity(lastcar));
			vec_set( my._target_x, temp);
			if (my._PointNumber >25){
				break;
			}
			if (my._PointNumber >5){
				my._PointNumber = 24;
				ent_path("PlyaerCarP");
				ent_waypoint(my._target_x,my._PointNumber);
			}


			temp.x = my._target_x - my.x;
			temp.y = my._target_y - my.y;
			temp.z = 0;
			vec_to_angle(my_angle,temp);
			if (abs(ang(my.pan-my_angle))>45)
			{
				PlayCDirect( random(3), 100);
			}


			}
		
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------- */

function OrdCarExplosion()
{
	exclusive_entity;
	//@ Create The Explosion		
	//create(<Hala.MDL>,my.pos,Smk_Fire_Parts_Expolsion);moa
	if (my._carnumber != 50)
	{
		HummersArray[my.skill1 - 1] = 2;	
	}
	

	if (my.skill2 == 2)
	{
		morph(<exlandrover.mdl>,me);
	}
	else
	{
		morph(<exhummer.mdl>,me);
	}

	ExplodedThing();
	create( <dust.mdl>, my.pos, atomicexplosion);	
	create(<exwhell.mdl>,my.pos,FlyingPart);
	
	//@ The Last Hummer		
	if (my._CarNumber == 5)
	{
		var res = 0;
		lastcar = entity_to_pointer(my);
		PlayloopSound(-1);
		if (hPlayerWins == 2)
		{
						
			play_sound(S_M_L5a_04 , 100);
			res = result;
			showmessage(1,153);
			while (snd_playing(res))
			{
				wait(1);
			}
			hMisionfail();
			wait(5);
			return;
		}
		else
		{	
			hPlayerWins = 1;
			wait(10);
			play_sound(s_MandASound,100);
			res = result;
			showmessage(1,176);
			
			showmessage(10,178);
			VictoryScream();
			VictoryCamera();
			while (snd_playing(res))
			{
				wait(1);
			}
			
			wait(20);
			play_loop(VictoryPlayer, 100);
			h_VictoryPlayer  = result ;
			//return;
		}				
	}
}
/* --------------------------------------------------------------------------------------- */

function HufSoldDie2()
{	
	exclusive_entity;				
	death_sound(100);
	wait(1);
	my._state = _state_die;
	RemoveColl(me);
	my.skill1=0;
	while (my.skill1 < 80)
	{
		ent_frame("down" ,my.skill1);
		my.skill1 += speed/ 25;
		wait(1);
	}					
	
	
	//@ signal the car to create new soldier.
	wait(150 + random(50));					
	you = Pointer_To_Entity(my._PointNumber);
	if (you != null)
	{
		you.flag1 = 1;
		you.flag2 = 1;
	}
	
	remove(my);
}

function FarEscape()
{
	var pathfound = 0;
	var bltnumbers=0;
	my._state = _state_escape;
	vec_set( my._target_x, my.x);

	you = Pointer_To_Entity( my.EnemyId);
	temp.x = my.x - you.x;
	temp.y = my.y - you.y;
	temp.z = my.z - you.z;
	vec_to_angle( my_angle, temp);

	temp.x     = 0;        
	temp.y     = 360;      
	my_angle.x = 1000;
	my_angle.y = 100;  
	my_angle.z = 0;    
	/*temp.x = my_angle;
	temp.y = 180;
	my_angle.x = 10000;
	my_angle.y = 50;
	my_angle.z = 0;*/
	pathfound = spot3_point(0);

	while ( my._state == _state_escape)
	{
		if (my.GotHit == 1000)
		{
			 return;
		}

		if (SoldCheckIfHealthy())
		{
		 my.LastState = Function_To_Pointer( "FarEscape");
		 return;
		}

		you = Pointer_To_Entity( my.EnemyId);
		if (edistance( you, my)>2000)
		{
			CarLmgAttack();
			return;
		}
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)<20) 
		{
			you = Pointer_To_Entity( my.EnemyId);
			temp.x = my.x - you.x;
			temp.y = my.y - you.y;
			temp.z = my.z - you.z;
			vec_to_angle( my_angle, temp);		
			temp.x     = 0;        
			temp.y     = 360;      
			my_angle.x = 1000;
			my_angle.y = 100;  
			my_angle.z = 0;    
			/*temp.x   = my_angle;
			temp.y     = 180;
			my_angle.x = 10000;
			my_angle.y = 10;
			my_angle.z = 0;*/
			pathfound = spot3_point(0);
		}

		if (pathfound)
		{
			MoveTurnFallAnim2Target( 20, 1);
		}else
		{
			my.FrameAnim = 0;
			ent_cycle(  AllAnimations[ my.AnimShot], my.FrameAnim);

			WeaponSound3d( my.WeaponNumber);

			bltnumbers+=1;

			Short_GunFlash(me,GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
			ShotAndDamage(50,1,1,GunFlashFront[my.skill6]);
			while (my._state == _state_attack && my.FrameAnim<100 )
			 {
				my.FrameAnim +=50*speed/200;
				ent_frame( AllAnimations[ my.AnimShot], my.FrameAnim);
				wait(1);
			 }
			you = Pointer_To_Entity( my.EnemyId);
			temp.x = you.x - my.x;
			temp.y = you.y - my.y;
			temp.z = you.z - my.z;
			vec_to_angle( my_angle, temp);		
			my.pan = my_angle;
		}

	 wait(1);
	}

}

function CarLmgAttack()
{
my._state = _state_attack;
ent_cycle( AllAnimations[ my.AnimShot], my.FrameAnim);
LmgShot();
while ( my._state == _state_attack)
{
	if (my.flag8)
	{
		wait(1);
	}
	
	if (my.GotHit == 1000)
	{
		 return;
	}
	if (SoldCheckIfHealthy())
	{
	 my.LastState = Function_To_Pointer( "CarLmgAttack");
	 return;
	}
	if (my.flag2)
	{
		you = Pointer_To_Entity( my.EnemyId);
	  if (random(10)>2)
	  {
		if (edistance( you, my)<500)
		{
			FarEscape();
			return;
		}
	  }
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

function CarSolderevent()
{
 if (event_type  == event_entity)&&(indicator == CarAccedant)
 {
	morph ( <vkdie.mdl>, me);
	RemoveColl(me);
	my._state = _state_die;
	my._health -= 1000;
	my.GotHit = 1000;
	var Newtargetx = target.x;
	var Newtargety = target.y;
	var Newtargetz = target.z;

	var youx = you.x;
	var youy = you.y;
	var youz = you.z;
	var FulDamage = 0;
	var GraDamage = 0;

	FulDamage = abs(you.CarForce)*you.wieght;
	GraDamage = FulDamage;
	you.CarForce *= 0.1;
	my.frameanim = 0;
	my.animdie = int(random(IFrontDie+1));
	 while (GraDamage>0)
	 {
		temp.x = Newtargetx - youx;
		temp.y = Newtargety - youy;
		temp.z = Newtargetz - youz;
		vec_to_angle( my_angle, temp);
		my_angle.pan -= my.pan;
		my_angle.tilt = 0;
		temp.x = abs(GraDamage)/my.wieght;
		temp.y = 0;
		temp.z = 0;
		vec_rotate( temp, my_angle);
		sonar me ,4000;
		temp.z -= result-abs(sin(GraDamage/5)*10);
		my.tilt = 0;
		move( my, temp, nullskill);

		GraDamage = nearnumber( GraDamage, 0, my.wieght); 
		my.frameanim += 5;
		ent_frame( LonelyAnimat [ my.AnimDie ], my.frameanim);
	 wait(1);
	 } 
}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
}

/* --------------------------------------------------------------------------------------- */

//@ main function of the humer soldier.
function HCarSoldier()
{
	my.skill30 = Entity_To_Pointer(you);
	
	
	 if ( my.ScaleCollision<=0)
	 {
		my.ScaleCollision = 1;
	 }

	 wait(1);
	 my.VertexCount = GetVertexNum(me)-20;
	 CollisionOffset.x = 0;
	 CollisionOffset.y = 0;
	 CollisionOffset.z = 0;
	 AddColl(me);
	 my.passable = 1;
	 my.epassable = 0;
	 my.enable_detect = 1;
	 my.enable_scan = 1;
	 my.event = CarSolderevent;
	 my._type = _type_soldier;
	 my.DieEvent = Function_To_Pointer( "HufSoldDie2");
	 my.HitEvent = Function_To_Pointer( "SolderHit");
	 my.CollFunction = Function_To_Pointer( "TraceCollision");
	 my.WeaponNumber = lmg;
	 my.AnimWalk = IWalkFront;
	 my.AnimRun  = IRunFront;
	 my.AnimDie = 0;
	 my.AnimShot  = IGunFire  ;

	 my.skill6 = 19;
	 my.EnemyId = player.bodylnk;
	 my.flag2 = 0;
	 CarLmgAttack();
}

//@ main function of the humer soldier.
function FlayAbleSoldier()
{
	 if ( my.ScaleCollision<=0)
	 {
		my.ScaleCollision = 1;
	 }

	 sonar me ,4000;
	 my.z -= result;
	 my.VertexCount = GetVertexNum(me)-20;
	 CollisionOffset.x = 0;
	 CollisionOffset.y = 0;
	 CollisionOffset.z = 0;
	 AddColl(me);
	 my.passable = 1;
	 my.epassable = 0;
	 my.enable_detect = 1;
	 my.enable_scan = 1;
	 my.event = CarSolderevent;
	 my._type = _type_soldier;
	 my.DieEvent = Function_To_Pointer( "SolderDie");
	 my.HitEvent = Function_To_Pointer( "SolderHit");
	 my.CollFunction = Function_To_Pointer( "TraceCollision");
	 my.WeaponNumber = lmg;
	 my.AnimWalk = IWalkFront;
	 my.AnimRun  = IRunFront;
	 my.AnimDie = 0;
	 my.AnimShot  = IGunFire  ;
	 my.wieght = 200;
	 my.skill6 = 19;
	 my.EnemyId = player.bodylnk;
	 my.flag2 = 1;
	 CarLmgAttack();
}


/* --------------------------------------------------------------------------------------- */
sound hammerloop,<hammer_loop.wav>;

define __WheelsHight = 13;

function SetCarriedSolder()
{
	temp.x = 0;
	temp.y = 0;
	temp.z = 50 ;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);		
	you = Pointer_To_Entity(my._MySoldier);
	if (you != null)
	{
		vec_set(you.pos,temp);
	}

}

function HCar4()
{
	ent_path("CarPath5");
	ent_waypoint(my._target_x,1);

	my._PointNumber = 0;
	var hhammerloop = 0;
	while (1)
	{
		if (snd_playing(hhammerloop) == 0)
		{
			play_entsound(my,hammerloop,1000);
			hhammerloop = result;
		}
		

		//temp.x = hCarArray_x[my._PointNumber] - my.x;
		//temp.y = hCarArray_y[my._PointNumber] - my.y;
		//temp.z = hCarArray_z[my._PointNumber] - my.z;					
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,5*(speed/200));		
		temp.x = speed/25;
		temp.y = 0;
		temp.z = 0;	
		move(my ,temp ,nullvector );
		sonar(my,500);
		my.z = target.z +abs(my.min_z) + __WheelsHight;
		if (my.flag2 ==0)
		{
			SetCarriedSolder();
		}
		
		//temp.x = hCarArray_x[my._PointNumber]; 
		//temp.y = hCarArray_y[my._PointNumber];
		//temp.z = hCarArray_z[my._PointNumber];					
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{					
			ent_nextpoint(my._target_x);
			my._PointNumber += 1;					
		}

		
		if (vec_dist(my.pos ,player.pos ) < 200)
		{
			hPlayerWins = 2;
			break;
		}
		wait(1);
	}
	
	my._health = -1000;
}

function HCar6()
{
	ent_path("CameraPath");
	ent_waypoint(my._target_x,8);

	my._PointNumber = 8;
	var hhammerloop = 0;
	while (1)
	{
		if (snd_playing(hhammerloop) == 0)
		{
			play_entsound( my, hammerloop, 1000);
			hhammerloop = result;
		}

		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,5*(speed/200));		
		temp.x = speed/25;
		temp.y = 0;
		temp.z = 0;	
		move(my ,temp ,nullvector );
		sonar(my,500);
		my.z = target.z +abs(my.min_z) + __WheelsHight;
		if (my.flag2 ==0)
		{
			SetCarriedSolder();
		}
		
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{					
			break;				
		}

		wait(1);
	}
	
}

/* --------------------------------------------------------------------------------------- */
sound Humberbreak , <Humberbreak.wav>;
function HCar3()
{
// Car Path Array 28 ,29 for me
	ent_path("CaarPath3");
	ent_waypoint(my._target_x,1);

	my.flag6 = 1;
	while (1)
	{
		if (vec_dist(my.pos ,player.pos) < 500)
		{
			break;
		}
		wait(1);
	}
	my.flag6 = 0;

	my._PointNumber = 0;	
	my.skill20 = 0;
	my.skill21 = 0;
	my.skill23 = 15;
	my.flag3 = 0;		
	var hhammerloop = 0;
	while (1)
	{		
		if (snd_playing(hhammerloop) == 0)
		{
			play_entsound(my,hammerloop,1000);
			hhammerloop = result;
		}

		//temp.x = hCarArray_x[my._PointNumber] - my.x;
		//temp.y = hCarArray_y[my._PointNumber] - my.y;
		//temp.z = hCarArray_z[my._PointNumber] - my.z;					

		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;		
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,5*(speed/200));		
		temp.x = speed/my.skill23;
		temp.y = 0;
		temp.z = 0;
		my.skill20 = my.z;
		move(my ,temp ,nullvector );
		sonar(my,500);
		my.z = target.z +abs(my.min_z) + __WheelsHight;
		my.skill21 = my.skill20 - my.z;
			
		if (abs(my.skill21) > 0) && (abs(my.skill21) < 1)
		{
			my.roll = my.skill21*3;
		}

		if (my.flag2 ==0)
		{
			SetCarriedSolder();
		}
		
		if (my.flag3)
		{
			my.skill23 -= 1;		
			if (my.skill23 < 7)
			{
				my.flag3 = 0;
			}
		}
		
		//temp.x = hCarArray_x[my._PointNumber]; 
		//temp.y = hCarArray_y[my._PointNumber];
		//temp.z = hCarArray_z[my._PointNumber];			
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{					
			ent_nextpoint(my._target_x);
			my._PointNumber += 1;
							
			if (my._PointNumber > 1)
			{				
				break;
			}
			my.flag3 = 1;
			
		}

		wait(1);
	}

//@ handel the stop action.
	my.skill30 = 0;
	var somevar = 0;
	stop_sound(hhammerloop);
	play_entsound(my,Humberbreak,9000);
	somevar = result;
	while (1)
	{		

		temp.x = speed/7;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector );
		sonar(my,500);
		my.z = target.z +abs(my.min_z) + __WheelsHight;				
		my.pan -= 10; //- my.skill30;
				
		if (my.flag2 ==0)
		{
			SetCarriedSolder();
		}
		
		my.skill30 += 5;		
		if (my.skill30 > 30)
		{
			break;
		}
		if (my.pan > 100)
		{
			my.roll = 5;
		}
		wait(1);
	}
	
	stop_sound(somevar);
	
	if (my.flag2 ==0)
	{
			SetCarriedSolder();
	}

	my.flag6 = 1;
	
	my.roll = 0;				
	my.roll = 2;
	wait(1);	
	my.roll = -2;
	wait(1);
	my.roll = 0;
	my.passable = 1; 	
}

/* --------------------------------------------------------------------------------------- */

function HCar1()
{
	ent_path("PlyaerCarP");
	if (my._CarNumber == 1)
	{
		ent_waypoint(my._target_x,5);
		my._PointNumber = 4;	

	}

	if (my._CarNumber == 2)
	{	
		ent_waypoint(my._target_x,10);
		my._PointNumber = 9;
		while (1)
		{				
			if (vec_dist(my.pos ,player.pos) < 1100)
			{
				break;
			}
			wait(1);
		}
	}
	var hhammerloop = 0;
	while (1)
	{	
		if (snd_playing(hhammerloop) == 0)
		{
			play_entsound(my,hammerloop,1000);
			hhammerloop = result;
		}

		//temp.x = hCarArray_x[my._PointNumber] - my.x;
		//temp.y = hCarArray_y[my._PointNumber] - my.y;
		//temp.z = hCarArray_z[my._PointNumber] - my.z;				
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		
		//my.tilt = my_angle.tilt;
		my.pan = nearangle(my.pan,my_angle,5*(speed/200));						
		temp.x = speed/10;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector );
		sonar(my,500);
		my.z = target.z +abs(my.min_z) + __WheelsHight;
//		if (hPlayerWins == 1)
//		{
//			you = Pointer_To_Entity(my._MySoldier);
//			if (you != null)
//			{
//				you._health = -500;
//				RemoveColl(you);
//				remove(you);
//			}
//			return;		
//		}
		//@ Car To Close To Player Car, Wait...
		if (vec_dist(my.pos ,player.pos ) < 500)
		{
			my.flag6 = 1;
			while (1)
			{			
				if (hPlayerWins == 1)
				{
					you = Pointer_To_Entity(my._MySoldier);
					if (you != null)
					{
						you._health = -500;
						RemoveColl(you);
						remove(you);
					}
					return;
				}
				if (vec_dist(my.pos ,player.pos ) > 520)
				{
					my.flag6 = 0;
					break;
				}
				wait(1);
			}
		}
		
		if (my.flag2 ==0)
		{
			SetCarriedSolder();
		}

		
		//temp.x = hCarArray_x[my._PointNumber]; 
		//temp.y = hCarArray_y[my._PointNumber];
		//temp.z = hCarArray_z[my._PointNumber];			
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{					
			ent_nextpoint(my._target_x);
			my._PointNumber+=1;
			
			if (my._CarNumber == 1)
			{
				if (my._PointNumber > 5)
				{
					break;
				}
			}
			if (my._CarNumber == 2)
			{
				if (my._PointNumber == 20)
				{
					
					my.tilt = -15; 
					//my.flag6 = 1;
				}
				if (my._PointNumber == 21)
				{
					my.tilt = 0;
					//my.flag6 = 0;
				}
			}
		}
		wait(1);
	}
	
	if (my._CarNumber == 1)
	{
		//@ handel the stop action.
		
		my.skill30 = 0;
		var somevar = 0;
		stop_sound(hhammerloop);
		play_entsound(my,Humberbreak,9000);
		somevar = result;
		
		while (1)
		{		
			temp.x = speed/10;
			temp.y = 0;
			temp.z = 0;
			move(my ,temp ,nullvector );
			sonar(my,500);
			my.z = target.z +abs(my.min_z)+ __WheelsHight;				
			my.pan += 5 + my.skill30;
			
			if (my.flag2 ==0)
			{
				SetCarriedSolder();
			}

			my.skill30 += 7;
			if (my.pan > 170)
			{
				break;
			}

			if (my.pan > 100)
			{
				my.roll = 5;
			}
			wait(1);
		}

		
		if (my.flag2 ==0)
		{
			SetCarriedSolder();
		}

		

		my.passable = 1; 
		
		
		my.skill30 = 0;
		while (my.skill30 < 3)
		{
			my.pan += 3;
			my.skill30 += 1;
			
			temp.x = speed/10;
			temp.y = 0;
			temp.z = 0;
			move(my ,temp ,nullvector );
			sonar(my,500);
			my.z = target.z +abs(my.min_z) + __WheelsHight;	
			if (my.flag2 ==0)
			{
				SetCarriedSolder();
			}
			wait(1);
		}
				
		my.flag6 = 1;
		stop_sound(somevar);
		my.roll = 0;				
		my.roll = 2;
		wait(1);	
		my.roll = -2;
		wait(1);
		my.roll = 0;		
			
		
	}		
}

/* --------------------------------------------------------------------------------------- */

function OrdCarEvent()
{
	if (event_type == event_scan) && (indicator == _explode)
	{				
		my._health-=1000;
		return;
	}

	if (event_type == event_shoot) && (indicator == _gunfire)
	{ 				
		my._health -= damage/20;
	}
}

/* --------------------------------------------------------------------------------------- */

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

function H2OCarEngine()
{
	my.invisible = 1; 	
	//you.LeaderId =Entity_To_Pointer(me);
	my.LeaderId = Entity_To_Pointer(you);
			
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	wait(10);
	
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	AddColl(me);	
	//my.epassable = 0;
	my.passable = 1; 	
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = OrdCarEvent;
	my.OwnType = TypeOfEngines;
	my.CollFunction  = Function_To_Pointer("ComparsCollision");
	my._health = 0;
	
	my.max_x *= 2.2;		
	my.scale_x = 2; 
	my.scale_y = 2; 
	my.scale_z = 2; 

	while (1)
	{
		
		you = Pointer_To_Entity(my.LeaderId); 
		if (you != null)
		{
			vec_set(my.pos,you.pos);
			my.pan = you.pan;
			if (my._health < -50)
			{
			if ( (50+random(150)) <abs(my._health) )
			{
				SmokeMeSome();
			}
			}

			if (my._health < -200)
			{
				you.flag8 = 1;
				break;
			}
		}
		
				
		
		wait(1);
	}
	RemoveColl(my);	
	remove(my);
}

/* ------------------------------------------------------------------------------------------- */

//@ the main function of the humer cars.
function hWheels()
{	
	while (1)
	{
		if (my.flag1 == 0)
		{
			ent_cycle("Frame" ,my.skill40 );
			my.skill40 += speed/25;						
		}		
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------- */

function SetMyWheele(Cyou, Vert)
{
		you = Cyou;
		vec_for_vertex(temp,my,Vert);
		vec_set(you.pos,temp);
		you.pan = my.pan;		
		you.flag1 = my.flag6==1;
}

function removehim(cme)
{
	me = cme;
	remove me;
}

action HummerCars
{
	//@ skill 1  : The Car Number ( _CarNumber ).
	//@ skill 5  : Pointer To The Soldier On My Top ( _MySoldier ).
	//@ skill 20 , 21 : used for car shack ( car 3 ). 
	//@ skill 30 : Point Number car is going to ( _PointNumber ).	
	//@ skill 39 : for the type.
	//@ skill 40 , 41 , 42 , 43 wheels

	//@ flag 1 : Set By The Soldier On My Top, indecating that he is ded so i will create another one.	
	//@ flag 2 : Used To temporary stop the code that put the soldier on top of the car,
	//           that is when the soldier die until a new one is created.
	
	//@ flag 6 : used in colison detection.
	//@ flag 8 : Indecat when to plow the car.
		
	my.invisible = 1;
	my.passable = 1; 	
	sonar(my,10000);
	my.z = target.z +abs(my.min_z) + __WheelsHight;												
	while (DrivingGame == 0)
	{
		wait(1);
	}
	my._type = __HummerCar;
	
	while (HummersArray[my.skill1 - 1] == __HamerWait)
	{		
		wait(1);
	}

	//@Create the wheels.
	vec_for_vertex(temp,my,3);
	create(<WheelHUm.MDL>,temp,hWheels);	
	my.skill40 = Entity_To_Pointer(you);
	
	vec_for_vertex(temp,my,6);
	create(<WheelHUm.MDL>,temp,hWheels);
	my.skill41 = Entity_To_Pointer(you);

	vec_for_vertex(temp,my,9);
	create(<WheelHUm.MDL>,temp,hWheels);
	my.skill42 = Entity_To_Pointer(you);

	vec_for_vertex(temp,my,12);
	create(<WheelHUm.MDL>,temp,hWheels);
	my.skill43 = Entity_To_Pointer(you);
	
	my.invisible= 0;

	//@ the soldier on the hummer
	my.flag1 = 1;

	if (my.skill1 == 1)
	{
		HCar1();
		goto end25;
	}
	
	if (my.skill1 == 2)
	{
		HCar1();
		goto end25;

	}
	if (my.skill1 == 3)
	{
		HCar3();
		goto end25;

	}
	if (my.skill1 == 5)
	{
		HCar4();
		goto end25;

	}
	if (my.skill1 == 6)
	{
		HCar6();
		goto end25;

	}

	end25: 
	
	wait(10);
	
	
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	my.max_x *= 2.2;
	my.max_z *= 0.25;
	AddColl(me);	
	my.epassable = 0;
	my.passable = 1; 	
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = OrdCarEvent;
	my.OwnType = TypeOfEngines;
	my.CollFunction  = Function_To_Pointer("ComparsCollision");
	my._health = 0;
		
	while (1)
	{
		if (my.skill1 == 2)
		{
			you = pointer_to_entity(my._MySoldier);
			if (you)
			{
				if (you.z > 1026)
				{
					you.z = 1026;
					you.flag8 = 1;
				}
				else
				{
					you.flag8 = 0;
				}
			}

			if (my.z > 976)
			{
				my.z = 976;
			}
			
			if (player.z > 998)
			{
				player.z = 998;
			}
			you = pointer_to_entity(pPlayerCar);
			if (you)
			{
				if (you.z > 978)
				{
					you.z = 978;
				}
			}

		}		
		if ( (50+random(150)) <abs(my._health) )
		{
			SmokeMeSome();
		}

		SetMyWheele( Pointer_To_Entity(my.skill40), 3);
		SetMyWheele( Pointer_To_Entity(my.skill41), 6);
		SetMyWheele( Pointer_To_Entity(my.skill42), 9);
		SetMyWheele( Pointer_To_Entity(my.skill43), 12);
		
		//@ wait For explosion, and remove my osldier, and the wheels.
		if (my._health < -200)
		{
			you = Pointer_To_Entity(my._MySoldier);
			if (you != null)
			{
				you._health = -500;
				RemoveColl(you);
				remove(you);
			}
						
			removehim(Pointer_To_Entity(my.skill40));
			removehim(Pointer_To_Entity(my.skill41));
			removehim(Pointer_To_Entity(my.skill42));
			removehim(Pointer_To_Entity(my.skill43));
			OrdCarExplosion();
			break;
		}

		if (my.flag1)
		{
			my.flag1 =0;
			my.flag2 = 0;

			create(<cklmg.mdl>,my.pos,HCarSoldier);
			my._MySoldier = Entity_To_Pointer(you);
			SetCarriedSolder();
		}

		wait(1);
	}

}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Soldier Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////

var iSoldCount = 0;
//@ the main function of the soldier in the second part of the game.
action DrivingSoldier()
{
	//@ skill7 = 1 : Group(1)
	//@	   = 2 : Group(2)
	//@        = 3 : Group(3)
	//@        = 4 : Group(4)
	//@        = 5 : Group(5)

	ahSoldPointer[iSoldCount] = Entity_To_Pointer(my);
	ahSoldSkill[iSoldCount] = my.skill7;
	iSoldCount += 1;
	//@ wait until its cars Time
	my.invisible = 1;
	my.passable = 1;
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);
	while (DrivingGame == 0)
	{
		wait(1);
	}

	//@ wait until my turn come
	while (1)
	{		
		if (DirveGArray[my.skill7 -1])
		{
			break;
		}
		wait(1);
	}

	my.invisible = 0;
	
	if (my.skill6 == 1)
	{
		//SoldColl();
		my.skill8 = m16;
		my.flag6 = my.skill7;
		LmgSolder();
	}
	else
	{
		my.flag6 = my.skill7;
		
		SolderSniper();
	}

}

/*************************************************************************************************
**************************************************************************************************

				Game Part 1 

**************************************************************************************************
**************************************************************************************************/

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Cars Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////

var HumveGoGo = 0;
var FirestAxGoGo = 0;
var SecAxGoGo = 0;
var TharedAxGoGo = 0;
var FourthAxelGoGo = 0;

var StartBeep = 0;
var iTimer = 30;



function Beeping()
{
	while (LetTheGameBegin == 0)
	{
		wait(1);
	}
		
	var iCounter = 0;
	while (1)
	{
		while (StartBeep == 0)
		{
			if (messionfailed)
			{
				return;
			}
			wait(1);
		}
		if (messionfailed)
		{
			return;
		}
		iCounter += 1;
		
		if (iCounter > iTimer)
		{
			iCounter = 0;
			play_sound(peep,100);
		}
		

		wait(1);
	}
}

/* --------------------------------------------------------------------------------------- */  
/*
function trailsmoke_proprtygaz222() 
{
	my.alpha -= 1;
	my.size -= 1;
	my.lifespan += 0.75;
	if (my.alpha<=0)
	{
		my.lifespan=0;
	}
}

/* --------------------------------------------------------------------------------------- */   
/*
bmap fffb , <black_smoke2.tga>;
function trailsmoke_effect222() 
{
	my.move=0;
	my.size=100+random(100);
	my.bmap=fffb;
	my.flare=on;
	my.transparent=on;
	my.move=on;
	
	my.alpha= 20;
	my.lifespan=100;
	my.function= trailsmoke_proprtygaz222;
}

/* --------------------------------------------------------------------------------------- */   
/*
function smoke_explosion222()
{
      var m=0;
      while (m < 3000)
       {   	         
           my_angle.pan=random(90);
           my_angle.tilt=random(20);
	   my_angle.roll=0;
	
	   temp2.x = random(5);
  	   temp2.y = 0;
 	   temp2.z = 0;
	   vec_rotate(temp2,my_angle);
	   my_angle.pan=random(360);
	   my_angle.tilt=random(180);
	   my_angle.roll=0;
	   temp.x = 5+random(1);
	   temp.y = 0;
	   temp.z = 0;
	   vec_rotate(temp,my_angle);
	   vec_add(temp,my.pos);
 	   effect(trailsmoke_effect222,10,temp,temp2);
			  			    
	   m += 1;
	   wait(1);
      }

}


/* ------------------------------------------------------------------------------------------------- */

function CarSlowDown()
{	
	//smoke_explosion222();

	you = Pointer_To_Entity(my._MySoldier);
	you.flag2 = 1;
	while (1)
	{
		if (vec_dist(my.x , my._target_x) < 400)
		{
			my.skill25 += 0.5;
		}
		
		if (my.flag1 == 1)
		{
			break;
		}
		wait(1);
	}
	
	my.tilt -= 0.5;	
	wait(1);	
	my.tilt -= 0.5;	
	wait(2);	
	my.tilt = 0;			
}

/* ------------------------------------------------------------------------------------------------- */

action Humve
{	
	my.passable = on;
	my.invisible = on;
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);
	ent_path("humvePath");
	ent_waypoint(my._target_x,1);

	while (HumveGoGo == 0)
	{
		wait(1);
	}
	
	my._carNumber = 50;
	my.invisible = off;
	create( <ambulance.mdl>, my.pos, H2OCarEngine);
		
	//@ Create the humer soldier
	temp.x = 0;
	temp.y = 0;
	temp.z = 50;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);
	create( <cklmg.mdl>, temp, HCarSoldier);
	my._MySoldier = Entity_To_Pointer(you);
	
		
	wait(5);	
	my.skill25 = speed/40;
	while (1)
	{
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan, my_angle , 10*(speed/200));
		temp.x = speed/my.skill25 ;
		temp.y = 0;
		temp.z = 0;
		move(me ,temp ,nullvector);
		sonar(my,10000);
		my.z = target.z +abs(my.min_z);

		//@ control the soldier on my back;
		you = pointer_to_entity(my._MySoldier);
		if (you != null)
		{
			temp.x = 0;
			temp.y = 0;
			temp.z = 48;
			vec_rotate(temp,my.pan);
			vec_add(temp,my.pos);
			vec_set(you.pos,temp);
		}

		//@ explosion hapend.
		if (my.flag8)
		{
			you = Pointer_To_Entity(my._MySoldier);
			if (you != null)
			{
				RemoveColl(you);
				remove(you);
			}
			OrdCarExplosion();	
			TharedAxGoGo = 1;			
			break;
		}

		if (vec_dist(my.x , my._target_x) < 50)
		{			
			ent_nextpoint(my._target_x);
			my.skill30 += 1; 
			
			if (my.skill30 == 2)
			{
				CarSlowDown();
			}
			
			//@ Droping soldiers
			if (my.skill30 == 3 )
			{
				SecAxGoGo = 1;
				my.flag1 = 1;
				wait(20);
				my.skill25 = 10;
				//return;
			}

			if (my.skill30 == 4)
			{
				CarSlowDown();
			}

			if (my.skill30 == 5)
			{
				TharedAxGoGo = 1;
				my.flag1 = 1;												
				break;

			}
		}
		wait(1);
	}

	my.flag7 = 0;
	while (DrivingGame == 0)
	{
		if (my.flag8 == 1) && (my.flag7 == 0)
		{
			my.flag7 = 1;
			OrdCarExplosion();
		}
		wait(1);
	}
	
	you = Pointer_To_Entity(my._MySoldier);
	if (you != null)
	{
		RemoveColl(you);
		remove(you);
	}	
	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */
sound CarDoorCL,<CarDoorCL.wav>;

function PlayerCarEvent()
{
	if (event_type == event_scan) && (indicator == _handle)
	{
		my.event = null;
		if (PlayerGotGeneral == 1)
		{			
			exclusive_entity;			
			DrivingGame = 1;
			
			totalbullets[6] = 400;
			WeaponGui();
			you = Pointer_To_Entity( player.BodyLnk);
			you._health = 0;
			HldSld.u =max(you._health*16/25,-64);
			ObjecPos.frame = 2;

			// ---------------------------------
			play_sound(CarDoorCL,100);
			wait(1);
			play_sound(CarDoorCL,100);
			
			

			

			you = pointer_to_entity(General);
			if (you != null)
			{
				removecoll(you);
				remove(you);
			}
			
			while (1)
			{
				you = Pointer_To_Entity(MariamP);
				if (you == null)
				{
					break;
				}
				lnkplayertome();
				wait(1);
			} 
			play_sound(CarDoorCL,100);
			// ---------------------------------
			
			var rr = 0;
			play_sound(S_M_L5a_27,100);
			rr = result ;
			while (snd_playing(rr))
			{
			wait(1);
			}
			showmessage(1,173);
			play_sound(S_M_L5_17,__SoundVol);
			wait(2);
			showmessage(1,146);


			CarDriving();
			my.passable = 1;
			cameraction = EyCamera;
			InitPPCamera();
			
			
			return;									
		}
		my.event = PlayerCarEvent;
	}
}

/* ------------------------------------------------------------------------------------------------- */

action PlayerCar
{				
		
	//@ skill 20 
	//@ skill 21 , 22 : Used In Car Shakeing.
	
	//@ skill 26 : Control the speed of the car
	//@ skill 30 : point counter.
	//@ skill 39 : type.
	//@ skill 40 : counter.
	//@ skill 41 , 42 , 43 , 44 : Colision Bars << front , left , back , right >>.

	//@ flag2 : Signal The Car To Start Shaking or to Stop it.	
	//@ flag5 : Car SlowDown.
	//@ flag6 : Car SpeedUp.
	//@ flag8 : A Switch used in car movements.
	
	sonar(my,500);
	my.z = target.z +abs(my.min_z);
	my.enable_scan = on;
	my.event = PlayerCarEvent;
	
	pPlayerCar = entity_to_pointer(me);

	while (player == null)
	{
		wait(1);
	}		
	
	//@ car1
	temp.x = 40;
	temp.y = 0;
	temp.z = 0;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);
	create(<Nissan.MDL>,temp,null);	
	you.invisible = 1;
	you.pan = 10;	
	
	//@ car2
	temp.x = -40;
	temp.y = 0;
	temp.z = 0;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);
	create(<Nissan.MDL>,temp,null);	
	you.invisible = 1;
	you.pan = my.pan;	
	
	my.skill40 = 200;
	while (1)
	{
		
		//@ show < Press Use to Drive the car > message
		if (vec_dist(my.pos ,player.pos ) < 300) && (PlayerGotGeneral == 1)
		{						
			my.skill40 +=1;
			if (my.skill40 > 200)
			{
				my.skill40 = 0;
				showmessage(1,180);
			}			
		}
		
		if (vec_dist(my.pos ,player.pos ) < 2000) && (TharedAxGoGo == 1)
		{
			FourthAxelGoGo = 1;
		}
		wait(1);
	}
		
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

function waitexplosion()
{
	while (my.flag8 == 0)
	{
		wait(1);
	}
	OrdCarExplosion();
}

action SoldCars
{
	while (player == null)
	{
		wait(1);
	}

	create( <ambulance.mdl>, my.pos, H2OCarEngine);
	
	//if (my.skill1 == 3)||(my.skill1 == 4) 
	//{
		waitexplosion();
	//	return;
	//}
	my.skill10 = 100;
	while (1)
	{									
		if (my.flag8)
		{
			OrdCarExplosion();	
			return;
		}

		if (DrivingGame)
		{
			return;
		}
		if (vec_dist(my.pos ,player.pos) < 1400)
		{	
			my.skill10 +=1;
			if (my.skill10 > 100)
			{
				my.skill10 = 0;
				showmessage(10,144);
				Play2DSound(4);
			}
		}
						
		if (vec_dist(my.pos ,player.pos) < 800)
		{	
			break;
		}
		
				
		wait(1);
	}

	if (PlayerGotGeneral == 1)
	{
		showmessage(1,183);
	}
	else
	{
		showmessage(1,177);
	}
	
	hMisionfail();
			
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */


action haniSafari
{		
	while (player == null)
	{
		wait(1);
	}

	while (1)
	{
		
		you = Pointer_To_Entity(General);
		if (you)
		{
 	 		if (you.flag5)
			{
				
				GroundForceGoGo  =1;
				break;
			}
		}
		
		if (edistance(my ,player )< 2000)
		{
			GroundForceGoGo  =1;
			break;
		}
		wait(1);
	}

	you = Pointer_To_Entity(General);
	while (1)
	{
		
		you = Pointer_To_Entity(General);
		if (you)
		{
			if (you.flag5)
			{
			break;
			}
		}
		
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

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Soldier Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////

function FirestAxel()
{			
	my.invisible = off;
	if (my.skill7 == 16) || (my.skill7 == 12)
	{
		SolderSniper();
	}
	else
	{
		SoldColl();
	}	
}

/* --------------------------------------------------------------------------------------- */

function SecondAxel()
{	
	while (SecAxGoGo == 0)
	{
		wait(1);
	}
	ent_frame("stnd" ,0 );
	
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = m16;	
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;	
	SolderCounter+=1;
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
	my.event = solderevent;	
	my.DieEvent = Function_To_Pointer("SolderDie");
	my.HitEvent = Function_To_Pointer("SolderHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.invisible = off;		
			
	if (my.skill7 == 31)
	{
		my.pan = 90;
	}
	else
	{
		if (my.skill7 == 33)
		{
			wait(20 + random(10));
		}
		my.pan = 270;
	}
				
	temp.x = 1000;
	temp.y = 0;
	temp.z = 0;
	vec_rotate(temp ,my.pan );
	vec_add(temp,my.pos);
	my._target_x = temp.x;
	my._target_y = temp.y;
	my._target_z = temp.z;

	my.skill30 = 0;	
	while (1)
	{					
		if (my.skill30 > 30) { vec_set( my._target_x, player.x); } else { my.skill30 += 1; }
		
		if (MoveTurnFallAnim2Target(20,0.5)) { break; }
				
		if random(10)>2 && ( vec_dist(my.pos ,player.pos) < 1000 )  { break; }
		
		if (SoldCheckIfHealthy())
		{  my.LastState = Function_To_Pointer("SecondAxel");
			return;
		}

		wait(1);
	}		
	
	my.skill30 = 0;
	SolderWait();
	//SoldColl();
}

/* --------------------------------------------------------------------------------------- */

function ThardAxel()
{	
	while (TharedAxGoGo == 0)
	{
		wait(1);
	}
	
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}

	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = m16;	
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;	
	SolderCounter+=1;
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
	my.event = solderevent;	
	my.DieEvent = Function_To_Pointer("SolderDie");
	my.HitEvent = Function_To_Pointer("SolderHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	
	my.invisible = off;
	
	while (1)
	{
		ent_cycle("1run" ,my.FrameAnim);
		my.FrameAnim += speed/50;
						
		temp.x = speed/25;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector);
		sonar(my,500);
		my.z = target.z +abs(my.min_z);
		
		my.skill30 += 1;
		if (my.skill30 > 120)
		{
			break;
		}

		if (vec_dist(my.pos ,player.pos) < 600)
		{
			break;
		}
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer("SecondAxel");
			return;
		}
		wait(1);
	}
	
	SolderWait();
	
	
}

/* --------------------------------------------------------------------------------------- */

function FourthAxel()
{
	while (PlayerGotGeneral == 0)
	{
		wait(1);
	}
	my.invisible = 0;
	//SolderWait();
	SoldColl();
}

/* --------------------------------------------------------------------------------------- */

function GroundForce()
{	
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}

	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = m16;	
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;	
	SolderCounter+=1;
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
	my.event = solderevent;	
	my.DieEvent = Function_To_Pointer("SolderDie");
	my.HitEvent = Function_To_Pointer("SolderHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
			
	my.invisible = off;
	//ent_frame("stnd",0);
	my.FrameAnim = 0;
	while (GroundForceGoGo ==0)
	{
		ent_frame("stnd",my.FrameAnim);
		my.FrameAnim += speed/200;
		wait(1);
	}
	SolderWait();
	//SoldColl();
}

/* --------------------------------------------------------------------------------------- */

define __WelcomDsi = 650;
function WelcomGroup()
{
	//@ 73  74
	ent_frame("stnd" ,0 );
	my.invisible = 0;
	while (player == null)
	{
		wait(1);
	}						

	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}

	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = m16;	
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;	
	SolderCounter+=1;
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
	my.event = solderevent;
	my.DieEvent = Function_To_Pointer("SolderDie");
	my.HitEvent = Function_To_Pointer("SolderHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	
	my.pan = 50;	
	while (1)
	{
		ent_cycle("1run" ,my.FrameAnim);
		my.FrameAnim += speed/50;

		temp.x = player.x - my.x;
		temp.y = player.y - my.y;
		temp.z = player.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle.pan;
		temp.x =speed/25;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector );		
		sonar(my,500);
		my.z = target.z +abs(my.min_z);
		
		if (vec_dist(my.pos ,player.pos) < __WelcomDsi)
		{
			break;
		}
		
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("WelcomGroup");
			return;
		}

		wait(1);
	}
	SolderWait();	
}

/* --------------------------------------------------------------------------------------- */

action MySoldier
{		


	my.invisible = 1;	
	my.passable = 1;
	
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);
		
	//@ Skill7   1  -- 10 : Soldier in Ground From the start.
	//@          11 -- 30 : Soldier in Axel 1.
	//@          31 -- 50 : Soldier in Axel 2.
	//@	     51 -- 70 : soldier in Axel 3.
	//@	     71 -- 80 : soldier goto ahmed (Welcom Party)
	//@          81 -- 90 : soldier in Axel 4.
	//@          91 -- 140: Driveing Soldiers.
	
	
	if (my.skill7 > 0) && (my.skill7 < 11)
	{
		GroundForce();
		return;
	}
	if (my.skill7 > 10 ) && (my.skill7 < 31)
	{
		FirestAxel();
		return;
	}

	if (my.skill7 > 30) && (my.skill7 < 51)
	{
		SecondAxel();
		return;
	}

	if (my.skill7 > 50) && (my.skill7 < 71)
	{
		ThardAxel();
		return;
	}
	
	if (my.skill7 > 70) && (my.skill7 < 81)
	{
		WelcomGroup();
		return;
	}
	
	if (my.skill7 > 80) && (my.skill7 < 91)
	{
		FourthAxel();
		return;
	}		
}


/* --------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------- */
var SRtoGP[3] ;
var SRtoGPos[3];

//@ this function loads the points that (-the soldier run to general-) use to
//  find his way.
action SolRtoGePoin
{
	my.invisible = on;
	my.scale_x = 2;
	my.scale_y = 2;
	my.scale_z = 2;
	wait(1);

	sonar(my,5000);
	my.z = target.z +abs(my.min_z);
	
	wait(2);
	vec_set(SRtoGP,my.pos);
	wait(2);
	remove(my);
}

/* --------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------- */

//@ this function keps generating soldier runs to the general, 
//  each time one die,another is generated.
function GenerateSol()
{
	wait(random(5));
	if (PlayerGotGeneral == 0)
	{
		create(<vkm16.mdl>,SRtoGPos,SoldRunToG);
	}	
}

/* --------------------------------------------------------------------------------------- */

function SoldRunToGDie()
{
	StartBeep = 0;
	you = Pointer_To_Entity( my.EnemyId);
	if (you)
	{you.Enemy_Count -= 1;
	}
	//exclusive_entity;
	if (my.HiddenPoint)
	{Free_HPoint(me);
	}else
	{Free_Point(me);
	}
	PointParameters[ PointLength] = my.PathId;
	UnLocatePoint();
	my._state = _state_die;
	str_for_entfile( name, me);
	PTempstr = GetDieString( name, me);
	if (PTempstr!=0)
	{morph (  PTempstr, me);
	}else
	{morph ( <rdie.mdl>, me);
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
		//my.scale_z /= max( 0.11*speed/200, 1);
		//my.z -= 0.2*speed/200;
		my.skill1 += 0.3*speed/200;
		wait(1);
	}
	

	GenerateSol();
	wait(10);
	remove(my);
		
}

/* --------------------------------------------------------------------------------------- */

function SoldRunToGEvent()
{
	if (event_type == event_shoot) && (indicator == _gunfire)
	{ 
		my._health -= 100;
	}
	if (event_type == event_scan) && (indicator == _explode)
	{	
		my._health-=1000;
		
	}
}

/* --------------------------------------------------------------------------------------- */

action SoldRunToG
{
//my.invisible = 1;
	
	StartBeep = 1;

	sonar(my,500);
	my.z = target.z +abs(my.min_z);

	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}

	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	//my.WeaponNumber = my.skill8;
	my.skill8=0;
	my.WeaponNumber = m16;
	wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	//my.shadow = shadowenable;
	SolderCounter+=1;
	my.hunt = 1;
	my.hide = 1;
	//my.Grenader = 1;
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
	my.event = solderevent;
	my.DieEvent = Function_To_Pointer( "SoldRunToGDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	my.skill6 = 1;				
	wait(2);
	vec_set(SRtoGPos,my.pos);

	wait(2);
	
	//@ part one run ot the point.
	temp.x = SRtoGP.x  - my.x ;
	temp.y = SRtoGP.y  - my.y ;
	temp.z = SRtoGP.z  - my.z ;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;
	my.passable = on;
	my._state = _state_path;
	GivePlayerSingle();
	while (1)
	{
		ent_cycle( "1run" ,my.FrameAnim );
		my.FrameAnim += speed/50;
		
		temp.x = speed/50;
		temp.y = 0;
		temp.z = 0;
		move( my ,temp ,nullvector );
		sonar(my,500);
		my.z = target.z +abs(my.min_z);
				
		if (vec_dist(my.pos ,player.pos) < 200)
		{
			StartBeep = 0;
			iTimer = 30;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			SolderWait();
			return;
		}

		if (vec_dist(my.pos , SRtoGP.x) < 50)
		{
			break;
		}

		if (my._health < 0)
		{
			SoldRunToGDie();
			return;
		}
		if (PlayerGotGeneral == 1)
		{
			StartBeep = 0;
			iTimer = 30;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.enemyid = player.bodylnk;
			SolderShotting();
			return;
		}
		wait(1);
	}

	
	//@ part 2 goto the general
	you = Pointer_To_Entity(General);
	temp.x = you.x  - my.x ;
	temp.y = you.y  - my.y ;
	temp.z = you.z  - my.z ;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;
	my.passable = 1;
	showmessage(25,192);
	iTimer = 15;
	while (1)
	{
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim += speed/50;

		temp.x = speed/50;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector );
		sonar(my,500);
		my.z = target.z +abs(my.min_z);

		if (vec_dist(my.pos ,player.pos) < 200)
		{
			StartBeep = 0;
			iTimer = 30;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.enemyid = player.bodylnk;
			SolderShotting();
			return;
		}
		you = Pointer_To_Entity(General);
		if ( edistance(my , you) < 100 )
		{	my.invisible = 1;		
			showmessage(1,182);
			wait(3);
			hMisionfail();
			return;
		}

		if (my._health < 0)
		{
			SoldRunToGDie();
			return;
		}
		
		//@ when the player got the general,turn to normal soldier.
		if (PlayerGotGeneral == 1)
		{
			StartBeep = 0;
			iTimer = 30;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			SolderWait();
			return;
		}
		wait(1);
	}

}


///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				General Function
//
///////////////////////////////////////////////////////////////////////////////////////////////////

var GSoundPlaying = 0;
var GHidPoint;


define __LostDest = 750;
define __ColisionDest = 200;
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
 

sound TakeSmoe,<Take.wav>;


/* ------------------------------------------------------------------------------------------------- */

//@ this function loads the points that the general use to hide when
//  hw runs from the player.
action HHidPoints
{	
	my.invisible = on;
	my.passable = on;
	wait(20);
	GHidPoint = entity_to_pointer(my);
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

function GeneralEvent()
{
	if (event_type == event_scan) && (indicator == _handle)//&&(/*(DedSolders > 11)||*/( my.flag6))
	{
		PlayerGotGeneral = 1;
		my.flag5 = 1;
		my.flag6  = 0;

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
	Play2DSound(3);
	hMisionfail();
	
}

/* ------------------------------------------------------------------------------------------------- */

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

function SpotGeneralPoint(myt)
{	

	var TTemp;
	var Reslt;
	var Lastpass;
	you = myt;
	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan]		= 0;        
	ScanValues[scan_EPan]		= 360;      
	ScanValues[scan_Range]		= 1000;
	ScanValues[scan_Distance]	= 200;  
	ScanValues[scan_Scan2Targets]	= 0;    
	if (you==null)
	{return(0);
	}
	Lastpass = you.passable;
	you.passable = 1;
	vec_set(ScanValues[scan_target_x],you.x);

	Reslt.x = NScan(me);
	you = myt;
	you.passable = Lastpass;

	if (Reslt.x !=0)
	{
		get_next_point(me);
	}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}


function GoWithPlayer()
{		
	var iCounter = 0;
	var s= 1;
	my.FrameAnim = 0;	

	my.AnimWalk = IWalkFront;
	my.AnimRun  = IWalkFront;

	stop_sound(GSoundPlaying);
	play_entsound(my,S_M_HM5_18,__GeneralVolume);
	showmessage(1,184);
	
	showmessage(30,193);
	play_sound(TakeSmoe,100);
	vec_set( my._target_x, my.x);
	var Pathfound=0;
	while (1)
	{
		vec_set( point_move.x, my._target_x);
		if ( EDistance( point_move, me)< 20) 
		{
			my.passable = 1;
			Pathfound = SpotGeneralPoint( pointer_to_entity(player.bodylnk));
			my.passable = 0;
		}

		if (Pathfound == 0)
		{
			ent_frame( "Bsur", 0);
		}else
		{
			if (MoveTurnFallAnimAndTarget( 20, 0.5))
			{
				vec_set( my._target_x, my.x);
			}
		}

		if ( edistance(my ,player) > __LostDest)
		{
			wait(1);
			EscapeToHumer();
			return;
		}
		
		if (edistance(my ,player)  < __ColisionDest)
		{
			my.frameanim = 0;
			while (edistance(my ,player) < __ColisionDest*2)
			{

				if (edistance(my ,player) < __PlayPussGe)
				{
					iCounter += 1;
					if (iCounter > 60)
					{
						iCounter = 0;
						iCounter =int(random(3));
						if (iCounter == 0)
						{
							stop_sound(GSoundPlaying);
							showmessage(1,187);
							play_entsound(my,S_M_HM5_21,__GeneralVolume);
							GSoundPlaying = result;
						}
						else
						{
							if (iCounter == 1)
							{
								stop_sound(GSoundPlaying);
								showmessage(1,188);
								play_entsound(my,S_M_HM5_22,__GeneralVolume);
								GSoundPlaying = result;
							}
							else
							{
								stop_sound(GSoundPlaying);
								showmessage(1,189);
								play_entsound(my,S_M_HM5_23,__GeneralVolume);
								GSoundPlaying = result;
							}
						}
					}
				}

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
				
		//@ General Walking Messages
		iCounter +=1;
		if (iCounter > 120)
		{
			iCounter = 0;
			iCounter = int(random(3));
			if (iCounter == 0)
			{
				stop_sound(GSoundPlaying);
				showmessage(1,186);
				play_entsound(my,S_M_HM5_20,__GeneralVolume);
				GSoundPlaying = result;				
			}
			else
			{
				if (iCounter == 1)
				{
					stop_sound(GSoundPlaying);
					showmessage(1,190);
					play_entsound(my,S_M_HM5_24,__GeneralVolume);
					GSoundPlaying = result;	
				}
				else
				{
					stop_sound(GSoundPlaying);
					showmessage(1,191);
					play_entsound(my,S_M_HM5_25,__GeneralVolume);
					GSoundPlaying = result;					
				}
			}
		}
		wait(1);
	}
}

function FindPath2Hum(myt)
{	
	var Reslt;
	var Lastpass;

	you = myt;
	if(you==null)	{ 
		return(0);}

	Lastpass = you.passable ;
	you.passable = 1;
	vec_set( PointParameters[ PointPos], my.pos);
	vec_set( PointParameters[ PointDirction], you.pos);
	PointParameters[ PointLength] = 1;
	Reslt.x = FindTargetPath(0,0);
	you = myt;
	you.passable = Lastpass;

	if ( reslt.x )
	{
		vec_set( my._target_x,  PointParameters[ PointDirction]);
		Reslt.y = my.PathId;
		my.PathId = PointParameters[ PointLength];
		ALocatePoint();
		PointParameters[ PointLength] = Reslt.y;
		UnLocatePoint();
	}

	return(Reslt.x);
}

function FindNext2Hum(myt)
{	
	var Lastpass;
	var Reslt;

	you = myt;
	if(you==null)	{	return(0);}
	Lastpass = you.passable;
	you.passable = 1;
	vec_set( PointParameters[ PointPos], my.pos);
	vec_set( PointParameters[ PointDirction], you.pos);
	PointParameters[ PointLength] = 1;
	Reslt.x = FindTargetPath(1,0);
	you = myt;
	you.passable = Lastpass;
	if ( reslt.x )
	{
		vec_set( my._target_x,  PointParameters[ PointDirction]);
		Reslt.y = my.PathId;
		my.PathId = PointParameters[ PointLength];
		ALocatePoint();
		PointParameters[ PointLength] = Reslt.y;
		UnLocatePoint();
	}
	return(Reslt.x);
}

function GivePlayerSingle()
{
	you = me;
	me  =  player;
	var Crntstate    = you._state;
	var alpainc = 0;
	while (you)
	{
		object4.visible  = 1;
		alpainc		+= 20;
		object4.alpha    = (sin(alpainc)+1)*50;
		if (you._state != Crntstate){	break;	}
		wait(1);
	}
	object4.visible  = 0;
}

function PathToParam(CYou, NextF, FailFunc)
{
exclusive_entity;

my.AnimWalk = IWalkFront;
my.AnimRun  = IRunFront;

vec_set( my._target_x,  my.x);
my._state = _state_path;
var Pathfound=0;
var Pathscaned=0;
	while (Pathfound==0)
	{
		if (my._health < 0)
		{
			pointer_to_function( FailFunc,0,0,0);
			return;
		}

		if (my.flag5)
		{
			GoWithPlayer();
			return;
		}
		if (frc(Pathscaned/10)==0)
		{
			Pathfound = FindPath2Hum( Pointer_To_Entity( CYou));
		}
		Pathscaned+=1;
		if (Pathfound==0)
		{
			ent_frame( "Bsur", 0);
		}
		wait(1);
	}

while (my._state==_state_path)
{	
	my.passable = 1;
	if (MoveTurnFallAnimAndTarget( 20, 1))
	{
		GoWithPlayer();
		return;
	}

	my.passable = 0;
	if ( EDistance(Pointer_To_Entity( CYou),me)<500) 
	{
			 Pointer_To_Function( NextF, 0, 0, 0);
	 }
	vec_set( point_move.x, my._target_x);
	if ( EDistance(point_move,me)<20) 
	{
		temp.x = FindNext2Hum(Pointer_To_Entity( CYou));
		if (temp.x==0)
		{
		 wait(10);
		}else
		{
			if (temp.x==1)
			{
			 Pointer_To_Function( NextF, 0, 0, 0);
			}
		}
	}

	if (my._health < 0)
	{
		pointer_to_function( FailFunc,0,0,0);
		return;
	}

	if (my.flag5)
	{
		GoWithPlayer();
		return;
	}
	wait(1);
}
}



//@  general use this function to escape to the humer if the player did not 
//@  arrest him.
function EscapeToHumer()
{
	showmessage(10,181);
	PlayerGotGeneral = 0;
	my.flag5  = 0;
	my.flag6  = 1;
	PathToParam( GHidPoint, Function_To_Pointer( "hMisionfail"), Function_To_Pointer( "GeneralDie"));
}

/* ------------------------------------------------------------------------------------------------- */

//@ firest wait, responsible of surrender frames.
function GeneralWaiting()
{	
	while (player == null)
	{
		wait(1);
	}
	
	my.FrameAnim = 0;
	ent_cycle("BWsur" ,my.FrameAnim );
	while (my.flag5 == 0)
	{
		if (vec_dist(my.pos ,player.pos) < 300) && (my.flag2 == 0)
		{
			MisionsMsg1.ambient = -100;
			MisionsMsg2.visible = 1;			
			myShowmessions();

			my.flag2 = 1;
			HumveGoGo = 1;
			
			stop_sound(GSoundPlaying);
			showmessage(1,185);
			play_entsound(my,S_M_HM5_19,__GeneralVolume);			
			GSoundPlaying = result;

			showmessage(1,179);
			my.FrameAnim =0;
		}
		
		if (my.flag2 == 1)
		{
			ent_cycle("Bsur" , my.FrameAnim);
			my.FrameAnim += speed/25;
		}
		
		if (my._health < 0)
		{
			GeneralDie();
			return;
		}
		wait(1);
	}

	my.flag2 = 0;
	//my.flag5 = 0;

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

function GeneralArrow()
{
	my.skill25 = Entity_To_Pointer(you);
	my.tilt = 180;
	my.skill30 = 1;
	
	while (1)
	{
		you = Pointer_To_Entity(my.skill25);
		
		temp.x = 0;
		temp.y = 0;
		temp.z = you.max_z +30;
		vec_rotate(temp,you.pan);
		vec_add(temp,you.pos);
		vec_set(my.pos,temp);
		
		if (PlayerGotGeneral)
		{
			my.invisible = on;
		}
		else
		{
			my.invisible = off;
		}
		if (DrivingGame)
		{
			remove(my);
			return;
		}
		
		my.skill40 +=1;
		if (my.skill40 > 5)
		{
			my.skill40 = 0;
			if (my.skill30 == 1)
			{
				my.scale_x = 0.1;
				my.scale_y = 0.1;
				my.scale_z = 0.1;			
				my.skill30 *= -1;
			}
			else
			{
				my.scale_x = 0.2;
				my.scale_y = 0.2;
				my.scale_z = 0.2;
				my.skill30 *= -1;
			}
		}

		
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */


action TheGeneral
{	
	General = Entity_To_Pointer(my);
	
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my.passable  = 1;
	my._health = 200;
	my.GotHit  = 0;
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = _type_soldier;
	my.event = GeneralEvent;		
	my.CollFunction = Function_To_Pointer("ComparsCollision");	
	
	ent_frame("DnSr" ,0 );
//	sonar(my,1000);
//	my.z = target.z +abs(my.min_z);

	my.invisible = 0;
	
	temp.x = 0;
	temp.y = 0;
	temp.z = my.max_z + 30;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);
	create(<arrow.mdl>,temp,GeneralArrow);

	GeneralWaiting();
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Mariam Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////

define hm161 , <m16-1.tga>;
define hm162 , <m16-2.tga>;
sound hm16fire , <m16fire.wav>;

var HamerSol = 0;
var JeepSold = 0;


function MrSoldrGunFlash()
{		
	
	my.scale_x = 0.09;
	my.scale_y = 0.09;
	my.scale_z = 0.09;
	my.alpha = 50;
	wait (1);
	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */

function MrSoldierFlash()
{
	if (int(random(2)) == 1)
	{
		play_entsound(my,hm16fire,500);
	}
	
	vec_for_vertex(temp,me,215);	
	if (my.skill15 == 1)
	{ 		
		create(hm161,temp,MrSoldrGunFlash); 
	}
	else
	{ 		
		create(hm162,temp,MrSoldrGunFlash); 
	}
	my.skill15 = -my.skill15;
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function control the visibility of mariam soldiers
function MrSoldAction()
{	
	//@ look at mariam
	you = Pointer_To_Entity(MariamP);
	temp.x= you.x - my.x ;
	temp.y= you.y - my.y ;
	temp.z= you.z - my.z ;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;
	
	my.skill20 = 1;	
	while (1)
	{			
		ent_cycle("1shot" ,my.skill20 );		
		my.skill20 += speed/10;
		MrSoldierFlash();
										
		if (my.flag1 == 1)
		{
			exclusive_entity;
			morph (<vkdie.mdl>,my);
			my.skill20 = 0;
			while (my.skill20 < 100)
			{
				ent_frame("head" ,my.skill20 );
				my.skill20 += speed/30;
				wait(1);
			}

			wait(30);
			my.invisible = 1;
			morph (<vkm16.mdl>,me);
			
			while (my.flag1 == 1)
			{
				wait(1);
			}
			
		}		
		my.invisible = 0;						
		
		
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

action MariamSoldier
{		
	my.invisible = 1;
	my.passable  = 1;	
	sonar(my,500);
	my.z = target.z +abs(my.min_z);
	wait(2);		
	you = Pointer_To_Entity(MariamP);
	if (my.skill1 == 1)
	{
		you.skill25 =Entity_To_Pointer(my);
	}
	else
	{
		you.skill30 = Entity_To_Pointer(my);
	}
	MrSoldAction();		
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

function MariamMessages()
{	
	while (1)
	{
		wait(550 + random(100));
		
		while (my.flag3 == 1)
		{
			wait(1);
		}
		
		if (int(random(2)) == 1)
		{		
			Play2DSound(1);
		}
		else
		{		
			Play2DSound(2);	
		}		
	}
}

/* ------------------------------------------------------------------------------------------------- */

sound MMs99fire,<s99fire.wav>;
function MrCoverAhmed()
{	
	my.pan = 300;
	my._enem_count = 0;
	while (1)
	{		
		ent_cycle("1run",my.FrameAnim);
		my.FrameAnim += speed/25;
		
		temp.x =speed/25;
		temp.y =0;
		temp.z =0;
		move(my ,temp ,nullvector);		
		sonar(my,1000);		
		my.z = target.z +abs(my.min_z);
			
		my._enem_count +=1;
		if (my._enem_count > 20)
		{
			my._enem_count =0;
			my.FrameAnim = 0;
			while (1)
			{
				my._enem_count +=1;				
				
				if (my._enem_count > 100)
				{
					my.PathId = -1;
					my.pan = 180;
					ent_waypoint(my._target_x,8);
					my.skill20 = -1;
					MarShooting();
					return;
				}
								
				ent_frame("1shot",my.FrameAnim);
				my.FrameAnim += speed/20;
				if (my.FrameAnim > 60)
				{
					MariamFlash();
					my.FrameAnim = 0;
				}

				if (frc(my._enem_count/25) == 0)
				{
					my.pan =300 + random(30);
				}
				
				wait(3);
			}
		}


		if (DrivingGame)
		{
			return;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

function CheckMarNewTar()
{
if (my.PathId==7)||(my.PathId==8)
{
	my.PathId=0;
	ent_waypoint( my._target_x, my.PathId);
	return;
}

if (my.PathId <= 3)
{
	my.PathId -= 1;
	ent_waypoint( my._target_x, my.PathId);
	return;
}

if (my.PathId > 3)
{
	my.PathId += 1;
	ent_waypoint( my._target_x, my.PathId);
	return;
}

}

function MariamGotoCarDoor()
{
	my.FrameAnim = 0;
	my.passable  = 1;
	var s = 1;
	my.PathId = int(frc(my.PathId/8)*8)+1;

	while (1)
	{
		// 17 18 19
		ent_cycle("1run",my.FrameAnim);
		my.FrameAnim += speed/25;
		if ( my.SoundWR==0)
		{
			if (s)	{ s = 0;play_entsound(me,stepmod01,300);}
			else	{ s = 1;play_entsound(me,stepmod02,300);}			
			my.SoundWR=-100; 
		}
		my.SoundWR+=10;

		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = 0;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,30*(speed/200));
		temp.x = min( vec_length( temp), speed/50);
		temp.y = 0;
		temp.z = 0;
		move(me ,temp ,nullvector);
		sonar(my,1000);
		my.z = target.z +abs(my.min_z);
		
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{
			if (my.PathId<=0)
			{
				break;
			}
				CheckMarNewTar();	
		}
	wait(1);
	}
removecoll(my);
remove(my);
}

function MariamFlash()
{
	play_entsound(my,MMs99fire,400);
	Short_GunFlash(me,27, 12);	
	vec_for_vertex ( p, my, 27);
	p2.x = 10000;
	p2.y = 0;
	p2.z = 0;
	my_angle.pan = my.pan + random(20)-10;
	my_angle.tilt = random(20)-10;
	vec_rotate( p2, my_angle);
	vec_add( p2, my.pos);
	Blt_Line();
}

function MariamShot(RandDist)
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
		damage = 50;
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

	}else
	{
		my_angle.x = random(10)-5;
		my_angle.y = random(10)-5;
		vec_add( my_angle, my.pan);
		my._signal = 0;
	}

	SecondPoint.x =  10000;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, FirstPoint);
	my.epassable = 1;
	gun_shot_Damge();
	my.epassable = 0;

	you = me;
	me = pointer_to_entity( my.enemyid);
	if (me)
	{
		my.AnimDie = IHeadDie;
		my.string2 = AllAnimations[ IDownHit];
		guifunction = my.event;
		indicator = _gunfire;
		event_type = event_shoot;
		guifunction();
	}
}

function Marsee( Vnum, him)
{
	var res;
	var lastpass;
	entiy = him;
	if (entiy==0)
	{
		return(0);
	}
	lastpass = entiy.passable;
	entiy.passable = 0;
	trace_mode = ignore_me + ignore_passable + ignore_passents + ignore_sprites;
	vec_for_vertex( temp, my, Vnum);
	you = 0;
 	res = trace( temp, entiy.pos);
	entiy.passable = lastpass;
	res = (you == entiy);
	return(res);
}

function MarShooting()
{	
	//my.PathId =0;
	my.FrameAnim = 0;
	var s = 1;
	while (1)
	{
		// 17 18 19
		ent_cycle("1run",my.FrameAnim);
		my.FrameAnim += speed/25;
		if ( my.SoundWR==0)
		{
			if (s)	{ s = 0;play_entsound(me,stepmod01,300);}
			else	{ s = 1;play_entsound(me,stepmod02,300);}			
			my.SoundWR=-100; 
		}
		my.SoundWR+=10;

		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,30*(speed/200));
		temp.x = speed/25;
		temp.y = 0;
		temp.z = 0;
		move(me ,temp ,nullvector);
		sonar(my,1000);
		my.z = target.z +abs(my.min_z);
		if (vec_dist(my.x ,my._target_x) < 30)
		{					
			ent_nextpoint(my._target_x);

			my.PathId += 1;			 
			if (my.PathId == 8)
			{
				my.pan = 0;
				you = Pointer_To_Entity(my.skill25);
				you.flag1 = 1;
				you = Pointer_To_Entity(my.skill30);
				you.flag1 = 1;				
				MrCoverAhmed();
				return;
			}
			
			//@ fire on Jeep
			my.FrameAnim = 0;
			if (my.PathId == 1) || (my.PathId ==7)
			{				
				you = Pointer_To_Entity(my.skill30);
				you.flag1 = 0;
				my.pan = 58 + random(15);

				my.skill1= 0;
				my._signal = 0;
				while (my.skill1 < 25 )
				{
					my.skill1 += 1;					
					ent_frame("1shot",my.FrameAnim);
					my.FrameAnim += speed/20;
					if (my.FrameAnim > 60)
					{
						my.FrameAnim = 0;
						MariamFlash();
						MariamShot(0);
					}
					
					wait(3);
				}
				you = Pointer_To_Entity(my.skill30);
				you.flag1 = 1;
			}

			//@ fire on Humve
			my.FrameAnim = 0;
			if (my.PathId == 4) || (my.PathId == 5)  
			{												
				you = Pointer_To_Entity(my.skill25);
				you.flag1 = 0;
				
				my.pan = 230 + random(15);

				my.skill1 = 0;				
				my._signal = 0;
				while (my.skill1 < (100 + random(100)) )
				{
					my.skill1 += 1;
					
					ent_frame("1shot",my.FrameAnim);
					my.FrameAnim += speed/20;
					if (my.FrameAnim > 60)
					{
						MariamFlash();
						MariamShot(0);
						my.FrameAnim = 0;
					}					
					wait(1);
				}
				you = Pointer_To_Entity(my.skill25);
				you.flag1 = 1;
				//HamerSoldDie = 1;
			}
			my.FrameAnim = 0;

		}
		
		
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */
function MariamEvent()
{
	if event_type == event_detect && you._type == _type_soldier && indicator == _watch
	{
		if (Entity_To_Pointer( you) == General)
		{
			return;	
		}
		/*var laste;
		var lastev;
		lastev = Marsee(27, pointer_to_entity(my.EnemyId));
		laste = my.EnemyId;*/

		if(Marsee(27, you)) 
		{
			my.EnemyId = Entity_To_Pointer( you);
			my._signal = _detecte_enemy;
			/*if (lastev)
			{
				entiy = pointer_to_entity(laste);
				if (entiy)
				{
				 if (edistance( entiy, me)>=edistance( you, me))
				   {
					my._signal = _detecte_enemy;
				   }
				}else
				{
					my._signal = _detecte_enemy;
				}
			}else
			{
				my._signal = _detecte_enemy;
			}*/
			
		}
		/*if (my._signal != _detecte_enemy)
		{
			my.EnemyId = laste;
		}*/
		return;
	}
}

function turntimyfriend(frnd)
{
	you = frnd;
	temp.x = you.x - my.x;
	temp.y = you.y - my.y;
	temp.z = you.z - my.z;
	vec_to_angle(my_angle,temp);
	temp.x = 100- (min( 50, max( -50, ang( my_angle- my.pan)))+50);
	ent_frame( "TarTurn" , temp.x);
}

action Mariam
{	
	ent_frame( "TarTurn" , 0);
	MariamP = Entity_To_Pointer(my);
	wait(8);
	wait(10);
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;	
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my.passable  = 1;
	my._health = 200;
	my.GotHit = 0;
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = _type_Soldier;
	my.event = MariamEvent;	
	my.CollFunction = Function_To_Pointer("ComparsCollision");
	
	sonar(my,1000);
	my.z -= result;
	ent_path ("mrpath");
	ent_waypoint(my._target_x,1);
		
	myShowmessions();
	wait(5);

	showmessage(1,139);
	Play3DSound(1);
		
	while (snd_playing(3DSPlaying) == 1)&&(DrivingGame==0)
	{
		turntimyfriend(player);
		wait(1);
	}
		
	MariamMessages();
	MarShooting();
	
	while (1)
	{
		if (DrivingGame)
		{
			exclusive_entity;
			wait(1);
			you = pointer_to_entity( my.skill25);
			if (you != null)
			{
				removecoll(you);
				remove(you);
			}
			you = pointer_to_entity( my.skill30);
			if (you != null)
			{
				removecoll(you);
				remove(you);
			}
			MariamGotoCarDoor();
		break;
		}
		//create3DEline();
		you = Pointer_To_Entity(my.enemyid);
		if (you==0)
		{
				my._signal = 0;

		}else
		{
			if ( you._health < -200)||(Marsee(27,you)==0)
			{
				my._signal = 0;
			}
		}

		if ( my._signal == 0)
		{
			temp.pan = 360;
			temp.tilt = 360;
			temp.z = 1000;
			indicator = _watch;
			scan (my.x,my.pan,temp);
		}
		
		wait(1);
	}

}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//				player fucntions 
//
///////////////////////////////////////////////////////////////////////////////////////////////////

//@ used by player for scaning things.
action FollowPlayer
{		
	my.passable = on;
	my.invisible = on;
	while (player == null)
	{
		wait(1);
	}
	
	while (1)
	{				
		vec_set(my.pos,player.pos);
		vec_set(my.pan,player.pan);	
		if(PressedKeys[Key_Use] == 1)
		{
			temp.pan = 180;
			temp.tilt = 180;
			temp.z = 200;
			indicator = _handle;
			scan (my.pos,my.pan,temp);
			indicator = 0;
		}					
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

define __POutOfRange = 2500;
define __PTooOutOfRange = 3100;

action CheckPlayerpos()
{					
	while (player == null)
	{
		wait(1);
	}
	
	my.skill25 = 350;
	while (1)
	{				
		
		if (DrivingGame)
		{
			return;
		}
		object5.visible = PlayerGotGeneral;
		//@ Campas things
		you = Pointer_To_Entity(General);
		if (you != 0)
		{
			ObjecPos.frame = 1;
			temp.x = you.x - player.x;
			temp.y = you.y - player.y;
			temp.z = you.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos.roll = player.pan - temp.pan;
		}else
		{
			ObjecPos.frame = 2;
		}
		
		if (vec_dist(my.pos ,player.pos ) > __POutOfRange)
		{
			my.skill25 +=1;
			if (my.skill25 > 700)
			{
				my.skill25 = 0;
				showmessage(10,144);
				Play2DSound(4);
			}
		}

		if (vec_dist(my.pos ,player.pos ) >__PTooOutOfRange)
		{
						
			showmessage(1,183);
			wait(3);
			
			hMisionfail();
			
			return;
		}
		wait(1);
	}
}




