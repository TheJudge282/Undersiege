
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

function GroupLed()
{
	my.EnemyId = player.bodylnk;
	SoldColl();
	wait(20);
	create(<ckm16.mdl>,my.pos,SldAnyLeader);
	return;
}
function GeneralSerach()
{
	my.skill6=18;
	my.skill7=1;
	my.skill8=3;
	SoldColl();
	return;

}
////////////////////////////////////////////////////////////////////////
function RunerCreate()
{
	//wait(50);
	if (Game_State[0] > 3)||(RunerExist == 1)//||(SolderCounter < 2)
	{return;
	}
	if (int(random(3)) > 1)
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
	}
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
		create(<cklmg.mdl>,temp,SsnipRun);
		you.shadow = shadowenable;
		you.skill7 =101;
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
		create(<cklmg.mdl>,temp,SsnipRun);
		you.shadow = shadowenable;
		you.skill7 =102;
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
		create(<ckm16.mdl>,temp,SolderRuner);
		you.skill7 =8;
		you.shadow = shadowenable;
		temp.x=SoldersPosx[3];	
		temp.y=SoldersPosy[3];	
		temp.z=SoldersPosz[3];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.skill7 =9;
		you.shadow = shadowenable;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.skill7 =10;
		you.shadow = shadowenable;
		temp.x=SoldersPosx[4];	
		temp.y=SoldersPosy[4];	
		temp.z=SoldersPosz[4];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.skill7 =11;
		you.shadow = shadowenable;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.skill7 =12;
		you.shadow = shadowenable;
		vec_set(RunerPos,temp);
		RunerExist.y=3;
		RunerCreate();
		return;
	}
	if (Tpos == 4)
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
		create(<cklmg.mdl>,temp,SsnipRun);
		you.shadow = shadowenable;
		you.skill7 =101;
		vec_set(RunerPos,temp);
		RunerExist.y=1;
		RunerCreate();
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
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =6;
		you.Grenader = 1;
		create(<cklmg.mdl>,temp,SsnipRun);
		you.shadow = shadowenable;
		you.skill7 =102;
		vec_set(RunerPos,temp);
		RunerExist.y=2;
		RunerCreate();
		wait(100);
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =2;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =3;
		you.Grenader = 1;
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =4;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =5;
		you.Grenader = 1;
		create(<ckm16.mdl>,temp,SolderRuner);
		you.shadow = shadowenable;
		you.skill7 =6;
		return;
	}
	if (Tpos == 5)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		create(<ckm16.mdl>,temp,GroupLed);
		you.shadow = shadowenable;
		vec_set(RunerPos,temp);
		RunerCreate(3);
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		create(<ckm16.mdl>,temp,GroupLed);
		you.shadow = shadowenable;
		vec_set(RunerPos,temp);
		RunerCreate(2);
		return;
	}
	
}
function SoldersPointer(Tpos)
{
	if (Tpos == 1)
	{
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		vec_set(objectposition,temp);
		return;
	}
	if (Tpos == 2)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		vec_set(objectposition,temp);
		return;
	}
	if (Tpos == 3)
	{
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		vec_set(objectposition,temp);
		return;
	}
	if (Tpos == 4)
	{
		temp.x=SoldersPosx[0];	
		temp.y=SoldersPosy[0];	
		temp.z=SoldersPosz[0];
		vec_set(objectposition,temp);
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		vec_set(objectposition1,temp);
		return;
	}
	if (Tpos == 5)
	{
		temp.x=SoldersPosx[1];	
		temp.y=SoldersPosy[1];	
		temp.z=SoldersPosz[1];
		vec_set(objectposition,temp);
		temp.x=SoldersPosx[2];	
		temp.y=SoldersPosy[2];	
		temp.z=SoldersPosz[2];
		vec_set(objectposition1,temp);
		return;
	}
	if (Tpos == 6)
	{
		objectposition1=null;
		temp.x=221;	
		temp.y=540;	
		temp.z=1000;
		vec_set(objectposition,temp);
		return;
	}
	if (Tpos == 7)
	{
		objectposition1=null;
		temp.x=-1736;	
		temp.y=515;	
		temp.z=1000;
		vec_set(objectposition,temp);
		return;
	}
	if (Tpos == 8)
	{
		objectposition1=null;
		temp.x=-1800;	
		temp.y=-1162;	
		temp.z=1000;
		vec_set(objectposition,temp);
		return;
	}
	
}


