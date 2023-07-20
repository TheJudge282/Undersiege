///////////////////////////////////////////////////////////////////////////////////
// A5 main wdl
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
	layer = 6;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = -20;
}


entity splashscreen
{
	type = <Lev3Load.bmp>;
	view = camera;
	layer = 5;
	flags = visible;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = 0;
}

path <music>;
path <sounds>;
path <weapons>;
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
include <hanigrande.wdl>;


var video_mode = 7;
var video_depth = 16;

string level_str = <level3l.WMB>; // give file names in angular brackets
sound StartSound , <LT_03.wav>;

function main()
{
	play_sound(StartSound,100);
	StartSoundH = result;
	
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;

	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
	initilization();
	VWeaponSprite1.skin = 15;
	object1.skin = 9;
	fog_color = 1;
	camera.fog = 8;
	MyMain();
}

function SetViewBright(CMBr)
{
	camera.ambient = CMBr-100;
	blackface.alpha = abs(min(0, camera.ambient)/3);
}





/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//                        my decleration                                   //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////


//   SaeedResquWounded ==> Saeed Carry Woumded to Ambulance
//   Car_Escape        ==> Car Escape with somke going out of it
//   Tank_InComing     ==> The tank come...


define __MisOffSet = -0.2;
function MyMain()
{	
	EscapeToCar();
	MisionsMsg1.z += __MisOffSet;
	MisionsMsg2.z += __MisOffSet;
	MisionsMsg3.z += __MisOffSet;
	MisionsMsg4.z += __MisOffSet;
	
	MisionsMsg1.visible = 0;
	MisionsMsg2.visible = 0;
	MisionsMsg3.visible = 0;
	MisionsMsg4.visible = 1;
	while (player == null)
	{
	wait(1);
	}
	myShowmessions();

	wait(50);
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	
}

sound S_M_L3_02 , <M_L3_02.wav>;
sound S_M_L3_03 , <M_L3_03.wav>;
sound S_M_L3_04 , <M_L3_04.wav>;
sound S_M_L3_06 , <M_L3_06.wav>;
sound S_M_L3_07 , <M_L3_07.wav>;
sound S_M_L3_08 , <M_L3_08.wav>;
sound S_M_L3_09 , <M_L3_09.wav>;
sound S_M_L3_10 , <M_L3_10.wav>;
sound S_M_L3_11 , <M_L3_11.wav>;
sound S_M_L3_12 , <M_L3_12.wav>;
sound S_M_L3_13 , <M_L3_13.wav>;
sound S_M_L3_14 , <M_L3_14.wav>;
sound S_M_L3_15 , <M_L3_15.wav>;
sound S_M_L3_16 , <M_L3_16.wav>;
sound S_M_L3_18 , <M_L3_18.wav>;
sound S_M_L3_19 , <M_L3_19.wav>;
sound S_M_L3_21 , <M_L3_21.wav>;
sound S_M_L3_23 , <M_L3_23.wav>;
sound S_M_L3_25 , <M_L3_25.wav>;
sound S_M_L3_27 , <M_L3_27.wav>;
sound S_M_L3_30 , <M_L3_30.wav>;
sound S_M_L3_31 , <M_L3_31.wav>;
sound S_M_L3_32 , <M_L3_32.wav>;

sound S_M_L3_35 , <M_L3_35.wav>;
sound S_M_L3_36 , <M_L3_36.wav>;
sound S_M_L3_38 , <M_L3_38.wav>;

sound S_M_L3_41 , <M_L3_41.wav>;
sound S_M_L3_42 , <M_L3_42.wav>;

define MaenSoundV = 800;
var Tank_InComing = 0;
string f_man,<f_man.mdl>;
var TankMove = 0;
var RiotPoliceGo = 0;
var LDoor = 0;
function start_level()
{	
	return;		
}


action TakeCareOfPlayer
{
	my.invisible = 1;
	my.passable = 1;
	while (player == null)
	{
		wait(1);
	}

	while (1)
	{				
		//if (my.skill1 == 1)
		//{
		//	test_num1 = vec_dist(my.pos ,player.pos);
		//}
		//else
		//{
		//	if (my.skill1 == 2)
		//	{
		//	test_num2 = vec_dist(my.pos ,player.pos);
		//	}
		//	else
		//	{
		//	test_num3 = vec_dist(my.pos ,player.pos);
		//	}
		//	
		//}
		
		if (vec_dist(my.pos ,player.pos) < my.skill2)
		{
			BomInPlayerHand.z  = 1;
		}
		
		wait(1);
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//					Door Function
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundPlaying);
	stop_sound(S2DPlayeing);
}

function CameraCarier()
{
	my.passable = 1;
	my.visible = 0;
	ent_path("CameraPath");
	ent_waypoint(my._target_x,2);
	while (1)
	{		
		temp.x= my._target_x - my.x;
		temp.y= my._target_y - my.y;
		temp.z= my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,1);
		
		temp.x = 0;
		temp.y = 0;
		temp.z = 60;
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);
		vec_set(camera.pos,temp);
		camera.pan = my.pan;
		
		temp.x = speed/100;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector);
		sonar(my,500);
		my.z = target.z +abs(my.min_z) + 15;
		
		if (vec_dist(my.x ,my._target_x ) < 60)
		{
			ent_nextpoint(my._target_x);
		}

		wait(1);
	}	
}

function Doflashing()
{
	BlackScreen.visible = 1;
}

function VictoryCamera()
{
	//ObjecPos.visible = 0;	
	outcompass.visible = 0;
	EnemyPos.visible = 0;
	Compass.visible = 0;
	HldBk.visible = 0;
	HldSld.visible = 0;
	//ObjecPos1.visible = 0;		
	VWeaponSprite1.visible = 0;
	looprun=0;
	mesges.visible = 0;

	camra2player = 0;
	temp.x = player.x;
	temp.y = player.y;
	temp.z = player.z;

	create(<point1.mdl>,temp,CameraCarier);
	you.pan = 0;
	camera.pan = 0;
	camera.tilt = 0;
	CloseSong(CurrentSong);
	RemoveAllKeys();
	PreesNextLvl.visible = 1;
	Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));
	wait(10);
	on_enter = finalization;
}

/* ---------------------------------------------------------------------------------------------- */  
sound DoorOpen ,<dooropen.wav>;
sound DoorClose , <doorclose.wav>;
sound DoorSealed , <doorsealed.wav>;
var housedoor = 0;
define __doorsoundvol = 900;
function DoorEvent()
{
	//if (LDoor == 0)
	//{
	//	return;
	//}
	
	if (event_type == event_scan) && (indicator == 980) && (my.flag1 == 0)
	{								
		my.flag1 = 1;
		showmessage(10,164);				
	}
	
	if (event_type == event_scan) && (indicator == _handle)
	{				
		
		if ((my.flag3 == 0) || (player.y < -6420) ) && (Ldoor == 1)
		{		// 6417
			my.event = null;
			if (player.y < -6420)
			{			
				//@ player in house
				play_entsound(my,DoorOpen,__doorsoundvol);
				while (my.pan < 90)
				{
					my.pan += 3;
					wait(1);
				}
				wait(100);
				
				while (my.pan > 0)
				{
					my.pan -= 3;
					wait(1);
				}
				play_entsound(my,DoorClose,__doorsoundvol);			
			}	
			else
			{
				//@ player out of the house.
				play_entsound(my,DoorOpen,__doorsoundvol);
				while (my.pan > -90)
				{
					my.pan -= 3;	
					wait(1);
				}			
				wait(100);			
				
				while (my.pan < 0)
				{
					my.pan += 3;
					wait(1);
				}
				play_entsound(my,DoorClose,__doorsoundvol);
			}							
			my.event = DoorEvent;
		}
		else
		{
			if (snd_playing(housedoor) == 0)
			{
				play_entsound(my,DoorSealed,__doorsoundvol);
				housedoor=result;
			}
			
		}
	}
}

/* ---------------------------------------------------------------------------------------------- */    

action my_new_door
{
	wait(25);
	my.enable_scan = on;
	my.event = DoorEvent;
	my.flag3 = 0;
	
	while (1)
	{
		if (my.flag1 == 1)
		{
			my.skill30 +=1;
			if (my.skill30 > 400)				
			{
				my.skill30 = 0;
				 my.flag1 = 0;
			}
		}
		if (RiotPoliceGo ==1) && (player.y > -6417)
		{
			my.flag3 = 1;
			break;
		}
		wait(1);
	}
}


/////////////////////////////////////////////////////////////////////////////
//  
//				Comon Functions
//
/////////////////////////////////////////////////////////////////////////////


