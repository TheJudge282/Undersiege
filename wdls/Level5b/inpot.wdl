
function _car_intent
{
	my.CarBreaker  = 0;
	temp.x = ( PressedKeys[Key_MoveFor1]-PressedKeys[Key_BackWard])*100;

	my_angle.pan = (PressedKeys[Key_TurnLeft]-PressedKeys[Key_TurnRight])*0.5;
	my.CarBreaker = PressedKeys[Key_SlowMove];
}

function _tank_intent
{
	temp.x = ( PressedKeys[Key_MoveFor1]-PressedKeys[Key_BackWard] )*1000;
	temp.y = MOUSE_FORCE.X;
	temp.z = (MOUSE_FORCE.Y+ PressedKeys[Key_LookUp]-PressedKeys[Key_LookDown])*10;
	my_angle.pan = ( PressedKeys[Key_MoveFor1]-PressedKeys[Key_BackWard] )*0.5;
	my.CarBreaker = key_o;
}

function _player_ins()
{

	my_angle.pan = (PressedKeys[Key_TurnLeft]-PressedKeys[Key_TurnRight])/2*(1- PressedKeys[Key_SlowMove]/2);
	my_angle.tilt = (PressedKeys[Key_LookUp]-PressedKeys[Key_LookDown])*(1- PressedKeys[Key_SlowMove]/2);
	if (MouseFlare.visible==0)
	{
		my_angle.pan -= mouse_force.x*(1- PressedKeys[Key_SlowMove]/2);
		my_angle.tilt += mouse_force.y*(1- PressedKeys[Key_SlowMove]/2);
	}

	temp.x = ( PressedKeys[Key_MoveFor1]-PressedKeys[Key_BackWard])*(1- PressedKeys[Key_SlowMove]/2) * speed/200;
	temp.y = ( PressedKeys[Key_StrafLeft]-PressedKeys[Key_StrafRight])*(1- PressedKeys[Key_SlowMove]/2) * speed/200;
	temp.z = 0;
	my_angle.pan *= speed/200;
	my_angle.tilt *= speed/200;
}

var posc[3] = 150, 0, 0;
var panc[3] = 180, 0, 0;
function _camera_ins
{
	posc.x += key_z - key_x;
	posc.y += key_c - key_v;
	posc.z += key_b - key_n;

	panc.pan += key_a - key_s;
	panc.tilt += key_q - key_w;
}

function SHowHideMouse()
{
	MouseFlare.visible = abs( MouseFlare.visible - 1); 
	if(MouseFlare.visible)
	{
		mouseing();
	}
}


function new_game()
{
	LoadTheSave(13,0);

}

function gameclose()
{
finalization();
}


function NewSong()
{
CloseAllSongs();
CurrentSong=OpenSong("*action.mp3");

playSong(CurrentSong);
getSONGNAME(CurrentSong, mesg.string);
} 

function MoveBtnwhilePrs(Pme)
{
me = 0;
you = Pme;
var LMpos;
LMpos.x = MousePos.x;
LMpos.y = MousePos.y;

while (mouse_left)
{
 you.y = min(max( you.y-(MousePos.x-LMpos.x)*0.015, you.skill1),you.skill2);
 LMpos.x = MousePos.x;
 LMpos.y = MousePos.y;
 if (you.event)
 {
 Guifunction = you.event;
 Guifunction(you);
 }
wait(1);
}
}

function NtrMoveBtnwhilePrs(Pme)
{
me = 0;
you = Pme;
var LMpos;
LMpos = MousePos.x;

while (mouse_left)
{

 if (abs(LMpos - MousePos.x ) >50)
 {
  you.y = min( you.skill2,max( you.skill1, you.y + maxminnum(LMpos - MousePos.x , abs(you.skill2 - you.skill1)/2) ));
  LMpos = MousePos.x;
 }

 if (you.event)
 {
	Guifunction = you.event;
	Guifunction(you);
 }
wait(1);
}
}

function BtnKeyPress(Pme)
{
me = Pme;
 Guifunction = my.event;
 Guifunction(me);
}

function CheckIfClick(Cmy)
{
my = cmy;
if (my.visible==0)
{
		return(0);
}
	if (abs(MouseFlare.y-my.y)<my.skill3 && abs(MouseFlare.z-my.z)<my.skill4)
	{
		return(1);
	}
		return(0);
}

function SCheckIfClick(Cmy)
{
my = cmy;
if (my.visible==0)
{
		return(0);
}
	if (abs(MouseFlare.y-my.y)<my.skill3 && abs(MouseFlare.z-my.z)<my.skill4)
	{
		return(1);
	}
		return(0);
}

