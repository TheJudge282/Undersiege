function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}
function HideEveryThing(state)
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
	if (state == 1)
	{
		CloseSong(CurrentSong);
		camra2player = 0;
	}
	
}
function ShowHiddedThing()
{
	WeaponPan2.visible = 1;	
	WeaponPan.visible = 1;
	WeaponStore.visible = 1;
	DWeaponStore.visible = 1;
	WeaponStore.visible = 1;
	VWeaponSprite.visible = 1;
	VWeaponSprite1.visible = 1;
	outcompass.visible = 1;
	EnemyPos.visible = 1;
	Compass.visible = 1;
	HldBk.visible = 1;
	HldSld.visible = 1;
	VWeaponSprite1.visible = 1;
	CPointer.visible = 1;
	looprun=1;
	mesges.visible = 1;
	CompassFunc(Compass);
	SelectNewGun();

}
function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
}

function followplayer()
{
	wait(50);
	object5.skin = 7;
	my._type = _type_player1;
	FollowingP = Entity_To_Pointer(me);
	my.skill17 = 0;
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
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
		if (RunerState == 1)
		{
			if (my.skill17 < 100)
			{
				object5.visible=1;
				if (RunerPoint < 6)
				{	my.skill17 +=5;
				}
				if (RunerPoint >= 6)&&(RunerPoint < 8)
				{	my.skill17 +=10;
				}
				if (RunerPoint >= 8)
				{	my.skill17 +=15;
				}
				
			}
			else
			{
				object5.visible=0;
				if (RunerPoint < 6)
				{my.skill17 +=5;
				}
				if (RunerPoint >= 6)&&(RunerPoint < 8)
				{my.skill17 +=10;
				}
				if (RunerPoint >= 8)
				{my.skill17 +=15;
				}
			}
			if (my.skill17 > 200)
			{my.skill17 = 0;
			}
			if (RunerPoint < 6)
			{my.SoundWR+=3;
			}
			if (RunerPoint >= 6)&&(RunerPoint < 8)
			{my.SoundWR+=7;
			}
			if (RunerPoint >= 8)
			{my.SoundWR+=14;
			}
			if ( my.SoundWR>0)
			{
				play_sound(SolderApproch1,5000);
				my.SoundWR=-100;
			}
		}
		vec_set(my.pos,player.pos);
		if(PressedKeys[Key_Use] == 1)
		{
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 150;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
		}
		wait(1);
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	if ((event_type==event_scan)&&(indicator == _handle)&&(Game_State[0] == 4) )
	{
		my.event=0;
		objectposition = null;
		test_num6 += 1;
		Boom_Num -=1;
		temp.pan = 360;
		temp.tilt =360;
		temp.z = 200;//1000;
		indicator = CarAccedant;
		scan (my.x,my_angle,temp);
		my.skin=2;
		my.overlay=0;
		my.bright=0;
		if (Boom_Num == 2)
		{SoldersGroupCreation1(3);
		}
		if (Boom_Num < 1)
		{
			ShowMessage(5,293);
			Play_My_Sounds(50,0);
			MisionsMsg6.ambient = -100;
			//MisionsMsg7.visible=1;
			ShowMessionsAuto();
			Game_State[0] = 5;
			wait(30);
			ShowMessage(5,314);

		}
		return;		
	}
}
function Show_Explosion_pos()
{
	temp.x = Explosion_Posx[1];
	temp.y = Explosion_Posy[1];
	temp.z = Explosion_Posz[1];
	create(<health2.mdl>,temp,room_boom);
	you.transparent = 1;
	you.passable = 1;
	you.overlay = 1;
	you.bright = 1;
	temp.z += 50;
	create(<arrow.mdl>,temp,arrow1);
	you.transparent = 1;
	you.passable = 1;
	you.overlay = 1;
	you.flare = 1;
	you.tilt +=180;
	temp.x = Explosion_Posx[2];
	temp.y = Explosion_Posy[2];
	temp.z = Explosion_Posz[2];
	create(<health2.mdl>,temp,room_boom);
	you.transparent = 1;
	you.passable = 1;
	you.overlay = 1;
	you.bright = 1;
	temp.z += 50;
	create(<arrow.mdl>,temp,arrow1);
	you.transparent = 1;
	you.passable = 1;
	you.overlay = 1;
	you.flare = 1;
	you.tilt +=180;
	temp.x = Explosion_Posx[3];
	temp.y = Explosion_Posy[3];
	temp.z = Explosion_Posz[3];
	create(<health2.mdl>,temp,room_boom);
	you.transparent = 1;
	you.passable = 1;
	you.overlay = 1;
	you.bright = 1;
	temp.z += 50;
	create(<arrow.mdl>,temp,arrow1);
	you.transparent = 1;
	you.passable = 1;
	you.overlay = 1;
	you.flare = 1;
	you.tilt +=180;
	temp.x = Explosion_Posx[4];
	temp.y = Explosion_Posy[4];
	temp.z = Explosion_Posz[4];
	create(<health2.mdl>,temp,room_boom);
	you.transparent = 1;
	you.passable = 1;
	you.overlay = 1;
	you.bright = 1;
	temp.z += 50;
	create(<arrow.mdl>,temp,arrow1);
	you.transparent = 1;
	you.passable = 1;
	you.overlay = 1;
	you.flare = 1;
	you.tilt +=180;
}
function Eventboomr()
{
	if(event_type == event_push && you._type != _type_player) { return; }
	
	my.event=0;
	temp.pan = 360;
	temp.tilt =360;
	temp.z = 200;//1000;
	indicator = CarAccedant;
	scan (my.x,my_angle,temp);
	Show_Explosion_pos();
	Boom_Num = 4;
	Ammo_panel.visible = 1;
	indicator = 0;
	object2.visible = 1;
	object2.skin = 3;
	ShowMessage(5,287);
	Play_My_Sounds(49,0);
	SoldersPointer(1);
	Game_State[0] = 4;
	my.invisible=1;
	MisionsMsg5.ambient = -100;
	MisionsMsg6.visible=1;
	wait(50);
	ShowMessionsAuto();
	//SoldersGroupCreation(1);
	//SoldersGroupCreation(1);
	SoldersGroupCreation1(2);
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
	my.scale_x=2;
	my.scale_y=2;
	my.scale_z=2;
	while (1)
	{
		if (eplhealth){	return;	}
		wait(1);
	}
}
function arrow_event()
{
	if (event_type==event_scan)&&(indicator == CarAccedant)
	{
		remove me;
		return;
	}

}
action arrow1
{
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.scale_x=0.1;
	my.scale_y=0.1;
	my.scale_z=0.1;
	my.event = arrow_event;
	while (1)
	{
		my.pan += 10*(speed/200);
		wait(1);
	}
}


