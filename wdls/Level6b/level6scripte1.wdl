
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

//	This muste beAdd in the other files
////////////////////////////////////////////////////////////////
//	in variables 
//	var Solder_Creation_Counter[4]=0,0,0,0;
//	var Game_State[3]=0,0,0;	
//	var GameState=0;
//////////////////////////////////////////////////////////////////////////
function rbjbullet()
{
	my.enable_block = on;
	my.enable_entity = on;
	my.enable_stuck = on;
	my.enable_impact = on;
	my.enable_push = on;
	my.enable_scan = on;
	my.enable_detect = on;
	my.event = _Pazoka_Bullet_event;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	my.max_x *= 0.5;
	my.max_y *= 0.5;
	my.max_z *= 0.5;

	my.ambient = 255;
	my.lightred = 255;
	my.lightgreen = 200;
	my.lightblue = 100;
	my.lightrange = 50;
	my.owntype = TypeOfBullete;
	you = Pointer_To_Entity(bullettarget);
	while (1)
	{
		temp.x=my.skill10-my.x;
		temp.y=my.skill11-my.y;
		temp.z=my.skill12-my.z;
		vec_to_angle(my_angle,temp);	
		temp2.x=0;
		temp2.y=0;
		temp2.z=0.01;
		vec_rotate(temp2,my_angle);

		temp.x=5;
		temp.y=0;
		temp.z=0;
		my_angle.pan=random(360);
		my_angle.tilt=random(360);
		vec_rotate(temp,my_angle);
		vec_add(temp,my.pos);
		effect(BigBlacksmoke_Trail,1,temp,temp2);
		temp.x = (you.x - my.x);
		temp.y = (you.y - my.y);
		temp.z = (you.z - my.z);
		vec_to_angle(my_angle,temp);
		my.pan=my_angle.pan;
		my.tilt=my_angle.tilt;
		temp.x=2*(speed/10);
		temp.y=0;
		temp.z=0;
		my.force = temp.x*10;
		if (CheckBulleteMove())
		{goto  endrbj;
		}
		move(me,temp,nullvector);
		wait(1);
	}
	endrbj:
	remove me;
}

