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
	AHldSld.visible = 0;
	AHldBk.visible = 0;
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
	ObjecPos.visible = 1;
	ObjecPos1.visible = 1;
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
	PreesEnter.visible = 1;
	splashscreen.visible = 1;
	freeze_mode = 1;
}

function endGame()
{
	ZoomOut();
	HideEveryThing();
	morph HintPage,splashscreen;
	morph EnterButum,PreesEnter;
	//splashscreen.visible = on;
	//PreesEnter.visible = 1;
	Kick_Action = 0;
	MovieOrSucess = 1;
	VictoryScream();
	play_loop VictoryPlayer, 100;
	h_VictoryPlayer = result;
	RemoveAllKeys();
	on_enter = finalization;
	//PreesNextLvl.visible = 1;
	Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
}

function followplayer()
{
	wait(50);
	object5.skin = 7;
	my._type = _type_player1;
	FollowingP = Entity_To_Pointer(me);
	my.skill17 = 0;
	while (1)
	{
		//test_num1 = SnipersCount;
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
			temp.z = 500;//1000;
			indicator = _handle;
			scan (my.x,my_angle,temp);
		}
		wait(1);
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function BaldozarExplosion()
{
	exclusive_entity;
	var oldz;
	oldz=my.z;
	my.z+=50;
	you = my.RightWheel;
	remove you;
	//morph <exsafari.mdl>,me;
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
	my.skill1= 0;
	while (my.skill1 < 500)
	{
		my.z -=0.2;
		my.skill1 += 1;
		wait(1);
	}
	remove me;
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


function BaldozarLight()
{			
	my.passable = 1;
	my.tilt = 90;	
	my.scale_z = 20;		
	my.scale_x = 4;
	my.scale_y = 4;
	my.bright = 1;
	my.lightrange = 50;
	my.red = 155;
	my.green = 100;
	my.blue = 50;
	while (1)
	{
		my.pan += 5;
		wait(1);
	}
}

function SetBaldozarThings()
{
	
	vec_for_vertex(temp,my,121);
	you = pointer_to_entity(my._MyCoverPlaneLight);
	vec_set(you.pos,temp);
	//you.pan = my.pan-195;
/*	vec_for_vertex(temp,my,361);
	you = pointer_to_entity(my._MyCoverPlaneTailLight);
	vec_set(you.pos,temp);*/
	//you.pan = my.pan-165;
	
}

function DestroyBaldozarLights()
{
	you = pointer_to_entity(my._MyCoverPlaneLight);
	remove you;
//	you = pointer_to_entity(my._MyCoverPlaneTailLight);
//	remove you;
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
//		SetBaldozarThings();
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
//				DestroyBaldozarLights();
				BaldozarExplosion();
				my.unlit = 1;
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
//				DestroyBaldozarLights();
				BaldozarExplosion();
				my.unlit = 1;
				break;
			}
		}

		
		wait(1);
	}

}


function Baldozar1()
{
	my.flag1 = 1;
//	vec_for_vertex(temp,my,121);
//	create(<nlight.mdl>,temp,BaldozarLight);
//	my._MyCoverPlaneLight = entity_to_pointer(you);
/*	vec_for_vertex(temp,my,361);
	create(<nlight.mdl>,temp,BaldozarLight);
	my._MyCoverPlaneTailLight= entity_to_pointer(you);*/
	temp.x = -2038;
	temp.y =  135;
	temp.z =  30;
	vec_set(my._target_x,temp);
	Baldozar();

}
function Baldozar2()
{
	wait(225);
//	vec_for_vertex(temp,my,121);
//	create(<nlight.mdl>,temp,BaldozarLight);
//	my._MyCoverPlaneLight = entity_to_pointer(you);
/*	vec_for_vertex(temp,my,361);
	create(<nlight.mdl>,temp,BaldozarLight);
	my._MyCoverPlaneTailLight= entity_to_pointer(you);*/
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
	game_state[0] = 21;
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
	ZoomOut();
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
				game_state[0] = 22;
				temp.x = -3689;
				temp.y = -1663;
				temp.z =  55;
				MisionsMsg3.ambient=-100;
				MisionsMsg4.visible=1;
				ShowMessionsAuto();
				ShowMessage(5,262);
				//Play_My_Sounds(10,0);
				wait(150);
				SoldersPointer(4);
				EngenerGroupCreation(4);
				RunerExist.z = 1;
				temp.x =-4676;
				temp.y =-1160;
				temp.z = 100;
				create(<AptchiDPart.mdl>,temp,AptchiBeva);
				break;
			}
		}

		wait(1);
	}	
}