action room_boom	//for part one
{
	wait(100);
	sonar me,4000;
	my.z -= result;
	my.skill6 = 0.1;
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event=boom_event1;
	my.skin = 4;
	while (1)
	{
		if (eplhealth){	return;	}
		if (game_state[0] > 95)
		{remove me;
		break;
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
		if (my.skill19 > 100)&&(vec_dist(my.pos,player.pos)<100)
		{
			my.skill19 =0;
			showmessage(5,317);
		}
		my.skill19 +=1*(speed/200);
		wait(1);
	}

}
function BaldozarExplosion()
{
	exclusive_entity;
	var oldz;
	oldz=my.z;
	my.z+=50;
	you = my.RightWheel;
	remove you;
	morph <exbldozar.mdl>,me;
	explosionscale = 0.75;
	create( <dust.mdl>, my.pos,AtomicExplosion);
	play_entsound( me, MallaExplosion, 1000000);
	while (1)
	{
		my.z-=5;
		if (my.flag8 == 0)
		{my.roll -=10;my.flag8=1;camera.roll+=1.5;
		}else
		{my.roll +=10;my.flag8=0;camera.roll-=1.5;
		}
		if (my.z == oldz)
		{break;
		}
		wait(1);
	}
	my.z+=25;
	while (1)
	{
		my.z-=5;
		if (my.flag8 == 0)
		{my.roll -=10;my.flag8=1;camera.roll-=1.8;
		}else
		{my.roll +=10;my.flag8=0;camera.roll+=1.8;
		}
		if (my.z == oldz)
		{break;
		}
		wait(1);
	}
	my.entity1 = Pointer_To_Entity( my.LeaderId);
	remove my.entity1;
	camera.roll=0;
	my.frameanim = 0;
	if (game_state[0] == 107)
	{
		game_state[0] =-75;
		wait(30);
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
	}
	while (my.frameanim <10000)
	{
		my.frameanim += 0.2;
		temp.x = 255;
		temp.y = 255;
		temp.z = 128;
		my_angle.x = 50-random(100);
		my_angle.y = 50-random(100);
		my_angle.z = -random(12);
		vec_add( my_angle, my.pos);
		effect( BlackMinismokeup, 1, my_angle, temp);	
		wait(1);
	}
}


function SmokeFromBaldozar(cme,PushForce)
{
	me  = cme;
	vec_for_vertex( temp, me, 121);
	temp.x += random(25)-10;
	temp.y += random(25)-10;
	temp.z += random(25)+10;
	my_angle.x = -(random(10)+  5)*PushForce;
	my_angle.y =  (random(1)- 0.5)*PushForce;
	my_angle.z =  (random(1)+ 0.5)*PushForce;
	vec_rotate( my_angle, my.pan);
	effect( BigBlacksmoke_Trail1, 1, temp, my_angle);
}


function Baldozar()
{
	my.passable = 1;
	while (1)
	{
		temp.x= my._target_x - my.x;
		temp.y= my._target_y - my.y;
		temp.z= my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,20);								
		temp.x = speed/50;		
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector);
		if (int(random(100))>75)
		{SmokeFromBaldozar(me, 3);
		}
		if (vec_dist(my.x ,my._target_x ) < 60)
		{
			if (my.flag1 == 1)
			{
				temp.x = Explosion_Posx[1];
				temp.y = Explosion_Posy[1];
				temp.z = Explosion_Posz[1];
				//create( <xplosion.mdl>, temp, ExplosionsTga);
				create( <dust.mdl>, temp,AtomicExplosion);
				temp.x = Explosion_Posx[2];
				temp.y = Explosion_Posy[2];
				temp.z = Explosion_Posz[2];
				//create( <xplosion.mdl>, temp, ExplosionsTga);
				create( <dust.mdl>, temp,AtomicExplosion);
				BaldozarExplosion();
				//my.unlit = 1;
				break;
			}
			else
			{
				temp.x = Explosion_Posx[3];
				temp.y = Explosion_Posy[3];
				temp.z = Explosion_Posz[3];
				//create( <xplosion.mdl>, temp, ExplosionsTga);
				create( <dust.mdl>, temp,AtomicExplosion);
				temp.x = Explosion_Posx[4];
				temp.y = Explosion_Posy[4];
				temp.z = Explosion_Posz[4];
				//create( <xplosion.mdl>, temp, ExplosionsTga);
				create( <dust.mdl>, temp,AtomicExplosion);
				BaldozarExplosion();
				//my.unlit = 1;
				break;
			}
		}
		wait(1);
	}
}


