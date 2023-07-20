include <playerParts.wdl>;
include <playerfx.wdl>;
include <camra.wdl>;
include <playercamera.wdl>;
include <Collision.wdl>;

function dropthing(Cme)
{
	me = Cme;
	if (me)
	{
	my.tilt=0;
	my.pan=0;
	my.roll=0;
	my.passable=0;
	while (1)
	{
			sonar me,4000;
			if (result>0)
			{
				me.z-=min(10,result)*speed/200;
			}else
			{
				break;
			}
	wait(1);
	}
	}

}

function preparecamera()
{
		player.invisible = 0;

		you = Pointer_To_Entity( player.WeaponMesh1);
		you.invisible = 0;
		you.shadow = 0;

		weapon.invisible = player.invisible == 0;


}

function MoveCollision()
{
	me = CollisionEntity;
	my.passable = 0;
	move_mode = ignore_passable + ignore_models + ignore_sprites;
	ent_move( target, nullskill);
	my.passable = 1;

}

//--------------------------------------------------------------------------
// hani code
function ShowDeathMessages()
{
	
	if (int(random(2)) == 1)
	{
		//showmessage(10,159);	
		showmessage(10,162);	
		play_sound(S_M_L3_43,100);			
	}
	else
	{
		//showmessage(10,156);
		showmessage(10,159);
		play_sound(S_M_L3_40,100);
	}
		
}
//--------------------------------------------------------------------------

function cameratarget()
{
	my.passable  = 1;
	my.invisible = 1;
}