function SlideCheckMove()
{

	if (CheckIfClick(SliderBtn))
	{
		MoveBtnwhilePrs(SliderBtn);
		goto SMFlare;
	}

	if (CheckIfClick(SliderSBtn))
	{
		MoveBtnwhilePrs(SliderSBtn);
		goto SMFlare;
	}

	/*if (CheckIfClick(SliderAmbBtn))
	{
		MoveBtnwhilePrs(SliderAmbBtn);
		goto SMFlare;
	}*/

	if (CheckIfClick(SliderMSpeedBtn))
	{
		MoveBtnwhilePrs(SliderMSpeedBtn);
		goto SMFlare;
	}

	if (CheckIfClick(SettingsOkBtn))
	{
		BtnKeyPress(SettingsOkBtn);
		goto SMFlare;
	}

	if (CheckIfClick(SettingsEscBtn))
	{
		BtnKeyPress(SettingsEscBtn);
		goto SMFlare;
	}

	if (CheckIfClick(DownTextMsg))
	{
		BtnKeyPress(DownTextMsg);
		goto SMFlare;
	}

	if (CheckIfClick(UpTextMsg))
	{
		BtnKeyPress(UpTextMsg);
		goto SMFlare;
	}

	/*if (CheckIfClick(SliderResBtn))
	{
		NtrMoveBtnwhilePrs(SliderResBtn);
		goto SMFlare;
	}*/

	if ((SettingsBK.visible==0)&&(SaveDialog.visible==0))
	{
		if (CheckIfClick(MNewMenu))
		{
        		BtnKeyPress(MNewMenu);
			goto SMFlare;
		}
	
		if (CheckIfClick(MLoadMenu))
		{
        		BtnKeyPress(MLoadMenu);
			goto SMFlare;
		}
	
		if (CheckIfClick(MSettingsMenu))
		{
        		BtnKeyPress(MSettingsMenu);
			goto SMFlare;
		}
	
		if (CheckIfClick(MBackMenu))
		{
			BtnKeyPress(MBackMenu);
			goto SMFlare;
		}
	
        	if (CheckIfClick(MExitMenu))
		{
			BtnKeyPress(MExitMenu);
			goto SMFlare;
		}
	}
	if (ConfirmOkDelete.visible==0)
	{
		if (CheckIfClick(SLoadBtn))
		{
        		BtnKeyPress(SLoadBtn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSaveBtn))
		{
        		BtnKeyPress(SSaveBtn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SCancelBtn))
		{
	        	BtnKeyPress(SCancelBtn);
			goto SMFlare;
		}
		
		if (CheckIfClick(SRemoveBtn))
		{
	        	BtnKeyPress(SRemoveBtn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSave1Btn))
		{
	        	BtnKeyPress(SSave1Btn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSave2Btn))
		{
	        	BtnKeyPress(SSave2Btn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSave3Btn))
		{
	        	BtnKeyPress(SSave3Btn);
			goto SMFlare;
		}
		
		if (CheckIfClick(SSave4Btn))
		{
	        	BtnKeyPress(SSave4Btn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSave5Btn))
		{
	        	BtnKeyPress(SSave5Btn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSave6Btn))
		{
	        	BtnKeyPress(SSave6Btn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSave7Btn))
		{
	        	BtnKeyPress(SSave7Btn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSave8Btn))
		{
	        	BtnKeyPress(SSave8Btn);
			goto SMFlare;
		}
	
		if (CheckIfClick(SSave9Btn))
		{
	        	BtnKeyPress(SSave9Btn);
			goto SMFlare;
		}
		
		if (CheckIfClick(SSave10Btn))
		{
	        	BtnKeyPress(SSave10Btn);
			goto SMFlare;
		}
	
	}
		
		if (CheckIfClick(ConfirmOkDelete))
		{
	        	BtnKeyPress(ConfirmOkDelete);
			goto SMFlare;
		}
		
		if (CheckIfClick(ConfirmEscDelete))
		{
	        	BtnKeyPress(ConfirmEscDelete);
			goto SMFlare;
		}
	
SMFlare :

}

function LMEvent()
{
if (MouseFlare.visible==0)
{
KeyPAttack();
}else
{
SlideCheckMove();
}
}

function CallMainMenu()
{
   if (helpKeys.visible){return;
       }
       if (camera.arc != 60){
       zoom();
       }else{
	VisMainMenu(abs(MainMenu.visible-1));}
}

