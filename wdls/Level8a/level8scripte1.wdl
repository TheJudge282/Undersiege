function HideEveryThing()
{
	object1.visible = 0;
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
function TempHideEveryThing(UI)
{
	weapon.visible = UI;
	WeaponPan2.visible = UI;	
	WeaponPan.visible = UI;
	WeaponStore.visible = UI;
	DWeaponStore.visible = UI;
	WeaponStore.visible = UI;
	VWeaponSprite.visible = UI;
	VWeaponSprite1.visible = UI;
	ObjecPos.visible = UI;
	outcompass.visible = UI;
	EnemyPos.visible = UI;
	Compass.visible = UI;
	HldBk.visible = UI;
	HldSld.visible = UI;
	VWeaponSprite1.visible = UI;
	CPointer.visible = UI;
	looprun=UI;
	if (UI == 1)
	{
		CompassFunc(Compass);
		SelectNewGun();
		return;

	}
	player.visible = !UI;
	you = Pointer_To_Entity( PWeapons[weapon_number-1]);
	you.z = 1000;
	
}
function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}

function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}

function start_Level()
{
	MisionsMsg1.visible=1;
	MisionsMsg2.visible=0;
	MisionsMsg3.visible=0;
	MisionsMsg4.visible=0;
	MisionsMsg5.visible=0;
	MisionsMsg6.visible=0;
	object1.visible = 0;
	object1.skin = 10;
	ObjecPos.frame = 2;
	wait(75);
	ShowMessage(5,150);
	Play_My_Sounds(1,0);
	ShowMessionsAuto();
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	while (1)
	{
		if (game_state[0] == 5)&&(player.y < -1350)
		{
			game_state[0] = 6;
			temp.x=Solder_posx[8];	
			temp.y=Solder_posy[8];	
			temp.z=Solder_posz[8];	
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
		}
		if (game_state[0] == 6)&&(player.z < 200)
		{
			game_state[0] = 7;
			temp.x=Solder_posx[9];	
			temp.y=Solder_posy[9];	
			temp.z=Solder_posz[9];	
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
		}

		wait(1);
	}

}
action followplayer
{
	wait(50);
	FollowingP = Entity_To_Pointer(me);
	my.skill17 = 0;
	my._type = _type_player1;
	while (1)
	{
		vec_set(my.pos,player.pos);
		if(PressedKeys[Key_Use] == 1)&&(playerAct.z == 0)
		{
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 200;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
			wait(50);
		}
		wait(1);
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////
function EmergencyLight()
{
	my.passable = on;
	my.invisible = on;
	//my.light = on;
	my.lightrange = 140;

	my.scale_x = 0.5;
	my.scale_y = 0.5;
	my.scale_z = 0.5;
	my.skill17 = 101;
	while (1)
	{
		if (my.skill17 < 100)		
		{			
			my.red = 255;
			my.green = 0;
			my.blue = 0;									
			my.skill17 += 15;

		}
		if (my.skill17 >= 100)&&(my.skill17 < 200)	
		{
			my.red =0;
			my.green= 0;
			my.blue =0;
			my.skill17 += 15;
		}			
		if (my.skill17 >= 200)
		{my.skill17=0;
		}
		wait(1);
	}

}

function EmergencyOn()
{
	temp.x = -1591;
	temp.y = 894;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = -1591;
	temp.y = 358;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = -1591;
	temp.y = -468;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = -1591;
	temp.y = -974;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	
	temp.x = -1203;
	temp.y = -51;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = 1135;
	temp.y = -51;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = -628;
	temp.y = -51;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = 498;
	temp.y = -51;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);

	temp.x = -71;
	temp.y = 880;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = -71;
	temp.y = 363;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = -71;
	temp.y = -444;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = -71;
	temp.y = -981;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);

	temp.x = 1585;
	temp.y = 880;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = 1585;
	temp.y = 363;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = 1585;
	temp.y = -444;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);
	temp.x = 1585;
	temp.y = -981;
	temp.z = 750;
	create(<point1.mdl>,temp,EmergencyLight);


	temp.x = -71;
	temp.y = -47;
	temp.z = 700;
	create(<point1.mdl>,temp,EmergencyLight);

}
function dect_event()
{
	if ((event_type == event_scan)&&(indicator == _handle)&&(game_state[0] == 0))
	{
		my._signal=17;
		return;	
	}
}