function Baldozar1()
{
	my.flag1 = 1;
	temp.x = -2038;
	temp.y =  135;
	temp.z =  30;
	vec_set(my._target_x,temp);
	Baldozar();
}

function Baldozar2()
{
	wait(225);
	temp.x = -2068;
	temp.y = -1703;
	temp.z =  30;
	vec_set(my._target_x,temp);
	Baldozar();
}

function ShowBldozar()
{
	temp.x = -3101;
	temp.y =  182;
	temp.z =  55;
	create(<Bldozar.mdl>,temp,Baldozar1);
	temp.x = -3689;
	temp.y = -1663;
	temp.z =  55;
	create(<Bldozar.mdl>,temp,Baldozar2);
}
action TheBaldozar
{
	wait(100);
	game_state[0] = 107;
	my.passable = 1;
	my.max_x *= 2.0;
	my.max_y *= 1.5;
	my.max_z *= 1.2;
	CollisionOffset.x = 50;
	CollisionOffset.y = 0;
	CollisionOffset.z = 25;
	my.CollFunction  = Function_To_Pointer( "MerkavaCollision");
	my.enable_detect = 1;
	my.enable_scan = 1;
	my._type = TypeOfEngines;
	AddColl(my);
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = merkavaevent;
	temp.x =-1589;
	temp.y =-1342;
	temp.z = 35;
	vec_set(my._target_x,temp);
	while (1)
	{
		if (my._health <-100)
		{
			BaldozarExplosion();
			return;
		}
		vec_set( point_move.x, my._target_x);
		if ( EDistance( point_move, me)<50) 
		{
			me=0;
			Kick_Action=0;
			MissionFailed();
			break;
		}
		my.force = nearnumber( my.force, 10, 0.1);
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = 0;
		vec_to_angle( my_angle, temp);
		my.pan = nearangle( my.pan, my_angle, 5);
		temp.x = speed/50;
		temp.y = 0;
		sonar me, 40000;
		temp.z = -result;
		move( me, temp, nullskill);
		my.FrameAnim +=0.5;
		my.skin = int(frc(my.FrameAnim/5)*5);
		wait(1);
	}
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
		my.pan = nearangle(my.pan,my_angle,5);
		my.tilt = my_angle.tilt;			
		temp.x = 0;
		temp.y = 0;
		temp.z = 50;
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);
		vec_set(camera.pos,temp);
		//camera.pan = my.pan;
		temp.x = speed/30;		
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector);
		if (vec_dist(my.x ,my._target_x ) < 60)
		{
			result = ent_nextpoint(my._target_x);
			if (result == 2)||(result == 4)
			{wait(235);
			}
			if (result == 5)
			{
				clip_range = 2500;
				camra2player = 1;
				InitInput();
				ShowHiddedThing();
				game_state[0] = 102;
				temp.x = -3689;
				temp.y = -1663;
				temp.z =  55;
				MisionsMsg7.visible=1;
				ShowMessionsAuto();
				ShowMessage(5,281);
				Play_My_Sounds(51,0);
				create(<Bldozar.mdl>,temp,TheBaldozar);
				SoldersGroupCreation1(2);
				SoldersGroupCreation1(3);
/*				temp.x = Explosion_Posx[1];
				temp.y = Explosion_Posy[1];
				temp.z = Explosion_Posz[1];
				create(<ckm16.mdl>,temp,SoldColl);
				you.skill6 = 18;
				you.skill8 = 3;
				you.skill7 = 0;
				temp.x = Explosion_Posx[2];
				temp.y = Explosion_Posy[2];
				temp.z = Explosion_Posz[2];
				create(<ckm16.mdl>,temp,SoldColl);
				you.skill6 = 18;
				you.skill8 = 3;
				you.skill7 = 0;
				temp.x = Explosion_Posx[3];
				temp.y = Explosion_Posy[3];
				temp.z = Explosion_Posz[3];
				create(<ckm16.mdl>,temp,SoldColl);
				you.skill6 = 18;
				you.skill8 = 3;
				you.skill7 = 0;*/
				temp.x =-1726;
				temp.y =-532;
				temp.z = 25;
				create(<Mallala.mdl>,temp,car4wheelauto);
				you.skill1 = 19;
			}
		}
		wait(1);
	}	
}