////////////////////////////////////////////////////////////////////////

function starte_level()
{
	wait(50);
	Game_State[0]=0;
	ShowMessage(5,162);
	Play_My_Sounds(19,0);
	MisionsMsg1.visible=0;
	MisionsMsg2.visible=0;
	MisionsMsg3.visible=0;
	MisionsMsg4.visible=0;
	MisionsMsg5.visible=0;
	MisionsMsg6.visible=1;
	MisionsMsg7.visible=0;
	MisionsMsg8.visible=0;
	ShowMessionsAuto();
	object4.skin=7;
	object4.visible=0;
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	while (1)
	{
		if (Game_State[0]==-73)
		{return;
		}
		if ((player.x > 1400)||(player.y < -2000))&&(game_state[0] < 100)
		{
			ShowMessage(5,165);
			Play_My_Sounds(29,0);
			wait(500);
			if (Game_State[0]==-73)
			{return;
			}
			if (player.x > 1400)||(player.y < -2000)
			{
				me=0;
				game_state[0] = 100;
				showmessage(5,185);
				wait(15);
				Kick_Action=0;
				MissionFailed();
			}
		}
		if (Game_State[0] == 0)&&(Game_State[1] == 0)
		{
			SoldersGroupCreation(1);
			GroupExist=1;
			if (Game_State[0]==-73)
			{return;
			}
			wait(200);
			ShowMessage(5,168);
			Play_My_Sounds(20,0);
			SoldersPointer(1);
			Game_State[0]=1;
			Game_State[1]=1;
			//wait(25);
			goto getout;
		}
		if (Game_State[0] == 1)&&(GroupExist == 0)
		{
			if (Game_State[1] == 2)
			{
				SoldersGroupCreation(2);
				GroupExist=1;
				//wait(100);
				ShowMessage(5,164);
				Play_My_Sounds(21,0);
				SoldersPointer(2);
				goto getout;
			}
			if (Game_State[1] == 3)
			{
				SoldersGroupCreation(3);
				GroupExist=1;
				//wait(100);
				ShowMessage(5,167);
				Play_My_Sounds(22,0);
				SoldersPointer(3);
				goto getout;
			}
		}
		if (Game_State[0] == 2)&&(GroupExist == 0)
		{
			SoldersGroupCreation(4);
			GroupExist=1;
			//wait(100);
			ShowMessage(5,168);
			Play_My_Sounds(20,0);
			wait(75);
			ShowMessage(5,164);
			Play_My_Sounds(21,0);
			SoldersPointer(4);
			goto getout;
		}
		if (Game_State[0] == 3)&&(GroupExist == 0)
		{
			game_state[5]=100;
			ShowMessage(5,176);
			Play_My_Sounds(36,0);
			wait(10);
			MisionsMsg6.ambient=-100;
			//MisionsMsg7.visible=1;
			ShowMessionsAuto();
			wait(75);
			temp.x=-413;
			temp.y=900;
			temp.z=255;
			//create(<Hala.MDL>,temp,dust_explosion_harmless);moa
			game_state[5]=101;
			//play_sound(grenadex,10000);
			ShowMessage(5,173);
			wait(75);
			ShowMessage(5,139);
			wait(150);
			ShowMessage(5,140);
			Game_State[0]=4;
			goto getout;
		}
		if (Game_State[0] == 4)
		{
			Game_State[0]=5;
			objectposition1=null;
			objectposition=null;
			//temp.x=3919;
			//temp.y=1361;	
			//temp.z=300;
			temp.x=2920;
			temp.y=-3700;	
			temp.z=800;
			create(<aptchidpart.mdl>,temp,AptchiBeva);
			you.pan = 90; 

		}
		if (Game_State[0] == 6)&&(GroupExist == 0)
		{
			GroupExist=1;
			PlaneNum=1;
			temp.x=3919;
			temp.y=1361;	
			temp.z=300;
			vec_set(PlanePos,temp);
			create(<plane.mdl>,PlanePos,CarryerAuto);
			Play_My_Sounds(34,0);
			wait(150);
			ShowMessage(5,166);
			Play_My_Sounds(27,0);
			SoldersPointer(6);
			MisionsMsg7.ambient=-100;
			MisionsMsg8.visible=1;
			ShowMessionsAuto();
			goto getout;
		}
		if (Game_State[0] == 7)&&(GroupExist == 0)
		{
			Game_State[0]=8;
			GroupExist=1;
			PlaneNum=2;
			temp.x=-5767;
			temp.y=-626;	
			temp.z=1040;
			vec_set(PlanePos,temp);
			create(<plane.mdl>,PlanePos,CarryerAuto);
			SoldersPointer(7);
			goto getout;
		}
		if (GazPazokanum.z == 100)
		{
			//WhiteScreen.visible = 1;
			//WhiteScreen.alpha=0;
			while (1)
			{
				BlackScreen.alpha+=1;
				camera.roll+=0.5;
				if (BlackScreen.alpha>35)
				{GazPazokanum.z = -100;break;}
				wait(1);
			}

		}
		if (GazPazokanum.z == -100)
		{
			while (1)
			{
				BlackScreen.alpha-=1;
				camera.roll-=0.5;
				if (BlackScreen.alpha<15)
				{GazPazokanum.z = 100;break;}
				wait(1);
			}

		}
/*		if (Game_State[0] == 8)&&(GroupExist == 0)
		{
			GroupExist=1;
			PlaneNum=3;
			temp.x=-4979;
			temp.y=-2794;	
			temp.z=1040;
			vec_set(PlanePos,temp);
			create(<plane.mdl>,PlanePos,CarryerAuto);
			SoldersPointer(8);
			goto getout;
		}
		if (Game_State[0] == 9)
		{
			Play_My_Sounds(28,0);
			ShowMessage(5,158);
			wait(75);
			game_state[0] = 100;
			temp.x = 2625;
			temp.y =962 ;
			temp.z = 690;
			create(<ckm16.MDL>,temp,thrower);
			wait(25);
			temp.x = -4364;
			temp.y =-589 ;
			temp.z = 1350;
			create(<ckm16.MDL>,temp,thrower);	
	
		}
		if (EndExplosion == 2)
		{
			wait(75);
			Kick_Action = 0;
			//game_state[0] = 100;
			temp.x = 5;
			temp.y = 0;
			temp.z = 0;
			vec_rotate(temp,player.pan);
			temp.x += player.x;
			temp.y += player.y;
			temp.z += player.z;
			create(<Hala.MDL>,temp,TimedGazExp);
			//create( <xplosion.mdl>, my.pos, ExplosionsTga);
			Play_My_Sounds(35,0);
			ShowMessage(5,186);
			wait(55);
			stop_sound(SoundIsPlaying);
			play_sound VictoryPlayer, 100;
			h_VictoryPlayer = result;
			RemoveAllKeys();
			on_enter = finalization;
			PreesNextLvl.visible = 1;
			Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));
		}*/
		getout:
		wait(1);
	}

}

