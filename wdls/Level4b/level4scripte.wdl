function HideEveryThing()
{
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
	CloseSong(CurrentSong);
	camra2player = 0;
	
}

function CameraCarier()
{
	my.passable = 1;
	my.visible = 0;
	ent_path("CameraPath");
	ent_waypoint(my._target_x,1);
	my.z = my._target_z;
	while (1)
	{		
		temp.x= my._target_x - my.x;
		temp.y= my._target_y - my.y;
		temp.z= my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,1);
						
		temp.x = 0;
		temp.y = 0;
		temp.z = 50;
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

function VictoryCamera()
{
	ZoomOut();
	HideEveryThing();
	camra2player = 0;
	MovieOrSucess = 1;
	temp.x = player.x;
	temp.y = player.y;
	temp.z = player.z;

	create(<point1.mdl>,temp,CameraCarier);
	you.pan = 180;
	camera.pan = 180;
	camera.tilt = 0;
	VictoryScream();
	RemoveAllKeys();
	on_enter = finalization;
	PreesNextLvl.visible = 1;
	Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
}


function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}
function soll()
{
	my.invisible=1;
	my.passable=1;
	WaitSoldValue+=1;
	wait(WaitSoldValue);
	sonar me, 4000;
	my.skill6=18;
	my.z-=result;
	while (1)
	{
		if (Game_State[0] == 1)&&(my.skill8 == 1)
		{
			my.invisible=0;

			SoldColl();
			break;
		}
		if (Game_State[0] == 2)&&(my.skill8 == 2)
		{
			my.invisible=0;
			SoldColl();
			break;
		}
		if (Game_State[0] == 6)&&(my.skill8 == 3)
		{
			if (my.skill7 == 9)
			{
				LmgSolder();
				my.invisible=0;
				break;
			}
			SoldColl();
			my.invisible=0;
			break;
		}
		if (Game_State[0] == 7)&&(my.skill8 == 4)
		{
			if (my.skill7 == 9)
			{
				LmgSolder();
				my.invisible=0;
				break;
			}
			SoldColl();
			my.invisible=0;
			break;
		}
		wait(1);
	}
	my.skill8 = m16;
}

//river:
////////
action riverwater
{
	my.transparent = 1;
	my.alpha = 60;
	my.passable = 1;
	turb_speed = 0.4;
	while (1)
	{
		my.v += 0.5;
		wait(1);
	}
	
}

function ReverSound()
{
	while (1)
	{
		if ( snd_playing(my.SoundWR)==0)
		{ 
			play_entsound(me,WaterSound,500);
			my.SoundWR=result; 
		}

		wait(1);
	}
}


//level action:
///////////////

function lastSolder()
{
	while (1)
	{
		you = Pointer_To_Entity(my.enemyid);
		if (you == null)
		{break;
		}
		temp.x = you.x - player.x;
		temp.y = you.y - player.y;
		temp.z = you.z - player.z;
		vec_to_angle( temp, temp);
		ObjecPos.roll = player.pan - temp.pan;
		wait(1);
	}
}
function followevent()
{
	if (event_type == event_detect)&&(indicator == _handle)&&(you._type == _type_soldier)
	{
		//you.unlit = 1;
		my.enemyid = Entity_To_Pointer(you);
		indicator = 0;
		Game_State[1] = -1;
		lastSolder();
	}
}



//////////////////////////////////////////////////////////
//		for part one				//
//////////////////////////////////////////////////////////