var PlayerHitSound;
var hwakin==0;
sound PlDed, <PlDie.wav>;
function HeartPlayer(HV)
{
	entiy = Pointer_To_Entity( player.BodyLnk);
	if (entiy._health<-100){
		return;
	}
	entiy._health = max(-110,entiy._health-HV);
	if (hwakin)
	{
		entiy._health = max(-100,entiy._health-HV);
	}
	HldSld.u =max(entiy._health*16/25,-64);
	
	temp.x = you.x - my.x;
	temp.y = you.y - my.y;
	temp.z = you.z - my.z;
	vec_to_angle( temp, temp);
	EnemyPos.roll = player.pan - temp.pan;
	vec_set( EnemyPos.Enemy_X, my.x);

	OCBlood(HV);
	if (snd_playing(PlayerHitSound)==0) && (playerded == 0)
	{
		
		//---------------------------------
		// hani code
		if (ssSmoke == 1)
		{
			play_sound(mcough,100);
		}
		else
		{
			play_sound(HitSound44,100);
		}								
		PlayerHitSound = result;
		//---------------------------------
	}
	you = me;
	me = player;
	if (entiy._health<-100)
	{
	if (you == player)
	{
		vec_set( temp, player.x);
		temp.x += 1000;
		create( <dust.mdl>, temp, cameratarget);
	}
		
		VWeaponSprite.visible = 0;
		dropthing( Pointer_To_Entity( player.WeaponMesh1));
		on_enter = LLoadLastSave;
		var FrameTime = 0;
		cameraction = freecamera;
		if (camera.arc!=60)
		{zoom();
		}
		//-----------------------------------
		// hani code
		messionfailed = 1;
		ShowDeathMessages();
		playerded = 1;
		stop_sound(SoundPlaying);
		stop_sound(S2DPlayeing);
		//-----------------------------------
		preparecamera();
		BlackScreen2.visible = 1;
		cpointer.visible = 0;
		BlackScreen2.alpha=0;
		wait(2);
		play_sound( PlDed,100);
		h_PlDed = result;
		eplhealth = 1;
		
		//SetActivePart( SharedEntity, BodyParts[0],1);
		//SetActiveSeq( SharedEntity,  BodyParts[0],"Killed_Bombaction");
		//--------------------------------------------------------------
		// hani code
		if (weapon_number == 9)
		{
			SetActivePart( SharedEntity, BodyParts[1],0);
			SetActivePart( SharedEntity, BodyParts[0],1);
			SetActiveSeq( SharedEntity,  BodyParts[0],"die");
		}
		else
		{
			SetActivePart( SharedEntity, BodyParts[0],0);
			SetActivePart( SharedEntity, BodyParts[1],1);
			SetActiveSeq( SharedEntity,  BodyParts[1],"die");

		}
		//--------------------------------------------------------------

		
		while (1)
		{
			if (BlackScreen2.alpha<44)
			{
				BlackScreen2.alpha = min(44,FrameTime*5);
			}
			FrameTime +=0.25*speed/200;

			temp.x = you.x - my.x;
			temp.y = you.y - my.y;
			temp.z = you.z - my.z;
			vec_to_angle( my_angle, temp);
			my_angle.pan+=FrameTime*18;
			temp.x = -150;
			temp.y=0;
			temp.z=0;
			vec_rotate( temp, my_angle);
			if (FrameTime<20)
			{

				if (weapon_number == 9)
				{	AnimModelPart( SharedEntity, 22.5*speed/100, BodyParts[0]);
				}
				else
				{	AnimModelPart( SharedEntity, 22.5*speed/100, BodyParts[1]);
				}
				GetMeshVertex( SharedEntity, me);
				//-----------------------------------------------------------------

				vec_add( temp, my.pos);
				vec_set( ScanValues[6], temp);
				vec_set( ScanValues[9], temp);
				ScanValues[8] += 200;
				ScanValues[11] += 150;

				temp.x = -20;temp.y=0;temp.z=0;
				vec_rotate( temp, my_angle);
				vec_add( temp, my.pos);

				vec_set( ScanValues[0], temp);
				vec_set( ScanValues[3], temp);
				ScanValues[5] += 100;

				ArcPrcnt( FrameTime/20);
			}else
			{
				
				temp.z += 150;
				vec_to_angle( my_angle, temp);
				temp.x =vec_length(temp)* max(0.5,abs(cos(FrameTime/23*180)));temp.y=0;temp.z=0;
				vec_rotate( temp, my_angle);
				vec_add( temp, my.pos);
				vec_set( target, temp);
				speed = max(abs(cos(FrameTime/23*180))*200,10);
				if (FrameTime>40)
				{ break;}
			}
			vec_set( CollisionEntity.pos, my.pos);
			vec_sub( target, my.pos);
			MoveCollision();
			vec_set( camera.x, CollisionEntity.pos);

			temp.x = my.x - camera.x;
			temp.y = my.y - camera.y;
			temp.z = my.z - camera.z;
			vec_to_angle( my_angle, temp);
			camera.pan = my_angle.pan;
			camera.tilt = my_angle.tilt;
			wait(1);
		}
		me = 0; you = 0;
		VisMainMenu(1);
		//MLoadMenu.visible = 0;
		//MSettingsMenu.visible = 0;
		MBackMenu.visible = 0;
		on_esc = 0;
	}


}

function PointToWaterDots()
{
my.skill2 = Entity_To_Pointer( you);
my.skill1 = 0;
my.skill3 = my_angle.x;
my.passable = 1;
my.invisible = 1;
my.z += 200;
sonar me, 4000;
my.z -= result;wait(1);
while ( snd_playing(PlayerWalkSound))
{
	entiy = Pointer_To_Entity( my.skill2);
	vec_for_vertex( my.pos, entiy, my.skill3);
	my.z += 200;
	sonar me, 4000;
	my.z -= result;
	effect( Bullete_Smoke, 10, my.pos, entiy.pan);
	my.skill1 += 1;
	wait(1);
}
remove me;
}

var SoundInd;
function PlayerSoundPlay(Ind)
{
if (snd_playing(PlayerWalkSound)!=0)
{ return;}
me = player;
if (ind == 0)
{
	if (frc(SoundInd/2)!=0)
	{
		
		my_angle.x = 139;
		vec_for_vertex( temp, player, 139);
		if ( content( temp) ==content_passable)
		{
				create( <point1.mdl>, temp, PointToWaterDots);
				 play_sound (PlayerWatr1Move,1000);
		}else
		{
				 play_sound (PlayerPav1Move,1000);
		
		}
				 PlayerWalkSound = result;
		
	}else
	{
		
		my_angle.x = 180;
		vec_for_vertex( temp, player, 180);
		if ( content( temp) ==content_passable)
		{
				create( <point1.mdl>, temp, PointToWaterDots);
				 play_sound (PlayerWatr2Move,1000);
		}else
		{
				 play_sound (PlayerPav2Move,1000);
		
		}
				 PlayerWalkSound = result;
	
	}
	goto end;
}

end:
	SoundInd+=1;
}

