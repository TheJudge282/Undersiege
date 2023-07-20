function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}
function Doflashing()
{
	BlackScreen.visible = 1;
	freeze_mode = 1;
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
	outcompass.visible = 0;
	EnemyPos.visible = 0;
	Compass.visible = 0;
	HldBk.visible = 0;
	HldSld.visible = 0;
	VWeaponSprite1.visible = 0;
	CPointer.visible = 0;
	looprun=0;
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
	camra2player = 0;
	temp.x = -844;
	temp.y = -814;
	temp.z = 40;

	create(<point1.mdl>,temp,CameraCarier);
	you.pan = 10;
	camera.pan = 10;
	camera.tilt = 0;
	VictoryScream();
	RemoveAllKeys();
	on_enter = finalization;
	PreesNextLvl.visible = 1;
	Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
}




function solder_pumaction()
{
	my.skill8 = 5;
	my.skill6=7;
	SoldColl();
}
function solder_uzi()
{
	my.skill8 = 11;
	my.skill6=8;
	SoldColl();
}
function solder_galili()
{
	my.skill8 = 13;
	my.skill6=6;
	SoldColl();
}
/////////////////////////////////////////////////////
function objectpos1()
{
	wait(50);
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 2)
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
function objectpos2()
{
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 3)
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
function objectpos3()
{
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 4)
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
function objectpos4()
{
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 5)
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
function objectpos5()
{
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 6)
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
function objectpos6()
{
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 7)
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
function objectpos7()
{
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 8)
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
function objectpos8()
{
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 9)
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
function objectpos10()
{
	ObjecPos.visible = 1;
	while (1)
	{
		if (Game_State[0] == 10)
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

function lastSolder()
{
	while (1)
	{
		you = Pointer_To_Entity(my.EnemyId);
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

function objectpos9()
{return;
	while (1)
	{
		if (Game_State[0] == -1)
		{lastSolder();
		}
		wait(1);
	}

}

function followevent()
{
	if (event_type == event_detect)&&(indicator == _handle)&&(you._type == _type_soldier)
	{
		my.EnemyId = Entity_To_Pointer(you);
		indicator = 0;
		Game_State[1] = 2;
		Game_State[0] = -1;
		lastSolder();
	}
}

function Follow_player()
{
	wait(50);
	object1.visible = 0;
	ObjecPos.visible = 1;
	ShowMessionsAuto();
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	my.event = followevent;
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	while (1)
	{
		if (SolderCounter==1)
		{
			wait(50);
			if (SolderCounter==1)&&(Solder_Creation_Counter[0]!= 0)&&(Solder_Creation_Counter[1]!= 0)&&(Solder_Creation_Counter[2]!= 0)&&(Solder_Creation_Counter[3]!= 0)&&(my.skill23 == 0)
			{
				my.skill23 = 1;
				Game_State[1] =1;
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
		}

		if (Game_State[0] == 2)&&(player.y < -800)
		{Game_State[0] = 3;
		}

		if (Game_State[0] == 3)&&(player.x > 0)&&(player.y > -500)
		{Game_State[0] = 4;
		}

		if (Game_State[0] == 4)&&(player.x > 2400)&&(player.y > -500)
		{Game_State[0] = 5;
		}
		
		if (Game_State[0] == 5)&&(player.x > 2700)&&((player.y < -1350)&&(player.y > -1700))
		{Game_State[0] = 6;
		}
		
		if (Game_State[0] == 6)&&((player.x > 600)&&(player.x < 1000))&&((player.y < -1350)&&(player.y > -1700))
		{Game_State[0] = 7;
		}

		if (Game_State[0] == 7)&&(player.x < -550)&&(player.y < -1725)
		{Game_State[0] = 8;
		}

		if (Game_State[0] == 8)&&(player.x < -550)&&(player.y < -3000)
		{Game_State[0] = 9;
		}
		
		if (Game_State[0] == 9)&&(player.x > 700)&&(player.y < -3200)
		{Game_State[0] = 10;
		}
		
		if (Game_State[0] == 10)&&(player.x > 2700)&&(player.y < -3000)
		{Game_State[0] = 5;
		}

		vec_set(my.pos,player.pos);
		wait(1);
	}

}

function Creat_Soldiers()
{
	wait(50);
	if (level.y > 1)
	{
		NSoldersCreation[0]=3;
		NSoldersCreation[1]=4;
	}
	while (1)
	{
		//	Solder Creation by Position
			//	point one
		if(((player.x<-600)&&(player.x<1000))&&(player.y>-1300))&&(Solder_Creation_Counter[0]<NSoldersCreation[0])
		{//x1
			Game_State[0] = 2;
			
			if(Solder_Creation_Counter[0]==0)
			{ShowMessage(150,135);
			}
			//wait(100+random(100));
			//m2
			temp.x=-296;
			temp.y=-409;
			temp.z=45;
			create( <psgal.mdl>, temp, solder_galili);
			//m1
			temp.x=-1510;
			temp.y=-1010;
			temp.z=-160;
			create( <pcuzi.mdl>, temp, solder_uzi);
			Solder_Creation_Counter[0]+=1;
			Game_State[2]=1;
		}
			//	point two
		if(((player.x>-900)&&(player.x<-200))&&((player.y>-2000)&&(player.y<-1400)))&&(Solder_Creation_Counter[1]<NSoldersCreation[1])
		{//x21
			if(Solder_Creation_Counter[1]==0)
			{
				ShowMessage(50,136);
				Play_My_Sounds(2,0);
			}
			//m5
			temp.x=886;
			temp.y=-2183;
			temp.z=-170;
			create( <pcuzi.mdl>, temp, solder_uzi);
			//m6
			temp.x=-372;
			temp.y=-3067;
			temp.z=-160;
			create( <psgal.mdl>, temp, solder_galili);
			Solder_Creation_Counter[1]+=1;
			Game_State[2]==2;
		}
		if(((player.x>0)&&(player.x<1000))&&((player.y>-1900)&&(player.y<-1250)))&&(Solder_Creation_Counter[1]<NSoldersCreation[1])
		{//x22
			/*if (Game_State[0] == 6)
			{Game_State[0] = 7;
			}*/
			
			if(Solder_Creation_Counter[1]==0)
			{
				ShowMessage(50,136);
				Play_My_Sounds(2,0);
			}
			//m7
			temp.x=1300;
			temp.y=-2915;
			temp.z=-140;
			create( <pcuzi.mdl>, temp, solder_uzi);
			//m8
			temp.x=-1080;
			temp.y=-3294;
			temp.z=-140;
			create( <psgal.mdl>, temp, solder_galili);
			Solder_Creation_Counter[1]+=1;
			Game_State[2]=2;
		}
		if(((player.x>0)&&(player.x<1000))&&((player.y>-3500)&&(player.y<-2700)))&&(Solder_Creation_Counter[1]<NSoldersCreation[1])
		{//x23
			if(Solder_Creation_Counter[1]==0)
			{
				ShowMessage(50,136);
				Play_My_Sounds(2,0);
			}
			//m9
			temp.x=520;
			temp.y=-1595;
			temp.z=-140;
			create( <pcuzi.mdl>, temp, solder_uzi);
			//m8
			temp.x=-677;
			temp.y=-1868;
			temp.z=-140;
			create( <psgal.mdl>, temp, solder_galili);
			Solder_Creation_Counter[1]+=1;
			Game_State[2]=2;
		}
			//	point three
		if(((player.x>-300)&&(player.x<200))&&((player.y>-600)&&(player.y<50)))&&(Solder_Creation_Counter[2]<NSoldersCreation[1])
		{//x31
			/*if (Game_State[0] == 3)
			{Game_State[0] = 4;
			}*/
			
			if(Solder_Creation_Counter[2]==0)
			{
				ShowMessage(50,144);
				Play_My_Sounds(3,0);
			}
			//m3
			temp.x=1580;
			temp.y=386;
			temp.z=110;
			create( <psbom.mdl>, temp, solder_pumaction);
			//m4
			temp.x=2800;
			temp.y=-900;
			temp.z=-230;
			create( <pcuzi.mdl>, temp, solder_uzi);
			Solder_Creation_Counter[2]+=1;
			Game_State[2]=3;
		}
		if(((player.x>2500)&&(player.x<3100))&&((player.y>-1300)&&(player.y<-800)))&&(Solder_Creation_Counter[2]<NSoldersCreation[1])
		{//x32
			if(Solder_Creation_Counter[2]==0)
			{
				ShowMessage(50,144);
				Play_My_Sounds(3,0);
			}
			//m3
			temp.x=1580;
			temp.y=386;
			temp.z=110;
			create( <psbom.mdl>, temp, solder_pumaction);
			Solder_Creation_Counter[2]+=1;
			Game_State[2]=3;
		}
			//	point four
		if(((player.x>2500)&&(player.x<3100))&&((player.y>-1650)&&(player.y<-1350)))&&(Solder_Creation_Counter[3]<NSoldersCreation[1])
		{//41
			/*if (Game_State[0] == 5)
			{Game_State[0] = 6;
			}*/
			
			if(Solder_Creation_Counter[3]==0)
			{
				ShowMessage(50,148);
				Play_My_Sounds(4,0);
			}
			//m5
			temp.x=886;
			temp.y=-2183;
			temp.z=-170;
			create( <psgal.mdl>, temp, solder_galili);
			//m10
			temp.x=2380;
			temp.y=-2978;
			temp.z=-190;
			create( <pcuzi.mdl>, temp, solder_uzi);
			Solder_Creation_Counter[3]+=1;
			Game_State[2]=4;
		}
		if(((player.x>2000)&&(player.x<2500))&&((player.y>-3500)&&(player.y<-2800)))&&(Solder_Creation_Counter[3]<NSoldersCreation[1])
		{//42
			if(Solder_Creation_Counter[3]==0)
			{
				ShowMessage(50,148);
				Play_My_Sounds(4,0);
			}
			//m11
			temp.x=2370;
			temp.y=-344;
			temp.z=-180;
			create( <psgal.mdl>, temp, solder_galili);
			//m12
			temp.x=2268;
			temp.y=-1573;
			temp.z=-140;
			create( <pcuzi.mdl>, temp, solder_uzi);
			Solder_Creation_Counter[3]+=1;
			Game_State[2]=4;
		}
		wait(1);
	}
}

/////////////////////////////////////////////////////////////////////
//		compars



function Comparsevent()
{
	if event_type == event_scan && indicator == _explode
	{	
		my._health-=1000;
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		showmessage(5,137);
		Play_My_Sounds(5,0);
		HeartPlayer( 5 );
		my._health -= 25;
		wait(25);
	}
	if ((event_type == event_detect)&&(indicator == _checkaround) && (my.nearplayer == 0))
	{
		if (you != null)
		{			
			if (you._type == _type_player)
			{
				my.nearplayer =1;
				var rn = 0;
				rn = int(random(7));
				if (rn == 0)
				{
					showmessage(5,38);
					ComparsSound(1);
					wait(100);
					my.nearplayer = 0;
					return;
				}
				if (rn == 1)
				{
					showmessage(5,37);
					ComparsSound(2);
					wait(100);
					my.nearplayer = 0;
					return;
				}
				if (rn == 2)
				{
					showmessage(5,40);
					ComparsSound(3);
					wait(100);
					my.nearplayer = 0;
					return;
				}
				if (rn == 3)
				{
					showmessage(5,37);
					ComparsSound(4);
					wait(100);
					my.nearplayer = 0;
					return;	
				}
				if (rn == 4)
				{
					showmessage(5,38);
					ComparsSound(5);
					wait(100);
					my.nearplayer = 0;
					return;
				}
				if (rn == 5)
				{
					showmessage(5,40);
					ComparsSound(6);
					wait(100);
					my.nearplayer = 0;
					return;
				}
				if (rn == 6)
				{
					showmessage(5,39);
					ComparsSound(7);
					wait(100);
					my.nearplayer = 0;
					return;
				}
				if (rn == 7)
				{
					showmessage(5,37);
					ComparsSound(8);
					wait(100);
					my.nearplayer = 0;
					return;
				}
			}
		}				
	}
}

function AhmedMessage()
{	
	var reanmessage = 0;
	wait(int(random(300)));
	while (1)
	{
		reanmessage=int(random(9));
		if (reanmessage == 0)
		{play_entsound(me,fight01,500);
		}
		if (reanmessage == 1)
		{play_entsound(me,fight02,500);
		}
		if (reanmessage == 2)
		{play_entsound(me,fight03,500);
		}
		if (reanmessage == 3)
		{play_entsound(me,fight04,500);
		}
		if (reanmessage == 4)
		{play_entsound(me,fight05,500);
		}
		if (reanmessage == 5)
		{play_entsound(me,fight06,500);
		}
		if (reanmessage == 6)
		{play_entsound(me,fight07,500);
		}
		if (reanmessage == 7)
		{play_entsound(me,fight08,500);
		}
		if (reanmessage == 8)
		{play_entsound(me,fight09,500);
		}
		if (reanmessage == 9)
		{play_entsound(me,fight10,500);
		}
		wait(max(301,int(random(600))));
	}
}


function ComparsDie()
{
	death_sound(100);
	if (my.defaultstate == 7)||(my.defaultstate == 15)
	{morph(<f_man.mdl>,me);
	}
	Play_My_Sounds(6,0);
	showmessage(5,139);
	//wait(25);
	my._state = _state_die;
	RemoveColl(me);
	my.skill1=0;
	while (my.skill1<100)
	{
		if (my.defaultstate==5)
		{
			ent_frame("die", my.skill1);
		}
		else
		{
			ent_frame("1DIE", my.skill1);
		}
		
		
		my.skill1 += 10*speed/200;
		wait(1);
	}

	me = 0;
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;
	remove(me);
}


function random_skin3()
{
	var rn;
	rn = int(random(7));
	return(rn);
}
function random_skin2()
{
	var rn;
	rn = int(random(7));
	if (rn == 0) { my.skin = 9; return;}
	if (rn == 1) { my.skin = 10; return;}
	if (rn == 2) { my.skin = 11; return;}
	if (rn == 3) { my.skin = 12; return;}
	if (rn == 4) { my.skin = 14; return;}
	if (rn == 5) { my.skin = 15; return;}
	if (rn == 6) { my.skin = 16; return;}
	if (rn == 7) { my.skin = 17; return;}
}
function random_skin()
{
	var random_number;
	random_number = int(random(7));

	if (random_number == 0) { my.skin = 1; return;}
	if (random_number == 1) { my.skin = 2; return;}
	if (random_number == 2) { my.skin = 3; return;}
	if (random_number == 3) { my.skin = 4; return;}
	if (random_number == 4) { my.skin = 5; return;}
	if (random_number == 5) { my.skin = 6; return;}
	if (random_number == 6) { my.skin = 7; return;}
	if (random_number == 7) { my.skin = 8; return;}
}

function smoothto(srcframe,dstframe,crntfrm,prcnt)
{
	ent_frame(srcframe, crntfrm);
	ent_blend(dstframe , 100-crntfrm, prcnt);
}




function ComparsScanForPlayer()
{
	my.nearplayer = 0;
	while (1)
	{
		temp.pan= 360;
		temp.tilt = 360;
		temp.z = 50;
		indicator = _checkaround;
		scan(my.pos,my.pan,temp);
		wait(1);
	}
	
}






function Stone_compars()
{
	my.FrameAnim = 0;
	while (1)
	{
		while(1)
		{
			ent_cycle("2STON", my.FrameAnim);
			my.FrameAnim += speed/50;
			if (my.FrameAnim == 100)
			{break;
			}
			wait(1);
		}
		my.FrameAnim = 0;
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Stone_compars;
			return;
		}				
		wait(random(100));
	}


}

function Heart_compars()
{
	my.FrameAnim = 65;
	//my.z -=25;
	while (1)
	{
		while(1)
		{
			ent_cycle("1leg", my.FrameAnim);
			my.FrameAnim += speed/100;
			if (my.FrameAnim == 100)
			{break;
			}
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Stone_compars;
				return;
			}				
			wait(1);
		}
		my.FrameAnim = 65;
		wait(random(100));
	}


}
function stand_compars()
{
	var kind ;
	my.FrameAnim = 0;
	while (1)
	{
		while(1)
		{
			if (kind == 0)
			{	
				ent_cycle("2STON", my.FrameAnim);
				goto manframe;
			}
			if (kind == 1)
			{	
				ent_cycle("1talk", my.FrameAnim);
				goto manframe;
			}
			if (kind == 2)
			{	
				ent_cycle("2talk", my.FrameAnim);
				goto manframe;
			}
			if (kind == 3)
			{	
				ent_cycle("3talk", my.FrameAnim);
				goto manframe;
			}
			
	manframe:		my.FrameAnim += speed/50;
			if (my.FrameAnim == 100)
			{break;
			}
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = stand_compars;
				return;
			}				
			wait(1);
		}
		my.FrameAnim = 0;
		kind = random_skin3();
		wait(random(25));
	}


}

function Turn_left()
{	
  	while (1)
	{      
		my.skill30 = 0;
		while (my.skill30 < 100)
		{
			ent_frame("Turn" ,my.skill30 );
			my.skill30 +=speed/100;
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Turn_left;
				return;
			}				
			wait(1);
		}	
     
		my.skill30 = 0;
		while (my.skill30 < 300)
		{
			ent_cycle("brth" ,my.skill30 );
			my.skill30 += speed/50;
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Turn_left;
				return;
			}				
			wait(1);
		}   
		wait(1);
	}	
  
}

