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
	type = <Lev72Load.bmp>;
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
string level_str = <lev7h2.WMB>; // give file names in angular brackets
string levelpath = "lev72.pts";

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
include <initiazation2.wdl>;
include <equipments.wdl>;
include <SolderFx.wdl>;
include <SolderActS.wdl>;
//include <Solders.wdl>;
include <SolderLeader.wdl>;

var video_mode = 7;
var video_depth = 16;



function main()
{
	str_cpy(levelpath,"lev72.pts");
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;

	//play_sound(SSound1,100);
	//StartSoundH = result;

	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
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
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(S2dPlaying);
	stop_sound(S3DPlaying);
}

function door()
{	
	my._type = _type_elevator;
	return;	
}
/*
function my_new_door()
{
	remove(me);
	return;
	//gate();
}
*/
function start_level()
{		
	return;
}
function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}

action ElevatorDoor
{
my._type = _type_elevator;
}

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

sound FireBill , <FireAlarm.wav>;

function MyMain()
{
	fog_color = 1;
	camera.fog = 50;
	
	totalbullets[13] = 66;
	totalbullets[4] = 15;
	morph <PM_07_05.tga>,MisionsMsg1;
	morph <PM_07_06.tga>,MisionsMsg2;
	morph <PM_07_07.tga>,MisionsMsg3;
		
	MisionsMsg1.z = 0.4;
	MisionsMsg2.z = -0.1;
	MisionsMsg3.z = -0.7;
	MisionsMsg1.visible = 1;
	MisionsMsg2.visible = 0;
	MisionsMsg3.visible = 0;
	MisionsMsg4.visible = 0;
	MisionsMsg5.visible = 0;
	MisionsMsg6.visible = 0;
		
	wait(50);
	if (level.y == 3)
	{	
		MovieOrSucess = 1;
	}
	
	while (LetTheGameBegin == 0) { wait(1);	}
	play_sound(FireBill,60);
	MisionsMsg1.skill1 = result;
	while (hPlayerWins == 0)
	{
		if (snd_playing(MisionsMsg1.skill1) == 0)
		{
			wait(200);
			play_sound(FireBill,30);
			MisionsMsg1.skill1 = result;

		}
	wait(1);
	}
}