function Auto_Camera()
{
	if (player.x > -1400)
	{
		me = player;
		clip_range = 5000;
		game_state[0] = 20;
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
		player.z -= 500;
		temp.x=-1037;
		temp.y=-1503;
		temp.z=35;
		you = Pointer_To_Entity( player.BodyLnk);
		vec_set(you.pos,temp);
		return;
	}
	else
	{
		ShowMessage(5,315);
		me = 0;
		Game_State[0]=-75;
		wait(5);
		MissionFailed();
		return;
	}

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function EngenerGroupCreation(Tpos)
{test_num2 += 1;
	RunerExist = 0;
	if (Tpos == 1)
	{
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		create(<vkm16.mdl>,temp,RunToGeneral);
		you.skill7 =1;
		you.skill6 = 1;
		create(<lbm16.mdl>,temp,RunToGeneral);
		you.skill7 =2;
		you.skill6 = 15;
		create(<ckm16.mdl>,temp,RunToGeneral);
		you.skill7 =3;
		you.skill6 = 18;
		ShowMessage(5,258);
		Play_My_Sounds(12,0);
		return;
	}
	if (Tpos == 2)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<vkm16.mdl>,temp,RunToGeneral);
		you.skill7 =4;
		you.skill6 = 1;
		create(<lbm16.mdl>,temp,RunToGeneral);
		you.skill7 =5;
		you.skill6 = 15;
		create(<ckm16.mdl>,temp,RunToGeneral);
		you.skill7 =6;
		you.skill6 = 18;
		ShowMessage(5,266);  
		Play_My_Sounds(11,0);
		return;
	}
	if (Tpos == 3)
	{
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		create(<vkm16.mdl>,temp,RunToGeneral);
		you.skill7 =7;
		you.skill6 = 1;
		create(<lbm16.mdl>,temp,RunToGeneral);
		you.skill7 =8;
		you.skill6 = 15;
		create(<ckm16.mdl>,temp,RunToGeneral);
		you.skill7 =9;
		you.skill6 = 18;
		ShowMessage(5,259);  
		Play_My_Sounds(13,0);
		return;
	}
	if (Tpos == 4)
	{
		temp.x=SoldersPosx[3];	
		temp.y=SoldersPosy[3];	
		temp.z=SoldersPosz[3];
		create(<vkm16.mdl>,temp,RunToGeneral);
		you.skill7 =10;
		you.skill6 = 1;
		create(<lbm16.mdl>,temp,RunToGeneral);
		you.skill7 =11;
		you.skill6 = 15;
		create(<ckm16.mdl>,temp,RunToGeneral);
		you.skill7 =12;
		you.skill6 = 18;
		ShowMessage(5,265);  
		Play_My_Sounds(14,0);
		return;
	}

}
function SComparsGroupCreation(Tpos)
{
	if (Tpos == 1)
	{
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =1;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =2;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =3;
		wait(100);
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =1;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =2;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =3;
		return;
	}
	if (Tpos == 2)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =4;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =5;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =6;
		wait(100);
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =4;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =5;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =6;
		return;
	}
	if (Tpos == 3)
	{
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =7;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =8;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =9;
		wait(100);
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =7;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =8;
		create(<ckm16.mdl>,temp,SComparsRuner);
		you.shadow = shadowenable;
		you.skill7 =9;
		return;
	}
}

