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
	type = <Lev71Load1.bmp>;
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
string level_str = <lev7h1.WMB>; // give file names in angular brackets
string levelpath = "lev71.pts";


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

var video_mode = 7;
var video_depth = 16;

function main()
{
	str_cpy(levelpath,"lev71.pts");
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;

	play_sound(SSound1,100);
	StartSoundH = result;

	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
	initilization();

	MyMainFunc();	
}



function MyMainFunc()
{	
	DamageBySomke = 0;
	//var Offset = 0;	
	MisionsMsg1.visible = 1;
	MisionsMsg2.visible = 1;
	MisionsMsg3.visible = 1;
	MisionsMsg4.visible = 1;
	MisionsMsg5.visible = 1;
	MisionsMsg6.visible = 1;
	
	//MisionsMsg1.z += Offset;
	//MisionsMsg2.z += Offset;
	//MisionsMsg3.z += Offset;
	//MisionsMsg4.z += Offset;
	//MisionsMsg5.z += Offset;
	//MisionsMsg6.z += Offset;

	object1.skin = 1;
	object2.skin = 2;
	object1.visible = 0;
	object2.visible = 0;

	ObjecPos.visible = 0;
	
	fog_color = 0;	
	camera.fog = 50;
		
	wait(50);
	if (level.y == 3)
	{MovieOrSucess = 1;
	}	

	while (DamageBySomke == 0)
	{
	wait(1);
	}
	MisionsMsg2.ambient = -100;
}

function SetViewBright(CMBr)
{
		camera.ambient = CMBr-100;
		blackface.alpha = abs(min(0, camera.ambient)/3);
}


function NewlevelOrloaded()
{	
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(S2dPlaying);
	stop_sound(S3DPlaying);
}


function temp_Mve()
{
return;
}

function temp_fire()
{
return;
}

function start_level()
{
	return;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                        
//		                        my decleration                                   
//                                                                         
//////////////////////////////////////////////////////////////////////////////////////////////////////

//var game_state[4];

sound S_M_L7_00  ,  <M_L7_00.wav>;
sound S_M_L7_01  ,  <M_L7_01.wav>;
sound S_M_L7_02  ,  <M_L7_02.wav>;
sound S_M_L7_03  ,  <M_L7_03.wav>;
sound S_M_L7_04  ,  <M_L7_04.wav>;
sound S_M_L7_05  ,  <M_L7_05.wav>;
sound S_M_L7_06  ,  <M_L7_06.wav>;
sound S_M_L7_07  ,  <M_L7_07.wav>;
sound S_M_L7_08  ,  <M_L7_08.wav>;
sound S_M_L7_10  ,  <M_L7_10.wav>;
sound S_M_L7_11  ,  <M_L7_11.wav>;
sound S_M_L7_12  ,  <M_L7_12.wav>;
sound S_M_L7_13  ,  <M_L7_13.wav>;
sound S_M_L7_14  ,  <M_L7_14.wav>;
sound S_M_L7_17  ,  <M_L7_17.wav>;
sound S_M_L7_19  ,  <M_L7_19.wav>;
sound S_M_L7_20  ,  <M_L7_20.wav>;
sound S_M_L7_21  ,  <M_L7_21.wav>;
sound S_M_L7_23  ,  <M_L7_23.wav>;
sound S_M_L7_24  ,  <M_L7_24.wav>;
sound S_M_L7_25  ,  <M_L7_25.wav>;
sound S_M_L7_26  ,  <M_L7_26.wav>;
sound S_M_L7_27  ,  <M_L7_27.wav>;
sound S_M_L7_28  ,  <M_L7_28.wav>;
	
var CallForHealp = 0;


//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                               comon functions                                   
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

function hideAllGui()
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
	object1.visible = 0;
	object2.visible = 0;

}

/* ------------------------------------------------------------------------------------------------- */

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

/* ------------------------------------------------------------------------------------------------- */

function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}

/* ------------------------------------------------------------------------------------------------- */