function Turn_right()
{
	while (1)
	{       
		my.skill30 = 0;
		while (my.skill30 < 100)
		{
			ent_frame("2Turn" ,my.skill30 );
			my.skill30 +=speed/100;
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Turn_right;
				return;
			}				
			wait(1);
		}
   
		my.skill30 = 0;
		while (my.skill30< 300)
		{
			ent_cycle("brth" ,my.skill30 );
			my.skill30 += speed/50;
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Turn_right;
				return;
			}				
			wait(1);
		}		
		
		wait(1);
	}  
}

function Turn_right_down()
{
	while (1)
	{		
		my.skill30 = 0;
		while (my.skill30 < 100)
		{
			ent_frame("3Turn" ,my.skill30 );
			my.skill30 +=speed/100;	
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Turn_right_down;
				return;
			}				
			wait(1);
		}
   
		my.skill30 = 0;
		while (my.skill30< 300)
		{
			ent_cycle("2brth" ,my.skill30 );
			my.skill30 += speed/50;						
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Turn_right_down;
				return;
			}				
			wait(1);	
		}
		wait(1);
	}
}

function CarryBoyRun()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	my.skill30 = 20;
	while (my.skill30 < 100)
	{
		ent_frame("2cary" ,my.skill30 );
		my.skill30 += speed/40;
		wait(1);
	}
	ent_path("path_000");
	ent_waypoint(my._target_x,1);
	my.skill30= 0;
	while (my._state == _state_Walk)
	{
		if ( my.SoundWR==0)
		{ play_entsound(me,comparsstep,300);
		my.SoundWR=-100; }
		my.SoundWR+=10;
		ent_cycle("3cary",my.skill40);
		my.skill40 += speed/40;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan=nearangle(my.pan,my_angle.pan,25);
		temp.x = speed/30;
		temp.y = 0;
		temp.z = 0;
		move( my, temp, nullskill);
		sonar(my,500);                		
		my.z = target.z +abs(my.min_z);
		if (vec_dist(my.x ,my._target_x ) < 50)
		{
			if (ent_nextpoint(my._target_x)== 6)&&(my.defaultstate == 6)
			{
				my.defaultstate = 1;
				ent_path("path_011");
				ent_waypoint(my._target_x,1);
			}
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = CarryBoyRun;
			return;
		}				
		wait(1);
	}
}