function followplayer()
{
	wait(50);
	//Game_State[0]=1;
	FollowingP = Entity_To_Pointer(me);
	my.skill17 = 0;
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
				object4.visible=1;
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
				object4.visible=0;
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

///////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function MariemMessage()
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
		{play_entsound(me,S_M_L6a_18,5000);
		}
		if (reanmessage == 1)&&(Game_State[0]<3)
		{play_entsound(me,S_M_L6a_19,5000);
		}
		if (reanmessage == 2)&&(Game_State[0]<3)
		{play_entsound(me,S_M_L6a_25,5000);
		}
		if (reanmessage == 3)&&(Game_State[0]<3)
		{play_entsound(me,S_M_L6a_26,5000);
		}
		wait(501);
	}
}

function MariemNextPoint()
{	
//	if (game_state[0] > 3)
//	{remove me;return;
//	}
	Mareim_Point = ent_nextpoint(my._target_x);
	if (Mareim_Point == 41)&&(Marem_State ==0)
	{
		Marem_State = 1;
		ent_path("Mariem_RunOut");
		Mareim_Point = 1;
		ent_waypoint(my._target_x,1);
		my.pan=90;
		while (1)
		{
			if (game_state[5]==101)
			{
				break;
			}
			my.FrameAnim = 0;
			H_counter = 0;
			play_entsound( me, s99_fire_sound, 200);
			while (H_counter < 20)
			{
				ent_cycle("2shot",my.FrameAnim);
				my.FrameAnim += 2;
				H_Counter + =1;
				wait(1);
			}
			wait(1);
		}
	}
	if (Mareim_Point == 9)&&(Marem_State ==1)
	{
		ShowMessage(5,180);
		Play_My_Sounds(24,0);
		MisionsMsg6.ambient=-100;
		MisionsMsg7.visible=1;
		ShowMessionsAuto();
		wait(10);
		morph <mrsnp.mdl>,me;
		my.pan = 300;
		while (1)
		{
			if (my._health<-200)
			{
				EndMareim();
				return;;
			}
			if (Game_State[0] > 5)
			{
				break;
			}
			my.FrameAnim = 0;
			H_counter = 0;
			Short_GunFlash( me, 26, 18); 
			play_entsound( me, s99_fire_sound, 200);
			while (H_counter < 20)
			{
				ent_cycle("1shot",my.FrameAnim);
				my.FrameAnim += 2;
				H_Counter + =1;
				wait(1);
			}

			wait(1);
		}
		
	}
	if (Mareim_Point == 17)&&(Marem_State ==1)
	{
		remove(me);
		return;
	}
endo1:	MaremRun();
}