function SoundingSteps(sounddist)
{
my = Pointer_To_Entity( my.bodylnk);
indicator = StepSound;
AbdForce.x = 360;
AbdForce.y = 360;
AbdForce.z = sounddist;
scan( my.pos, my.pan, AbdForce);
}

function animaplayer()
{
	AbdForce.z = 0;
	AbdForce.x = vec_length(AbdForce);
	AbdForce.y = AbdForce.x;
	if (AbdForce.x!=0)
		{
			my.FrameAnim += AbdForce.x*5;
			AbdForce.x = sin(90+int(frc(my.FrameAnim/100)*100)/100*360);
			if (abs(AbdForce.x)>0.95)
				{
				 SoundingSteps(300);
				 PlayerSoundPlay(0);

				}
		}
		else
		{
			my.FrameAnim = 0;
		}

}

var FallTime = 0;

/*function NSonar(Ent)
{

var myhight=0;
var FloorPos;
	me = Ent;
	 trace_mode = ignore_me + ignore_passable + ignore_sprites;
	 vec_set( FloorPos, my.pos);
	 FloorPos.z -= 4000;
	 myhight  = trace( my.x, FloorPos)+ my.min_z;
	 temp2.x = myhight;
	 myhight  = max(min( myhight, 10),-10);
	 return(myhight);
}
*/

function NSonar(Ent)
{
	 var myhight=0;
	 me = Ent;
	 sonar me, 4000;
	 temp2.x = result;
	 myhight  = max(min( temp2.x, 10),-10);
	 return(myhight);
}

function moveplayer()		//replace
{		
	vec_set( AbdForce, temp);
	my.force = temp.x*0.75;
	if ( weapon)
	{ my.force /= max(Weap_Weight[weapon_number-1]/3,1);}
	
	temp.x = NSonar( Pointer_To_Entity( my.BodyLnk));

	if ( temp2.x != 0 )
		{
			if (temp2.x > 10)
			{
				if (lader_player)
				{
					FallTime = 0;
				}else
				{
					FallTime += 5;
				}
			}else
			{
			   if (temp2.x <= 2)
			    {
				if (FallTime>100)
				{
				 you = player;
				 HeartPlayer( FallTime-50);
				}
			    }
			}
			my.GravityWork = max(nearnumber( my.GravityWork, -temp.x, 2.5*speed/200),-temp.x);
			
		}
	else
		{
			if (FallTime>100)
			{
			 you = player;
			 HeartPlayer( FallTime-50);
			}
			FallTime = 0;
			my.GravityWork = max( 0, my.GravityWork);
			Jump_State = 0;
		}
	

	if(lader_player == 0)
	{
		if (grnade_firing == 0)
		{
			temp.x = my.force*10*Kick_Action;
			temp.y *= 10*Kick_Action;
		}
		else
		{
			temp.x=0;
			temp.z=0;
		}
		temp.z = my.GravityWork;

	}
	else
	{
		if(player.z>450)&&(player.z<650)
		{
			
			if (my.force != 0)
			{
				if (snd_playing(StepResults) == 0)
				{
					stepselect = -stepselect;
					if (stepselect == 1)
					{
						play_sound(stplader1,100);	
					}
					else
					{
						play_sound(stplader2,100);	
					}
					
					StepResults = result;
				}
				
			}
			
			
			if(my.force>0)
			{lader_player=1;
			}else
			{lader_player=2;
			}
			temp.x=0;
			temp.y=0;
			temp.z=my.force*10*Kick_Action;
		}
		else
		{
			if(player.z>650)&&(lader_player==1)
			{jump_lader=1;
			}
			lader_player = 0;
			Gun_Hand_state();
		}
	}
	if (abs(my.GravityWork)>50)
	{
		OCBlood(my.GravityWork);
	}
	CamraPan += vec_length(temp);
	CamraPan.tilt = vec_length(temp)/5;
	entiy =Pointer_To_Entity(my.BodyLnk);
	E_UPass( 39, _type_compars);
	move( entiy, temp, nullskill);
	E_Pass( 39, _type_compars);

	if (camera.arc != 60)
	{
		my_angle.pan/=10;
		my_angle.tilt/=10;
	}
	if (lader_player == 0)
	{my.pan += my_angle.pan*MousPeed*Kick_Action;
	}

	you = Pointer_To_Entity(my.BodyLnk);
	vec_set( you.pan, my.pan);
	vec_set( my.x, you.x);
	my.MyTilt = max( min( my.MyTilt + my_angle.tilt*MousPeed*Kick_Action,99), 0);
	//----------------------------------------------------------------------
	
	animaplayer();
}