function game_puase()
{
freeze_mode = abs(freeze_mode-1);
while (freeze_mode)
{
temp.x = (key_force.y + mouse_right)*10;
temp.y = 0;
temp.z = ( key_home-key_end )*10;
vec_rotate( temp, camera.pan);
vec_add(camera.x,temp);
camera.pan -= key_force.x	  + mouse_force.x;
camera.tilt += (key_pgup-key_pgdn) + mouse_force.y;
wait(1);
}
}

function FrreCame()
{
Camra2Player = abs(Camra2Player-1);
while (Camra2Player==0)
{
	_player_ins();
	temp.x *= 10;
	temp.y *= 10;
	temp.z = ( key_home-key_end )*10;
	vec_rotate( temp, camera.pan);
	vec_add(camera.x,temp);
	camera.pan  += my_angle.x*10;
	camera.tilt += my_angle.y*10;
wait(1);
}

}

function QSave_game()
{

if (freeze_mode)
{return;}
	SaveAll(14,1);
}

function QLoad_game()
{

if (freeze_mode)
{return;}
if (SaveMorphScrn( 14))
{
	LoadTheSave(14,1);
}
}



function HideGui()
{
	var lkey=key_lastpressed;
	Key_pressed=1;
	while (key_pressed(lkey)==1)
	{
		wait(1);
	}
	Key_pressed=0;
	Gun_Hand_state();
}
///////////////////////////////////////////////////////////////////////////
function WalkForword(Body)
{
	if(Body == -1)
		{return;}
	
	GetBoneParam(Body,"body");
	BoneParam[1] = 20;
	SetBoneParam( Body,"body");
	if(PressedKeys[Key_StrafLeft] == 0)&&(PressedKeys[Key_StrafRight] == 0)
	{
		if (PressedKeys[Key_SlowMove] == 1)
		{SetActiveBlendSeq( Body, BodyParts[1],"walk","walk");
		}else
		{SetActiveBlendSeq( Body, BodyParts[1],"run","run");
		}
	}
	SetActiveBlendSeq( Body, BodyParts[4],"standerd","standerd");
	if (weapon_firing != 1)&&(weapon_reloading != 1)&&(Waiting_Hand < 0)&&(grnade_firing == 0)
	{SetActiveSeq( Body,  BodyParts[PartIndex],"walk");
	}
}
function ResetBodyFromForword(Body)
{
	if(Body == -1)
		{return;}
	GetBoneParam( Body,"body");
	BoneParam[1] = 10;
	SetBoneParam( Body,"body");
}


function keyFWalk()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_MoveFor1] = 1;
	while (key_pressed(lkey)==1)
	{
		WalkForword(SharedEntity);
		wait (1);
	}
	ResetBodyFromForword(SharedEntity);
	PressedKeys[Key_MoveFor1] = 0;
	Key_pressed=0;
}
/////////////////////////////////////////////////////////////

function WalkBackword(Body)
{
	if(Body == -1)
		{return;}
	if (PressedKeys[Key_MoveFor1] == 1)
	{SetActiveBlendSeq( Body, BodyParts[4],"standerd","standerd");
	}else
	{SetActiveBlendSeq( Body, BodyParts[4],"walkleft","standerd");
	}
	if (pressedKeys[Key_StrafLeft] == 1)
	{
		GetBoneParam( Body,"body");
		BoneParam[2] = -65;
		SetBoneParam( Body,"body");
		GetBoneParam( Body,"body head");
		BoneParam[0] = 20;
		SetBoneParam( Body,"body head");
		GetBoneParam( Body,"body spine1");
		BoneParam[0] = 20;
		SetBoneParam( Body,"body spine1");
		GetBoneParam( Body,"body spine2");
		BoneParam[0] = 20;
		SetBoneParam( Body,"body spine2");
		GetBoneParam( Body,"body Neck");
		BoneParam[0] = 20;
		SetBoneParam( Body,"body Neck");
		SetActiveBlendSeq( Body, BodyParts[1],"walkbackwards3","walkbackwards3");
	}
	else
	{
		if (PressedKeys[Key_StrafRight] == 1)
		{
			GetBoneParam( Body,"body");
			BoneParam[2] = 45;
			SetBoneParam( Body,"body");
			GetBoneParam( Body,"body head");
			BoneParam[0] = -30;
			SetBoneParam( Body,"body head");
			GetBoneParam( Body,"body spine1");
			BoneParam[0] = -30;
			SetBoneParam( Body,"body spine1");
			GetBoneParam( Body,"body spine2");
			BoneParam[0] = -30;
			SetBoneParam( Body,"body spine2");
			GetBoneParam( Body,"body Neck");
			BoneParam[0] =-30;
			SetBoneParam( Body,"body Neck");
			SetActiveBlendSeq( Body, BodyParts[1],"walkbackwards3","walkbackwards3");
		}
		else
		{
			SetActiveBlendSeq( Body, BodyParts[1],"walkbackwards3","walk");
		}
	}
	if (weapon_firing != 1)&&(weapon_reloading != 1)&&(Waiting_Hand < 0)&&(grnade_firing == 0)
	{SetActiveSeq( Body,  BodyParts[PartIndex],"walk");
	}
}