function SShotGroupCreation(Tpos)
{
	if (Tpos == 1)
	{
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =1;
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =2;
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =3;
		return;
	}
	if (Tpos == 2)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =4;
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =5;
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =6;
		return;
	}
	if (Tpos == 3)
	{
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =7;
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =8;
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =9;
		return;
	}
	if (Tpos == 4)
	{
		temp.x=SoldersPosx[3];	
		temp.y=SoldersPosy[3];	
		temp.z=SoldersPosz[3];
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =10;
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =11;
		create(<ckm16.mdl>,temp,Israil);
		you.shadow = shadowenable;
		you.skill7 =12;
		return;
	}
}

function SoldersPointer(Tpos)
{
	test_num3=Tpos;
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
	if (Tpos == 5)
	{
		//vec_set(objectposition,null);
		objectposition = null;
		return;
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////
function testPlane(num)
{
	GroupExist=1;
	PlaneNum=num;
	if (num == 1)
	{
		temp.x=-4693;
		temp.y=-1191;	
		temp.z=100;
	}
	else
	{
		temp.x=2225;
		temp.y=1132;	
		temp.z=100;
	}
	vec_set(PlanePos,temp);
	create(<plane.mdl>,PlanePos,CarryerAuto);
}
///////////////////////////////////////////////////////////////////////////////////////////////////
function StartLevel()
{
	//Ammo_panel.visible = 0;
	wait(25);
	Generator = 0;
	object2.visible = 0;
	Boom_Num = 4;
	object1.skin = 3;
	object2.skin = 3;
	object3.skin = 3;
	object4.skin = 3;
	MisionsMsg1.visible=1;
	MisionsMsg2.visible=0;
	MisionsMsg3.visible=0;
	MisionsMsg4.visible=0;
	MisionsMsg5.visible=0;
	MisionsMsg6.visible=0;
	MisionsMsg7.visible=0;
	MisionsMsg8.visible=0;
	ShowMessionsAuto();
	ShowMessage(5,241);
	Play_My_Sounds(1,0);
	wait(50);
	ShowMessage(5,244);
	Play_My_Sounds(2,0);
	Game_State[0] = 5;
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	bullettarget=player.bodylnk;
	//Auto_Camera();
	//EngenerGroupCreation(4);
	//RunerExist.z = 1;
	//ShowBldozar();
	//testPlane(1);
	while (1)
	{
		
		if (Game_State[0]==-73)
		{return;
		}
		if (player.x > 600)||(player.x < -1800)||(player.y > 0)
		{
			ShowMessage(5,255);
			Play_My_Sounds(17,0);
			//	for test
			game_state[0] = 11;
			//
			wait(200);
			if (Game_State[0]==-73)
			{return;
			}
			if (player.x > 700)||(player.x < -1900)||(player.y > 100)
			{
				me=0;
				ShowMessage(5,270);
				Play_My_Sounds(18,0);
				game_state[0] = 100;
				wait(15);
				Kick_Action=0;
				MissionFailed();
			}
		}
		if (Game_State[0] == 6)&&(GroupExist == 0)
		{testPlane(1);
		}

		if (Game_State[0] == 7)&&(GroupExist == 0)
		{testPlane(2);
		}
/*		if (Game_State[0] == 8)&&(GroupExist == 0)
		{testPlane(1);
		}
		if (Game_State[0] == 9)&&(GroupExist == 0)
		{testPlane(2);
		}*/

		getout:
		wait(1);
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////
function PlaceExplosion()
{
	if (my.skill6 == 15)
	{morph(<Engener.MDL>,me);
	}
	
	my.skill1=0;
	while (my.skill1<100)
	{
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "PlaceExplosion");
			break;
		}
		if (my.skill6 == 15)
		{ent_frame( "PLACEING" , my.skill1);
		}
		else
		{ent_frame( "stnd" , my.skill1);
		}
		my.skill1 += 2*speed/200;
		wait(1);
	}
	my.skill1 = 0;
	while (my.skill1<300)
	{
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "PlaceExplosion");
			break;
		}
		if (my.skill6 == 15)
		{ent_frame( "MAINES" , my.skill1);
		}
		else
		{ent_frame( "stnd" , my.skill1);
		}
		my.skill1 += 2*speed/200;
		wait(1);
	}
	my.skill1 = 0;
	while (my.skill1<100)
	{
		if (SoldCheckIfHealthy())
		{ 
		        my.LastState = Function_To_Pointer( "PlaceExplosion");
			break;
		}
		if (my.skill6 == 15)
		{ent_frame( "STAND" , my.skill1);
		}
		else
		{ent_frame( "stnd" , my.skill1);
		}
		my.skill1 += 2*speed/200;
		wait(1);
	}
	if (SoldCheckIfHealthy())
	{ 
	        my.LastState = Function_To_Pointer( "PlaceExplosion");
		return;
	}
	if (my.skill6 == 15)
	{morph(<lbm16.MDL>,me);
	}
	showmessage(5,250);
	Play_My_Sounds(16,0);
	wait(15);
	me=0;
	Kick_Action=0;
	MissionFailed();
	return;

}
function RunerNextPoint()
{	
	RunerPoint = ent_nextpoint(my._target_x);
	if (my.skill7 == 3)||(my.skill7 == 6)||(my.skill7 == 9)||(my.skill7 == 12)
	{
		if (RunerPoint == 3)
		{
			my.skill6 = 19;
			my.skill8 = 7;
			my.event = Lmgsolderevent;
			my._type = _type_soldier;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.HitEvent = Function_To_Pointer( "SolderHit");
			my.CollFunction = Function_To_Pointer( "TraceCollision");
			LmgWait();
			goto endrunerpopint;
	
		}
	}
	if (RunerPoint == 8)
	{
		PlaceExplosion();
/*		showmessage(5,250);
		Play_My_Sounds(16,0);
		wait(15);
		me=0;
		Kick_Action=0;
		MissionFailed();*/
		return;
	}
	else
	{RRuner();
	}
	endrunerpopint: return;
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
//		if (game_state[0] > 2)
//		{my._health-=1000;
//		}
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
	RunerExist += 1;
	if (RunerExist == 2)
	{
		if (RunerExist.z == 1)
		{
			SoldersPointer(3);
			EngenerGroupCreation(3);
			RunerExist.z = 2;
			goto endruner;
		}
		if (RunerExist.z == 2)
		{
			SoldersPointer(2);
			EngenerGroupCreation(2);
			RunerExist.z = 3;
			goto endruner;
		}
		if (RunerExist.z == 3)
		{
			SoldersPointer(1);
			EngenerGroupCreation(1);
			RunerExist.z = 4;
			goto endruner;
			
		}
		if (RunerExist.z == 4)
		{
			endGame();
		}
	}
	endruner:
	remove me;
}