function KickAttac()
{
	if (Kick_Action == 0)
	{return;
	}
	var FrameTime = 0;
	Kick_Action = 0;
	if (KickNumber == 1)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[0],1);
		SetActiveSeq( SharedEntity,  BodyParts[0],"BOXING");
		while (FrameTime < 27)
		{
		
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 40*speed/200, BodyParts[0]);
			wait(1);
		}
		GetBoneParam( SharedEntity,"body head");
		BoneParam[0] = 0;
		SetBoneParam( SharedEntity,"body head");

		SetActivePart( SharedEntity, BodyParts[0],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndKick;
	}
	if (KickNumber == 2)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[0],1);
		SetActiveSeq( SharedEntity,  BodyParts[0],"kick in the air");
		while (FrameTime < 10)
		{
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 40*speed/200, BodyParts[0]);
			wait(1);
		}
		player.GravityWork=20;
		while (FrameTime < 40)
		{
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 40*speed/200, BodyParts[0]);
			wait(1);
		}
		SetActivePart( SharedEntity, BodyParts[0],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndKick;
	}
	if (KickNumber == 3)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[0],1);
		SetActiveSeq( SharedEntity,  BodyParts[0],"kick twice");
		while (FrameTime < 40)
		{
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 40*speed/200, BodyParts[0]);
			wait(1);
		}
		SetActivePart( SharedEntity, BodyParts[0],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndKick;
	}
	if (KickNumber == 4)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[0],1);
		SetActiveSeq( SharedEntity,  BodyParts[0],"kick up");
		while (FrameTime < 10)
		{
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 40*speed/200, BodyParts[0]);
			wait(1);
		}
		player.GravityWork=20;
		while (FrameTime < 25)
		{
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 40*speed/200, BodyParts[0]);
			wait(1);
		}
		SetActivePart( SharedEntity, BodyParts[0],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndKick;
	}	
EndKick:
	Kick_Action = 1;
}

function MainePlacing()
{
	var FrameTime = 0;
	if (Kick_Action == 0)
	{return;
	}
	Kick_Action = 0;
	FrameTime = 0;
	SetActivePart( SharedEntity, BodyParts[0],1);
	SetActiveSeq( SharedEntity,  BodyParts[0],"mines");
	while (FrameTime < 40)
	{
		FrameTime +=1*speed/200;
		AnimModelPart( SharedEntity, 40*speed/200, BodyParts[0]);
		wait(1);
	}
	play_sound(Mine_Place,50);
	while (FrameTime < 70)
	{
		FrameTime +=1*speed/200;
		AnimModelPart( SharedEntity, 40*speed/200, BodyParts[0]);
		wait(1);
	}
	SetActiveSeq( SharedEntity,  BodyParts[0],"mines");
	SetActivePart( SharedEntity, BodyParts[0],0);
	SetActivePart( SharedEntity, BodyParts[0],1);
	SetActivePart( SharedEntity, BodyParts[0],0);
	if (FrameTime >= 70)
	{Kick_Action = 1;
	}
}