function Auto_Camera()
{
	Boom_Num = game_state[0];
	Ammo_panel.visible = 0;
	object2.visible = 0;
	game_state[0] = 95;
	wait(10);
	clip_range = 5000;
	ZoomOut();
	HideEveryThing(0);
	ShowBldozar();
	camra2player = 0;
	temp.x = -1220;
	temp.y =  242;
	temp.z =  750;
	camera.pan = 170;
	camera.tilt = -25;
	create(<point1.mdl>,temp,CameraCarier);
	removeAllkeys();
	my.invisible = 1;
	my.passable = 1;
	player.z -= 100;
	temp.x=-115;
	temp.y=-910;
	temp.z=35;
	you = Pointer_To_Entity( player.BodyLnk);
	vec_set(you.pos,temp);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function RunerCreate()
{
	//wait(50);
	if (Game_State[0] > 1)||(RunerExist == 1)//||(SolderCounter < 2)
	{return;
	}
/*	if (int(random(3)) > 1)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		vec_set(RunerPos,temp);
		RunerExist.y = 2;
	}
	else
	{
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		vec_set(RunerPos,temp);
		RunerExist.y = 1;
	}*/
	create(<ckm16.mdl>,RunerPos,RunToGeneral);
	you.skill7=RunerExist.y;
	return;
}
function SoldersGroupCreation(Tpos)
{
	if (Tpos == 1)
	{
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =1;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =2;
		you.Grenader = 0;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =3;
		you.Grenader = 1;
/*		create(<cklmg.mdl>,temp,SsnipRun);
		you.shadow = shadowenable;
		you.skill7 =101;*/
		wait(100);
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =1;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =2;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =3;
		you.Grenader = 0;
		vec_set(RunerPos,temp);
		RunerExist.y=1;
		RunerCreate();
		return;
	}
	if (Tpos == 2)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =4;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =5;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =6;
		you.Grenader = 0;
/*		create(<cklmg.mdl>,temp,SsnipRun);
		you.shadow = shadowenable;
		you.skill7 =102;*/
		vec_set(RunerPos,temp);
		RunerExist.y=2;
		RunerCreate();
		wait(100);
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =4;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =5;you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =6;
		you.Grenader = 0;
		return;
	}
	if (Tpos == 3)
	{
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =7;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =8;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =9;
		you.Grenader = 0;
/*		create(<cklmg.mdl>,temp,SsnipRun);
		you.shadow = shadowenable;
		you.skill7 =103;*/
		vec_set(RunerPos,temp);
		RunerExist.y=3;
		RunerCreate();
		wait(100);
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =7;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =8;you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =9;
		you.Grenader = 0;
		return;
	}
}
function SoldersGroupCreation1(Tpos)
{
	if (Tpos == 1)
	{
		temp.x=SoldersPosx[3];	
		temp.y=SoldersPosy[3];	
		temp.z=SoldersPosz[3];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =10;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =11;
		you.Grenader = 0;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =12;
		you.Grenader = 1;
		return;
	}
	if (Tpos == 2)
	{
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =1;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =2;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =3;
		you.Grenader = 0;
		return;
	}
	if (Tpos == 3)
	{
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =7;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =8;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =9;
		you.Grenader = 0;
		return;
	}
	if (Tpos == 4)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =4;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =5;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =6;
		you.Grenader = 0;
		return;
	}
}

