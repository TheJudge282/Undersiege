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
	type = <Lev10ALoad.bmp>;
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
//sound StartSound  , <LT_10.wav>;
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
include <lev10scripte1.wdl>;
var video_mode = 7;
var video_depth = 16;

string level_str = <lev10ha.WMB>; // give file names in angular brackets

function main()
{
	str_cpy(levelpath,"PPoint1.pts");
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;
	//play_sound(StartSound,100);
	//StartSoundh=result;
	
	fog_color=1;
	camera.fog=12;
	clip_range = 2500;		
	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
//	LevelNumberId = 10;
	initilization();

	MyMain();	
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

function israil_soldier()
{return;
}

function follow_freind()
{return;
}

function palastain_patrol()
{return;
}

function Startlevel()
{	return;
	//screenshot();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//					my decleration                         
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

//@ DinametObject - skill [1] -->  __Dinamet
//@ DinametObject - skill [2] -->  __Gas
//@ DinametObject - skill [3] -->  __Wairs
//@ DinametObject - skill [4] -->  __Nedels
//@ DinametObject - skill [5] -->  Tree
//@ DinametObject - skill [6] -->  Tank
//@ DinametObject - skill [7] -->  The Boom

//@ DinametObject - skill [11] -->  player got __Dinamet
//@ DinametObject - skill [12] -->  player got __Gas
//@ DinametObject - skill [13] -->  player got __Wairs
//@ DinametObject - skill [14] -->  player got __Nedels


var SwatGoGoGo = 0;
var SahahGoGoGo = 0;

//string BomTGA,<bom.tga>;

var UseState = 1;
define __DoNothing       = 0;
define __CollectingItems = 1;	//@  if the player is collection items then 
define __DroupBom        = 2;   //@  if the player have the bom 
define __CarryBom        = 3;   //@  if the player dropt the bom
define __DatenatBom      = 4;   //@  if the player placed the bom in the tree


var BomState = 0;
define __BomWithPlayer = 0;
define __BomOnTree     = 1;
define __BomOnGround   = 2;
define __BomArmed      = 3;
define __BomExplod     = 4;


define _ItemType, skill1;
define __Dinamet = 1;
define __Gas	 = 2;
define __Wairs   = 3;
define __Nedels  = 4;

//@ skin number
define __DinametSkin = 1; //9;
define __GasSkin     = 2; //1;
define __WairsSkin   = 3; //12;
define __NedelsSkin  = 4; //11;
define __BomSkin     = 5; //10;


//@ cars dec
define __Hummer = 1;
define __Tank = 2;

define __WheelsHight = 13;

define _PointNumber , skill30;
define _MyUpBody    , skill31 ;
define _MyBustone   , skill32 ;


define DinametObject , object1;
define GasObject     , object2;
define WairsObject   , object3;
define NedelsObject  , object4;

var SoldierArray[4] = 0,0,0,0;
function Play2dSound(iCase,Stop);
function MyMain()
{		
	ObjecPos1.visible = 0;
		
	DinametObject.visible = 0;
	GasObject.visible = 0;
	WairsObject.visible = 0;
	NedelsObject.visible = 0;
	
	DinametObject.skin = __DinametSkin;
	GasObject.skin     = __GasSkin;
	WairsObject.skin   = __WairsSkin;
	NedelsObject.skin  = __NedelsSkin;

	MisionsMsg1.visible = 1;
	MisionsMsg2.visible = 1;
	MisionsMsg3.visible = 1;
	MisionsMsg4.visible = 1;
	MisionsMsg5.visible = 0;

	totalbullets[1] = 60;
	totalbullets[0] = 30;
	totalbullets[8] = 3;
	while (player == null)
	{
	wait(1);
	}
	myShowmessions();
	wait(50);
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	
	while (LetTheGameBegin == 0)
	{
	wait(1);
	}
	Play2dSound(9,1);
	while(1)
	{
		if (MisionsMsg1.ambient == -100) && (MisionsMsg2.ambient == -100) && (MisionsMsg3.ambient == -100) && (MisionsMsg4.ambient == -100)
		{
			break;
		}
	
		wait(1);
	}
	MisionsMsg5.visible = 1;

}

/* -------------------------------------------------------------------------------------------------- */
/*
function MisionFail(Case)
{
	//@ the Swat Got The Player.
	if (Case == 1)
	{
		showmessage(1,204);
	}

	ZoomOut();
	play_sound( PlDed,100);	
	h_PlDed = result;
	me = 0;
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;
}

/* -------------------------------------------------------------------------------------------------- */

sound UGotGas , <yougotgas.wav>;
function Play2dSound(iCase,Stop)
{	
	if (Stop)
	{
		stop_sound(p2dSound);
	}
	else
	{
		while (snd_playing(p2dSound))
		{
			wait(1);
		}
	}
	
	
	//@ U Got Dinamet
	if (iCase == 1)
	{
		showmessage(1,198);
		play_sound(S_M_L10_08,100);
		p2dSound = result;
	}
	
	//@ U Got Gas
	if (iCase == 2)
	{
		showmessage(1,199);
		play_sound(UGotGas,100);
		p2dSound = result;
	}
	
	//@ U Got Wairs
	if (iCase == 3)
	{
		showmessage(1,200);
		play_sound(S_M_L10_44,100);
		p2dSound = result;
	}
	
	//@ U got Nedels and colth
	if (iCase == 4)
	{
		showmessage(1,201);
		play_sound(S_M_L10_10,100);
		p2dSound = result;
	}
	
	//@ Ok We Can Make Bom - Plant it in the road.
	if (iCase == 5)
	{
		showmessage(1,137);
		play_sound(S_M_L10_06,100);
		p2dSound = result;
		
		while (snd_playing(p2dSound))
		{
			wait(1);
		}
		
		DinametObject.skin = 5;
		GasObject.visible   = off;
		WairsObject.visible = off;
		NedelsObject.visible= off;
		UseState = __DroupBom;

		showmessage(1,138);
		play_sound(S_M_L10_07,100);
		p2dSound = result;
	}

	//@ Bom In Place
	if (iCase == 6)
	{
		showmessage(1,142);
		play_sound(S_M_L10_11,100);
		p2dSound = result;
		while (snd_playing(p2dSound))
		{
			wait(1);
		}
		showmessage(1,143);
		play_sound(S_M_L10_12,100);
		p2dSound = result;
	}
	
	//@ Bom In Wrong Place
	if (iCase == 7)
	{
		showmessage(1,140);
		play_sound(S_M_L10_09,100);
		p2dSound = result;
	}

	//@ Explosion scceed
	if (iCase == 8)
	{
		showmessage(1,150);
		play_sound(S_M_L10_19,100);
		p2dSound = result;
		while (snd_playing(p2dSound))
		{
			wait(1);
		}
		showmessage(1,151);
		play_sound(S_M_L10_20,100);
		p2dSound = result;
	}
	
	if (iCase == 9)
	{
		showmessage(1,132);
		play_sound(S_M_L10_01,100);
		p2dSound = result;
	}
	/*
	//@ Explosion Faled To Early
	if (iCase == 9)
	{
		showmessage(1,);
		play_sound(S_M_L10_,100);
		p2dSound = result;
	}
	
	//@ Explosion Faled To Late
	if (iCase == 10)
	{
		showmessage(1,);
		play_sound(S_M_L10_,100);
		p2dSound = result;
	}
	*/
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//					Movei functions 
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

//@ this function svaes the 3 cameras position and pan to <WairsObject> skill1
action CamPos
{
	my.scale_x = 1;
	my.scale_y = 1;
	my.scale_z = 1;
	
	if (my.skill1 == 1)
	{
		WairsObject.skill1 = my.x;
		WairsObject.skill2 = my.y;
		WairsObject.skill3 = my.z;
		WairsObject.skill4 = my.pan;
	}
	
	if (my.skill1 == 2)
	{
		WairsObject.skill5 = my.x;
		WairsObject.skill6 = my.y;
		WairsObject.skill7 = my.z;
		WairsObject.skill8 = my.pan;
	}
	
	if (my.skill1 == 3)
	{
		WairsObject.skill9 = my.x;
		WairsObject.skill10 = my.y;
		WairsObject.skill11 = my.z;
		WairsObject.skill12 = my.pan;
	}
	remove(me);
}

/* -------------------------------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------------------------------- */

function CameraAng(cPan,cTilt,cRoll)
{
	camera.pan  = cPan;
	camera.tilt = cTilt;
	camera.roll = cRoll;
}

/* ------------------------------------- */

function CameraPos(cX,cY,cZ)
{
	camera.x = cX;
	camera.y = cY;
	camera.z = cZ;	
}

/* -------------------------------------------------------------------------------------------------- */

var CameraNumber;
function CamerasView()
{			
	me = 0;
	var  Counter1 = 0;
	
	//@ firest camera
	CameraNumber = 1;
	CameraPos(WairsObject.skill1 ,WairsObject.skill2 ,WairsObject.skill3 );		
	CameraAng(WairsObject.skill4,0,0);	
	while (BomState !=__BomExplod)
	{
		CameraPos(WairsObject.skill1 ,WairsObject.skill2 ,Counter1);
		Counter1 += speed/200;
		wait(1);
	}
	
	wait(40);
	
	//@ second camera
	CameraNumber = 2;
	CameraPos(WairsObject.skill5 ,WairsObject.skill6 ,WairsObject.skill7 );		
	CameraAng(WairsObject.skill8,0,0);

	
	wait(150);

	//@ third camera
	CameraNumber = 3;
	CameraPos(WairsObject.skill9 ,WairsObject.skill10 ,WairsObject.skill11 );		
	CameraAng(WairsObject.skill12,0,0);	
	while (camera.pan > 90)
	{		
		CameraAng(WairsObject.skill12,0,0);
		WairsObject.skill12 -= 0.5;
		wait(1);
	}
		
	wait(60);

	on_enter = finalization;
	MovieOrSucess = 1;
	play_loop(VictoryPlayer, 100);
	h_VictoryPlayer = result;
	VictoryScream();
	
	PreesNextLvl.visible = 1;	
	wait(10);
	Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
	
	
}

/* -------------------------------------------------------------------------------------------------- */

function HideEveryThing()
{
//	MovieOrSucess = 1;
	WeaponPan2.visible = 0;	
	WeaponPan.visible = 0;
	WeaponStore.visible = 0;
	DWeaponStore.visible = 0;
	WeaponStore.visible = 0;
	VWeaponSprite.visible = 0;
	VWeaponSprite1.visible = 0;
	ObjecPos.visible = 0;
	outcompass.visible = 0;
	EnemyPos.visible = 0;
	Compass.visible = 0;
	HldBk.visible = 0;
	HldSld.visible = 0;
	VWeaponSprite1.visible = 0;
	CPointer.visible = 0;
	looprun=0;
	mesges.visible = 0;
	//CloseSong(CurrentSong);	
}

/* -------------------------------------------------------------------------------------------------- */

function ViewTheSwat()
{
	game_state[0] = 101;
	MisionsMsg5.ambient = -100;
		
	Camra2Player = 0;
	RemoveAllKeys();
	HideEveryThing();

	player.passable = 1;
	player.visible = 0;
	player.z -= 100;
	CamerasView();	
	wait(1);
	SwatGoGoGo.x = 1;
	SwatGoGoGo.y = 1;
	SwatGoGoGo.z = 1;		
	
}

/* -------------------------------------------------------------------------------------------------- */

function CountDownToEx()
{
	wait(50);
	BomState = __BomExplod;

}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//					items functions                           
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
sound TakeItemSound , <Take.wav>;

function ItemEvent()
{
	if (event_type == event_push) && (you._type == _type_player)
	
	//if (event_type == event_scan) && (indicator == _handle)
	{
		my.event = null;
		my.invisible = on;
		my.passable = on;		
		
		if (my._ItemType == __Dinamet )
		{						
			DinametObject.visible = on;
			DinametObject.skill11 = 0;
			Play2dSound(1,1);
			MisionsMsg3.ambient = -100;
			goto Step1;
		}
				
		if (my._ItemType == __Gas)
		{						
			GasObject.visible = on;
			DinametObject.skill12 = 0;
			Play2dSound(2,1);
			MisionsMsg2.ambient = -100;
			goto Step1;
		}
		
		if (my._ItemType == __Wairs )
		{						
			WairsObject.visible = on;			
			DinametObject.skill13 = 0;
			Play2dSound(3,1);
			MisionsMsg4.ambient = -100;
			goto Step1;
		}
		
		if (my._ItemType == __Nedels )
		{						
			NedelsObject.visible= on;			
			DinametObject.skill14 = 0;
			Play2dSound(4,1);
			MisionsMsg1.ambient = -100;
		}
		
		Step1:
		play_sound(TakeItemSound,100);
		wait(20);			
		remove(me);
		
	}
}

/* -------------------------------------------------------------------------------------------------- */
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

define __ChangeSpeed  = 3;

/* -------------------------------------------------------------------------------------------------- */

define __ItemDist = 150;
define __ItemTime = 300;

//@ this function control the items that the player is going to get.
action my_items
{

	//@  skill 1 ( _ItemType )  -- > [1]   __Dinamet.
	//@	                    -- > [2]   __Gas.
	//@			    -- > [3]   __Wairs.
	//@		            -- > [4]   __Nedels. 
	//@ skill 25 - 26 : Counter;

	

	my.scale_x = 1.5;
	my.scale_y = 1.5;
	my.scale_z = 1.5;
	
	sonar(my,10000);
	my.z = target.z + abs(my.min_z);
		

	while (player == null)
	{
		wait(1);
	}
	
	my.lightrange = 50;
	my.skill26 = __ChangeSpeed;
	
	my.push = -1;
	my.enable_push = on;
	my.enable_scan = on;		
        my.event = ItemEvent;
	
	if (my._ItemType == __Dinamet)
	{		
		DinametObject.skill1 = entity_to_pointer(me);
		DinametObject.skill11 = 1;
		my.skin = 6;
		goto step2;
	}	
	if (my._ItemType == __Gas)
	{		
		DinametObject.skill2 = entity_to_pointer(me);
		DinametObject.skill12 = 1;
		my.skin = 4;
		goto step2;
	}
	if (my._ItemType == __Wairs)
	{		
		DinametObject.skill3 = entity_to_pointer(me);
		DinametObject.skill13 = 1;
		my.skin = 2;
		goto step2;
	}
	if (my._ItemType == __Nedels)
	{		
		DinametObject.skill4 = entity_to_pointer(me);
		DinametObject.skill14 = 1;
		my.skin = 5;
	}
	
	step2:	
	
	my.skill25 = __ItemTime;
	while (me != null)
	{		
		GlowRed(5,250,100);

		if (my.skill1 == 1)
		{						
			if (vec_dist(my.pos ,player.pos ) < 2000) { SoldierArray[0] = 1; }
		}		
		if (my.skill1 == 2)
		{						
			if (vec_dist(my.pos ,player.pos ) < 2000) { SoldierArray[1] = 1; }
		}		
		if (my.skill1 == 3)
		{						
			if (vec_dist(my.pos ,player.pos ) < 1300) { SoldierArray[2] = 1; }
		}		
		if (my.skill1 == 4)
		{						
			if (vec_dist(my.pos ,player.pos ) < 1900) { SoldierArray[3] = 1; }
		}
		
		//@
		//@ active this code if the items must be caryed by pressing the use key.
		//@

		//if (vec_dist(my.pos ,player.pos) < __ItemDist)
		//{
		//	my.skill25 += 1;
		//	if (my.skill25 > __ItemTime)
		//	{
		//		my.skill25 = 0;
		//		if (my._ItemType == __Dinamet)
		//		{
		//			showmessage(1,198);
		//			goto step3;
		//		}
		//		if (my._ItemType == __Gas)
		//		{
		//			showmessage(1,199);
		//			goto step3;
		//		}
		//		if (my._ItemType == __Wairs)
		//		{
		//			showmessage(1,200);
		//			goto step3;
		//		}
		//		if (my._ItemType == __Nedels)
		//		{
		//			showmessage(1,201);
		//		}
		//		step3:
		//	}
		//}
		//else
		//{
		//	my.skill25 = __ItemTime;
		//}
		wait(1);
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//					Tree functions                             
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

function BomPlace()
{					
	my.skin = 7;
	my.transparent = 1;
	my.overlay = 1;
	my.flare = 1;
	my.passable = 1;
	
	my.lightrange =10;
	my.red = 100;
	
	//my.scale_x = 1.5;
	//my.scale_y = 1.5;
	//my.scale_z = 1.5;
	while (BomState != __BomArmed)
	{
		if (my.flag1)
		{
			my.flag1 = 0;
			
			my.scale_x = 1.5;
			my.scale_y = 1.5;
			my.scale_z = 1.5;
		}
		else
		{
			my.flag1 = 1;
			
			my.scale_x = 2;
			my.scale_y = 2;
			my.scale_z = 2;						
		}
		wait(3);
	}
	remove(me);
}

/* -------------------------------------------------------------------------------------------------- */

function TreeLevs()
{
	while (BomState != __BomExplod)
	{
		wait(1);
	}
	remove(me);
}



action Tree
{			
	if (my.flag1)
	{
		TreeLevs();
		return;
	}	

	DinametObject.skill5 = entity_to_pointer(me);				
	my.enable_scan = 1;
	my.enable_detect = 1;
	
	while (DinametObject.skin != 5)
	{
		wait(1);
	}
	
	temp.x = 0;
	temp.y = 5;
	temp.z = 23;
	vec_rotate(temp,my.pan);
	vec_add(temp,my.pos);
	create(<hhealth1.mdl>,temp,BomPlace);	
	my.skill30 = you.x;
	my.skill31 = you.y;
	my.skill32 = you.z;
	

	while (BomState != __BomExplod)
	{
		if (vec_dist(my.pos ,player.pos ) < 250)
		{
			my.skill40 += 1;
			if (my.skill40 > 300)
			{
				my.skill40 = 0;
				showmessage(1,208);
			}
		}
		else
		{
			my.skill40 = 300;
		}
		wait(1);
	}
			
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 1000;
	indicator = _explode;
	scan(my.pos ,my.pan ,temp );
					
	create( <dust.mdl>, my.pos ,AtomicExplosion);
	play_entsound(me , grenadex , 10000);
	//CameraMoveExplo();		
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//				  player functions                       
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

define __TreeDist = 250;

function BomEvent()
{		
	// The Bom Scaned by the player
	if (event_type == event_scan) && (indicator == _handle)  
	{			
		my.event = null;
		DinametObject.visible = 1;
		BomState = __BomWithPlayer;
		wait(3);
		UseState = __DroupBom;
		remove(me);			
	}
}

/* -------------------------------------------------------------------------------------------------- */
define __LestNumber = 2;
function BomDatenation()
{	
	my.flag1 = 1;
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 400;
	indicator = _explode;
	scan(my.pos ,my.pan , temp);
	indicator = 0;
	create( <dust.mdl>, my.pos ,AtomicExplosion);
	play_entsound(me , grenadex , 10000);
		
	wait(25);
	
	if (DedSolders > __LestNumber)
	{
		SahahGoGoGo = 1;
	}
	else
	{
		// code to determen the explision was to late or to early.	
	}
	wait(20);
	Play2dSound(8,1);
	remove(me);
}

/* -------------------------------------------------------------------------------------------------- */
function RemoveMySoldiers(Vyou)
{	
	you = pointer_to_entity(Vyou);	
	if (you)
	{
		you.invisible = 1;
		you._health = -5000;
	}
} 

function RemoveHSoldiers()
{
	RemoveMySoldiers(VWeaponSprite.skill1);
	RemoveMySoldiers(VWeaponSprite.skill2);
	RemoveMySoldiers(VWeaponSprite.skill3);
	RemoveMySoldiers(VWeaponSprite.skill4);
	RemoveMySoldiers(VWeaponSprite.skill5);
	RemoveMySoldiers(VWeaponSprite.skill6);
	RemoveMySoldiers(VWeaponSprite.skill7);
	RemoveMySoldiers(VWeaponSprite.skill8);
	RemoveMySoldiers(VWeaponSprite.skill9);
	RemoveMySoldiers(VWeaponSprite.skill10);
	RemoveMySoldiers(VWeaponSprite.skill11);
	RemoveMySoldiers(VWeaponSprite.skill12);
	RemoveMySoldiers(VWeaponSprite.skill13);
	RemoveMySoldiers(VWeaponSprite.skill14);
	RemoveMySoldiers(VWeaponSprite.skill15);
}

function TheBom()
{	
	my.skin = 3;	
	
	my.enable_scan = on;		
	my.event = BomEvent;	
	
	DinametObject.skill7 = entity_to_pointer(me);

	you = pointer_to_entity(DinametObject.skill5);
	if (vec_dist(my.pos ,you.pos) < __TreeDist)
	{
		my.event = null;
		RemoveHSoldiers();
		BomState = __BomOnTree;		

		
								
		BomState = __BomArmed;
		wait(1);
		UseState = __DatenatBom;

		you = pointer_to_entity(DinametObject.skill5);		
		temp.x = you.skill30;
		temp.y = you.skill31;
		temp.z = you.skill32;
		vec_set(my.pos,temp);
		
		DinametObject.visible = 0;		
		
		Play2dSound(6,1);		
		while (snd_playing(p2dSound))
		{
			wait(1);
		}
		ViewTheSwat();
		//@ wait for explosion comand.
		while (BomState == __BomArmed)
		{			
			wait(1);
		}
		
		BomDatenation();
	}
	else
	{
		my.scale_x = 2;
		my.scale_y = 2;
		my.scale_z = 2;

		sonar(me,500);
		my.z -= result;
		BomState = __BomOnGround;
		Play2dSound(7,1);
	}
}

/* -------------------------------------------------------------------------------------------------- */

function DropItem()
{	
	temp.x = 30;
	temp.y = 0;
	temp.z = 0;
	vec_rotate(temp,player.pan);
	vec_add(temp,player.pos);
	create(<hhealth1.mdl>,temp,TheBom);
	DinametObject.visible = 0;
}

/* -------------------------------------------------------------------------------------------------- */

//@ this function direct the compas to point to object not taken so far.
function FindNextItem()
{	
	if (DinametObject.skill11 == 1)
	{		
		return(pointer_to_entity(DinametObject.skill1));
	}
	if (DinametObject.skill12 == 1)
	{		
		return(pointer_to_entity(DinametObject.skill2));
	}
	if (DinametObject.skill13 == 1)
	{		
		return(pointer_to_entity(DinametObject.skill3));
	}
	if (DinametObject.skill14 == 1)
	{		
		return(pointer_to_entity(DinametObject.skill4));
	}
				
	//@ the tree
											
	if (my.flag3 == 0)
	{	
		my.flag3 = 1;
		Play2dSound(5,0);
	}
	return(pointer_to_entity(DinametObject.skill5));
}

/* -------------------------------------------------------------------------------------------------- */

//@  This function control the scaning object that gos whereever the
//@  player gos, and control the campas.
action PlayerScanHand
{
	//@  if the player is collection items then   :  __CollectingItems.
	//@  if the player have the bom               :  __DroupBom.
	//@  if the player dropt the bom              :  __CarryBom.
	//@  if the player placed the bom in the tree :  __DatenatBom.
	
	my.passable = on;
	my.invisible = on;
	
	while (player == null) || (DinametObject.skill11 == 0)
	{
		wait(1);
	}
	
	while (BomState != __BomArmed)
	{
		vec_set(my.pos,player.pos);
		my.pan = player.pan;		
				
		if (PressedKeys[Key_Use] == 1)
		{
			temp.pan = 160;
			temp.tilt = 90;
			temp.z = 200;
			indicator = _handle;
			scan(my.pos ,my.pan ,temp);
			indicator = 0;
			
			if (UseState == __DroupBom)
			{
				UseState = __CarryBom;
				wait(5);
				DropItem();
			}
			
			if (UseState == __DatenatBom )
			{
				BomState =__BomExplod;
				UseState =__DoNothing; 
			}			
		}
		
		//@ Compas Code
		
		//@ point to the objects and the tree
		if (UseState == __CollectingItems) || (UseState == __DroupBom)
		{			
			you = FindNextItem();
			if (you != null)
			{
				ObjecPos.frame = 1;				
				temp.x = you.x - player.x;
				temp.y = you.y - player.y;
				temp.z = you.z - player.z;
				vec_to_angle( temp, temp);
				ObjecPos.roll = player.pan - temp.pan;
			}	
		}
		//@ point to the boom, if hte boom were placed in wrong place
		else
		{
			you = pointer_to_entity(DinametObject.skill7);
			if (you)
			{
				ObjecPos.frame = 1;				
				temp.x = you.x - player.x;
				temp.y = you.y - player.y;
				temp.z = you.z - player.z;
				vec_to_angle( temp, temp);
				ObjecPos.roll = player.pan - temp.pan;
			}
		}				
					
		wait(1);
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                        Soldiers Function
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
var iCounter = 0;
action MySoldiers
{
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);

	iCounter += 1;
	if (iCounter == 1)	{ VWeaponSprite.skill1  = entity_to_pointer(me); goto smoething;}
	if (iCounter == 2)	{ VWeaponSprite.skill2  = entity_to_pointer(me); goto smoething;}
	if (iCounter == 3)	{ VWeaponSprite.skill3  = entity_to_pointer(me); goto smoething;}
	if (iCounter == 4)	{ VWeaponSprite.skill4  = entity_to_pointer(me); goto smoething;}
	if (iCounter == 5)	{ VWeaponSprite.skill5  = entity_to_pointer(me); goto smoething;} 
	if (iCounter == 6)	{ VWeaponSprite.skill6  = entity_to_pointer(me); goto smoething;}
	if (iCounter == 7)	{ VWeaponSprite.skill7  = entity_to_pointer(me); goto smoething;}
	if (iCounter == 8)	{ VWeaponSprite.skill8  = entity_to_pointer(me); goto smoething;}
	if (iCounter == 9)	{ VWeaponSprite.skill9  = entity_to_pointer(me); goto smoething;}
	if (iCounter == 10)	{ VWeaponSprite.skill10 = entity_to_pointer(me); goto smoething;}
	if (iCounter == 11)	{ VWeaponSprite.skill11 = entity_to_pointer(me); goto smoething;}
	if (iCounter == 12)	{ VWeaponSprite.skill12 = entity_to_pointer(me); goto smoething;}
	if (iCounter == 13)	{ VWeaponSprite.skill13 = entity_to_pointer(me); goto smoething;}
	if (iCounter == 14)	{ VWeaponSprite.skill14 = entity_to_pointer(me); goto smoething;}
	if (iCounter == 18)	{ VWeaponSprite.skill15 = entity_to_pointer(me); }

	smoething:

	while (SoldierArray[my.skill7 - 1] == 0)
	{
		wait(1);
	}
	
	if (random(3) > 1)
	{
		SoldColl();
	}
	else
	{
		LmgSolder();
	}
}

/* ---------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------- */

define __ChangeTime = 50;
define __RandomChangeTime = 50;

define  _SwatFrames , skill2;

define __SwatFront , 3;
define __SwatLeft  , 4;
define __SwatRight , 5;
define __SoldWalk  , 2;
define __SoldRun   , 1;

/* ---------------------------------------------------------------------------------------------------- */

function ChangeThis___ReturnPan()
{
	temp.x = my._target_x - my.x;
	temp.y = my._target_y - my.y;
	temp.z = my._target_z - my.z;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;	
	return(my.pan);
}

/* ---------------------------------------------------------------------------------------------------- */
define __SmoeThing = 2;
function ChangeThis___MoveSwat(swatspeed)
{
	
	if (my._SwatFrames == __SoldRun)
	{
		ent_cycle("1run" ,my.FrameAnim);
		my.FrameAnim += swatspeed + __SmoeThing;
		goto sm1;
	}
	if (my._SwatFrames == __SwatFront)
	{
		ent_cycle("3walk" ,my.FrameAnim);
		my.FrameAnim += swatspeed + __SmoeThing;
		goto sm1;
	}
	if (my._SwatFrames == __SwatLeft)
	{
		ent_cycle("4walk" ,my.FrameAnim);
		my.FrameAnim += swatspeed + __SmoeThing;
		goto sm1;
	}
	if (my._SwatFrames == __SwatRight)
	{
		ent_cycle("5walk" ,my.FrameAnim);
		my.FrameAnim += swatspeed + __SmoeThing;
		goto sm1;
	}
	if (my._SwatFrames == __SoldWalk)
	{
		ent_cycle("2walk" ,my.FrameAnim);
		my.FrameAnim += swatspeed + __SmoeThing;
	}
	
	sm1:
	
	temp.x = swatspeed;
	temp.y = 0;
	sonar(me,5000);
	temp.z = -result;
	move(me ,temp ,nullvector);
}

/* ---------------------------------------------------------------------------------------------------- */

function GoCoverSwat()
{
	//@ run to cover point
	ent_path("CoverPath");
	if (my.skill1 == 11){ent_waypoint(my._target_x,1);}
	else		    {ent_waypoint(my._target_x,2);}	
	my.pan = ChangeThis___ReturnPan();
	while(1)
	{
		ChangeThis___MoveSwat(speed/25);
		vec_set( point_move.x, my._target_x);
		if (EDistance(point_move,me)< 50)
		{
			break;
		}
		wait(1);
	}
		
	//@ look @ the tank.
	my.pan = -157;		

	//@ fire some bulets
	my.FrameAnim = 0;		
	my.skill6 =18; 
	while (my.FrameAnim < 600)
	{
		ent_cycle("6shot" ,my.FrameAnim );
		my.FrameAnim += speed/20;		
		if (random(3) > 1)
		{
			play_entsound(me,m16_fire_sound,5000);
			Short_GunFlash(me,GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
		}
				
		wait(1);
	}
	
	//@ escape to house.
	ent_path("SwatEscapePath");
	ent_waypoint(my._target_x,2);
	my.pan = ChangeThis___ReturnPan();	
	while (1)
	{	
		ChangeThis___MoveSwat(speed/25);	
		vec_set( point_move.x, my._target_x);
		if (EDistance(point_move,me)< 50)
		{
			break;
		}				
		wait(1);
	}
}

/* ---------------------------------------------------------------------------------------------------- */

function SwatEscape2House()
{	
	wait(random(5));	
	my.FrameAnim = random(5);
	while (my.FrameAnim < 100)
	{
		ent_frame("Lhit" ,my.FrameAnim );
		my.FrameAnim  += speed/35;
		wait(1);
	}
	ent_frame("2shot" ,100 );		
	wait(15 + random(10));

	//@ solders cover the sawt.
	if (my.skill1 == 11) || (my.skill1 == 12)
	{
		GoCoverSwat();
		return;
	}
	
	ent_path("SwatEscapePath");
	ent_waypoint(my._target_x , 1);
	while (1)
	{				
		my.pan = ChangeThis___ReturnPan();	
		ChangeThis___MoveSwat(speed/25);
		
		vec_set( point_move.x, my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{							
			ent_nextpoint(my._target_x);
			if (my.flag1)
			{
				break;
			}
			my.flag1 = 1;			
		}				
		wait(1);
	}
}

/* ---------------------------------------------------------------------------------------------------- */

sound BelalInPain1 , <com1pain01.wav>;
sound JawadInPain1 , <com2pain01.wav>;
sound JawadInPain2 , <com2pain02.wav>;
sound SabahInPain1 , <com3pain01.wav>;
sound EmadInPain1  , <com4pain01.wav>;
sound HaniInPain1  , <comp5pain01.wav>;
sound HaniInPain2  , <comp5pain02.wav>;
sound LuaiInPain1  , <comp6pain02.wav>;
sound LuaiInPain2  , <comp6pain03.wav>;

define __WoandedSound = 800;
function InPainComSound()
{	
//	if (my.skill21 == 1) // belal
//	{				
//		while (1)
//		{
//			if (snd_playing(my.skill22) == 0)
//			{
//				play_entsound(my,BelalInPain1,__WoandedSound);
//				my.skill22 = result; 
//			}
//			
//			if (camra2player == 0)
//			{
//				break;
//			}
//			wait(1);
//		}								
//	}
	
	if (my.skill21 == 2) // jawad
	{		
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{
				if (int(random(2)) == 1)
				{
					play_entsound(my,JawadInPain1,__WoandedSound);
				}
				else
				{
					play_entsound(my,JawadInPain2,__WoandedSound);
				}
				
				my.skill22 = result;
			}
			
			wait(1);
		}																	
	}
	
//	if (my.skill21 == 3)// sabah
//	{
//		
//		while (1)
//		{
//			if (snd_playing(my.skill22) == 0)
//			{
//				play_entsound(my,SabahInPain1,__WoandedSound);
//				my.skill22 = result;
//			}
//			if (camra2player == 0)
//			{
//				break;
//			}
//			wait(1);
//		}
//		
//	}	

//	if (my.skill21 == 4)// emad
//	{
//		
//		while (1)
//		{
//			if (snd_playing(my.skill22) == 0)
//			{
//				play_entsound(my,EmadInPain1,__WoandedSound);
//				my.skill22 = result;
//			}
//			
//			wait(1);
//		}
//		
//	}	
	
	if (my.skill21 == 5)// hani
	{		
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{					
				if (int(random(2)))
				{
					play_entsound(my,HaniInPain1,__WoandedSound);
				}
				else
				{
					play_entsound(my,HaniInPain2,__WoandedSound);
				}
				
				my.skill22 = result;
			}
			
			wait(1);
		}
	}	
	
	if (my.skill21 == 6)// luai
	{		
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{
				if (int(random(2)) == 1)
				{
					play_entsound(my,LuaiInPain1,__WoandedSound);
				}
				else
				{
					play_entsound(my,LuaiInPain2,__WoandedSound);
				}
				my.skill22 = result;
			}
			wait(1);
		}
	}	
}


define __AnimationStart = 60;

function SoldierInPain()
{
	my.skill22 = int(random(3));
	if (my.skill22 == 1)
	{
		my.skill21 =  2;
	}
	else
	{
		if (my.skill22 == 2)
		{
			my.skill21 = 5;
		}
		else
		{
			my.skill21 = 6;
		}
	}

	InPainComSound();

	my.FrameAnim = __AnimationStart;
	my.skill5 = 1; //@ speed
	my.skill6 = __AnimationStart; //@ range of frames ie: 30%
	while (1)
	{		
		ent_frame("leg",my.FrameAnim);
		my.FrameAnim += my.skill5;

		my.skill6 += my.skill5;
		if (my.skill6 > 100)
		{
			my.skill5 = -my.skill5;
		}

		if (my.skill6 < __AnimationStart)
		{
			my.skill5 = -my.skill5;
		}
		wait(1);
	}
}

function SwatDie()
{
	wait(random(5));
	morph <ckdie.mdl>,me;
	my.FrameAnim=0;
	while (my.FrameAnim<100)
	{
		ent_frame( LonelyAnimat [ my.AnimDie ] , my.FrameAnim);
		my.FrameAnim += 10*speed/200;
		wait(1);
	}

	sonar(my,10000);
	my.z = target.z +abs(my.min_z);
	//while (1)
//	/{
//		sonar(me,4000);
//		my.z -=  max(0.1,result);
//		if (result == 0)
//		{
//			break;
//		}
///		wait(1);
///	}
////
	if (my.skill1 == 1) || (my.skill1 == 5)
	{
		SoldierInPain();
	}
}

/* ---------------------------------------------------------------------------------------------------- */

function SwatMove()
{
	my.skill41 = __ChangeTime + random(__RandomChangeTime);

	while (BomState != __BomExplod)
	{
		ChangeThis___MoveSwat(speed/50);

		my.skill40 += 1;
		if ( my.skill40 > my.skill41)
		{
			my.skill40 = 0;
			my.skill41 = __ChangeTime + random(__RandomChangeTime);			
			if (my._SwatFrames != __SoldWalk)
			{
				if (int(random(2)) > 0)		{my._SwatFrames = __SwatLeft;}
				else
				{
					if (int(random(2)) > 0)	{my._SwatFrames = __SwatRight;}
					else			{my._SwatFrames = __SwatFront;}
				}
			}
		}
		wait(1);
	}		
	
	my._SwatFrames = __SoldRun;	
	if (my.skill1 == 1) || (my.skill1 == 2) || (my.skill1 == 3)|| (my.skill1 == 4)|| (my.skill1 == 5)|| (my.skill1 == 6)
	{		
		//@ you is the tree.
		you = pointer_to_entity(DinametObject.skill5);				
		FlyMeByExplode( my, you, 50);		
		SwatDie();
	}
	else
	{
		SwatEscape2House();		
	}	
}

/* ---------------------------------------------------------------------------------------------------- */

action SwatTeam
{
	//@ skill used :
	//@  1 ()            : the number of the soldier.
	//@  2 (_SwatFrames) : animation frames.
	//@  40 - 41         : counters.

	my.invisible = 1;
	my.passable = 1;
		
	while (SwatGoGoGo.y == 0)
	{
		wait(1);
	}
	
	my.shadow = 1;
	my._health = 0;	
	my.pan = 180;
	my.invisible = 0;
	SwatMove();
}



////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//		                          Cars Function                              
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

function ExplodedCar()
{
	CameraMoveExplo();	
	my.passable = 0;	
	my.skill6= 0;
	while (my.skill6 < 100)
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

/* ---------------------------------------------------------------------------------------------------- */
function MoveVec(VecType,VecSpeed,VecSmothAng)
{
	temp.x = my._target_x - my.x;
	temp.y = my._target_y - my.y;
	temp.z = my._target_z - my.z;
	vec_to_angle(my_angle,temp);		
	my.pan = nearangle(my.pan,my_angle.pan,VecSmothAng);		
	temp.x = VecSpeed;		
	temp.y = 0;
	sonar(me,5000);
	
	if (VecType == __Hummer){temp.z = -result + __WheelsHight;}
	else			{temp.z = -result;		  }
	
	move(me ,temp ,nullvector);
}



/* ---------------------------------------------------------------------------------------------------- */

function InishalCar(Type)
{	
	if (Type == __Hummer)
	{
		sonar(my,10000);
		my.z = target.z +abs(my.min_z) + __WheelsHight;	

		//@Create the wheels.
		vec_for_vertex(temp,me,3);
		create(<WheelHUm.MDL>,temp,HumveWheels);	
		my.skill40 = Entity_To_Pointer(you);	
		vec_for_vertex(temp,me,6);
		create(<WheelHUm.MDL>,temp,HumveWheels);
		my.skill41 = Entity_To_Pointer(you);
		vec_for_vertex(temp,me,9);
		create(<WheelHUm.MDL>,temp,HumveWheels);
		my.skill42 = Entity_To_Pointer(you);
		vec_for_vertex(temp,me,12);
		create(<WheelHUm.MDL>,temp,HumveWheels);
		my.skill43 = Entity_To_Pointer(you);	
		return;
	}

	if (Type == __Tank)
	{
		create(<Up_body.mdl>,my.pos,null);
		my._MyUpBody = entity_to_pointer(you);	
		you.pan = my.pan;
		you.skill5 = my.pan;
		create(<Bustone.mdl>,my.pos,null);
		my._MyBustone = entity_to_pointer(you);
		you.pan = my.pan;
		you.skill5 = my.pan;
		you.skill6 = 0.1;
		ent_path("RoodPath");
		ent_waypoint(my._target_x,2);
		return;
	}
}

/* ---------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------- */
define _MyCar , skill30;

define _Counter , skill17;
define _Counter2 , skill18;
define _MyCarPan , skill19;

define __HummerSoldierWait = 100;

//@ --> this function turn the soldire when the hammer
//@		turn on the corner 
function TurnMe()
{	
	my._Counter2 = 0;
	while (my._Counter2 < 30)
	{
		my.pan += 2;
		my._Counter2 += 1;
		wait(1);
	}
}

/* ---------------------------------------------------------------------------------------------------- */
define __HumSoldTurnSpeed = 2;
function HumveSoldierAction()
{
	while (BomState !=__BomExplod)
	{								
		ent_cycle("stnd" ,my.FrameAnim );
		my.FrameAnim += speed/200;

		you = pointer_to_entity(my._MyCar);
		temp.x = 0;
		temp.y = 0;
		temp.z = 45;
		vec_add(temp,you.pos);
		vec_set(my.pos,temp);

		if (my._MyCarPan != you.pan)
		{
			my.skill25 = you.pan;
			my.pan += ang(my.skill25 - my._MyCarPan) ;
			my._MyCarPan = you.pan;
		}
		
		my._Counter += 1;
		if (my._Counter > __HummerSoldierWait )
		{
			my._Counter =0;
			TurnMe();
		}
		wait(1);
	}
	
	wait(25);
	my.FrameAnim = 0;
	my.skill25 = __HumSoldTurnSpeed;	
	my.skill6 = 19;
	while (my.FrameAnim < 2000)
	{
		ent_cycle("3shot" ,my.FrameAnim );
		my.FrameAnim += speed/10;				
		Short_GunFlash(me,GunFlashFront[my.skill6],GunFlashBack[my.skill6]);
		if (random(3) > 1)
		{
			play_entsound(me,lmg_fire_sound,1000);
		}
		
		
		if (my.pan > 320)
		{
			my.skill25 = -__HumSoldTurnSpeed;
		}

		if (my.pan < 0)
		{
			my.skill25 = __HumSoldTurnSpeed;
		}
		
		my.pan += my.skill25;
						
		wait(1);
	}
}

/* ---------------------------------------------------------------------------------------------------- */

function HumveSoldier()
{
	my._MyCar = entity_to_pointer(you);
	my.pan = you.pan;
	my._MyCarPan = you.pan;
	
	my.passable = 1;
	my.shadow = 1;	
	my._type = _type_soldier;
	HumveSoldierAction();	
}

/* ---------------------------------------------------------------------------------------------------- */

function HumveWheels()
{	
	while (1)
	{
		if (my.flag1 == 0)
		{
			ent_cycle("Frame" ,my.FrameAnim );
			my.FrameAnim += speed/50;						
		}		
		wait(1);
	}
}

/* ---------------------------------------------------------------------------------------------------- */

function SetMyWheele(Cyou, Vert)
{
	you = Cyou;
	vec_for_vertex(temp,my,Vert);
	vec_set(you.pos,temp);
	you.pan = my.pan;		
	you.flag1 = my.flag6==1;
}

/* ---------------------------------------------------------------------------------------------------- */

function RemoveMyWheels()
{
	you = Pointer_To_Entity(my.skill40);
	remove(you);
	you = Pointer_To_Entity(my.skill41);
	remove(you);
	you = Pointer_To_Entity(my.skill42);
	remove(you);
	you = Pointer_To_Entity(my.skill43);
	remove(you);
}

/* ---------------------------------------------------------------------------------------------------- */
define _Soldier , skill20;
define __HummerSpeed = 45; 
sound HumveSound , <tankengine.wav>;
action Humve
{
	my.passable = 1;
	my.invisible = 1;
	while (SwatGoGoGo.z == 0)
	{
		wait(1);
	}
	
	my.invisible = 0;
	InishalCar(__Hummer);
	

	create(<cklmg.mdl>,my.pos,HumveSoldier);
	my._Soldier = entity_to_pointer(you);

	ent_path("RoodPath");
	ent_waypoint(my._target_x,1);
	
	while (BomState !=__BomExplod)
	{
		
		if (snd_playing(my.skill20) == 0)
		{
			play_entsound(me,HumveSound,1000);
			my.skill20 = result;
		}
		MoveVec(__Hummer,speed/50,speed/20);

		SetMyWheele( Pointer_To_Entity(my.skill40), 3);
		SetMyWheele( Pointer_To_Entity(my.skill41), 6);
		SetMyWheele( Pointer_To_Entity(my.skill42), 9);
		SetMyWheele( Pointer_To_Entity(my.skill43), 12);
		
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{					
			ent_nextpoint(my._target_x);
			my._PointNumber += 1;					
		}
												
		wait(1);
	}
	stop_sound(my.skill20);
	my.flag6 = 1;
	SetMyWheele( Pointer_To_Entity(my.skill40), 3);
	SetMyWheele( Pointer_To_Entity(my.skill41), 6);
	SetMyWheele( Pointer_To_Entity(my.skill42), 9);
	SetMyWheele( Pointer_To_Entity(my.skill43), 12);		
}

/* ---------------------------------------------------------------------------------------------------- */

action Tank
{
	my.invisible = 1;
	while (SwatGoGoGo.x == 0)
	{
	wait(1);
	}
	my.invisible = 0;
	DinametObject.skill6 = entity_to_pointer(me);
	Merkava();	
}


////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//		                     Salah functions 
//
////////////////////////////////////////////////////////////////////////////////////////////////////////


define _RbjBullet , skill32;
string SalahShotFrame = "2shot";

function DistroyTank()
{
	you = pointer_to_entity(DinametObject.skill6);
	temp.x = you.x - my.x;
	temp.y = you.y - my.y;
	temp.z = you.z - my.z;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;
	
	if (my.skill1 == 2)
	{
		str_cpy(SalahShotFrame,"1shot"); 
	}

	my.FrameAnim = 0;
	while (my.FrameAnim <100)
	{
		ent_frame( SalahShotFrame, my.FrameAnim);
		my.FrameAnim += speed/25;
		
		vec_for_vertex(temp,me, 20);
		you = pointer_to_entity(my._RbjBullet);
		vec_set(you.pos,temp);
		you.pan = my.pan;
		wait(1);
	}

	you = pointer_to_entity(my._RbjBullet);
	remove(you);
	
	vec_for_vertex(temp,me, 20);
	my.MyTilt = 51.7391;
	create ( <bullet_rbg.mdl>, temp, pazoka_bullet);
	play_entsound(me,rbj_fire_sound,50000);
}

/* --------------------------------------------------------------------------------------------------- */

//@ this function controls the movent of salah, and
//@       the fire his rbj rocket
function RunToTank()
{		
    	while (1)
    	{    		
		my.pan = ChangeThis___ReturnPan();
		ChangeThis___MoveSwat(speed/25);
				
		
		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			ent_nextpoint(my._target_x);
			if (my.flag1)
			{
				break;
			}
			my.flag1 = 1;
		}
		
		vec_for_vertex(temp,me, 20);
		you = pointer_to_entity(my._RbjBullet);
		vec_set(you.pos,temp);
		you.pan = my.pan;
		wait(1);
    	}
	
	DistroyTank();
}

/* ----------------------------------------------------------------------------------------------------- */

var SalahGoGo = 0;
action Salah
{
		my.invisible = 1;
	my.passable = 1;
	sonar(my,5000);
	my.z = target.z +abs(my.min_z);
			
	while (CameraNumber != 3)
	{
		wait(1);
	}
				
	my.skin = int(random(5));

	vec_for_vertex(temp,me, 20);	
	create(<RbjBull.mdl>,temp,null);
	my._RbjBullet = entity_to_pointer(you);
	you.pan = my.pan;
	you.scale_x = 2;
	you.scale_y = 2;
	you.scale_z = 2;
	

	my.invisible = 0; 	
	if (my.skill1 == 1)
	{
		ent_path("SalahPath");
	}
	else
	{
		ent_path("SalahPath2");
		wait(50);
	}
	
	ent_waypoint(my._target_x,1);
	my.skill2 = __SoldRun;
	RunToTank();
}