function HitAction(HitNumber)
{
	if (Kick_Action == 0)
	{return;
	}
	var FrameTime = 0;
	Kick_Action = 0;
	if (HitNumber == 1)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[6],1);
		SetActiveSeq( SharedEntity,  BodyParts[6],"hithead");
		while (FrameTime < 27)
		{
		
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 90*speed/200, BodyParts[6]);
			wait(1);
		}
		GetBoneParam( SharedEntity,"body head");
		BoneParam[0] = 0;
		SetBoneParam( SharedEntity,"body head");

		SetActivePart( SharedEntity, BodyParts[6],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndHit;
	}
	if (HitNumber == 2)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[6],1);
		SetActiveSeq( SharedEntity,  BodyParts[6],"hurt stamic2");
		while (FrameTime < 20)
		{
		
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 90*speed/200, BodyParts[6]);
			wait(1);
		}
		GetBoneParam( SharedEntity,"body head");
		BoneParam[0] = 0;
		SetBoneParam( SharedEntity,"body head");

		SetActivePart( SharedEntity, BodyParts[6],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndHit;
	}
	if (HitNumber == 3)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[6],1);
		SetActiveSeq( SharedEntity,  BodyParts[6],"hurtchest");
		while (FrameTime < 20)
		{
		
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 90*speed/200, BodyParts[6]);
			wait(1);
		}
		GetBoneParam( SharedEntity,"body head");
		BoneParam[0] = 0;
		SetBoneParam( SharedEntity,"body head");

		SetActivePart( SharedEntity, BodyParts[6],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndHit;
	}
	if (HitNumber == 4)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[6],1);
		SetActiveSeq( SharedEntity,  BodyParts[6],"hurtleftcalvical");
		while (FrameTime < 15)
		{
		
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 90*speed/200, BodyParts[6]);
			wait(1);
		}
		GetBoneParam( SharedEntity,"body head");
		BoneParam[0] = 0;
		SetBoneParam( SharedEntity,"body head");

		SetActivePart( SharedEntity, BodyParts[6],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndHit;
	}
	if (HitNumber == 5)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[6],1);
		SetActiveSeq( SharedEntity,  BodyParts[6],"hurtrightcalvical");
		while (FrameTime < 15)
		{
		
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 90*speed/200, BodyParts[6]);
			wait(1);
		}
		GetBoneParam( SharedEntity,"body head");
		BoneParam[0] = 0;
		SetBoneParam( SharedEntity,"body head");

		SetActivePart( SharedEntity, BodyParts[6],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndHit;
	}
	if (HitNumber == 6)
	{
		FrameTime = 0;
		SetActivePart( SharedEntity, BodyParts[6],1);
		SetActiveSeq( SharedEntity,  BodyParts[6],"hurtrightleg");
		while (FrameTime < 20)
		{
		
			FrameTime +=1*speed/200;
			AnimModelPart( SharedEntity, 90*speed/200, BodyParts[6]);
			wait(1);
		}
		GetBoneParam( SharedEntity,"body head");
		BoneParam[0] = 0;
		SetBoneParam( SharedEntity,"body head");

		SetActivePart( SharedEntity, BodyParts[6],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"weapon");
		goto EndHit;
	}

EndHit:
	Kick_Action = 1;
}

function LMGBulletsFunc()
{
	if (weapon==0)
		{return;}
	if (weapon._ammotype == lmg)
	{
		if (camorder==2)
		{
			if (weapon_reloading == 1)
			{
				pos_for_vertex(weapon,LMGBulletes,551,552);
				LMGBulletes.invisible = 1 ;
			}
			else
			{
				pos_for_vertex(weapon,LMGBulletes,551,552);
				LMGBulletes.invisible = 0 ;
			}
		}
	}
	else
	{
		LMGBulletes.invisible = 1 ;
	}

}

function TempEntity()
{
	my.passable = 1;
	return;
}

function LnkEnt2Bone(EntLnk,Eme,Eyou)
{
me = Eme; you = Eyou;
			GetBonePosParam(me,EntLnk, WeaponsBones[ you.BoneName]);
			vec_set( you.x, target);
			temp.x  = ScanValues[0] - you.x;
			temp.y  = ScanValues[1] - you.y;
			temp.z  = ScanValues[2] - you.z;
			vec_to_angle(you.pan,temp);
}