function ResetBodyFromBackword(Body)
{
	if(Body == -1)
		{return;}
	SetActiveBlendSeq( Body, BodyParts[4],"standerd","standerd");
}
function keybWalk()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_BackWard] = 1;
	while (key_pressed(lkey)==1)
	{
		WalkBackword(SharedEntity);
		wait (1);
	}
	ResetBodyFromBackword(SharedEntity);
	PressedKeys[Key_BackWard] = 0;
	Key_pressed=0;
}

///////////////////////////////////////////////////////////////////////////
function WalkLeft(Body)
{
	if(Body == -1)
		{return;}
	if (PressedKeys[Key_MoveFor1] ==1)
	{
		GetBoneParam( Body,"body");
		BoneParam[2] = 75;
		SetBoneParam( Body,"body");
		GetBoneParam( Body,"body head");
		BoneParam[0] = -10;
		SetBoneParam( Body,"body head");
		GetBoneParam( Body,"body spine1");
		BoneParam[0] = -10;
		SetBoneParam( Body,"body spine1");
		GetBoneParam( Body,"body spine2");
		BoneParam[0] = -10;
		SetBoneParam( Body,"body spine2");
		GetBoneParam( Body,"body Neck");
		BoneParam[0] = -10;
		SetBoneParam( Body,"body Neck");
		SetActiveBlendSeq( Body, BodyParts[1],"walk","walk");
	}else
	{
		if (PressedKeys[Key_BackWard] ==1)
		{
			GetBoneParam( Body,"body");
			BoneParam[2] = -65;
			SetBoneParam( Body,"body");
			GetBoneParam( Body,"body head");
			BoneParam[0] = 20;
			SetBoneParam( Body,"body head");
			GetBoneParam( Body,"body spine1");
			BoneParam[0] = 20;
			SetBoneParam( Body,"body spine1");
			GetBoneParam( Body,"body spine2");
			BoneParam[0] = 20;
			SetBoneParam( Body,"body spine2");
			GetBoneParam( Body,"body Neck");
			BoneParam[0] = 20;
			SetBoneParam( Body,"body Neck");
			SetActiveBlendSeq( Body, BodyParts[1],"walkbackwards3","walkbackwards3");
		}
		else
		{
			if (PressedKeys[Key_SlowMove] == 1)&&(PressedKeys[Key_BackWard] ==0)
			{
				GetBoneParam( Body,"body");
				BoneParam[2] = 75;
				SetBoneParam( Body,"body");
				GetBoneParam( Body,"body head");
				BoneParam[0] = -10;
				SetBoneParam( Body,"body head");
				GetBoneParam( Body,"body spine1");
				BoneParam[0] = -10;
				SetBoneParam( Body,"body spine1");
				GetBoneParam( Body,"body spine2");
				BoneParam[0] = -10;
				SetBoneParam( Body,"body spine2");
				GetBoneParam( Body,"body Neck");
				BoneParam[0] = -10;
				SetBoneParam( Body,"body Neck");
				SetActiveBlendSeq( Body, BodyParts[1],"walk","walk");
			}
			else
			{
				GetBoneParam( Body,"body");
				BoneParam[2] = 0;
				SetBoneParam( Body,"body");
				GetBoneParam( Body,"body head");
				BoneParam[0] = 0;
				SetBoneParam( Body,"body head");
				GetBoneParam( Body,"body spine1");
				BoneParam[0] = 0;
				SetBoneParam( Body,"body spine1");
				GetBoneParam( Body,"body spine2");
				BoneParam[0] = 0;
				SetBoneParam( Body,"body spine2");
				GetBoneParam( Body,"body Neck");
				BoneParam[0] = 0;
				SetBoneParam( Body,"body Neck");
				SetActiveBlendSeq( Body, BodyParts[1],"walk","WALK LEFT");
				SetActiveBlendSeq( Body, BodyParts[4],"standerd","WALKLEFT");
				if ((weapon_firing != 1)&&(weapon_reloading != 1))&&(Waiting_Hand < 0)&&(grnade_firing == 0)
				{SetActiveSeq( Body,  BodyParts[PartIndex],"walk");
				}
			}
		}
	}
}