function ComparsRun()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if ( my.SoundWR==0)
		{ play_entsound(me,comparsstep,300);
		my.SoundWR=-100; }
		my.SoundWR+=10;

		ent_cycle("run" ,my.FrameAnim );
		my.FrameAnim+=speed/50;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan=nearangle(my.pan,my_angle.pan,25);
		temp.x = speed/50;
		temp.y = 0;
		temp.z = 0;
		move( my, temp, nullskill);
		sonar(my,500);                		
		my.z = target.z +abs(my.min_z);
		if (vec_dist(my.x ,my._target_x ) < 50)
		{
			ent_nextpoint(my._target_x);
		}		
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = ComparsRun;
			return;
		}				
		wait(1);
	}
}

function man_help_boy()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	//my.z -=25;
	my._state = _state_Walk;
	var s;
	while (my._state == _state_Walk)
	{
		while (my.skill30 < 100)
		{
			ent_frame("aid" ,my.skill30 );
			my.skill30 += speed/400;
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = man_help_boy;
				break;
			}				

			wait(1);
		}
		my.skill30 =0;
		s=0;
		my.string1="aid";   //old
		my.string2="aid";   //new
		while (s < 100)
		{
			smoothto(my.string1 ,my.string2 ,  100 , s );
			s += speed/20;
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = man_help_boy;
				break;
			}				
			wait(1);
		}
	wait(1);
	}
}