function followplayer()
{
	wait(100);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event = followevent;
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	while (1)
	{
		if (eplhealth){	return;	}
		vec_set(my.pos,player.pos);
		if (SolderCounter==1)&&(Game_State[0] > 6)&&(my.skill23 == 0)
		{
			my.skill23 = 1;
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 10000;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
			wait(50);
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 10000;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
		}

		if(PressedKeys[Key_Use] == 1)
		{
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 100;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
			indicator = 0;
			//Game_State[0] = 3;
		}
		if (weapon_firing == 1)&&(Game_State[0] < 3)
		{
			me = 0;
			Game_State[0] = 100;
			ShowMessage(5,144);
			Play_My_Sounds(5,0);
			wait(50);
			VisMainMenu(1);
			MBackMenu.visible = 0;
			on_esc = 0;
			on_enter = LLoadLastSave;
			break;

		}
		if ((player.x < -4400)&&(player.y < 0)&&(Game_State[0] == 6))||((player.x < -4000)&&(player.y > 0)&&(Game_State[0] == 6))
		{
			
			Game_State[0] = 7;
			ShowMessage(5,135);
			Play_My_Sounds(15,0);
			wait(50);

		}
		if (player.x > -2100)&&(Game_State[0] == 2)
		{
			Game_State[0] = 3;
		}
		if ((my.y < -700)&&(my.x > -1920))||((my.y > -700)&&(my.x > -1450))
		{
			ShowMessage(5,142);
			Play_My_Sounds(3,0);
			wait(250);
		}
		if (Game_State[0] == 8)
		{
			Kick_Action = 0;
			MovieOrSucess = 1;
			play_loop VictoryPlayer, 100;
			//play_sound VictoryPlayer, 100;
			h_VictoryPlayer = result;
			RemoveAllKeys();
			on_enter = finalization;
			PreesNextLvl.visible = 1;
			Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
			break;
		}
		wait(1);
	}
}

function boom_event1()
{
	if (event_type == event_detect)&&(indicator == _handle)&&(Game_State[0] < 4)&&(you._type == _type_player)
	{
		if (my.skill33 == 0)
		{
			my.skill33 =1;
			ShowMessage(5,152);
			wait(100);
			my.skill33 =0;
		}
	}
	if ((event_type==event_scan)&&(indicator == _handle)&&(Game_State[0] == 3) )
	{
		Game_State[0] = 4;
		object1.visible = 0;
		my.skin=2;
		ShowMessage(5,134);
		Play_My_Sounds(6,0);
		MisionsMsg2.ambient = -100;
		MisionsMsg3.visible=1;
		my.overlay=0;
		my.bright=0;
		wait(100);
		ShowMessionsAuto();
		wait(100);
		//remove(me);
		return;		
	}
	if ((event_type==event_scan)&&(indicator == _handle)&&(Game_State[0] < 2) )
	{
		ShowMessage(5,12);
		Play_My_Sounds(9,0);
		return;
	}

}

function Eventboomr()
{
	if(event_type == event_push && you._type != _type_player) { return; }
	
	my.event=0;
	object1.visible = 1;
	object1.skin = 3;
	ShowMessage(5,76);
	Play_My_Sounds(13,0);
	Game_State[0] = 2;
	my.invisible=1;
	MisionsMsg1.ambient = -100;
	MisionsMsg2.visible=1;
	wait(50);
	ShowMessionsAuto();
	wait(100);
	remove(me);
}

action box_boom1
{
	while (player==0)
	{
		wait(1);
	}
	sonar me,4000;
	my.z -= result;
	wait(1);
	my.push = -1;
	my.enable_push = on;
	my.event = Eventboomr;
	while (1)
	{
		if (eplhealth){	return;	}
		if (Game_State[0] < 2)
		{
			if EDistance(player,my)<100
			{
				ObjecPos.y = 5.2;
				ObjecPos.z =  -4;
				ObjecPos.roll = 0;
			}
			else
			{
				ObjecPos.y = 5;
				ObjecPos.z = -3.5;
				temp.x = my.x - player.x;
				temp.y = my.y - player.y;
				temp.z = my.z - player.z;
				vec_to_angle( temp, temp);
				ObjecPos.roll = player.pan - temp.pan;
			}
		}

		my.skill7 += my.skill6;
		if (my.skill7 >= 1)
		{
			my.scale_x=2.5;
			my.scale_y=2.5;
			my.scale_z=2.5;
			my.skill6 = -0.1;
		} else
		{
		  if (my.skill7 <= 0)
		   {
			my.scale_x=2;
			my.scale_y=2;
			my.scale_z=2;
			my.skill6 = 0.1;
		   }
		}
		wait(1);
	}
}

function objectpos1()
{
	wait(20);
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] > 4)
		{
			temp.x = my.x - player.x;
			temp.y = my.y - player.y;
			temp.z = my.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos.roll = player.pan - temp.pan;
		}
		wait(1);
	}

}

action arrow1
{
	my.scale_x=0.1;
	my.scale_y=0.1;
	my.scale_z=0.1;
	while (1)
	{
		my.pan += 10*(speed/200);
		wait(1);
	}
}