action SmokeDamage
{
	my.invisible = 1;
	my.passable = 1;

	if (my.skill1 == 1) { my.skill2 = 200; }
	else		    { my.skill2 = 400; }

	while ( player == null ) { wait(1); }
	
	while (1)
	{
		
		if (vec_dist(my.pos , player.pos) < my.skill2) && (player.z > 130)
		{DamageBySomke = 1;
			HeartPlayerShowCompas(0.5);
			
		}
		else
		{
			DamageBySomke = 0;
		}

		wait(1);
	}
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                         
//		                          my decleration                                   
//                                                                        
///////////////////////////////////////////////////////////////////////////////////////////////////////

var SoldierInGroup;

sound S_M_L7_28  ,  <M_L7_28.wav>;

var DoorState = 0;
define __DoorLocked = 0;
define __DoorOpen = 1;


///////////////////////////////////////////////////////////////////////////////////////////////////////
//
//					  doors functios  
//
///////////////////////////////////////////////////////////////////////////////////////////////////////


sound ClosedDoor , <DOORCLOSE.wav>;
sound CloseddoorMessage , <M_L8_05.wav>;

function ClosedDoorsEvent()
{
	if (event_type == event_scan) && (indicator == _handle)
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


sound DoorSwitchSound , <switch_sound01.wav>;
define _DoorSide , skill1;
define __LeftDoor  = 1;
define __RightDoor = 2;

define _Timer , skill25;
define __DoorTime    = 300;
define __DoorDist    = 150;
define __SwitchSpeed = 20;

define _Case , skill30;

function DoorSwitchEvent()
{
	if (event_type == event_scan ) && (indicator == _handle)
	{
		my.event = null;		
		my._Case = (-1 )* my._Case;
		
		trace_mode = ignore_me +  ignore_passable + ignore_sprites;
		trace(my.pos,player.pos);
		if (you != null)
		{
			if (you._type == _type_player)
			{
				if (my._case == 1)
				{			
					exclusive_entity;

					showmessage(1,207);
					play_entsound(me,DoorSwitchSound,500);
					DoorState = __DoorOpen;	
					while (my.FrameAnim < 100)
					{
						ent_frame("bell" ,my.FrameAnim );
						my.FrameAnim += __SwitchSpeed;
						wait(1);
					}
					my.skin = 1;
					my.red = 50;
					my.green = 20;
					my.blue = 25;

					MisionsMsg1.ambient = -100;
					MisionsMsg2.visible = 1;
					MisionsMsg2.visible = 1;
					myShowmessions();

					wait(2);
					
					return;
					
				}
				else
				{
					DoorState = __DoorLocked;
					while (my.FrameAnim > 0)
					{
						ent_frame("bell" ,my.FrameAnim );
						my.FrameAnim -= __SwitchSpeed;
						wait(1);
					}
					my.skin = 2;
					my.red = 0;
					my.green = 0;
					my.blue = 0;
				}
			}
		}
		my.event = DoorSwitchEvent;
	}
}

/* ----------------------------------------------------------------------------------------------------- */
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

action DoorSwitch
{
	//@ skill 30 (_Case) : hold the case of the switch;	
	my._Case = -1;
	my.skin = 2;		
	my.enable_scan = on;
	my.event = DoorSwitchEvent;
	
	while (player == null) { wait(1); }
	
	my.lightrange = 2;
	my._timer = __doortime;
	while (1)
	{						

		GlowRed(5,150,20);
		if (DoorState == __DoorLocked)
		{
			if (vec_dist(my.pos ,player.pos) < __DoorDist )
			{
				my._Timer += 1;
				if (my._Timer > __DoorTime)
				{
					my._Timer = 0;
					trace_mode = ignore_me +  ignore_passable + ignore_sprites;
					trace(my.pos ,player.pos );
					if (you)
					{
						if (you._type == _type_player)
						{
							showmessage(1,198);
						}
					}
				}
			}
			else
			{
				my._timer = __doortime;
			}
		}
		wait(1);
	}
}

/* ----------------------------------------------------------------------------------------------------- */

action MyDoor
{	
	
	DoorState = __DoorLocked; 
	//DoorState = __DoorOpen; 
	my._timer =0;
	my._type = _type_elevator;			
	while (player == null) { wait(1);}
	
	while (1)
	{
		//@ responsible of displying the door message.
		if (DoorState == __DoorLocked)
		{
			if (vec_dist(my.pos ,player.pos) < __DoorDist )
			{
				my._Timer += 1;
				if (my._Timer > __DoorTime)
				{
					my._Timer = 0;
					showmessage(1,197);
				}			
			}
			else
			{
				my._timer = __doortime;
			}
		}
				
		//@ responsible of opening and closeing the door
		if (DoorState == __DoorOpen)
		{					
			if (my._DoorSide == __LeftDoor)  { my.pan = 85;	 }			
			if (my._DoorSide == __RightDoor) { my.pan = -85; }			
			return;
		}
		else 
		{			
			my.pan = 0;
		}		
		wait(1);
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
//
//					  soldiers functios  
//
///////////////////////////////////////////////////////////////////////////////////////////////////////

function InisialSold()
{	
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
	//my.AnimShot = IUpSnipFire;
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
	my.flag1 = 0;
}

/* ----------------------------------------------------------------------------------------------------- */

define __BreakDist = 250;
function SpisalSoldAction()
{
	//@ start your action when you see the player.
	while (1)
	{
		temp.x = 0;
		temp.y = 0;
		temp.z = 20;
		vec_add(temp,my.pos);
		trace_mode = ignore_me + ignore_passable + ignore_sprites ;
		trace(temp ,player.pos );
		if (you)
		{
			if (you._type == _type_player)
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

		//@ can i see the player, if not i'll wait, orelse i'll kill him.
		while (1)
		{
			temp.x = 0;
			temp.y = 0;
			temp.z = 20;
			vec_add(temp,my.pos);
			trace_mode = ignore_me + ignore_passable + ignore_sprites ;
			trace(temp ,player.pos );
			if (you)
			{
				if (you._type ==_type_player)
				{
					break;
				}
			}

			if (vec_dist(my.pos ,player.pos ) < 200)
			{
				//my.unlit = 1;
				my.EnemyId = player.bodylnk;
				SolderShoting();
				return;
			}
			wait(1);
		}
		
		wait(1);
	}
}

/* ----------------------------------------------------------------------------------------------------- */

action SpisalSold
{
	InisialSold();					
	while (player == null)
	{
		wait(1);
	}

	my.EnemyId = player.BodyLnk;
	SpisalSoldAction();
	my.WeaponNumber = my.skill8;	
}

/* ----------------------------------------------------------------------------------------------------- */

define _MyPos , skill1;
define _CreationDist , skill2;

function MySolderMove()
{
	while (player == null) { wait(1); }

	my.skill7 = 0;
	while (1)
	{
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim += speed/25;

		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle.pan,6*(speed/200));
		temp.x = speed/25;
		temp.y = 0;
		sonar(me,5000);
		temp.z = -result;
		move(me ,temp ,nullvector);

		vec_set(point_move.x,my._target_x);		
		if ( EDistance(point_move,me) < 50) 
		{
			//@ code to determan when to stop walking
			ent_nextpoint(my._target_x);
			my.skill7 += 1;
			
			if (my.skill7 == my.skill8)
			{
				break;
			}						
		}
		
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "MySolderMove");
			return;
		}
		
		if (vec_dist(my.pos ,player.pos ) < 500)
		{
			break;
		}
		wait(1);
	}
	
	temp.x = player.x - my.x;
	temp.y = player.y - my.y;
	temp.z = player.z - my.z;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;

	my.skill7 = 0;
	my.skill30 = 0;
	my.skill8 = 3;
	
	my.EnemyId = player.bodylnk;
	SolderShoting();
}

/* ----------------------------------------------------------------------------------------------------- */

//@ this fnction Giv every sodler a path and a start point.
function MySoldiers()
{
	wait(2);
	InisialSold();
	//my.WeaponNumber = 3;
	
	if (my.skill7 == 1)
	{		
		if (my.skill30 == 1) 	{ent_path("SoldPath5L") ;}
		else			{ent_path("SoldPath5R") ;}				
		ent_waypoint(my._target_x , 1);
		MySolderMove();		
		return;
	}

	if (my.skill7 == 2)
	{
		if (my.skill30 == 1) 	{ent_path("SoldPath1L") ;}
		else			{ent_path("SoldPath1R") ;}				
		ent_waypoint(my._target_x , 1);
		MySolderMove();			
		return;
	}

	if (my.skill7 == 3)
	{
		if (my.skill30 == 1) 	{ent_path("SoldPath4R") ;}
		else			{ent_path("SoldPath4L") ;}				
		ent_waypoint(my._target_x , 1);
		MySolderMove();			
		return;
	}

	if (my.skill7 == 4)
	{
		if (my.skill30 == 1) 	{ent_path("SoldPath3L") ;}
		else			{ent_path("SoldPath3R") ;}
		ent_waypoint(my._target_x , 1);
		MySolderMove();
		return;
	}

	if (my.skill7 == 5)
	{
		if (my.skill30 == 1) 	{ent_path("CaragPath1R") ;}
		else			{ent_path("CaragPath1L") ;}				
		ent_waypoint(my._target_x , 1);
		MySolderMove();			
		return;
	}

	if (my.skill7 == 6)
	{
		if (my.skill30 == 1) 	{ent_path("CaragPath2L") ;}
		else			{ent_path("CaragPath2R") ;}				
		ent_waypoint(my._target_x , 2);
		MySolderMove();			
		return;
	}
	
	if (my.skill7 == 7)
	{
		if (my.skill30 == 1) 	{ent_path("CaragPath2R") ;}
		else			{ent_path("CaragPath2L") ;}				
		ent_waypoint(my._target_x , 1);
		MySolderMove();			
		return;
	}

	if (my.skill7 == 8)
	{
		if (my.skill30 == 1) 	{ent_path("SoldPath8R") ;}
		else			{ent_path("SoldPath8L") ;}				
		ent_waypoint(my._target_x , 1);
		MySolderMove();			
		return;
	}
}

/* ----------------------------------------------------------------------------------------------------- */

function CreateSoldier(PosNum)
{
	if (PosNum == 1)
	{
		create(<psbom.mdl>,my.pos,MySoldiers);		
		you.skill7 =PosNum;		
		you.skill30 = 1;
		you.skill8 = 5;		
		you.WeaponNumber = 5;
		you.skill6 = 7;
		you.pan = my.pan;

		wait(3 + random(5));
		
		create(<psgal.mdl>,my.pos,MySoldiers);
		you.skill7 =PosNum;
		you.skill30 = 2;
		you.skill8 = 5;
		you.WeaponNumber = 13;
		you.skill6 = 6;
		you.pan = my.pan;
				
		wait(3 + random(5));
		
		create(<pcuzi.mdl>,my.pos,MySoldiers);
		you.skill7 = PosNum;
		you.skill30 = 3;
		you.skill8 = 3;
		you.WeaponNumber = 11;
		you.skill6 = 8;
		you.pan = my.pan;
		
		return;
	}
	
	if (PosNum == 2)
	{
		create(<psbom.mdl>,my.pos,MySoldiers);		
		you.skill7 =PosNum;
		you.skill30 = 1;
		you.skill8 = 3;
		you.WeaponNumber = 5;
		you.skill6 = 7;
		you.pan = my.pan;
		
		wait(1);

		create(<psgal.mdl>,my.pos,MySoldiers);
		you.skill7 = PosNum;
		you.skill30 = 2;
		you.skill8 = 3;
		you.WeaponNumber = 13;
		you.skill6 = 6;
		you.pan = my.pan;
		
		return;
	}

	if (PosNum == 3)
	{		
		create(<pcuzi.mdl>,my.pos,MySoldiers);		
		you.skill7 =PosNum;
		you.skill30 = 1;
		you.skill8 = 7;
		you.WeaponNumber = 11;
		you.skill6 = 8;
		you.pan = my.pan;

		wait(3 + random(5));
		
		create(<psgal.mdl>,my.pos,MySoldiers);
		you.skill7 = PosNum;
		you.skill30 = 2;
		you.skill8 = 7;
		you.WeaponNumber = 13;
		you.skill6 = 6;
		you.pan = my.pan;
				
		wait(3 + random(5));
		
		create(<psbom.mdl>,my.pos,MySoldiers);
		you.skill7 =PosNum;
		you.skill30 = 3;
		you.skill8 = 3;
		you.WeaponNumber = 5;
		you.skill6 = 7;
		you.pan = my.pan;
		
		return;
	}
	
	if (PosNum == 4)
	{
		create(<psgal.mdl>,my.pos,MySoldiers);		
		you.skill7 =PosNum;
		you.skill30 = 1;
		you.skill8 = 3;
		you.WeaponNumber = 13;
		you.skill6 = 6;
		you.pan = my.pan;

		wait(3 + random(5));
		
		create(<psbom.mdl>,my.pos,MySoldiers);
		you.skill7 = PosNum;
		you.skill30 = 2;
		you.skill8 = 2;
		you.WeaponNumber = 5;
		you.skill6 = 7;
		you.pan = my.pan;
				
		wait(3 + random(5));
		
		create(<pcuzi.mdl>,my.pos,MySoldiers);
		you.skill7 =PosNum;
		you.skill30 = 3;
		you.skill8 = 3;
		you.WeaponNumber = 11;
		you.skill6 = 8;
		you.pan = my.pan;
		
		return;
	}
	
	if (PosNum == 5)
	{
		create(<psgal.mdl>,my.pos,MySoldiers);		
		you.skill7 =PosNum;
		you.skill30 = 1;
		you.skill8 = 3;
		you.WeaponNumber = 13;
		you.skill6 = 3;
		you.pan = my.pan;

		wait(3 + random(5));
		
		create(<psbom.mdl>,my.pos,MySoldiers);
		you.skill7 = PosNum;
		you.skill30 = 2;
		you.skill8 = 2;
		you.WeaponNumber = 5;
		you.skill6 = 7;
		you.pan = my.pan;
				
		wait(3 + random(5));
		
		create(<pcuzi.mdl>,my.pos,MySoldiers);
		you.skill7 = PosNum;
		you.skill30 = 3;
		you.skill8 = 3;
		you.WeaponNumber = 11;
		you.skill6 = 8;
		you.pan = my.pan;
		
		return;
	}
	
	if (PosNum == 6)
	{
		create(<pcuzi.mdl>,my.pos,MySoldiers);		
		you.skill7 =PosNum;
		you.skill30 = 1;
		you.skill8 = 2;
		you.WeaponNumber = 11;
		you.skill6 = 8;
		you.pan = my.pan;

		wait(3 + random(5));
		
		create(<psgal.mdl>,my.pos,MySoldiers);
		you.skill7 = PosNum;
		you.skill30 = 2;
		you.skill8 = 2;
		you.WeaponNumber = 13;
		you.skill6 = 6;
		you.pan = my.pan;
								
		return;
	}

	if (PosNum == 7)
	{
		create(<vbuzi.mdl>,my.pos,MySoldiers);		
		you.skill7 =PosNum;
		you.skill30 = 1;
		you.skill8 = 3;
		you.WeaponNumber = 11;
		you.skill6 = 2;
		you.pan = my.pan;

		wait(3 + random(5));
		
		create(<vbuzi.mdl>,my.pos,MySoldiers);
		you.skill7 = PosNum;
		you.skill30 = 2;
		you.skill8 = 2;
		you.WeaponNumber = 11;
		you.skill6 = 6;
		you.pan = my.pan;
				
		wait(3 + random(5));
		
		create(<vbgal.mdl>,my.pos,MySoldiers);
		you.skill7 =PosNum;
		you.skill30 = 3;
		you.skill8 = 3;
		you.WeaponNumber = 13;
		you.skill6 = 3;
		you.pan = my.pan;
		
		return;
	}
	
	if (PosNum == 8)
	{
		create(<psbom.mdl>,my.pos,MySoldiers);		
		you.skill7 =PosNum;
		you.skill30 = 1;
		you.skill8 = 4;
		you.WeaponNumber = 5;
		you.skill6 = 7;
		you.pan = my.pan;

		wait(3 + random(5));
						
		create(<psgal.mdl>,my.pos,MySoldiers);
		you.skill7 =PosNum;
		you.skill30 = 3;
		you.skill8 = 4;
		you.WeaponNumber = 13;
		you.skill6 = 6;
		you.pan = my.pan;
		
		return;
	}
}

/* ----------------------------------------------------------------------------------------------------- */

var OkToCreate[9] = 0,0,0,0,0,0,0,0,0;
action SoldierPos
{
	//@ skill 1 (_pos) : the Number of the creator.		
	my.invisible = on;
	my.passable = on;

	while (1)
	{
		if (OkToCreate[my._MyPos - 1] ) && (my.flag3 == 0)
		{
			CreateSoldier(my._MyPos);
			my.flag3= 1;
		}

		//@ creates soldier when the player go back to the door
		if (DoorState == __DoorOpen) && (my.flag4 == 0)
		{
			my.flag4 = 1;
			if (my._MyPos == 3) 
			{
				CreateSoldier(my._MyPos);
			}
		}
		wait(1);
	}
}

/* ----------------------------------------------------------------------------------------------------- */

function SuprizeRun()
{
	while (my.skill7 > 0)
	{
		my.skill7 -= 1;
		
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim += speed/25;
		
		temp.x = speed/25;
		temp.y = 0;
		sonar(me,5000);
		temp.z = -result;
		move(me ,temp ,nullvector);
		
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "SuprizeSoldier");
			return;
		}
				
		wait(1);
	}
	my.EnemyId = player.bodylnk;
	SolderShoting();
}