action RunToGeneral
{
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
	my.WeaponNumber = m16;
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
	my.WeaponNumber = my.skill8;


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
	my.WeaponNumber = m16;

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

function KahledFlash()
{
	play_entsound(my,ak_fire_sound,100);
	Short_GunFlash(me,5, 9);	
	vec_for_vertex ( p, my, 33);
	p2.x = 10000;
	p2.y = 0;
	p2.z = 0;
	my_angle.pan = my.pan + random(20)-10;
	my_angle.tilt = random(20)-10;
	vec_rotate( p2, my_angle);
	vec_add( p2, my.pos);
	Blt_Line();
}

function KahledShot(RandDist)
{
	you = pointer_to_entity( my.enemyid);
	vec_set(FirstPoint , my.x);
	if (you != null )
	{
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle;
		//damage = Weap_damage[my.weaponnumber -1];  
		damage = 2;
		SecondPoint.x = RandDist;
		SecondPoint.y = 0;
		SecondPoint.z = 0;
		my_angle.x = random(360);
		my_angle.y = random(360);
		vec_rotate( SecondPoint, my_angle);
		SecondPoint.x +=  you.x - my.x;
		SecondPoint.y +=  you.y - my.y;
		SecondPoint.z +=  you.z - my.z + my.EnemyHeight;
		vec_to_angle( my_angle, SecondPoint);
	}else
	{
		my_angle.x = random(10)-5;
		my_angle.y = random(10)-5;
		vec_add( my_angle, my.pan);
	
	}

	SecondPoint.x =  10000;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, FirstPoint);
	my.epassable = 1;
	gun_shot_Damge();
	my.epassable = 0;
}