action room_boom	//for part one
{
	wait(100);
	my.skill6 = 0.1;
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=boom_event1;
	my.skin = 4;
	while (1)
	{
		if (eplhealth){	return;	}
		if (Game_State[0] < 4)
		{
			if (Game_State[0] > 1)
			{
				ObjecPos.y = 5;
				ObjecPos.z = -3.5;
				temp.x = my.x - player.x;
				temp.y = my.y - player.y;
				temp.z = my.z - player.z;
				vec_to_angle( temp, temp);
				ObjecPos.roll = player.pan - temp.pan;
			}

			temp.pan = 360;
			temp.tilt =360;
			temp.z = 200;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
			indicator = 0;
		}
		my.skill7 += my.skill6;
		if (my.skill7 >= 1)
		{
			my.scale_x=2.5;
			my.scale_y=2.5;
			my.scale_z=2.5;
			my.skill6 = -0.1;
		} else
		{
		  if (my.skill7 <= 0)
		   {
			my.scale_x=2;
			my.scale_y=2;
			my.scale_z=2;
			my.skill6 = 0.1;
		   }
		}
		wait(1);
	}

}

var car_num=0;
action car_patrol	//for part one
{
	wait(50);
	my.skin=1;
	my._type = 100;	
	my.flag5=0;
	my.skill13=0;
	my._find_point_flag=-1;
	car_num.y+=1;
	my.skill48=car_num.y;
	car_move();

}

function car_ev()	//for part one 
{	
	if event_type == event_detect && (you._type == _type_player && my._type==100) && indicator == _watch
	{
		my.entity2 = you;
		if(check_vihcle(2500)==1) 
		{
			my._signal = _detecte_enemy;
		}
		return;
	}

}
function car_move()	//for part one 
{
	my._health = 100; 
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event = car_ev;
	ent_path("path_000");
	ent_waypoint(my._target_x,1);
	car_path();
}
var car_speed = 10;



function rbjpikup()	//for part one 
{
	my.invisible = 1;
	my.skin=1;
	my.skill1 = 12;
	my.skill2 = 0;
	while (1)
	{
		if (game_state[0] == 6 )
		{
			PickUpAmmo();
			break;
		}
		wait(1);
	}
	
}

function collpoint()	//for part one 
{
	my.invisible = 1;
}

function makeCollision(Cmy)	//for part one 
{
	me = Cmy;
	var pointnum = 432;
	while (1)
	{
		vec_for_vertex( temp, my, pointnum);
		create( <point1.MDL>, temp , collpoint);
		pointnum+=1;
		if (pointnum == 443)
		{break;
		}
	}
}

action car_path1	//for part one 
{	
	if (game_state[0] <3)
	{
		if (ent_nextpoint(my._target_x) < 5)
		{car_speed = 8;
		}
		else
		{car_speed = 10;
		}
		car_path();
		return;
	}
	else
	{
		if (game_state[0] <5)
		{
			if (ent_nextpoint(my._target_x) < 5)
			{car_speed = 10;
			}
			else
			{car_speed = 15;
			}
			car_path();
			return;
		}
		else
		{
			car_speed = 12;
			if (ent_nextpoint(my._target_x) == 5)
			{
				//wait(100);
				game_state[0] = 6;
				wait(100);
				my.passable=0;
				makeCollision(me);
				return;
			}
			else
			{
				car_path();
				return;
			}
		}
	}
}