function Play2DSound(iStateNumber)
{
	if (playerded == 1)
	{
		return;
	}
	stop_sound(S2DPlayeing);
	
	if (iStateNumber == 8)
	{
		play_sound(S_M_L3_09,MaenSoundV);
		S2DPlayeing = result;
		return;
	}
	if (iStateNumber == 11)
	{
		
		play_sound(S_M_L3_30,100);
		S2DPlayeing = result;
		while (1)
		{
			if (snd_playing(S2DPlayeing) == 0)
			{
				break;
			}
			wait(1);
		}
		showmessage(3,139);
		play_sound(S_M_L3_11,100);
		S2DPlayeing = result;
		return;
	}
	if (iStateNumber == 14)
	{		
		showmessage(5,142);						
		play_sound(S_M_L3_14,100);
		S2DPlayeing = result;
		while (snd_playing(S2DPlayeing) == 1)
		{
			wait(1);
		}
		showmessage(5,141);
		play_sound(S_M_L3_13,100);
		S2DPlayeing = result;		
		while (snd_playing(S2DPlayeing) == 1)
		{
			wait(1);
		}
		
		
	}
	
	if (iStateNumber == 23)
	{
		play_sound(S_M_L3_36,100);
		S2DPlayeing = result;
		return;
	}
	
	if (iStateNumber == 25)
	{
		showmessage(5,143);
		play_sound(S_M_L3_15,MaenSoundV);
		S2DPlayeing = result;
		while (snd_playing(S2DPlayeing) == 1)
		{
			wait(1);
		}
		
		showmessage(5,146);
		play_sound(S_M_L3_19,100);
		S2DPlayeing = result;
		return;
	}
	

}

/* ---------------------------------------------------------------------------------------------- */    