/* ----------------------------------------------------------------------------------------------------- */

action SuprizeSoldier
{
	InisialSold();
	my.WeaponNumber = my.skill8;

	while (player == null)	{ wait(1); }

	while (1)
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

		if (vec_dist(my.pos ,player.pos ) < 700)
		{
			if (my.flag8)
			{
				if (player.z < 50)
				{					
					break;
				}
			}
			else
			{
				break;
			}
		}
		wait(1);
	}

	my.skill7 = 25;
	SuprizeRun();
}

/* ----------------------------------------------------------------------------------------------------- */
/* ----------------------------------------------------------------------------------------------------- */

//@  this function control the Items that Scan for the player pos, and active the right soldier
//   group.
action ScanForPlayer
{
	// skill 1 to exit
	// skill 2 to determen the position 

	my.passable = on;
	my.invisible =on;
	while (player == null)
	{
		wait(1);
	}	
		
	//@ Car And Car Group Control
	if (my._MyPos == 9)
	{
		while (1)
		{
			trace_mode = ignore_me + ignore_passable + ignore_sprites;
			trace(my.pos ,player.pos);
			if (you != null)
			{
				if (you._type == _type_player)
				{					
					OkToCreate[my._MyPos - 1] = 1;										
					return;
				}
			}
			wait(1);
		}
	}
			
	if (my._MyPos == 8)
	{
		while (DoorState == __DoorLocked)
		{
			wait(1);
		}
	}

	while (1)
	{
		my.skill25 = vec_dist(my.pos ,player.pos );
				
		if (my.skill25 < my._CreationDist) && (my.flag1 ==0)
		{			
			trace_mode = ignore_me + ignore_passable + ignore_sprites;
			trace(my.pos ,player.pos);
			if (you != null)
			{
				if (you._type == _type_player)
				{
					my.flag1 = 1;
					OkToCreate[my._MyPos - 1] = 1;
					if (my._MyPos == 5)
					{
						MisionsMsg2.ambient = -100;
						MisionsMsg3.visible = 1;
						myShowmessions();
						wait(25);
					}
				}
			}
		}
		wait(1);
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
//
//					Cars Funvtion
//
///////////////////////////////////////////////////////////////////////////////////////////////////////

string WheelCetr   , <WheelCetr.mdl>;
string WheelDodg   , <WheelDodg.mdl>;
string WheelGolf   , <WheelGolf.mdl>;
string Wheelnissan , <Wheelnissan.mdl>;
string WheelVan    , <WheelVan.mdl>;
string WheelHUm    , <WheelHUm.mdl>;

define _CarType , skill1;
define _PointNumber , skill25;

function hideAllGui()
{
	ObjecPos.visible = 0;	
	ObjecPos1.visible = 0;
	outcompass.visible = 0;
	EnemyPos.visible = 0;
	Compass.visible = 0;
	HldBk.visible = 0;
	HldSld.visible = 0;	
	VWeaponSprite1.visible = 0;
	looprun=0;
	CPointer.visible = 0;
	mesges.visible = 0;
	WeaponStore.visible = 0;
	DWeaponStore.visible = 0;
	WeaponPan.visible = 0;
	WeaponPan2.visible = 0;
}

/* ----------------------------------------------------------------------------------------------------- */

function CameraCarier()
{
	my.invisible = 1;
	my.passable = 1;
	camera.roll = 0;
	camera.tilt = 0;
		
	ent_path("CameraPath");
	ent_waypoint(my._target_x,1);
		
	temp.x = my._target_x;
	temp.y = my._target_y;
	temp.z = my._target_z;
	vec_set(my.pos,temp);

	ent_nextpoint(my._target_x);
	
	temp.x = my._target_x - my.x;
	temp.y = my._target_y - my.y;
	temp.z = my._target_z - my.z;
	vec_to_angle(my_angle,temp);
	my.pan = my_angle.pan;

	camera.pan -= 10;

	while (1)
	{										
		temp.x = speed/100;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector);
				
		if (camera.pan > -130)
		{
			camera.pan -= 0.25;
		}
		
		vec_set(camera.pos,my.pos);				
		wait(1);
	}

}

/* ----------------------------------------------------------------------------------------------------- */

function VectoryCamera()
{
	showmessage(1,151);
	play_sound(S_M_L7_25 , 100);
	S2dPlaying = result;
	wait(5);
	ZoomOut();
	hideAllGui();
	CloseSong(CurrentSong);	
	camra2player = 0;
	VictoryScream();
	MovieOrSucess = 1;
	RemoveAllKeys();
	hPlayerWins = 1;
	camera.tilt = 0;
	camera.roll = 0;
	camera.pan = 290;
	play_loop(VictoryPlayer, 100);
	h_VictoryPlayer  = result ;
	create(<rocket.mdl>,my.pos,cameraCarier);
}

/* ----------------------------------------------------------------------------------------------------- */

function RemoveWheel(cme)
{
	me = cme;
	remove me;
}

/* ----------------------------------------------------------------------------------------------------- */

function SetMyWheele(Cyou, Vert)
{		
	you = Cyou;
	vec_for_vertex(temp,my,Vert);
	vec_set(you.pos,temp);
	you.pan = my.pan;
	//you.flag1 = my.flag6==1;
}

/* ----------------------------------------------------------------------------------------------------- */

function CrtMyWheele(namf,Vert)
{
	ptempstr = namf;
	create(ptempstr,temp,null);
	SetMyWheele(you, Vert);
	return(entity_to_pointer(you));
}

/* ----------------------------------------------------------------------------------------------------- */

function OrdCarExplosion()
{	
	my.passable = 0; 
	//@ Create The Explosion			
	create( <dust.mdl>, my.pos,AtomicExplosion);
	CameraMoveExplo();
	
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 300;
	indicator = _explode;
	my.flag1 = 1;
	scan(my.pos ,my.pan ,temp );
	indicator = 0;

	//@ removing wheels.
	RemoveWheel(Pointer_To_Entity(my.skill30));
	RemoveWheel(Pointer_To_Entity(my.skill31));
	RemoveWheel(Pointer_To_Entity(my.skill32));
	RemoveWheel(Pointer_To_Entity(my.skill33));

	//@ morphing to the right exploded car
	if (my._CarType == 1)	{ morph(<exhummer.mdl> ,me) ;	goto step1; }
	if (my._CarType == 2)	{ morph(<excetroen.mdl>,me) ;	goto step1; }
	if (my._CarType == 3)	{ morph(<exdoge.mdl>   ,me) ;	goto step1; }
	if (my._CarType == 4)	{ morph(<exgolf.mdl>   ,me) ;	goto step1; }
	if (my._CarType == 5)	{ morph(<exnissan.mdl> ,me) ;	goto step1; }
	if (my._CarType == 7)	{ morph(<exvan.mdl>    ,me) ;		    }
	step1:
	
	//@ this is the player car
	if (my.flag2)
	{
		showmessage(1,208);
		wait(25);
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
	
	//@ Make Smoke
	my.skill1= 0;
	while (my.skill1<100)
	{
		temp.x = 0;
		temp.y = 0;
		temp.z = 0;
		my_angle.x = 50-random(100);
		my_angle.y = 50-random(100);
		my_angle.z = -random(25);
		vec_add( my_angle, my.pos);
		effect( Blacksmokeup, 1, my_angle, temp);	
		my.skill1+= 1;
		wait(1);
	}	
}

/* ----------------------------------------------------------------------------------------------------- */

function MoveWheels(Wheel)
{
	you = Wheel;
	vec_set(you.pos , my.pos);
	you.pan = my.pan;
}

/* ----------------------------------------------------------------------------------------------------- */

function RoatetWheels(Wheel)
{
	me = Wheel;
	while (my.flag6 == 0)
	{
		ent_cycle("Frame" ,my.skill1);
		my.skill1 += speed / 25;
		wait(1);
	}	
}

/* ----------------------------------------------------------------------------------------------------- */

function Feneto()
{
	on_enter = finalization;
	PreesNextLvl.visible = 1;
	wait(10);
	Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));
}
function MovePlayerCar()
{	
	ent_path("PlayCarPath");
	ent_waypoint(my._target_x,1);
	
	//@ Giv a function to the wheels.
	RoatetWheels(pointer_to_entity(my.skill30));
	RoatetWheels(pointer_to_entity(my.skill31));
	RoatetWheels(pointer_to_entity(my.skill32));
	RoatetWheels(pointer_to_entity(my.skill33));
	
	while (1)
	{
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle.pan,speed/50);

		temp.x = speed/10;
		temp.y = 0;
		sonar(me,5000);
		temp.z = -result + 12;
		move(me ,temp ,nullvector);
		
		vec_set(player.pos , my.pos);
		you =pointer_to_entity(player.BodyLnk);
		vec_set(you.pos , my.pos);

		//@ moves the wheels whith the car.
		SetMyWheele(pointer_to_entity(my.skill30) , 6);
		SetMyWheele(pointer_to_entity(my.skill31) , 3);
		SetMyWheele(pointer_to_entity(my.skill32) , 9);
		SetMyWheele(pointer_to_entity(my.skill33) , 12);

		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50)
		{
			ent_nextpoint(my._target_x);
			my._PointNumber += 1;
			if (my._pointnumber == 4)
			{
				Feneto();
			}
			if (my._pointnumber == 5)
			{
				my.tilt = 7;
			}
		}
		wait(1);
	}
}