function EndMareim()
{
	game_state[0] = -100;
	Play_My_Sounds(25,0);
	morph <mrdie.mdl>,me;
	while (my.skill1<100)
	{
		ent_frame( "head" , my.skill1);
		my.skill1 += 10*speed/700;
		wait(1);
	}
	//wait(25);
	showmessage(5,179);
	wait(75);
	play_sound( PlDed,100);
	h_PlDed = result;
	me=0;
	Kick_Action=0;
	MissionFailed();
}
function MaremRun()
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
		if (my._health<-200)
		{
			EndMareim();
			return;
		}
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/25;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		//my.pan=my_angle.pan;
		my.pan=nearangle(my.pan,my_angle.pan,35);
		if (Marem_State == 1)
		{temp.x = speed/35;
		}
		else
		{temp.x = speed/25;
		}
		
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		if (vec_dist(my.x ,my._target_x ) < 50)
		{break;
		}		
		wait(1);
	}
	MariemNextPoint();
}

action mariem
{
	//wait(1300);
	//my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	my.VertexCount = GetVertexNum(me)-20;
	my.WeaponNumber = m16;
	wait(10);
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	//my.passable = 1;
	my.shadow = shadowenable;
	my.wieght = 50;
	wait(20);
	my.AnimWalk = IWalkFront;
	my.AnimRun  = IRunFront;
	my.AnimShot = IUpSnipFire;
	my.AnimDie =  0;
	my.enable_detect = 1;
	my.enable_scan = 1;
	my.z-=CheckTheFLoor(4000);
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	AddColl(me);
	//my.epassable = 0;
	my._health = 0;
	my.GotHit = 0;
	my._type = _type_compars1;
	//my.event = MariemEvent;
	//my.DieEvent = AhmedDie;
	//my.HitEvent = AhmedDie;
	//my.CollFunction =Function_To_Pointer(" TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	bullettarget=entity_to_pointer(me);
	//MariemMessage();
	//AhmedScanForPlayer();
	ent_path("path_001");
	ent_waypoint(my._target_x,1);
	MaremRun();
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

function ComparsDie()
{
	death_sound(100);
	my._state = _state_die;
	RemoveColl(me);
	me = 0;
	if (game_state[5] < 100)
	{
		Play_My_Sounds(15,0);
		showmessage(5,145);
		wait(15);
		Kick_Action=0;
		MissionFailed();
		remove(me);
	}
}
function Comparsevent()
{
	if event_type == event_scan && indicator == _explode
	{
	
		my._health-=1000;
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		showmessage(5,184);
		wait(10);
		HeartPlayer( 5 );
		my._health -= 25;
		wait(25);
	}
}

function man_help_boy()
{
	my.FrameAnim = 0;
	while (1)
	{
		if (game_state[5] == 100)
		{my._health-=1000;
		}
		while(1)
		{
			if ( my.SoundWR==0)
			{ play_entsound(me,ComparsHeart,100);
			my.SoundWR=-100; }
			my.SoundWR+=1;
			ent_cycle("hearting", my.FrameAnim);
			my.FrameAnim += speed/50;
			if (my.FrameAnim == 100)
			{break;
			}
			wait(1);
		}
		my.FrameAnim = 0;
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = man_help_boy;
			return;
		}				
		wait(1);
	}


}