function StoneRunerNextPoint()
{
	my.skill9 = ent_nextpoint(my._target_x);
	if (my.skill9 == 2)
	{
		my.FrameAnim = 0;
		if (my.skill7 == 13)
		{my.pan=180;
		}else
		{my.pan=325;
		}
		my.skill8 = int(random(10));
		while (1)
		{
			while(1)
			{
				
				ent_cycle("2STON", my.FrameAnim);
				my.FrameAnim += speed/100;
				if (my.FrameAnim == 100)
				{break;
				}
				if (SoldCheckIfHealthy())
				{ 
					my.LastState = StoneRunerNextPoint;
					return;
				}				
				wait(1);
			}
			my.FrameAnim = 0;
			my.skill8 -= 1;
			if (my.skill8 < 0)
			{break;
			}
			wait(1);
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = StoneRunerNextPoint;
			return;
		}				
	}
	if (my.skill9 == 4)
	{
		if (my.skill7 == 13)
		{my.pan=180;
		}else
		{my.pan=325;
		}
		
		ent_cycle("STAND", my.FrameAnim);
		wait(random(100));
	}
	StoneRuner();
}
function StoneRuner()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if ( my.SoundWR==0)
		{ play_entsound(me,comparsstep,300);
		my.SoundWR=-100; }
		my.SoundWR+=10;

		ent_cycle("run" ,my.FrameAnim );
		my.FrameAnim+=speed/50;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan=nearangle(my.pan,my_angle.pan,25);
		temp.x = speed/50;
		temp.y = 0;
		temp.z = 0;
		move( my, temp, nullskill);
		sonar(my,500);                		
		my.z = target.z +abs(my.min_z);
		if (vec_dist(my.x ,my._target_x ) < 50)
		{
			break;
		}		
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = StoneRuner;
			return;
		}				
		wait(1);
	}
	StoneRunerNextPoint();
}
////////////////////////////////////////////////////////////////////////
function scaredRunerNextPoint()
{
	ent_nextpoint(my._target_x);
	my.FrameAnim = 0;
	while (1)
	{
		ent_cycle("A_Turn",my.FrameAnim);
		my.FrameAnim += speed/100;
		if (my.FrameAnim == 100)
		{break;}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = scaredRunerNextPoint;
			return;
		}				
		wait (1);
	}
	scaredRuner();
}