function SolderTalk()
{
	ShowMessage(5,159);
	play_entsound(me,S_M_HM8_00,2000); 
	SoundIsPlaying = result; 
	while (snd_playing(SoundIsPlaying) == 1)
	{wait(1);
	}
	//wait(25);
	ShowMessage(5,160);
	play_entsound(me,S_M_HM8_01,2000); 
	SoundIsPlaying = result; 
	while (snd_playing(SoundIsPlaying) == 1)
	{wait(1);
	}
	ShowMessage(5,163);
	play_entsound(me,S_M_HM8_04,2000); 
	SoundIsPlaying = result; 
	while (snd_playing(SoundIsPlaying) == 1)
	{wait(1);
	}
	ShowMessage(5,161);
	play_entsound(me,S_M_HM8_02,2000); 
	SoundIsPlaying = result; 
	wait(10);
	return;

}

function SolderTalking()
{
	wait(100);
	while (1)
	{
		if (game_state[3] == 3)
		{SolderTalk();break;
		}
		wait(1);
	}
}

function air_dect()
{
	wait(100);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=dect_event;
	my.skill27 = 0;
	my.lightrange = 30;
	my.red = 0;
	my.green = 0;
	my.blue = 0;
	my.flag7 = 0;
	while (1)
	{
		if (my.skill27 < 15)
		{
			my.skill27 +=1;
			my.red += 17;
		}
		else
		{
			my.skill27 +=1;
			my.red -= 17;
			if (my.skill27 > 30)
			{my.skill27 = 0;my.red=0;
			}
			
		}
		if (my.skill19 == 0)&&(vec_dist(my.pos,player.pos)<50)
		{
			my.skill19 =100;
			showmessage(5,197);
		}
		if (vec_dist(my.pos,player.pos)<50)
		{my.skill19 -=1;
		}

		if(my._signal==17)
		{
			Play_My_Sounds(18,0);
			weapon.invisible = 1;
			DecetPlayer = 1;
			wait(5);
			if (camorder == 3)
			{
				my.flag7 = 1;
				camorder=1;
				cameraction = EyCamera;
			}
			game_state[0]=1;
			game_state[1]=2;
			my._signal=0;
			
			TempHideEveryThing(0);
			my.skill2=1;
			player.scale_x=0.1;
			player.scale_y=0.1;
			player.scale_z=0.1;
			temp.x=-70;
			temp.y=1195;
			temp.z=855;
			you = Pointer_To_Entity( player.BodyLnk);
			you.scale_x=0.2;
			you.scale_y=0.4;
			you.scale_z=0.4;
			vec_set(you.pos,temp);
			//return;
		}
		if((player.x>90)&&(my.skill2==1)&&(my.skill3==0)&&(game_state[1]==2))
		{
			my.skill3=1;
			game_state[3]=3;
		}
		if ((player.z<770)&&(player.x>0)&&(my.skill2 == 1)&&(game_state[1]==2))
		{
			if (my.flag7 == 1)
			{
				camorder=3;
				CameraState();
			}
			
			TempHideEveryThing(1);
			DecetPlayer = 0;
			my.skill2=0;
			me=player;
			player.scale_x=1;
			player.scale_y=1;
			player.scale_z=1;
			you = Pointer_To_Entity( player.BodyLnk);
			you.scale_x=1;
			you.scale_y=1;
			you.scale_z=1;
			you.z+=25;
			game_state[1]=3;
			game_state[0] = 2;
			break;

		}
		if ((player.z<770)&&(player.x<0)&&(my.skill2 == 1)&&(game_state[1]==2))
		{
			if (my.flag7 == 1)
			{
				camorder=3;
				CameraState();
			}
			TempHideEveryThing(1);
			DecetPlayer = 0;
			my.skill2=0;
			me=player;
			player.scale_x=1;
			player.scale_y=1;
			player.scale_z=1;
			you = Pointer_To_Entity( player.BodyLnk);
			you.scale_x=1;
			you.scale_y=1;
			you.scale_z=1;
			you.z+=25;
			//show_my_messages(4,100);
			game_state[1]=5;
			game_state[0] = 2;
			break;

		}
		wait(1);
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
function ComparsHit()
{
	my._state = _state_hit;
	while (1)
	{
	if (my.GotHit==100)
	{
		Hitter_sound(2000);
	}
		if (my._health <-200)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
		  return;
		}
		my.GotHit = nearnumber( my.GotHit, 0, 1*speed/100);
		ent_frame( my.string2, 100-frc(my.GotHit/100)*100);
		if (my.GotHit==0)
		{
		 break;
		}
		wait(1);
	}
	Sold_Coll2();
	Pointer_To_Function( my.LastState, 0, 0, 0);
}


function ComparsDie()
{
	SolderCounter-=1;
	DedSolders+=1;
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 200;
	indicator = _gunfire;
	scan (my.x,my.pan,temp);
	BellAct = 0;
	str_for_entfile( name, me);
	PTempstr = GetDieString( name, me);
	if (PTempstr!=0){
		morph (  PTempstr, me);
	}else
	{
	  morph ( <rdie.mdl>, me);
	}
	death_sound(100);
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
	remove me;
}

function Comparsevent()
{
	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		BellAct = 1;
		my.EnemyId = Entity_To_Pointer( you);
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
	if event_type == event_scan && indicator == _gunfire && (my._state == _state_wait || my._state == _state_Walk )
	{	
		you = player;
		my.EnemyId = you.BodyLnk;
		my._signal = _hear_fire;
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

}

function Standing_Solder()
{
	my.FrameAnim = 0;
	my._state = _state_wait;
	ent_frame( stnd, 100);
	TurnTime = 0;
	while (1)
	{
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("Standing_Solder");
			return;
		}				
		temp.pan = 180;
		temp.tilt = 360;
		temp.z = 1700;
		indicator = _watch;
		scan (my.x,my.pan,temp);
		if (my._signal == _detecte_enemy)
		{
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.HitEvent = Function_To_Pointer( "SolderHit");
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle;
			SolderShoting();
			break;
		}

		temp.pan = 360;
		temp.tilt = 360;
		temp.z = 100;
		indicator = _watch;
		scan (my.x,my.pan,temp);
		if (my._signal == _detecte_enemy)
		{
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.HitEvent = Function_To_Pointer( "SolderHit");
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle;
			SolderShoting();
			break;
		}

		if (my._signal == _hear_fire)
		{
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.HitEvent = Function_To_Pointer( "SolderHit");
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle;
			SolderShoting();
			break;
		}
		if (my.x > 100)&&(game_state[1] == 3)&&(TurnTime > 250)
		{
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.HitEvent = Function_To_Pointer( "SolderHit");
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle;
			SolderShoting();
			break;
		}
		if (my.x < -1700)&&(game_state[1] == 5)&&(TurnTime > 250)
		{
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.HitEvent = Function_To_Pointer( "SolderHit");
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle;
			SolderShoting();
			break;
		}
		if (game_state[1] == 5)||(game_state[1] == 3)
		{TurnTime += 1*(speed/200);
		}
		if (BellAct.y == 1)
		{
			my.skill7 == 0;
			SolderCounter-=1;
			SoldColl();
			break;
		}

		wait(1);
	}
}

action AllCompars
{
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = my.skill8;
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	SolderCounter+=1;
	my.shadow = shadowenable;
	my.wieght = 50;
	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimShot = IUpSnipFire;
	my.AnimDie =  0;
	my.z-=CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 0;
	my.GotHit = 0;
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = _type_soldier;
	my.event = Comparsevent;
	my.DieEvent = Function_To_Pointer("ComparsDie");
	my.HitEvent = Function_To_Pointer("ComparsHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	Standing_Solder();
	return;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
function soldier_patrol()
{
	wait(50);
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = my.skill8;
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	SolderCounter+=1;
	my.shadow = shadowenable;
	my.wieght = 50;
	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimShot = IUpSnipFire;
	my.AnimDie =  0;
	my.z-=CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 0;
	my.GotHit = 0;
	my.enable_scan = on;
	my.enable_detect = on;
	my._type = _type_soldier;
	my.event = Comparsevent;
	my.DieEvent = Function_To_Pointer("ComparsDie");
	my.HitEvent = Function_To_Pointer("ComparsHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	soldier_patrol_Wait();
	return;
}

function soldier_patrol_Wait()
{
	ent_frame( stnd, 100);
	while (1)
	{
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("soldier_patrol_Wait");
			return;
		}				
		if (vec_dist(my.pos,player.pos) < 250)
		{
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
		
		}
		if (BellAct.y == 1)
		{
			my.skill6 = 8;
			my.skill8 = 11;
			my.skill7 = 0;
			SolderCounter-=1;
			SoldColl();
			break;
		}
		if (my.skill7 == 7)&&(game_state[1] == 3)&&(my.x > 100)
		{
			if (my.skill8 > 200)
			{
				my.skill8 = 11;
				SolderCounter-=1;
				SoldColl();
				break;
			}
			my.skill8+=1*(speed/200);
		}
		if (my.skill7 == 7)&&(game_state[1] == 5)&&(my.x > 100)
		{
			my.skill8 = 11;
			my.skill7 = 5;
			SolderCounter-=1;
			SoldColl();
			break;
		}

		if (my.skill7 == 7)&&(game_state[1] == 5)&&(my.x < -100)
		{
			if (my.skill8 > 200)
			{
				my.skill8 = 11;
				my.skill7 = 7;
				SolderCounter-=1;
				SoldColl();
				break;
			}
			my.skill8+=1*(speed/200);
		}
		if (my.skill7 == 7)&&(game_state[1] == 3)&&(my.x < -100)
		{
			my.skill8 = 11;
			my.skill7 = 5;
			wait(10);
			SolderCounter-=1;
			SoldColl();
			break;
		}
		wait(1);
	}
}


function Solder_Create_Mideal()
{
	temp.x=Solder_posx[2];	
	temp.y=Solder_posy[2];	
	temp.z=Solder_posz[2];	
	create(<psgal.mdl>,temp,Runer);
	you.skill7 = 1;
	you.skill8 = 13;
	you.skill6 = 6;
	temp.x=Solder_posx[2];	
	temp.y=Solder_posy[2];	
	temp.y+=400;
	temp.z=Solder_posz[2];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx[2];	
	temp.x+=50;
	temp.y-=50;
	temp.y=Solder_posy[2];	
	temp.z=Solder_posz[2];	
	create(<pcuzi.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_Destx[1];
	temp.x+=50;
	temp.y+=50;
	temp.y=Solder_Desty[1];	
	temp.z=Solder_Destz[1];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx[2];	
	temp.x-=50;
	temp.y+=50;
	temp.y=Solder_posy[2];	
	temp.z=Solder_posz[2];	
	create(<psbom.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 5;
	you.skill6 = 7;
	temp.x=Solder_Destx[1];	
	temp.x-=50;
	temp.y-=50;
	temp.y=Solder_Desty[1];	
	temp.z=Solder_Destz[1];
	vec_set(you._target_x,temp);

}
function Solder_Create_Right()
{
	temp.x=Solder_posx[4];	
	temp.y=Solder_posy[4];	
	temp.z=Solder_posz[4];	
	create(<pcuzi.mdl>,temp,Runer);
	you.skill7 = 1;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_posx[4];	
	temp.y=Solder_posy[4];	
	temp.y+=400;
	temp.z=Solder_posz[4];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx[4];	
	temp.x+=50;
	temp.y-=50;
	temp.y=Solder_posy[4];	
	temp.z=Solder_posz[4];	
	create(<pcuzi.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_Destx[2];
	temp.x+=50;
	temp.y+=50;
	temp.y=Solder_Desty[2];	
	temp.z=Solder_Destz[2];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx[4];	
	temp.x-=50;
	temp.y+=50;
	temp.y=Solder_posy[4];	
	temp.z=Solder_posz[4];	
	create(<pcuzi.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_Destx[2];	
	temp.x-=50;
	temp.y-=50;
	temp.y=Solder_Desty[2];	
	temp.z=Solder_Destz[2];
	vec_set(you._target_x,temp);

}
function Solder_Create_Left()
{
	temp.x=Solder_posx[0];	
	temp.y=Solder_posy[0];	
	temp.z=Solder_posz[0];	
	create(<pcuzi.mdl>,temp,Runer);
	you.skill7 = 1;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_posx[0];	
	temp.y=Solder_posy[0];	
	temp.y+=400;
	temp.z=Solder_posz[0];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx[0];	
	temp.x+=50;
	temp.y-=50;
	temp.y=Solder_posy[0];	
	temp.z=Solder_posz[0];	
	create(<pcuzi.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_Destx[0];
	temp.x+=50;
	temp.y+=50;
	temp.y=Solder_Desty[0];	
	temp.z=Solder_Destz[0];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx[0];	
	temp.x-=50;
	temp.y+=50;
	temp.y=Solder_posy[0];	
	temp.z=Solder_posz[0];	
	create(<pcuzi.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_Destx[0];	
	temp.x-=50;
	temp.y-=50;
	temp.y=Solder_Desty[0];	
	temp.z=Solder_Destz[0];
	vec_set(you._target_x,temp);
}
function AlarmSolderCheck()
{
	wait(100);
	my.skill23 = 0;
	BellAct.z = 600;
	while (1)
	{
		if (EmergencyBell == 0)
		{
			if (BellAct.y == 1)
			{
				EmergencyBell = 1;
				EmergencyOn();
			}
		}
		if (BellAct == 1)
		{
			if (my.skill23 > 200)
			{BellAct.y = 1;
			}
			my.skill23 += 10*(speed/200);
		}
		if (BellAct.y == 1)
		{
			my.SoundWR+=9*(speed/200);
			if ( my.SoundWR>0)
			{
				play_sound(EmergencySound,50);
				wavehandle = result;
				my.SoundWR=-300;
			}
		}
		else
		{stop_sound wavehandle;
		}
		if (BellAct.y == 1)&&(BellAct.z > 500)&&(game_state[0] < 6)
		{
			BellAct.z = 1;
			if (player.x < 700)&&(player.x > -700)
			{
				if (int(random(3)> 1))
				{
					Solder_Create_Right();
				}
				else
				{
					Solder_Create_Left();
				}
				
			}
			else
			{
				Solder_Create_Mideal();
			}
		}
		BellAct.z +=0.4*(speed/200);
		wait(1);
	}
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
function Card_Event()
{
	if (event_type==event_scan)&&(indicator == _handle)
	{
		Play_My_Sounds(5,0);
		ShowMessage(5,143);
		my.visible=0;
		my.invisible=1;
		game_state[0]= 4;
		wait(15);
		ShowMessage(5,145);
		remove(me);
		object1.visible = 1;
		MisionsMsg1.ambient = -100;
		MisionsMsg2.visible=1;
		ShowMessionsAuto();
		wait(15);
		ShowMessage(5,187);
		return;		
	}

}

action card	
{
	wait(100);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=Card_Event;
	my.skill27 = 0;
	my.lightrange = 30;
	my.red = 0;
	my.green = 0;
	my.blue = 0;
	while (1)
	{
		if (my.skill27 < 15)
		{
			my.skill27 +=1;
			my.red += 17;
		}
		else
		{
			my.skill27 +=1;
			my.red -= 17;
			if (my.skill27 > 30)
			{my.skill27 = 0;my.red=0;
			}
			
		}
		if (game_state[0] == 4)//&&(BellAct.y == 0)
		{
			BellAct.z = 600;
			game_state[0] = 5;
			if (BellAct.y == 0)
			{BellAct.y = 1;
			}
			Solder_Create_Mideal();
		}
		if (my.skill19 > 200)&&(vec_dist(my.pos,player.pos)<100)
		{
			my.skill19 =0;
			showmessage(5,196);
		}
		my.skill19 += 1*(speed/200);
		wait(1);
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
function Floor2Door_event()
{
	if (event_type==event_scan)&&(indicator == _handle)
	{
		wait(15);
		Play_My_Sounds(14,0);
		ShowMessionsAuto();
		return;		
	}

}

function Floor2Door()
{
	wait(100);
	my._type = _type_elevator;
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=Floor2Door_event;
	while (1)
	{
		if (game_state[0] == 5)
		{mdoor();break;
		}
/*		if (game_state[0] == 5)&&(player.y < -1350)
		{
			game_state[0] = 6;
			temp.x=Solder_posx[6];	
			temp.y=Solder_posy[6];	
			temp.z=Solder_posz[6];	
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
			temp.x=Solder_posx[8];	
			temp.y=Solder_posy[8];	
			temp.z=Solder_posz[8];	
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
		}
		if (game_state[0] == 6)&&(player.z < 200)
		{
			game_state[0] = 7;
			temp.x=Solder_posx[7];	
			temp.y=Solder_posy[7];	
			temp.z=Solder_posz[7];	
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
			temp.x=Solder_posx[9];	
			temp.y=Solder_posy[9];	
			temp.z=Solder_posz[9];	
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
			create(<pcuzi.mdl>,temp,SoldColl);
			you.skill7 = 0;
			you.skill8 = 11;
			you.skill6 = 8;
		}*/
		wait(1);
	}	
}


function Closed_Door_Event()
{
	if (event_type==event_scan)&&(indicator == _handle)
	{
		wait(15);
		ShowMessage(5,136);
		Play_My_Sounds(2,0);
		return;		
	}

}
function Closed_Door()
{
	wait(100);
	my._type = _type_elevator;
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=Closed_Door_Event;

}
function FloorAhDoor_event()
{
	if (event_type==event_scan)&&(indicator == _handle)&&(my.skill19 == 1)
	{
		ShowMessage(5,136);
		wait(15);
		return;		
	}
	if (event_type==event_scan)&&(indicator == _handle)&&(my.skill19 == 2)
	{
		my.skin = 2;
		RemoveAllKeys();
		VictoryScream();
		stop_sound(CurrentSong);
		play_loop VictoryPlayer, 5000;
		h_VictoryPlayer = result;
		on_enter = finalization;
		PreesNextLvl.visible = 1;
		ZoomOut();
		Game_State[0]=-73;
		HideEveryThing();
		Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
		return;		
	}

}

function FloorAhDoor()
{
	wait(100);
	my._type = _type_elevator;
	my.skin = 1;
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=FloorAhDoor_event;
	while (1)
	{
		
		wait(1);
	}
}
function Automatic_Lock_Event()
{
	if (event_type==event_scan)&&(indicator == _handle)
	{
		if (my.flag7 == 1)&&(game_state[0] > 4)
		{return;
		}
		if (my.skin == 1)
		{
			Play_My_Sounds(17,0);
			my.skill27 = 0;
			Doors_State[my.skill13]=1;
			my.skin = 2;
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 200;//1000;
			indicator = _Open_Door;
			scan (my.x,my_angle,temp);
			wait(25);
		}
	/*	else
		{
			Doors_State[my.skill13]=0;
			my.skin = 1;
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 200;//1000;
			indicator = _Close_Door;
			scan (my.x,my_angle,temp);
			wait(25);
		}*/
	}

}

function Automatic_Lock_Event1()
{
	//	Locd Door till some condition by True
	if (event_type==event_scan)&&(indicator == _handle)&&(my.skill11 == 2)
	{
		//ShowMessage(5,136);
		Play_My_Sounds(19,0);
		ShowMessionsAuto();
		wait(15);
	}
	//	Locd Door
	if (event_type==event_scan)&&(indicator == _handle)&&(my.skill11 == 1)
	{
		ShowMessage(5,136);
		Play_My_Sounds(19,0);
		wait(15);
	}
	//	The End Door
	if (event_type==event_scan)&&(indicator == _handle)&&(my.skill11 == 3)
	{
		if (SolderCounter == 0)
		{
			my.skin = 2;
			RemoveAllKeys();
			VictoryScream();
			stop_sound(CurrentSong);
			play_loop VictoryPlayer, 5000;
			h_VictoryPlayer = result;
			on_enter = finalization;
			PreesNextLvl.visible = 1;
			ZoomOut();
			Game_State[0]=-73;
			HideEveryThing();
			Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
			return;		
		}
		else
		{
			ShowMessage(5,198);
			Play_My_Sounds(20,0);
			wait(15);
		}
	}

}
function Lock_Image()
{
	my.skill20 = Entity_To_Pointer(you);
	my.pan = you.pan - 180;
	if (my.skill27 == 0)
	{my.y +=10;
	}
	else
	{my.x+=15;
	}
	my.scale_x = 0.728;
	my.scale_y = 0.728;
	my.scale_z = 0.728;
	my.bright=1;
	my.unlit=1;
	my.ambient=-50;
	my.passable = 1;
	while (1)
	{
		you = Pointer_To_Entity(my.skill20);
		my.skin=you.skin;
		wait(1);
	}
}
function Automatic_Lock()
{
	//my._type = 200;
	my._type = _type_elevator;
	my.skin = 1;
	wait(50);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=Automatic_Lock_Event1;
	if (my.skill19 == 1)
	{
		create(<security.MDL>,my.pos,Lock_Image());
	}
	while (1)
	{
		if (my.skill11 == 2)&&(game_state[0] == 4)
		{
			my.skill11 = 0;
			my.event=Automatic_Lock_Event;
		}
	/*	if (my.skin == 2)&&(my.skill27 > 400)&&(vec_dist(my.pos,player.pos)>50)&&(my.skill11 != 3)
		{
			Doors_State[my.skill13]=0;
			my.skin = 1;
			my.skill27 = 0;
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 200;//1000;
			indicator = _Close_Door;
			scan (my.x,my_angle,temp);
			wait(25);
		}*/
		if (my.skill27 > 200)&&(vec_dist(my.pos,player.pos)<100)&&(my.skill11 != 1)&&(game_state[0] > 3)
		{
			my.skill27 =0;
			showmessage(5,195);
		}
		my.skill27 +=1*(speed/200);
		wait(1);
	}

}
function Locd_Lock()
{
	my.skin = 1;
}

////////////////////////////////////////////////////////////////////////////////////////////////
function Run_To_Point()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if (vec_dist(my.pos,player.pos) < 250)
		{
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			//SolderCounter += 1;
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
		
		}
		if ( my.SoundWR==0)
		{ play_entsound(me,Solderstep4,300);
		my.SoundWR=-100; }
		my.SoundWR+=10;
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "Run_To_Point");
			break;;
		}
		if (vec_dist(my.x ,my._target_x ) < 10)
		{
			temp.x = player.x - my.x;
			temp.y = player.y - my.y;
			temp.z = player.z - my.z;
			vec_to_angle(my_angle,temp);
			my.pan = my_angle;
			if (my.skill7 == 0)
			{
				my.EnemyId = player.bodylnk;
				PathToEnemy();
				break;
			}
			else
			{
				SolderCounter-=1;
				LmgSolder();
				break;
			}
		}		
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/35;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		//my.pan=my_angle.pan;
		my.pan=nearangle(my.pan,my_angle.pan,35);
		temp.x = speed/50;
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		wait(1);
	}

}

function Runer()
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}
	if (my.skill7 ==1)
	{wait(10);
	}
	else
	{wait(random(100)+25);
	}
	my.VertexCount = GetVertexNum(me)-20;
	wait(10);
	SolderCounter+=1;
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	my.wieght = 50;
	wait(20);
	my.hunt = 1;
	my.hide = 1;
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
	my.WeaponNumber = my.skill8;
	my.DieEvent = Function_To_Pointer( "SolderDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	Run_To_Point();
}



function tempbomb_Event()
{
	if (event_type==event_scan)&&(indicator == _handle)
	{
		totalbullets[my._ammotype -1 ] +=  my._packamount; 
		play_sound(ak_ok, 50);
		if (PWeapons[ my._ammotype -1 ]==0)
		{
			if (my._ammotype > 10)
			{msggdd( 46+my._ammotype );
			}else
			{msggdd( 47+my._ammotype );
			}
			ZoomOut();
		if (my._ammotype == pumaction)
		{
			create( <BumpAction.MDL>, temp, guny);
		
		}
		if (my._ammotype == uzi)
		{
			create( <uzi.MDL>, temp, guny);
		
		}
		you.skill1 = my._ammotype;
		}else
		{
		
		msggdd( 46+doubleuzi+1 );
		}
		AmmoCheck();
		remove(me);
		return;		
	}

}

action tempbomb	
{
	wait(100);
	my.WeaponNumber = my.skill8;
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=tempbomb_Event;
	my._ammotype    =  my.weaponnumber;
	if (level.y==1)
	{my._packamount=maxbulletnum[my.weaponnumber-1];
	}else
	{my._packamount  =  max(3,min(int(random(maxbulletnum[my.weaponnumber-1]/2)+maxbulletnum[my.weaponnumber-1]/2),20)); 
	}
	my.skill27 = 0;
	while (1)
	{
		if (my.skill19 == 0)&&(vec_dist(my.pos,player.pos)<100)
		{
			my.skill19 =100;
			showmessage(5,186);
		}
		if (vec_dist(my.pos,player.pos)<50)
		{my.skill19 -=1;
		}
		wait(1);
	}
}



function bomb()
{
	my.WeaponNumber = my.skill8;
	my.passable = 1;
	my.invisible = 1;
	my._ammotype    =  my.weaponnumber;
	if (level.y==1)
	{my._packamount=maxbulletnum[my.weaponnumber-1];
	}else
	{my._packamount  =  max(3,min(int(random(maxbulletnum[my.weaponnumber-1]/2)+maxbulletnum[my.weaponnumber-1]/2),20)); 
	}
	my.push = -1;
	my.enable_push = on;
	my.passable = 0;
	my.invisible = 0;
	my.event = AmmoEvnt;
}

function Fire_Box_Event()
{
	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= 100;
	}

}
function Fire_Box()
{
	my.OwnType = TypeOfEngines;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	my.max_x *= 2.2;
	my.CollFunction  = Function_To_Pointer("MallaCollision");
	my.enable_scan = on;
	my.enable_detect = on;
	AddColl(me);
	my._Health = 100;
	my.event = Fire_Box_Event;
	while (1)
	{
		if (my._Health < 0)
		{
			if (BellAct.y == 0)
			{BellAct.y = 1;
			}
			my.event = 0;
			my.flag1 = 1;
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 200;//1000;
			indicator = _explode;
			scan (my.x,my_angle,temp);
			create( <xplosion.mdl>, my.pos,ExplosionsTga);
			//wait(25);
			//remove me;
			my.ambient = -15;
			my.passable = 1; 
			break;
		}
		wait(1);
	}
}

function enddoor()
{
	my.lightrange = 20;
	my.red = 0;
	my.green = 0;
	my.blue = 0;
	my.flag7=on;
	while (1)
	{
		if (my.flag7!=off)
		{
			if (my.skill27 < 15)
			{
				my.skill27 +=1;
				my.red += 17;
			}
			else
			{
				my.skill27 +=1;
				my.red -= 17;
				if (my.skill27 > 30)
				{my.skill27 = 0;my.red=0;
				}
				
			}
		}
		wait(1);
	}
}