function TestAhmedDistance()
{
	//test_num2 +=1;
	while (1)
	{
		if (game_state[0] > 19)
		{break;
		}
		if (vec_dist(my.pos,player.pos) < 300)
		{
			if (game_state[0] < 8)
			{
				showmessage(5,312);
				Play_My_Sounds(23,0);
			}
			else
			{
				showmessage(5,313);
				Play_My_Sounds(24,0);
			}
			wait(300);
			if (vec_dist(my.pos,player.pos) < 300)
			{
				me = 0;
				showmessage(5,250);
				Play_My_Sounds(16,0);
				//showmessage(5,145);
				wait(15);
				Kick_Action=0;
				MissionFailed();
				break;
			}
		}
		wait(1);
	}
}

function KahledPlacingboom()
{
	my.skill1=0;
	morph(<KpBoom.mdl>,me);
	while (my.skill1<100)
	{
		ent_frame( "GETSTON" , my.skill1);
		my.skill1 += 2*speed/200;
		wait(1);
	}
	KahledRun();
	morph(<khak.mdl>,me);

}
function KahledNextPoint()
{	
	Kahled_point = ent_nextpoint(my._target_x);
	if (Kahled_point == 10)&&(Kahled_state ==0)
	{
		TestAhmedDistance();
		Kahled_state = 1;
		ent_path("KahledInGroundFloor");
		Kahled_point = 1;
		ent_waypoint(my._target_x,1);
	}
	if (Kahled_point == 23)&&(Kahled_state ==1)
	{
		ShowMessage(5,256);
		Play_My_Sounds(6,0);
		wait(10);
		Kahled_state = 2;
		game_state[0] = 9;
		MisionsMsg1.ambient = -100;
		MisionsMsg3.visible=1;
		ShowMessionsAuto();
		ent_path("KahledOutBilding");
		Kahled_point = 1;
		ent_waypoint(my._target_x,1);
	}
	if (Kahled_state == 2)
	{
		AHldSld.visible = 1;
		AHldBk.visible = 1;
//		if (Kahled_point == 15)
//		{morph(<KpBoom.mdl>,me);
//		}
		if (Kahled_point == 5)
		{	SoldersPointer(4);
			ShowMessage(5,267); 
			Play_My_Sounds(7,0);
			SShotGroupCreation(4);
		}
		if (Kahled_point == 8)
		{
			SoldersPointer(2);
			ShowMessage(5,245); 
			Play_My_Sounds(20,0);
			SShotGroupCreation(2);
		}
		if (Kahled_point == 19)
		{
			SoldersPointer(1);
			ShowMessage(5,248); 
			Play_My_Sounds(8,0);
			SShotGroupCreation(1);
		}
		if (Kahled_point == 24)
		{
			SoldersPointer(3);
			ShowMessage(5,267); 
			Play_My_Sounds(7,0);
			SShotGroupCreation(3);
		}
		if (Kahled_point == 21)
		{
			KahledPlacingboom();
			goto endo2;
		}
		if (Kahled_point == 27)
		{
			//SoldersPointer(5);
			KahledPlacingboom();
			goto endo2;
		}
		if (Kahled_point == 28)
		{
			ShowMessage(5,249);
			Play_My_Sounds(9,0);
			wait(5);
			goto endo1;
		}
		if (Kahled_point == 29)
		{
			ShowMessage(5,314);
			wait(5);
			goto endo1;
		}

		if (Kahled_point == 32)
		{
			remove me ;
			while (1)
			{
				test_num1+=1;
				if (test_num1 > 100)||(player.x > -1400)
				{
					Auto_Camera();
					break;
				}
				wait(1);
			}
			
			goto endo2;
		}
	}
	if (Kahled_state == 1)
	{
		if (Kahled_point == 5)||(Kahled_point == 17)||(Kahled_point == 21)
		{
			if (Kahled_point == 5)
			{my.pan = 5;SComparsGroupCreation(2);
			}
			if (Kahled_point == 17)
			{my.pan = 165;SComparsGroupCreation(1);
			}
			if (Kahled_point == 21)
			{my.pan = 230;SComparsGroupCreation(3);
			}
			my.FrameAnim = 0;
			Kahledwait:
			H_counter = 0;
			while (H_counter < 400)
			{
				if (int(random(10))>5)
				{
					//play_entsound( me, ak_fire_sound, 500);
					//Short_GunFlash( me, 5, 9); 
					KahledFlash();
					KahledShot(500);
				}
				ent_cycle("3shot",my.FrameAnim);	
				my.FrameAnim += 10;
				H_Counter + =1;
				wait(1);
			}
			//if (Kahled_point == 21)&&(game_state[0] < 10)
			//{goto Kahledwait;
			//}

		}
	}
endo1:	KahledRun();
endo2:	return;
}