action AllCompars
{
	my.passable = 1;
	if ( my.ScaleCollision<=0)
	{my.ScaleCollision = 1;
	}
	wait(10);
	my.VertexCount = GetVertexNum(me)-20;
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	//my.passable = 1;
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
	my._type = _type_player1;
	my.event = Comparsevent;
	my.DieEvent = Function_To_Pointer("ComparsDie");
	my.HitEvent = Function_To_Pointer("ComparsDie");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	man_help_boy();
	return;
}


/////////////////////////////////////////////////////////////////////////////////

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
	if (boom < 200)
	{HeartPlayer(5000/boom);
	}

	if (my.skill6 == 1)&&(my.flag8 == 0)
	{
		morph <wal01s.wmb>,me;my.flag8=1;
		create( <wall01.mdl>, my.pos, WallParts);
	}
	if (my.skill6 == 2)&&(my.flag8 == 0)
	{
		morph <wal02s.wmb>,me;my.flag8=1;
		create( <wall02.mdl>, my.pos, WallParts);
	}
	if (my.skill6 == 3)&&(my.flag8 == 0)
	{
		morph <wal03s.wmb>,me;my.flag8=1;
		create( <wall03.mdl>, my.pos, WallParts);
	}
	if (my.skill6 == 4)&&(my.flag8 == 0)
	{
		morph <wal04s.wmb>,me;my.flag8=1;
		create( <wall04.mdl>, my.pos, WallParts);
	}
	if (my.skill6 == 5)&&(my.flag8 == 0)
	{
		morph <wal05s.wmb>,me;my.flag8=1;
		create( <wall05.mdl>, my.pos, WallParts);
	}
	if (my.skill6 == 6)&&(my.flag8 == 0)
	{
		morph <wal06s.wmb>,me;my.flag8=1;
		create( <wall06.mdl>, my.pos, WallParts);
	}
	if (my.skill6 == 7)&&(my.flag8 == 0)
	{
		morph <wal07s.wmb>,me;my.flag8=1;
		create( <wall07.mdl>, my.pos, WallParts);
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

function ExplosionWalls()
{
	my._type = _type_elevator;
	wait(50);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	while (1)
	{
		if ((my._health<-100)&& (my.flag8==0))
		{
			vec_set( normal, my.pan);
			normal.x -= 90;
			create( <xplosion.mdl>, my.x, ExplodedWall);
			if (my.skill6 == 1)
			{
				morph <wal01s.wmb>,me;
				create( <wall01.mdl>, my.pos, WallParts);
			}
			if (my.skill6 == 2)
			{
				morph <wal02s.wmb>,me;
				create( <wall02.mdl>, my.pos, WallParts);
			}
			if (my.skill6 == 3)
			{
				morph <wal03s.wmb>,me;
				create( <wall03.mdl>, my.pos, WallParts);
			}
			if (my.skill6 == 4)
			{
				morph <wal04s.wmb>,me;
				create( <wall04.mdl>, my.pos, WallParts);
			}
			if (my.skill6 == 5)
			{
				morph <wal05s.wmb>,me;
				create( <wall05.mdl>, my.pos, WallParts);
			}
			if (my.skill6 == 6)
			{
				morph <wal06s.wmb>,me;
				create( <wall06.mdl>, my.pos, WallParts);
			}
			if (my.skill6 == 7)
			{
				morph <wal07s.wmb>,me;my.flag8=1;
				create( <wall07.mdl>, my.pos, WallParts);
			}
			my.flag8 = 1;
		}

		if (vec_dist(my.pos,player.pos) < 350)&&(BoompingWall == 0)

		{
			if (vec_dist(my.pos,player.pos) < 350)
			{
				rokett();
			}
		}
		wait(1);
	}
}
/////////////////////////////////////////////////////////////////////////


function OrdCarEvent()
{
	if event_type == event_scan && indicator == _explode
	{	
		my._health-=1000;
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= 10;
		//my.GotHit = 100;
	}
}
function OrdCarExplosion()
{
	exclusive_entity;
	var oldz;
	oldz=my.z;
	my.z+=50;
	you = my.RightWheel;
	remove you;
	morph <exsafari.mdl>,me;
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

}


function OrdCarIni1
{

	if (my.CarWieght ==0)
	{
	my.CarWieght = 100; 
	}
	my.ShocksForce = 1;
	my.passable = 1; 
	my.ShocksMaxAngle = 10;
	my.CarBreakerForce = 0.5;
	my.CarLevel = 0;
	my.CarCurrentGear= 4;
	my.EngineForce= 5;
	my.GearSpeed = 1;
	create( <ambulance.mdl>, my.pos, CarEngine);
	you = Pointer_To_Entity(my.LeaderId);
	you.max_x *= 2.2;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	you.CollFunction  = Function_To_Pointer("MallaCollision");
	you.enable_detect = 1;
	you.enable_scan = 1;
	you.event = OrdCarEvent;
	AddColl(you);
	while (1)
	{
		you = Pointer_To_Entity(my.LeaderId);
		if (you._health<-200)
		{
			OrdCarExplosion();
			break;
		}

		wait(1);
	}

}

function OrdCar1
{
	my.OwnType = TypeOfCars;
	my.CarBlend = 0;//random(100)>60;
	my.shadow = shadowenable;
	OrdCarIni1();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////
function RunerNextPoint()
{	
	RunerPoint = ent_nextpoint(my._target_x);
	if (RunerState == 0)&&(RunerPoint == 7)
	{
		showmessage(5,183);
		wait(15);
		ent_path("RunerIn");
		ent_waypoint(my._target_x,1);
		RunerState = 1;
		RRuner();
		return;
	}
	if (RunerState == 1)&&(RunerPoint == 12)
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
			
			object4.visible=0;
			RunerState=0;
			RunerExist=0;
			RunerCreate();
			my.event = solderevent;
			SolderCounter+=1;
			my.DieEvent = Function_To_Pointer( "SolderDie");
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
		
		}
		if (game_state[5] > 90)
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
	object4.visible=0;
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
	my.WeaponNumber = m16;
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
	if (ent_nextpoint(my._target_x) == 4)
	{
		if (my.skill7 == 101)||(my.skill7 == 102)
		{//my.EnemyId = player.bodylnk;
			my.skill6 = 19;
			my.skill8 = 7;
			LmgWait();
		}
		else
		{
			//SolderWait();
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
	my.skill8 = 3;
	my.skill6 = 18;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
	my.shadow = shadowenable;
	my.wieght = 50;
	wait(20);
	my.hunt = 1;
	my.hide = 1;
//	if (int(random(100))>20)
//	{my.Grenader = 1;
//	}
//	else
//	{my.Grenader = 0;
//	}
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
	{ent_path("PTank1");
	}
	if (my.skill7 == 8)
	{ent_path("PTank2");
	}
	if (my.skill7 == 9)
	{ent_path("PTank3");
	}
	if (my.skill7 == 10)
	{ent_path("PTank4");
	}
	if (my.skill7 == 11)
	{ent_path("PTank5");
	}
	if (my.skill7 == 12)
	{ent_path("PTank6");
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
	ent_waypoint(my._target_x,1);
	SRuner();
}

////////////////////////////////////////////////////////////////////////
var forces;
var explosionscale = 0.3;
define _DatenationTime = 100;

function h_free_throw()
{
	if(event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push)
	{
		exclusive_entity;
		my.skill4=180;	

		temp.x = 10;
		temp.y = 0;
		temp.z = 0;
		vec_to_angle(my.angle,bounce);
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);

		forces = my.skill12/7.5;
		if (forces<1)
		{
		 wait (100);
		 my.flag3 = 1;
		 create( <xplosion.mdl>, my.pos, ExplosionsTga);
		 remove me;
		 return;
		}
		hcirclethrow();


	}
}

function GazGround()
{
	exclusive_entity;
	my.enable_scan = on;
	my.passable = on; 
	my.event = null;
	my.flag3 = 1;	
	my.skill1 = 0;
	while (my.flag3)
	{
		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 1, my.pos, my_angle);
		if (my.skill1>_DatenationTime)
		{ break;
		}
		my.skill1 += 1;
		wait(1);
	}
	create( <xplosion.mdl>, my.pos, ExplosionsTga);
	EndExplosion+=1;
	remove me;
}


function h_free_throwgaz()
{
	if(event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push
		)
	{
		exclusive_entity;		
		my.skill4=180;	

		temp.x = 10;
		temp.y = 0;
		temp.z = 0;
		vec_to_angle(my.angle,bounce);
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);

		forces = my.skill12/7.5;						
		if ( forces < 1 ) && (my.flag4 ==0)
		{
			
			my.flag4 = 1;
			GazGround();
		}
		else
		{
			hcirclethrow();
		} 
	}	
}



function hcirclethrow {
	my.skill12= forces;
	wait (1);
	my.skill1 = my.skill12;
	my.skill2 = 0;
	my.skill3 = 0;
	vec_rotate( my.skill1, my.pan);
	vec_add( my.skill1, my.pos);
	my.skill4=0;	
	while(my.skill4<180)
	{
		my.tilt = 90-my.skill4;
		temp.x = my.skill12/25;
		temp.y = 0;
		temp.z = -my.skill4/5-my.skill12/10;
		move( my, temp, nullskill);
		my.skill4 += 0.5;
		wait (1);
	}
}

function hgazcirclethrow {
	my.skill12= forces;
	wait (1);
	my.skill1 = my.skill12;
	my.skill2 = 0;
	my.skill3 = 0;
	vec_rotate( my.skill1, my.pan);
	vec_add( my.skill1, my.pos);
	my.skill4=0;	
	while(my.skill4<180)
	{
		play_entsound(my,smokeloop,300);

		my.tilt = 90-my.skill4;
		temp.x = my.skill12/25;
		temp.y = 0;
		temp.z = -my.skill4/5-my.skill12/10;
		move( my, temp, nullskill);
		my.skill4 += 0.5;

		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 1, my.pos, my_angle);
		wait (1);
	}
}