var BennDetectedFirst = 0;
function car_path()	//for part one 
{	
	var time_stop=0;
	exclusive_entity;
	while(1)
	{
		if (eplhealth){	return;	}
		if (game_state[1] == 1)
		{
			my._signal=0;
			car_stop();
			return;
		}
		if (game_state[0] < 5)
		{
			temp.pan = 180;
			temp.tilt = 360;
			if (game_state[0] > 2)
			{temp.z = 3000;
			}else
			{temp.z = 1500;}
			
			indicator = _watch;
			scan (my.x,my.pan,temp);
			if (my._signal == _detecte_enemy)
			{
				if (game_state[0] < 3)
				{
					if ((BennDetectedFirst == 0)&&(my.skill48 == 1))
					{
						BennDetectedFirst = 1;
						car_speed = 35;
						ShowMessage(5,139);
						Play_My_Sounds(11,0);
					}
					if(time_stop==35)
					{	
						my._signal=0;
						game_state[1] == 1;
						car_stop();
						return;
					}
					time_stop+=1;
				}
				else
				{
					if(time_stop==5)
					{	
						my._signal=0;
						game_state[1] == 1;
						car_stop();
						return;
					}
					time_stop+=1;
				}
			}
			else
			{
				if (BennDetectedFirst != 0)
				{
					BennDetectedFirst += 1;
					if (BennDetectedFirst > 150)
					{BennDetectedFirst = 0;
					}
				}
			}

			if random(10)>5
			{
				my._signal=0;
				temp.pan = 360;
				temp.tilt = 360;
				temp.z = 1300;
				indicator = _watch;
				scan (my.x,my.pan,temp);
				if (my._signal == _detecte_enemy)
				{
					if (game_state[0] < 3)
					{
						if ((BennDetectedFirst == 0)&&(my.skill48 == 1))
						{
							BennDetectedFirst = 1;
							car_speed = 35;
							ShowMessage(5,139);
							Play_My_Sounds(11,0);
						}

						if(time_stop==35)
						{	
							my._signal=0;
							game_state[1] == 1;
							car_stop();
							return;
						}
						time_stop+=1;
					}
					else
					{
						if(time_stop==5)
						{	
							my._signal=0;
							game_state[1] == 1;
							car_stop();
							return;
						}
						time_stop+=1;
					}
				}
				else
				{
					if (BennDetectedFirst != 0)
					{
						BennDetectedFirst += 1;
						if (BennDetectedFirst > 150)
						{BennDetectedFirst = 0;
						}
					}
				}

			}
		}

		vec_set(point_move.x,my._target_x );
		if EDistance(point_move,me)<50
		{
			break;
		}
		if ( snd_playing(my.SoundWR)==0)
		{ 
			play_entsound(me,CarSound,500);
			my.SoundWR=result; 
		}
		//my._movemode = _mode_walking;
		temp.x = (my._target_x - my.x)*0.05;
		temp.y = (my._target_y - my.y)*0.05;
		temp.z = (my._target_z - my.z)*0.05;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle.pan;
		temp.x=speed/car_speed;
		temp.y=0;
		temp.z=0;
		move(me,temp,nullvector);
		wait(1);

	}
	car_path1();	
}

function car_stop()	//for part one 
{
	exclusive_entity;
	if (Game_State[0] == 100)
	{return;
	}
	if(Game_State[0] == 4)
	{
		if (my.skill48 == 1)
		{
			ShowMessage(5,136);
			ent_path("path_112");
			ent_waypoint(my._target_x,1);
			car_path();

		}
		else
		{
			game_state[0] = 5;
			ent_path("path_111");
			ent_waypoint(my._target_x,1);
			car_path();

		}
		wait(10);
		return;		
	}
	else
	{
		me = 0;
		ShowMessage(5,143);
		Play_My_Sounds(2,0);
		wait(10);
		VisMainMenu(1);
		MBackMenu.visible = 0;
		on_esc = 0;
		on_enter = LLoadLastSave;
	}

}

var counter_1 = 0;

function check_vihcle(val)	//for part one 
{	
	if (my._type==100)
	{
		e_upass(30,_type_player);
		e_upass(30,_type_player1);
	}
	else
	{
		e_upass(30,100);
	}
	ent_vertex(temp,79);
	entiy = my.entity2;
	if entiy==0 {goto czfin;}

	counter_1.x = entiy.x;
	counter_1.y = entiy.y;
	counter_1.z = entiy.z + entiy.max_z*0.75;

	if entiy == null {goto czfin;}

	trace_mode = ignore_me + ignore_passable + ignore_passents;

	result=trace(temp,counter_1);
	if(result>val){goto czfin;}
	if (you == entiy)
	{
		//my._spot_hight=0.75;
		goto cfin;
	}
	else
	{
		counter_1.z = entiy.z;		
		trace(temp,counter_1);
		if(result>val){goto czfin;}
		if (you == entiy)
		{
			//my._spot_hight=0;
			goto cfin;
		}
		else
		{
			counter_1.z= entiy.z+ entiy.min_z*0.75;
	
			trace(temp,counter_1);
			if(result>val){goto czfin;}
			if (you == entiy)
			{
				//my._spot_hight=-0.75;
				goto cfin;
			}
			else
			{
			czfin:	if (my._type==100)
				{
					e_pass(30,_type_player);
				}
				else
				{
					e_pass(30,100);
				}	
				return(-1);
			}
		}
	}
	cfin:
	if (my._type==100)
	{
		e_pass(30,_type_player);
		e_pass(30,_type_player1);
	}
	else
	{
		e_pass(30,100);
	}
	return(1);
}