function KahledRun()
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
		test_num6 = my._health;
		test_num4 = Kahled_state;
		test_num5 = Kahled_point;
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("KahledRun");
			return;
		}
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/35;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan=nearangle(my.pan,my_angle.pan,50);
		temp.x = speed/25;
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
	KahledNextPoint();
}
function KahledEvent()
{

	if (event_type == event_scan) && (indicator == _explode)&&(you._type == _type_soldier)
	{	
		my._health-=1000;
		my.GotHit = 100;
		return;
	}

	if (event_type == event_shoot) && (indicator == _gunfire )//&&(you._type != _type_player)
	{ 
		//entiy = Pointer_To_Entity( player.BodyLnk);
		//if (you == entiy)
		//{return;
		//}
		my._health -= 5;
		my.GotHit = 100;
	}
}

function KahledDie()
{
	morph(<khdie.mdl>,me);
	death_sound(100);
	ShowMessage(5,303); 
	Play_My_Sounds(22,0);
	RemoveColl(me);
	my.skill1=0;
	while (my.skill1<100)
	{
		ent_frame( LonelyAnimat [ my.AnimDie ] , my.skill1);
		my.skill1 += 10*speed/200;
		wait(1);
	}
	me = 0;
	Kick_Action=0;
	MissionFailed();
}
function KahledHit()
{
	my._state = _state_hit;
	my.GotHit=50;
	while (1)
	{
		if (my.GotHit==50)
		{
			Hitter_sound(2000);
		}
		if (my._health <-200)
		{
			Pointer_To_Function( my.DieEvent, 0, 0, 0);
			return;
		}
		my.GotHit = nearnumber( my.GotHit, 0, 1*speed/100);
		AHldSld.u =max(my._health*8/25,-64);
		ent_frame( "Fhit", 100-frc(my.GotHit/50)*100);
		if (my.GotHit==0)
		{
		 break;
		}
		wait(1);
	}
	Pointer_To_Function( my.LastState, 0, 0, 0);
}