function WeaponlnkPlayer(EntLnk,EntParts1,EntParts2,EntParts3)
{
if (EntParts1!=null)
{
			LnkEnt2Bone( EntLnk, me, EntParts1);
}
if (EntParts2!=null)
{
			LnkEnt2Bone( EntLnk, me, EntParts2);
}
if (EntParts3!=null)
{
			LnkEnt2Bone( EntLnk, me, EntParts3);
}
}

function Weapon2lnkPlayer(EntLnk,EntParts1,EntParts2)
{
if (EntParts1!=null)
{
			LnkEnt2Bone( EntLnk, me, EntParts1);
}
if (EntParts2!=null)
{
			LnkEnt2Bone( EntLnk, me, EntParts2);
}
}

dllfunction  rotatex(Ang);
dllfunction  rotatey(Ang);
dllfunction  rotatez(Ang);

function Mvertex_to_Yvertex(Mu,Yu,mver,yver)
{
me=mu;

var
YPVertex;

var
mangle;

vec_for_vertex(YPVertex,yu,yver);

firstpoint.x = vec_dist(my.x ,YPVertex );
firstpoint.y = 0;
firstpoint.z = 0;


YPVertex.x = YPVertex.x - my.x;
YPVertex.y = YPVertex.y - my.y;
YPVertex.z = YPVertex.z - my.z;
vec_to_angle( mangle, YPVertex);

vec_set( my_angle, mangle);

mangle.pan -= my.pan;
mangle.tilt += my.tilt;

rotatez( mangle.pan);
rotatey( mangle.tilt);
vec_to_mesh( firstpoint,me,mver);

}
//	luai allFunction
action BonPlayer()		//replace
{
	my.passable = 1;
	while (splashscreen.visible)
	{
		wait(1);
	}
	my.MyTilt = 50;

	numd  += 1;
	my.frame = numd;
	create( <ahmedl.mdl>, my.pos, PlayerBody);

	SharedEntity = AddShareEntity(modelindex,me);
	PartIndex = 9;
	SetActivePart( SharedEntity, BodyParts[PartIndex-8],1);
	SetActivePart( SharedEntity, BodyParts[PartIndex],1);
	SetActivePart( SharedEntity, BodyParts[4],1);
	SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"shot");
	PTempstr = WeapnsFiles[9];

	create( PTempstr, temp, TempEntity);
	my.WeaponMesh1  = Entity_To_Pointer(you);
	you.BoneName = IWeaponBone;
	PTempstr = StoresFiles[2];

	var AbsForce;
	player = me;

	GetBoneParam( SharedEntity,"body");
	BoneParam[1] = 10;
	SetBoneParam( SharedEntity,"body");
	SetActiveBlendSeq( SharedEntity, BodyParts[PartIndex-8],"run","run");
	camorder=3;
	cameraction = TPsCamra;
	player.invisible = 0;
	player.shadow = (player.invisible == 0)&&shadowenable;
	VisibleGui1(0);
	SelectNewGun();
	while (1)
	{	
		you = Pointer_To_Entity(player.BodyLnk);
		if (you._health<-100)
		{
			break;
		}
		if (weapon_firing == 1)||(weapon_reloading == 1)
		{
			GetBoneParam( SharedEntity,"body head");
			BoneParam[2] = 70-my.MyTilt/1.5;
			BoneParam[6] = 0;
			SetBoneParam( SharedEntity,"body head");
			GetBoneParam( SharedEntity,"body spine1");
			BoneParam[2] = 20-my.MyTilt/1.5;
			SetBoneParam( SharedEntity,"body spine1");
			GetBoneParam( SharedEntity,"body spine2");
			BoneParam[2] = 20-my.MyTilt/1.5;
			SetBoneParam( SharedEntity,"body spine2");
			GetBoneParam( SharedEntity,"body Neck");
			BoneParam[2] = 20-my.MyTilt/1.5;
			SetBoneParam( SharedEntity,"body Neck");
		}
		else
		{
			GetBoneParam( SharedEntity,"body head");
			BoneParam[2] = -5;
			BoneParam[6] = 0;
			SetBoneParam( SharedEntity,"body head");
			GetBoneParam( SharedEntity,"body spine1");
			BoneParam[2] = -5;
			SetBoneParam( SharedEntity,"body spine1");
			GetBoneParam( SharedEntity,"body spine2");
			BoneParam[2] = -5;
			SetBoneParam( SharedEntity,"body spine2");
			GetBoneParam( SharedEntity,"body Neck");
			BoneParam[2] = -5;
			SetBoneParam( SharedEntity,"body Neck");
		}
		if (Camra2Player)
		{
			_player_ins();
			if (grnade_firing == 0)
			{
				AbsForce = min( vec_length( temp), 1);
				AbsForce.y = abs(temp.y)*10;
			}
			else
			{
				AbsForce = 0;
			}
			if ((AbsForce.y == 0)&&(AbsForce.x == 0))&&(abs(NSonar( Pointer_To_Entity(my.BodyLnk))) == 0)&&(weapon_firing != 1)&&(weapon_reloading != 1)&&(grnade_firing != 1)&&(lader_player == 0)
			{
				if (PlaCru == 0)
				{SetActiveBlendSeq( SharedEntity, BodyParts[PartIndex-8],"rotater","rotatel");
				}
			}
			if (AbsForce.y>0 && temp.x!=0)
			{AbsForce.y/=2; temp.x/=2;temp.y/=2;
			}
			if (mouse_force.x > 0.5)&&(AbsForce.y == 0)&&(AbsForce.x == 0)&&(PlaCru == 0)&&(lader_player == 0)&&(weapon_firing != 1)&&(grnade_firing != 1)
			{SetActiveBlendSeq( SharedEntity, BodyParts[PartIndex-8],"rotater","walk");
			}
			if (mouse_force.x < -0.5)&&(AbsForce.y == 0)&&(AbsForce.x == 0)&&(PlaCru == 0)&&(lader_player == 0)&&(weapon_firing != 1)&&(grnade_firing != 1)
			{SetActiveBlendSeq( SharedEntity, BodyParts[PartIndex-8],"rotatel","walk");
			}
			if (((my_angle.pan > 0.3)||(my_angle.pan < -0.3))&&(AbsForce.y == 0)&&(AbsForce.x == 0)&&(lader_player == 0)&&(grnade_firing != 1))
				||((NSonar(Pointer_To_Entity(my.BodyLnk))!=0)&&(lader_player == 0)&&(grnade_firing != 1))
			{
				AbsForce.z = 0.8;
				if ((my_angle.pan > 0.3)||(my_angle.pan < -0.3))
				{AbsForce.x = 1;
				}else
				{AbsForce.x = 0.8;
				}		
			}
			else
			{
				if (grnade_firing == 0)
				{AbsForce.z = nearnumber( AbsForce.z, AbsForce.y, 0.5);
				}
				
			}
			if ((PlaCru == 1)&&(AbsForce.y == 0)&&(AbsForce.x == 0))
			{
				GetBoneParam( SharedEntity,"body");
				BoneParam[6] = 1;
				SetBoneParam( SharedEntity,"body");
				SetActiveBlendSeq( SharedEntity, BodyParts[PartIndex-8],"CrawlWalk","walk");
				AbsForce.z = 0.8;
				AbsForce.x = 0.5;
			}
			else
			{
				if(lader_player == 0)
				{
					GetBoneParam( SharedEntity,"body");
					BoneParam[6] = 1;
					SetBoneParam( SharedEntity,"body");
					AnimModelPart( SharedEntity, AbsForce*75, BodyParts[PartIndex-8]);
					if (abs(NSonar( Pointer_To_Entity(my.BodyLnk))>4))&&(lader_player == 0)&&(grnade_firing != 1)
					{SetActiveBlendSeq( SharedEntity, BodyParts[PartIndex-8],"jump","rotatel");
					}
					if (weapon_firing != 1)&&(weapon_reloading != 1)&&(weapon_number != 7)//&&(Waiting_Hand < 0)
					{AnimModelPart( SharedEntity, AbsForce*35, BodyParts[PartIndex]);
					}
				}
				else
				{
					SetActivePart( SharedEntity, BodyParts[PartIndex-8],1);
					SetActiveSeq( SharedEntity,  BodyParts[PartIndex-8],"climb");
					AnimModelPart( SharedEntity, AbsForce*50, BodyParts[PartIndex-8]);
				}
			}
			moveplayer();
			cameraction();
			CarryWeapon();
		}
		else
		{cameraction();
		}
		WeaponlnkPlayer( SharedEntity , Pointer_To_Entity( player.WeaponMesh1), Pointer_To_Entity( player.WeaponStore1), Pointer_To_Entity( player.WeaponAnerga) );
		Weapon2lnkPlayer( SharedEntity, Pointer_To_Entity( player.WeaponMesh2) , Pointer_To_Entity( player.WeaponStore2) );
		GetMeshVertex( SharedEntity, my);
/*		if (weapon_number == 9)&&(grnade_firing == 1)
		{
			you = Pointer_To_Entity(my.WeaponMesh1);
			you.frame = 2;
			Mvertex_to_Yvertex(you,player,22,353);
			Mvertex_to_Yvertex(you,player,27,353);
			Mvertex_to_Yvertex(you,player,34,353);
			Mvertex_to_Yvertex(you,player,35,353);
		}*/
		wait(1);
	}
}