function PlayMySounds(iStateNumber,iMessagNumber)
{
	if (playerded == 1)
	{
		return;
	}
	//if (snd_playing())
	//{
	//}
	stop_sound(SoundPlaying);
	if (iStateNumber == 1)
	{
		play_entsound(me,S_M_L3_08,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 2)
	{
		play_entsound(me,S_M_L3_02,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 3)
	{
		play_entsound(me,S_M_L3_21,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	//if (iStateNumber == 4)
	//{
	//	play_entsound(me,S_M_L3_43,MaenSoundV);
	//	SoundPlaying = result;
	//	return;
	//}
	if (iStateNumber == 5)
	{
		play_entsound(me,S_M_L3_36,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 6)
	{
		play_entsound(me,S_M_L3_38,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 7)
	{
		if (iMessagNumber == 1)
		{
			play_entsound(me,S_M_L3_03,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		if (iMessagNumber == 2)
		{
			play_entsound(me,S_M_L3_02,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		if (iMessagNumber == 3)
		{
			play_entsound(me,S_M_L3_27,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		
	}
	
	if (iStateNumber == 9)
	{
		play_entsound(me,S_M_L3_10,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 10)
	{
		play_entsound(me,S_M_L3_07,MaenSoundV);
		SoundPlaying = result;
		//while (snd_playing(SoundPlaying))
		//{
	//	/	wait(1);
	//	}
	//	wait(3);
	//	play_entsound(me,S_M_L3_06,MaenSoundV);
	//	SoundPlaying = result;
		return;
	}
	
	if (iStateNumber == 12)
	{
		play_entsound(me,S_M_L3_12,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 13)
	{
		play_entsound(me,S_M_L3_13,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	
	//if (iStateNumber == 15)
	//{
	//	if (iMessagNumber == 1)
	//	{
	///		play_entsound(me,S_M_L3_40,MaenSoundV);
	//		SoundPlaying = result;
	//		return;
	//	}
	//	if (iMessagNumber == 2)
	///	{
	//		play_entsound(me,S_M_L3_31,MaenSoundV);
	//		SoundPlaying = result;
	//		return;
	//	}
		
	//}
	if (iStateNumber == 16)
	{
		play_entsound(me,S_M_L3_32,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 17)
	{
		play_entsound(me,S_M_L3_35,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	
	
	if (iStateNumber == 20)
	{
		if (iMessagNumber == 1)
		{
			play_entsound(me,S_M_L3_40,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		if (iMessagNumber == 2)
		{
			play_entsound(me,S_M_L3_04,MaenSoundV);
			SoundPlaying = result;
			return;
		}		
	}
	if (iStateNumber == 21)
	{
		//play_entsound(me,S_M_L3_20,MaenSoundV);
		return;
	}
	if (iStateNumber == 22)
	{
		play_entsound(me,S_M_L3_18,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	
	if (iStateNumber == 24)
	{
		play_entsound(me,S_M_L3_43,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 25)
	{
		play_entsound(me,S_M_L3_19,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 26)
	{
		play_entsound(me,S_M_L3_43,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 27)
	{
		if (iMessagNumber == 1)
		{
			play_entsound(me,S_M_L3_33,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		if (iMessagNumber == 2)
		{
			play_entsound(me,S_M_L3_40,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		
	}
	if (iStateNumber == 28)
	{
		play_entsound(me,S_M_L3_42,MaenSoundV);
		SoundPlaying = result;
		return;
	}
	if (iStateNumber == 29)
	{
		if (iMessagNumber == 1)
		{
			play_entsound(me,S_M_L3_25,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		if (iMessagNumber == 2)
		{
			play_entsound(me,S_M_L3_27,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		if (iMessagNumber == 3)
		{
			play_entsound(me,S_M_L3_23,MaenSoundV);
			SoundPlaying = result;
			return;
		}
		if (iMessagNumber == 4)
		{
			play_entsound(me,S_M_L3_16,MaenSoundV);
			SoundPlaying = result;
			return;
		}		
	}

	if (iStateNumber == 30)
	{
		play_sound(S_M_l3_15,100);
		SoundPlaying = result;
	}
}

/* ---------------------------------------------------------------------------------------------- */    

function random_skin2()
{
	var rn;
	rn = int(random(7));
	if (rn == 0) { my.skin = 9; return;}
	if (rn == 1) { my.skin = 10; return;}
	if (rn == 2) { my.skin = 11; return;}
	if (rn == 3) { my.skin = 12; return;}
	if (rn == 4) { my.skin = 14; return;}
	if (rn == 5) { my.skin = 15; return;}
	if (rn == 6) { my.skin = 16; return;}
	if (rn == 7) { my.skin = 17; return;}
}

/* ---------------------------------------------------------------------------------------------- */    

function random_skin()
{
	var rn;
	rn = int(random(7));

	if (rn == 0) { my.skin = 1; return;}
	if (rn == 1) { my.skin = 2; return;}
	if (rn == 2) { my.skin = 3; return;}
	if (rn == 3) { my.skin = 4; return;}
	if (rn == 4) { my.skin = 5; return;}
	if (rn == 5) { my.skin = 6; return;}
	if (rn == 6) { my.skin = 7; return;}
	if (rn == 7) { my.skin = 8; return;}
}


/////////////////////////////////////////////////////////////////////////////
//
//                         Compars Functions                               
//
/////////////////////////////////////////////////////////////////////////////

var woumded_man;
var SaeedResquWounded = 0;

sound fight01 , <fight01.wav>;
sound fight02 , <fight02.wav>;
sound fight03 , <fight03.wav>;
sound fight04 , <fight04.wav>;
sound fight05 , <fight05.wav>;
sound fight06 , <fight06.wav>;
sound fight07 , <fight07.wav>;
sound fight08 , <fight08.wav>;
sound fight09 , <fight09.wav>;
sound fight10 , <fight10.wav>;

define __ComSound = 250;
function ComparsSound()
{
	if (camra2player == 0)
	{
		return;
	}
	my.skill25 = int(random(9));
	if (my.skill7 == 0)
	{
		play_entsound(my,fight01,__ComSound);
		return;			
	}
	
	if (my.skill7 == 1)
	{	
		play_entsound(my,fight02,__ComSound);
		return;	
	}
	
	if (my.skill7 == 2)
	{
		play_entsound(my,fight03,__ComSound);
		return;	
	}
	
	if (my.skill7 == 3)
	{	
		play_entsound(my,fight04,__ComSound);
		return;	
	}
	
	if (my.skill7 == 4)
	{
		play_entsound(my,fight05,__ComSound);
		return;	
	}
	
	if (my.skill7 == 5)
	{
		play_entsound(my,fight06,__ComSound);
		return;	
	}
	
	if (my.skill7 == 6)
	{
		play_entsound(my,fight07,__ComSound);
		return;	
	}
	
	if (my.skill7 == 7)
	{
		play_entsound(my,fight08,__ComSound);
		return;	
	}
	
	if (my.skill7 == 8)
	{	
		play_entsound(my,fight09,__ComSound);
		return;	
	}
	
	if (my.skill7 == 9)
	{	
		play_entsound(my,fight10,__ComSound);
		return;	
	}

}

/* ------------------------------------------------------------------------ */

function HeartPlayerShowCompas(Damage)
{
	you = player;
	HeartPlayer(Damage);
	temp.x = my.x - player.x;
	temp.y = my.y - player.y;
	temp.z = 0;
	vec_to_angle( my_angle, temp);
	ShowEnemyPos(ang(my_angle.pan));
}

function MoveCompars(FrameSec,DesCoverd,UseSmoothAng)
{
	if ( my.SoundWR==0)&& (playerded == 0)
	{ 
		play_entsound(me,comparsstep,300);
		my.SoundWR=-100; 
	}
	my.SoundWR+=10;

	ent_cycle("run" ,my.FrameAnim );
	my.FrameAnim += speed/FrameSec;

	temp.x = my._target_x - my.x;
	temp.y = my._target_y - my.y;
	temp.z = my._target_z - my.z;
	vec_to_angle(my_angle,temp);
	
	if (UseSmoothAng)
	{
		my.pan = nearangle(my.pan,my_angle,20);
	}
	else
	{
		my.pan = my_angle.pan;
	}			
	temp.x = speed/DesCoverd;
	temp.y = 0;
	sonar(me,5000);
	temp.z = -result;
	move(me,temp,nullvector);
	if (result == 0)
	{
		return(0);
	}
	else
	{
		return(1);
	}
}





/* ------------------------------------------------------------------------ */

function ComparsDie()
{
	SolderCounter-=1;
	death_sound(1000);
	stop_sound(SoundPlaying);
	my._state = _state_die;
	RemoveColl(me);
	my.skill1=0;
	
	while (my.skill1<100)
	{		
		ent_frame("1DIE", my.skill1);						
		my.skill1 += 10*speed/200;
		wait(1);
	}
	play_sound( PlDed,100);
	h_PlDed = result;
	me = 0;
	messionfailed = 1;
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;
	remove(me);
}

/* ------------------------------------------------------------------------ */    

var CatsAndMiseGames = 0;
var MainRanNum = 1;
function CatsAndMise()
{	
my.FrameAnim =0;		
	while (CatsAndMiseGames == 1)
	{		
		my.pan = random(360);
		my.skill40 = 30 + int(random(20)) ;
		while (my.skill30 < my.skill40)
		{
			my.skill30 += 1;
						
			if (MoveCompars(25,25,1) == 0)
			{
				my.pan = random(180);
			}

			if (my._health <0)
			{
				Pointer_To_Function( my.DieEvent, 0, 0, 0);
				return;
			}
			wait(1);
		}
		
		my.FrameAnim = 0;
		my.pan = 270;
		while (1)
		{
			if (CatsAndMiseGames == 0)
			{
				break;
			}
			
			ent_cycle("2STON" ,my.FrameAnim );
			my.FrameAnim += speed/70;
			
			if (my._health <0)
			{
				Pointer_To_Function( my.DieEvent, 0, 0, 0);
				return;
			}
			wait(1);
		}
		
		wait(1);
	}

	
	wait(random(50));


//@ Go back to main path
	if (MainRanNum == 1)
	{
		if (my.skill7 == 1)
		{

			ent_path("entpath1");
			ent_waypoint(my._target_x,2);
		}

		if (my.skill7 == 2)
		{
			ent_path("entpath2");
			ent_waypoint(my._target_x,2);
		}

		if (my.skill7 == 3)
		{
			ent_path("entpath1");
			ent_waypoint(my._target_x,3);
		}

		if (my.skill7 == 4)
		{
			ent_path("entpath2");
			ent_waypoint(my._target_x,3);
		}

		if (my.skill7 == 5)
		{
			ent_path("entpath2");
			ent_waypoint(my._target_x,4);
		}
	}
	else
	{
		if (my.skill7 == 1)
		{
			ent_path("entpath2");
			ent_waypoint(my._target_x,2);
		}
		if (my.skill7 == 2)
		{
			ent_path("entpath1");
			ent_waypoint(my._target_x,2);
		}
		if (my.skill7 == 3)
		{
			ent_path("entpath2");
			ent_waypoint(my._target_x,3);
		}
		if (my.skill7 == 4)
		{	
			ent_path("entpath2");
			ent_waypoint(my._target_x,4);
		}
		if (my.skill7 == 5)
		{
			ent_path("entpath1");
			ent_waypoint(my._target_x,3);
		}
	}
	
	
	while (1)
	{	

		MoveCompars(25,25,1);
									
		if (CatsAndMiseGames == 1)
		{
			break;
		}

		if (my._health <0)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
			return;
		}
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{		
			if (my.skill7 == 1) 
			{
				if (MainRanNum == 1)
				{
					ent_path("stome4");
					ent_waypoint(my._target_x,2);
				}
				else
				{
					ent_path("stome2");
					ent_waypoint(my._target_x,1);
				}
				goto en1;
			}
			

			if (my.skill7 == 2) 
			{
				if (MainRanNum == 1)
				{
					ent_path("stome2");
					ent_waypoint(my._target_x,1);
				}
				else
				{
					ent_path("stome4");
					ent_waypoint(my._target_x,2);
				}
				goto en1;
			}
			

			if (my.skill7 == 3) 
			{
				if (MainRanNum == 1)
				{
					ent_path("stome1");
					ent_waypoint(my._target_x,1);
				}
				else
				{
					ent_path("stome5");
					ent_waypoint(my._target_x,1);
				}
				goto en1;
			}
			
			if (my.skill7 == 4) 
			{
				if (MainRanNum == 1)
				{
					ent_path("stome5");
					ent_waypoint(my._target_x,1);
				}
				else
				{
					ent_path("stome3");
					ent_waypoint(my._target_x,2);
				}
				goto en1;
			}

			if (my.skill7 == 5) 
			{
				if (MainRanNum == 1)
				{										
					ent_path("stome3");
					ent_waypoint(my._target_x,2);
				}
				else
				{
					ent_path("stome1");
					ent_waypoint(my._target_x,1);
				
				}
				goto en1;
			}

			en1:
			break;

		}
		wait(1);
	}
	

	StoneRuner();
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

function StoneRuner()
{
	//temp.x=0;
	//temp.y=360;
	//my_angle.x=10000;
	//my_angle.y=100;
	//my_angle.z=0;
	//my._state = _state_Walk;
	my.skill30 = 0;
	while (1)
	{		
		MoveCompars(25,25,1);
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{		
			ent_nextpoint(my._target_x);	
			//@ stop on ever point and throw stones
			my.pan = 270;	
			my.skill30 = 300 + int(random(60)) + int(random(20));
			my.FrameAnim = 0;
			
			my.skill31 = 0;
			my.skill33 = random(60);

			while(my.FrameAnim < my.skill30)
			{			
				
				my.skill31 +=1;
				if (my.skill31 > my.skill33)
				{
					my.skill31 = 0;
					my.skill33 = 20 + random(40);
					ComparsSound();
				}
				
				
				ent_cycle("2STON", my.FrameAnim);
				my.FrameAnim += speed/75;
															
				if (my._health <0)
				{
					Pointer_To_Function( my.DieEvent, 0, 0, 0);
					return;
				}

				if (CatsAndMiseGames == 1)
				{
					break;
				}
				wait(1);
			}									
		}		
		
		if (my._health < 0)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
			return;
		}
		
		if (CatsAndMiseGames == 1)
		{
			break;			
		}
		wait(1);
	}
	
	

	
	//@ move compars backwards
	if (int(random(2)) == 1)
	{
		ent_path("entpath2");
	}
	else
	{
		ent_path("entpath1");
	}
	ent_waypoint(my._target_x,1);

	my.FrameAnim = 0;
	while (1)
	{				
		if (MoveCompars(25,25,1) == 0)
		{
			break;
		}
				
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{		
			break;
		}

		wait(1);
	}

	CatsAndMise();
}

/* ------------------------------------------------------------------------ */

function RunningCompars()
{
	//temp.x=0;
	//temp.y=360;
	//my_angle.x=10000;
	//my_angle.y=100;
	//my_angle.z=0;
	
	my._state = _state_Walk;
	my.FrameAnim = 0;
	while (1)
	{
		
		MoveCompars(25,25,1);
		
		if (CatsAndMiseGames == 1)
		{
			my.flag5 = 1;
		}
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			my.skill30 = ent_nextpoint(my._target_x) ;
			
			if (my.flag5)
			{
				if (my.skill30 == 2)
				{
					remove(me);
					return;
				}
			}
			//if (my.skill30 == 8) 
			//{ 
		//		random_skin(); 
		//	}
		//	my.skill30 = 0;
		}
		
		if (my._health <0)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
			return;
		}

		//if (CatsAndMiseGames == 1)
		//{
			//CatsAndMise();
		//	return; 
		//}
		
		wait(1);
	}
	
	
}

/* ------------------------------------------------------------------------ */


function ComparsEvent()
{


//
//	if event_type == event_scan && indicator == _explode
//	{	
//		if (you.flag1)
//		{
//			my._health-=1000;
//		}
//		my.string2 = AllAnimations[ IDownHit];
//		my.GotHit = 100;
//		return;
//	}

	if event_type == event_scan && indicator == _gunfire && (my._state == _state_wait || my._state == _state_Walk )
	{	
		my.EnemyId = you.EnemyId;
		my._signal = _hear_fire;
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
		}
		return;
	}

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

function ComparsInitial()
{
	 sonar(my,500);
	 my.z = target.z +abs(my.min_z);

	 if ( my.ScaleCollision<=0)
	 {
		my.ScaleCollision = 1;
	 }
	 wait(10);
	 me.skill46 = -10;
	 me.Find_HidePoint = -10;
	 me._find_point_flag = -10;
	// my.passable = 1;
	 my.shadow = shadowenable;
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
	 my._health = 100;
	 my.GotHit = 0;
	 my._type = _type_compars;
	 my.enable_detect = 1;
	 my.enable_scan = 1;
	 my.event = ComparsEvent;

	 my.DieEvent = Function_To_Pointer( "ComparsDie");
	 my.HitEvent = Function_To_Pointer( "ComparsDie");
	 my.CollFunction = Function_To_Pointer( "ComparsCollision");
}

action Stone_compars()
{
	ComparsInitial();

	if (int(random(1)) == 0)
	{
		random_skin();
	}
	else
	{
		random_skin2();
	}
		   
	//ComparsScanForPlayer(); 

	if (my.defaultstate == 1)
	{
		ent_path("stone2");
		ent_waypoint(my._target_x,1);
		StoneRuner();
		return;
	}    
	if (my.defaultstate == 2)
	{
		ent_path("stone5");
		ent_waypoint(my._target_x,1);
		StoneRuner();
		return;
	}            
	if (my.defaultstate == 3)
	{
		ent_path("stone3");
		ent_waypoint(my._target_x,1);
		StoneRuner();
		return;
	}    
	if (my.defaultstate == 4)
	{
		ent_path("Stone1");
		ent_waypoint(my._target_x,1);
		StoneRuner();
		return;
	}
	if (my.defaultstate == 5)
	{
		ent_path("stone4");
		ent_waypoint(my._target_x,1);
		StoneRuner();
		return;
	} 
	



	if (my.defaultstate == 20)
	{
		if (int(random(2)) == 1) 
		{ 
			ent_path("from_y_3");  
		}
		else
		{
			ent_path("from_y_4");  
		}
		ent_waypoint(my._target_x,1);
		RunningCompars();
	}

	if (my.defaultstate == 21)
	{
		if (int(random(2)) == 1) 
		{ 
			ent_path("from_y_1");  
		}
		else
		{ 
			ent_path("from_y_2");  
		}    
    
	}
	
	
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

function ImHurt()
{
	woumded_man = Entity_To_Pointer(my);
	my.skill30 = 75;
	my.skill31  = 1;

	while (1)
	{
		ent_frame("leg" , my.skill30);
		my.skill30 += my.skill31;
		if (my.skill30 > 100) 
		{ 
			my.skill31 = -0.3; 
		}
		if (my.skill30 < 70) 
		{ 
			my.skill31 = 0.3;  
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */    

action wounded
{
//@ this function controll the wonded man on the floar.

	sonar(my,500);
	my.z = target.z +abs(my.min_z);
	my.passable = 1;
	my.scale_x  = 1.3;  
	my.scale_y  = 1.3;
	my.scale_z  = 1.3; 
	ent_frame("stand",100);
	
	ImHurt();
}

/* --------------------------------------------------------------------------------------------- */   
/* --------------------------------------------------------------------------------------------- */   

var SaeedWaitingTime = 0;
define _SaeedWaitFor = 200;
define _SaeedWaitInL = 20 ;

function saeed_drag_woumded()
{	
	you = Pointer_To_Entity(woumded_man);
	remove(you);
	morph(<SCary.mdl> ,me);
	my.skill30 =0;
	
	my.FrameAnim = 18;
	while (my.FrameAnim < 100)
	{
		ent_frame("2cary" ,my.FrameAnim );
		my.FrameAnim += speed/100;
		wait(1);
	}

	ent_path("saeed_path2");
	ent_waypoint(my._target_x,2);
	my.skill30=0;
		
	//showmessage(10,149);
	showmessage(3,152);
	Play2DSound(11);
	MisionsMsg2.visible = on;
	//MisionsMsg1.ambient = -100;
	myShowmessions();
	my.FrameAnim = 0;
	my.passable = on; 
	while(1)
	{
		ent_cycle("3cary" ,my.FrameAnim );
		my.FrameAnim += speed/25;

		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);		
		my.pan = nearangle(my.pan,my_angle,20);		
		temp.x = speed/25;
		temp.y = 0;
		sonar(me,5000);
		temp.z = -result;
		move(me,temp,nullvector);
				
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			ent_nextpoint(my._target_x);
			my.skill30 +=1 ;
			
			if (my.skill30 == 2) 
			{
				my.invisible= on;
				//break; 
			}
			if (my.skill30 == 3)
			{
				my.invisible = off;
			}
			if (my.skill30 == 4)
			{
				break;
			}
		}
			
		//if (my._health <0)
		//{
		//	Pointer_To_Function( my.DieEvent, 0, 0, 0);
		//	return;
		//}
		wait(1);
	}


	remove (me);
			
}

/* --------------------------------------------------------------------------------------------- */   

define PlayerSaeedDis = 300;

function emerresqu()
{
	my.passable = on;
	ent_path("from_y_3");
	ent_waypoint(my._target_x,4) ;
	my.skill7 = 0;
	RiotPoliceGo.z = 1;
	while (1)
	{		
		MoveCompars(25,25,1); 

		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 40) 
		{
			my.skill7 +=1;
			if (my.skill7 == 1)
			{
				ent_path("saeed_path2");
				ent_waypoint(my._target_x,1);
				RiotPoliceGo.z = 0;
			}
			if (my.skill7 == 2)
			{
				break;
			}

		}
		
		wait(1);
	}
	
	saeed_drag_woumded();
}

/* --------------------------------------------------------------------------------------------- */   

function saeed_waiting()
{	
	//@  Saeed In (L) Location.
	if (my.skill30 == 4)
	{		
		my.pan = 90;
		
		ent_frame("stand",100);
		if (vec_dist(my.pos , player.pos) > PlayerSaeedDis)
		{			
			SaeedWaitingTime = 0;
			while (SaeedWaitingTime < 200)
			{
				SaeedWaitingTime+=1;
				temp.x = player.x - my.x;
				temp.y = player.y - my.y;
				temp.z = player.z - my.z;
				vec_to_angle(my.pan,temp);

				if (vec_dist(my.pos , player.pos) < PlayerSaeedDis)
				{
					goto lable4;
				}
				if (my._health <0)
				{
					//morph(<Saeed.mdl>,me);
					Pointer_To_Function( my.DieEvent, 0, 0, 0);
					return;
				}
				
				if (SaeedResquWounded==1)
				{
					emerresqu();
					return;
				}
				wait(1);
			}
			SaeedWaitingTime = 0;	
						
			showmessage(10,148);
			PlayMySounds(3,0);
			while (vec_dist(my.pos , player.pos) > PlayerSaeedDis)
			{
				//@ Look At the player 
				temp.x = player.x - my.x;
				temp.y = player.y - my.y;
				temp.z = player.z - my.z;
				vec_to_angle(my.pan,temp);

				//@ bomb explosion if the player wasn't near saeed 
				SaeedWaitingTime += 1;
				if (SaeedWaitingTime == _SaeedWaitFor)
				{
					SaeedWaitingTime = 0;
					temp.x = 5;
					temp.y = 0;
					temp.z = 0;
					vec_rotate(temp,player.pan);
					temp.x += player.x;
					temp.y += player.y;
					temp.z += player.z;
					create(<Hala.MDL>,temp,TimedGazExp);
					showmessage(10,157);
					Play2DSound(23);
				}
				
				if (my._health <0)
				{
					//morph(<Saeed.mdl>,me);
					Pointer_To_Function( my.DieEvent, 0, 0, 0);
					return;
				}
				if (SaeedResquWounded==1)
				{
					emerresqu();
					return;
				}
				wait(1);
			}
		}
				
		lable4:

		morph(<saeedturn.mdl>,me);		
		my.pan = 90;		
		my.y = -4995;
		var s47 = my.skill47;						 				    
		my.skill47 = 0;
		while (my.skill47 < 100)
		{
			ent_frame("Turn" ,my.skill47 );
			my.skill47 +=speed/100;
			
			if (my._health <0)
			{
				morph(<Saeed.mdl>,me);
				Pointer_To_Function( my.DieEvent, 0, 0, 0);
				return;
			}
			wait(1);
		}	
     
		my.skill47 = 0;
		while (my.skill47 < 100)
		{
			ent_cycle("brth" ,my.skill47 );
			my.skill47 += speed/50;
			
			if (my._health <0)
			{
				Pointer_To_Function( my.DieEvent, 0, 0, 0);
				return;
			}
			wait(1);
		}   
		
		my.skill47 = s47;		
		morph(<saeed.mdl>,me);		
		showmessage(10,158);
		PlayMySounds(6,0);
		sasse_run();		
		return;
	}



	//@  Saeed In (G) Location.
	if (my.skill30 == 7)
	{
		SaeedWaitingTime =0;
		ent_frame("stand",100);
		my.y = -6410;
		if (vec_dist(my.pos , player.pos) > PlayerSaeedDis)
		{
			
			SaeedWaitingTime = 0;
			while (SaeedWaitingTime < 200)
			{
				SaeedWaitingTime+= 1;
				temp.x = player.x - my.x;
				temp.y = player.y - my.y;
				temp.z = player.z - my.z;
				vec_to_angle(my.pan,temp);

				if (vec_dist(my.pos , player.pos) < PlayerSaeedDis)
				{
					goto lable5;
				}
				if (my._health <=0)
				{
					morph(<Saeed.mdl>,me);
					Pointer_To_Function( my.DieEvent, 0, 0, 0);
					return;
				}
				if (SaeedResquWounded==1)
				{
					saeed_drag_woumded();
					return;
				}
				wait(1);
			}
			SaeedWaitingTime = 0;	
			
			showmessage(10,148);
			PlayMySounds(3,0);
			while (vec_dist(my.pos , player.pos) > PlayerSaeedDis)
			{
				temp.x = player.x - my.x;
				temp.y = player.y - my.y;
				temp.z = player.z - my.z;
				vec_to_angle(my.pan,temp);

				SaeedWaitingTime += 1;
				if (SaeedWaitingTime == _SaeedWaitFor)
				{
					SaeedWaitingTime = 0;
					temp.x = 5;
					temp.y = 0;
					temp.z = 0;
					vec_rotate(temp,player.pan);
					temp.x += player.x;
					temp.y += player.y;
					temp.z += player.z;
					create(<Hala.MDL>,temp,TimedGazExp);					
					//showmessage(10,154);
					showmessage(10,157);
					PlayMySounds(23,0);
				}
				
				if (my._health <0)
				{
					morph(<Saeed.mdl>,me);
					Pointer_To_Function( my.DieEvent, 0, 0, 0);
					return;
				}
				if (SaeedResquWounded==1)
				{
					saeed_drag_woumded();
					return;
				}
				wait(1);
			}
		}
		
		lable5:

		LDoor = 1;
		MisionsMsg4.ambient = -100;
		MisionsMsg1.visible = 1;
		myShowmessions();
		PlayMySounds(10,0);
		//showmessage(10,132);
		showmessage(10,135);
		

		my.FrameAnim = 0;
		while (my.FrameAnim < 100)
		{
			ent_cycle("2talk",my.FrameAnim);
			my.FrameAnim +=speed/100;
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my.pan,temp);
			
			if (my._health <=0)
			{
				Pointer_To_Function( my.DieEvent, 0, 0, 0);
				return;
			}
			wait(1);
		}

		
		
		morph(<saeedturn.mdl>,me);		
		my.pan = 90;
		
		var s47 = my.skill47;								
		my._type = 12548;
		while (SaeedResquWounded == 0)
		{												 				    
			my.skill47 = 0;
			while (my.skill47 < 100)
			{
				ent_frame("3Turn" ,my.skill47 );
				my.skill47 +=speed/100;
				
				if (my._health <0)
				{
					Pointer_To_Function( my.DieEvent, 0, 0, 0);
					return;
				}
				wait(1);
			}	
	     
			my.skill47 = 0;
			while (my.skill47 < 300)
			{
				ent_cycle("2brth" ,my.skill47 );
				my.skill47 += speed/50;
				
				if (my._health <0)
				{
					Pointer_To_Function( my.DieEvent, 0, 0, 0);
					return;
				}
				wait(1);
			}   
			
						
			if (my._health <0)
			{
				Pointer_To_Function( my.DieEvent, 0, 0, 0);
				return;
			}
			wait(1);
		}
		
		my.skill47 = s47;		
		morph(<saeed.mdl>,me);
		
		my._type = _type_compars;
		

		ent_waypoint(my.skill1,8);
		sasse_run();
		return;
	}
      
	
	
	//@ change action,path to drag the woumded person to ambulance position 
	if (my.skill30 == 9)
	{		

		saeed_drag_woumded();
		return;
	}
}

/* --------------------------------------------------------------------------------------------- */   

function sasse_run()
{				
	//temp.x=0;
	//temp.y=360;
	/////my_angle.x=10000;
	//my_angle.y=100;
	//my_angle.z=0;
	//my._state = _state_Walk;

	my.FrameAnim = 0;
	while (1)
	{		
		MoveCompars(25,25,1);
		
						//@ point check (where im i ? )
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 40) 
		{
			ent_nextpoint(my._target_x);
			my.skill30 += 1 ;

			if (my.skill30 == 4) || (my.skill30 == 7) || (my.skill30 == 9)
			{
				saeed_waiting();
				break;
			}			
		}		
		
						//@ health check
		if (my._health <0)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
			return;
		}				
		
		wait(1);
	}		
}

/* --------------------------------------------------------------------------------------------- */   

action saeed()
{
	ComparsInitial();
	wait(5);

	while (player == null)
	{
	wait(1);
	}
	//showmessage(3,133);
	showmessage(3,136);

	PlayMySounds(1,0);
	
	//my.FrameAnim = 0;
	
	while (snd_playing(SoundPlaying))
	{			
		ent_cycle("2talk",my.FrameAnim);
		my.FrameAnim +=speed/100;		
		temp.x = player.x - my.x;
		temp.y = player.y - my.y;
		temp.z = player.z - my.z;
		vec_to_angle(my_angle,temp);		
		my.pan = my_angle.pan;
		
		if (my._health <0)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
			return;
		}
		wait(1);
	}
			
	//showmessage(3,128);	
	showmessage(3,131);	
	PlayMySounds(2,0);
	while (snd_playing(SoundPlaying))
	{
		ent_cycle("2talk",my.FrameAnim);
		my.FrameAnim +=speed/100;		
		temp.x = player.x - my.x;
		temp.y = player.y - my.y;
		temp.z = player.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle.pan;
		
		if (my._health < 0)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
			return;
		}
		wait(1);
	}
	
	my.pan = 30;
	//showmessage(10,155);
	showmessage(3,158);
	PlayMySounds(6,0);

	ent_path("saeed_path1");
	ent_waypoint(my._target_x,1);
	sasse_run();
}


/////////////////////////////////////////////////////////////////////////////
//
//                       soldier Functions                             
//
/////////////////////////////////////////////////////////////////////////////

var Gas_S;

var ss1;
var ss2;
var ss3;
var ss4;


function MoveSoldier(FrameSec,DesCoverd,UseSmoothAng)
{
	if ( my.SoundWR==0)&& (playerded == 0)
	{ 
		play_entsound(me,comparsstep,1000);
		my.SoundWR=-100; 
	}
	my.SoundWR+=10;

	ent_cycle("1run", my.FrameAnim );
	my.FrameAnim +=speed/FrameSec;

	temp.x = my._target_x - my.x;
	temp.y = my._target_y - my.y;
	temp.z = my._target_z - my.z;
	vec_to_angle(my_angle,temp);
	if (UseSmoothAng)
	{
		my.pan = nearangle(my.pan,my_angle,20);
	}
	else
	{
		my.pan = my_angle.pan;
	}		
	
	temp.x = speed/DesCoverd;
	temp.y = 0;
	sonar(me,5000);
	temp.z = -result;
	move(my ,temp ,nullvector );
	if (result == 0)
	{
		return(0);
	}
	else
	{
		return(1);
	}
}
/* ---------------------------------------------------------------------------- */

action MySolder()
{

	sonar(my,500);
	my.z = target.z +abs(my.min_z);

	if (my.skill7 == 1)
	{
		ss1 = Entity_To_Pointer(my);
	}
	if (my.skill7 == 2)
	{
		ss2= Entity_To_Pointer(my);
	}
	if (my.skill7 == 3)
	{
		ss3 = Entity_To_Pointer(my);
	}
	if (my.skill7 == 4)
	{
		ss4 = Entity_To_Pointer(my);
	}
	
	SoldColl();
}

/* ---------------------------------------------------------------------------- */

function MoveToCar(pSolder,sPath)
{
//@this function move the soldier to behind the car.

	//my = pointer_to_entity(eSolder);
	my =pSolder;
	exclusive_entity;
	ent_path(sPath);
	
	ent_waypoint(my._target_x , 1);
	
	my.FrameAnim = 0;
	my.skill30 = 0;
	while (1)
	{						
		MoveSoldier(25,25,0);

		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			ent_nextpoint(my._target_x) ;
			my.skill30 += 1;
			if (my.skill30 == 3)
			{
				break;
			}
		}
						
		
		wait(1);
	}
	
	wait(5);
	removecoll(me);
	remove(me);
	
	
	//ent_frame();
}

/* ---------------------------------------------------------------------------- */

function EscapeToCar()
{	
//@ this function is activated from the main function..
// it control the escape of the soldier to behind the car and, 
// activate the riot police functions with the variable (RiotPoliceGo) set to 1.

	while (iSolderDead == 0)
	{	
		wait(1);
	}
	
	MisionsMsg4.ambient = -100;
	MisionsMsg1.visible = 1;
	MisionsMsg1.ambient = -100;
							
	//showmessage(10,134);			
	showmessage(3,137);
	Play2DSound(8);

	SaeedResquWounded = 1;

	you = Pointer_To_Entity(ss1);
	if (you._health >= 0 )
	{					
		MoveToCar(you,"spath_1");
	}
	
	
	you = Pointer_To_Entity(ss2);
	if (you._health >= 0 )
	{			
		MoveToCar(you,"spath_2");
	}
	
	you = Pointer_To_Entity(ss3);
	if (you._health >= 0 )
	{			
		MoveToCar(you,"spath_3");
	}
	
	you = Pointer_To_Entity(ss4);
	if (you._health >= 0 )
	{			
		MoveToCar(you,"spath_4");
	}
	
	wait(50);
	RiotPoliceGo = 1;		
}

/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */

function GasSoldureRun()
{   	
	my = Pointer_To_Entity(Gas_S);
	wait(10) ;
	//my.skill20 = 0;
	//my.skill21 = 0;
	
	my.pan = 5;
	
	temp.x = 500;
	temp.y = 0;
	temp.z = 0;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);
	vec_set(my._target_x,temp);

	while (1)
	{		
		MoveSoldier(25,25,0);

		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			break;
		}
		
		wait(1);
	}

	remove(me);
}
 
/* ------------------------------------------------------------------------ */  
define __GasDist = 1064;

action Gas_Soldure
{		
	
	Gas_S = Entity_To_Pointer(my);
	my.pan = 100;
	ent_frame("1shot",0);
	sonar(my,500);
	my.z = target.z +abs(my.min_z);

	my.skill40 = 1;			
	my.skill30 = 300;

	while (player == null)
	{
	wait(1);
	}
	my.EnemyId = player.BodyLnk;
	while (Car_escape == 0)
	{								
		while (vec_dist(my.pos ,player.pos) < __GasDist) && (player.z < 600)
		{			
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle.pan;
			ent_cycle("3shot",my.FrameAnim);
			my.FrameAnim += speed/25;
			if (random(4) > 3)
			{
				ShotAndDamage2(70,1,1,GunFlashFront[my.skill6]);
			}
			if (Car_escape)
			{
			break;
			}
			wait(1);
		}
				
		my.skill30 += 1;
		if (my.skill30 > 300)
		{
			my.skill30 = 0;

			hthrowthegrenade(my,200,1,0);
			
			my.skill40 = -my.skill40;
			if (my.skill40 == 1)
			{			
				my.pan = 95;
				
			}
			else
			{
				my.pan = 83;
			}
		}
		
		wait(1);
	}	
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

define _PoliceNumber , skill1;
define _PathNumber   , skill2;
define _ArrayIndex   , skill3;
//def _target_x,skill17;
//def _target_y,skill18;
//def _target_z,skill19;

define _Counter1  , skill40;
define _Counter2  , skill41;
define _Counter3  , skill42;
define _Counter4  , skill43;
define _Counter5  , skill44;
define _Counter6  , skill45;


define __GasSoldPlayerDes = 50;
define __StopDist = 100;
define __SoldierScan = 200;

var hTemp[3] = 0,0,0;

var OddSoldier = 0;
var EvenSoldier = 0;

/* ------------------------------------------------------------------------ */  

function RiotPoliceEscape()
{
	ent_frame("1shot" ,0 );
	wait(random(20));
	
	my.skill30 = 0;
	my.passable =  1;
	
	if (int(random(2)) == 1)
	{
		ent_path("SoldEscPath1");
	}
	else
	{
		ent_path("SoldEscPath2");
	}

	ent_waypoint(my._target_x,1);
	
	while (1)
	{						
		if (MoveSoldier(25,25,0) == 0)
		{	
			wait(5);						
		}
				
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			my.skill30 +=1;
			ent_nextpoint(my._target_x);
			if (my.skill30 == 4)
			{				
				break;
			}
		}
		wait(1);
	}
	remove(me);
}

/* ------------------------------------------------------------------------ */  

sound Hitstick , <Hitstick.wav>;
function HitPlayer()
{
		
	//@ im hitting the player, all even or odd soldier stop moving		
	if (frc(my._PoliceNumber/2) == 0)
	{
		EvenSoldier = 1;	
	}
	else
	{
		OddSoldier = 1;
	}
		
	while(1) 
	{
		if ( vec_dist(my.pos ,player.pos ) > __GasSoldPlayerDes) ||(Car_escape) 
		{
			break;
		}
																			
		ssSmoke = 0;
		my.FrameAnim = 0;
		while (my.FrameAnim < 100)
		{
			ent_frame( "1shot", my.FrameAnim );
			my.FrameAnim += speed/15;
			
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);					
			my.pan = nearangle(my.pan,my_angle,20);
			
			wait(1);
		}
		if (playerded == 0)
		{
			play_entsound(me,Hitstick,500);
			HeartPlayerShowCompas(25);						
		} 
								
		wait(1);
	}
		
	//@ player escaped, all even or odd soldier get him.
	if (frc(my._PoliceNumber/2) == 0)
	{
		EvenSoldier = 0;	
	}
	else
	{
		OddSoldier = 0;
	}

	if (Car_escape == 0)
	{
		//GoToPlayer();		
		GoToStatrPoint();
	}
	else
	{
		RiotPoliceEscape();
	}		
}

/* ------------------------------------------------------------------------ */  

var MissionFaled = 0;

function GoToPlayer()
{	
	my._Counter2 = 0;
	my.skill43 = int(random(20));
	
	while (vec_dist(my.pos ,player.pos ) > __GasSoldPlayerDes) && (Car_escape == 0)
	{		
				
		if ( my.SoundWR==0) && (playerded == 0)
		{ 
			play_entsound(me,comparsstep,1000);
			my.SoundWR=-100; 
		}
		my.SoundWR+=10;

		ent_cycle("1run", my._Counter2 );
		my._Counter2 +=speed/50;

		if (player.z > 455)
		{						
			play_sound( PlDed,100);
			h_PlDed = result;
			me = 0;						
			messionfailed = 1;
			VisMainMenu(1);
			MBackMenu.visible = 0;
			on_esc = 0;
			on_enter = LLoadLastSave;
			//wait(5);
			//return;
		}
		else
		{
				
			htemp.x = 0;								
			if (frc(my._PoliceNumber/2) == 0)
			{	
				htemp.y = -20 - my.skill43;
				while (EvenSoldier == 1) && (vec_dist(my.pos ,player.pos ) < __StopDist )
				{
					wait(1);
				}
			}
			else
			{
				htemp.y = 20 + my.skill43;
				while (OddSoldier == 1) && (vec_dist(my.pos ,player.pos ) < __StopDist )
				{
					wait(1);
				}
			} 				
			htemp.z = 0;

			vec_rotate(htemp,player.pan);
			vec_add(htemp,player.pos);
			temp.x = htemp.x - my.x;
			temp.y = htemp.y - my.y;
			temp.z = htemp.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle.pan;
			//my.pan = nearangle(my.pan,my_angle,20);
			
			temp.x = speed/25;			
			temp.y = 0;
			sonar(me,5000);
			temp.z = -result;			
			move(my ,temp ,nullskill );
			
			if (result == 0) && (player.z > my.z)
			{
				my.z += 6;
				temp.x = speed/25;
				temp.y = 0;
				temp.z = 0;				
				move(my ,temp ,nullskill );
				
			}			
		}
																		
		wait(1);
	}
	
	if (Car_escape == 0)
	{				
		HitPlayer();
	}
	else
	{
		RiotPoliceEscape();
	}
	

	
}

/* ------------------------------------------------------------------------ */  

var gogogo = 0;
sound hSlodierSteps , <s_step2.wav>;
function somefunction()
{
	while (1)
	{

		if (gogogo == 0)
		{						
			
			CatsAndMiseGames =0 ;
		}
		else 		
		{							
			wait(30);
			CatsAndMiseGames =1 ;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */ 

function GoToStatrPoint()
{	
	exclusive_entity;
	my.flag3 = 0;
	somefunction();
	
	while (1)
	{		
		MoveSoldier(25,25,0);

		if (vec_dist(my.pos ,player.pos) < 60)
		{
			GoToPlayer();
			return;
		}
						
		if (Car_escape == 1)
		{
			RiotPoliceEscape();
			return;
		}
						
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 40) 
		{
			my._counter4 = ent_nextpoint(my._target_x);

			my._counter2 = 0;
			my._counter6 = 1;
			my._counter5 = 0;
			//@ Counter 4 indecates the point in wich the soldier r standing.
			if (my._counter4 == 1)
			{
				while (my._counter2 < 100)
				{
					ent_frame("1shot" ,my._counter5);
					my._counter5 += speed/100 * my._counter6;
					if (my._counter5 > 20)
					{
						my._counter6 = -1;
					}

					if (my._counter5 < 0)
					{
						my._counter6 = 1;
					}
					
					my._counter2 += 1;
					
					
					if (Car_escape == 1)
					{
						RiotPoliceEscape();
						return;
					}
					if (vec_dist(my.pos ,player.pos) < 60)
					{
						GoToPlayer();
						return;
					}
					wait(1);
				}				
			}
			
			//@ contol the escape and return of the compars
			if (my._PoliceNumber == 4)
			{								
				
				if (my._counter4 == 2)
				{
					gogogo = 1;
				}								
			}
			
			if (my._PoliceNumber == 1)
			{
				if (my._counter4 == 1)
				{
					gogogo = 0;
				}
			}
									
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */  
define __PWaitTime = 10;

action RiotPolice
{

// Point     Soldier
// -----     -------
//   5        2 - 1     Attac
//   4	      4 - 3	Attac	
//   3	      6 - 5	Wait
//   2	      8 - 8	Wait
		
	sonar(my,500);                		
        my.z = target.z + abs(my.min_z);

	my.invisible = 1;
	my.passable = 1;
	my._Type = 2;	
	
	while (RiotPoliceGo == 0)
	{
		wait(1);
	}
	
	if (RiotPoliceGo.z)
	{
		while (RiotPoliceGo.z)
		{
			wait(1);
		}
	}


	if (my._PoliceNumber == 3) || (my._PoliceNumber == 4)
	{
		wait(__PWaitTime);
		
	}
	if (my._PoliceNumber == 5) || (my._PoliceNumber == 6)
	{
		wait(__PWaitTime*2);
		
	}
	

	my.passable = 0;
	my.invisible= 0;
	my.shadow = 1;

	if (frc(my._policenumber/2) == 0)
	{
		ent_path("spath2");
	}
	else
	{
		ent_path("spath1");
	}
	
				
	ent_waypoint(my._target_x , 1);		

	while (1)
	{			
		MoveSoldier(25,25,0);

		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			ent_nextpoint(my._target_x);
			my._Counter2 += 1;
								
			if (my._counter2 == 3) 
			{				
				break;
			}										
		}

		wait(1);
	}
						
	
	my._counter2 = 0;	
	
	
	if (my._PoliceNumber == 1)
	{
		ent_path("RiotPolicePath1");
		ent_waypoint(my._target_x , 1);	
		GoToStatrPoint();	
		return;
	}
	if (my._PoliceNumber == 2)
	{
		ent_path("RiotPolicePath2");
		ent_waypoint(my._target_x , 1);	
		GoToStatrPoint();	
		return;
	}
	if (my._PoliceNumber == 3)
	{
		ent_path("RiotPolicePath3");
		ent_waypoint(my._target_x , 1);	
		GoToStatrPoint();	
		return;
	}
	if (my._PoliceNumber == 4)
	{
		ent_path("RiotPolicePath4");
		ent_waypoint(my._target_x , 1);	
		GoToStatrPoint();	
		return;
	}
	if (my._PoliceNumber == 5)
	{
		ent_path("RiotPolicePath5");
		ent_waypoint(my._target_x , 1);	
		GoToStatrPoint();	
		return;
	}
	if (my._PoliceNumber == 6)
	{
		ent_path("RiotPolicePath6");
		ent_waypoint(my._target_x , 1);	
		GoToStatrPoint();	
		return;
	}
	

}

/////////////////////////////////////////////////////////////////////////////
//
//                    player functions                                  
//
/////////////////////////////////////////////////////////////////////////////
  	
action ScanPlayerPos()
{  
	var iCounter = 0;
	while (player == null)
	{
		wait(1);
	}
	while (1)
	{
		
		if (playerded == 1)
		{break;
		}
		if (player.y > -3850)
		{
			iCounter += 1;
			if (iCounter > 3)
			{
				ssSmoke = 1;
				iCounter = 0;
				
				HeartPlayerShowCompas(1);
								
				if (snd_playing(SoundPlaying) == 0)
				{
					//showmessage(10,154);
					showmessage(10,157);
					PlayMySounds(23,0);
				}				
			}			
		}				
		ssSmoke = 0;
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */ 

action Followplayer
{	
	my.passable = on;
	my.invisible = on;
	while (player == null)
	{
		wait(1);
	}
	
	entiy1 =Entity_To_Pointer(me);
	while (1)
	{		
		if (playerded == 1)
		{
			break;
		}
		vec_set(my.pos,player.pos);

		temp.pan = 360;
		temp.tilt = 180;
		temp.z = 120;
		if(PressedKeys[Key_Use] == 1)
		{
			indicator = _handle;
		}
		else
		{
			indicator = 980;
		}
		
		scan (my.pos,my.pan,temp);
		indicator = 0;
		wait(1);
	}
}

/////////////////////////////////////////////////////////////////////////////
//
//                       car functions                                  
//
/////////////////////////////////////////////////////////////////////////////

function WatchPlayer()
{
	var iC = 0;
	// magic wait
	while (player == null)
	{
	wait(1);
	}

	while (1)
	{
		
		if (player.y < -6600) && (player.z < 600)
		{
			iC += 1;
			if (iC > 300)
			{
				showmessage(1,143);
				PlayMySounds(30,0);
				iC = 0;
			}						
		}
		else
		{
			iC = 300;
		}
		
		if (player.y < -7831) 
		{
			lader_player = 1500;
			HeartPlayerShowCompas(105);						
			break;
		}
		if (StopWatching)
		{
			break;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */ 
sound flagsound , <flagsound.wav>;
var flagsoun = 0;
function FalgAction()
{
	my.skill5 = entity_to_pointer(you);
	my.shadow = 1;
	my.scale_x = 0.3;
	//my.scale_y = 0.1;
	my.scale_z = 0.2;
	my.tilt = 45;
	while (1)
	{
		if (snd_playing(flagsoun) == 0) && (camra2player == 1)
		{
			play_entsound(my,flagsound,800);
			flagsoun = result;
		}
		ent_cycle("flag" , my.skill30);
		my.skill30 += speed/100;
				
		you =pointer_to_entity(my.skill5);
		temp.x = 0;
		temp.y =0;
		temp.z = 40;
		vec_rotate(temp,you.pan);
		vec_add(temp,you.pos);
		vec_set(my.pos,temp);		
		wait(1);
	}

}

/* ------------------------------------------------------------------------ */ 
define __TankeWatch = 25252;
var BeginScan = 0;
function SaryAction()
{
	my.skill5 = entity_to_pointer(you);
	//my.enable_scan = on;
	//my.enable_detect = on;
	//my.event = SaryEvent;
	my.tilt = 45;
	wait(10);
  	
	
	my.scale_x = 0.8;
	my.scale_y = 0.8;

	temp.x = 0;
	temp.y =0;
	temp.z = 20;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);
	create(<flagpals.mdl>,temp,FalgAction);

	while (1)
	{
		you = pointer_to_entity(my.skill5);
		vec_for_vertex(temp,you,240);
		vec_set(my.pos,temp);
		if (BeginScan == 1)
		{
			break;
		}
		wait(1);

	}
	
//	while (1)
//	{
//		
//		//7611
//		if (player.y < -7900) && (player.z < 500) && (playerded==0)
//		{
//			playerded = 500;
//			showmessage(1,158);
//			play_sound(S_M_L3_42,100);
//			h_VictoryPlayer = result;
//			while (snd_playing(h_VictoryPlayer))
//			{
//			wait(1);
//			}
//			//Fade2black( 1, 3, Function_To_Pointer( "finalization"));
//			
//			play_sound VictoryPlayer, 100;
//			h_VictoryPlayer = result;
//			break;
//		}
//		
//		
//		wait(1);
//	}
}

/* ------------------------------------------------------------------------ */ 

sound TankSound , <tankloop.wav>;
action TestTank2
{
	sonar(my,500);                		
        my.z = target.z + abs(my.min_z);
	my.shadow = 1;
	WatchPlayer();
}

/* ------------------------------------------------------------------------ */ 

function messahesoftank()
{	
	if (playerded == 0)
	{				
		MisionsMsg3.visible = on;
		MisionsMsg2.ambient = -100;
		myShowmessions();							
	}
}

/* ------------------------------------------------------------------------ */ 

action TestTank
{	
	sonar(my,500);                		
        my.z = target.z + abs(my.min_z);
	my.shadow = 1;
	
	
	
	vec_for_vertex(temp,my,240);
	create(<sary.wmb>,temp,saryaction);
				
	while (TankMove == 0)
	{
		wait(1);
	}

	

	my._target_x = 0;
	my._target_y = 0;
	my._target_z = 0;

	ent_path("TankPath");
	ent_waypoint(my._target_x,1);
	
	var htanksound=0;
	while (1)
	{
		if (snd_playing(htanksound) == 0)
		{
			play_entsound(my,TankSound,600);
			result = htanksound;
		}
		
		if (my.skin > 5)
		{
			my.skin = 1;
		}
		my.skin +=1;
		
		temp.x = my._target_x -my.x; 
		temp.y = my._target_y-my.y; 
		temp.z = my._target_z- my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle.pan;

		
		temp.x = speed/40;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector );

		sonar(my,500);
		my.z = target.z +abs(my.min_z);

		if (vec_dist(my.x ,my._target_x ) < 30)
		{
			ent_nextpoint (my._target_x);
			my.skill30 += 1;
			if (my.skill30 == 2)
			{
				StopWatching =1;
				break;
			}			
		}

		wait(1);
	} 
	
	Play2DSound(25);
	BeginScan = 1;
	messahesoftank();

	my.skill30 = 0;
	while (1)
	{		
		if (vec_dist(my.pos ,player.pos ) < 160)
		{camra2player = 0;
			playerded = 500;
			showmessage(1,158);
			play_sound(S_M_L3_42,100);
			h_VictoryPlayer = result;
			while (snd_playing(h_VictoryPlayer))
			{
				wait(1);
			}			
			VictoryScream();
			VictoryCamera();
			play_sound VictoryPlayer, 100;
			h_VictoryPlayer = result;
			break;
		}
				
		wait(1);
	}
						
}

/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */

action SafariCar
{
	my.passable = 0;
	//sonar(my,500);                		
        //my.z = target.z + abs(my.min_z);
	my.shadow = 1;
}

/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */

action  Ambulance_car
{
	wait(1);
	my.shadow = 1;
	return;
}

/* ------------------------------------------------------------------------ */    

function smoke_explosion222()
{
      var m=0;
      while (m < 300)
       {   	         
           my_angle.x = 50;
	   my_angle.y = 75;
	   my_angle.z = 50;
	   effect( PartsThrow, 5, my.pos, my_angle);
			  			    
	   m += 1;
	   wait(1);
      }

}

/* ------------------------------------------------------------------------ */    
sound malaleh, <malaleh.wav>;
function land_rover_escape()
{		
	GasSoldureRun();
	smoke_explosion222();		
	Play2DSound(14);		
	TankMove = 1;
	
	my.skill3 = -(speed/25);
	ent_path("car_path");
	ent_waypoint(my._target_x,2);
	
	while(1)
	{
		play_entsound(my , malaleh , 500);
		
		if (my.skill3 < 0)
		{
			temp.x = my.x - my._target_x ;
			temp.y = my.y - my._target_y ;
			temp.z = my.z - my._target_z ;
		}
		else
		{
			temp.x = my._target_x - my.x;
			temp.y = my._target_y - my.y;
			temp.z = my._target_z - my.z;
		}
		vec_to_angle(my_angle,temp);
		//my.pan = my_angle.pan;
		my.pan = nearangle(my.pan,my_angle,4);

		temp.x = my.skill3;
		temp.y = 0;
		sonar(me,5000);
		temp.z = -result;
		move(me,temp,nullvector);
						
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			ent_nextpoint(my._target_x);
			my.skill30 +=1 ;						
			
			my.skill3 = speed/15;
			

			if (my.skill30 == 5)
			{
				break;
			}
		}
		wait(1);
	}
	remove(me);
}

/* ------------------------------------------------------------------------ */    
define __WhatEver = 5;

action land_rover
{
	LandRoverPointer = Entity_To_Pointer(me);
	sonar(my,500);
	my.z = target.z +abs(my.min_z);
	
	my.shadow = 1;
	
	while (1) 
	{					
		if (Car_escape) 
		{
			break;
		}
		wait(1);
	}

	land_rover_escape();
}


///////////////////////////////////////////////////////////////////////////////////
//
//		lader function 
//
///////////////////////////////////////////////////////////////////////////////////

function uppoint_event()
{
	if (event_type == event_scan) && (indicator == 980)&& (my.flag1 == 0)
	{
		my.flag1 = 1;
		showmessage(10,166);
	}
	if ((event_type==event_scan)&&(indicator == _handle))
	{
		if(lader_player == 0)
		{
			//my.event = null;
			Gun_Hand_state();
			lader_player=2;
			
			you = Pointer_To_Entity(lader);
			vec_for_vertex(temp,you,186);
			
			you =Pointer_To_Entity(player.bodylnk);
			vec_set(you.pos,temp); 
			vec_set(player.pos,temp);						
			you.pan = 270;
			player.pan = 270;			
			//my.event = uppoint_event;
			
			
		}
	}
}

/* ------------------------------------------------------------------------ */    



action uppoint
{
	wait(100);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=uppoint_event;
	while (1)
	{
		if (my.flag1 == 1)
		{
			my.skill30 +=1;
			if (my.skill30 > 400)
			{
				my.skill30 = 0;
				my.flag1 = 0;
			}
		}
		
		if(jump_lader == 2)
		{
			jump_lader = 0;
			  
			you = Pointer_To_Entity(lader);
			vec_for_vertex(temp,you,185);
			you = Pointer_To_Entity(player.bodylnk);  
			vec_set(you.pos,temp); 
 
		}
		wait(1);
	}

}

/* ------------------------------------------------------------------------ */    
function downpoint_event()
{
	if (event_type == event_scan)&& (indicator == 980) && (my.flag1 == 0)
	{
		my.flag1 = 1;
		showmessage(1,165);
		showmessage(3,143);
	}
	
	if ((event_type==event_scan)&&(indicator == _handle))
	{
		if(lader_player == 0)
		{
			Gun_Hand_state();
			lader_player=1;
			    
			you = Pointer_To_Entity(lader);
			vec_for_vertex(temp,you,185);
			you = Pointer_To_Entity(player.bodylnk);
			vec_set(you.pos,temp);
			vec_set(player.pos,temp);
			you.pan = 270;
			player.pan = 270;
		}
	}
}

/* ------------------------------------------------------------------------ */    

action downpoint
{
	wait(100);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=downpoint_event;
	while (1)
	{
		

		if (my.flag1 == 1)
		{
			my.skill30 += 1;
			if (my.skill30 > 400)
			{
				my.skill30 = 0;
				my.flag1 = 0;
			}
		}
		if(jump_lader == 1)
		{
			jump_lader = 0;
			lader_player = 0;
			
			you = Pointer_To_Entity(lader); 
			vec_for_vertex(temp,you,187);
			you = Pointer_To_Entity(player.bodylnk); 
			vec_set(you.pos,temp);			 
		}
		wait(1);
	}

}

/* ------------------------------------------------------------------------ */    

action lader_object
{
	wait(10);
	my.invisible = 1;
	my.passable = 1;
	lader = Entity_To_Pointer(me);
}