function MissionFalied(Id)
{
	messionfailed = 1;
	ZoomOut();
	if (id == 1)
	{
		Play2dSound(2);
		wait(5);
	}

	play_sound( PlDed,100);
	h_PlDed = result;
	me = 0;
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function makes things become red. 
function GlowRed(LightSpeed,MaxRed,MinRed)
{
	//@ LightSpeed : the speed the changes gos.
	//@ MaxRed : the max value of red .
	//@ MinRed : The Min Value of red .

	//@ skill 35 : for saving the value of red of each entity.
					
	if (my.red > MaxRed)
	{
		my.skill35 = -LightSpeed;
	}
	if (my.red < MinRed)
	{
		my.skill35 = LightSpeed;
	}
	my.red += my.skill35;
	
}

/* ------------------------------------------------------------------------------------------------- */

function Play2dSound(Number)
{	
	stop_sound(S2dPlaying);
	if (Number == 1)
	{
		showmessage(1,138);
		play_sound(S_M_L7_07,100);
		S2dPlaying = result;

		while (snd_playing(S2dPlaying)) { wait(1); }

		showmessage(1,139);
		play_sound(S_M_L7_08,100);
		S2dPlaying = result;
		return;
	}	
	
	if (Number == 2)
	{
		showmessage(1,140);
		play_sound(S_M_L7_10,100);
		S2dPlaying = result;
		wait(5);
		return;
	}
	
	if (Number == 3)
	{
		showmessage(1,153);
		play_sound(S_M_L7_27,100);
		S2dPlaying = result;
		
		while (snd_playing(S2dPlaying) == 1){ wait(1); }		
		
		showmessage(1,152);
		play_sound(S_M_L7_26,100);
		S2dPlaying = result;
		if (hPlayerWins != 2)
		{
			MissionFalied(0);
		}
						
	}
	
	if (Number == 13)
	{
		play_sound(S_M_L7_13,100);
		S2dPlaying = result;
		return;
	}
	
	if (Number == 14)
	{
		play_sound(S_M_L7_14,100);
		S2dPlaying = result;
		return;
	}

	if (Number == 15)
	{
		showmessage(1,146);
		play_sound(S_M_L7_19,100);
		S2dPlaying = result;		

		while (snd_playing(S2dPlaying)) { wait(1); }		
		
		showmessage(5,147);
		play_sound(S_M_L7_20,100);
		S2dPlaying = result;
		return;
	}		
}

/* ------------------------------------------------------------------------------------------------- */

var Solder3d   = 0;

define __ElurVol   = 600;
define __SolderVol = 800;

function Play3dSound(Number)
{
	//@ Elur Messages
	if (Number == 1 ) { play_entsound(my,S_M_HM7_25,__ElurVol); S3dPlaying = result; return; }
	if (Number == 2 ) { play_entsound(my,S_M_HM7_13,__ElurVol); S3dPlaying = result; return; }
	if (Number == 3 ) { play_entsound(my,S_M_HM7_14,__ElurVol); S3dPlaying = result; return; }
	
	if (Number == 15)
	{
		showmessage(1,170);
		play_entsound(my, S_M_HM7_15 , __ElurVol);
		S3dPlaying = result;		
		while (snd_playing(S3dPlaying))	{ wait(1); }
		showmessage(1,171);
		play_entsound(my, S_M_HM7_16 , __ElurVol);
		S3dPlaying = result;		
		while (snd_playing(S3dPlaying))	{ wait(1); }
		showmessage(1,172);
		play_entsound(my, S_M_HM7_17 , __ElurVol);
		S3dPlaying = result;		
		while (snd_playing(S3dPlaying))	{ wait(1); }		
		CallForHealp = 1;				
		return;
	}

	if (Number == 16)
	{
		if (int(random(2)) == 0)
		{
			showmessage(1,175);
			play_entsound(my, S_M_HM7_20 , __ElurVol);
			S3dPlaying = result;
			while (snd_playing(S3dPlaying))	{ wait(1); }
			showmessage(1,177);
			play_entsound(my, S_M_HM7_22 , __ElurVol);
			S3dPlaying = result;
		}
		else
		{
			showmessage(1,180);
			play_entsound(my, S_M_HM7_27 , __ElurVol);
			S3dPlaying = result;
			while (snd_playing(S3dPlaying))	{ wait(1); }
			showmessage(1,176);
			play_entsound(my, S_M_HM7_21 , __ElurVol);
			S3dPlaying = result;
		}
		return;
	}

	//@ Soldier Messages.
	if (Number == 4)
	{		
		showmessage(1,164);
		play_entsound(my,S_M_HM7_09,__SolderVol);
		Solder3d = result;		
		while (snd_playing(Solder3d)) { wait(1); }		
		showmessage(1,165);
		play_entsound(my,S_M_HM7_10,__SolderVol);
		Solder3d = result;		
		while (snd_playing(Solder3d)) { wait(1); }		
		my.skill7 = 1; 
		return;
	}
	if (Number == 5)
	{
		showmessage(1,181);
		play_entsound(my,S_M_HM7_28,__SolderVol);
		Solder3d = result;
		while (snd_playing(Solder3d)) { wait(1); }				
		showmessage(1,166);
		play_entsound(my,S_M_HM7_11,__SolderVol);
		Solder3d = result;		
		while (snd_playing(Solder3d)) { wait(1); }		
		my.skill7 = 1;
		return;
	}
	if (Number == 6) { showmessage(10,167); play_entsound(my,S_M_HM7_12,__SolderVol); Solder3d = result; return; }	
	if (Number == 7)
	{
		showmessage(20,174);
		play_entsound(my,S_M_HM7_19,__SolderVol);
		Solder3d = result;
		while (snd_playing(Solder3d)) { wait(1); }
		my.skill7 = 1;
		return;
	}
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//			      Doors Functions 
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

sound ClosedDoor , <DOORCLOSE.wav>;
sound CloseddoorMessage , <M_L8_05.wav>;

function ClosedDoorsEvent()
{
	if (event_type == event_scan) && (MyIndecator == _h_PlayerScaning) 
	{
		if (my.flag8 == 0)
		{
			my.flag8 = 1;
			showmessage(1,213);
			play_entsound(me,ClosedDoor , 600);
			my.skill10 = result;
			while (snd_playing(my.skill10))
			{
			wait(1);
			}
			
			wait(15);
			my.flag8 = 0;
			
		}
	}
}

/* ----------------------------------------------------------------------------------------------------- */

action ClosedDoors
{
	my.enable_scan = 1;
	my.enable_detect = 1;
	my.event = ClosedDoorsEvent;
}

/* ----------------------------------------------------------------------------------------------------- */

var StartTheGame = 0;
define __DoorWait  = 100;
define __OpenSpeed = 3; 
define __CloseDist = 80;

define _PlayerDist , skill33;

define _DoorState , flag3;
define __Opened = 0;
define __Locked = 1;
sound DoorSealed , <doorsealed.wav>;

function MyDoorEvent();

function FinalDoorEv()
{
	if (event_type == event_scan) && (MyIndecator == _h_PlayerScaning) 
	{
		if (object1.visible == 1) && (object2.visible == 1)
		{
			my.event = null;						
			my.red = 0;
			my.lightrange = 0;
			hPlayerWins = 1;
			wait(1);
			MisionsMsg6.ambient = -100;
			CloseAllSongs();
			hideAllGui();				
			showmessage(10,210);
			play_loop(VictoryPlayer, 100);
			h_VictoryPlayer  = result ;
			MovieOrSucess = 1;
			VictoryScream();
			RemoveAllKeys();
			on_enter = finalization;
			PreesNextLvl.visible = 1;
			VWeaponSprite.invisible = 1;
			wait(10);
			Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));			
		}
		else
		{
			myShowmessions();	
		}
	}
}

/* ------------------------------------------------------------------------------------------------- */

var pElurDoor;
function OpenDoorToInsideRoom(iClose)
{
	//@ player out side the room.
	play_entsound(me ,RoomDoorOpen , 500);	
	while (my.pan > -90 )
	{
		my.pan -= __OpenSpeed * (speed/200);
		wait(1);
	}

	if (iClose)
	{
		StartTheGame = 1;
		wait(__DoorWait);
		
		while (my._PlayerDist < __CloseDist)
		{
			wait(1);
		}

		while (my.pan < 0)
		{
			my.pan += __OpenSpeed * (speed/200);
			wait(1);
		}	
	}
	play_entsound(me ,ClosedDoor , 500);	
	my.event = MyDoorEvent;
}

/* --------------------------------------------------------- */

function OpenDoorToOutsideRoom()
{
	my = pointer_to_entity(pElurDoor);
	//@ player inside the room.
	
	play_entsound(me ,RoomDoorOpen , 500);

	while (my.pan < 90 )
	{
		my.pan += __OpenSpeed * (speed/200);
		wait(1);
	}
	
	
	wait(__DoorWait);
	
	while (my._PlayerDist < __CloseDist)
	{
		wait(1);
	}

	while (my.pan > 0)
	{
		my.pan -= __OpenSpeed * (speed/200);
		wait(1);
	}
	play_entsound(me ,ClosedDoor , 500);
	my.event = MyDoorEvent;	
}

/* ------------------------------------------------------------------------------------------------- */

function MyDoorEvent()
{
	if (event_type == event_scan) && ((MyIndecator == _h_PlayerScaning) || (MyIndecator == _h_SoldierScaing))
	{		
		//@ the door is lucked.
		if (my._DoorState == __Locked)
		{						
			//@ player is trying to open the door
			 
			my.event = null; 			
			play_entsound(me , DoorSealed , 500); 
			my.skill40 = result;
			myShowmessions();
			while (snd_playing(my.skill40))
			{
			wait(1);
			}
			wait(10);
			my.event = MyDoorEvent;						 
			return; 			
		}
		
		MisionsMsg1.ambient = -100;
		my.event = null;		
		if (you.x > -2282) { OpenDoorToInsideRoom(1); }		
		else		   { OpenDoorToOutsideRoom(); }		
	}
}

/* ------------------------------------------------------------------------------------------------- */

define __DoorDest = 150;
define __DoorTime = 300;
define __LightSpeed = 2;

