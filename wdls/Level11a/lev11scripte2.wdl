function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}
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
	camra2player = 0;
	
}
function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}

action followplayer
{
	wait(50);
	my.skill17 = 0;
	my._type = _type_player1;
	while (1)
	{
		if (objectposition != null)
		{
			//you=Pointer_To_Entity(objectposition);
			ObjecPos.frame = 1;
			temp.x = objectposition.x - player.x;
			temp.y = objectposition.y - player.y;
			temp.z = objectposition.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos.roll = player.pan - temp.pan;
		}
		else
		{
			ObjecPos.frame = 2;
		}
		if (objectposition1 != null)
		{
			//you=Pointer_To_Entity(objectposition);
			ObjecPos1.frame = 1;
			temp.x = objectposition1.x - player.x;
			temp.y = objectposition1.y - player.y;
			temp.z = objectposition1.z - player.z;
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

///////////////////////////////////////////////////////////////////////////////////////////////////
function Generate_Waiting_Solders(Pos1,Pos2,Pos3,Pos4)
{
	temp.x=Soldiers11Wait_Posx[Pos1.x];	
	temp.y=Soldiers11Wait_Posy[Pos1.x];	
	temp.z=Soldiers11Wait_Posz[Pos1.x];
	create(<ckm16.mdl>,temp,SoldColl);
	you.skill6 = 18;
	you.skill8 = 4;
	you.skill7 =10;
	you.Grenader = 1;
	temp.x=Soldiers11Wait_Posx[Pos1.y];	
	temp.y=Soldiers11Wait_Posy[Pos1.y];	
	temp.z=Soldiers11Wait_Posz[Pos1.y];
	create(<ckm16.mdl>,temp,SoldColl);
	you.skill6 = 18;
	you.skill8 = 4;
	you.skill7 =10;
	you.Grenader = 1;
	temp.x=Soldiers11Wait_Posx[Pos2];	
	temp.y=Soldiers11Wait_Posy[Pos2];	
	temp.z=Soldiers11Wait_Posz[Pos2];
	create(<ckm16.mdl>,temp,SoldColl);
	you.skill6 = 18;
	you.skill8 = 4;
	you.skill7 =10;
	you.Grenader = 1;
	temp.x=Soldiers11Wait_Posx[Pos3];	
	temp.y=Soldiers11Wait_Posy[Pos3];	
	temp.z=Soldiers11Wait_Posz[Pos3];
	create(<ckm16.mdl>,temp,SoldColl);
	you.skill6 = 18;
	you.skill8 = 4;
	you.skill7 =10;
	you.Grenader = 1;
	temp.x=Soldiers11Wait_Posx[Pos4];	
	temp.y=Soldiers11Wait_Posy[Pos4];	
	temp.z=Soldiers11Wait_Posz[Pos4];
	create(<ckm16.mdl>,temp,SoldColl);
	you.skill6 = 18;
	you.skill8 = 4;
	you.skill7 =10;
	you.Grenader = 1;
}

function Generate_Runing_Solders(Pos1,Pos2)
{
	temp.x=Soldiers11Run_Posx[Pos1];
	temp.x += int(random(40));
	temp.y=Soldiers11Run_Posy[Pos1];	
	temp.y += int(random(40));
	temp.z=Soldiers11Run_Posz[Pos1];
	create(<ckm16.mdl>,temp,SoldColl);
	you.skill6 = 18;
	you.skill8 = 4;
	you.skill7 =0;
	you.Grenader = 1;
	temp.x=Soldiers11Run_Posx[Pos2];	
	temp.x += int(random(40));
	temp.y=Soldiers11Run_Posy[Pos2];	
	temp.y += int(random(40));
	temp.z=Soldiers11Run_Posz[Pos2];
	create(<ckm16.mdl>,temp,SoldColl);
	you.skill6 = 18;
	you.skill8 = 4;
	you.skill7 =0;
	you.Grenader = 1;
}
function SoldersGroupCreation()
{
	temp.x=-1826;	
	temp.y=-634;	
	temp.z= 20;
	create(<ckm16.mdl>,temp,SolderRuner);
	you.skill7 =1;
	create(<ckm16.mdl>,temp,SolderRuner);
	you.skill7 =2;
	//create(<ckm16.mdl>,temp,SolderRuner);
	//you.skill7 =3;
	temp.x= 772;	
	temp.y= 647;	
	temp.z= 20;
	create(<ckm16.mdl>,temp,SolderRuner);
	you.skill7 =4;
	create(<ckm16.mdl>,temp,SolderRuner);
	you.skill7 =5;
	//create(<ckm16.mdl>,temp,SolderRuner);
	//you.skill7 =6;
	return;
}

////////////////////////////////////////////////////////////////////////////////////////////////
function SetPos(Tpos)
{
	if (Tpos == 1)
	{
		temp.x=ObjectPos_x[0];	
		temp.y=ObjectPos_y[0];	
		temp.z=ObjectPos_z[0];
		vec_set(objectposition,temp);
		objectposition1 = null;
	}
	if (Tpos == 2)
	{
		temp.x=ObjectPos_x[1];	
		temp.y=ObjectPos_y[1];	
		temp.z=ObjectPos_z[1];
		vec_set(objectposition,temp);
		objectposition1 = null;
	}
	if (Tpos == 3)
	{
		temp.x=ObjectPos_x[0];	
		temp.y=ObjectPos_y[0];	
		temp.z=ObjectPos_z[0];
		vec_set(objectposition,temp);
		temp.x=ObjectPos_x[2];	
		temp.y=ObjectPos_y[2];	
		temp.z=ObjectPos_z[2];
		vec_set(objectposition1,temp);
	}
	if (Tpos == 4)
	{
		temp.x=ObjectPos_x[1];	
		temp.y=ObjectPos_y[1];	
		temp.z=ObjectPos_z[1];
		vec_set(objectposition,temp);
		temp.x=ObjectPos_x[3];	
		temp.y=ObjectPos_y[3];	
		temp.z=ObjectPos_z[3];
		vec_set(objectposition1,temp);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////
function StartLevel()
{
	SoldersGroupCreation();
	wait(10);
	object1.visible = 0;
	object2.visible = 0;
	object3.visible = 0;
	object4.visible = 0;
	MisionsMsg1.visible=0;
	MisionsMsg2.visible=1;
	MisionsMsg3.visible=1;
	MisionsMsg4.visible=0;
	ShowMessionsAuto();
	ShowMessage(5,208);
	Play_My_Sounds(1,0);
	wait(75);
	ShowMessage(5,209);
	Game_State[0] = 0 ;
	Generator = 850;
	wait(10);
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	while (1)
	{
		test_num1 = SolderCounter;
		test_num2 = TimeRecpon.y;
		test_num3 = TimeRecpon.z;
		test_num4 = Group_Generat.x;
		test_num5 = Group_Generat.y;
		test_num6 = Group_Generat.z;
		if (Generator > 1000)&&(Generator.z < 2)
		{
			if (player.x < -1000)
			{
				Generator = 0;
				Generate_Runing_Solders(2,3);
			}
			else
			{
				Generator = 0;
				Generate_Runing_Solders(1,0);
			}
		}
		if (Generator.z == 3)
		{
			ShowMessage(5,218);
			Play_My_Sounds(6,0);
			MisionsMsg3.ambient = -100;
			ShowMessionsAuto();
			Generator.z = 4;
		}
		if (SolderCounter < 5)&&(Generator.z == 4)
		{
			MisionsMsg2.ambient = -100;
			ShowMessionsAuto();
			Generator.y = 0;
			ShowMessage(5,220);
			Play_My_Sounds(7,0);
			game_state[0] = -75;
			while (Generator.y < 75)
			{
				Generator.y += 1;
				wait(1);
			}
			Generator.z = 5;

		}
		if (Generator.z == 5)
		{
			ZoomOut();
			HideEveryThing();
			Kick_Action = 0;
			MovieOrSucess = 1;
			VictoryScream();
			play_loop VictoryPlayer, 100;
			h_VictoryPlayer = result;
			RemoveAllKeys();
			on_enter = finalization;
			PreesNextLvl.visible = 1;
			Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
			break;

		}
//		if (Generator.y == 3)
//		{
			if (player.x < -700)&&(player.y > 0)&&(Group_Generat.x == 0)
			{
				temp.x = 0;
				temp.y = 1;
				temp.z = 0;
				Generate_Waiting_Solders(temp,2,3,4);
				Group_Generat.x = 1;
			}
			if (player.x < -1500)&&(player.y < 650)&&(Group_Generat.y == 0)
			{
				temp.x = 5;
				temp.y = 6;
				temp.z = 0;
				Generate_Waiting_Solders(temp,7,8,9);
				Group_Generat.y = 1;
			}
			if (player.x > -1000)&&(player.y < 0)&&(Group_Generat.z == 0)
			{
				temp.x = 10;
				temp.y = 11;
				temp.z = 0;
				Generate_Waiting_Solders(temp,12,13,14);
				Group_Generat.z = 1;
			}
//		}
		Generator += speed/200;
		wait(1);
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
function RunerCreate()
{
	//wait(50);
	if (RunerExist == 1)||(SolderCounter < 1)
	{return;
	}
	create(<ckm16.mdl>,RunerPos,RunToGeneral);
	you.skill7=RunerExist.y;
	return;
}


function RunerNextPoint()
{	
	RunerPoint = ent_nextpoint(my._target_x);
	if (RunerPoint == 5)
	{
		showmessage(5,182);
		wait(15);
		me=0;
		Kick_Action=0;
		MissionFailed();
		return;
	}
	RRuner();
}


function RunerEvent()
{
	if event_type == event_scan && indicator == _explode && you._type == _type_player
	{	
		my._health-=1000;
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire && you._type == _type_player)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
}

function RRuner()
{
	//exclusive_entity;
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
			SolderCounter += 1;
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
		
		}
		if ( my.SoundWR<0)
		{ play_entsound(me,Solderstep4,300);
		my.SoundWR=-100; }
		my.SoundWR+=10;
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "RRuner");
			break;;
		}
		if (vec_dist(my.x ,my._target_x ) < 75)
		{RunerNextPoint();break;
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
function RunerDie()
{
	death_sound(100);
	wait(1);
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
		my.skill1 += 0.3*speed/200;
		wait(1);
	}
	RunerExist=0;
	wait(20);
	RunerCreate();
	remove me;
}

action RunToGeneral
{
	RunerExist=1;
	//wait(int(random(500)));
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{
		my.ScaleCollision = 1;
	}

	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
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
	my.event = RunerEvent;
	my.pan = random(360);
	my.WeaponNumber = m16;
	my.DieEvent = Function_To_Pointer( "RunerDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	if (RunerExist.y == 1)
	{ent_path("Solder_Path5");
	}
	if (RunerExist.y == 2)
	{ent_path("Solder_Path13");
	}
	if (RunerExist.y == 3)
	{ent_path("Solder_Path5");
	}
	if (RunerExist.y == 4)
	{ent_path("Solder_Path13");
	}
	ent_waypoint(my._target_x,1);
	RRuner();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
function SRunerNextPoint()
{	
	if (ent_nextpoint(my._target_x) == 3)
	{
		my.EnemyId = player.bodylnk;
		PathToEnemy();
		return;
	}
	else
	{SRuner();
	}
}


function SRuner()
{
	//exclusive_entity;
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
			SolderCounter += 1;
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
		        my.LastState = Function_To_Pointer( "SRuner");
			break;;
		}
		if (vec_dist(my.x ,my._target_x ) < 75)
		{SRunerNextPoint();break;
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


action SolderRuner
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	wait(10);
	SolderCounter+=1;
	me.skill46 = -10;
	my.skill8 = 4;
	my.skill6 = 18;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	my.wieght = 50;
	wait(20);
	my.hunt = 1;
	my.hide = 1;
	my.Grenader = 1;
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
	my.pan = random(360);
	my.WeaponNumber = m4;
	my.DieEvent = Function_To_Pointer( "SolderDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	if (my.skill7 == 1)
	{ent_path("Spath1");
	}
	if (my.skill7 == 2)
	{ent_path("Spath2");
	}
	if (my.skill7 == 4)
	{ent_path("Spath3");
	}
	if (my.skill7 == 5)
	{ent_path("Spath4");
	}
	if (my.skill7 == 3)
	{ent_path("Ssnipe1");
	}
	if (my.skill7 == 6)
	{ent_path("Ssnipe2");
	}
	ent_waypoint(my._target_x,1);
	SRuner();

}
//////////////////////////////////////////////////////////////////////////////////////////////////////////
function fulling_boom()
{
	
	my.invisible = on;
	my.passable = on;
	var camrock = -1;
	while (1)
	{
		play_entsound(me,BoomComing,200);
		sonar(me,5000);
		if (result < 15)
		{
			create( <xplosion.mdl>, my.pos, ExplosionsTga);
			camrock = 1;
			break;		
		}
		my.z-=10;
		wait(1);
	}

	if (vec_dist(player.pos,my.pos)<2000)&&(camrock == 1)
	{
		camrock = 50;
		while (1)
		{
			camrock-=5;
			if (my.flag8 == 0)
			{my.flag8=1;camera.roll+=1.5;
			}else
			{my.flag8=0;camera.roll-=1.5;
			}
			if (camrock == 0)
			{break;
			}
			wait(1);
		}
		camrock+=25;
		while (1)
		{
			camrock-=5;
			if (my.flag8 == 0)
			{my.flag8=1;camera.roll-=1.8;
			}else
			{my.flag8=0;camera.roll+=1.8;
			}
			if (camrock == 0)
			{break;
			}
			wait(1);
		}
		camrock = 0;
		camera.roll=0;
	}
	remove(me);
}

function RandomBooming()
{
	var boom_location;
	my.skill7 = 0;
	while (1)
	{
		if (game_state[0] == -75)
		{return;
		}
		if (my.skill7 > 300)
		{
			my.skill7 = 0;
			boom_location = int(random(10));
			temp.x = BoomPosX[boom_location];
			temp.y = BoomPosy[boom_location];
			temp.z = BoomPosz[boom_location];
			create(<rocket.mdl>,temp,fulling_boom);
			//create(<Hala.MDL>,temp,dust_explosion);
			boom_location = int(random(5))+5;
			temp.x = BoomPosX[boom_location];
			temp.y = BoomPosy[boom_location];
			temp.z = BoomPosz[boom_location];
			create(<rocket.mdl>,temp,fulling_boom);
			//create(<Hala.MDL>,temp,dust_explosion);
		}
		my.skill7 += 1;
		wait(1);
	}

}


///////////////////////////////////////////////////////////////////////////////////////////////////////
function rokett()
{
	var soundstringth = 0;
	var boom;
	var camrock = 0;
	if (BoompingWall == 1)
	{return;
	}
	BoompingWall = 1;
	play_entsound(me,boomcomiing,1000);
	while (1)
	{
		soundstringth+=speed/200;
		if (soundstringth > 50)
		{break;
		}
		wait(1);
	}
	temp2.x = 0;
	temp2.y = 0;//(200 - random(400));
	temp2.z = 0;//(100 - random(200));
	vec_rotate( temp2, my_angle);
	vec_add( temp2, my.pos);
	vec_set( normal, my.pan);
	normal.x -= 90;
	create( <xplosion.mdl>, temp2, ExplodedWall);
	boom = vec_dist(my.pos,player.pos);
	if (boom < 250)
	{HeartPlayer(50000/boom);
	}
	camrock+=50;
	while (1)
	{
		camrock-=5;
		if (my.flag2 == 0)
		{my.flag2=1;camera.roll+=1.5;
		}else
		{my.flag2=0;camera.roll-=1.5;
		}
		if (camrock == 0)
		{break;
		}
		wait(1);
	}
	camrock+=25;
	while (1)
	{
		camrock-=5;
		if (my.flag2 == 0)
		{my.flag2=1;camera.roll-=1.8;
		}else
		{my.flag2=0;camera.roll+=1.8;
		}
		if (camrock == 0)
		{break;
		}
		wait(1);
	}
	camrock = 0;
	camera.roll=0;
	BoompingWall = 0;
}

function ExplosionEnterance()
{
	my._type = _type_elevator;
	wait(50);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	while (1)
	{
		if (vec_dist(my.pos,player.pos) < 350)&&(BoompingWall == 0)

		{
			if (vec_dist(my.pos,player.pos) < 400)
			{
				rokett();
			}
		}
		wait(1);
	}
}
