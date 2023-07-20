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
	type = <pressmsg.tga>;
	view = camera;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = -20;
	layer=4;
}

entity splashscreen
{
	type = <Lev9Load.bmp>;
	view = camera;
	flags = visible;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = 0;
	layer=3;
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
//include <apatchi.wdl>;
include <CarsStuf.wdl>;

var video_mode = 7;
var video_depth = 16;
string level_str = <level09h.WMB>; // give file names in angular brackets

/* ##---------------------------------------------------------------------## */
/* ##---------------------------------------------------------------------## */

function main()
{	
	str_cpy(levelpath,"PPoint3.pts");
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;
	play_sound(StartSound,100);
	StartSoundh=result;
	fog_color=1;
	camera.fog=4;
	clip_range = 4000;	
	tex_share = on;
	wait(3);
	level_load(level_str);
	wait(1);
	initilization();
	MyMain();
}
/* ##---------------------------------------------------------------------## */
/* ##---------------------------------------------------------------------## */

function SetViewBright(CMBr)
{
		camera.ambient = CMBr-100;
		blackface.alpha = abs(min(0, camera.ambient)/3);

}

/* --------------------------------------------------------------------- */

function NewlevelOrloaded()
{
	stop_sound(p2dSound);
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}

/* --------------------------------------------------------------------- */

function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//						Comon functions 
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//@ ObjecPos  skill_1             : Used To Hold Van As Target To the helocopter.
//@ VWeaponSprite1 flag_1 ,flag_2 : Uset To indecate that the player distroied the dodg car number 2 and the helocopter.
//@ VWeaponSprite1 flag_7 ,flag_8 : Used to indecate the hummer numer 1 and landrover numer 2 are exploded.
//@ VWeaponSprite1 Skill_1	  : Hold the pointer of the hummer car number 2 witch distoy items when it moves.
//@ VWeaponSprite1 Skill 6 --> 12 : hold pointer to soldiers in the ChemBet Center, so i can remove them when player id out range.
//@ VWeaponSprite1 skill 20 , 21  : hold the pointer of hummer 1 and landrover 2.
//@ VWeaponSprite1 skill 22 , 23  : hold a pointer to hummer 5 <dodg 2> and the helocopter.

sound S_M_L9_00 , <M_L9_00.wav>;
sound S_M_L9_01 , <M_L9_01.wav>;
sound S_M_L9_02 , <M_L9_02.wav>;
sound S_M_L9_03 , <M_L9_03.wav>;
sound S_M_L9_05 , <M_L9_05.wav>;
sound S_M_L9_06 , <M_L9_06.wav>;
sound S_M_L9_07 , <M_L9_07.wav>;
sound S_M_L9_08 , <M_L9_08.wav>;
sound S_M_L9_09 , <M_L9_09.wav>;
sound S_M_L9_10 , <M_L9_10.wav>;
sound S_M_L9_11 , <M_L9_11.wav>;
sound S_M_L9_12 , <M_L9_12.wav>;
sound S_M_L9_13 , <M_L9_13.wav>;
sound S_M_L9_14 , <M_L9_14.wav>;
sound S_M_L9_15 , <M_L9_15.wav>;
sound S_M_L9_16 , <M_L9_16.wav>;
sound S_M_L9_17 , <M_L9_17.wav>;

function Play2DSound(iID)
{
	if (iID == 1) { showmessage(1,131 ); play_sound(S_M_L9_00,100); p2dSound = result  ; return;}
	if (iID == 2) { showmessage(1,135 ); play_sound(S_M_L9_05,100); p2dSound = result  ; return;}
	if (iID == 3) { showmessage(1,144 ); play_sound(S_M_L9_14,100); p2dSound = result  ; return;}
	if (iID == 4) 
	{ 
		showmessage(1,137); 
		play_sound(S_M_L9_07,100); 
		p2dSound = result;	

		while (snd_playing(p2dSound)) { wait(1); }
		
		showmessage(1,132); 
		play_sound(S_M_L9_01,100); 
		p2dSound = result;
		return;
	}
	if (iID == 5) { showmessage(1,143); play_sound(S_M_L9_13,100); p2dSound = result; return;}
	if (iID == 6)
	{ 
		showmessage(1,133); 
		play_sound(S_M_L9_02,100);
		p2dSound = result;
		
		while (snd_playing(p2dSound)) {	wait(1); }
		
		showmessage(1,139); 
		play_sound(S_M_L9_09,100);
		p2dSound = result;	
		return;
	}

	if (iID == 7) { showmessage(1,140); play_sound(S_M_L9_10,100); p2dSound = result ; return;}
}

/* --------------------------------------------------------------------- */

function MyMain()
{
	
	iCameraAngles.pan = 0;
	iCameraAngles.tilt = 0;
	iCameraAngles.roll = 0;
	while (player == null)
	{
	wait(1);
	}
	myShowmessions();
	wait(50);
	
	if (level.y == 3)
	{
		MovieOrSucess = 1;
	}
	
	while (LetTheGameBegin == 0)
	{
	wait(1);
	}
	Play2DSound(1);	
}

/* --------------------------------------------------------------------- */

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
}

/* --------------------------------------------------------------------- */

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

/* --------------------------------------------------------------------- */

//@ this function control the light in gard house in <chem bit>
define __RedLightSpeed = 30;
action LightInGard
{
	my.passable = 1;	
	my.lightrange = 50;
	my.skill1 = __RedLightSpeed;

	while (iPlayerCarPos < 6)
	{
		my.red += my.skill1;

		if (my.red > 255) { my.skill1 = -__RedLightSpeed; }
		if (my.red < 30 ) { my.skill1 =  __RedLightSpeed; }
		wait(1);
	}
	remove(me);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//						Soldier functions
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

define _MyJop , skill7;
define _PointNumber , skill30;

define __RunFireOnPlayer = 2;
define __StandFireOnPlayer = 3;
define __RoadBlock = 4;
define __AttackPlayer = 5;

function InisialSold()
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	//wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	//my.WeaponNumber = my.skill8;		
	//wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	SolderCounter+=1;	
	my.wieght = 50;
	//wait(20);	
	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;	
	my.AnimShot = IGunFire;
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

/* --------------------------------------------------------------------------------------------------------- */
//@				 Runnimg Soldiers functions
/* --------------------------------------------------------------------------------------------------------- */

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

/* --------------------------------------------------------------------------------------------------------- */

function RuningSoldiers()
{
	if (my.skill7 != 6)
	{
		my.skill7 = abs(my.skill8) - random (50);
	}
	else
	{
		my.skill7 = 30 + random(25) + random(25);
	}
	
	while (my._PointNumber < 3)
	{
		MoveTurnFallAnimAndTarget( 30, 0.5);
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < my.skill7) 
		{						
			NexttargetOffset( 0, my.skill8, 0);
			my._PointNumber += 1;						
		}

		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "RuningSoldiers");
			return;
		}
		wait(1);
	}	
	my.EnemyId = player.bodylnk;
	SolderShoting();
}

/* --------------------------------------------------------------------------------------------------------- */
//@				Soldier On Road Bloks Functions
/* --------------------------------------------------------------------------------------------------------- */

sound S_M_HM8_22 , <M_HM8_22.wav>;
sound S_M_HM8_23 , <M_HM8_23.wav>;
sound S_M_HM8_24 , <M_HM8_24.wav>;
sound S_M_HM8_25 , <M_HM8_25.wav>;
sound S_M_HM8_26 , <M_HM8_26.wav>;
sound S_M_HM8_27 , <M_HM8_27.wav>;
sound S_M_HM8_28 , <M_HM8_28.wav>;
sound S_M_HM8_29 , <M_HM8_29.wav>;
//sound S_M_HM8_30 , <M_HM8_30.wav>;
sound S_M_HM8_31 , <M_HM8_31.wav>;
sound S_M_HM8_32 , <M_HM8_32.wav>;
sound S_M_HM8_33 , <M_HM8_33.wav>;
sound S_M_HM8_34 , <M_HM8_34.wav>;
sound S_M_HM8_35 , <M_HM8_35.wav>;
sound S_M_HM8_36 , <M_HM8_36.wav>;
sound S_M_HM8_37 , <M_HM8_37.wav>;
sound S_M_HM8_38 , <M_HM8_38.wav>;

define __BlookSoldierVol = 1000;
function BlookSoldiersVoice()
{
	var RandomVoice = 0;
	RandomVoice = int(random(15));

	if (RandomVoice == 0 ) { play_entsound(me,S_M_HM8_22,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 1 ) { play_entsound(me,S_M_HM8_23,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 2 ) { play_entsound(me,S_M_HM8_24,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 3 ) { play_entsound(me,S_M_HM8_25,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 4 ) { play_entsound(me,S_M_HM8_26,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 5 ) { play_entsound(me,S_M_HM8_27,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 6 ) { play_entsound(me,S_M_HM8_28,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 7 ) { play_entsound(me,S_M_HM8_29,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 8 ) { play_entsound(me,S_M_HM8_31,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 9 ) { play_entsound(me,S_M_HM8_32,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 10) { play_entsound(me,S_M_HM8_33,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 11) { play_entsound(me,S_M_HM8_34,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 12) { play_entsound(me,S_M_HM8_35,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 13) { play_entsound(me,S_M_HM8_36,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 14) { play_entsound(me,S_M_HM8_37,__BlookSoldierVol); my.skill7 = result;  return; }
	if (RandomVoice == 15) { play_entsound(me,S_M_HM8_38,__BlookSoldierVol); my.skill7 = result;  return; }	
}

/* --------------------------------------------------------------------- */

function RoadBlockShotting()
{
	my.skill7 = 0;
	while (1)
	{ 
		temp.x = player.x - my.x;
		temp.y = player.y - my.y;
		temp.z = player.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle.pan;

		if (random(100) > 98)
		{
			if (snd_playing(my.skill7) == 0)
			{
				
				BlookSoldiersVoice();	
			}			
		}

		if (random(5) > 3)
		{
			Short_GunFlash(me,GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
			if (random(5) > 3)
			{
				WeaponSound3d(lmg);
			}
			else
			{
				WeaponSound3d(m16);
			}
		}
		
		if (iPlayerCarPos >= 11) && (my.skill8 == 1) { my.invisible = 1; my._health = -1000; }
		if (iPlayerCarPos >= 44) && (my.skill8 == 2) { my.invisible = 1; my._health = -1000; }
		if (iPlayerCarPos >= 50) && (my.skill8 == 3) { my.invisible = 1; my._health = -1000; }
		if (iPlayerCarPos >= 46) && (my.skill8 == 4) { my.invisible = 1; my._health = -1000; }
		
		if (SoldCheckIfHealthy())
		{
		        my.LastState = Function_To_Pointer( "RoadBlockShotting");
			return;
		}
		wait(1);
	}
}  

/* --------------------------------------------------------------------------------------------------------- */

function RoadBolck()
{				
	if (my.flag8)			{ ent_frame("2shot" , 50); }
	else
	{
		if (random(2) > 1)	{ ent_frame("6shot" , 50); }
		else			{ ent_frame("4shot" , 50); }
	}
		
	my.EnemyId = player.bodylnk;
	my.WeaponNumber = m16;
	if (my.skill8 == 1)
	{
		while (iPlayerCarPos  < 5) { wait(1); }
		RoadBlockShotting();
		return;
	}

	if (my.skill8 == 2)
	{
		while (iPlayerCarPos  < 32) { wait(1); }
		RoadBlockShotting();
		return;
	}

	if (my.skill8 == 3)
	{
		while (iPlayerCarPos  < 46) { wait(1); }
		RoadBlockShotting();
		return;
	}

	if (my.skill8 == 4)
	{
		while (iPlayerCarPos  < 37) { wait(1); }
		RoadBlockShotting();
		return;
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//@					  Soldiers Main Function
/* --------------------------------------------------------------------------------------------------------- */

function RemoveMySoldiers(pYou)
{
	you = pYou;
	if (you) 
	{ 
		you.invisible = 1; 
		you.shadow = 0;
		you._health = -50000; 
	}
}

/* ------------------------------------------------ */

action MySoldiers
{
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);

	while (player == null) { wait(1); }
	InisialSold();

	if (my._MyJop == __RoadBlock)
	{
		RoadBolck();
		return;
	}

	//@ Registring the soldier into VWeaponSprite1 skills 6 --> 11.
	LetTheGameBegin.z += 1;
	if (LetTheGameBegin.z == 1) { VWeaponSprite1.skill6  = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 2) { VWeaponSprite1.skill7  = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 3) { VWeaponSprite1.skill8  = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 4) { VWeaponSprite1.skill9  = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 5) { VWeaponSprite1.skill10 = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 6) { VWeaponSprite1.skill11 = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 7) { VWeaponSprite1.skill12 = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 8) { VWeaponSprite1.skill13 = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 9) { VWeaponSprite1.skill14 = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 10){ VWeaponSprite1.skill15 = entity_to_pointer(me); goto Sold1; }
	if (LetTheGameBegin.z == 11){ VWeaponSprite1.skill16 = entity_to_pointer(me);		  }
	Sold1:

	if (my._MyJop == __StandFireOnPlayer)
	{
		my.WeaponNumber = m16;
		my.EnemyId = player.bodylnk;
		SolderShoting();		
	}

	if (my._MyJop == __RunFireOnPlayer)
	{
		ent_path("SoldierPath2");
		NexttargetOffset(1,0,1);
		my.WeaponNumber = m16;
		RuningSoldiers();
	}
	
	if (my._MyJop == __AttackPlayer)
	{		
		ent_path("PlyaerCarPath");
		if (my.flag8)
		{
			NexttargetOffset(1,my.skill8,19);
		}
		else
		{
			NexttargetOffset(1,my.skill8,16);
		}
		
		my.WeaponNumber = m16;
		my._PointNumber = 2;
		while (iPlayerCarPos < 16 ) { wait(1); }
		RuningSoldiers();
		while (iPlayerCarPos < 24 ) { wait(1); }
	}
	
	if (my._MyJop == 6)
	{
		ent_path("FirestBlockSolPath");		
		NexttargetOffset(1,my.skill8,1);
		my.WeaponNumber = m16;
		my.skill6 = 1;
		my._PointNumber = 0;
		my.invisible= 1;
		my.shadow = 0;
		while (iPlayerCarPos < 16 ) { wait(1); }
		wait(45);
		my._health = 0;
		my.invisible = 0;
		my.shadow = 1;
		RuningSoldiers();
		while (iPlayerCarPos < 24 ) {wait(1); }		
	}

	if (my._MyJop == 6) || (my._MyJop == __AttackPlayer)
	{
		RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill12) );	
		RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill13) );	
		RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill14) );	
		RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill15) );	
		RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill16) );	
	}

	while (iPlayerCarPos < 11 ) { wait(1); }

	RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill6)  );
	RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill7)  );
	RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill8)  );
	RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill9)  );
	RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill10) );
	RemoveMySoldiers( pointer_to_entity(VWeaponSprite1.skill11) );
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//						Car functions
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function CarsEvent()
{
	if (event_type == event_shoot) && (indicator == _gunfire)
	{
		my._health -= damage/20;
	}		
}