action ElevatorDoor
{
	my._type = _type_elevator;
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function control 2 doors , elur door and the final door.
action MyDoor()
{
	//@ skill 30               : counter.
	//@ skill 33 (_PlayerDist) : player distance from the door.
	//@ flag 3   (_DoorState)  : determen the door state Lucked Or Opend..
	//@ flag 1                 : Elure Or Final Door.
	
	my._type = _type_elevator;	
	
	my.enable_scan = on;			
	if (my.flag1) 
	{
		my.event = FinalDoorEv;	
	}
	else
	{
		pElurDoor = entity_to_pointer(me);
		my.event = MyDoorEvent;	
	}
			
	while (player == null)
	{
		wait(1);
	}
	
	my.skill30 = __DoorTime;
	my.lightrange = 5;
	my.skill35 = __LightSpeed;
	while (1)
	{		
		GlowRed(20,255,50);
		if (my.flag1 == 0)
		{
			//@ control the opening and lucking the door
			if (AttacPlayer)
			{
				if (object1.visible) && (object2.visible) && (MisionsMsg3.ambient == -100)
				{
					my._DoorState = __Opened;
					OpenDoorToInsideRoom(0);
					fog_color = 1;						
					my.red = 0;
					my.lightrange = 0;
					wait(35);
					my.event = null;
					break;
				}
				else
				{
					my._DoorState = __Locked;
				}
			}
		}		
				
		//@ door messages
		my._PlayerDist = vec_dist(my.pos ,player.pos);
		if ( my._PlayerDist < __DoorDest )
		{
			my.skill30 += 1;
			if (my.skill30 > __DoorTime)
			{
				my.skill30 = 0;
				showmessage(1,196);
			}
		}
		else
		{
			my.skill30 = __DoorTime;
		}

		wait(1);
	}
}  

//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//			      Items Functions 
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

sound ItemFitch , <Take.wav>;

define _ItemType ,skill1;

define __Keys      = 1;
define __Jacket    = 2;
define __DublUzi   = 3;
define __BomAction = 4;
define __Uzi       = 5;


function PerpareItemToPickUp()
{
	my.event = null;				
	my.invisible = 1;
	play_sound(ItemFitch,100);	
}

/* ------------------------------------------------------------------------------------------------- */

function RemoveItems()
{
	wait(1);
	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */

function MyItemsEvent()
{	
	if (event_type == event_scan) && (MyIndecator == _h_PlayerScaning)
	{										
		if (my._ItemType == __Keys)
		{
			AttacPlayer = 1;
			PerpareItemToPickUp();
			object1.visible = 1;				
			MisionsMsg4.ambient = -100;
			showmessage(10,194);			
			if (object2.visible == 0)
			{					
				showmessage(5,144);
				Play2dSound(14);
			}
			else
			{
				MisionsMsg1.ambient = -100;
				Play2dSound(15);
			}
			RemoveItems();			
		}
		
		if (my._ItemType == __Jacket)
		{						
			PerpareItemToPickUp();
			object2.visible = 1;
			MisionsMsg5.ambient = -100;
			showmessage(10,195);
			if (object1.visible == 0)
			{
				showmessage(5,143);
				Play2dSound(13);
			}
			else
			{
				MisionsMsg1.ambient = -100;
				Play2dSound(15);
			}
			RemoveItems();
		}
	}

	if(event_type == event_push) && (you._type == _type_player) 
	{ 			
		if (my._ItemType == __DublUzi)
		{
			PerpareItemToPickUp();
			you = pointer_to_entity(my.skill40);
			remove(you);			
			create( <DUzi.MDL>, temp, guny);
			you.skill1 = 14;
			totalbullets[13] = 66;
			Kick_state = 1;
			MisionsMsg2.ambient = -100;
			Gun_Hand_state();
			RemoveItems();			
		}
		
		if (my._ItemType == __BomAction)
		{	
			PerpareItemToPickUp();
			create( <BumpAction.mdl>, temp, guny);
			you.skill1 = 5;
			totalbullets[4] = 10;
			Kick_state = 1;
			MisionsMsg2.ambient = -100;
			Gun_Hand_state();
			RemoveItems();						
		}

		if (my._ItemType == __Uzi)
		{
			PerpareItemToPickUp();
			create( <uzi.mdl>, temp, guny);
			you.skill1 = 11;
			totalbullets[10] = 66;
			AttacPlayer = 1;
			MisionsMsg2.ambient = -100;
			Kick_state = 1;
			Gun_Hand_state();
			RemoveItems();
		}	
	}		
}

/* ------------------------------------------------------------------------------------------------- */

define __ItemDest = 150;     //@ The Distance Between The Item And The player.
define __ItemTime = 300;     //@ Time Before Repeting the (Press The Use Key To Obtain The Object) Message.
define __ItemLightSpeed = 2;

function SecondUzi()
{	
	my.pan = you.pan;
	my.roll = you.roll;
	my.tilt = you.tilt;
	my.passable = 1;
	my.lightrange = 2;
	my.skill35 = __ItemLightSpeed;
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function control the items kaled gather , the keys and sute.
action MyItems
{	
	//@ skill 1 :  1 keys.
	//@            2 Jaket.
	//@            3 Duble uzi.
	//@            4 BomAction Gun.
	//@            5 Uzi.
	//@ skill 30 : counter.       
	//@ skill 35 : the red value.
	//@ skill 40 : pointer to the second uzi.
		
	my.push = -1;
	my.enable_push = 1;
	my.enable_scan = 1;
	my.passable = 0;
	
	my.event = MyItemsEvent;	
	
	my.lightrange = 2;
	my.skill35 = __ItemLightSpeed;

	//@ creating the second uzi
	if (my._ItemType == __DublUzi)
	{		
		temp.x = -5;
		temp.y =4; 
		temp.z =0;
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);
		create(<LUzi.mdl>,temp,SecondUzi);		
		my.skill40 = entity_to_pointer(you);
	}

	while (player == null) { wait(1); }

	my.skill30 = __ItemTime;
	while (1)
	{				
		if (my._ItemType == __Keys) || (my._ItemType == __Jacket)      
		{ 
			GlowRed(3,250,50);	
		}
						
		if (vec_dist(my.pos ,player.pos) < __ItemDest)
		{
			temp.x = 0;
			temp.y = 0;
			temp.z = 5;
			vec_add(temp,my.pos);
			trace_mode = ignore_me + ignore_passable + ignore_sprites;
			trace(temp ,player.pos );
			if (you)
			{
				if (you._type == _type_player)
				{
					my.skill30 += 1;
					if (my.skill30 > __ItemTime)
					{
						my.skill30 = 0;
						if (my._ItemType == __Keys)      { showmessage(1,204); }
						if (my._ItemType == __Jacket)    { showmessage(1,205); }						
					}
				}
			}  			
		}
		else
		{
			my.skill30 == __ItemTime;
		}
		wait(1);
	}
}


///////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                           player Functions                                      
//
///////////////////////////////////////////////////////////////////////////////////////////////////////

var OkToEnter = 0;
function ScanForPlayerEv()
{
	if (event_type == event_detect) && (MyIndecator == _h_ScanForPlayer)
	{
		if (you)
		{
			if (you._type == _type_player)
			{
				my.event = null;
				if (my.skill20 == 1)
				{
					//@ player infront of ELOR
					if (OkToEnter == 0)
					{
						AttacPlayer = 1;
					}
				}
				else
				{
					//@ player in the back room.
					AttacPlayer = 1;
				}
				my.flag1 = on;
			}
		}
	}
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function Scan the position of the player.. if he went in without permition
//@ alarm gos on.. if he went in the second room, alarm gos on.
action ScanForPlayer
{
	//@ skill 20 : scan item position.	
	my.invisible = on;
	my.passable = on;	
	my.enable_detect = on;
	my.event = ScanForPlayerEv;
		
	while (my.flag1 == off)
	{			
		if (AttacPlayer)
		{
			break;
		}
		temp.pan = 180;
		temp.tilt = 90;
		temp.z = 120;		
		MyIndecator = _h_ScanForPlayer;
		scan(my.pos ,my.pan ,temp);
		MyIndecator = 0;
		wait(1);
	}
	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

//@ this function control the scaning object that gos whereever the
//@  player gos.
action PlayerScanHand
{		
	my.invisible = on;
	my.passable = on;
	
	while (player == null)
	{
		wait(1);
	}
	
	Play2dSound(1);
	myShowmessions();
	
	while (1)
	{	
		if (hPlayerWins) { return; }

		vec_set(my.pos,player.pos);
		my.pan = player.pan;		
		
		if (player.x > -2282) && (object1.visible ==0) && (object2.visible == 0) && (AttacPlayer)
		{			
			if (hPlayerWins != 2)
			{
				MissionFalied();
			}
			
			return;
		}
		if (PressedKeys[Key_Use] == 1)
		{
			temp.pan = 180;
			temp.tilt = 180;
			temp.z = 100;
			MyIndecator = _h_PlayerScaning;
			scan(my.pos ,my.pan ,temp);
			MyIndecator = 0;
		}
		wait(1);
	}
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                              Soldier Functions                                  
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

function InisialSold()
{	
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	//wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = my.skill8;	
	//wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;		
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
	if (my.WeaponNumber != 5)
	{
		my.hide = 1;
	}		
	my.hunt = 1;
	my._type = _type_soldier;
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = solderevent;	
	my.DieEvent = Function_To_Pointer( "SolderDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");	
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

define __BreakDist = 250;
function SpisalSoldAction()
{
	while (1)
	{
		trace_mode = ignore_me + ignore_passable + ignore_sprites ;
		trace(my.pos ,player.pos );
		if (you)
		{
			if (you._type ==_type_player)
			{
				break;
			}
		}
		wait(1);
	}	
	
	while (1)
	{
		//@ stand up
		my.FrameAnim = 0;
		while (my.FrameAnim < 100)
		{
			ent_frame("4up" ,my.FrameAnim );
			my.FrameAnim += speed/10;
			wait(1);
		}
				
		//@ fire				
		my.FrameAnim = 0;
		while (my.FrameAnim < 300)
		{
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle.pan;

			ent_cycle("4shot" , my.FrameAnim);
			my.FrameAnim += speed/15;
			if (random(3) > 1)
			{
				ShotAndDamage(70,1,1,GunFlashFront[my.skill6]);
			}
			
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Function_To_Pointer( "SpisalSold");
				return;
			}
			
			if (vec_dist(my.pos ,player.pos ) < __BreakDist)
			{				
				my.EnemyId = player.bodylnk;
				SolderShoting();
				return;
			}
			wait(1);
		}
	        
		//@ sit down
		my.FrameAnim = 100;
		while (my.FrameAnim > 0)
		{			
			ent_frame("4up" ,my.FrameAnim );
			my.FrameAnim -= speed/10;
			wait(1);
		}
		ent_frame("4stand" ,0 );
		
		//@ wait
		my.FrameAnim = 0;
		while (my.FrameAnim < 100)
		{
			my.FrameAnim += 1;

			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Function_To_Pointer( "SpisalSold");
				return;
			}
			
			if (vec_dist(my.pos ,player.pos ) < __BreakDist)
			{				
				my.EnemyId = player.bodylnk;
				SolderShoting();
				return;
			}
			
			wait(1);
		}

		//@ can i see the player, if not i'll wait.
		while (1)
		{
			trace_mode = ignore_me + ignore_passable + ignore_sprites ;
			trace(my.pos ,player.pos );
			if (you)
			{
				if (you._type ==_type_player)
				{
					break;
				}
			}

			if (vec_dist(my.pos ,player.pos ) < 200)
			{				
				my.EnemyId = player.bodylnk;
				SolderShoting();
				return;
			}
			wait(1);
		}
		
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

action SpisalSold
{
	InisialSold();					
	my.invisible = 1;
	my.shadow = 0;
	while (1)
	{
		if (object1.visible) && (object2.visible)
		{
			break;
		}
		wait(1);
	}
	my.invisible = 0;
	my.shadow = 1;

	my.EnemyId = player.BodyLnk;
	SpisalSoldAction();
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

define _GroupNumb , skill1;
define _OkToCreate ,flag1;

define __GroupA = 1;
define __GroupB = 2;
define __GroupC = 3;
define __GroupD = 4;

define __GroupADist = 650;
define __GroupBDist = 500;
define __GroupCDist = 500;
define __GroupDDist = 500;

define __SoldDist = 430;
define __PathOffset = 40;

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

/* ------------------------------------------------------------------------------------------------- */

var Offf = __PathOffset;
function StartRunning()
{			
	while (1)
	{
		MoveTurnFallAnimAndTarget( 20, 0.5);					
				
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me)< 50) 
		{			
			if (my.flag8){	Offf = __PathOffset;	  }
			else	     {	Offf = -1 * __PathOffset; }
			NexttargetOffset( 0, Offf, 0);
		}
		
		if (vec_dist(my.pos ,player.pos ) < my.skill8)
		{
			trace_mode = ignore_me + ignore_sprites + ignore_passable;
			trace(my.pos ,player.pos );
			if (you)
			{
				if (you._type == _type_player)
				{
					break;	
				}
			}
		}

		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "StartRunning");
			return;
		}

		wait(1);
	}

	my.EnemyId = player.bodylnk;
	SolderShoting();
}

/* ------------------------------------------------------------------------------------------------- */

function SelectPath()
{
	wait(1);	
	InisialSold();
		
	if (my.skill7 == 1)
	{		
		ent_path("Compars_path1");
		if (my.flag8)	{Offf = __PathOffset;	  }
		else		{Offf = -1 * __PathOffset;}
		NexttargetOffset( 1, Offf, 1);	
		goto steprun;
	}
	
	if (my.skill7 == 2)
	{		
		ent_path("Compars_path1");		
		if (my.flag8)	{Offf = __PathOffset;	  }
		else		{Offf = -1 * __PathOffset;}
		NexttargetOffset( 1, Offf, 12);
		goto steprun;
	}
	
	if (my.skill7 == 3)
	{		
		ent_path("Compars_path2");		
		if (my.flag8)	{Offf = __PathOffset;	  }
		else		{Offf = -1 * __PathOffset;}
		NexttargetOffset( 1, Offf, 6);
		goto steprun;
	}								

	if (my.skill7 == 4)
	{		
		ent_path("Compars_path3");		
		if (my.flag8)	{Offf = __PathOffset;	  }
		else		{Offf = -1 * __PathOffset;}
		NexttargetOffset( 1, Offf, 10);
		goto steprun;
	}
	
	if (my.skill7 == 5)
	{		
		ent_path("Compars_path1");		
		if (my.flag8)	{Offf = __PathOffset;	  }
		else		{Offf = -1 * __PathOffset;}
		NexttargetOffset( 1, Offf, 9);
		goto steprun;
	}
	

	if (my.skill7 == 6)
	{
		ent_path("CameraPath");		
		if (my.flag8)	{Offf = __PathOffset;	  }
		else		{Offf = -1 * __PathOffset;}
		NexttargetOffset( 1, Offf, 12);
		goto steprun;
	}

	if (my.skill7 == 7)
	{
		ent_path("CameraPath");		
		if (my.flag8)	{Offf = __PathOffset;	  }
		else		{Offf = -1 * __PathOffset;}
		NexttargetOffset( 1, Offf, 1);
	}
	
	steprun :
				
	my.skill8 = __SoldDist ;

	StartRunning();
}

/* ------------------------------------------------------------------------------------------------- */

function CreateSold(GroupNum)
{
	if (GroupNum == 1)
	{
		create(<psbom.mdl>,my.pos,SelectPath);			
		you.skill7 = my._GroupNumb;					
		you.skill8 = 5;
		you.skill6 = 7;
		you.pan = my.pan;

		wait(10 + random(5));
		
		create(<pcuzi.mdl>,my.pos,SelectPath);
		you.skill7 = my._GroupNumb;
		you.flag8 = 1;
		you.skill8 = 11;
		you.skill6 = 8;
		you.pan = my.pan;
		
		return;
	}

	if (GroupNum == 2)
	{
		create(<pcuzi.mdl>,my.pos,SelectPath);			
		you.skill7 = my._GroupNumb;
		you.skill8 = 11;
		you.skill6 = 8;
		you.pan = my.pan;

		wait( 10 + random(5));

		create(<psbom.mdl>,my.pos,SelectPath);
		you.skill7 = my._GroupNumb;
		you.flag8 = 1;
		you.skill8 = 5;
		you.skill6 = 7;
		you.pan = my.pan;
		
		return;
	}

	if (GroupNum == 3)
	{
		create(<psbom.mdl>,my.pos,SelectPath);			
		you.skill7 = my._GroupNumb;
		you.skill8 = 5;
		you.skill6 = 7;
		you.pan = my.pan;

		wait( 10 + random(5));

		create(<psgal.mdl>,my.pos,SelectPath);
		you.skill7 = my._GroupNumb;
		you.flag8 = 1;
		you.skill8 = 13;
		you.skill6 = 6;
		you.pan = my.pan;

		return;
	}

	if (GroupNum == 4)
	{
		create(<psbom.mdl>,my.pos,SelectPath);			
		you.skill7 = my._GroupNumb;					
		you.skill8 = 5;
		you.skill6 = 7;
		you.pan = my.pan;

		wait( 10 + random(5));

		create(<pcuzi.mdl>,my.pos,SelectPath);
		you.skill7 = my._GroupNumb;
		you.flag8 = 1;
		you.skill8 = 11;
		you.skill6 = 8;
		you.pan = my.pan;

		return;
	}

	if (GroupNum == 5)
	{
		create(<psbom.mdl>,my.pos,SelectPath);			
		you.skill7 = my._GroupNumb;
		you.skill8 = 5;
		you.skill6 = 7;
		you.pan = my.pan;

		wait( 10 + random(5));

		create(<psgal.mdl>,my.pos,SelectPath);
		you.skill7 = my._GroupNumb;
		you.flag8 = 1;
		you.skill8 = 13;
		you.skill6 = 6;
		you.pan = my.pan;

		return;
	}

	if (GroupNum == 6)
	{
		create(<psbom.mdl>,my.pos,SelectPath);			
		you.skill7 = my._GroupNumb;
		you.skill8 = 5;
		you.skill6 = 7;
		you.pan = my.pan;

		wait( 10 + random(5));

		create(<psgal.mdl>,my.pos,SelectPath);
		you.skill7 = my._GroupNumb;
		you.flag8 = 1;
		you.skill8 = 13;
		you.skill6 = 6;
		you.pan = my.pan;

		return;
	}

	if (GroupNum == 7)
	{
		create(<pcuzi.mdl>,my.pos,SelectPath);
		you.skill7 = my._GroupNumb;
		you.flag8 = 1;
		you.skill8 = 11;
		you.skill6 = 8;
		you.pan = my.pan;

		wait( 10 + random(5));

		create(<psgal.mdl>,my.pos,SelectPath);
		you.skill7 = my._GroupNumb;
		you.flag8 = 1;
		you.skill8 = 13;
		you.skill6 = 6;
		you.pan = my.pan;

		return;
	}
}

/* ------------------------------------------------------------------------------------------------- */

define _CreationDist , skill2;
var OkToCreate[7] = 0,0,0,0,0,0,0;

//@ this function control the cration of the coredor soldiers.
action SolderCreaPos()
{
	my.invisible = 1;
	my.passable = 1;
	my._OkToCreate = 1;

	while (1)
	{
		if (OkToCreate[my._GroupNumb - 1] == 1)
		{
			CreateSold(my._GroupNumb);
			wait(50);
			break;
		}

		wait(1);
	}

	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function control the senser that signal <SolderCreaPos> function to create coredor 
//@ soldier when neded this is after the water starts.
action checkPlayer
{
	my.passable = 1;
	my.invisible = 1;
	
	my.scale_x = 1;
	my.scale_y = 1;
	my.scale_z = 1;
	
	while (player == null)	{ wait(1); }
		
	while (1)
	{
		if (object1.visible ) && (object2.visible )
		{
			break;
		}
		wait(1);
	}  
	
	while (1)
	{						
		if (vec_dist(my.pos ,player.pos ) < my._CreationDist)
		{
			OkToCreate[my._GroupNumb - 1] = 1;
			wait(1);
			break;
		}
		wait(1);
	}
	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

var OkToGO = 0;

// @ this function control the solder behind ELOR.
function SolderBehindElor()
{		
	while (AttacPlayer == 0)
	{
		ent_cycle("stnd" ,my.FrameAnim);
		my.FrameAnim += speed/400;
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SolderBehindElor");
			return;
		}
		wait(1);
	}
				
	my.EnemyId = player.bodylnk;
	SolderShoting();
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function control the solder that open the door 
//@  and take permition to KALED to enter.
function SoldierOpenDoor()
{				
	while (my.skill7 ==0)
	{	
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SoldierOpenDoor");
			return;
		}
		wait(1);
	}
		
	my.skill7= 0;
	
	while (1)
	{		
		ent_cycle("2walk" ,my.FrameAnim);
		my.FrameAnim += speed/50;
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);		
		my.pan = NearAngle(my.pan,my_angle.pan,15*(speed/200));
		temp.x = speed/50;
		temp.y = 0;
		sonar(my,5000);
		temp.z = -result;
		move(my ,temp ,nullvector);

		//MoveTurnFallAnim2Target( 20, 0.5);

		vec_set( point_move.x, my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{		
			ent_nextpoint(my._target_x); 				
			my.skill7 += 1;
			OkToGO = 1;
			
			if (my.skill7 == 2)
			{
				my.skill7 = 0;			
				Play3dSound(5);								
				while (my.skill7 == 0)
				{
					if (AttacPlayer) { break; }
					if (SoldCheckIfHealthy())
					{ 
						my.LastState = Function_To_Pointer( "SoldierOpenDoor");
						return;
					}
					wait(1);
				}
				my.skill7 = 2;
			}
			
			if (my.skill7 == 3)
			{
				OkToEnter = 1;
				Play3dSound(6);
			}			
			
			if (my.skill7 == 5)
			{
				break;
			}
		}	
		
		if (AttacPlayer == 1) { break; }

		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SoldierOpenDoor");
			return;
		}
		wait(1);
	}

	if (AttacPlayer == 1)
	{
		my.EnemyId = player.bodylnk;
		SolderShoting();
		return;
	}
	else
	{
		my.FrameAnim = 0;
		while (AttacPlayer == 0)
		{
			ent_cycle("stnd",my.FrameAnim);
			my.FrameAnim += speed/400;
			if (SoldCheckIfHealthy())
			{
				my.LastState = Function_To_Pointer( "SoldierOpenDoor");
				return;
			}
			wait(1);
		}
		
		my.EnemyId = player.bodylnk;
		SolderShoting();
	}
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function control the soldiers in the second room of elor sweet
function SoldierInRoom2()
{
	my.FrameAnim = 0;
	while (AttacPlayer == 0)
	{
		ent_cycle("stnd" ,my.FrameAnim );
		my.FrameAnim +=speed/400;
		if (SoldCheckIfHealthy())
		{
			my.LastState = Function_To_Pointer( "SoldierInRoom2");
			return;
		}
		wait(1);
	}

	my.EnemyId = player.bodylnk;
	SolderShoting();
}

/* ------------------------------------------------------------------------------------------------- */

function EscapCallFroHelp()
{			
	while (1)
	{
		ent_cycle("1run" ,my.FrameAnim);
		my.FrameAnim += speed/25;
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);		
		my.pan = NearAngle(my.pan,my_angle.pan,15*(speed/200));				
		temp.x = speed/25;
		temp.y = 0;
		sonar(my,5000);
		temp.z = -result;
		move(my ,temp ,nullvector);

		//MoveTurnFallAnim2Target( 20, 0.5);
		
		vec_set( point_move.x, my._target_x);
		if ( EDistance(point_move,me)< 50)
		{	
			ent_nextpoint(my._target_x);
			my.skill7 += 1;
			if (my.skill7 == 4)  { OpenDoorToOutsideRoom();	}
			if (my.skill7  == 5) { break; }			
		}

		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer( "EscapCallFroHelp");
			return;
		}
		wait(1);
	}	
		
	if (hPlayerWins != 2)
	{
		MissionFalied(1);
	}	
}

/* ------------------------------------------------------------------------------------------------- */

function KitSoldAction()
{			
	while (1)
	{
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle.pan;

		MoveTurnFallAnim2Target( 20, 0.5);

		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50)
		{
			break;
		}

		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer( "KitSoldAction");
			return;
		}
		wait(1);
	}

	temp.x = player.x - my.x;
	temp.y = player.y - my.y;
	temp.z = player.z - my.z;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;

	lmgwait();
	//my.enemyid = player.bodylnk;
	//SolderShotting();	
}