function ResetBodyFromLeftwalk(Body)
{
	if(Body == -1)
		{return;}
	GetBoneParam( Body,"body");
	BoneParam[2] = 0;
	SetBoneParam( Body,"body");
	GetBoneParam( Body,"body head");
	BoneParam[0] = 0;
	SetBoneParam( Body,"body head");
	GetBoneParam( Body,"body spine1");
	BoneParam[0] = 0;
	SetBoneParam( Body,"body spine1");
	GetBoneParam( Body,"body spine2");
	BoneParam[0] = 0;
	SetBoneParam( Body,"body spine2");
	GetBoneParam( Body,"body Neck");
	BoneParam[0] = 0;
	SetBoneParam( Body,"body Neck");
}

function KeySLeft()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_StrafLeft] = 1;
	while (key_pressed(lkey)==1)
	{
		WalkLeft(SharedEntity);
		wait (1);
	}
	ResetBodyFromLeftwalk(SharedEntity);
	PressedKeys[Key_StrafLeft] = 0;
	Key_pressed=0;
}

//////////////////////////////////////////////////////
function WalkRight(Body)
{
	if(Body == -1)
		{return;}
	if (PressedKeys[Key_BackWard] ==1)
	{
		GetBoneParam( Body,"body");
		BoneParam[2] = 45;
		SetBoneParam( Body,"body");
		GetBoneParam( Body,"body head");
		BoneParam[0] = -30;
		SetBoneParam( Body,"body head");
		GetBoneParam( Body,"body spine1");
		BoneParam[0] = -30;
		SetBoneParam( Body,"body spine1");
		GetBoneParam( Body,"body spine2");
		BoneParam[0] = -30;
		SetBoneParam( Body,"body spine2");
		GetBoneParam( Body,"body Neck");
		BoneParam[0] =-30;
		SetBoneParam( Body,"body Neck");
		SetActiveBlendSeq( Body, BodyParts[1],"walkbackwards3","walkbackwards3");
	}else
	{
		SetActiveBlendSeq( Body, BodyParts[1],"walk","WALK RIGHT");
		SetActiveBlendSeq( Body, BodyParts[4],"standerd","WALKRIGHT");
		if ((weapon_firing != 1)&&(weapon_reloading != 1))&&(Waiting_Hand < 0)&&(grnade_firing == 0)
		{SetActiveSeq( Body,  BodyParts[PartIndex],"walk");
		}
	}
}

function ResetBodyFromRightwalk(Body)
{
	if (Body == -1)
	{return;
	}
	GetBoneParam( Body,"body");
	BoneParam[2] = 0;
	SetBoneParam( Body,"body");
	GetBoneParam( Body,"body head");
	BoneParam[0] = 0;
	SetBoneParam( Body,"body head");
	GetBoneParam( Body,"body spine1");
	BoneParam[0] = 0;
	SetBoneParam( Body,"body spine1");
	GetBoneParam( Body,"body spine2");
	BoneParam[0] = 0;
	SetBoneParam( Body,"body spine2");
	GetBoneParam( Body,"body Neck");
	BoneParam[0] = 0;
	SetBoneParam( Body,"body Neck");
}


function KeySRight()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_StrafRight] = 1;
	while (key_pressed(lkey)==1)
	{
		WalkRight(SharedEntity);
		wait (1);
	}
	ResetBodyFromRightwalk(SharedEntity);
	PressedKeys[Key_StrafRight] = 0;
	Key_pressed=0;
}

////////////////////////////////////////////////////////////////////////////////////

function KeySLowMove()
{
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_SlowMove] = 1;
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_SlowMove] = 0;
	Key_pressed=0;
}

///////////////////////////////////////////////////////////////////////////////////

function TurnLeft(Body)
{
	if (Body == -1)
	{return;
	}
	if (PlaCru == 0)
	{
		if (PressedKeys[Key_StrafLeft] == 1)
		{
			SetActiveBlendSeq( Body, BodyParts[1],"walk","WALK LEFT");
			SetActiveBlendSeq( Body, BodyParts[4],"standerd","WALKLEFT");
		}else
		{
			if (PressedKeys[Key_StrafRight] == 1)
			{
				SetActiveBlendSeq( Body, BodyParts[1],"walk","WALK RIGHT");
				SetActiveBlendSeq( Body, BodyParts[4],"standerd","WALKRIGHT");
			}else
			{SetActiveBlendSeq( Body, BodyParts[1],"walk","rotateL");
			}
		}
	}
	if ((weapon_firing != 1)&&(weapon_reloading != 1))&&(Waiting_Hand < 0)&&(grnade_firing == 0)
	{SetActiveSeq( Body,  BodyParts[PartIndex],"walk");
	}
}