function scaredRuner()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if ( my.SoundWR==0)
		{ play_entsound(me,comparsstep,300);
		my.SoundWR=-100; }
		my.SoundWR+=10;

		ent_cycle("run" ,my.FrameAnim );
		my.FrameAnim+=speed/50;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan=nearangle(my.pan,my_angle.pan,25);
		temp.x = speed/35;
		temp.y = 0;
		temp.z = 0;
		move( my, temp, nullskill);
		sonar(my,500);                		
		my.z = target.z +abs(my.min_z);
		if (vec_dist(my.x ,my._target_x ) < 50)
		{
			break;
		}		
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = scaredRuner;
			return;
		}				
		wait(1);
	}
	scaredRunerNextPoint();
}

//////////////////////////////////////////////////////////////////////////
action AllCompars
{
	//my.passable = 1;
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
	my._type = _type_compars;
	my.event = Comparsevent;
	my.DieEvent =Function_To_Pointer("ComparsDie");
	my.HitEvent = Function_To_Pointer("ComparsDie");
	my.CollFunction = Function_To_Pointer("MallaCollision");
	my.AnimRun = 1;
	my._signal = 0;
	if (int(random(1)) == 0)
	{
		random_skin();
	}
	else
	{
		random_skin2();
	}
	ComparsScanForPlayer();
	/////////////////////////////////////////////////
	if (my.defaultstate==4)
	{
		ent_path("path_011");
		ent_waypoint(my._target_x,1);
		ComparsRun();
		return;
	}

	if (my.defaultstate==5)
	{
		man_help_boy();
		return;
	}
	if (my.defaultstate==6)
	{
		CarryBoyRun();
		return;
	}
	if (my.defaultstate==7)
	{
		Turn_left();
		return;
	}
	if (my.defaultstate==8)
	{
		Turn_right();
		return;
	}
	if (my.defaultstate==9)
	{
		Turn_right_down();
		return;
	}
	if (my.defaultstate==10)
	{
		Stone_compars();
		return;
	}
	if (my.defaultstate==11)
	{
		Stone_compars();
		return;
	}
	if (my.defaultstate==12)
	{
		Heart_compars();
		return;
	}
	if (my.defaultstate==13)
	{AhmedMessage();
		if (my.skill8 == 1)
		{
			ent_path("path_113");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
		if (my.skill8 == 2)
		{
			ent_path("path_114");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
		if (my.skill8 == 3)
		{
			ent_path("path_115");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
		if (my.skill8 == 4)
		{
			ent_path("path_116");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
		if (my.skill8 == 5)
		{
			ent_path("path_117");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
		if (my.skill8 == 6)
		{
			ent_path("path_118");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
	}	
	if (my.defaultstate==14)
	{AhmedMessage();
		if (my.skill8 == 1)
		{
			ent_path("path_211");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
		if (my.skill8 == 2)
		{
			ent_path("path_212");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
		if (my.skill8 == 3)
		{
			ent_path("path_213");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}

	}
	if (my.defaultstate == 15)
	{
		if (my.skill8 == 1)
		{
			ent_path("path_511");
			ent_waypoint(my._target_x,1);
			scaredRuner();
			return;
		}
		if (my.skill8 == 2)
		{
			ent_path("path_512");
			ent_waypoint(my._target_x,1);
			scaredRuner();
			return;
		}
		if (my.skill8 == 3)
		{
			ent_path("path_513");
			ent_waypoint(my._target_x,1);
			scaredRuner();
			return;
		}
	}
	if (my.defaultstate==16)
	{AhmedMessage();
		if (my.skill8 == 1)
		{
			ent_path("path_311");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
		if (my.skill8 == 2)
		{
			ent_path("path_312");
			ent_waypoint(my._target_x,1);
			StoneRuner();
			return;
		}
	}
}

////////////////////////////////////////////////////////////
action car_patrol
{
	wait(50);
	my.skin=1;
	my.passable = on;
	car_move();
}

function car_move()
{
	ent_path("path_012");
	ent_waypoint(my._target_x,1);
	while (1)
	{
		if (Game_State[2]==5)&&(my.skill7 == 1)
		{
			
			//play_sound VictoryPlayer, 100;
			play_loop VictoryPlayer, 100;
			HideEveryThing();
			h_VictoryPlayer = result;
			MovieOrSucess = 1;
			Kick_Action = 0;
			wait(50);
			camra2player=0;
			camera.x=2000;
			camera.y=-2734;
			camera.z=175;
			camera.tilt=335;
			camera.pan=225;

			car_path();
			break;
		}
		if (Game_State[2]==6)&&(my.skill7 == 2)
		{
			car_path();
			break;
		}
		if (Game_State[2]==7)&&(my.skill7 == 3)
		{
			car_path();
			break;
		}
		wait(1);
	}
	

}
action car_path1 
{	
	CarNextPoint = ent_nextpoint(my._target_x);
	if (CarNextPoint == 3)&&(my.skill7 == 1)
	{Game_State[2]=6;
	}
	if (CarNextPoint == 4)&&(my.skill7 == 1)
	{Game_State[2]=7;
	}
	if (CarNextPoint == 5)&&(my.skill7 == 1)
	{
		//Fade2black( 1, 1, Function_To_Pointer( "finalization"));
		mesges.visible = 0;
		VictoryCamera();
		remove me;
		return;
		
	}
	car_path();

}



function car_path()
{	
	exclusive_entity;
	while(1)
	{
		vec_set(point_move.x,my._target_x );
		if EDistance(point_move,me)<50
		{
			break;
		}
		temp.x = (my._target_x - my.x);
		temp.y = (my._target_y - my.y);
		temp.z = (my._target_z - my.z);
		vec_to_angle(my_angle,temp);
		//my.pan = my_angle.pan;
		my.pan=nearangle(my.pan,my_angle.pan,10);
		my.tilt = my_angle.tilt;
		temp.x=speed/10;
		temp.y=0;
		temp.z=0;
		move(me,temp,nullvector);
		wait(1);
	}
	car_path1();	
}

////////////////////////////////////////////////////////////////////