function hfreethrowgaz()
{
	my.enable_block = on;
	my.enable_entity = on;
	my.enable_stuck = on;
	my.enable_impact = on;
	my.enable_push = on;
	my.enable_scan = on;
	my.event = h_free_throwgaz;
	my.scale_x = 2;
	my.scale_y = 2;
	my.scale_z = 2;
	hgazcirclethrow();
}


function hthrowthegrenade(throwerentity,forcesd)
{
	me = throwerentity;
	forces = forcesd;
	vec_for_vertex(temp,me,410);
	create(<granedG.MDL>,temp,hfreethrowgaz);
	vec_set(you.pan,me.pan);
}


define __BompExplosion = 203; 

function TimedGazExpEvent()
{
	if (event_type == event_detect) && (indicator == __BompExplosion)
	{		
		if (you!= null)
		{
			if (you._type == _type_player)
			{				
				my.event = null;																
				ssSmoke = 1;				
				showmessage(10,157);
				you = player;
				HeartPlayer(2);
				temp.x = my.x - player.x;
				temp.y = my.y - player.y;
				temp.z = 0;
				vec_to_angle( my_angle, temp);
				ShowEnemyPos(ang(my_angle.pan));			
				ssSmoke =0;
				wait(30);
				my.event = TimedGazExpEvent;
			}
		}
	}
}

