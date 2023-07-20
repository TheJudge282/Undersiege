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
	layer=4;
}

entity splashscreen
{
	type = <Lev11ALoad.bmp>;
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
//sound StartSound  , <LT_11.wav>;
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
include <initiazationL11.wdl>;
include <equipments.wdl>;
include <SolderFx.wdl>;
include <SolderActS.wdl>;
//include <Solders.wdl>;
include <SolderLeader.wdl>;
//include <apatchi.wdl>;
//include <lev10scripte2.wdl>;
var video_mode = 7;
var video_depth = 16;

string level_str = <lev11ha.WMB>; // give file names in angular brackets

function main()
{
	str_cpy(levelpath,"PPoint3.pts");
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;
	//play_sound(StartSound,100);
	//StartSoundh=result;	
	fog_color=1;
	camera.fog=4;
	clip_range = 3000;	
	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
	LevelNumberId = 8;
	initilization();

	MyMain();
	
}

function SetViewBright(CMBr)
{
		camera.ambient = CMBr-100;
		blackface.alpha = abs(min(0, camera.ambient)/3);

}

function NewlevelOrloaded()
{
	stop_sound(p2dSound);
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}

function israil_soldier()
{return;}
function follow_freind()
{return;}
function palastain_patrol()
{return;}
function startlevel()
{
return;
}
function explosionenterance()
{
return;
}
function randombooming()
{
return;
}
function my_new_window()
{
	my.passable = 1;
	return;
}
function CountDownToEx()
{return;}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//						My Declerations
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var SoldierGoArry[6] = 0,0,0,0,0,0;

define _SensorNumber , skill1;
define _SensorPlayerDist , skill2;
define __SoldiersInHouse = 15; 
define __SoldiersInSchool = 16;
sound S_M_L11_02 , <M_L11_02.wav> ;
sound S_M_L11_20 , <M_L11_20.wav>;

string Mis1 , "PM_11a_01.tga";
string Mis2 , "PM_11a_02.tga";

function MyMain()
{
	totalbullets[1] = 60;
	totalbullets[0] = 30;
	totalbullets[8] = 3;
	totalbullets[11] = 2;

	object1.visible = 0;
	object2.visible = 0;
	object3.visible = 0;
	object4.visible = 0;

	MisionsMsg1.visible = 1;
	MisionsMsg2.visible = 1;
	MisionsMsg3.visible = 0;
	MisionsMsg4.visible = 0;
	MisionsMsg5.visible = 0;
	morph Mis1 , MisionsMsg1;
	morph Mis2 , MisionsMsg2;	
	
	MisionsMsg1.z -= 0.5;
	MisionsMsg2.z -= 0.6;
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
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//						Soldiers Functions
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

/* -------------------------------------------------------------------------------------------------------------- */

action ExplodMerkava()
{
	morph ( <marcava.mdl>, me);
	my.frameanim = 0;
	my.passable = 0;
	while (player == null)
	{
	wait(1);
	}
	while (1)
	{
		if (vec_dist(my.pos ,player.pos)< 200 )
		{
			HeartPlayerShowCompas(1);
		}
		
		temp.x = sin(my.frameanim*10)*explosionscale*2;
		temp.y = cos(my.frameanim*10)*explosionscale*2;
		temp.z = (10+random(10))*explosionscale;
		my_angle.x = (100-random(200))*explosionscale;
		my_angle.y = (100-random(200))*explosionscale;
		my_angle.z = (-random(24))*explosionscale;
		vec_add( my_angle, my.pos);
		effect( BlackMinismokeup, 1, my_angle, temp);	

		my.frameanim += 1;
		ent_frame( "explo", my.frameanim*4);
		wait(1);
	}
}

/* -------------------------------------------------------------------------------------------------------------- */

define _SoldierJop , skill7;
define __RegularSoldiers = 0;
define __HidingSoldiers = 1;

function InisialSold()
{
	my.passable = 1;
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

/* -------------------------------------------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------------------------------------------- */

define __BreakDist = 150;
function SpisalSoldAction()
{
	my.EnemyId = player.BodyLnk;
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
				my.LastState = Function_To_Pointer( "SpisalSoldAction");
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
				my.LastState = Function_To_Pointer( "SpisalSoldAction");
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

			if (vec_dist(my.pos ,player.pos ) < __BreakDist)
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

/* -------------------------------------------------------------------------------------------------------------- */

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

/* -------------------------------------------------------------------------------------------------------------- */

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

/* -------------------------------------------------------------------------------------------------------------- */

function SoldiersRunning()
{			
	wait(random(10));
	var iCounter = 0;

	my.skill7 = 50 + random (25) + random(25);
			
	while (1)
	{
		MoveTurnFallAnimAndTarget( 20, 0.5);
		
		if (vec_dist(my.pos ,player.pos ) < 300)
		{
			my.EnemyId = player.bodylnk;
			SolderShoting();
			return;
		}

		if (SoldCheckIfHealthy())
		{ 
			my.enemyid = player.bodylnk;
		        my.LastState = Function_To_Pointer("SolderShoting");
			return;
		}

		vec_set( point_move.x, my._target_x);
		if ( EDistance(point_move,me)< my.skill7) 
		{	
			if (my.flag8)
			{
				NexttargetOffset( 0, 50, 0);
			}
			else
			{
				NexttargetOffset( 0, -50, 0);
			}
			
			iCounter += 1;
			if (iCounter == 4)
			{
				my.EnemyId = player.bodylnk;
				SolderShoting();
				return;
			}
		}
		wait(1);
	}	
}

/* -------------------------------------------------------------------------------------------------------------- */

action HidingSoldier
{
	my.invisible = 1;
	my.passable = 1;
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);	

	InisialSold();
	while (SoldierGoArry[my._SoldierJop - 1] == 0)
	{
		wait(1);
	}
	my.invisible = 0;
	SpisalSoldAction();
}

/* -------------------------------------------------------------------------------------------------------------- */

define __HouseSoldierF1  = 1;
define __HouseSoldierF2  = 2;
define __StreetSoldierR  = 3;
define __StreetSoldierL  = 4;
define __SchoolSoldierF1 = 5;
define __SchoolSoldierF2 = 6;

action MySoldier
{		
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);	
			
	my.invisible = 1;
	my.passable = 1;
	my.shadow = 0;
	
	while (SoldierGoArry[my._SoldierJop - 1] == 0)
	{
		wait(1);
	}		

	InisialSold();			
	my.invisible = 0;

	if (my._SoldierJop == __HouseSoldierF1) || (my._SoldierJop == __HouseSoldierF2)
	{		
		if (my.flag8) {	lmgwait();    }
		else	      {	solderwait(); }		
	}

	if (my._SoldierJop == __StreetSoldierR)
	{		
		if (my.skill8 == 1)
		{
			ent_path("SolderPath1");
			if (my.flag8)
			{
				NexttargetOffset( 1, 50, 0);
			}
			else
			{
				NexttargetOffset( 1, -50, 0);
			}
			
		}
		if (my.skill8 == 3)		
		{
			ent_path("SolderPath3");
			if (my.flag8)
			{
				NexttargetOffset( 1, 50, 0);
			}
			else
			{
				NexttargetOffset( 1, -50, 0);
			}
		}		
		if (my.skill8 == 5)
		{
			ent_path("SolderPath5");
			if (my.flag8)
			{
				NexttargetOffset( 1, 50, 0);
			}
			else
			{
				NexttargetOffset( 1, -50, 0);
			}
		}		
		my.WeaponNumber = 3;
		SoldiersRunning();
		return;
	}

	if (my._SoldierJop == __StreetSoldierL)
	{				
		if (my.skill8 == 2)
		{
			ent_path("SolderPath2");
			if (my.flag8)
			{
				NexttargetOffset( 1, 50, 0);
			}
			else
			{
				NexttargetOffset( 1, -50, 0);
			}
			
		}
		if (my.skill8 == 4)
		{
			ent_path("SolderPath4");
			if (my.flag8)
			{
				NexttargetOffset( 1, 50, 0);
			}
			else
			{
				NexttargetOffset( 1, -50, 0);
			}
		}
		if (my.skill8 == 6)
		{
			ent_path("SolderPath6");
			if (my.flag8)
			{
				NexttargetOffset( 1, 50, 0);
			}
			else
			{
				NexttargetOffset( 1, -50, 0);
			}
		}
		my.WeaponNumber = 3;
		SoldiersRunning();
		return;
	}

	if (my._SoldierJop == __SchoolSoldierF1) || (my._SoldierJop == __SchoolSoldierF2)
	{
		if (my.flag8) {	lmgwait();    }
		else	      { solderwait(); }		
	}	
}

/* -------------------------------------------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------------------------------------------- */

action SoldierSensor
{
	my.invisible = 1;
	my.passable = 1;
	
	while (player == null)
	{
		wait(1);
	}
	
	while (1)
	{
		if (vec_dist(player.pos ,my.pos ) < 200)
		{
			while (vec_dist(player.pos ,my.pos ) < 200)
			{
				trace_mode = ignore_me + ignore_passable + ignore_sprites;
				trace(my.pos ,player.pos );
				if (you)
				{
					if (you._type == _type_player)
					{
						SoldierGoArry[my._SensorNumber - 1] = 1;
					}
				}
				wait(1);
			}
		}
		wait(1);
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//						Player Functions
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}

/* -------------------------------------------------------------------------------------------------------------- */

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

/* -------------------------------------------------------------------------------------------------------------- */

function MissionOK()
{
	my.event = null;							
	wait(1);

	hideAllGui();				

	play_loop(VictoryPlayer, 100);
	h_VictoryPlayer  = result ;
	MovieOrSucess = 1;
	VictoryScream();
	RemoveAllKeys();
	on_enter = finalization;
	PreesNextLvl.visible = 1;
	wait(10);
	Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));
}

/* -------------------------------------------------------------------------------------------------------------- */

action PositionMark
{
	my.invisible = 1;
	my.passable = 1;

	if (my.skill1 == 1)
	{
		MisionsMsg2.skill1 = entity_to_pointer(me);
	}
	else
	{
		MisionsMsg2.skill2 = entity_to_pointer(me);
	}
}

/* -------------------------------------------------------------------------------------------------------------- */

action PlayerScanHand
{
	my.passable = on;
	my.invisible = on;
	
	while (player == null)	{ wait(1); }
	ObjecPos1.visible = 0;
	ObjecPos1.invisible = 1;
	while (1)
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
		}
								
		if (DedSolders.x == 14) && (my.flag5 == 0)
		{			
			my.flag5 = 1;
			SoldierGoArry[2] = 1;
			SoldierGoArry[3] = 1;
			MisionsMsg1.ambient = -100;
			showmessage(1,205);
			play_sound(S_M_L11_02,100);
			p2dSound = result;
		}

		if (DedSolders.y == 16) && (my.flag6 == 0)
		{
			my.flag6 = 1;
			SoldierGoArry[2] = 1;
			SoldierGoArry[3] = 1;
			MisionsMsg2.ambient = -100;
			showmessage(1,205);
			play_sound(S_M_L11_02,100);
			p2dSound = result;
		}

		if (MisionsMsg1.ambient == -100) && (MisionsMsg2.ambient == -100)
		{
			while (snd_playing(p2dSound))
			{
			wait(1);
			}
			showmessage(1,206);
			play_sound(S_M_L11_20,100);
			p2dSound = result;
			while (snd_playing(p2dSound))
			{
			wait(1);
			}
			MissionOK();
			return;
		}
		
		//@ Compas Code
		
		if (MisionsMsg1.ambient != -100) || (MisionsMsg2.ambient != -100) 
		{
			if (MisionsMsg1.ambient != -100)
			{
				you = pointer_to_entity(MisionsMsg2.skill1);
			}
			else
			{
				you = pointer_to_entity(MisionsMsg2.skill2);
			}
				
			ObjecPos.frame = 1;				
			temp.x = you.x - player.x;
			temp.y = you.y - player.y;
			temp.z = you.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos.roll = player.pan - temp.pan;
		}
		else
		{
			ObjecPos.invisible = 1;
			ObjecPos.frame = 0;			
			ObjecPos.roll = 0;
		}
					
		wait(1);
	}
}
/* -------------------------------------------------------------------------------------------------------------- */

action Tree
{
	my.ambient = -100;
}