/* ----------------------------------------------------------------------------------------------------- */

function CoverCarEvent()
{	
	//if (event_type == event_scan) && (indicator == _explode)
	//{				
	//	my._health-=1000;
	//	return;
	//}

	if (event_type == event_shoot) && (indicator == _gunfire)
	{ 						
		my._health -= 10;		
	}

	if (event_type == event_scan) && (indicator == _handle)
	{
		if (my.flag2)
		{
			my.event = null;
			exclusive_entity;					
			VectoryCamera();
			MovePlayerCar();
		}		
	}
}

/* ----------------------------------------------------------------------------------------------------- */

function RunForAWhile()
{	
	wait(1);
	
	if (my.flag1) {	ent_path("CaragPath3R"); }
	else	      {	ent_path("CaragPath3L"); }

	my.flag1 = 0;
	ent_waypoint(my._target_x,1);	
	wait(1);
	InisialSold();
	MySolderMove();	
}

sound humerenter , <nissan.wav>;
sound humberbreak,<skid03.wav>;
sound hummerloop, <hammer_loop.wav>;

function IntersaptingCar()
{
	ent_path("CarP");
	ent_waypoint(my._target_x,1);
	while (OkToCreate[8] == 0)
	{
		wait(1);
	}
	
	var soundres = 0;

	//@ Giv a function to the wheels.
	RoatetWheels(pointer_to_entity(my.skill30));
	RoatetWheels(pointer_to_entity(my.skill31));
	RoatetWheels(pointer_to_entity(my.skill32));
	RoatetWheels(pointer_to_entity(my.skill33));
	while (1)
	{
		if (snd_playing(soundres) == 0)
		{
			play_entsound(me,humerenter,50000);
			soundres= result; 
		}
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle.pan,speed/50);

		temp.x = speed/10;
		temp.y = 0;
		sonar(me,5000);
		temp.z = -result + 12;
		move(my ,temp ,nullvector);
		
		//if (my.skill40 >= 2)
		//{
		//	my.z = my.skill41;
		//} 
		//@ moves the wheels whith the car.
		SetMyWheele(pointer_to_entity(my.skill30) , 6);
		SetMyWheele(pointer_to_entity(my.skill31) , 3);
		SetMyWheele(pointer_to_entity(my.skill32) , 9);
		SetMyWheele(pointer_to_entity(my.skill33) , 12);

		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< 50) 
		{
			my.skill40 += 1;
			ent_nextpoint(my._target_x);
			
			if (my.skill40 == 2) 
			{
				//my.skill41 = my.z;
				
				my.tilt = 0; 
			}
			if (my.skill40 == 3) { break; }
		}								
		wait(1);
	}

	stop_sound(soundres);

	play_entsound(me,humberbreak,100000);
	soundres = result;
	while (my.pan > -60 )
	{
		temp.x = speed/10;
		temp.y = 0;
		sonar(me,5000);
		temp.z = -result + 12;
		move(my ,temp ,nullvector);
		//my.z = my.skill1;
		my.pan -= 10;

		//@ moves the wheels whith the car.
		SetMyWheele( pointer_to_entity(my.skill30) ,6 );
		SetMyWheele( pointer_to_entity(my.skill31) ,3 );
		SetMyWheele( pointer_to_entity(my.skill32) ,9 );
		SetMyWheele( pointer_to_entity(my.skill33) ,12);
		wait(1);
	}
	
	
	my.passable= 0;
	stop_sound(soundres);

	my.tilt -= 3;
	my.z -= 8;
	wait(2);
	my.tilt += 3;
	my.z += 8;
	you = pointer_to_entity(my.skill30);
	you.flag6 = 1;
	you = pointer_to_entity(my.skill31);
	you.flag6 = 1;
	you = pointer_to_entity(my.skill32);
	you.flag6 = 1;
	you = pointer_to_entity(my.skill33);
	you.flag6 = 1;
	
	ent_waypoint(my._target_x,3);
		
	create(<vbgal.mdl>,my._target_x,RunForAWhile);
	you.WeaponNumber = 13;
	you.skill6 = 3;
	you.pan = ang(my.pan - 180);
	you.skill8 = 4;
	
	wait(10);

	create(<vbgal.mdl>,my._target_x,RunForAWhile);
	you.WeaponNumber = 13;
	you.skill6 = 3;
	you.pan = ang(my.pan - 180);
	you.skill8 = 4;
	you.flag1 = 1;
	
	soundres = 0;
	while (my._health > 0)
	{
		if (snd_playing(soundres) == 0)
		{
			play_entsound(me,hummerloop,500);
			soundres = result;
		}		
		wait(1);
	}
	stop_sound(soundres);
}