function TimedGazExp
{
	play_entsound(my,smokeexp,500);
	my.enable_scan = on;
	my.enable_detect = on;
	my.event = TimedGazExpEvent;
	my.invisible=1;
	my.passable=1;
	my.flag1=1;
	my.skill1=0;
	my.flag3 = 1;	

	while(my.skill1<150)
	{

		temp.pan = 360;
		temp.tilt = 180;
		
		if (my.flag5 == 1)
		{
			temp.z = 500;
		}
		else
		{
			temp.z = 250;
		}
		
		indicator = __BompExplosion;
		scan(my.pos ,my.pan ,temp);
		indicator = 0;


		my.skill2=my.skill1+10;
		while(my.skill1<my.skill2)
		{

			my_angle.x = 50;
			my_angle.y = 75;
			my_angle.z = 50;
			effect( PartsThrow, 1, my.pos, my_angle);
			my.skill1+=1;			
		}
		wait (1);
	}

	create( <xplosion.mdl>, my.pos, ExplosionsTga);
	remove(me);
}




//////////////////////////////////////////////////////////////////////////////
function thrower()
{
	my.invisible=1;
	temp.x = player.x- my.x ;
	temp.y = player.y - my.y;
	temp.z = player.z - my.z;
	vec_to_angle( my_angle, temp);
	my.pan=my_angle.pan;
	hthrowthegrenade(me,250);
}