function Hand_Action()
{
	while (1)
	{
		you =  Pointer_To_Entity( player.BodyLnk);
		if (you._health<-100)
		{
			break;
		}
		if (Hand_Active == 0)
		{
			//SetActiveBlendSeq( SharedEntity, BodyParts[4],"standerd","standerd");
			Hand_Frame_Count = 0;
			Breath_Wait = 30;
			Waiting_stand = max(int(random(100)),100);
			Hand_Wait_Count = max(int(random(100)),100);
			goto HandOut1;
		}
		else
		{	if (Breath_Wait < 0)
			{
				SetActiveBlendSeq( SharedEntity, BodyParts[4],"breath","standerd");
				AnimModelPart( SharedEntity, 0.2, BodyParts[4]);
			}else
			{Breath_Wait -=1;
			}

			

			if (Waiting_stand > 0)
			{
				Waiting_stand -=1;
			}
			else
			{
				if (Hand_Frame_Count == 0)
				{
					wait(1);
					SetActivePart( SharedEntity, BodyParts[PartIndex],0);
					SetActivePart( SharedEntity, BodyParts[PartIndex],1);
					if (weapon_number == 2)||(weapon_number == 3)||(weapon_number == 4)||(weapon_number == 6)||(weapon_number == 13)
					{
						if (Hand_Frame_Num == 0)
						{
							Hand_Frame_Max = 43;//86;
							SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"stand");
						}else
						{
							Hand_Frame_Max = 22;//43;
							SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"2stand");
						}
					}else
					{
						if (weapon_number == 11)||(weapon_number == 1)
						{
							Hand_Frame_Max = 30;//60;
							SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"stand");
						}else
						{
							Hand_Frame_Max = 43;//86;
							SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"stand");
						}

					}
				}
				if (Hand_Frame_Count < Hand_Frame_Max)
				{
					Hand_Frame_Count +=1;
					AnimModelPart( SharedEntity, 15, BodyParts[PartIndex]);//8
					goto HandOut;
				}

				if (Hand_Frame_Count >= Hand_Frame_Max)&&(Hand_Wait_Count > 0)
				{
					Hand_Wait_Count -= 1;
					goto HandOut;
				}
				
				if (Hand_Frame_Count >= Hand_Frame_Max)&&(Hand_Frame_Count < Hand_Frame_Max*2) 
				{
					Hand_Frame_Count +=1;
					AnimModelPart( SharedEntity, -15, BodyParts[PartIndex]);
					goto HandOut;
				}
				HandOut:
				if (Hand_Frame_Count >= Hand_Frame_Max*2)
				{
					if (Hand_Frame_Num == 0)
					{Hand_Frame_Num = 1;
					}else
					{Hand_Frame_Num = 0;}
					Hand_Frame_Count = 0;
					Waiting_stand = max(int(random(100)),100);
					Hand_Wait_Count = max(int(random(100)),100);
				}
			}
			HandOut1:
		}		
		wait(1);
	}
}