action Kahled
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = m16;
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
	my._type = _type_compars;
	my.event = KahledEvent;
	my.DieEvent = Function_To_Pointer("KahledDie");
	my.HitEvent = Function_To_Pointer("KahledHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	ent_path("KahledToGroundFloor");
	ent_waypoint(my._target_x,1);
	KahledRun();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//		Israil Solders shot on Kahled
	      //-----------------------------//
function IsrailEvent()
{
	if (event_type == event_shoot && indicator == _gunfire && you._type == _type_player)
	{ 
		my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
	if ((event_type == event_detect) && (you._type == _type_compars))
	{
		my.EnemyId = Entity_To_Pointer( you);
		if(CheckVisEnemy(196)==1) 
		{			
			my._signal = _detecte_enemy;
			you= Pointer_To_Entity( my.EnemyId); 
			you.Enemy_Count += 1;
		}
		else
		{my.EnemyId = null;
		}
		return;
	}
}


function IsrailDie()
{
	morph (  <ckdie.mdl>, me);
	death_sound(100);
	RemoveColl(me);
	my.skill1=0;
	while (my.skill1<100)
	{
		ent_frame( LonelyAnimat [ my.AnimDie ] , my.skill1);
		my.skill1 += 10*speed/200;
		wait(1);
	}
	my.skill1=0;
	while (my.skill1<20)
	{
		my.skill1 += 0.3*speed/200;
		wait(1);
	}
	remove me;
}

function IsrailFlash()
{
	play_entsound(my,AhmedShot,500);
	Short_GunFlash(me,60, 44);	
	vec_for_vertex ( p, my, 33);
	p2.x = 10000;
	p2.y = 0;
	p2.z = 0;
	my_angle.pan = my.pan + random(20)-10;
	my_angle.tilt = random(20)-10;
	vec_rotate( p2, my_angle);
	vec_add( p2, my.pos);
	Blt_Line();
}

function IsrailShot(RandDist)
{
	you = pointer_to_entity( my.enemyid);
	vec_set(FirstPoint , my.x);
	if (you != null )
	{
		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = my_angle;
		//damage = Weap_damage[my.weaponnumber -1];  
		damage = 2;
		SecondPoint.x = RandDist;
		SecondPoint.y = 0;
		SecondPoint.z = 0;
		my_angle.x = random(360);
		my_angle.y = random(360);
		vec_rotate( SecondPoint, my_angle);
		SecondPoint.x +=  you.x - my.x;
		SecondPoint.y +=  you.y - my.y;
		SecondPoint.z +=  you.z - my.z + my.EnemyHeight;
		vec_to_angle( my_angle, SecondPoint);
		ShotAndDamage(50,1,1,60);

	}else
	{
		my_angle.x = random(10)-5;
		my_angle.y = random(10)-5;
		vec_add( my_angle, my.pan);
	
	}

	SecondPoint.x =  10000;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, FirstPoint);
	my.epassable = 1;
	gun_shot_Damge();
	//ShotEffect();
	my.epassable = 0;
}
function Israil_Wait()
{
	var NumShot = 0;
	my.FrameAnim = 0;
	my.FrameAnim = 0;
	my.skill6 = 0;
	if (my.flag1== 0)
	{ent_cycle("7shot" ,my.FrameAnim );
	}
	else
	{ent_cycle("2shot" ,my.FrameAnim );
	}
	while (1)
	{
		if (game_state[0] >19 )
		{my._Health = -1000;
		}
		if (vec_dist(my.pos,player.pos) < 250)
		{
			temp.x = Solder_posx[my.skill8+6];
			temp.y = Solder_posy[my.skill8+6];
			temp.z = Solder_posz[my.skill8+6];
			create(<ckm16.mdl>,temp,Israil);
			you.skill6 = my.skill8;
			you.skill7 = my.skill8;
			if (my.flag1 == on)
			{you.flag1 = on;
			}
			else
			{you.flag1 = off;
			}
			my.weaponnumber = m4;
			my.skill6 = 18;	
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
		
		}

		if (NumShot < 8)
		{
			my.FrameAnim += speed/5;
			if (my.FrameAnim > 100)
			{
				 my.FrameAnim = 0;
				 IsrailFlash();
				 IsrailShot(100);
			}
			you = pointer_to_entity( my.enemyid);
			if (you == null)
			{
				temp.pan = 180;
				temp.tilt = 180;
				temp.z = 2500;
				indicator = _watch;
				scan (my.x,my.pan,temp);
			}
			else
			{
				if(CheckVisEnemy(196)==1) 
				{
				IsrailShot(100);
				}
				else
				{my.enemyid = null;
				}
			}
			NumShot += 1*(speed/200);
		}
		else
		{
			NumShot += 1*(speed/200);
			NumShot.y = my.pan;
			if (my.flag8 == 1)&&(NumShot.z > 10)
			{
				my.pan = 110;
				ent_cycle("3run" ,my.FrameAnim );
				my.FrameAnim+=speed/25;
				if (my.FrameAnim > 100)
				{my.FrameAnim = 0;
				}
				if (my.skill6 == 0)
				{temp.y = speed/50;
				}
				else
				{temp.y = -speed/50;
				}
				
				temp.x = 0;
				temp.z = 0;
				my.z-=CheckTheFLoor(4000);
				move( my, temp, nullskill);
			}
		}
		if (NumShot.z > 10)
		{my.flag7 = 1;
		}
		else
		{my.flag7 = 0;
		}
		if (NumShot > 50)
		{
			NumShot=0;
			NumShot.z = int(random(20));
			if (my.flag7 == 1)
			{
				if (my.skill6 == 0)
				{my.skill6 = -1;
				}
				else
				{my.skill6 = 0;my.pan=NumShot.y;
				}
			}
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("Israil_Wait");
			return;
		}				
		wait(1);
	}
}
function IsrailRun()
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
			temp.x = Solder_posx[my.skill8+6];
			temp.y = Solder_posy[my.skill8+6];
			temp.z = Solder_posz[my.skill8+6];
			create(<ckm16.mdl>,temp,Israil);
			you.skill6 = my.skill8;
			you.skill7 = my.skill8;
			if (my.flag1 == on)
			{you.flag1 = on;
			}
			else
			{you.flag1 = off;
			}
			my.weaponnumber = m4;
			my.skill6 = 18;	
			my.event = solderevent;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
		
		}
		if (my.passable == 0)
		{my.passable = 1;
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("IsrailRun");
			return;
		}				
		if (vec_dist(my.x ,my._target_x ) < 25)
		{
			if (ent_nextpoint(my._target_x) == 4)
			{Israil_Wait();break;
			}
		}		
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/50;
		if (my.FrameAnim > 100)
		{my.FrameAnim = 0;
		}
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		//my.pan=nearangle(my.pan,my_angle.pan,50);
		my.pan = my_angle.pan;
		temp.x = speed/35;
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		wait(1);
	}
}

action Israil
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = lmg;
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
	my.event = IsrailEvent;
	my.DieEvent = Function_To_Pointer("IsrailDie");
	my.HitEvent = Function_To_Pointer("KahledHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
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
	IsrailRun();
	return;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//		Israil Soldiers run&die infront Kahled
	      //---------------------------------------//  
function SCRuner()
{
	var SCPoint = 0;
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if (game_state[0] >19 )
		{my._Health = -1000;
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
		if (vec_dist(my.x ,my._target_x ) < (int(random(75))+25))
		{
			SCPoint = ent_nextpoint(my._target_x);
			if (int(random(100)) > 80)&&(SCPoint > 3)
			{Pointer_To_Function( my.DieEvent, 0, 0, 0);break;
			}
			if (SCPoint == 8)
			{Pointer_To_Function( my.DieEvent, 0, 0, 0);break;
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
		temp.x = speed/25;
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		wait(1);
	}
}


action SComparsRuner
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = lmg;
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
	my.event = IsrailEvent;
	my.DieEvent = Function_To_Pointer("IsrailDie");
	//my.HitEvent = Function_To_Pointer("KahledHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
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
	ent_waypoint(my._target_x,1);
	SCRuner();

}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