/* ----------------------------------------------------------------------------------------------------- */

define __Hummer    = 1;
define __Ceterween = 2;
define __Dodg      = 3;
define __Golf      = 4;
define __Nissan    = 5;
define __Van       = 7;


action TempColl
{
	my.invisible = 1;
}

/* ----------------------------------------------------------------------------------------------------- */

action CarsAct
{	
	//@ skill 1 for car type : 1:  < Hummer.mdl >.
	//			   2:  < Cetroen.mdl >.
	//			   3:  < Doge.mdl >.
	//		           4:  < Golf.mdl >.
	//		           5:  < nissan.mdl >.
	//		           7:  < Van.mdl >.
	//@ skill 30,31,32,33 for wheels.
	//@       40  player cra timer
	
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	AddColl(me);	
	wait(10);
	my.epassable = 0;
	my.shadow = 1;
	my.passable = 1; 	
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = CoverCarEvent;
	my.OwnType = TypeOfEngines;
	my.CollFunction  = Function_To_Pointer("MallaCollision");
	my._health = 300;	
	my.max_x *= 2.2;	
	
	my.skin = int(random(4));

	if (my._CarType == __Hummer)//@ Hummer.mdl
	{		
		my.skill30 = CrtMyWheele( WheelHUm , 6);
		my.skill31 = CrtMyWheele( WheelHUm , 3);
		my.skill32 = CrtMyWheele( WheelHUm , 9);
		my.skill33 = CrtMyWheele( WheelHUm , 12);
		goto step1;
	}
	if (my._CarType == __Ceterween) //@ Cetroen.mdl
	{		
		my.skill30 = CrtMyWheele( WheelCetr , 256);
		my.skill31 = CrtMyWheele( WheelCetr , 254);
		my.skill32 = CrtMyWheele( WheelCetr , 255);
		my.skill33 = CrtMyWheele( WheelCetr , 253);
		goto step1;
	}
	
	if (my._CarType == __Dodg)//@ Doge.mdl
	{						
		my.skill30 = CrtMyWheele( WheelDodg , 1);
		my.skill31 = CrtMyWheele( WheelDodg , 2);
		my.skill32 = CrtMyWheele( WheelDodg , 3);
		my.skill33 = CrtMyWheele( WheelDodg , 4);
		goto step1;
	}
	
	if (my._CarType == __Golf)//@ Golf.mdl
	{		
		my.skill30 = CrtMyWheele( WheelGolf , 258);
		my.skill31 = CrtMyWheele( WheelGolf , 257);
		my.skill32 = CrtMyWheele( WheelGolf , 259);
		my.skill33 = CrtMyWheele( WheelGolf , 260);				
		goto step1;
	}
			
	if (my._CarType == __Van)//@ Van.mdl
	{						
		my.skill30 = CrtMyWheele( WheelVan , 180);
		my.skill31 = CrtMyWheele( WheelVan , 183);
		my.skill32 = CrtMyWheele( WheelVan , 189);
		my.skill33 = CrtMyWheele( WheelVan , 186);
		goto step1;
	}

	step1:
	
	//@ this the car that moves and drop soldiers.
	if (my.flag1)
	{
		IntersaptingCar();
	}

	while (player == null)
	{
	wait(1);
	}
	//@ wait for explosion.
	while (my._health > 0)
	{
		if (my.flag2)
		{
			if (vec_dist(my.pos ,player.pos) < 250) && (player.z < 50)
			{
				my.skill40 += 1;
				if (my.skill40 > 250)
				{
					my.skill40 = 0;
					showmessage(1,214);
				}
			}
			else
			{
			my.skill40 = 250;
			}
		}
		wait(1);
	}

	removecoll(my);
	OrdCarExplosion();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
//
//				Player Functions
//
///////////////////////////////////////////////////////////////////////////////////////////////////////

action Followplayer
{
	my.passable = on;
	my.invisible = on;
	while (player == null)
	{
		wait(1);
	}

	showmessage(2,154);
	play_sound(S_M_L7_28,100);
	S2dPlaying = result;
	myShowmessions();
	ObjecPos.frame = 2;
	while (1)
	{		
		vec_set(my.pos,player.pos);
		if(PressedKeys[Key_Use] == 1)
		{
			temp.pan = 360;
			temp.tilt =180;
			temp.z = 150;//1000;
			indicator = _handle;
			scan (my.x,my.pan,temp);
			indicator = 0;
		}
		wait(1);
	}
}

/* ----------------------------------------------------------------------------------------------------- */

action Smoky
{
	my.invisible = 1;
	if (my.skill20 == 1)
	{
		ent_path("smoke_path1");Smoky2(__BigSmoke);
	}
	else
	{
		ent_path("smoke_path2");
		Smoky2(__SmallSmoke);
	}		
}

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