function KeyTurnLeft()
{
	if (freeze_mode)
		{return;}

	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_TurnLeft] = 1;
	while (key_pressed(lkey)==1)
	{
		TurnLeft(SharedEntity);
		wait (1);
	}
	PressedKeys[Key_TurnLeft] = 0;
	Key_pressed=0;
}

////////////////////////////////////////////////////////////////
function TurnRight(Body)
{
	if (Body == -1)
	{return;
	}
	if (PlaCru == 0)
	{
		if (PressedKeys[Key_StrafLeft] == 1)
		{
			SetActiveBlendSeq( Body, BodyParts[1],"walk","WALK LEFT");
			SetActiveBlendSeq( Body, BodyParts[4],"standerd","WALKLEFT");
		}else
		{
			if (PressedKeys[Key_StrafRight] == 1)
			{
				SetActiveBlendSeq( Body, BodyParts[1],"walk","WALK RIGHT");
				SetActiveBlendSeq( Body, BodyParts[4],"standerd","WALKRIGHT");
			}else
			{SetActiveBlendSeq( Body, BodyParts[1],"walk","rotateL");
			}
		}
	}
	if ((weapon_firing != 1)&&(weapon_reloading != 1))&&(Waiting_Hand < 0)&&(grnade_firing == 0)
	{SetActiveSeq( Body,  BodyParts[PartIndex],"walk");
	}
}

function KeyTurnRight()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_TurnRight] = 1;
	while (key_pressed(lkey)==1)
	{
		TurnRight(SharedEntity);
		wait (1);
	}
	  PressedKeys[Key_TurnRight] = 0;
	Key_pressed=0;
}

////////////////////////////////////////////////////////////////////////////////

function KeyLookUp()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_LookUp] = 1;
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_LookUp] = 0;
	Key_pressed=0;
}
////////////////////////////////////////////////////////////////////////


function KeyLookDown()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_LookDown] = 1;
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_LookDown] = 0;
	Key_pressed=0;
}

/////////////////////////////////////////////////////////////////////////////
function JumpingDestance(Body)
{
	if (Body == -1)
	{return;
	}
	if (player)
	{
		if (NSonar( Pointer_To_Entity( player.BodyLnk))==0)
		{
			if (player.GravityWork==0)
			{
				SetActivePart( Body, BodyParts[1],1);
				player.GravityWork=15;
				Jump_State = 1;
			}
		}
	}
}
function Jumpingrame(Body)
{
	if (Body == -1)
	{return;
	}
	SetActiveBlendSeq( Body, BodyParts[1],"walk","jump");
}
function KeyJump()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_Jump] = 1;
	PlaCru = 0;
	JumpingDestance(SharedEntity);
	while (key_pressed(lkey)==1)
	{	
		Jumpingrame(SharedEntity);
		wait (1);
	}
	PressedKeys[Key_Jump] = 0;
	Key_pressed=0;
}

/////////////////////////////////////////////////////////////////////////////////////////

function KeyCrouch()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_Crouch] = 1;
	if (PlaCru == 0)
	{PlaCru = 1;
	}
	else
	{PlaCru = 0;
	}
	while (key_pressed(lkey)==1)
	{	
		wait (1);
	}
	PressedKeys[Key_Crouch] = 0;
	Key_pressed=0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

function KeyPAttack()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	if (player)
	{	WeaponFire();	}
	PressedKeys[Key_PAttack] = 1;
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_PAttack] = 0;
	Key_pressed=0;
}

//////////////////////////////////////////////////////////////////////////////////////////////

function KeySAttack()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	PressedKeys[Key_SAttack] = 1;
	Key_pressed=1;
	if (player)
	{	ShotSecondaryAmmo();
	}

	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_SAttack] = 0;
	Key_pressed=0;
}

////////////////////////////////////////////////////////////////////////////////////////////////

function KeyZoom()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	if (Maine_state == 1)||(Kick_state == 1)
	{return;
	}
	PressedKeys[Key_Zoom] = 1;
	Key_pressed=1;
	if (player)
	{	zoom();	}
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_Zoom] = 0;
	Key_pressed=0;
}

////////////////////////////////////////////////////////////////////////////////////////////
function KeyHideWeapon()
{
	if (DrivingGame)
	{
		return;
	}
	if (camera.arc != 60)
	{
		return;
	}
	if (freeze_mode)
		{return;}
	
	var lkey=key_lastpressed;
	PressedKeys[Key_HideWeapon] = 1;
	Key_pressed=1;
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_HideWeapon] = 0;
	Key_pressed=0;
	Gun_Hand_state();
}

/////////////////////////////////////////////////////////////////////////////////////