/* --------------------------------------------------------------------------------------------------------- */
//@				          Cars Intialization ....
/* --------------------------------------------------------------------------------------------------------- */

function InistalCarSpeed(iForce,iMaxSpeed,iBreaks,iAxceleration)
{
	my.CarForce = iForce;
	my._MaxSpeed = iMaxSpeed;	
	my._break = iBreaks;	
	my._Axceleration = iAxceleration;	
	my._GasPedal = 1;
}

/* -------------------------------------------------------- */

function InistalCarPath(sPathName,iPathOffset,iPointToStart,iImmediateShiftDegree)
{
	ent_path(sPathName);
	my._PathOffset = iPathOffset; 
	NexttargetOffset(1,my._PathOffset,iPointToStart);
	my._PointNumber = iPointToStart - 1;
	my._ImmediateShiftDegree = iImmediateShiftDegree;	
}

/* -------------------------------------------------------- */

function InistalCarPathParam(bUseSmothAngle,iSmothingDegree,iDistToMoveToNextPoint)
{
	my._UseSmothPan = bUseSmothAngle;
	my._SmothingDegre = iSmothingDegree;
	my._Dest2Move2SecPoint = iDistToMoveToNextPoint;	
}

/* -------------------------------------------------------- */

//@ this funciton inistal the cars.
function InistalCar()
{			
	sonar(my,10000);
	my.z = target.z +abs(my.min_z) + 20;

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
	my.event = CarsEvent;
	my.OwnType = TypeOfEngines;
	my.CollFunction  = Function_To_Pointer("ComparsCollision");
	
	var R_R;
	R_R = int(random(4));
	if (R_R == 1)	{my.skin = 1;}
	if (R_R == 2)	{my.skin = 2;}
	if (R_R == 3)	{my.skin = 3;}
	if (R_R == 4)	{my.skin = 4;}
	if (R_R == 0)	{my.skin = 5;}
		
	if (my._CarType != __WaterTank) && (my._CarType != __BaradTank)
	{
		create(<LightFx.tga>,my.pos , LightFX);
		my._LightEffect = entity_to_pointer(you);
	}

	if (my._CarType == __Hummer)
	{		
		my._health = 350;

		my._FrontRightWheel_Vertex = __Hummer_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Hummer_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Hummer_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Hummer_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( WheelHUm ,__Hummer_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( WheelHUm ,__Hummer_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( WheelHUm ,__Hummer_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( WheelHUm ,__Hummer_BackLeftWheel   ,__BackWheel );				
		
		my._FrontRightLight = CreateMyLights( ComonLight ,__Hummer_FrontRightLight );
		my._FrontLeftLight  = CreateMyLights( ComonLight ,__Hummer_FrontLeftLight  );

		create(<cklmg.mdl>,my.pos,HummerSoldier);
		my._MySoldier = Entity_To_Pointer(you);
		
		return;
	}
	
	if (my._CarType == __LandRover)
	{				
		my.skin = 1;
		my._health = 600;

		my._FrontRightWheel_Vertex = __LandRover_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __LandRover_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __LandRover_BackRightWheel;
		my._BackLeftWheel_Vertex   = __LandRover_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( LandRoverWheel ,__LandRover_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( LandRoverWheel ,__LandRover_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( LandRoverWheel ,__LandRover_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( LandRoverWheel ,__LandRover_BackLeftWheel   ,__BackWheel );
		
		my._FrontRightLight = CreateMyLights( ComonLight ,__LandRover_FrontRightLight );
		my._FrontLeftLight  = CreateMyLights( ComonLight ,__LandRover_FrontLeftLight  );
		
		temp.x = 10;
		temp.y = 0;
		temp.z = 35;
		vec_rotate(temp , my.pan);
		vec_add(temp,my.pos);		
		create(<landroversiren.mdl>,temp,LandRoverSirenAct);
		you.pan = my.pan;
		my._SirenModle = entity_to_pointer(you);

		return;
	}
	
	if (my._CarType == __Ceterween)
	{		
		my._health = 85;
		my._FrontRightWheel_Vertex = __Ceterween_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Ceterween_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Ceterween_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Ceterween_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( WheelCetr ,__Ceterween_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( WheelCetr ,__Ceterween_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( WheelCetr ,__Ceterween_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( WheelCetr ,__Ceterween_BackLeftWheel   ,__BackWheel );
		
		my._FrontRightLight = CreateMyLights( ComonLight , __Ceterween_FrontRightLight);
		my._FrontLeftLight  = CreateMyLights( ComonLight , __Ceterween_FrontLeftLight);
		return;
	}
	
	if (my._CarType == __Dodg)
	{						
		/*
		//@ this type of cars are no longer used... i use the hummer cars to do the same jop.

		my._health = 150;
		removeColl(me);
		my._FrontRightWheel_Vertex = __Dodg_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Dodg_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Dodg_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Dodg_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( WheelDodg ,__Dodg_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( WheelDodg ,__Dodg_FrontLeftWheel  ,__FrontWheel);						
		my._BackRightWheel  = CreateMyWheele( WheelDodg ,__Dodg_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( WheelDodg ,__Dodg_BackLeftWheel   ,__BackWheel );
		
		my._FrontRightLight = CreateMyLights( ComonLight ,__Dodg_FrontRightLight );
		my._FrontLeftLight  = CreateMyLights( ComonLight ,__Dodg_FrontLeftLight  );
		
		vec_for_vertex(temp,me,263);
		//create(<ckgal.mdl>,temp,HummerSoldier);
		create(<ckgal.mdl>,temp,DodgSoldiers);
		my._MyRBGSoldier = entity_to_pointer(you);
		
		vec_for_vertex(temp,me,264);		
		//create(<ckgal.mdl>,temp,HummerSoldier);
		create(<ckgal.mdl>,temp,DodgSoldiers);
		my._MySoldier = entity_to_pointer(you);
		*/
		return;
	}
	
	if (my._CarType == __Golf)
	{		
		my._health = 85;
		my._FrontRightWheel_Vertex = __Golf_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Golf_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Golf_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Golf_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( WheelGolf ,__Golf_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( WheelGolf ,__Golf_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( WheelGolf ,__Golf_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( WheelGolf ,__Golf_BackLeftWheel   ,__BackWheel );				
		
		my._FrontRightLight = CreateMyLights( ComonLight , __Golf_FrontRightLight);
		my._FrontLeftLight  = CreateMyLights( ComonLight , __Golf_FrontLeftLight);

		return;
	}
	
	if (my._CarType == __Nissan)
	{		
		my._health = 85;
		my._FrontRightWheel_Vertex = __Nissan_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Nissan_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Nissan_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Nissan_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( Wheelnissan ,__Nissan_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( Wheelnissan ,__Nissan_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( Wheelnissan ,__Nissan_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( Wheelnissan ,__Nissan_BackLeftWheel   ,__BackWheel );
		
		my._FrontRightLight = CreateMyLights( ComonLight , __Nissan_FrontRightLight);
		my._FrontLeftLight  = CreateMyLights( ComonLight , __Nissan_FrontLeftLight);
		return;
	}
	
	if (my._CarType == __Van)
	{								
		my._health = 85;
		my._FrontRightWheel_Vertex = __Van_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Van_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Van_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Van_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( WheelVan ,__Van_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( WheelVan ,__Van_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( WheelVan ,__Van_BackRightWheel  ,__BackWheel);
		my._BackLeftWheel   = CreateMyWheele( WheelVan ,__Van_BackLeftWheel   ,__BackWheel);
		
		my._FrontRightLight = CreateMyLights( ComonLight ,__Van_FrontRightLight );
		my._FrontLeftLight  = CreateMyLights( ComonLight ,__Van_FrontLeftLight  );

		return;
	}

	if (my._CarType == __Trak1)
	{						
		my._health = 100;
		my._FrontRightWheel_Vertex = __Trak1_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Trak1_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Trak1_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Trak1_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( Trak1Wheel ,__Trak1_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( Trak1Wheel ,__Trak1_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( Trak1Wheel ,__Trak1_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( Trak1Wheel ,__Trak1_BackLeftWheel   ,__BackWheel );
		
		my._FrontRightLight = CreateMyLights( ComonLight ,__Track1_FrontRightLight );
		my._FrontLeftLight  = CreateMyLights( ComonLight ,__Track1_FrontLeftLight  );
		return;
	}
	
	if (my._CarType == __WaterTank)
	{				
		my._health = 90;
		my._FrontRightWheel_Vertex = __WaterTank_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __WaterTank_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __WaterTank_BackRightWheel1;
		my._BackLeftWheel_Vertex   = __WaterTank_BackLeftWheel1;
		my._BackRightWheel2_Vertex = __WaterTank_BackRightWheel2;
		my._BackLeftWheel2_Vertex  = __WaterTank_BackLeftWheel2;

		my._FrontRightWheel = CreateMyWheele( WaterTankWheel ,__WaterTank_FrontRightWheel ,__BackWheel );
		my._FrontLeftWheel  = CreateMyWheele( WaterTankWheel ,__WaterTank_FrontLeftWheel  ,__BackWheel );
		my._BackRightWheel  = CreateMyWheele( WaterTankWheel ,__WaterTank_BackRightWheel1 ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( WaterTankWheel ,__WaterTank_BackLeftWheel1  ,__BackWheel );
		my._BackRightWheel2 = CreateMyWheele( WaterTankWheel ,__WaterTank_BackRightWheel2 ,__BackWheel );
		my._BackLeftWheel2  = CreateMyWheele( WaterTankWheel ,__WaterTank_BackLeftWheel2  ,__BackWheel );
		
		return;
	}
	
	if (my._CarType == __Trak2)
	{				
		my._health = 100;
		my._FrontRightWheel_Vertex = __Trak2_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Trak2_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Trak2_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Trak2_BackLeftWheel;

		my._FrontRightWheel = CreateMyWheele( Burad2Wheel ,__Trak2_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( Burad2Wheel ,__Trak2_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( Burad2Wheel ,__Trak2_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( Burad2Wheel ,__Trak2_BackLeftWheel   ,__BackWheel );
		
		my._FrontRightLight = CreateMyLights( ComonLight ,__Track2_FrontRightLight );
		my._FrontLeftLight  = CreateMyLights( ComonLight ,__Track2_FrontLeftLight  );

		return;
	}
	
	if (my._CarType == __BaradTank)
	{				
		my._health = 90;
		my._FrontRightWheel_Vertex = __BaradTank_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __BaradTank_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __BaradTank_BackRightWheel1;
		my._BackLeftWheel_Vertex   = __BaradTank_BackLeftWheel1;
		my._BackRightWheel2_Vertex = __BaradTank_BackRightWheel2;
		my._BackLeftWheel2_Vertex  = __BaradTank_BackLeftWheel2;

		my._FrontRightWheel = CreateMyWheele( BaradTankWheel ,__BaradTank_FrontRightWheel ,__BackWheel );
		my._FrontLeftWheel  = CreateMyWheele( BaradTankWheel ,__BaradTank_FrontLeftWheel  ,__BackWheel );
		my._BackRightWheel  = CreateMyWheele( BaradTankWheel ,__BaradTank_BackRightWheel1 ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( BaradTankWheel ,__BaradTank_BackLeftWheel1  ,__BackWheel );
		my._BackRightWheel2 = CreateMyWheele( BaradTankWheel ,__BaradTank_BackRightWheel2 ,__BackWheel );
		my._BackLeftWheel2  = CreateMyWheele( BaradTankWheel ,__BaradTank_BackLeftWheel2  ,__BackWheel );
				
		return;
	}

	if (my._CarType == __Bus)
	{
		my._health = 85;
		my._FrontRightWheel_Vertex = __Bus_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Bus_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Bus_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Bus_BackLeftWheel;
				
		my._FrontRightWheel = CreateMyWheele( BusWheel ,__Bus_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( BusWheel ,__Bus_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( BusWheel ,__Bus_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( BusWheel ,__Bus_BackLeftWheel   ,__BackWheel );

		my._FrontRightLight = CreateMyLights( ComonLight ,__Bus_FrontRightLight );
		my._FrontLeftLight  = CreateMyLights( ComonLight ,__Bus_FrontLeftLight  );
		return;
	}
	
	if (my._CarType == __FireBregate)
	{
		my._health = 90;
		my._FrontRightWheel_Vertex = __FireBregate_FreontRightWheel;
		my._FrontLeftWheel_Vertex  = __FireBregate_FreontLeftWheel;
		my._BackRightWheel_Vertex  = __FireBregate_BackRightWheel;
		my._BackLeftWheel_Vertex   = __FireBregate_BackLeftWheel;
				
		my._FrontRightWheel = CreateMyWheele( FireBregateWheel ,__FireBregate_FreontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( FireBregateWheel ,__FireBregate_FreontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( FireBregateWheel ,__FireBregate_BackRightWheel   ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( FireBregateWheel ,__FireBregate_BackLeftWheel    ,__BackWheel );		
		
		my._FrontRightLight = CreateMyLights( ComonLight ,__FireBergate_FrontRightLight );
		my._FrontLeftLight  = CreateMyLights( ComonLight ,__FireBergate_FrontLeftLight  );
		
		return;
	}

	if (my._CarType == __Taxi)
	{
		my._health = 85;
		my._FrontRightWheel_Vertex = __Taxi_FrontRightWheel;
		my._FrontLeftWheel_Vertex  = __Taxi_FrontLeftWheel;
		my._BackRightWheel_Vertex  = __Taxi_BackRightWheel;
		my._BackLeftWheel_Vertex   = __Taxi_BackLeftWheel;
				
		my._FrontRightWheel = CreateMyWheele( TaxiWheel ,__Taxi_FrontRightWheel ,__FrontWheel);
		my._FrontLeftWheel  = CreateMyWheele( TaxiWheel ,__Taxi_FrontLeftWheel  ,__FrontWheel);
		my._BackRightWheel  = CreateMyWheele( TaxiWheel ,__Taxi_BackRightWheel  ,__BackWheel );
		my._BackLeftWheel   = CreateMyWheele( TaxiWheel ,__Taxi_BackLeftWheel   ,__BackWheel );			
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						   Hummer Cars
/* --------------------------------------------------------------------------------------------------------- */

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
	else
	{
		create(<cklmg.mdl>,my.pos,HummerSoldier);
		my._MySoldier = Entity_To_Pointer(you);
	}	
}

/* ---------------------------------------------------- */

function HummerSoldier()
{
	InisialSold();
	my.shadow = 0;
	my.WeaponNumber = lmg;
	my.skill6 = 19;
	my.EnemyId = player.bodylnk;
	LMGwait();
}

/* ---------------------------------------------------- */

function HummerCars()
{			
	//@ Second Level Intialization
	if (my._CarNumber == 1)
	{			
		InistalCarSpeed(60,60,0.6,0.8);
		InistalCarPath("PlyaerCarPath",400,16,0);
		InistalCarPathParam(1,8,400);	
		VWeaponSprite1.skill20 = entity_to_pointer(me);
		wait(5);
		SetCarriedSolder();							
		SetMyWheele(__ForeWheels);		
		SetMyLights( __Hummer_FrontRightLight , __Hummer_FrontLeftLight ,__Hummer_LightEffectDest);
		while (iPlayerCarPos < 16  ) { wait(1); }
	}

	if (my._CarNumber == 2)
	{
		InistalCarPath("PlyaerCarPath",-110,21,0);
		InistalCarSpeed(35,60,0.6,0.7);
		InistalCarPathParam(1,6,350);
		VWeaponSprite1.skill1 = entity_to_pointer(me);
		wait(5);
		SetCarriedSolder();							
		SetMyWheele(__ForeWheels);		
		SetMyLights( __Hummer_FrontRightLight , __Hummer_FrontLeftLight ,__Hummer_LightEffectDest);
		while (iPlayerCarPos < 20) { wait(1); }
	}

	if (my._CarNumber == 3)
	{
		InistalCarPath("PlyaerCarPath",100,21,0);
		InistalCarSpeed(35,60,0.5,0.6);
		InistalCarPathParam(1,6,350);			
		wait(5);
		SetCarriedSolder();							
		SetMyWheele(__ForeWheels);		
		SetMyLights( __Hummer_FrontRightLight , __Hummer_FrontLeftLight ,__Hummer_LightEffectDest);
		while (iPlayerCarPos < 20) { wait(1); }
	}

	while ( my._health > 0 )
	{														
		MoveCars(__Forward,__ManulaPointTrak,20);
		SetCarriedSolder();							
		SetMyWheele(__ForeWheels);		
		SetMyLights( __Hummer_FrontRightLight , __Hummer_FrontLeftLight ,__Hummer_LightEffectDest);
		
		HoldDist(300);
		
		if (snd_playing(my._EnginSound) == 0)
		{
			play_entsound(me , HummerEngin, __HuumerEnginVolum);
			my._EnginSound = result;
		}
		
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me)< my._Dest2Move2SecPoint) 
		{
			NexttargetOffset( 0, my._PathOffset, 0);
			my._PointNumber += 1;
						
			if (my._PointNumber == 16)
			{
				my.CarForce = 0;
				PlayRandomSkidSound();
				ViolentStop();				
				
				while (my._health > 0)
				{
					if (snd_playing(my._EnginSound) == 0)
					{	
						play_entsound(me , HummerEngin, __HuumerEnginVolum);
						my._EnginSound = result;
					}
					wait(1);
				}
				return;
			}

			if (my._CarNumber == 3)
			{				
				if (my._pointnumber == 30)
				{
					my._PathOffset = -400; 
				}

				if (my._pointnumber == 32)
				{					
					my._BraksPedal = 0;
					my.CarForce = 85;
					my._MaxSpeed = 85;
					my._GasPedal = 1;
				}
				if (my._pointnumber == 33)
				{
					my._break = 9;
					my._StopCar = 1;
					my._BraksPedal = 1;
				}
			}
			
			if (my._pointnumber == 35)
			{
				my.CarForce = 110;
				InistalCarPathParam(1,8,50);
			}

			if (my._pointnumber == 36)
			{
				ViolentStop();
				break;
			}

			if (IsItACornar() > 50)
			{
				PlayRandomSkidSound();
				my._BraksPedal = 1;
			}
		}
		wait(1);
	}

	//@ Removing my soldier
	you = pointer_to_entity(my._MySoldier);
	if (you)
	{
		you.invisible = 1;
		you.shadow = 0;
		you._health = -10000;
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						LandRover Cars
/* --------------------------------------------------------------------------------------------------------- */

define __SirenLightSpeed = 50;
define __FrontPart = 1;
define __SidePart = 2;
var iFrameCounter = 0;

define _LightSpeed , skill1;

function LandRoverSirenAct()
{
	my.passable= 1;
	wait(25);
	my.lightrange = 1;
	my._LightSpeed = __SirenLightSpeed;
	while (my.flag1 == 0)
	{
		my.red += my._LightSpeed;
		if (my.red > 255) { my._LightSpeed = -__SirenLightSpeed; }
		if (my.red < 0)	  { my._LightSpeed = __SirenLightSpeed;  }
		wait(1);
	}
	remove(me);
}

/* -------------------------------------------------------- */

function SetMySiren()
{	
	you = pointer_to_entity(my._SirenModle);
	if (you)
	{
		temp.x = 10;
		temp.y = 0;
		temp.z = 35;
		vec_rotate(temp , my.pan);
		vec_add(temp,my.pos);
		vec_set(you.pos , temp);
		you.pan = my.pan;
		if (my._health <= 0)
		{
			you.flag1 = 1;
		}
	}
}

/* -------------------------------------------------------- */

function PartGide()
{	
	my.skill1 = entity_to_pointer(you);
	my.pan = you.pan;
	my.invisible =1;	
		
	while (my.skill2 < 10)
	{
		my.skill2 += 1;
		temp.x = -15;
		temp.y = 10;
		temp.z = 8;
		move(me ,temp ,nullvector);
		you = pointer_to_entity(my.skill1);
		if (you)
		{
			vec_set(you.pos , my.pos);
		}
		
		wait(1);
	}

	while (my.skill2 > -10)
	{
		my.skill2 -= 1;
		temp.x = -15;
		temp.y = 3 ;
		temp.z = -3;
		move(me ,temp ,nullvector);
		you = pointer_to_entity(my.skill1);
		if (you)
		{vec_set(you.pos , my.pos);
		}
		
		if (result == 0)
		{
			break;
		}
		wait(1);
	}
	you = pointer_to_entity(my.skill1);
	if (you)
	{
		you.flag1 = 1;
	}
	
	remove(me);
}

/* -------------------------------------------------------- */

sound LandRoverParts1 ,<LandRoverParts1.wav>;
sound LandRoverParts2 ,<LandRoverParts2.wav>;
sound LandRoverParts3 ,<LandRoverParts3.wav>;
sound LandRoverParts4 ,<LandRoverParts4.wav>;
sound LandRoverParts5 ,<LandRoverParts5.wav>;
define __CarPartVol = 9000;

function PlayPartSound()
{
	wait(15);
	var rrr = 0;
	while (rrr.y < 3)
	{
		
		rrr.x = int(random(4));
		if (rrr.x == 0)	{play_entsound(me, LandRoverParts1 , __CarPartVol);goto carpart3;}
		if (rrr.x == 1)	{play_entsound(me, LandRoverParts2 , __CarPartVol);goto carpart3;}
		if (rrr.x == 2)	{play_entsound(me, LandRoverParts3 , __CarPartVol);goto carpart3;}
		if (rrr.x == 3)	{play_entsound(me, LandRoverParts4 , __CarPartVol);goto carpart3;}
		if (rrr.x == 4)	{play_entsound(me, LandRoverParts5 , __CarPartVol);}
		
		CarPart3 :
		rrr.z = result;

		while (snd_playing(rrr.z)) { wait(1);}
		rrr.y +=1;
		wait(1);
	}	
}

/* -------------------------------------------------------- */

function CarBrokenParts()
{
	PlayPartSound();
	my.passable = 1;
	my.pan = you.pan;
	create(<Wheeltank.mdl>,my.pos,PartGide);
	my.flag1 = 0;
	while (my.flag1 == 0)
	{
		my.pan += 10 + random(9);
		my.roll -= 9 + random(10);
		wait(1);
	}
	
	remove(me);
}

/* -------------------------------------------------------- */

function CreateCarPart(iX , iY , iZ , iPartType)
{
	temp.x = iX;
	temp.y = iY;
	temp.z = iZ;
	vec_rotate(temp ,my.pan);
	vec_add(temp,my.pos);
	if (iPartType == __FrontPart)
	{
		create(<frontparts.mdl> , temp , CarBrokenParts);
	}
	else
	{
		create(<sideparts.mdl> , temp , CarBrokenParts);	
	}		
}

/* -------------------------------------------------------- */

function CollisionAffect()
{		
	CameraExplosionMove();
	iFrameCounter += 1;
	
	if (random(2) > 1)
	{
		play_sound(ColisionSound ,__ColisionSoundVolum);
	}
	else
	{
		play_sound(ColisionSound2 ,__ColisionSoundVolum);
	}
	
	//@ selecting frame
	if (iFrameCounter == 1)	{ ent_frame("FrontHit"     ,0);	 CreateCarPart(117 , 3  , 20 ,__FrontPart); }
	if (iFrameCounter == 2) { ent_frame("LeftHit"      ,0);	 CreateCarPart(80  , 50 ,-12 ,__SidePart ); }
	if (iFrameCounter == 3)	{ ent_frame("RightLeftHit" ,0);	 CreateCarPart(80  ,-48 ,-12 ,__SidePart ); }					
	if (iFrameCounter == 4)	
	{ 
		ent_frame("LeftHit",0);	
		CreateCarPart(117,3,20,__FrontPart); 
		CreateCarPart(80,80,-12,__SidePart);	
	}		
	
	//@ removing light
	if (my.flag7 == 0) && (my.flag8 == 0)				
	{
		if (int(random(3)) >1)
		{
			you = pointer_to_entity(my._FrontRightLight);
			if (you)
			{
				remove(you);
				my.flag7 = 1;
				if (my.flag8)
				{
					my.skin = 4;
				}
				else
				{
					my.skin = 2;
				}
			}
			
		}
		else
		{
			you = pointer_to_entity(my._FrontLeftLight);
			if (you)
			{
				remove(you);
				my.flag8 = 1;
				if (my.flag7)
				{
					my.skin = 4;			
				}
				else
				{
					my.skin = 3;
				}			
			}
			
		}

		if (my.flag7) && (my.flag8)
		{
			//you = pointer_to_entity(my._LightEffect);
			//remove(you);
			RemoveLightsWheels(__DontRemoveLight,__RemoveLightEffect,__DontRemoveWheels);
			my.skin = 4;
		}
	}	
	
	//@ Car Shaking
	while (my._ImmediateShiftDegree < 6)	{ my._ImmediateShiftDegree += 2 + random(3); wait(1);}	
	wait(2);
	while (my._ImmediateShiftDegree > -10)	{ my._ImmediateShiftDegree -= 2;	     wait(1);}	
	while (my._ImmediateShiftDegree < 0)	{ my._ImmediateShiftDegree += 2 + random(3); wait(1);}	
	my._ImmediateShiftDegree = 0;		
}

/* -------------------------------------------------------- */

function AgrresiveAttack()
{		
	if (my._CarNumber == 1) && (my._pointNumber == 5) { wait(25); }
	if (my._CarNumber == 2) && (my._pointNumber == 15) { wait(15); }

	my._BraksPedal = 0;
	while (1)
	{		
		my.CarForce += my._Axceleration;
		if (TempCoCocO(300))
		{			
			HeartPlayerShowCompas(10);
			break;
		}
		wait(1);
	}
	
	CollisionAffect();
				
	if (my._CarNumber == 1) && (my._pointNumber > 6)
	{
		//you = pointer_to_entity(my._LightEffect);
		//remove(you);						
		RemoveLightsWheels(__DontRemoveLight,__RemoveLightEffect,__DontRemoveWheels);
		my._RollExpoled = 1;
		my.CarForce = 60;
		my._break =1;		
		my.skin = 4;
		RollAndExplode(__RollAndExplod);
	}
}

/* -------------------------------------------------------- */

function StopAndColseRoad()
{
	my.CarForce = 20;
	my._target_x = 10;
	while (my._target_x> 0)
	{
		my._target_x -= 1;
		my.pan += 3 + random(4);
		
		MoveOnly(__Forward,20);		
		SetMyWheele(__ForeWheels);				
		SetMyLights(__LandRover_FrontRightLight, __LandRover_FrontLeftLight ,__LandRover_LightEffectDest); 
		SetMySiren();
		wait(1);
	}
	my.CarForce = 0;
	PlayRandomSkidSound();
	ViolentStop();

	while (my._health > 0)
	{
		if (snd_playing(my._EnginSound) == 0)
		{
			play_entsound(my , LandRoverEngin , __LandRoverVolum);
			my._EnginSound = result;
		}
		wait(1);
	}
}

/* -------------------------------------------------------- */

function LandRoverCars()
{
	//@ Second Level Intialisation
	if (my._CarNumber == 1)
	{
		InistalCarSpeed(0,60,0.9,0.6);
		InistalCarPath("PlyaerCarPath",10,1,0);
		InistalCarPathParam(1,7,350);		
		wait(15);
	}

	if (my._CarNumber == 2)
	{
		InistalCarSpeed(50,60,1.5,0.4);
		InistalCarPath("PlyaerCarPath",-20,9,0);
		InistalCarPathParam(1,7,350);
		VWeaponSprite1.skill21 = entity_to_pointer(me);
		wait(5);
		SetMyWheele(__ForeWheels);				
		SetMyLights( __LandRover_FrontRightLight , __LandRover_FrontLeftLight , __LandRover_LightEffectDest); 
		SetMySiren();
		while (iPlayerCarPos < 9  ){wait(1);}
	}

	while ( my._health > 0 ) && (my._RollExpoled == 0)
	{				
		MoveCars(__Forward,__ManulaPointTrak,20);		
		SetMyWheele(__ForeWheels);				
		SetMyLights( __LandRover_FrontRightLight , __LandRover_FrontLeftLight , __LandRover_LightEffectDest); 
		SetMySiren();		
				
		
		if (snd_playing(my._SirenHornSound) == 0)
		{
			if (random(60) > 59) { play_entsound(me,PoliceSiren    ,__PoliceSirenVolum);}
			else		     { play_entsound(me,PoliceSirenLoop,__PoliceSirenVolum);}			
			my._SirenHornSound = result;			
		}
		
		if (snd_playing(my._EnginSound) == 0)
		{
			play_entsound(my , LandRoverEngin , __LandRoverVolum);
			my._EnginSound = result;
		}
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me)< my._Dest2Move2SecPoint) 
		{
			NexttargetOffset( 0, my._PathOffset, 0);
			my._PointNumber += 1;

			if (my._CarNumber == 1) && ((my._PointNumber == 1) || (my._PointNumber == 5) || (my._PointNumber == 7))
			{				
				if (my._PointNumber == 7) 
				{ 
					InistalCarSpeed(my.CarForce,70,0.3,0.8); 
				}
				AgrresiveAttack();				
			}

			if (my._CarNumber == 2) && ((my._PointNumber == 9) || (my._PointNumber == 11) || (my._PointNumber == 15))
			{
				AgrresiveAttack();
			}

			if (my._PointNumber == 16)
			{
				StopAndColseRoad();
				return;
			}

			if (IsItACornar() > 50) 
			{
				PlayRandomSkidSound();
				my._BraksPedal = 1;
			}
		}				
		wait(1);
	}	
}

/* --------------------------------------------------------------------------------------------------------- */
//							Dodg Cars
/* --------------------------------------------------------------------------------------------------------- */

//@ dodg cars are no longer used.... i use the hummer cars insted.	 

function DodgCars()
{		
	//@ Second Level Intialisation
	if (my._CarNumber == 1)
	{								
		InistalCarSpeed(10,60,2,0.7);
		InistalCarPath("PlyaerCarPath", -65,42,0);
		InistalCarPathParam(1,8,350);		
		wait(5);
		SetCarriedSolder();
		SetMyWheele(__ForeWheels);		
		SetMyLights( __Hummer_FrontRightLight , __Hummer_FrontLeftLight ,__Hummer_LightEffectDest);
		while (iPlayerCarPos < 42  ) { wait(1); }						
	}
	
	if (my._CarNumber == 2)
	{						
		InistalCarSpeed(80,60,0.8,0.6);
		InistalCarPath("PlyaerCarPath", 200,47,0);
		InistalCarPathParam(1,10,350);				
		VWeaponSprite1.skill22 = entity_to_pointer(me);
		wait(5);
		SetCarriedSolder();
		SetMyWheele(__ForeWheels);		
		SetMyLights( __Hummer_FrontRightLight , __Hummer_FrontLeftLight ,__Hummer_LightEffectDest);
		while (iPlayerCarPos < 46 ) { wait(1); }		
		TimerToSoldow(60);
	}
	
	while ( my._health > 0 )
	{
		MoveCars(__Forward,__ManulaPointTrak,20);				
		SetCarriedSolder();
		SetMyWheele(__ForeWheels);		
		SetMyLights( __Hummer_FrontRightLight , __Hummer_FrontLeftLight ,__Hummer_LightEffectDest);

		vec_set(point_move.x,my._target_x);				
		if ( EDistance(point_move,me)< my._Dest2Move2SecPoint) 
		{
			NexttargetOffset( 0, my._PathOffset, 0);
			my._PointNumber += 1;
			
			if (my._pointnumber == 42)
			{
				my.CarForce = 90;
				TimerToSoldow(53);
			}
			if (my._pointnumber == 43)
			{
				my._ImmediateShiftDegree = 6;
				my._PathOffset = 300;
				MoveTarget(me , 8);
			}

			if (my._pointnumber == 44)
			{
				my._ImmediateShiftDegree = -5;
				my._PathOffset = -400;
				MoveTarget(me , 20);
			}

			if (my._pointnumber == 46)
			{				
				InistalCarPathParam(my._UseSmothPan,8,220);
			}

			if (my._CarNumber == 1) && (my._pointnumber == 47)
			{				
				RollAndExplode(__StopTurn);
				return;
			}

			if (my._PointNumber == 51)
			{
				my._StopCar = 1;
				my._BraksPedal = 1;
			}			
		}
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//					   Barad Tracks - Trak 2 - 
/* --------------------------------------------------------------------------------------------------------- */

define __Trak2EnginVol = 1000;

function Trak2Cars()
{		
	//@ Second Level Intialisation
	if (my._CarNumber == 1) || (my._CarNumber == 2)|| (my._CarNumber == 3)|| (my._CarNumber == 4)
	{	
		my.CarForce = 5;		
		while (iPlayerCarPos < 42) { wait(1); }
	}
	
	if (my._CarNumber == 5) || (my._CarNumber == 5)|| (my._CarNumber == 6)|| (my._CarNumber == 7)|| (my._CarNumber == 8)|| (my._CarNumber == 9)|| (my._CarNumber == 10)
	{
		my.CarForce = 30;
		my.invisible = 1;
		while (iPlayerCarPos < 50) { wait(1); }
		my.invisible = 0;
	}
	while ( my._health > 0 )
	{
		if (snd_playing(my._EnginSound) == 0)
		{
			play_entsound(me, Trak2Engin , __Trak2EnginVol);
			my._EnginSound = result;
		}
		MoveOnly(__Forward,6);
		SetMyWheele(__ForeWheels);		
		SetMyLights(__Track2_FrontRightLight ,  __Track2_FrontLeftLight ,__Track2_LightEffectDest ); 
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//					Barad Tanker
/* --------------------------------------------------------------------------------------------------------- */

function DirectPlayerCar()
{
	you = pointer_to_entity(pPlayerCar);
	my._PointNumber = vec_dist(my.pos ,you.pos );						
	while (my._PointNumber > 1300)
	{
		you = pointer_to_entity(pPlayerCar);
		my._PointNumber = vec_dist(my.pos ,you.pos );		
		wait(1);
	}
	
	you = pointer_to_entity(pPlayerCar);
	you._ImmediateShiftDegree = -8;		
	you._PathOffset = -500;
	MoveTarget(pointer_to_entity(pPlayerCar) , 12);

	you = pointer_to_entity(pPlayerCar);
	my._PointNumber = vec_dist(my.pos ,you.pos );	
	while (my._PointNumber < 2800)
	{
		you = pointer_to_entity(pPlayerCar);
		my._PointNumber = vec_dist(my.pos ,you.pos );
		
		wait(1);
	}
	you = pointer_to_entity(pPlayerCar);
	you._ImmediateShiftDegree = 10;		
	you._PathOffset = 0;
	MoveTarget(pointer_to_entity(pPlayerCar) , 10);
}

/* -------------------------------------------------------- */

function BaradTankCars()
{
	//CompainTrackWithTail();
		
	//@ Second Level Intialisation
	if (my._CarNumber == 1) || (my._CarNumber == 2)|| (my._CarNumber == 3)|| (my._CarNumber == 4)
	{		
		my.CarForce = 5;
		while (iPlayerCarPos < 42) { wait(1); }	
		if (my._CarNumber == 3)
		{
			DirectPlayerCar();
		}	
	}
	
	if (my._CarNumber == 5) || (my._CarNumber == 5)|| (my._CarNumber == 6)|| (my._CarNumber == 7)|| (my._CarNumber == 8)|| (my._CarNumber == 9)|| (my._CarNumber == 10)
	{
		my.CarForce = 30;
		my.invisible = 1;
		while (iPlayerCarPos < 50) { wait(1); }
		my.invisible = 0;
	}

	while ( my._health > 0 )
	{
		MoveOnly(__Forward,20);
		SetMyWheele(__SixWheels);
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
/*
function CompainTrackWithTail()
{
	if (my._CarType == __BaradTank)
	{
		if (my._CarNumber == 1)	{ MisionsMsg1.skill1 = entity_to_pointer(me); return; }
		if (my._CarNumber == 2)	{ MisionsMsg1.skill2 = entity_to_pointer(me); return; }
		if (my._CarNumber == 3)	{ MisionsMsg1.skill3 = entity_to_pointer(me); return; }
		if (my._CarNumber == 4)	{ MisionsMsg1.skill4 = entity_to_pointer(me); return; }		
		if (my._CarNumber == 5)	{ MisionsMsg1.skill5 = entity_to_pointer(me); return; }
	}
	else
	{
		if (my._CarNumber == 1)
		{
			you = pointer_to_entity(MisionsMsg1.skill1);
			while (you == null)
			{
				you = pointer_to_entity(MisionsMsg1.skill1);
				wait(1);
			}			
			my._MyTailTrak = MisionsMsg1.skill1;			
			you = pointer_to_entity(my._MyTailTrak);
			you._MyTailTrak = entity_to_pointer(me);
			return;

		}
		if (my._CarNumber == 2)
		{
			you = pointer_to_entity(MisionsMsg1.skill2);
			while (you == null)
			{
				you = pointer_to_entity(MisionsMsg1.skill2);
				wait(1);
			}			
			my._MyTailTrak = MisionsMsg1.skill2;
			you = pointer_to_entity(my._MyTailTrak);
			you._MyTailTrak = entity_to_pointer(me);
			return;
		}
		if (my._CarNumber == 3)
		{
			you = pointer_to_entity(MisionsMsg1.skill3);
			while (you == null)
			{
				you = pointer_to_entity(MisionsMsg1.skill3);
				wait(1);
			}			
			my._MyTailTrak = MisionsMsg1.skill3;
			you = pointer_to_entity(my._MyTailTrak);
			you._MyTailTrak = entity_to_pointer(me);
			return;
		}
		if (my._CarNumber == 4)
		{
			you = pointer_to_entity(MisionsMsg1.skill4);
			while (you == null)
			{
				you = pointer_to_entity(MisionsMsg1.skill4);
				wait(1);
			}			
			my._MyTailTrak = MisionsMsg1.skill4;
			you = pointer_to_entity(my._MyTailTrak);
			you._MyTailTrak = entity_to_pointer(me);
			return;
		}		
		if (my._CarNumber == 5)
		{
			you = pointer_to_entity(MisionsMsg1.skill5);
			while (you == null)
			{
				you = pointer_to_entity(MisionsMsg1.skill5);
				wait(1);
			}			
			my._MyTailTrak = MisionsMsg1.skill5;
			you = pointer_to_entity(my._MyTailTrak);
			you._MyTailTrak = entity_to_pointer(me);
			return;
		}		
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						Van Cars
/* --------------------------------------------------------------------------------------------------------- */

function VanCars()
{
	//@ Second Level Intialisation
	if (my._CarNumber == 1)
	{
		ObjecPos.skill1 = entity_to_pointer(me);
		InistalCarSpeed(5,5,0.4,0.8);
		InistalCarPath("HighWayPath",60,2,0);
		InistalCarPathParam(1,8,350);
		while (iPlayerCarPos < 42) { wait(1); }
	}

	if (my._CarNumber == 2)
	{
		InistalCarSpeed(10,5,0.4,0.8);
		InistalCarPath("PlyaerCarPath",60,24,0);
		InistalCarPathParam(1,8,350);
		while (iPlayerCarPos < 20) { wait(1); }
		Horn(5,30);
	}
	
	if (my._CarNumber == 3)
	{
		InistalCarSpeed(10,5,0.4,0.8);
		InistalCarPath("PlyaerCarPath",60,40,0);
		InistalCarPathParam(1,8,350);
		while (iPlayerCarPos < 42) { wait(1); }
	}
	if (my._CarNumber == 4)
	{
		InistalCarSpeed(10,5,0.4,0.8);
		InistalCarPath("PlyaerCarPath",-30,40,0);
		InistalCarPathParam(1,8,350);
		while (iPlayerCarPos < 43) { wait(1); }
	}
	while ( my._health > 0 )
	{	
	
		MoveCars(__Forward,__AutoPointTrak,20);
		SetMyWheele(__ForeWheels);		
		SetMyLights( __Van_FrontRightLight  , __Van_FrontLeftLight ,__Van_LightEffectDest); 
		
		if (my._RollExpoled)
		{
			my.CarForce = 50;
			my._break =0.5;			
			RollAndExplode(__RollAndExplod);
			return;
		}
		
		if (iPlayerCarPos == 26) && (my._CarNumber == 2)
		{
			ImmediateRemove();
			return;
		}
				
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						Bus Cars
/* --------------------------------------------------------------------------------------------------------- */

function ByPassCar(iDistToStart , iDegreeToStarf , iStarfSpeed1 iStarfSpeed2)
{	
	you = pointer_to_entity(pPlayerCar);
	while (vec_dist(my.pos ,you.pos ) > iDistToStart)
	{		
		wait(1);
	}

	if (my._CarType == __bus)
	{Horn(3,0);
	}
	else
	{
	Horn(2,0);
	}
	
	var iCounter = 0;		
	while (iCounter < iDegreeToStarf)
	{
		iCounter += 1;
		my.pan += iStarfSpeed1;
		wait(1);
	}	
	my.z -= 15;	
	while (iCounter > 0)
	{
		iCounter -= 1;
		my.pan += iStarfSpeed2;
		wait(1);
	}
	my.z += 15;
	
}

/* ---------------------------------------------------------------------- */

define __BusEnginVol = 800;
function BusCars()
{
	//@ Second Level Intialisation
	my.invisible = 1;
	if (my._CarNumber == 1)
	{
		my.CarForce = 5;
		while (iPlayerCarPos < 42  ) { wait(1); }
	}
	if (my._CarNumber == 2)
	{
		my.CarForce = 18;
		while (iPlayerCarPos < 34  ) { wait(1); }
		
		Horn(3,1);
	}
	if (my._CarNumber == 3)
	{
		my.CarForce = 20;
		RemoveLightsWheels(__RemoveLights,__RemoveLightEffect,__DontRemoveWheels);
		while (iPlayerCarPos < 32  ) { wait(1); }
	}
	if (my._CarNumber == 4)
	{
		my.CarForce = 21;
		while (iPlayerCarPos < 45  ) { wait(1); }
		ByPassCar(850 , 10 ,3,-2);
	}
	my.invisible = 0;

	while ( my._health > 0 )
	{
		MoveOnly(__Forward,20);
		SetMyWheele(__ForeWheels);
		SetMyLights( __Bus_FrontRightLight , __Bus_FrontLeftLight , __Bus_LightEffectDest);

		if (snd_playing(my._EnginSound) == 0)
		{
			play_entsound(me,BusEngin,__BusEnginVol);
			my._EnginSound= result;
		}
		
		if (iPlayerCarPos == 35) && (my._CarNumber == 3)
		{
			ImmediateRemove();
			return;
		}		
		
		if (iPlayerCarPos == 38) && (my._CarNumber == 2)
		{			
			return;
		}
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						FireBregate Cars
/* --------------------------------------------------------------------------------------------------------- */

function FireBregateCars()
{
	//@ Second Level Intialisation
	if (my._CarNumber == 1) || (my._CarNumber == 2)
	{		
		InistalCarSpeed(10,10,0.01,0.5);
		InistalCarPath("PlyaerCarPath",-70,27,0);
		InistalCarPathParam(1,3,50);
		my.invisible = 1;
		while (iPlayerCarPos < 25  ) {wait(1); }
		my.invisible = 0;
		play_entsound(me,FireBregaeSirenLoop,1000);
		my._SirenHornSound = result;
	}
		
	while ( my._health > 0 )
	{
		MoveCars(__Forward,__AutoPointTrak,20);		
		SetMyWheele(__ForeWheels);
		SetMyLights( __FireBergate_FrontRightLight , __FireBergate_FrontLeftLight ,__FireBergate_LightEffectDest); 		
		
		if (snd_playing(my._SirenHornSound) == 0)
		{
			if (random(3) > 2) { play_entsound(me,FireBregateSiren   ,__FireBregateSirenVolum); }
			else		   { play_entsound(me,FireBregaeSirenLoop,__FireBregateSirenVolum); }
			my._SirenHornSound = result;
		}
		
		if (iPlayerCarPos == 30)
		{
			return;
		}
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						Taxi Cars
/* --------------------------------------------------------------------------------------------------------- */

function TaxiCars()
{
	my.invisible = 1;
	if (my._CarNumber == 1) || (my._CarNumber == 2)
	{				
		
		while (iPlayerCarPos < 15  ) { wait(1); }
		my.invisible = 0;
		return;
	}
	
	if (my._CarNumber == 3)
	{
		my.CarForce = 20;
		
		while (iPlayerCarPos < 43  ) { wait(1); }
		
	}
	if (my._CarNumber == 4)
	{
		my.CarForce = 20;
		
		while (iPlayerCarPos < 45  ) { wait(1); }
		ByPassCar(800,10,-3,2);
		
	}
	my.invisible = 0;
	while ( my._health > 0 )
	{		
		MoveOnly(__Forward,20);
		SetMyWheele(__ForeWheels);
		SetMyLights( __Taxi_FrontRightLight , __Taxi_FrontLeftLight ,__Taxi_LightEffectDest); 

		if (iPlayerCarPos == 35) && (my._CarNumber == 1)
		{
			ImmediateRemove();
			return;
		}

		//if (iPlayerCarPos == ) && (my._CarNumber == 3)
		//{
		//}
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						Golf Cars
/* --------------------------------------------------------------------------------------------------------- */

function GolfCars()
{			
	InistalCarSpeed(20,20,0,0);
	InistalCarPath("PlyaerCarPath",0,0,0);
	InistalCarPathParam(0,0,0);
	
	my.invisible = 1;
	if (my._CarNumber == 1) 
	{ 
		while (iPlayerCarPos < 32) { wait(1); } 
		RemoveLightsWheels(__RemoveLights,__RemoveLightEffect,__DontRemoveWheels);	
	}

	if (my._CarNumber == 2)	{ while (iPlayerCarPos < 15) { wait(1); }	}
	my.invisible = 0;
	if (my._CarNumber == 3)	{ while (iPlayerCarPos < 42) { wait(1); }	}
	if (my._CarNumber == 4)	{ while (iPlayerCarPos < 45) { wait(1); }	}
	
	while ( my._health > 0 )
	{		
		MoveOnly(__Forward,20);
		SetMyWheele(__ForeWheels);
		SetMyLights( __Golf_FrontRightLight , __Golf_FrontLeftLight ,__Golf_LightEffectDest ); 

		if (iPlayerCarPos == 35) && (my._CarNumber == 1)
		{
			ImmediateRemove();
			return;
		}

		//if (iPlayerCarPos == ) && (my._CarNumber == 3)
		//{
		//}
		//if (iPlayerCarPos == ) && (my._CarNumber == 4)
		//{
		//}
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						Nissan Cars
/* --------------------------------------------------------------------------------------------------------- */

function NissanCars()
{
	InistalCarSpeed(20,20,0.5,0.3);
	InistalCarPath("PlyaerCarPath",30,5,0);
	InistalCarPathParam(1,8,60);
	
	my.invisible = 1;
	if (my._CarNumber == 1) { while (iPlayerCarPos < 4 ) { wait(1); } }
	if (my._CarNumber == 2) { while (iPlayerCarPos < 35) { wait(1); } }
	my.invisible = 0;

	while ( my._health > 0 )
	{		
		MoveOnly(__Forward,20);
		SetMyWheele(__ForeWheels);
		SetMyLights( __Nissan_FrontRightLight , __Nissan_FrontLeftLight ,__Nissan_LightEffectDest); 

		if (iPlayerCarPos == 10) && (my._CarNumber == 1)
		{
			ImmediateRemove();
			return;
		}

		//if (iPlayerCarPos == ) && (my._CarNumber == 2)
		//{
			
		//}
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						Ceterween Cars
/* --------------------------------------------------------------------------------------------------------- */

function CeterweenCars()
{
	InistalCarSpeed(15,15,0.5,0.8);
	InistalCarPath("PlyaerCarPath",30,5,0);
	InistalCarPathParam(1,8,60);
	
	my.invisible = 1;
	if (my._CarNumber == 1) { while (iPlayerCarPos < 19) { wait(1); } }
	if (my._CarNumber == 2) { while (iPlayerCarPos < 4 ) { wait(1); } }
	my.invisible = 0;

	if (my._CarNumber == 3) { while (iPlayerCarPos < 35  ) { wait(1); } }

	while ( my._health > 0 )
	{		
		MoveOnly(__Forward,20);
		SetMyWheele(__ForeWheels);
		SetMyLights( __Ceterween_FrontRightLight , __Ceterween_FrontLeftLight ,__Ceterween_LightEffectDest); 

		if (iPlayerCarPos == 26) && (my._CarNumber == 1)
		{
			ImmediateRemove();
			return;
		}
		if (iPlayerCarPos == 10) && (my._CarNumber == 2)
		{
			ImmediateRemove();
			return;
		}
		
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//						Water Traks - Trak 1 - 
/* --------------------------------------------------------------------------------------------------------- */

function Trak1Cars()
{
	my.invisible = 1;
	if (my._CarNumber == 1)
	{
		my.CarForce = 35;
		while (iPlayerCarPos <10) { wait(1);}	
	}

	if (my._CarNumber == 2)
	{
		my.invisible = 0;
		return;
	}
		
	if (my._CarNumber == 3)
	{	
		while (iPlayerCarPos <45  ) { wait(1); }	
		my.CarForce = 20;		
	}	

	my.invisible = 0;

	while ( my._health > 0 )
	{		
		MoveOnly(__Forward,14);
		SetMyWheele(__ForeWheels);
		SetMyLights( __Track1_FrontRightLight , __Track1_FrontLeftLight ,__Track1_LightEffectDest); 

		if (iPlayerCarPos == 11)
		{
			ViolentStop();			
			while (iPlayerCarPos < 15) { wait(1); }
			ImmediateRemove();
			return;
		}
		
		if (my._BraksPedal == 0)
		{
			HoldDist(1100);
		}

		if (my._BraksPedal) && (my._GasPedal == 0)
		{
			Horn(2,0);
			play_entsound(me,Skid_6,5000);
			my._GasPedal = 1;
		}
						
		wait(1);
	}	
}

/* --------------------------------------------------------------------------------------------------------- */
//						Water Tankers 
/* --------------------------------------------------------------------------------------------------------- */

function WaterTankCars()
{
	InistalCarSpeed(0,0,0,0);
	InistalCarPath("PlyaerCarPath",0,0,0);
	InistalCarPathParam(0,0,0);
	if (my._CarNumber == 2)
	{
		return;
	}
	
	if (my._CarNumber == 3)
	{
		my.CarForce = 20;
		my.invisible = 1;
		while (iPlayerCarPos < 45  ) { wait(1); }
		my.invisible = 0;
	}
	
	while ( my._health > 0 )
	{		
		MoveOnly(__Forward,20);
		SetMyWheele(__SixWheels);
		
		wait(1);
	}
}


/* --------------------------------------------------------------------------------------------------------- */
//					Moving Cars Main Function .......
/* --------------------------------------------------------------------------------------------------------- */

//@ the main function of Moving cars.
action Cars
{
	//@ skill 1  ( _CarType			):
	//@       2  ( Wieght			):
	//@       3  ( _CarNumber		):
	//@	  4  ( _LightEffect		):
	//@       5  ( CollFunction		):
	//@       6  ( _ShiftAngle              ):
	//@       7  ( _Axceleration		):
	//@       8  ( _MaxSpeed		):
	//@       9  ( _health			):
	//@       10 ( _FrontRightLight		):
	//@	  11 ( _FrontLeftLight		):
	//@       12 ( _BackRightLight		):
	//@       13 ( _BackLeftLight		):
	//@       14 ( _MyTailTrak		):
	//@       15 ( CarForce			):
	//@       16 ( _Break			):
	//@       17 ( _target_x		):
	//@       18 ( _target_y		):
	//@       19 ( _target_z		):
	//@       20 ( _UseSmothPan		):
	//@       21 ( _SmothingDegre		):
	//@       22 ( _Dest2Move2SecPoint)
	//@       23 ( _PathOffset		):
	//@       24 ( _FrontRightWheel_Vertex  ):
	//@       25 ( _FrontLeftWheel_Vertex   ):
	//@       26 ( _BackRightWheel_Vertex   ):
	//@	  27 ( _BackLeftWheel_Vertex    ):
	//@	  28
	//@	  29
	//@       30 ( _PointNumber		):
	//@       31 ( _FrontRightWheel		):
	//@       32 ( _FrontLeftWheel		):
	//@	  33 ( _BackRightWheel		):
	//@	  34 ( _BackLeftWheel		):
	//@	  35 ( _BackRightWheel2		):
	//@	  36 ( _BackLeftWheel2		):
	//@       37 ( _MySoldier      ,  _BackRightWheel2_Vertex )
	//@	  38 ( _MyRBGSoldier   ,  _BackLeftWheel2_Vertex  )
	//@	  39 ( OwnType			):
	//@       40 ( _EnginSound		):
	//@	  41 ( _SirenHornSound          ):
	//@	  42 ( _old_position_x		):
	//@	  43 ( _old_position_y		):
	//@	  44 ( _old_position_z		):
	//@	  45 ( epassable		):
	//@       46
	//@       47
	//@       48
	
	//@ flag 1  ( _BraksPedal    ):
	//@ flag 2  ( _GasPedal      ):
	//@ flag 3  ( _ShiftMe       ):
	//@ flag 4  ( _RollExpoled   ):
	//@ flag 5  ( _StopCar       ):
	//@ flag 6  ( _SlowDownToMax ):
		
	while (player == null)	{ wait(1); }
	
	InistalCar();	
	
	//@ i hade to make this becuse dodg cars are BAD..
	if (my._CarType == __Hummer) 
	{ 
		if (my._CarNumber == 10) || (my._CarNumber == 20)
		{
			my._Carnumber /= 10;
			DodgCars();
			goto CarPoint;
		}
	}

	if (my._CarType == __Bus)	  { BusCars();		goto CarPoint;}	
	if (my._CarType == __Hummer)	  { HummerCars();	goto CarPoint;}
	if (my._CarType == __LandRover)   { LandRoverCars();	goto CarPoint;}
	//if (my._CarType == __Dodg)	  { DodgCars();		goto CarPoint;}
	if (my._CarType == __Van)	  { VanCars();		goto CarPoint;}	
	if (my._CarType == __Trak2) 	  { Trak2Cars();	goto CarPoint;}
	if (my._CarType == __BaradTank)	  { BaradTankCars();	goto CarPoint;}
	if (my._CarType == __FireBregate) { FireBregateCars();	goto CarPoint;}	
	if (my._CarType == __Taxi)	  { TaxiCars();		goto CarPoint;}
	if (my._CarType == __Golf)	  { GolfCars();		goto CarPoint;}
	if (my._CarType == __Nissan)	  { NissanCars();	goto CarPoint;}
	if (my._CarType == __Ceterween)   { CeterweenCars();	goto CarPoint;}	
	if (my._CarType == __Trak1)	  { Trak1Cars();	goto CarPoint;}
	if (my._CarType == __WaterTank)	  { WaterTankCars();	}
	CarPoint:

	while (my._RollExpoled == 0)
	{		
		if (my._CarType == __Hummer) || (my._CarType == __LandRover)
		{
			if ( my._health <  50 + random(50) )
			{
				SmokeMeSome();
			}
		}
		else
		{
			if ( my._health <  20 + random(30) )
			{
				SmokeMeSome();
			}
		}
		
		if (my._health <= 0)
		{
			CarExplosion();
			return;
		}
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//					Not Moving Cars Main Function .......
/* --------------------------------------------------------------------------------------------------------- */

define __HummerStopEnginVol = 100;
action CarsNotMoving
{
	sonar(my,10000);
	my.z = target.z +abs(my.min_z) + 15;	
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
	my.event = CarsEvent;
	my.OwnType = TypeOfEngines;
	my.CollFunction  = Function_To_Pointer("ComparsCollision");
	my._health = 300;
	
	while (1)
	{
		if ( my._health < 50 + random(50) )
		{
			SmokeMeSome();
		}

		if (my._health < 0)
		{
			CarExplosion();
			return;
		}
		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */
//					Player Car Main Function .......
/* --------------------------------------------------------------------------------------------------------- */

define __StartUp = 1 ; 
define __ChangeGeer  = 2;

define __LongBreak = 5;
define __EnginLoop = 6;

sound TestPlayerS1,<TestPlayerS1_1.wav>;

var KeepLooping = 0;
var StopCarEngin = 0;
function EnginSound()
{
	var Volum = 0;
	var Tune = 0;
	
	play_sound(TestPlayerS1,40);			
	while (1)
	{
		if (StopCarEngin == 0)
		{
			if (snd_playing(my._EnginSound) == 0)
			{
				play_sound(TestPlayerS1,Volum);			
				my._EnginSound = result;
			}		
			tune_sound(my._EnginSound ,Volum ,Tune);
			
			Volum = my.CarForce * 3 ;
			Tune = my.CarForce * 3 ;
		}		
		wait(1);
	}
}

/* ------------------------------------------------------------------------------------------------------------ */

define __PC_SoundVolum = 100;

function PlayerCarSounds(iId ,iNumber)
{		
	stop_sound(my._EnginSound);
		
	if (iId == __LongBreak) 
	{					
		while (iPlayerCarPos < iNumber)
		{									
			if (snd_playing(my._EnginSound) == 0)
			{
				play_sound(PC_LongBreak ,__PC_SoundVolum);
				my._EnginSound = result;
			}
			wait(1);
		}
		stop_sound(my._EnginSound);
		return;
	}		
	
	if (iId == __EnginLoop)
	{		
		while (KeepLooping)
		{
			if (snd_playing(my._EnginSound) == 0)
			{
				play_sound(TestPlayerS1 ,__PC_SoundVolum);
				my._EnginSound = result;
			}
			wait(1);
		}
		return;
	}
}

/* ------------------------------------------------------------------------------------------------------------ */

function LnkPlayerToMe(bImMoving)
{
	camera.z += iPlayerOffset.x;
	temp.x = 25;
	temp.y = 0;
	temp.z = 50 +iPlayerOffset.x/2;	
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);		
	vec_set(player.pos,temp);
	you = Pointer_To_Entity(player.BodyLnk);
	vec_set(you.pos,temp);	
	
	if (bImMoving)
	{
		iPlayerOffset.x += iCounter_1;
		if (iPlayerOffset.x > 2) { iCounter_1 = -my.CarForce/200; } 
		if (iPlayerOffset.x < 0) { iCounter_1 =  my.CarForce/200; }		
	}
}

/* ------------------------------------------------------------------------------------------------------------ */

function PlayerCarGide()
{
	my.passable = 1;
	my.invisible = 1;
	my.pan = you.pan;
	my.skill5 = entity_to_pointer(you);
	my.CarForce = you.CarForce;
	my._break = 0.9;
	
	while (1)
	{
		temp.x = my.CarForce;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp , nullvector);
		you = pointer_to_entity(my.skill5);
		vec_set(you.pos , my.pos);		
		if (you.pan >= 90 )
		{
			break;
		}
		my.CarForce -= my._break;
		wait(1);
	}
	you = pointer_to_entity(my.skill5);	
	you.CarForce = my.CarForce;
}

/* ------------------------------------------------------------- */

function SkedAndStop()
{		
	create(<point1.mdl> ,my.pos ,PlayerCarGide);	
	while (my.pan < 90)
	{
		my.pan += 2;
		LnkPlayerToMe(1);		
		ShowWheelMark();
		player.pan += 2; 		
		wait(1);
	}
	iPlayerCarPos = 41;	
	wait(25);
	my._GasPedal = 1;
	InistalCarPath("PlyaerCarPath",0,42,0);	
		
	StopCarEngin = 0;
	LetUsDrive();	
}

/* ------------------------------------------------------------------------------------------------------------ */

function WaitAndDriveBackwards()
{	
	KeepLooping = 1;
	PlayerCarSounds(__EnginLoop,0);
	while (1)
	{
		LnkPlayerToMe(0);								
		you = pointer_to_entity(VWeaponSprite1.skill20);
		if (you)
		{	
			if (you._health <= 0 ) { VWeaponSprite1.flag7 = 1; }
			
		}
		you = pointer_to_entity(VWeaponSprite1.skill21);
		if (you)
		{
			if (you._health <= 0 ) { VWeaponSprite1.flag8 = 1; }
		}

		if (VWeaponSprite1.flag7) && (VWeaponSprite1.flag8)
		{
			break;
		}
		wait(1);
	}
	
	KeepLooping = 0;	
	StopCarEngin = 0;
		
	my.CarForce = 50;
	my._Dest2Move2SecPoint = 100;	
	my._BraksPedal = 1;
	my._StopCar = 1;
	my._break = 0.6;
	//my._GasPedal = 1;
	
	var vfalg = 0;
	while (1)
	{		
		MoveCars(__BackWard,__ManulaPointTrak,30);					
		LnkPlayerToMe(1);				
		if (my.CarForce < 16) && (vfalg == 0)
		{
			StopCarEngin = 1;
			play_sound(TestPlayerS1,40);
			vfalg = 1;
		}
		if (my.CarForce <= 0)
		{
			NexttargetOffset( 0, my._PathOffset, 0);
			my._PointNumber += 1;
			iPlayerCarPos += 1;
			break;
		}
		wait(1);
	}				

	while (KeepLooping.z < 35 )
	{
		LnkPlayerToMe(0);
		KeepLooping.z +=1;
		wait(1);
	}
	KeepLooping = 0;
	StopCarEngin = 0;

	my._MaxSpeed = 60;
	my._Dest2Move2SecPoint = 350;
	my._BraksPedal = 0;
	my._StopCar = 0;
	my._GasPedal = 1;
	my.CarForce = 35;
	LetUsDrive();
}

/* ---------------------------------------------------------------------- */

function FinalFight()
{		
	StopCarEngin = 1;
	KeepLooping = 1;
	PlayerCarSounds(__EnginLoop,0);
	
	you = pointer_to_entity(VWeaponSprite1.skill23);
	if (you)
	{
		if (you._health > 0)
		{
			Play2DSound(7);
		}
	}
	
	while (1)
	{
		if (my.CarForce <= 0) && (iPlayerCarPos < 52)
		{	iPlayerCarPos = 53;
			PlayerCarSounds(__EnginLoop,0);
		}
		you = pointer_to_entity(VWeaponSprite1.skill22);
		if (you)
		{
			if (you._health <= 0 ) { VWeaponSprite1.flag1 = 1; }
		}
		
		you = pointer_to_entity(VWeaponSprite1.skill23);
		if (you)
		{
			if (you._health <= 0 ) { VWeaponSprite1.flag2= 1; }
		}

		if (VWeaponSprite1.flag1)&&(VWeaponSprite1.flag2)
		{
			break;
		}
		wait(1);
	}

	my._StopCar = 0;
	my._BraksPedal = 0;
	my._GasPedal = 1;

	hPlayerWins = 1;
	hideAllGui();
	RemoveAllKeys();
	VictoryScream();
	CloseSong(CurrentSong);
	play_loop(VictoryPlayer, 100);
	h_VictoryPlayer = result;

	on_enter = finalization;
	PreesNextLvl.visible = 1;
	Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));
}

/* ---------------------------------------------------------------------- */

sound JeepBouncing1 , <Jeep_bounce1.wav>;
sound JeepBouncing2 , <Jeep_bounce2.wav>;
define __DegreeOfChaking = 3;

function ChakeCamera()
{
	wait(10);
	while (1)
	{
		if (my._PointNumber == 22) || (my._PointNumber == 37) 
		{
			stop_sound(my._SirenHornSound);
			break;
		}					
		
		if (snd_playing(my._SirenHornSound) == 0)
		{
			if (random(2) > 1)	{play_sound(JeepBouncing1,100);	}
			else			{play_sound(JeepBouncing2,100);	}
			my._SirenHornSound = result;
		}		

		iCameraAngles.tilt += __DegreeOfChaking;
		wait(2);						
		iCameraAngles.tilt -= __DegreeOfChaking*2;
		if (snd_playing(my._SirenHornSound) == 0)
		{
			if (random(2) > 1)	{play_sound(JeepBouncing1,100);	}
			else			{play_sound(JeepBouncing2,100);	}
			my._SirenHornSound = result;
		}	
		wait(2);				
		if (snd_playing(my._SirenHornSound) == 0)
		{
			if (random(2) > 1)	{play_sound(JeepBouncing1,100);	}
			else			{play_sound(JeepBouncing2,100);	}
			my._SirenHornSound = result;
		}	
		iCameraAngles.tilt += __DegreeOfChaking;
		wait(2);
	}
}

/* ---------------------------------------------------------------------- */

define __MovementSpeed = 5;
function SwingPlayerOnTop()
{
	var smoekindofvar = 10;
		
	smoekindofvar = my.pan;
	wait(15);		
			
	if ( smoekindofvar > my.pan )
	{		
		while (camera.roll < 20)
		{
			iCameraAngles.roll +=__MovementSpeed;
			weapon.roll = iCameraAngles.roll;
			wait(1);
		}

		while (1)
		{
			if (smoekindofvar == my.pan)
			{
				break;
			}
			smoekindofvar = my.pan;
			wait(1);
		}

		while (camera.roll > -10)
		{
			iCameraAngles.roll -= __MovementSpeed;
			weapon.roll = iCameraAngles.roll;
			wait(1);
		}

		while (camera.roll < 0)
		{
			iCameraAngles.roll +=__MovementSpeed;
			weapon.roll = iCameraAngles.roll;
			wait(1);
		}
	}
	else
	{		
		while (camera.roll > -20)
		{
			iCameraAngles.roll -= __MovementSpeed;
			weapon.roll = iCameraAngles.roll;
			wait(1);
		}

		while (1)
		{
			if (smoekindofvar == my.pan)
			{
				break;
			}
			smoekindofvar  =my.pan;
			wait(1);
		}

		while (camera.roll < 10)
		{
			iCameraAngles.roll += __MovementSpeed;	
			weapon.roll = iCameraAngles.roll;
			wait(1);
		}
		
		while (camera.roll > 0)
		{				
			iCameraAngles.roll -= __MovementSpeed;	
			weapon.roll = iCameraAngles.roll;
			wait(1);
		}		
	}
	
	weapon.roll = 0;
	camera.roll = 0;
	
}

/* ---------------------------------------------------------------------- */

function LetUsDrive()
{
	EnginSound();
	while (1)
	{		
		MoveCars(__Forward,__ManulaPointTrak,30);
		LnkPlayerToMe(1);

		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me)< my._Dest2Move2SecPoint) 
		{
			NexttargetOffset( 0, my._PathOffset, 0);			
			my._PointNumber += 1;
			iPlayerCarPos += 1;
						
			if (my._PointNumber == 2)
			{
				Play2DSound(2);
			}
			if (my._PointNumber == 16)
			{
				my._Dest2Move2SecPoint = 200;				
				my._break = 1;
				my._StopCar = 1;
				my._BraksPedal = 1;
				StopCarEngin = 1;
				PlayerCarSounds(__LongBreak,17);
			}
			
			if (my._PointNumber == 17)
			{				
				WaitAndDriveBackwards();
				Play2DSound(3);
				return;				
			}
								
			if (my._PointNumber == 33)
			{
				Play2DSound(5);
			}

			if (my._PointNumber == 21) || (my._PointNumber == 36)
			{
				ChakeCamera();
				Play2DSound(4);
			}
			
			if (my._PointNumber == 39)
			{				
				StopCarEngin = 1;
				PlayerCarSounds(__LongBreak,41);
				SkedAndStop();
				return;
			}
			
			if (my._PointNumber == 46)
			{
				Play2DSound(6);
			}
			
			if (my._PointNumber == 51)
			{
				my._break = 1.2;
				my._StopCar = 1;
				my._BraksPedal = 1;
				FinalFight();
				PlayerCarSounds(__LongBreak,52);
				
			}
			if (IsItACornar() > 50) 
			{
				SwingPlayerOnTop();
				PlayRandomSkidSound();
				my._BraksPedal = 1;				
			}			
		}

		wait(1);
	}
}

/* --------------------------------------------------------------------------------------------------------- */

action PlayerCar
{
	//@ skill Used 
     //--------------------

	//@ skill 2 (Wieght): 
	//@       5 (CollFunction):
	//@	  39 (OwnType) :
	//@       15 (CarForce) :

	//@       7  ( _Axceleration ):
	//@       8  ( _MaxSpeed     ):
	//@       16 ( _Break        ):
	//@       17 ( _target_x     ):
	//@       18 ( _target_y     ):
	//@       19 ( _target_z     ):
	//@       30 ( _PointNumber  ):

	pPlayerCar = entity_to_pointer(me);
	wait(10);
			
	while (player == null)	{ wait(1);}	
	
	my.passable = 1;
	my._CarNumber = __PlayerCarNum;
	my._CarType = 	__PlayerCarNum;

	InistalCarSpeed(0,60,0.6,0.3);	
	InistalCarPath("PlyaerCarPath",0,1,0);
	
	InistalCarPathParam(1,5,400); // 1 10 350
			
	LnkPlayerToMe(0);	
	cameraction = EyCamera;
	InitPPCamera();
	player.pan = my.pan;
			
	LetUsDrive();
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//						Helocopter functions
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

define _Speed , skill15;
define __Apatchi = 1;

sound HeloSound , <Heloop02.wav>;

define _MyCoverPlane , skill40;
define _MyCoverPlaneTailLight , skill42;
define _MyCoverPlaneFrontLight , skill43;
define _MyCoverPlaneLight      , skill44;

define _MySound , skill10;
define _Target , skill1;

function ApatchiEvent()
{	
	if (event_type == event_shoot && indicator == _gunfire)
	{
		my._health -= damage/5;
		my.GotHit = 100;
	}
}

/* -------------------------------------------------------- */

function InitalHeloCopter(iType)
{		
	if (iType == __Apatchi)
	{						
		vec_for_vertex(temp,me,134);
		create(<PlaPoint.mdl>,temp,LightFlisher);
		my._MyCoverPlaneFrontLight= entity_to_pointer(you);
				
		vec_for_vertex(temp,me,188);
		create(<PlaPoint.mdl>,temp,LightFlisher);
		my._MyCoverPlaneTailLight= entity_to_pointer(you);		
		you.flag8=1;
				
		vec_for_vertex(temp,me,126);						
		create(<nlight.mdl>,temp,Light);
		my._MyCoverPlaneLight = entity_to_pointer(you);
						
		ent_path("Apatchi");
		ent_waypoint(my._target_x,1);
		my._Speed = 60;
	}
		
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.epassable = 0;
	my.passable  = 1;
	my.owntype = TypeOfEngines;
	my.max_x  *= 2.5;
	my.max_z  *= 0.5;
	
	my._health = 800;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.CollFunction = Function_To_Pointer( "ComparsCollision");
	my.event = ApatchiEvent;
}

/* ------------------------------------------------------------------------------------------------- */

sound ApatchiExplo1 , <HelocopterExplo1.wav>;
sound ApatchiExplo2 , <HelocopterExplo2.wav>;
define __ApatchiExploVolum = 100000; 

function ApatchiExplosion()
{
	RemoveColl(me);
	you = pointer_to_entity(my._MyCoverPlaneFrontLight);
	remove(you);
	you = pointer_to_entity(my._MyCoverPlaneTailLight);
	remove(you);
	you = pointer_to_entity(my._MyCoverPlaneLight);
	remove(you);
	
	my.passable  = 1;	
	
	morph ( <exapache.mdl>, me);
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
	
	if (random(2) > 1)
	{
		play_entsound(me,ApatchiExplo1,__ApatchiExploVolum);
	}
	else
	{
		play_entsound(me,ApatchiExplo2,__ApatchiExploVolum);
	}
	create( <dust.mdl>, my.pos,AtomicExplosion);
	//CameraExplosionMove();
	CameraMoveExplo();
	
	my.skill1= 0;
	while (my.skill1<450)
	{
		SmokeMeSome();
		my.skill1+= 1;
		wait(4);
	}
	remove me;

}

/* -------------------------------------------------------- */

function CreateExplosionNearPlayer()
{
	var icounter = 0;
	while (1)
	{	
		if (my.flag8)
		{
			return;
		}

		iCounter += 1;
		if (iCounter > 250)
		{
			icounter = 0;
			you = pointer_to_entity(pPlayerCar);
			temp.x =250 + random(50);
			temp.y =20 + random(30);
			temp.z = 10;
			vec_rotate(temp , you.pan);
			vec_add(temp , you.pos);
			create( <dust.mdl>, temp,AtomicExplosion);
			CameraExplosionMove();
		}

		wait(1);
	}
}

/* -------------------------------------------------------- */

function Light()
{			
	my.passable = 1;
	my.tilt = -15;	
	my.scale_z = 30;		
	my.scale_x = 5;
	my.scale_y = 5;
				
	my.skill25 = 1;
	my.skill26 = 1;			
	while (1)
	{		
		my.tilt += my.skill25;
		my.pan  += my.skill26;

		if (my.tilt < -45) || (my.tilt > 0)
		{
			my.skill25 *= -1;
		}

		if (my.pan < -80) || (my.pan > 90)
		{
			my.skill26 *= -1;
		}
	
	
	wait(1);
	}	
}

/* -------------------------------------------------------- */

function LightFlisher()
{
	my.invisible = 1;
	my.passable = 1;
	wait(1);
	my.skin = 2;
	my.flare = 1;
	my.bright = 1;
	my.lightrange = 5;

	my.scale_x = 0.2;
	my.scale_y = 0.2;
	my.scale_z = 0.2;
	
	if (my.flag8)
	{
		wait(10 + random(5));
	}
	
	my.skill30 = 0;

	while (my.flag1 == 0)
	{		
		my.skill30 += 1;
		if (my.skill30 > 50 )
		{
			my.invisible = 0;
			my.skill30 = 0;
			my.red = 255;						
			while (my.skill30 < 10)
			{								
				my.skill30 += 1;
				wait(1);
			}
			my.red = 0;
			my.skill30 = 0;
			my.invisible = 1;
		}
		wait(1);
	}
	
	remove(me);
}

/* --------------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------------- */

function Roket()
{
	wait(1);
	
	my.scale_x = 0.5;
	my.scale_y = 0.5;
	my.scale_z = 0.5;
	
	you = pointer_to_entity(my._Target);
	while (vec_dist(my.pos ,you.pos) > 150)
	{		
		you = pointer_to_entity(my._Target);
		
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle.pan;
		my.tilt = my_angle.tilt;

		temp.x = (speed/200) *130;
		temp.y = 0;
		temp.z = 0;
		move(me ,temp ,nullvector );
		my.roll += 5;
		wait(1);
	}
	you = pointer_to_entity(my._Target);	
	you._RollExpoled = 1;	
	my.invisible = 1;
	create( <dust.mdl>, my.pos,AtomicExplosion);
	CameraMoveExplo();
	wait(10);
	remove(me);	
}

/* -------------------------------------------------------- */

//@ this funciton select a point rom the chaper to fire the roket , create the roket and load its target
function FireRoket(iLockedTarget)
{	
	if (my.flag5)
	{
		vec_for_vertex(temp,me,332);
		my.flag5 = 0;
	}
	else
	{
		vec_for_vertex(temp,me,153);
		my.flag5 = 1;
	}
			
	create(<rocket.mdl>,temp,Roket);
	you._Target = iLockedTarget;	
}

/* --------------------------------------------------------------------------------------------------------- */
//@					Basic Movements
/* --------------------------------------------------------------------------------------------------------- */

function SetMyThings()
{
	vec_for_vertex(temp,me,134);	
	you = pointer_to_entity(my._MyCoverPlaneFrontLight);
	vec_set(you.pos,temp);
				
	vec_for_vertex(temp,me,188);	
	you = pointer_to_entity(my._MyCoverPlaneTailLight);
	vec_set(you.pos,temp);
		
	vec_for_vertex(temp,me,126);							
	you = pointer_to_entity(my._MyCoverPlaneLight);
	vec_set(you.pos,temp);
}

/* -------------------------------------------------------- */

function HelocopAnimationSound()
{
	if (snd_playing(my._MySound) == 0)
	{
		play_entsound(me,HeloSound,100000);
		my._MySound = result;
	}
	ent_cycle("Fly" ,my.FrameAnim );
	my.FrameAnim += speed/200 * 20;
}

/* -------------------------------------------------------- */

function BasicMovements()
{
	temp.x = my._Speed * (speed/200);
	temp.y = 0;
	temp.z = 0;
	move(me ,temp ,nullvector );
	SetMyThings();
}

/* -------------------------------------------------------- */

function MoveHeloCopter()
{
	HelocopAnimationSound();
	temp.x = my._target_x - my.x;
	temp.y = my._target_y - my.y;
	temp.z = my._target_z - my.z;
	vec_to_angle(my_angle,temp);
	my.pan = nearangle(my.pan, my_angle.pan, 5);
	my.tilt = nearangle(my.tilt, my_angle.tilt , 5);
	
	BasicMovements();	
}

/* --------------------------------------------------------------------------------------------------------- */
//@				Intersepting player functins
/* --------------------------------------------------------------------------------------------------------- */

var aptchiGunesS[2] = 462 , 223 ;
var aptchiGunesD[2] = 479 , 240 ;

function HeleCopterEngin()
{	
	my.invisible = 1;
	my.passable = 1;

	wait(1);
	if (my.flag1)
	{
		my.pan = you.pan -80;
	}
	else
	{
		my.pan = you.pan +80;
	}
	
	my.skill2 = 0; // timer
	my.skill3 = 1; // speed of
	while (my.skill2 < 80)
	{
		my.skill2 += 1;
		
		temp.x = my.skill3;
		temp.y = 0;
		temp.z = 0;
		move(me ,temp ,nullvector );
	
		if (my.skill2 < 40)
		{
			my.skill3 += 0.4;
		}
		else
		{
			my.skill3 -= 0.4;
		}
		
		wait(1);
	}
	remove(me);	
}

/* --------------------------------------------------------------------------------------------------------- */

//define __ClimpingSpeed = 3;
function MoveMeToMyEngin()
{
	you = pointer_to_entity(my.skill30);
	temp.x = you.x;
	temp.y = you.y;
	temp.z = my.z;
	vec_set(my.pos, temp);
}

/* --------------------------------------------------------------------------------------------------------- */

function HelocopterStarfe(iDirection)
{		
	create(<point1.mdl>,my.pos,HeleCopterEngin);
	my.skill30 = entity_to_pointer(you);	
	my.skill35 = 0;

	var __ClimpingSpeed = 0.3;
	var __LandSpeed = 0.1;
	
	if (iDirection ==__Right)
	{
		you.flag1 = 1;
		while (my.roll < 30)
		{
			MoveMeToMyEngin();
			my.roll += 1;
			my.skill35 += __ClimpingSpeed;
			my.z += my.skill35;			
			HelocopAnimationSound();
			SetMyThings();
			LookAtPlayer();
			wait(1);
		}

		my.skill35 = 0;
		while (my.roll> -10)
		{
			MoveMeToMyEngin();
			my.roll -= 1;
			my.skill35 += __LandSpeed;
			my.z -= my.skill35;			
			HelocopAnimationSound();
			SetMyThings();
			LookAtPlayer();
			wait(1);
		}
				
		my.skill35 = 0;
		while (my.roll < 0 )
		{
			MoveMeToMyEngin();
			my.roll += 1;			
			my.skill35 += __LandSpeed;
			my.z -= my.skill35;
			HelocopAnimationSound();
			SetMyThings();
			LookAtPlayer();
			wait(1);
		}		
	}
	else
	{
		you.flag1 = 0;
		while (my.roll > -30)
		{
			MoveMeToMyEngin();
			my.roll -= 1;
			my.skill35 += __ClimpingSpeed;
			my.z += my.skill35;
			HelocopAnimationSound();
			SetMyThings();
			LookAtPlayer();
			wait(1);
		}

		my.skill35 = 0;
		while (my.roll < 10)
		{			
			MoveMeToMyEngin();
			my.roll += 1;
			my.skill35 += __LandSpeed;
			my.z -= my.skill35;
			HelocopAnimationSound();
			SetMyThings();
			LookAtPlayer();
			wait(1);
		}
		
		my.skill35 = 0;
		while (my.roll > 0)
		{
			MoveMeToMyEngin();
			my.roll -= 1;
			my.skill35 += __LandSpeed;
			my.z -= my.skill35;
			HelocopAnimationSound();
			SetMyThings();
			LookAtPlayer();
			wait(1);
		}
	}

	my.flag7 = 1;
}

/* --------------------------------------------------------------------------------------------------------- */

function InterseptPlayer()
{
	my.WeaponNumber = lmg;
	my.EnemyId = player.bodylnk;

	my._speed = 10;					
	while (my.pan < -3)
	{
		if (my.roll > -60)
		{
			my.roll -= 5;
		}
		my.pan += 5;
		my.z -= 5;
		HelocopAnimationSound();
		BasicMovements();		
		
		if (my._health <= 0) { ApatchiExplosion(); return; }
		wait(1);
	}

	my._Speed = 10;
	while (my.z > 1000)
	{
		if (my.roll < 0)
		{
			my.roll += 5;
		}
		my.z -= 5;
		HelocopAnimationSound();
		BasicMovements();
		if (my._health <= 0) { ApatchiExplosion(); return; }
		wait(1);
	}

	my.roll = 0;
	while (my.tilt > -8)
	{
		my.tilt -= 1;
		HelocopAnimationSound();
		SetMyThings();
		LookAtPlayer();
		if (my._health <= 0) { ApatchiExplosion(); return; }
		wait(1);
	}

	//@ hovering
	my.skill35 = 0.2;
	my.skill34 = -0.1;
	my.flag8 = 1;
	my.skill33 = 0;
	while (my._health > 0)
	{
		my.skill33 += 1;
		if (my.skill33 > 200)
		{
			my.skill33 = 0;
			my.flag7 = 0;
			if (my.flag6)
			{
				my.flag6 = 0;	
				HelocopterStarfe(__Left);
			}
			else
			{
				my.flag6 = 1;
				HelocopterStarfe(__Right);
			}

			while (my.flag7 ==0){wait(1);}
		}

		my.z += my.skill35;
		my.roll += my.skill34;
		if (my.roll < -3) { my.skill34 =  0.1; }
		if (my.roll > 3)  { my.skill34 = -0.1; }
		if (my.z > 1020)  { my.skill35 = -0.2; }
		if (my.z < 1000)  { my.skill35 =  0.2; }

		HelocopAnimationSound();
		SetMyThings();
		LookAtPlayer();

		temp2.x = int(random(2));
		Short_GunFlash( me, aptchiGunesS[temp2.x], aptchiGunesD[temp2.x]);
		if (random(3) > 1)
		{
			ShotAndDamage(75,1,1,aptchiGunesS[temp2.x]);
		}

		if ( my._health <= -50) && (random(10)>5 )
		{
			SmokeMeSome();
		}
		wait(1);
	}
	
	ApatchiExplosion();
}

/* ------------------------------------------------------------------------------------------------- */
//@				Helocopter main function
/* ------------------------------------------------------------------------------------------------- */

action HeloCopter
{
	//@ Skills Used:
	//@	  5  ( CollFunction	       )
	//@       10 ( _MySound		       ) 
	//@       15 ( _Speed                  )
	//@	  28 ( FrameAnim	       )
	//@	  39 ( owntype		       )	
	//@       42 ( _MyCoverPlaneTailLight  )
	//@       43 ( _MyCoverPlaneFrontLight )
	//@       44 ( _MyCoverPlaneLight      )
	//@       45 ( epassable               )
	
	InitalHeloCopter(__Apatchi);
	VWeaponSprite1.skill23 = entity_to_pointer(me);
	while (iPlayerCarPos < 37)
	{
	wait(1);
	}
	while (iPlayerCarPos < 42)
	{
		HelocopAnimationSound();
		wait(1); 
	}
	
	CreateExplosionNearPlayer();

	while (my._health > 0)
	{				
		if ( my._health <= 150) && (random(10)>5 )
		{
			SmokeMeSome();
		}

		MoveHeloCopter();		
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me)<50)
		{					
			ent_nextpoint(my._target_x);
			my._PointNumber += 1;	
			if (my._PointNumber == 2)
			{
				FireRoket(ObjecPos.skill1);				
			}

			if (my._pointnumber == 6)
			{
				my._Speed = 100;
			}

			if (my._pointnumber == 7)
			{
				InterseptPlayer();
				return;
			}
		}
		wait(1);
	}
	
	ApatchiExplosion();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//						Compars functions
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function StartRunning()
{	
	while (1)
	{
		if (my.skill1 == 4)
		{
			ent_cycle("WALK",my.FrameAnim);
			my.FrameAnim += 8 * (speed/200);
		}
		else
		{
			ent_cycle("RUN",my.FrameAnim);
			my.FrameAnim += 12 * (speed/200);
		}
						
		MoveOnly(__Forward , 0);
		my.skill21 += 1;
		if (my.skill21 > 130)
		{
			break;
		}
		wait(1);
	}

	wait(50);
	remove(me);
}

/* ------------------------------------------------------------------------------------------------- */

action RunningCompars
{	
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);
	
	if (my.skill1 ==1) //|| (my.skill1 == 2)
	{
		my.CarForce = 8;
		while (iPlayerCarPos < 22) { wait(1); }
	}

	if (my.skill1 == 3)
	{
		my.CarForce = 8;
		my.pan += 130;
		while (iPlayerCarPos < 36) { wait(1); }
		
	}
	if (my.skill1 == 4)
	{
		my.CarForce = 5;
		while (iPlayerCarPos < 15) { wait(1); }
	}
	StartRunning();
}

/* ------------------------------------------------------------------------------------------------- */

action HHealth
{
	while (player == null)	{ wait(1); }	

	if (level.y == 3)
	{
		remove(me);
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

	sonar(me,4000);
	my.z -= result;
	my.scale_x=2;
	my.scale_y=2;
	my.scale_z=2;

	
	
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
		wait(1);
	}

	remove(me);
}