function SoldersPointer(Tpos)
{
	if (Tpos == 1)
	{
		temp.x=DirectionPosx[0];	
		temp.y=DirectionPosy[0];	
		temp.z=DirectionPosz[0];
		vec_set(objectposition,temp);
		return;
	}
	if (Tpos == 2)
	{
		temp.x=DirectionPosx[1];	
		temp.y=DirectionPosy[1];	
		temp.z=DirectionPosz[1];
		vec_set(objectposition,temp);
		return;
	}
	if (Tpos == 3)
	{
		temp.x=DirectionPosx[2];	
		temp.y=DirectionPosy[2];	
		temp.z=DirectionPosz[2];
		vec_set(objectposition,temp);
		return;
	}
	if (Tpos == 4)
	{
		temp.x=DirectionPosx[3];	
		temp.y=DirectionPosy[3];	
		temp.z=DirectionPosz[3];
		vec_set(objectposition,temp);
		return;
	}
}
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
function StartLevel()
{
	Ammo_panel.visible = 0;
	wait(25);
	bullettarget=player.bodylnk;
	Generator = 0;
	object2.visible = 0;
	Boom_Num = 4;
	object1.skin = 3;
	object2.skin = 3;
	object3.skin = 3;
	object4.skin = 3;
	MisionsMsg1.visible=0;
	MisionsMsg2.visible=1;
	MisionsMsg3.visible=0;
	MisionsMsg4.visible=0;
	MisionsMsg5.visible=0;
	MisionsMsg6.visible=0;
	MisionsMsg7.visible=0;
	MisionsMsg8.visible=0;
	ShowMessionsAuto();
	ShowMessage(5,274);
	Play_My_Sounds(41,0);
	Game_State[0] = 0 ;
	wait(90);
	ShowMessage(5,277);
	//Game_State[0] = 6;
	game_time=400;
	while (1)
	{
		
		//test_num1 = Game_State[0];
		test_num2 = Game_State[1];
		test_num3 = SolderCounter;
		test_num4 = GroupExist;

		if (Game_State[0]==-73)
		{return;
		}
		if (game_state[0] == 4)||(game_state[0] == 5)
		{
			game_time-=sys_seconds/500;
			test_num1 = game_time;
			if (game_time < 100)
			{
				if (game_time < 50)
				{
					if (game_time < 25)
					{my.SoundWR+=14;
					}
					else
					{my.SoundWR+=7;
					}
				}
				else
				{my.SoundWR+=3;
				}
				if ( my.SoundWR>0)
				{ play_sound(SolderApproch1,5000);
				my.SoundWR=-100; }
			}
		}
		if (Game_State[0] == 0)&&(Game_State[1] == 0)
		{
			SoldersGroupCreation(2);
			GroupExist=1;
			if (Game_State[0]==-73)
			{return;
			}
			wait(200);
			ShowMessage(5,298);
			Play_My_Sounds(58,0);
			SoldersPointer(2);
			Game_State[0]=1;
			Game_State[1]=1;
			//wait(25);
			goto getout;
		}
		if (Game_State[0] == 1)&&(GroupExist == 0)
		{
			if (Game_State[1] == 2)
			{
				SoldersGroupCreation(1);
				GroupExist=1;
				wait(100);
				ShowMessage(5,306);
				Play_My_Sounds(56,0);
				SoldersPointer(1);
				goto getout;
			}
			if (Game_State[1] == 3)
			{
				SoldersGroupCreation(3);
				GroupExist=1;
				wait(100);
				ShowMessage(5,292);
				Play_My_Sounds(55,0);
				SoldersPointer(3);
				goto getout;
			}
		}
		if (Game_State[0] == 2)
		{
			Game_State[0] = 3;
			ShowMessage(5,296);
			Play_My_Sounds(45,0);
			MisionsMsg2.ambient = -100;
			MisionsMsg5.visible=1;
			ShowMessionsAuto();
			SoldersPointer(4);
			temp.x = Explosion_Posx[0];
			temp.y = Explosion_Posy[0];
			temp.z = Explosion_Posz[0];
			create(<health2.mdl>,temp,box_boom1);
			//you.passable = 1;
			temp.z += 50;
			create(<arrow.mdl>,temp,arrow1);
			you.transparent = 1;
			you.passable = 1;
			you.overlay = 1;
			you.flare = 1;
			you.tilt +=180;
			SoldersGroupCreation1(1);
//			wait(130);
//			ShowMessage(5,288);
//			Play_My_Sounds(47,0);
			goto getout;

		}
		if (Game_State[0] == 6)
		{Auto_Camera();Game_State[0] = 7;
		}
		if (player.x > -1400)&&(game_state[0] == 5)
		{game_state[0] = 6;
		}
		if( game_time.x < 0 )&&(game_state[0] < 7)
		{
				if (Game_State[0] == -73)
				{return;
				}
				if (game_state[0] == 4)
				{ShowMessage(5,316);
				}
				if (game_state[0] == 5)
				{ShowMessage(5,315);
				}
				me = 0;
				Game_State[0]=100;
				//Play_My_Sounds(14,0);
				wait(50);
				MissionFailed();
				break;
		}
		getout:
		wait(1);
	}

}
//////////////////////////////////////////////////////////////////////////////////////////////////////
function RunerNextPoint()
{	
	RunerPoint = ent_nextpoint(my._target_x);
	if (RunerState == 0)&&(RunerPoint == 8)
	{
		showmessage(5,311);
		wait(15);
		ent_path("RunerIn");
		ent_waypoint(my._target_x,1);
		RunerState = 1;
		RRuner();
		return;
	}
	if (RunerState == 1)&&(RunerPoint == 10)
	{
		showmessage(5,304);
		Play_My_Sounds(15,0);
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

	if (event_type == event_shoot && indicator == _gunfire)
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
			
			object5.visible=0;
			RunerState=0;
			RunerExist=0;
			RunerCreate();
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
		
		}
		if (game_state[0] > 2)
		{my._health-=1000;
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
	object5.visible=0;
	RunerState=0;
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
	my.WeaponNumber = m4;
	my.DieEvent = Function_To_Pointer( "RunerDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	if (RunerExist.y == 1)
	{ent_path("Runer1");
	}
	if (RunerExist.y == 2)
	{ent_path("Runer2");
	}
	if (RunerExist.y == 3)
	{ent_path("Runer3");
	}
	ent_waypoint(my._target_x,1);
	RRuner();
}

/////////////////////////////////////////////////////////////////////////
function SRunerNextPoint()
{	
	if (ent_nextpoint(my._target_x) == 5)
	{
		if (my.skill7 == 101)||(my.skill7 == 102)||(my.skill7 == 103)
		{//my.EnemyId = player.bodylnk;
			my.skill6 = 19;
			my.skill8 = 7;
			LmgWait();
		}
		else
		{
			//SolderWait();
			my.skill7 = 0;
			my.EnemyId = player.bodylnk;
			PathToEnemy();
		}
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
	{
		my.ScaleCollision = 1;
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
	if (my.skill7 == 3)
	{ent_path("Spath3");
	}
	if (my.skill7 == 4)
	{ent_path("Spath4");
	}
	if (my.skill7 == 5)
	{ent_path("Spath5");
	}
	if (my.skill7 == 6)
	{ent_path("Spath6");
	}
	if (my.skill7 == 7)
	{ent_path("Spath7");
	}
	if (my.skill7 == 8)
	{ent_path("Spath8");
	}
	if (my.skill7 == 9)
	{ent_path("Spath9");
	}
	if (my.skill7 == 10)
	{ent_path("Spath10");
	}
	if (my.skill7 == 11)
	{ent_path("Spath11");
	}
	if (my.skill7 == 12)
	{ent_path("Spath12");
	}
	ent_waypoint(my._target_x,1);
	SRuner();

}


function SsnipRun()
{
	SolderCounter+=1;
	if ( my.ScaleCollision<=0)
	{
	my.ScaleCollision = 1;
	}
	my.WeaponNumber = m4;


	wait(10);

	my.VertexCount = GetVertexNum(me)-20;

	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);

	my.passable = 1;
	my.epassable = 0;
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.event = Lmgsolderevent;
	my._type = _type_soldier;

	my.DieEvent = Function_To_Pointer( "SolderDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer( "TraceCollision");
	my.WeaponNumber = m4;

	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimDie = 0;
	my.AnimShot  = IGunFire  ;
	//my.skill8=3;
	if (my.skill7 == 101)
	{ent_path("Ssnipe1");
	}
	if (my.skill7 == 102)
	{ent_path("Ssnipe2");
	}
	if (my.skill7 == 103)
	{ent_path("Ssnipe3");
	}
	ent_waypoint(my._target_x,1);
	SRuner();
}


//////////////////////////////////////////////////////////////////////

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
	while (1)
	{
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
		wait(100);
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
////////////////////////////////////////////////////////////////////////////////////////
function testlight()
{
		
//	my.scale_x = 0.05;
//	my.scale_y = 0.05;
//	my.scale_z = 0.05;
	while (1)
	{
		my.lightrange = int(random(50))+125;
		if (my.flag5 == 0)		
		{	
			
			my.red = 240;
			my.green = 155;
			my.blue = 35;									
			my.flag5 = 1;
		}
/*		else
		{
			//my.lightrange = 120;
			my.red =247;
			my.green= 196;
			my.blue =128;
			my.flag5 = 0;
		}*/			
		wait(int(random(4))+3);
	}

}


function testlight1()
{
	my.skin = 2;	
	my.light = 0;
	my.scale_x = 0.2;
	my.scale_y = 0.2;
	my.scale_z = 0.2;
	my.passable = 1;
//	my.light = 1;
//	my.flare = 1;
//	my.visible = 0;
	while (1)
	{
		temp.x=5;
		temp.y=0;
		temp.z=0;
		my_angle.pan=random(360);
		my_angle.tilt=random(360);
		vec_rotate(temp,my_angle);
		vec_add(temp,my.pos);
		effect(BigBlacksmoke_Trail,1,temp,temp2);

		//my.ambient = int(random(10))+10;
		sonar(me,10000);
		if (result < 20)
		{break;
		}
		my.z -= 4;
		my.lightrange = max(255,result);
		if (my.flag5 == 0)		
		{	my.skin = 1;
			my.y +=int(random(4));
			my.z +=int(random(4));
			my.red = 240;
			my.green = 155;
			my.blue = 35;									
			my.flag5 = 1;
		}
		else
		{
			my.skin = 2;
			my.y -=int(random(4));
			my.z -=int(random(4));
			//my.lightrange = 120;
			my.red =247;
			my.green= 196;
			my.blue =128;
			my.flag5 = 0;
		}			
		wait(1);
	}
	remove me;

}


function RandomLighting()
{
	var boom_location;
	camera.fog = 35;
	while (1)
	{
		boom_location = int(random(10));
		temp.x = BoomPosX[boom_location];
		temp.y = BoomPosy[boom_location];
		temp.z = BoomPosz[boom_location];
		create(<boly.mdl>,temp,testlight1);
		//create(<Hala.MDL>,temp,dust_explosion);
		boom_location = int(random(5))+5;
		temp.x = BoomPosX[boom_location];
		temp.y = BoomPosy[boom_location];
		temp.z = BoomPosz[boom_location];
		create(<boly.mdl>,temp,testlight1);
		//create(<Hala.MDL>,temp,dust_explosion);
		wait(100);
	}

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
var ahmed_state=0;
var ahmed_point;
var H_counter =0;

/*
function AhmedMessage()
{	
	var reanmessage = 0;
	wait(350);
	while (1)
	{
		if (Game_State[0] == 100)
		{break;
		}
		reanmessage=int(random(4));
		if (reanmessage == 0)&&(Game_State[0]<3)
		{play_entsound(me,S_M_L6_26,2000);
		}
		if (reanmessage == 1)&&(Game_State[0]<3)
		{play_entsound(me,S_M_L6_34,2000);
		}
		if (reanmessage == 2)&&(Game_State[0]<3)
		{play_entsound(me,S_M_L6_35,2000);
		}
		if (reanmessage == 3)&&(Game_State[0]<3)
		{play_entsound(me,S_M_L6_45,2000);
		}
		wait(501);
	}
}*/
function AhmedNextPoint()
{	
	ahmed_point = ent_nextpoint(my._target_x);
	if (ahmed_point == 7)&&(ahmed_state ==0)
	{
		ahmed_state = 1;
		ent_path("Ahmed_At_Roof");
		ahmed_point = 1;
		ent_waypoint(my._target_x,1);
	}
	if (ahmed_state == 1)
	{
		if (ahmed_point == 3)||(ahmed_point == 4)||(ahmed_point == 7)||(ahmed_point == 8)
		{
			if (ahmed_point == 3)
			{my.pan = 40;
			}
			if (ahmed_point == 4)
			{my.pan = 310;
			}
			if (ahmed_point == 7)
			{my.pan = 220;
			}
			if (ahmed_point == 8)
			{my.pan = 140;
			}
			my.FrameAnim = 0;
			H_counter = 0;
			while (H_counter < 100)
			{
				if (int(random(100))>90)
				{	play_entsound( me, s99_fire_sound, 1000);
					ent_cycle("1shot",80);
				}
				else
				{ent_cycle("1shot",0);
				}
				
				//my.FrameAnim += 10;
				H_Counter + =1;
				wait(1);
			}

		}
	}
endo1:	AhmedRun();
}

function AhmedRun()
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
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/35;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan=nearangle(my.pan,my_angle.pan,50);
		temp.x = speed/35;
		temp.y = 0;
		temp.z = 0;
		move( my, temp, nullskill);
		sonar(my,500);                		
		my.z = target.z +abs(my.min_z);
		if (vec_dist(my.x ,my._target_x ) < 50)
		{break;
		}		
		wait(1);
	}
	AhmedNextPoint();
}


action Ahmed
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = m4;
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	my.wieght = 50;
	my.AnimWalk = AllAnimations[ IWalkFront   ];
	my.AnimRun  = AllAnimations[ IRunFront    ];
	my.AnimShot = AllAnimations[ IUpSnipFire  ];
	my.AnimDie = LonelyAnimat[ 0];
	my.z-=CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	my.epassable = 0;
	my._health = 0;
	my.GotHit = 0;
	my._type = _type_compars;
	my.AnimRun = 1;
	my._signal = 0;
	//AhmedMessage();
	ent_path("Ahmed_To_Roof");
	ent_waypoint(my._target_x,1);
	AhmedRun();
}

//////////////////////////////////////////////////////////////////////