function KeyWeapon1()
{
	if (freeze_mode)
		{return;}	
	var lkey=key_lastpressed;
	PressedKeys[Key_Weapon1] = 1;
	Key_pressed=1;
  	
	var LwN ;
	LwN= WeaponLastUsed[0];
	
	if (Maine_state == 1)
	{return; }
	
	var iCount=0;
	
	if (player)
	{			
		if (Kick_state == 0)
		{
			while (1)
			{
				LwN += 1;
				iCount += 1;
				if(LwN+1 > WeaponK1N){  LwN = 0; }
				if(WeaponK1[LwN] == weapon_number){ return; }
				if (PWeapons[WeaponK1[LwN]-1]!=0)
				{
					guifunction =PAllWeapons[WeaponK1[LwN]-1];
					guifunction();
					WeaponLastUsed[0] = LwN;					
					return;
				}
				if (iCount > WeaponK1N)
				{
					return;
				}
			}
		}
		else
		{
			KickNumber = 1;
		}
	}
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_Weapon1] = 0;
	Key_pressed=0;
}
////////////////////////////////////////////////////////////////////////////////////

function KeyWeapon2()
{
	if (freeze_mode)
		{return;}
	
	var lkey=key_lastpressed;
	PressedKeys[Key_Weapon2] = 1;
	Key_pressed=1;
	var LwN ;
	LwN= WeaponLastUsed[1];
	
	if (Maine_state == 1)
	{return;
	}
	
	var iCount=0;
	
	if (player)
	{
		if (Kick_state == 0)
		{
			while (1)
			{
				LwN += 1;
				iCount += 1;
				if(LwN+1 > WeaponK2N){  LwN = 0; }			
				if(WeaponK2[LwN] == weapon_number){ return; }
				
				if (PWeapons[WeaponK2[LwN]-1]!=0)
				{
					guifunction =PAllWeapons[WeaponK2[LwN]-1];
					guifunction();
					WeaponLastUsed[1] = LwN;					
					return;
				}
				if (iCount > WeaponK2N)
				{
					return;
				}
			}

		}
		else
		{
			KickNumber = 2;
		}
	}
	
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_Weapon2] = 0;
	Key_pressed=0;
}

//////////////////////////////////////////////////////////////////////////////

function KeyWeapon3()
{
	if (freeze_mode)
		{return;}
	if (weapon == null)
	{
		return;
	}
	var lkey=key_lastpressed;
	PressedKeys[Key_Weapon3] = 1;
	Key_pressed=1;
	
	var LwN ;
	LwN= WeaponLastUsed[2];

	if (Maine_state == 1)
	{return;
	}
	var iCount=0;
	if (player)
	{
		if (Kick_state == 0)
		{
			while (1)
			{
				LwN += 1;
				iCount += 1;
				if(LwN+1 > WeaponK3N){  LwN = 0; }
				if(WeaponK3[LwN] == weapon_number){ return; }
				if (PWeapons[WeaponK3[LwN]-1]!=0)
				{
					guifunction =PAllWeapons[WeaponK3[LwN]-1];
					guifunction();
					WeaponLastUsed[2] = LwN;					
					return;
				}
				if (iCount > WeaponK3N)
				{
					return;
				}
			}

		}
		else
		{
			KickNumber = 3;
		}
	}
	
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_Weapon3] = 0;
	Key_pressed=0;
}
////////////////////////////////////////////////////////////////////////////////