/* ------------------------------------------------------------------------------------------------- */

function ExploSound()
{
	my.invisible = 1;
	my.passable = 1;
	play_entsound(you,MallaExplosion,100000);
	my.skill5 = result;

	while (snd_playing(my.skill5))	{	wait(1);	}
	remove(me);

}

/* ------------------------------------------------------------------------------------------------- */

function KitchenSoldier()
{	
	ent_path("KitchenSoldierPa");
	ent_waypoint(my._target_x,2);
	
	while (AttacPlayer == 0) 
	{		
		if (my._health < 0)
		{			
			break;
		}
		//@ smoke...
		my.FrameAnim = 0;
		while (my.FrameAnim < 100)
		{			
			
			if (my._health < 0) || (AttacPlayer)
			{
				break;
			}

			ent_frame("2smok", my.FrameAnim );
			my.FrameAnim += speed/200;
			wait(1);
		}

		my.skill7 = 250;
		if (int(random(1)) == 0){my.skill7 += random(50);}
		else			{my.skill7 -= random(50);}

		//@ breath...
		my.FrameAnim = 0;
		while (my.FrameAnim < my.skill7)
		{			
			
			if (my._health < 0) || (AttacPlayer)
			{
				break;
			}
			
			ent_cycle("2brth", my.FrameAnim );
			my.FrameAnim += speed/200;
			wait(1);
		}												
		wait(1);
	}
		

	AttacPlayer = 1;
	morph (<Scolt.mdl>,me);		
	removecoll(me);
	wait(1);
	InisialSold();		
	KitSoldAction();

	while (1)
	{		
		if (my._health < -100)
		{			
			create(<dust.mdl> , my.pos , ExploSound);
			create( <dust.mdl>, my.pos,AtomicExplosion);
			pKitchenSold = 2223729;
			my._health = -1000;
			break;
		}

		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

define _MyJop , skill7;
define __SoldInRoom2 = 1;
define __SoldStandSmok = 3;
define __SoldOpenDoor = 4;
define __SoldBehindElur = 5;
define __SoldCall4Help = 6;
define __SoldInKitchen = 7;

//@ this is the main function that control my soldier in elur room.
action MySoldiers
{		
	//@ skill 7 :  define the jop of each soldier in elur room
	
	InisialSold();
	ent_frame("stnd",0);
	
	while (StartTheGame == 0)
	{
		wait(1);
	}
	
	my.WeaponNumber = 1;
		
	if (my._MyJop == __SoldInRoom2)
	{			
		//@ 2 soldiers			
		SoldierInRoom2();
		return;
	}				

	//@ soldier 2 was deleted...
	//@ soldier 3 was deleted...
			
	if (my._MyJop == __SoldOpenDoor)
	{			
		ent_path("path_2");
		ent_waypoint(my._target_x , 2);		
		ent_frame("stnd",0);
		my.skill7 = 0;		
		Play3dSound(4);	
		SoldierOpenDoor();
		return;
	}

	if (my._MyJop == __SoldBehindElur)
	{
		SolderBehindElor();
		return;
	}

	if (my._MyJop == __SoldCall4Help)
	{
		ent_frame("stnd",0);
		ent_path("path_010");
		ent_waypoint(my._target_x,1);

		while(AttacPlayer == 0)
		{
			ent_cycle("stnd",my.FrameAnim);
			my.FrameAnim += speed/400;
			wait(1);
		}

		while (CallForHealp == 0)
		{
			wait(1);
		}

		my.skill7 = 0;
		EscapCallFroHelp();
		return;
	}

	if (my._MyJop == __SoldInKitchen)
	{
		pKitchenSold = entity_to_pointer(my);		
		KitchenSoldier();
	}	
}

/* ------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- */

//@ Ok To Create Suprise Soldiers.
var OkToCreateSupS[6] = 0,0,0,0,0,0;

//@ Control the Suprize soldiers after takeing the signal from
//@ <SuprizeSenser> function.

function Run4While()
{
	while (my.skill7 > 0)
	{
		my.skill7 -= 1;
		
		ent_cycle("1run" , my.FrameAnim );
		my.FrameAnim += speed/25;

		temp.x = speed/25;
		temp.y = 0;
		sonar(me,5000);
		temp.z = -result;
		move(me ,temp ,nullvector);
		
		if (SoldCheckIfHealthy())
		{
			my.LastState = Function_To_Pointer( "Run4While");
			return;
		}
		wait(1);
	}
	my.EnemyId = player.bodylnk;
	SolderShoting();
}

/* ------------------------------------------------------------------------------------------------- */

action SuprizeSoldier()
{		
	my.invisible = 1;
	my.passable = 1;
	my.shadow = 0;
	while (OkToCreateSupS[my.skill7 - 1] == 0)
	{
		wait(1);
	}
	InisialSold();
	my.invisible = 0;
	my.shadow = 1;
	
	my.skill7 = 25;
	Run4While();
}

/* ------------------------------------------------------------------------------------------------- */

//@ this function control the senser that OK the <SuprizeSoldier> function to create
//@   these soldiers.
action SuprizeSenser
{
	my.invisible = 1;
	my.passable = 1;
	
	while (player == null) { wait(1); }

	while (1)
	{
		if (object1.visible) && (object2.visible)
		{
			break;
		}
		
		//@ the soldier in the second room in elur sweet.
		if (my.skill1 == 1)
		{
			break;
		}
		wait(1);
	}
	
	while (1)
	{						
		if (vec_dist(my.pos ,player.pos) < my._CreationDist)
		{
			trace_mode = ignore_me + ignore_passable + ignore_sprites;
			trace(my.pos ,player.pos );
			if (you)
			{
				if (you._type == _type_player)
				{
					OkToCreateSupS[my.skill1 - 1] = 1;
					break;
				}
			}						
		}
		wait(1);
	}	
	remove(me);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                             compars functions                                   
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

function ComparsEvent()
{
	if (event_type == event_scan) && (indicator == _explode)
	{	
		my._health-=1000;
		return;
	}

	if (event_type == event_shoot) &&( indicator == _gunfire)
	{ 		
		my._health -= 50;
		showmessage(1,212);
	}
}


/* ------------------------------------------------------------------------------------------------- */

function ComparsInitial()
{	
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	//wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	// my.passable = 1;
	my.shadow = shadowenable;	
	my.wieght = 50;
	//wait(20);
	my.z-=CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 150;
	my.GotHit = 0;
	my._type = _type_compars;
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = ComparsEvent;

	my.DieEvent = Function_To_Pointer( "ComparsDie");
	my.HitEvent = Function_To_Pointer( "ComparsDie");
	my.CollFunction = Function_To_Pointer( "ComparsCollision");
}

/* ------------------------------------------------------------------------------------------------- */

function RondomCompars()
{
	var rn= 0;
	rn = int(random(3));
	
	if (rn == 0)
	{
		morph(<israelman.mdl>,me);
		my.skin = int(random(7));
		my.flag6 = 1;
		return;
	}
	if (rn == 1)
	{
		morph(<israelw1.mdl>,me);
		my.skin = int(random(7));
		return;
	}
	if (rn == 2)
	{
		morph(<israelw2.mdl>,me);
		my.skin = int(random(7));
		return;
	}		
}

/* ------------------------------------------------------------------------------------------------- */

function ComparsDie()
{
	exclusive_entity;
	stop_sound(S3dPlaying.z);
	death_sound(100);
	wait(1);

	RemoveColl(me);
	my.skill1=0;
	while (my.skill1<100)
	{				
		ent_frame("1DIE", my.skill1);				
		my.skill1 += speed/25;
		wait(1);
	}

	Play2dSound(3);
	wait(60);
	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */

define __ComparsSound = 1000;

sound S_M_HM7_30_C2 ,<M_HM7_30_C2.wav >;
sound S_M_HM7_31_C2 ,<M_HM7_31_C2.wav >;
sound S_M_HM7_36_C2 ,<M_HM7_36_C2.wav >;
sound S_M_HM7_29_C2 ,<M_HM7_29_C2.wav >;

function ComparsScreem()
{
	my.skill12 += 1;
	if (my.skill12 > my.skill13)
	{
		my.skill12 = 0;
		my.skill13 = 50 + random(50);
		
		if (my.skill30 == 1)
		{
			my.skill25 = int(random(3));
			if (my.skill25 == 0) { play_entsound(my,S_M_HM7_30_C2,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 1) { play_entsound(my,S_M_HM7_31_C2,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 2) { play_entsound(my,S_M_HM7_36_C2,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 3) { play_entsound(my,S_M_HM7_29_C2,__ComparsSound); S3dPlaying.z = result; return; }	
		}

		//@ Watting For the sounds from redwan.
		/*
		if (my.skill30 == 2)
		{
			my.skill25 = int(random(3));
			if (my.skill25 == 0) { play_entsound(my,S_M_HM7_29_2,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 1) { play_entsound(my,S_M_HM7_30_2,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 2) { play_entsound(my,S_M_HM7_31_2,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 3) { play_entsound(my,S_M_HM7_32_2,__ComparsSound); S3dPlaying.z = result; return; }	
		}

		if (my.skill30 == 3)
		{
			my.skill25 = int(random(3));
			if (my.skill25 == 0) { play_entsound(my,S_M_HM7_29_3,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 1) { play_entsound(my,S_M_HM7_30_3,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 2) { play_entsound(my,S_M_HM7_31_3,__ComparsSound); S3dPlaying.z = result; return; }
			if (my.skill25 == 3) { play_entsound(my,S_M_HM7_32_3,__ComparsSound); S3dPlaying.z = result; return; }	
		}
		*/
	}
}

/* ------------------------------------------------------------------------------------------------- */

function ComparsStartRuning()
{
	my.skill12 = 0;
	my.skill13 = 50 + random(50);
	while (1)
	{
		ent_cycle("RUN",my.FrameAnim);
		my.FrameAnim += speed/25;
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle.pan,20*(speed/200));
		temp.x = speed/25;
		temp.y = 0;
		sonar(my,5000);
		temp.z = -result;
		move(my ,temp ,nullvector);

		//MoveTurnFallAnim2Target( 20, 0.5);

		vec_set(point_move.x , my._target_x);
		if ( EDistance(point_move,me) < 50)
		{
			ent_nextpoint(my._target_x);
		}

		if (my._health < 0)
		{
			ComparsDie();
			break;
		}

		//@ this means that he is a mail compars .
		if (my.flag6)
		{
			ComparsScreem();
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

action MyCompars
{
	my.invisible = 1;
	my.passable = 1;
	
	while (1)
	{
		if (object1.visible ) && (object2.visible) 
		{
			break;
		}
		wait(1);
	}
	
	my.invisible = off;
	
	ComparsInitial();
	my.skill30 =1;
	//@ select the compars path
	if (my.defaultstate==4)
	{		
		ent_path("Compars_path1");
		ent_waypoint(my._target_x,1);
		goto WhatEver;
	}
	
	if (my.defaultstate==6)
	{		
		ent_path("Compars_path1");
		ent_waypoint(my._target_x,10);
		goto WhatEver;
	}
	
	if (my.defaultstate==7)
	{
		ent_path("Compars_path3");
		ent_waypoint(my._target_x,7);
		goto WhatEver;
	}
	
	if (my.defaultstate==8)
	{
		ent_path("Compars_path2");
		ent_waypoint(my._target_x,6);		
	}
	
	WhatEver:
	RondomCompars();
	ComparsStartRuning();
}


//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	                           Smokeing things Functions                                 
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

//@ this function control the items that make the smke when the player go out of Elure Room ,
//  and that start the fire in Elure Room.

sound FireAlarm ,  <FireAlarm.wav>;
sound BarrelFire , <BARRELFIRE.wav>;

function AAASSS()
{
	wait(100);
	while (1)
	{
		if (snd_playing(my.skill30) == 0)
		{
			wait(200);
			play_sound(FireAlarm , 30);
			my.skill30 = result;
			
		}
		wait(1);
	}
}
/* ------------------------------------------------------------------------------------------------- */

action FireAction
{
	my.passable = 1;
	my.invisible = 1;
	while (pKitchenSold != 2223729)
	{
		wait(1);
	}
	AAASSS();
	explosionscale = 0.25;
	while (1)
	{
		if (snd_playing(my.skill25) == 0)
		{
			play_entsound(me,BarrelFire,1000);
			my.skill25 = result;
		}

		if (player.y > 1340) &&  ((player.x > -2420) && (player.x < -2300))
		{
			HeartPlayerShowCompas(2);
		}

		temp.x = sin(my.frameanim*10)*explosionscale*2;
		temp.y = cos(my.frameanim*10)*explosionscale*2;
		temp.z = (10+random(10))*explosionscale;
		my_angle.x = (100-random(200))*explosionscale;
		my_angle.y = (100-random(200))*explosionscale;
		my_angle.z = (-random(24))*explosionscale;
		vec_add( my_angle, my.pos);
		effect( BlackMinismokeup, 1, my_angle, temp);	
		
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

action SmokeOnRoof
{
	my.passable = 1;
	my.invisible = 1;
	while (pKitchenSold != 2223729)
	{
		wait(1);
	}
	my.invisible = 0;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	                            Elur Functions                                 
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

var pElurChar = 0;
action Elur_char
{
	pElurChar = entity_to_pointer(my);
}

/* ------------------------------------------------------------------------------------------------- */

function ElurDie()
{
	exclusive_entity;
	stop_sound(S3dPlaying) ;
	my.skill1 = 0;
	while (my.skill1 < 100)
	{
		ent_frame("die" ,my.skill1);
		my.skill1 += speed/25;
		wait(1);
	}
	RemoveColl(me);

	if (my.flag8 == 0)
	{
		showmessage(1,209);
		wait(5);
		if (hPlayerWins != 2)
		{
			MissionFalied(0);
		}		
	}
}

/* ------------------------------------------------------------------------------------------------- */

define __PlayerElureDes = 150;
define __DefultTime = 200;

function ElurMessages2()
{
	Play3dSound(15);

	while (my.flag8 == 0)
	{		
		wait(1);
	}

	showmessage(1,180);
	play_entsound(my, S_M_HM7_27 , __ElurVol);
	S3dPlaying = result;
		
	while (snd_playing(S3dPlaying))
	{
		wait(1);
	}
		
	showmessage(1,176);
	play_entsound(my, S_M_HM7_21 , __ElurVol);
	S3dPlaying = result;
		
	while (1)
	{
		if (vec_dist(my.pos ,player.pos) < __PlayerElureDes)
		{
			my.skill13 += 1;
			if (my.skill13 > __DefultTime )
			{
				my.skill13 = 0;
				Play3dSound(16);
			}
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

function ElurMessages()
{
	my.skill13 +=1;
	if (my.skill13 > my.skill14)
	{
		my.skill13 = 0;
		my.skill14 = __DefultTime + random(50);
		
		my.skill13 = int(random(3));
		if (my.skill13 == 0)
		{
			showmessage(1,179);
			play3dsound(1);
		}
		else
		{
			if (my.skill13 == 1)
			{
				showmessage(1,168);
				play3dsound(2);
			}
			else
			{
				showmessage(1,169);
				play3dsound(3);
			}
		}
		my.skill13 = 0;				
	}
}

/* ------------------------------------------------------------------------------------------------- */
define __ElurTime = 250;
define __ElurDist = 250;

function elue_state()
{                  
	//@ Elure Wait for ahmed...
	
	my.skill40 =0;
	while (AttacPlayer == 0)
	{		
		ent_cycle("dskst",my.skill40);
		my.skill40 += speed/200;		
		if (OkToEnter)
		{
			ElurMessages();
		}
		
		wait(1);
	}

	ElurMessages2();
	//@ move the char and hide elur	
	you = pointer_to_entity(pElurChar);
	while (ang(you.pan) > -90)
	{
		you = pointer_to_entity(pElurChar);
		you.pan -= 15;
		my.pan -=15;
		wait(1);
	}
	
	my.skill40 = 0;
	while (my.skill40 < 100)
	{
		ent_frame( "1hide" , my.skill40);
		my.y -= 3;
		my.z -= 1.5;
		my.skill40 +=10;
		wait(1);
	}

	my.skill40 = 0;
	my.skill41 = 1;
	while (my.skill40 < 20)
	{
		you = pointer_to_entity(pElurChar);
		you.pan += my.skill41;
		my.skill41 -=0.05;
		my.skill40 +=1;				
		wait(1);
	}	

	//@ Waiting to die
	
	my.skill40 = __ElurTime;
	while (my._health > 0)
	{	
		if (vec_dist(my.pos ,player.pos ) < __ElurDist) && (my.flag8 == 0)
		{
			temp.x = 0;
			temp.y = 0;
			temp.z = 10;
			vec_add(temp,my.pos);

			trace_mode = ignore_me + ignore_passable + ignore_sprites;
			trace(temp ,player.pos);
			if (you)
			{
				if (you._type == _type_player)
				{
					my.skill40 += 1;
					if (my.skill40 > __ElurTime)
					{
						my.skill40 = 0;
						showmessage(1,200);
					}
				}
			}
		}
		else
		{
			my.skill40 = __ElurTime;
		}

		ent_cycle("hide" ,my.FrameAnim);
		my.FrameAnim += speed/200;

		wait(1);
	}

	ElurDie();
}

/* ------------------------------------------------------------------------------------------------- */

function ElurEvent()
{	
	if (event_type == event_scan) && (indicator == _explode)
	{	
		my._health-=1000;
		return;
	}

	if (event_type == event_shoot) &&( indicator == _gunfire)
	{ 		
		my._health -= 300;
	}

	if (event_type == event_scan) && (MyIndecator == _h_PlayerScaning)
	{
		my.flag8 = 1;
		MisionsMsg3.ambient = -100;		
	}
}

/* ------------------------------------------------------------------------------------------------- */

//@ this is the main function that control Elur Behaviour.
action Elur
{
	//@ skill 12 ,13,14 : Counter;
	//@ skill 41     : Switch;
	//@ flag 1
	//@ flag 8
	
	while (StartTheGame == 0)
	{
		wait(1);
	}

	ComparsInitial();			
	wait(1);
	my.event = ElurEvent;	
	my.skill14 = __DefultTime + random(50);
	my.skill13 = my.skill14;	
	
	elue_state();		
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                              Water Sprincels Functions                                  
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

function Water_Fall_property() 
{
	if (freeze_mode)
	{

		my.lifespan += 1;
	}
	else
	{
		if (my.size>0.1*speed/200)
		{
			my.size-=0.1*speed/200;
		}
		my.x += my.vel_x*speed/200;
		my.y += my.vel_y*speed/200;
		my.z += my.vel_z*speed/200;
		my.vel_z -= speed/200;
		my.alpha-=speed/100;
		my.lifespan += 1;
		if (my.alpha<=0) 
		{
			my.lifespan=0;
		}
	}
}

/* ------------------------------------------------------------------------------------------------- */

function Water_Fall() 
{
	my.size=1+random(1);
	my.bmap=AtomSmoke;
	my.move=0;
	my.bright=1;
	my.alpha=20+random(20);
	my.function=Water_Fall_property;
}

/* ------------------------------------------------------------------------------------------------- */

function WaterFall2()
{
	my.passable = 1;

	my.scale_x = 3;
	my.scale_y = 3;
	my.scale_z = 3;

	my.bright = 1;
	my.frame = 2;
	my.alpha = 30;
	while (1)
	{
		my.v -= 20;
		my.skill2 = 0;
		while (my.skill2<10)
		{
			temp.x = 10+random(5);
			temp.y = 0;
			temp.z = 0;
			my.skill1+=45;
			my_angle.pan = my.skill1;
			my_angle.tilt = -random(180);
			vec_rotate( temp, my_angle);
			effect( Water_Fall, 1, my.pos, temp);
			my.skill2+=1;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

action WaterFall()
{
	my.scale_x = 0.1;
	my.scale_y = 0.1;
	my.scale_z = 0.1;
	
	while (pKitchenSold != 2223729) { wait(1); }	
	create(<watercoin.mdl> , my.pos ,WaterFall2 );
	
	wait(50);
	while (1)
	{
		if (snd_playing(my.skill20) == 0)
		{
			play_entsound(me ,WaterJet , 1000);
			my.skill20 = result;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------- */

function MirrorAct()
{
	my.bright = 1;
	my.flare = 1;
	while (1)
	{
		temp.x = camera.x - my.x;
		temp.y = camera.y - my.y;
		temp.z = camera.z - my.z;
		vec_to_angle( temp, temp);
		my.u = -temp*2;
		wait(1);
	}
}