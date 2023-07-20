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
	AHldSld.visible = 0;
	AHldBk.visible = 0;
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

function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
	stop_sound(SoundIsPlaying);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
function IsrailFlash()
{
	play_entsound(my,AhmedShot,500);
	Short_GunFlash(me,GunFlashFront[my.skill6],GunFlashBack[my.skill6]);	
	vec_for_vertex ( p, my, GunFlashFront[my.skill6]);
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
	my.epassable = 0;
}
function Israil_Wait()
{
	var NumShot = 0;
	my.FrameAnim = 0;
	my.FrameAnim = 0;
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
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("Israil_Wait");
			return;
		}				
		wait(1);
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
//	the solder position in Floor num-1
//	pos = 0,1	in Ahmed room	
//	pos = 2		in the right corrner of the floor
//	pos = 3		in the left corrner of the floor	
//	pos = 4,5	in the control room neer elevator
//	pos = 6,7	in the control room neer stairs
////////////////////////////////////////////////////////
// this function Create Solder in room and running out
function Run_Solder_Create_Iner(Pos1,Pos2,type)
{
	temp.x=Solder_posx2[Pos1];	
	temp.y=Solder_posy2[Pos1];	
	temp.z=Solder_posz2[Pos1];	
	create(<psgal.mdl>,temp,Runer);
	if (type == 1)
	{you.skill7 = 1;
	}
	else
	{you.skill7 = 0;
	}
	you.skill8 = 13;
	you.skill6 = 6;
	temp.x=Solder_Destx2[Pos1];
	temp.y=Solder_Desty2[Pos1];	
	temp.z=Solder_Destz2[Pos1];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx2[Pos2];	
	temp.y=Solder_posy2[Pos2];	
	temp.z=Solder_posz2[Pos2];	
	create(<pcuzi.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_Destx2[Pos2];
	temp.y=Solder_Desty2[Pos2];	
	temp.z=Solder_Destz2[Pos2];
	vec_set(you._target_x,temp);

}
// this function create solders out the rooms  
function Run_Solder_Create_Floor1(Pos,num,type)
{
	temp.x=Solder_posx2[Pos];	
	temp.y=Solder_posy2[Pos];	
	temp.z=Solder_posz2[Pos];	
	create(<pcuzi.mdl>,temp,Runer);
	if (type == 0)
	{you.skill7 = 0;
	}
	else
	{you.skill7 = 1;
	}
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_Destx2[Pos];	
	temp.y=Solder_Desty2[Pos];	
	temp.x-=75;
	temp.y+=75;
	temp.z=Solder_Destz2[Pos];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx2[Pos];	
	temp.y=Solder_posy2[Pos];	
	temp.x+=75;
	temp.y-=75;
	temp.z=Solder_posz2[Pos];	
	create(<psgal.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 13;
	you.skill6 = 6;
	temp.x=Solder_Destx2[Pos];
	temp.y=Solder_Desty2[Pos];	
	temp.x+=75;
	temp.y+=75;
	temp.z=Solder_Destz2[Pos];
	vec_set(you._target_x,temp);
	if (num == 3)
	{
		temp.x=Solder_posx2[Pos];	
		temp.y=Solder_posy2[Pos];	
		temp.x-=75;
		temp.y+=75;
		temp.z=Solder_posz2[Pos];	
		create(<psbom.mdl>,temp,Runer);
		you.skill7 = 0;
		you.skill8 = 5;
		you.skill6 = 7;
		temp.x=Solder_Destx2[Pos];	
		temp.y=Solder_Desty2[Pos];	
		temp.x-=75;
		temp.y-=75;
		temp.z=Solder_Destz2[Pos];
		vec_set(you._target_x,temp);
	}

}
////////////////////////////////////////////////////////////
//	the solder position in Floor num-2
//	pos = 0		in the far left corrner of the floor first stage
//	pos = 1		in the far right corrner of the floor first stage
//	pos = 2		in the middle on left of the floor first stage
//	pos = 3		in the middle on right of the floor second stage
//	pos = 4		in the far left corrner of the floor second stage
//	pos = 5		in the far left corrner of the floor third stage
//	pos = 6		in the middle of the floor third stage
//	pos = 7		in the far right corrner of the floor third stage
//	pos = 8,9,10,11	Initial position at the door of Floor-2
////////////////////////////////////////////////////////
// this function create solders out the rooms  
function Run_Solder_Create_Floor2(Pos,num)
{
	temp.x=Solder_posx3[Pos];	
	temp.y=Solder_posy3[Pos];	
	temp.z=Solder_posz3[Pos];	
	create(<psbom.mdl>,temp,Runer);
	you.skill7 = 1;
	you.skill8 = 5;
	you.skill6 = 7;
	temp.x=Solder_Destx3[Pos];	
	temp.y=Solder_Desty3[Pos];	
	temp.x-=75;
	temp.y+=75;
	temp.z=Solder_Destz3[Pos];
	vec_set(you._target_x,temp);
	temp.x=Solder_posx3[Pos];	
	temp.y=Solder_posy3[Pos];	
	temp.x+=75;
	temp.y-=75;
	temp.z=Solder_posz3[Pos];	
	create(<psgal.mdl>,temp,Runer);
	you.skill7 = 0;
	you.skill8 = 13;
	you.skill6 = 6;
	temp.x=Solder_Destx3[Pos];
	temp.y=Solder_Desty3[Pos];	
	temp.x+=75;
	temp.y+=75;
	temp.z=Solder_Destz3[Pos];
	vec_set(you._target_x,temp);
	if (num == 3)
	{
		temp.x=Solder_posx3[Pos];	
		temp.y=Solder_posy3[Pos];	
		temp.x-=75;
		temp.y+=75;
		temp.z=Solder_posz3[Pos];	
		create(<pcuzi.mdl>,temp,Runer);
		you.skill7 = 0;
		you.skill8 = 11;
		you.skill6 = 8;
		temp.x=Solder_Destx3[Pos];	
		temp.y=Solder_Desty3[Pos];	
		temp.x-=75;
		temp.y-=75;
		temp.z=Solder_Destz3[Pos];
		vec_set(you._target_x,temp);
	}

}
////////////////////////////////////////////////////////////
//	the solder position in Floor num0
//	pos = 0		in the first right block of the floor
//	pos = 1		in the second right block of the floor
//	pos = 2		in the first left block of the floor
//	pos = 3		in the second left block of the floor
//	pos = 4,5,6,7	in the control room at the enterance
//	pos = 8,9,10,11	Initial position at the door of Floor0
////////////////////////////////////////////////////////
// this function create solders out the rooms  
function Run_Solder_Create_Floor0(Pos,num,type)
{
	temp.x=Solder_posx4[Pos];	
	temp.y=Solder_posy4[Pos];	
	temp.z=Solder_posz4[Pos];	
	create(<psgal.mdl>,temp,Runer);
	if (type == 0)
	{you.skill7 = 0;
	}
	else
	{you.skill7 = 1;
	}
	you.skill8 = 13;
	you.skill6 = 6;
	temp.x=Solder_Destx4[Pos];	
	temp.y=Solder_Desty4[Pos];	
	temp.x-=25;
	temp.y+=25;
	temp.z=Solder_Destz4[Pos];
	vec_set(you._target_x,temp);
	if (num == 3)
	{
		temp.x=Solder_posx4[Pos];	
		temp.y=Solder_posy4[Pos];	
		temp.x-=25;
		temp.y+=25;
		temp.z=Solder_posz4[Pos];	
		create(<psbom.mdl>,temp,Runer);
		you.skill7 = 0;
		you.skill8 = 5;
		you.skill6 = 7;
		temp.x=Solder_Destx4[Pos];	
		temp.y=Solder_Desty4[Pos];	
		temp.x-=25;
		temp.y-=25;
		temp.z=Solder_Destz4[Pos];
		vec_set(you._target_x,temp);
	}

}
//////////////////////////////////////////////
//	the solder position in stairs
//	pos = 0		neer door at Floor -2
//	pos = 1		at Floor -2
//	pos = 2		neer door betwen Floors -1,-2
//	pos = 3		betwen Floors -1,-2
//	pos = 4		neer door at Floor -1
//	pos = 5		at Floor -1
//	pos = 6		neer door betwen Floors 0,-1
//	pos = 7		betwen Floors 0,-1
//	pos = 8		neer door at Floor 0
//	pos = 9		at Floor 0
//	pos = 10	neer door betwen Floors 1,0
//	pos = 11	betwen Floors 1,0
////////////////////////////////////////////////
// this function create the solder on the stairs
function Solder_Create_Stairs(Pos1,Pos2,num,kin)
{
	if (num == 4)
	{
		temp.x=Solder_posxS[Pos1];	
		temp.y=Solder_posyS[Pos1];	
		temp.z=Solder_poszS[Pos1];	
		temp.x+=25;
		temp.y-=25;
		create(<pcuzi.mdl>,temp,SoldColl);
		you.skill7 = 0;
		you.skill8 = 11;
		you.skill6 = 8;
		temp.x+=25;
		temp.y+=25;
		if (kin == 0)
		{create(<psgal.mdl>,temp,SoldCollS);
		}
		else
		{create(<psgal.mdl>,temp,SoldColl);
		}
		you.skill7 = 0;
		you.skill8 = 13;
		you.skill6 = 6;
		temp.x=Solder_posxS[Pos2];	
		temp.y=Solder_posyS[Pos2];	
		temp.z=Solder_poszS[Pos2];	
		temp.x-=25;
		temp.y+=25;
		if (kin == 0)
		{create(<psbom.mdl>,temp,SoldCollS);
		}
		else
		{create(<psbom.mdl>,temp,SoldColl);
		}
		you.skill7 = 0;
		you.skill8 = 5;
		you.skill6 = 7;
		temp.x-=25;
		temp.y-=25;
		create(<pcuzi.mdl>,temp,SoldColl);
		you.skill7 = 0;
		you.skill8 = 11;
		you.skill6 = 8;
	}
	else
	{
		temp.x=Solder_posxS[Pos1];	
		temp.y=Solder_posyS[Pos1];	
		temp.z=Solder_poszS[Pos1];	
		create(<psgal.mdl>,temp,SoldColl);
		you.skill7 = 0;
		you.skill8 = 13;
		you.skill6 = 6;
	/*	if (kin == 0)
		{create(<pcuzi.mdl>,temp,SoldCollS);
		}
		else
		{create(<pcuzi.mdl>,temp,SoldColl);
		}
		you.skill7 = 0;
		you.skill8 = 11;
		you.skill6 = 8;*/

	}

}
// this function create solders in the Floor0 at the begin
function Initial_Solder_Create_Floor0(Pos1,Pos2,Pos3,Pos4)
{
	temp.x=Solder_posx4[Pos1];	
	temp.y=Solder_posy4[Pos1];	
	temp.z=Solder_posz4[Pos1];	
	create(<psgal.mdl>,temp,SoldColl);
	you.skill7 = 8;
	you.skill8 = 13;
	you.skill6 = 6;
	temp.x=Solder_posx4[Pos2];	
	temp.y=Solder_posy4[Pos2];	
	temp.z=Solder_posz4[Pos2];	
	create(<psbom.mdl>,temp,SoldColl);
	you.skill7 = 8;
	you.skill8 = 5;
	you.skill6 = 7;
	temp.x=Solder_posx4[Pos3];	
	temp.y=Solder_posy4[Pos3];	
	temp.z=Solder_posz4[Pos3];	
	create(<psbom.mdl>,temp,SoldColl);
	you.skill7 = 8;
	you.skill8 = 5;
	you.skill6 = 7;
	temp.x=Solder_posx4[Pos4];	
	temp.y=Solder_posy4[Pos4];	
	temp.z=Solder_posz4[Pos4];	
	create(<pcuzi.mdl>,temp,SoldColl);
	you.skill7 = 8;
	you.skill8 = 11;
	you.skill6 = 8;
}
// this function create solders in the Floor0 at the End
function End_Solder_Create_Floor0(Pos1,Pos2)
{
	temp.x=Solder_posx4[Pos1];	
	temp.y=Solder_posy4[Pos1];	
	temp.z=Solder_posz4[Pos1];	
	create(<psgal.mdl>,temp,LmgSolder);
	you.skill8 = 13;
	you.skill6 = 6;
	wait(10);
}
// this function create solders in the Floor-2 at the begin
function Initial_Solder_Create_Floor2(Pos1,Pos2,Pos3,Pos4)
{
	temp.x=Solder_posx3[Pos1];	
	temp.y=Solder_posy3[Pos1];	
	temp.z=Solder_posz3[Pos1];	
	create(<pcuzi.mdl>,temp,SoldColl);
	you.skill7 = 8;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_posx3[Pos2];	
	temp.y=Solder_posy3[Pos2];	
	temp.z=Solder_posz3[Pos2];	
	create(<psgal.mdl>,temp,SoldColl);
	you.skill7 = 8;
	you.skill8 = 13;
	you.skill6 = 6;
	temp.x=Solder_posx3[Pos3];	
	temp.y=Solder_posy3[Pos3];	
	temp.z=Solder_posz3[Pos3];	
	create(<pcuzi.mdl>,temp,SoldColl);
	you.skill7 = 8;
	you.skill8 = 11;
	you.skill6 = 8;
	temp.x=Solder_posx3[Pos4];	
	temp.y=Solder_posy3[Pos4];	
	temp.z=Solder_posz3[Pos4];	
	create(<psbom.mdl>,temp,SoldCollS);
	you.skill7 = 8;
	you.skill8 = 5;
	you.skill6 = 7;
}


function start_Level()
{
	MisionsMsg1.visible=0;
	MisionsMsg2.visible=0;
	MisionsMsg3.visible=1;
	MisionsMsg4.visible=0;
	MisionsMsg5.visible=0;
	MisionsMsg6.visible=0;
	object1.visible = 1;
	object1.skin = 10;
	ObjecPos.frame = 2;
	wait(50);
	ShowMessage(5,142);
	Play_My_Sounds(7,0);
	ShowMessionsAuto();
	if (level.y == 3)
	{MovieOrSucess = 1;
	}
	while (1)
	{
		test_num1=totalbullets[0];
		you = Pointer_To_Entity( player.BodyLnk);
		my.SoundWR+=9*(speed/200);
		if ( my.SoundWR>0)
		{
			play_sound(EmergencySound,50);
			wavehandle = result;
			my.SoundWR=-300;
		}
		if (player.y > -400)&&(game_state[0] == 0)
		{
			game_state[0] = 1;
			Run_Solder_Create_Iner(0,1,0);
			Run_Solder_Create_Floor1(2,3,0);
		}
		wait(1);
	}

}
action followplayer
{
	wait(50);
	my.skill17 = 0;
	my._type = _type_player1;
	while (1)
	{
		vec_set(my.pos,player.pos);
		if(PressedKeys[Key_Use] == 1)
		{
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 100;//1000;
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
	if (my.skill19 == 1)
	{my.lightrange = 100;
	}
	else
	{my.lightrange = 100;
	}

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
	my.event=ded_event;
	ded_soldier();
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
	exclusive_entity;
	my.FrameAnim = 0;
	my._state = _state_wait;
	ent_frame( stnd, 100);
	while (1)
	{
		if (vec_dist(my.pos,player.pos) < 350)
		{
			my._type = _type_soldier;
			SolderCounter+=1;
			my.EnemyId = player.bodylnk;
			PathToEnemy();
			break;
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
	my.WeaponNumber = my.skill8;
	if (my.WeaponNumber == 5)
	{my.hide = 0;
	}
	else
	{my.hide = 1;
	}
	me.skill46 = -10;
	me.Find_HidePoint = -10;
	me._find_point_flag = -10;
	my.passable = 1;
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
	my.event = solderevent;
	my.DieEvent = Function_To_Pointer( "SolderDie");
	my.HitEvent = Function_To_Pointer( "SolderHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	Standing_Solder();
	return;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////
function Closed_Door_Event()
{
	if (event_type==event_scan)&&(indicator == _handle)&&(my.skill27 == 0)
	{
		ShowMessage(5,136);
		Play_My_Sounds(2,0);
		wait(15);
		return;		
	}

}
function locd_door()
{Closed_Door();
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

function OrdenaryType()
{my._type = _type_elevator;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
function Automatic_Lock_Event()
{
	if (event_type==event_scan)&&(indicator == _handle)
	{
		if (my.flag7 == 1)&&(game_state[0] > 4)
		{return;
		}
		if (my.skin == 1)
		{
			if (my.skill13 == 4)
			{object1.visible = 0;
			}
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
		else
		{
			Doors_State[my.skill13]=0;
			my.skin = 1;
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 200;//1000;
			indicator = _Close_Door;
			scan (my.x,my_angle,temp);
			wait(25);
		}
	}

}

function Automatic_Lock_Event1()
{
	if (event_type==event_scan)&&(indicator == _handle)
	{
		ShowMessage(5,192);
		ShowMessionsAuto();
		wait(15);
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
	my._type = _type_elevator;
	my.skin = 1;
	wait(50);
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;
	if (my.skill17 == 1)
	{my.event=Automatic_Lock_Event1;
	}
	if (my.skill17 == 2)
	{my.event=Automatic_Lock_Event1;
	}
	if (my.skill17 == 3)
	{my.event=Automatic_Lock_Event1;
	}
	if (my.skill17 == 0)
	{my.event=Automatic_Lock_Event;
	}
	if (my.skill19 == 1)
	{
		create(<security.MDL>,my.pos,Lock_Image());
	}
	while (1)
	{
		if (my.skill17 == 1)&&(game_state[0] == 5)
		{
			my.skill17 = 0;
			my.event=Automatic_Lock_Event;
		}
		if (my.skill17 == 2)&&(game_state[0] == 8)
		{
			my.skill17 = 0;
			my.event=Automatic_Lock_Event;
		}
		if (my.skill17 == 3)&&(game_state[0] == 12)
		{
			my.skill17 = 0;
			my.event=Automatic_Lock_Event;
		}
		if (my.skin == 2)&&(my.skill27 > 400)&&(vec_dist(my.pos,player.pos)>50)&&(my.skill11 != 3)
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
		}
		if (my.skill27 > 100)&&(vec_dist(my.pos,player.pos)<100)
		{
			my.skill27 =0;
			showmessage(5,195);
		}
		my.skill27 +=1*(speed/200);
		wait(1);
	}
	endlock:
	return;
}
function Locd_Lock()
{
	my.skin = 1;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
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
				my.event = IsrailEvent;
				Israil_Wait();
				break;
			}
		}		
		ent_cycle("1run" ,my.FrameAnim );
		my.FrameAnim+=speed/35;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
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
	{my.ScaleCollision = 1;
	}
	wait(int(random(15))+5);
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
	my.WeaponNumber = my.skill8;
	if (my.WeaponNumber == 5)
	{my.hide = 0;my.hunt = 0;
	}
	else
	{my.hide = 1;my.hunt = 1;
	}
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
///////////////////////////////////////////////////////////////////////////////////////////////////
function AhmedFlash()
{
	play_entsound(my,AhmedShot,500);
	Short_GunFlash(me,196, 186);	
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

function AhmadShot(RandDist)
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
function AhmedHit()
{
	if (int(random(100))>85)
	{
		ShowMessage(5,158);
		Play_My_Sounds(12,0);
	}
	my.GotHit = 25;
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


function AhmedDie()
{
	morph(<ahdie.mdl>,me);
	death_sound(100);
	RemoveColl(me);
	my.skill1=0;
	while (my.skill1<100)
	{
		ent_frame( LonelyAnimat [ my.AnimDie ] , my.skill1);
		my.skill1 += 10*speed/200;
		wait(1);
	}
   if (  weapon.Zoomable)
    {
	AutoZoom(weapon.Zoomable);
   }
	me = 0;
	ShowMessage(5,141);
	Play_My_Sounds(11,0);
	wait(10);
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;

}

function AhmedMessage()
{
	var Num = 0;
	Num = int(random(4));
	if (game_state[0] == -75)
	{return;
	}
	if (Num == 0)
	{
		play_entsound(me,AhmedMessage1,3000);
	}
	if (Num == 1)
	{
		play_entsound(me,AhmedMessage2,3000);
	}
	if (Num == 2)
	{
		play_entsound(me,AhmedMessage3,3000);
	}
	if (Num == 3)
	{
		play_entsound(me,AhmedMessage4,3000);
	}
	if (Num == 4)
	{
		play_entsound(me,AhmedMessage5,3000);
	}
}
function AhmedEvent()
{
	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		my._health -= 10;
		my.GotHit = 100;
	}
	if event_type == event_detect && you._type == _type_soldier
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
	if (event_type==event_scan)&&(indicator == _handle)&&(FreindState == 0)
	{
		FreindState.y = 1;
		ent_cycle("stnd" ,80 );	
		ShowMessage(5,151);
		Play_My_Sounds(9,0);
		wait(40);
		ShowMessage(5,180);
		wait(35);
		ShowMessage(5,152);
		wait(75);
		ShowMessage(5,156);
		MisionsMsg4.visible=1;
		MisionsMsg3.ambient = -100;
		ShowMessionsAuto();
		wait(10);
		AHldSld.visible = 1;
		AHldBk.visible = 1;
		FreindState = 1;
		return;		
	}


}
function Kahled_Dist()
{
	my.skill8 = 0;
	var tim = 0;
	while (1)
	{
		ObjecPos.frame = 1;
		temp.x = me.x - player.x;
		temp.y = me.y - player.y;
		temp.z = me.z - player.z;
		vec_to_angle( temp, temp);
		ObjecPos.roll = player.pan - temp.pan;
		if (vec_dist(my.pos,player.pos) > 800)&&(tim > 1000)
		{
			ShowMessage(5,193);
			tim = 0;
		}
		tim+=1;
		wait(1);
	}
}
function Ahmed_Wait()
{
	AhmedMessage();
	var NumShot = 0;
	my.FrameAnim = 0;
	my.pan = Apan;
	if (AhmedCond == 1)
	{
		my.FrameAnim = 85;
		while (1)
		{
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Function_To_Pointer("Ahmed_Wait");
				return;
			}
			ent_cycle("2cary" ,my.FrameAnim );				
			my.FrameAnim-=speed/50;
			if (my.FrameAnim <= 0)
			{
				maro = 0;
				my.FrameAnim = 0;
				temp.x = 30;
				temp.y = 0;
				temp.z = 0;
				vec_rotate(temp,my.pan);
				vec_add(temp,my.pos);
				create(<mrdie.mdl>,temp,mareim);
				you.pan  = my.pan+120;
				you.z-=10;
				morph(<ahm16.mdl>,me);
				break;
			}
			wait(1);
		}
		ent_cycle("2stand" ,my.FrameAnim );
	}
	else
	{ent_cycle("stand" ,my.FrameAnim );
	}
	my.FrameAnim = 0;
	while (1)
	{
		if (NumShot < 15)
		{
			if (game_state[0] > 6)
			{ent_cycle("2shot" ,my.FrameAnim );
			}
			else
			{ent_cycle("3shot" ,my.FrameAnim );
			}
			my.FrameAnim += speed/5;
			if (my.FrameAnim > 100)
			{
				 my.FrameAnim = 0;
				 AhmedFlash();
				 AhmadShot(100);
			}
			you = pointer_to_entity( my.enemyid);
			if (you == null)
			{
				temp.pan = 360;
				temp.tilt = 360;
				temp.z = 1700;
				indicator = _watch;
				scan (my.x,my.pan,temp);
			}
			else
			{
				AhmadShot(100);
			}
			NumShot += 1*(speed/200);
		}
		else
		{NumShot += 1*(speed/200);
		}
		if (NumShot > 50)
		{NumShot=0;
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("Ahmed_Wait");
			return;
		}				
		if ( WattingTime < 0)
		{
			my.enemyid = null;break;
		}
		WattingTime -=1.5*(speed/200);
		wait(1);
	}
	my.pan = Apan;
	my.FrameAnim = 0;
	if (AhmedCond == 1)
	{
		maro= 1;
		morph(<ACarry.mdl>,me);
		while (1)
		{
			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Function_To_Pointer("Ahmed_Wait");
				return;
			}
			ent_cycle("2cary" ,my.FrameAnim );				
			my.FrameAnim+=speed/50;
			if (my.FrameAnim > 80)
			{my.FrameAnim = 0;break;
			}
			wait(1);
		}
	}
	AhmedRun();
}
function Ahmed_At_Door()
{
	AhmedMessage();
	if (Doors_State[Doornum] == 1)
	{
		AhmedRun();
	}
	else
	{
		my.pan = Apan;
		ShowMessage(5,188);
		my.FrameAnim = 0;
		if (AhmedCond == 1)
		{
			my.FrameAnim = 85;
			while (1)
			{
				if (SoldCheckIfHealthy())
				{ 
					my.LastState = Function_To_Pointer("Ahmed_At_Door");
					return;
				}
				ent_cycle("2cary" ,my.FrameAnim );				
				my.FrameAnim-=speed/50;
				if (my.FrameAnim <= 0)
				{
					maro = 0;
					my.FrameAnim = 0;
					temp.x = 30;
					temp.y = 0;
					temp.z = 0;
					vec_rotate(temp,my.pan);
					vec_add(temp,my.pos);
					create(<mrdie.mdl>,temp,mareim);
					you.pan  = my.pan+120;
					you.z-=10;
					morph(<ahm16.mdl>,me);
					break;
				}
				wait(1);
			}
			ent_cycle("2stand" ,my.FrameAnim );
		}
		else
		{ent_cycle("stand" ,my.FrameAnim );
		}
		my.FrameAnim = 0;
		while (1)
		{
			if (int(random(100)) > 90)
			{
				if (game_state[0] > 6)
				{ent_cycle("2shot" ,my.FrameAnim );
				}
				else
				{ent_cycle("3shot" ,my.FrameAnim );
				}
				
				my.FrameAnim += speed/5;
				if (my.FrameAnim > 100)
				{
					 my.FrameAnim = 0;
					 AhmedFlash();
					 AhmadShot(100);
				}
			}
				you = pointer_to_entity( my.enemyid);
				if (you == null)
				{
					temp.pan = 360;
					temp.tilt = 360;
					temp.z = 1700;
					indicator = _watch;
					scan (my.x,my.pan,temp);
				}
				else
				{
					AhmadShot(100);
				}

			if (Doors_State[Doornum] == 1)
			{break;
			}

			if (SoldCheckIfHealthy())
			{ 
				my.LastState = Function_To_Pointer("Ahmed_At_Door");
				return;
			}				
			wait(1);
		}
		my.FrameAnim = 0;
		my.pan = Apan;
		if (AhmedCond == 1)
		{
			maro= 1;
			morph(<ACarry.mdl>,me);
			while (1)
			{
				if (SoldCheckIfHealthy())
				{ 
					my.LastState = Function_To_Pointer("Ahmed_At_Door");
					return;
				}
				ent_cycle("2cary" ,my.FrameAnim );				
				my.FrameAnim+=speed/50;
				if (my.FrameAnim > 80)
				{my.FrameAnim = 0;break;
				}
				wait(1);
			}
		}
		AhmedRun();
	}
}

function Ahmed_At_Mareim_Door()
{
	morph(<ahmed.mdl>,me);
	ent_cycle("stnd" ,80);
	wait(10);
	temp.pan = 360;
	temp.tilt =360;
	temp.z = 200;//1000;
	indicator = _handle;
	scan (my.x,my_angle,temp);
	wait(50);
	AhmedRun();

}
function Ahmed_carry_mariem()
{
	my._health += 50;
	if (my._health > 0)
	{my._health=0;
	}
	AHldSld.u =max(my._health*8/25,-64);
	maro=1;
	my.FrameAnim = 0;
	ShowMessage(5,154);
	Play_My_Sounds(10,0);
	ent_cycle("2cary" ,0);
	morph(<Acarry.mdl>,me);
	//wait(50);
	ShowMessage(5,155);
	my.passable = 1;
	game_state[0] = 7;
	while (1)
	{
		ent_cycle("2cary" ,my.FrameAnim );
		my.FrameAnim+=speed/50;
		if (my.FrameAnim > 100)
		{my.FrameAnim = 0;break;
		}
		wait(1);
	}

	MisionsMsg5.visible=1;
	MisionsMsg6.visible=1;
	MisionsMsg4.ambient = -100;
	ShowMessionsAuto();
	AhmedRun();
}
function AhmedNextPoint()
{	

	Ahmed_Point = ent_nextpoint(my._target_x);
	//	Ahmed in Floor-1
	if (Ahmed_Point == 3)
	{
		morph(<ahm16.mdl>,me);
		play_sound(ak_ok,100); 
		Run_Solder_Create_Floor1(3,3,1);
	}
	if (Ahmed_Point == 6)
	{
		Apan = 10;
		AhmedCond = 0;
		WattingTime = 200;
		Ahmed_Wait();
		goto endo2;
	}
	if (Ahmed_Point == 7)
	{
		if (player.y < 400)
		{Run_Solder_Create_Iner(4,5,1);
		}
		else
		{Run_Solder_Create_Iner(6,7,1);
		}
	}
	if (Ahmed_Point == 9)
	{
		Apan = 85;
		if (player.x > 200)
		{Run_Solder_Create_Floor1(2,3,1);
		}
		else
		{Run_Solder_Create_Floor1(3,3,1);
		}		
		AhmedCond = 0;
		WattingTime = 200;
		Ahmed_Wait();
		goto endo2;
	}
	if (Ahmed_Point == 13)
	{
		Apan = 90;
		if (player.y < 400)
		{Run_Solder_Create_Iner(4,5,1);
		}
		else
		{Run_Solder_Create_Iner(6,7,1);
		}
		if (player.y > -1350)
		{Solder_Create_Stairs(1,0,2,0);
		}
		else
		{Run_Solder_Create_Iner(4,5,1);
		}
		AhmedCond = 0;
		WattingTime = 200;
		Ahmed_Wait();
		goto endo2;
	}
	if (Ahmed_Point == 14)
	{	FreindState.y=1;
		Doornum = 0;
		Apan = 90;
		AhmedCond = 0;
		Ahmed_At_Door();
		goto endo2;
	}
	//	Ahmed at stairs going to Floor-2
	if (Ahmed_Point == 17)
	{
		FreindState.y=0;
		Initial_Solder_Create_Floor2(8,9,11,12);
		game_state[0] = 5;
		ShowMessage(5,190);
		Doornum = 1;
		Apan = 160;
		AhmedCond = 0;
		Ahmed_At_Door();
		goto endo2;
	}
	if (Ahmed_Point == 20)
	{
		game_state[0] = 5;
		Doornum = 1;
		Apan = 320;
		AhmedCond = 0;
		Ahmed_At_Door();
		goto endo2;
	}
	if (Ahmed_Point == 21)
	{
		Apan = 45;
		AhmedCond = 0;
		WattingTime = 200;
		Ahmed_Wait();
		goto endo2;
	}
	//	Ahmed in Floor-2
	if (Ahmed_Point == 22)
	{
		if (player.x < -300)
		{Run_Solder_Create_Floor2(1,3);FreindState.z=1;
		}
		else
		{Run_Solder_Create_Floor2(0,3);FreindState.z=180;
		}
		Doornum = 2;
		Apan = 110;
		AhmedCond = 0;
		Ahmed_At_Door();
		goto endo2;
	}
	if (Ahmed_Point == 24)
	{
		Apan = FreindState.z;
		AhmedCond = 0;
		WattingTime = 200;
		Ahmed_Wait();
		goto endo2;
	}
	if (Ahmed_Point == 26)
	{
		if (player.x < -1000)
		{Run_Solder_Create_Floor2(6,3);FreindState.z=90;
		}
		else
		{Run_Solder_Create_Floor2(4,3);FreindState.z=180;
		}	
		goto endo1;
	}
	if (Ahmed_Point == 27)
	{
		Doornum = 3;
		Apan = 120;
		AhmedCond = 0;
		Ahmed_At_Door();
		goto endo2;
	}
	if (Ahmed_Point == 28)
	{
		Apan = FreindState.z;
		AhmedCond = 0;
		WattingTime = 200;
		Ahmed_Wait();
		goto endo2;
	}

	if (Ahmed_Point == 32)
	{
		if (player.x > 200)
		{Run_Solder_Create_Floor2(5,3);Apan = 180;
		}
		else
		{Run_Solder_Create_Floor2(7,3);Apan = 1;
		}
		AhmedCond = 0;
		WattingTime = 200;
		Ahmed_Wait();
		goto endo2;
	}
/*	if (Ahmed_Point == 33)
	{	
		if (player.x > 200)
		{Run_Solder_Create_Floor2(5,3);
		}
		else
		{Run_Solder_Create_Floor2(7,3);
		}
		goto endo1;
	}*/
	if (Ahmed_Point == 34)
	{
		morph(<ahmed.mdl>,me);
		Ahmed_At_Mareim_Door();
		goto endo2;
	}
	if (Ahmed_Point == 37)
	{
		Ahmed_carry_mariem();
		goto endo2;
	}
	if (Ahmed_Point == 40)
	{
		if (player.y < 600)
		{Run_Solder_Create_Floor2(4,3);
		}
		else
		{Run_Solder_Create_Floor2(3,2);
		}
		goto endo1;
	}
	if (Ahmed_Point == 42)
	{
		AhmedCond = 1;
		Apan = 285;
		WattingTime = 200;
		Ahmed_Wait();
		goto endo2;
	}
	if (Ahmed_Point == 43)
	{
		if (player.x < -500)
		{Run_Solder_Create_Floor2(2,2);
		}
		else
		{Run_Solder_Create_Floor2(1,3);
		}
		Doornum = 3;
		Apan = 90;
		AhmedCond = 0;
		Ahmed_At_Door();
		goto endo2;
	}
	if (Ahmed_Point == 47)
	{
		Doornum = 2;
		Apan = 90;
		AhmedCond = 0;
		Ahmed_At_Door();
		goto endo2;
	}
	//	Ahmed at stairs going to Floor0
	if (Ahmed_Point == 49)
	{
		CloseAllSongs();
		CurrentSong=OpenSong(SongName);
		playSong(CurrentSong);
		FreindState.y=1;
		if (player.z < -100)
		{Solder_Create_Stairs(4,1,2,1);
		}
		Doornum =1;
		Apan = 90;
		AhmedCond = 1;
		Ahmed_At_Door();
		goto endo2;
	}
	if (Ahmed_Point == 56)
	{
		FreindState.y=0;
		Initial_Solder_Create_Floor0(8,9,10,11);
		game_state[0] = 8;
		goto endo1;
	}

	if (Ahmed_Point == 58)
	{
		if (player.y > -1000)
		{Run_Solder_Create_Floor0(3,3,1);
		}
		else
		{Run_Solder_Create_Floor0(0,3,1);
		}
		Doornum = 4;
		Apan = 1;
		AhmedCond = 1;
		Ahmed_At_Door();
		goto endo2;
	}
	//	Ahmed in Floor0
	if (Ahmed_Point == 60)
	{
		if (player.y > -100)
		{Run_Solder_Create_Floor0(2,3,1);Apan = 90;
		}
		else
		{Run_Solder_Create_Floor0(1,3,1);Apan = 90;
		}
		AhmedCond = 1;
		WattingTime = 250;
		Ahmed_Wait();
		goto endo2;
	}
	if (Ahmed_Point == 62)
	{
		if (player.y > -100)
		{Run_Solder_Create_Floor0(1,3,1);Apan = 90;
		}
		else
		{Run_Solder_Create_Floor0(3,3,1);Apan = 120;
		}
		AhmedCond = 1;
		WattingTime = 250;
		Ahmed_Wait();
		goto endo2;
	}
	if (Ahmed_Point == 66)
	{
			if (player.y > -100)
			{Run_Solder_Create_Floor0(2,3,1);Apan = 180;
			}
			else
			{Run_Solder_Create_Floor0(1,3,1);Apan = 180;
			}
			Doornum = 5;
			Apan = 180;
			AhmedCond = 1;
			Ahmed_At_Door();
			goto endo2;
	}
	if (Ahmed_Point == 70)
	{
		RemoveAllKeys();
		VictoryScream();
		stop_sound(CurrentSong);
		play_loop VictoryPlayer, 5000;
		h_VictoryPlayer = result;
		on_enter = finalization;
		PreesNextLvl.visible = 1;
		Game_State[0]=-73;
		ZoomOut();
		HideEveryThing();
		Fade2black( 1, 1,Function_To_Pointer("Doflashing"));
		goto endo2;
	}
	
endo1:	AhmedRun();
endo2:
}

function AhmedRun()
{
	temp.x=0;
	temp.y=360;
	my_angle.x=10000;
	my_angle.y=100;
	my_angle.z=0;
	my._state = _state_Walk;
	while (my._state == _state_Walk)
	{
		if (my.passable == 0)
		{my.passable = 1;
		}
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("AhmedRun");
			return;
		}				
		if (vec_dist(my.x ,my._target_x ) < 25)
		{break;
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
		my.pan = my_angle.pan;
		temp.x = speed/35;
		temp.y = 0;
		temp.z = 0;
		my.z-=CheckTheFLoor(4000);
		move( my, temp, nullskill);
		wait(1);
	}
	AhmedNextPoint();
}



function Ahmed_Standing()
{
	exclusive_entity;
	my.FrameAnim = 0;
	my._state = _state_wait;
	ent_cycle("Jail" ,80);
	while (1)
	{
		if (SoldCheckIfHealthy())
		{ 
			my.LastState = Function_To_Pointer("Ahmed_Standing");
			return;
		}				
		if (FreindState == 1)
		{
			Kahled_Dist();
			AhmedRun();
			break;
		}
		wait(1);
	}
}

action Ahmed
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
	my._type = _type_compars;
	my.event = AhmedEvent;
	my.DieEvent = Function_To_Pointer("AhmedDie");
	my.HitEvent = Function_To_Pointer("AhmedHit");
	my.CollFunction = Function_To_Pointer("TraceCollision");
	my.AnimRun = 1;
	my._signal = 0;
	FreindState.z = Entity_To_Pointer(me);
	ent_path("ahmed");
	ent_waypoint(my._target_x,1);
	Ahmed_Standing();
	return;
}


function mareim()
{	
	while (1)
	{
		if (maro == 1)
		{
			remove me;
			break;
		}
		if (game_state[0] > 6)
		{ent_cycle("head" ,85);
		}	
		wait(1);
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
function Card_Event()
{
	if (event_type==event_scan)&&(indicator == _handle)
	{
		my.visible=0;	
		object1.visible = 1;
		my.invisible=1;
		game_state[0]= 12;
		End_Solder_Create_Floor0(7,4);
		wait(15);
		remove(me);
		MisionsMsg5.ambient = -100;
		ShowMessionsAuto();
		wait(15);
		return;		
	}

}

action card	
{
	wait(100);
	my.lightrange = 30;
	my.red = 255;
	my.green = 0;
	my.blue = 0;
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
		if (my.skill19 > 100)&&(vec_dist(my.pos,player.pos)<100)
		{
			my.skill19 =0;
			showmessage(5,196);
		}
		my.skill19 +=1*(speed/200);
		wait(1);
	}
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
			my.event = 0;
			my.flag1 = 1;
			temp.pan = 360;
			temp.tilt =360;
			temp.z = 200;//1000;
			indicator = _explode;
			scan (my.x,my_angle,temp);
			create( <xplosion.mdl>, my.pos,ExplosionsTga);
			my.ambient = -50;
			my.passable = 1;
			break;
		}
		wait(1);
	}
}


function M4Weapon()
{
	my.WeaponNumber = m16;
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

function AhmedWeapon()
{
	while (1)
	{
		if (Ahmed_Point == 3)
		{remove me;break;
		}
		wait(1);
	}
}

function Cufes()
{
	wait(100);
	while (1)
	{
		if (FreindState.y == 1)
		{
			if (my.skill11 == 1)
			{my.pan +=160;
			}
			if (my.skill11 == 2)
			{my.tilt +=160;
			}
			break;
		}
		
		wait(1);
	}
}

function SpotKahled()
{
	wait(100);
	my.skill27 = 0;
	while (1)
	{
		if (my.skill27 == 0)&&(vec_dist(my.pos,player.pos)<50)
		{
			my.skill27 =100;
			showmessage(5,194);
		}
		if (vec_dist(my.pos,player.pos)<50)
		{my.skill27 -=1*(speed/200);
		}
		wait(1);
	}
}

function FAuto()
{
	my.skin = 2;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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