function rbjman()
{
	wait(50);
	my.invisible = 1;
	you = Pointer_To_Entity(malalehpoint[0]);
	bullettarget=malalehpoint[0];
	//you = malalah;
	temp.x = (you.x - my.x);
	temp.y = (you.y - my.y);
	temp.z = (you.z - my.z);
	vec_to_angle(my_angle,temp);
	//my.pan=nearangle(my.pan,my_angle.pan,3);
	my.pan=my_angle.pan;
	wait(50);
	vec_for_vertex(temp,me,550);
	create(<bullet_rbg.mdl>,temp,rbjbullet);
	wait(50);
	you=Pointer_To_Entity(malalehpoint[1]);
	bullettarget=malalehpoint[1];
	//you = walll;
	temp.x = (you.x - my.x);
	temp.y = (you.y - my.y);
	temp.z = (you.z - my.z);
	vec_to_angle(my_angle,temp);
	//my.pan=nearangle(my.pan,my_angle.pan,3);
	my.pan=my_angle.pan;
	wait(50);
	vec_for_vertex(temp,me,550);
	create(<bullet_rbg.mdl>,temp,rbjbullet);
	wait(50);
	you=Pointer_To_Entity(malalehpoint[2]);
	bullettarget=malalehpoint[2];
	//you = walll;
	temp.x = (you.x - my.x);
	temp.y = (you.y - my.y);
	temp.z = (you.z - my.z);
	vec_to_angle(my_angle,temp);
	//my.pan=nearangle(my.pan,my_angle.pan,3);
	my.pan=my_angle.pan;
	wait(50);
	vec_for_vertex(temp,me,550);
	create(<bullet_rbg.mdl>,temp,rbjbullet);
	temp.x=-157;
	temp.y=-400;
	temp.z=1200;
	vec_set(my.pos,temp);
	you=Pointer_To_Entity(malalehpoint[3]);
	bullettarget=malalehpoint[3];
	//you = walll;
	temp.x = (you.x - my.x);
	temp.y = (you.y - my.y);
	temp.z = (you.z - my.z);
	vec_to_angle(my_angle,temp);
	//my.pan=nearangle(my.pan,my_angle.pan,3);
	my.pan=my_angle.pan;
	wait(50);
	vec_for_vertex(temp,me,550);
	create(<bullet_rbg.mdl>,temp,rbjbullet);
	remove me ;

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



function HarmlesExplosionsTga()
{

 my.flag3 = 1-you.flag3;
 my.flag1  = you.flag2 == 1;
 scan(my.pos,my.angle,temp);
if (my.flag3)
{
 play_entsound( me, grenadex,10000);
}else
{
 play_entsound( me, gazExplosion,10000);

}
 my.bright = 1;
 my.light  = 1;
 my.passable  = 1;

 my.scale_x = 1.2;
 my.scale_y = 1.2;
 my.scale_z = 1.2;
 temp.x = camera.x - my.x;
 temp.y = camera.y - my.y;
 temp.z = camera.z - my.z;
 vec_to_angle( my.pan, temp);
 my.lightrange = 500;

 my.lightred   = 50+205*my.flag3;
 my.lightgreen = 75+180*my.flag3;
 my.lightblue  = my.lightred;

 my_angle.x = my.lightred;
 my_angle.y = my.lightgreen;
 my_angle.z = my.lightblue;
 effect( PartsThrow, 5, my.pos, my_angle);
while (my.frameanim<100)
{
 my_angle.x = my.lightred;
 my_angle.y = my.lightgreen;
 my_angle.z = my.lightblue;
 effect( PartsThrow, 5, my.pos, my_angle);
 if (my.flag3==0)
 {
	temp.x = random(50)+50;
	temp.y = 0;
	temp.z = 0;
	temp2.x = random(360);
	temp2.y = random(180)-90;
	vec_rotate( temp, temp2);
	vec_add( temp, my.x);
	effect( PartsThrow, 5, temp, my_angle);
 }
	my.frameanim+=15;
	my.skin = my.frameanim*7/100;
	ent_frame(  "frame", my.frameanim);
	my.lightrange  = max( 0, 50- my.frameanim)*10;
	wait(1);
}
my.invisible =1;
wait(1000);
remove me;
}



////////////////////////////////////////////////////////////////////////



function SoldersGroupCreation1()
{
	var count=0;
	while (1)
	{
		temp.x	= SoldersPos1x[count];
		temp.y	= SoldersPos1y[count];
		temp.z	= SoldersPos1z[count];
		create( <ckm16.mdl>, temp, SoldColl);
		you.skill6=18;
		you.skill8 = 3;
		count+=1;
		if (count == 8)
		{
			break;
		}
		wait(1);
	}
}

function SoldersGroupCreation2()
{
	var count=0;
	while (1)
	{
		temp.x=SoldersPos2x[count];
		temp.y=SoldersPos2y[count];
		temp.z=SoldersPos2z[count];
		create(<ckm16.mdl>,temp,SoldColl);
//		you.skill7=7;
		you.skill6=18;
		you.skill8 = 3;
		count+=1;
		if (count == 8)
		{break;
		}
		wait(1);
	}
}

function SoldersGroupCreation3()
{
	var count=0;
	while (1)
	{
		temp.x=SoldersPos3x[count];
		temp.y=SoldersPos3y[count];
		temp.z=SoldersPos3z[count];
		create(<ckm16.mdl>,temp,SoldColl);
//		you.skill7=7;
		you.skill6=18;
		you.skill8 = 3;
		count+=1;
		if (count == 8)
		{break;
		}
		wait(1);
	}
}

function SoldersGroupCreation4()
{
	var count=0;
	while (1)
	{
		temp.x=SoldersPos4x[count];
		temp.y=SoldersPos4y[count];
		temp.z=SoldersPos4z[count];
		create(<ckm16.mdl>,temp,SoldColl);
//		you.skill7=7;
		you.shadow = shadowenable;
		you.skill6=18;
		you.skill8 = 3;
		count+=1;
		if (count == 7)
		{break;
		}
		wait(1);
	}
}
function SoldersGroupCreation5()
{
	var count=0;
	while (1)
	{
		temp.x=SoldersPos5x[count];
		temp.y=SoldersPos5y[count];
		temp.z=SoldersPos5z[count];
		create(<ckm16.mdl>,temp,SoldColl);
		you.skill6=18;
		you.skill8 = 3;
//		you.skill7=7;
		you.shadow = shadowenable;
		count+=1;
		if (count == 4)
		{break;
		}
		wait(1);
	}
}
function SoldersGroupCreation6()
{
	var count=0;
	while (1)
	{
		temp.x=SoldersPos6x[count];
		temp.y=SoldersPos6y[count];
		temp.z=SoldersPos6z[count];
		create(<ckm16.mdl>,temp,SoldColl);
		you.skill6=18;
		you.skill8 = 3;
//		you.skill7=7;
		you.shadow = shadowenable;
		count+=1;
		if (count == 4)
		{break;
		}
		wait(1);
	}
}
function SoldersGroupCreation7()
{
	var count=0;
	while (1)
	{
		temp.x=SoldersPos7x[count];
		temp.y=SoldersPos7y[count];
		temp.z=SoldersPos7z[count];
		create(<ckm16.mdl>,temp,SoldColl);
		you.skill6=18;
		you.skill8 = 3;
//		you.skill7=7;
		you.shadow = shadowenable;
		count+=1;
		if (count == 4)
		{break;
		}
		wait(1);
	}
}

////////////////////////////////////////////////////////////////////////


function starte_level()
{
	wait(50);
	bullettarget=player.bodylnk;
	Game_State[1] = 1;
	ShowMessage(5,132);
	Play_My_Sounds(1,0);
	MisionsMsg1.visible=1;
	MisionsMsg2.visible=1;
	MisionsMsg3.visible=1;
	MisionsMsg4.visible=0;
	MisionsMsg5.visible=0;
	MisionsMsg6.visible=0;
	MisionsMsg7.visible=0;
	MisionsMsg8.visible=0;
	ShowMessionsAuto();
	object1.skin=4;
	object2.skin=2;
	object3.skin=6;
	if (level.y == 1)
	{game_time=500;
	}
	if (level.y == 2)
	{game_time=400;
	}
	if (level.y == 3)
	{game_time=350;MovieOrSucess = 1;
	}
	while (1)
	{
		if (Game_State[0] == -73)
		{return;
		}
		game_time-=sys_seconds/500;
		test_num1 = game_time;
		if (game_time < 100)&&(game_state[0] < 3)
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

		if (player.z > 200)&&(player.z < 400)&&(player.x < -1450)&&(SolderCreationCounter[0]==0)
		{
			SolderCreationCounter[0]=1;
			SoldersGroupCreation1();
			Play_My_Sounds(17,0);
			ShowMessage(5,141);
			wait(15);
		}
		if (player.z > 340)
		{
			if ((player.x > -310)&&(player.y < 180))||((player.x <-2000)&&(player.y >-630))
			{
				if (SolderCreationCounter[2] == 0)
				{
					SolderCreationCounter[2]=1;
					SoldersGroupCreation3();
					Play_My_Sounds(13,0);
					ShowMessage(5,148);
					wait(15);
					ShowMessage(5,144);
				}
			}
			if (player.y < -435)||((player.x > 0)&&(player.y > 500))
			{
				if (SolderCreationCounter[1] == 0)
				{
					SolderCreationCounter[1]=1;
					SoldersGroupCreation2();
					Play_My_Sounds(18,0);
					ShowMessage(5,150);
					wait(15);
				}
			}
		}
		if (game_state[0] == 3)&&(player.z < 190)
		{
			game_state[0] = 4;
			temp.x=600;
			temp.y=-80;
			temp.z=700;
			create(<ahrbj.mdl>,temp,rbjman);
			Play_My_Sounds(9,0);
			ShowMessage(5,150);
			wait(15);
			ShowMessage(5,153);
			wait(15);
		}
		if (game_state[0] == 4)
		{
			if (player.x > 1200)&&(SolderCreationCounter[4]==0)
			{
				SolderCreationCounter[4]=1;
				SoldersGroupCreation5();
			}
			if (player.x < -2050)&&(SolderCreationCounter[5]==0)
			{
				SolderCreationCounter[5]=1;
				SoldersGroupCreation6();
			}
			if (player.y < -3000)&&(SolderCreationCounter[6]==0)
			{
				SolderCreationCounter[6]=1;
				SoldersGroupCreation7();
				SoldersGroupCreation6();
				temp.x = 2070;
				temp.y = -5600;
				temp.z = 1200;
				create(<plane.mdl>,temp,GazPlane);
				Play_My_Sounds(11,0);
				ShowMessage(5,152);
				wait(50);
			}
		}
		if (GazPazokanum.z == 100)
		{
			//WhiteScreen.visible = 1;
			//WhiteScreen.alpha=0;
			while (1)
			{
				if (Game_State[0] == -73)
				{return;
				}
				BlackScreen.alpha+=1;
				camera.roll+=0.5;
				if (BlackScreen.alpha>35)
				{GazPazokanum.z = -100;break;}
				wait(1);
			}
		}
		if (GazPazokanum.z == -100)
		{
			if (Game_State[0] == -73)
			{return;
			}
			while (1)
			{
				BlackScreen.alpha-=1;
				camera.roll-=0.5;
				if (BlackScreen.alpha<15)
				{GazPazokanum.z = 100;break;}
				wait(1);
			}
		}
		if( game_time.x < 0 )&&(game_state[0] < 3)
		{
				if (Game_State[0] == -73)
				{return;
				}

				me = 0;
				Game_State[0]=100;
				Play_My_Sounds(14,0);
				ShowMessage(5,146);
				wait(50);
				MissionFailed();
				break;
		}
		wait(1);
	}

}

function followplayer()
{
	wait(50);
	Game_State[0]=1;
	FollowingP = Entity_To_Pointer(me);
	ObjecPos1.frame = 2;
	while (1)
	{
		if (objectposition != null)
		{
			you=Pointer_To_Entity(objectposition);
			ObjecPos.frame = 1;
			temp.x = you.x - player.x;
			temp.y = you.y - player.y;
			temp.z = you.z - player.z;
			vec_to_angle( temp, temp);
			ObjecPos.roll = player.pan - temp.pan;
		}
		else
		{
			ObjecPos.frame = 2;
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
function Eventboomr()
{
	if(event_type == event_push && you._type != _type_player) { return; }
		my.event=0;
		if (my.skill20 == 1)
		{
			my.invisible=1;
			Game_State[2] = 1;
			Play_My_Sounds(33,0);
			object1.visible = 1;
			wait(5);
			ShowMessage(5,134);
			Play_My_Sounds(4,0);
			wait(50);
			ShowMessage(5,133);
			wait(20);
			remove(me);
			MisionsMsg1.ambient=-100;
			ShowMessionsAuto();
			return;
		}
		if (my.skill20 == 2)
		{
			my.invisible=1;
			Game_State[3] = 1;
			Play_My_Sounds(33,0);
			object3.visible = 1;
			wait(5);
			ShowMessage(5,135);
			Play_My_Sounds(6,0);
			wait(20);
			remove(me);
			MisionsMsg2.ambient=-100;
			ShowMessionsAuto();
			return;
		}
		if (my.skill20 == 3)
		{
			my.invisible=1;
			Game_State[4] = 1;
			Play_My_Sounds(33,0);
			object2.visible = 1;
			wait(5);
			ShowMessage(5,136);
			Play_My_Sounds(5,0);
			wait(5);
			remove(me);
			MisionsMsg3.ambient=-100;
			ShowMessionsAuto();
			return;
		}
}
action box_boom1
{    
		sonar me,4000;
		my.z -= result;
		my.scale_x=2;
		my.scale_y=2;
		my.scale_z=2;
		wait(1);
		my.push = -1;
		my.enable_push = on;
		my.event = Eventboomr;
		if (my.skill20 == 1)
		{
			objectposition=entity_to_pointer(me);
			my.skin = 6;
		}
		if (my.skill20 == 2)
		{my.skin = 7;
		}
		if (my.skill20 == 3)
		{my.skin = 5;
		}
		while (1)
		{
			if (Game_State[2] == 1)&&(Game_State[3] == 0)&&(Game_State[4] == 0)&&(my.skill20 == 2)
			{objectposition = entity_to_pointer(me);
			}
			if (Game_State[2] == 1)&&(Game_State[3] == 1)&&(my.skill20 == 3)
			{objectposition = entity_to_pointer(me);
			}
			if (Game_State[2] == 1)&&(Game_State[4] == 1)&&(my.skill20 == 2)
			{objectposition = entity_to_pointer(me);
			}
			if (Game_State[2] == 1)&&(Game_State[3] == 1)&&(Game_State[4] == 1)
			{
				objectposition = null;
				Game_State[0]=2;
			}
			wait(1);
		}
}


//////////////////////////////////////////////////////////////////////
var ahmed_state=0;
var ahmed_point;
var H_counter =0;


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
}
function AhmedNextPoint()
{	
	if (game_state[0] > 3)
	{remove me;return;
	}
	ahmed_point = ent_nextpoint(my._target_x);
	if (ahmed_point == 4)&&(ahmed_state ==0)
	{
		ahmed_state = 1;
		ent_path("path_002");
		ahmed_point = 1;
		ent_waypoint(my._target_x,1);
	}
	if (ahmed_state == 1)
	{
		if (ahmed_point == 3)
		{
			my.pan = 220;
			my.FrameAnim = 0;
			H_counter = 0;
			while (H_counter < 100)
			{
				if (int(random(10))>5)
				{play_entsound( me, lmg_fire_sound, 500);
				}
				ent_cycle("6shot",my.FrameAnim);
				Short_GunFlash( me, 35, 47); 
				my.FrameAnim += 10;
				H_Counter + =1;
				wait(1);
			}

		}
		if (ahmed_point == 1)
		{
			my.pan = 250;
			my.FrameAnim = 0;
			H_counter = 0;
			while (H_counter < 100)
			{
				if (int(random(10))>5)
				{play_entsound( me, lmg_fire_sound, 500);
				}
				ent_cycle("6shot",my.FrameAnim);
				Short_GunFlash( me, 35, 47); 
				my.FrameAnim += 10;
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
		my.FrameAnim+=speed/50;
		temp.x = my._target_x - my.x ;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
		vec_to_angle( my_angle, temp);
		my.pan=nearangle(my.pan,my_angle.pan,50);
		temp.x = speed/50;
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
	my.WeaponNumber = m16;
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
	//my.event = AhmedEvent;
	//my.DieEvent = AhmedDie;
	//my.HitEvent = AhmedDie;
	//my.CollFunction = TraceCollision;
	my.AnimRun = 1;
	my._signal = 0;
	AhmedMessage();
	//AhmedScanForPlayer();
	ent_path("path_001");
	ent_waypoint(my._target_x,1);
	AhmedRun();
}

//////////////////////////////////////////////////////////////////////
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
		my.GotHit = 100;
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

function ord_cars
{
	my.OwnType = TypeOfCars;
	my.CarBlend = 0;//random(100)>60;
	my.shadow = shadowenable;
	OrdCarIni1();
}

////////////////////////////////////////////////////////////////////////////////

function ComparsDie()
{
	play_entsound(me,ComparsDieing,300);
	my._state = _state_die;
	RemoveColl(me);
	me = 0;
	if (Game_State[0] < 3)
	{
		Play_My_Sounds(15,0);
		showmessage(5,145);
		wait(15);
		Kick_Action=0;
		MissionFailed();
		remove(me);
	}
	else
	{showmessage(5,187);
	}
}
function Comparsevent()
{
	if event_type == event_scan && indicator == _explode
	{
	
		//my._health-=1000;
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire && Game_State[0] < 3)
	{ 
		showmessage(5,184);
		wait(10);
		HeartPlayer( 5 );
		my._health -= 25;
		wait(25);
	}
}

function EndOpject()
{
	my.invisible = 1;
	objectposition=entity_to_pointer(me);
}
function man_help_boy()
{
while (player == null)
{
wait(1);
}

	my.FrameAnim = 0;
	while (1)
	{
		while(1)
		{
			if (Game_State[0] == 2)&&(Game_State[4]==1)
			{
				wait(25);
				Game_State[4]=0;
				objectposition = entity_to_pointer(me);
				MisionsMsg4.visible=1;
				ShowMessionsAuto();
				showmessage(5,137);
				Play_My_Sounds(7,0);
				wait(15);
			}
			if (Game_State[0] == 2)&&(vec_dist(my.pos,player.pos) < 200)
			{
				Ammo_panel.visible = 0;
				Game_State[0] = 3;
				my._health -=200;
				temp.x=2130;
				temp.y=-6430;
				temp.z=50;
				create(<point1.MDL>,temp,EndOpject;);
				SolderCreationCounter[3]=1;
				//Ammo_panel.visible=0;
				SoldersGroupCreation4();
				my._health-=1000;
				temp.x=-413;
				temp.y=900;
				temp.z=255;
				explosionscale = 0.75;
				create( <xplosion.mdl>, temp, HarmlesExplosionsTga);
				object1.visible = 0;
				object2.visible = 0;
				object3.visible = 0;
				showmessage(5,187);
				wait(25);
				showmessage(5,138);
				Play_My_Sounds(36,0);
				wait(75);
				showmessage(5,139);
				wait(50);
				showmessage(5,140);
				MisionsMsg4.ambient=-100;
				MisionsMsg5.visible=1;
				ShowMessionsAuto();
				break;
			}
			if ( my.SoundWR==0)
			{ play_entsound(me,ComparsHeart,300);
			my.SoundWR=-300; }
			my.SoundWR+=2;
			ent_cycle("hearting", my.FrameAnim);
			my.FrameAnim += speed/50;
			if (my.FrameAnim == 100)
			{break;
			}
			wait(1);
		}
		my.FrameAnim = 0;
		if (my._health < -200)
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
	my._type = _type_compars;
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
var BoompingWall = 0;

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
	//create(<Hala.MDL>,my.pos,dust_explosion1);moa
	/*str_for_entname( name, me);
	morph ( name, me);*/
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
		if (Game_State[0] == -73)
		{return;
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


//////////////////////////////////////////////////////////////////////////
function thrower()
{
	my.invisible=1;
	temp.x = player.x- my.x ;
	temp.y = player.y - my.y;
	temp.z = player.z - my.z;
	vec_to_angle( my_angle, temp);
	my.pan=my_angle.pan;
	hthrowthegrenade(me,110);
}