function KeyWeapon4()
{
	if (freeze_mode)
		{return;}
	if (weapon == null)
	{
		return;
	}
	var lkey=key_lastpressed;
	PressedKeys[Key_Weapon4] = 1;
	Key_pressed=1;
	
	var LwN ;
	LwN= WeaponLastUsed[3];

	if (Maine_state == 1)
	{return;
	}
	var iCount=0;
	if (player)
	{
		if (Kick_state == 0)
		{
			while (1)
			{
				LwN += 1;
				iCount += 1;
				if(LwN+1 > WeaponK4N){  LwN = 0; }
				if(WeaponK4[LwN] == weapon_number){ return; }
				if (PWeapons[WeaponK4[LwN]-1]!=0)
				{
					guifunction =PAllWeapons[WeaponK4[LwN]-1];
					guifunction();
					WeaponLastUsed[3] = LwN;					
					return;
				}
				if (iCount > WeaponK4N)
				{
					return;
				}
			}

		}
		else
		{
			KickNumber = 4;
		}
	}
	
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_Weapon4] = 0;
	Key_pressed=0;
}
/////////////////////////////////////////////////////////////////////////////
function KeyNxWeapon()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	PressedKeys[Key_NxWeapon] = 1;
	var LwN = weapon_number;
	Key_pressed=1;
	if (Maine_state == 1)||(player == null)
	{return;
	}
	while (1)
	{
		if (Kick_state ==0)
		{
			LwN.x += 1;
			if(LwN.x == weapon_number){ return; }
			if(LwN.x > weaponscount){  LwN.x = 1; }
			if (PWeapons[LwN.x-1]!=0)
			{
				guifunction =PAllWeapons[LwN-1];
				guifunction();
				return;
			}
		}
		else
		{
			KickNumber +=1;
			if (KickNumber > 4)
			{KickNumber = 1;
			}
			return;
		}
	}
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_NxWeapon] = 0;
	Key_pressed=0;
}
/////////////////////////////////////////////////////////////////////////
function KeyPrvWeapon()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	PressedKeys[Key_PrvWeapon] = 1;
	var LwN = weapon_number;
	Key_pressed=1;
	if (Maine_state == 1)||(player == null)
	{return;
	}
	while (1)
	{
		if (Kick_state ==0)
		{
			LwN.x -= 1;
			if(LwN.x == weapon_number){ return; }
			if(LwN.x < 1){  LwN.x = weaponscount; }
			if (PWeapons[LwN.x-1]!=0)
			{
				guifunction =PAllWeapons[LwN-1];
				guifunction();
				return;
			}
		}
		else
		{
			KickNumber -=1;
			if (KickNumber < 1)
			{KickNumber = 4;
			}
			return;
		}
	}
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_PrvWeapon] = 0;
	Key_pressed=0;
}
/////////////////////////////////////////////////////////////////


function KeyReload()
{
	if (freeze_mode)
		{return;}
	if (Maine_state == 1)||(Kick_state == 1)||(PressedKeys[Key_Reload])
	{return;
	}
	var lkey=key_lastpressed;
	Key_pressed =1;
	PressedKeys[Key_Reload] = 1;
	manual_reload();
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_Reload] = 0;
	Key_pressed =0;
}
////////////////////////////////////////////////////////////////////////


function KeyUse()
{
	if (freeze_mode)
		{return;}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_Use] = 1;
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_Use] = 0;
	Key_pressed=0;
}

//////////////////////////////////////////////////////////////////////////

function KeySlowFS()
{
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_SlowFS] = 1;
	ChangeBFastSlow();
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_SlowFS] = 0;
	Key_pressed=0;
}

////////////////////////////////////////////////////////////////////////////

function KeyMainAmmo()
{
	if (Maine_state == 1)||(Kick_state == 1)
	{return;
	}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_MainAmmo] = 1;
	main_ammo();
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_MainAmmo] = 0;
	Key_pressed=0;
}

///////////////////////////////////////////////////////////////////////////

function KeySecoAmmo()
{
	if (Maine_state == 1)||(Kick_state == 1)
	{return;
	}
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_SecoAmmo] = 1;
	secondary_ammo();
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_SecoAmmo] = 0;
	Key_pressed=0;
}
//////////////////////////////////////////////////////////////////////////

function BodyCamera(Body)
{
	if (Body == -1)
	{return;
	}
	if ((weapon_firing != 1)&&(weapon_reloading != 1))&&(Waiting_Hand < 0)&&(grnade_firing == 0)
	{SetActiveSeq( Body,  BodyParts[PartIndex],"walk");
	}

}
function KeyCamera()
{
	if (DrivingGame)
	{
		return;
	}

	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_Camera] = 1;
	CameraState();
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	BodyCamera(SharedEntity);
	PressedKeys[Key_Camera] = 0;
	Key_pressed=0;
}

//////////////////////////////////////////////////////////////////////////

function KeyDrWeapon()
{
	var lkey=key_lastpressed;
	Key_pressed=1;
	PressedKeys[Key_DrWeapon] = 1;
	CameraState();
	while (key_pressed(lkey)==1)
	{
		wait (1);
	}
	PressedKeys[Key_DrWeapon] = 0;
	Key_pressed=0;
}

////////////////////////////////////////////////////
function MainesAmmo()
{
	var lkey=key_lastpressed;
	Key_pressed=1;
	while (key_pressed(lkey)==1)
	{
		wait(1);
	}
	Key_pressed=0;
	Maines_State();
}

///////////////////////////////////////////

var h =0;
function HitActe()
{
	var lkey=key_lastpressed;
	Key_pressed=1;
	while (key_pressed(lkey)==1)
	{
		wait(1);
	}
	Key_pressed=0;
	if (h > 5)
	{h=0;
	}
	h+=1;
	HitAction(h);
}