//////////////////////////////////////////////////////////
//		for part two				//
//////////////////////////////////////////////////////////

function followplayer2()
{
	wait(100);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event = followevent;
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	while (1)
	{
		if (eplhealth){	return;	}
		if (SolderCounter==1)&&(Game_State[0] > 6)&&(my.skill23 == 0)
		{
			my.skill23 = 1;
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 10000;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
			wait(50);
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 10000;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
		}

		vec_set(my.pos,player.pos);
		if(PressedKeys[Key_Use] == 1)
		{
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 250;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
			indicator = 0;
			//Game_State[0] = 3;
		}
		wait(1);
	}
}

function objectpos2()
{
	while (1)
	{
		if (eplhealth){	return;	}
		if (Game_State[0] == 1)
		{
			ObjecPos.y = 5;
			ObjecPos.z = -3.5;
			temp.x = my.x - player.x;
			temp.y = my.y - player.y;
			temp.z = my.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos.roll = player.pan - temp.pan;
		}
		wait(1);
	}
}
function objectpos3()
{
	while (1)
	{
		if (eplhealth){	return;	}
		if (Game_State[0] > 1)&&(SolderCounter != 1)
		{
			ObjecPos.y = 5;
			ObjecPos.z = -3.5;
			temp.x = my.x - player.x;
			temp.y = my.y - player.y;
			temp.z = my.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos.roll = player.pan - temp.pan;
		}
		wait(1);
	}
}

function objectpos9()
{return;
}



function NextPart()
{
	wait(50);
	Game_State[0] = 1;
	while (1)
	{	
		if (eplhealth){	return;	}
		if (player.x>-1870)&&(Game_State[0] == 1)&&(DedSolders >7)
		{
			Game_State[0] = 2;
			MisionsMsg4.ambient = -100;
			MisionsMsg5.visible=1;
			wait(10);
			ShowMessionsAuto();

		}
		if ((player.x>-500)&&(Game_State[0] == 2))
		{
			Game_State[0] = 6;
			ShowMessage(5,136);
			Play_My_Sounds(12,0);
			wait(15);
		}
		if (Game_State[0] == 9)
		{
			play_loop VictoryPlayer, 100;
			h_VictoryPlayer = result;
			VictoryCamera();
			break;
		}

		wait(1);
	}

}

function Eventend()
{
	if (event_type == event_detect)&&(indicator == _handle)&&(you._type == _type_player)
	{
		if (my.skill33 == 0)
		{
			my.skill33 =1;
			ShowMessage(5,152);
			wait(100);
			my.skill33 =0;
		}
	}
	if ((event_type==event_scan)&&(indicator == _handle)&&(Game_State[0] < 8) )
	{
			ShowMessionsAuto();
			wait(50);
			return;
	}
	if ((event_type==event_scan)&&(indicator == _handle)&&(Game_State[0] == 8) )
	{
			my.event=0;
			Game_State[0]=9;
			ShowMessage(5,141);
			Play_My_Sounds(16,0);
			wait(15);
			MisionsMsg3.ambient = -100; 
	}
}


action end
{    
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event = Eventend;
	while (1)
	{
		if (eplhealth){	return;	}
		temp.pan = 360;
		temp.tilt =360;
		temp.z = 200;//1000;
		indicator = _handle;
		scan (my.x,my_angle,temp);
		indicator = 0;
		wait(10);
	}

}


action arrow //for next part 2
{
	my.scale_x=0.1;
	my.scale_y=0.1;
	my.scale_z=0.1;
	while (1)
	{
		if (eplhealth){	return;	}
		if (Game_State[0] == 6)
		{
			wait(100);
			Game_State[0] = 7;

		}
		if (Game_State[0] == 8)
		{
			my.skin = 2;
		}
		my.pan += 10*(speed/200);
		wait(1);
	}

}

////////////////////////////////////////////////////////////////////////////////


