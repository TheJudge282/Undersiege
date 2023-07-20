var messionfailed = 0;
var MovieOrSucess = 0;
entity PreesNextLvl
{
	type = <NextLevelPress.tga>;
	view = camera;
	layer = 15;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = 0;
}

entity ObjecPos
 {
    type =  <ObjectPos+2.tga>;
    view = camera;
    
    flags =  oriented, visible;
    scale_x = -0.01;
    scale_y = 0.01;
    x = 10; 
    y = 5;
    z = -3.5; 
    layer = 2;
    frame = 1;
 }
 entity ObjecPos1
 {
    type =  <ObjectPos+2.tga>;
    view = camera;
    
    flags =  oriented, visible;
    scale_x = -0.01;
    scale_y = 0.01;
    x = 10; 
    y = 5;
    z = -3.5; 
    layer = 2;
    frame = 1;
}

text mesg
{
	pos_x 10;
	pos_y 50;
	font	Ofont;
	flags = visible ;
	string MsgEmpStr;
}

function SetPosScroll(cmy,Prcnt)
{
 my = cmy;
 my.y = my.skill2 - (my.skill2 - my.skill1 )*Prcnt/100;
 Guifunction = my.event;
 Guifunction(my);

}

function ChangeVolume(cmy)
{
 my = cmy;
 var LowP;
 Lowp = my.skill2 - my.skill1;
 Lowp = (my.skill2-my.y)*100/Lowp;
 SetVolume( CurrentSong, Lowp);
 musicvolume = Lowp;
}

function ChangeBright(cmy)
{
 my = cmy;
 var LowP;
 Lowp = my.skill2 - my.skill1;
 Lowp = (my.skill2-my.y)*200/Lowp;
 SetViewBright( Lowp);
}

function ChangeSVolume(cmy)
{
 me = cmy;
 var LowP;
 Lowp = my.skill2 - my.skill1;
 Lowp = (my.skill2-my.y)*100/Lowp;
 sound_vol = Lowp;
 soundvolume = Lowp;

}

function ChangeMouSpeed(cmy)
{
me = cmy;
var LowP;
Lowp = my.skill2 - my.skill1;
Lowp = (my.skill2-my.y)*9/Lowp;
 MousPeed = (1+Lowp)*2;

}

function ChangeResolution(cmy)
{
me = cmy;
var LowP;
Lowp = my.skill2 - my.skill1;
Lowp = 6+(my.skill2-my.y)*3/Lowp;
switch_video lowp,0,0;

}

entity MouseFlare
 {
    type =  <cursor.tga>;
    view = camera;
    
    flags =  bright;
    scale_x = 0.02;
    scale_y = 0.02;
    x = 10;   
    y = 0;
    z = 0;
 }

function mouseing()
{
var lc;
MousePos[6] = 1;
while (MouseFlare.visible > 0)
{

MouseFlare.skill1+=10;
MouseFlare.alpha = (1+sin(MouseFlare.skill1))*25+10;
vec_set(lc,camera.pan);
camera.pan = 0;
camera.tilt = 0;
camera.roll = 0;

	temp.x = MousePos.x;
	temp.y = MousePos.y;
	temp.z = 0;
	vec_for_screen(temp,camera);
vec_set(camera.pan,lc);

	temp.y-=camera.y;
	temp.z-=camera.z;
	
	temp.x=10;
	temp.y*=10;
	temp.z*=10;
MouseFlare.y = temp.y;
MouseFlare.z = temp.z;
wait(1);
}
MousePos[6] = 0;
}


function CancelEvent(cmy)
{
my = 0;
you = cmy;

morph ( <cancel1.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <cancel.tga>, you);
	if (SCheckIfClick(you))
	{
	EscapeSettings();
	}
}

function OkEvent(cmy)
{
my = 0;
you = cmy;

morph ( <ok1.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <ok.tga>, )you;
	if (SCheckIfClick(you))
	{
	 OkiSettings();
	 ResetSetGui();
	}
}

entity VWeaponSprite
 {
    type =  <weaponss.mdl>;
    view = camera;
    layer = -1;
    scale_x = 0.028;
    scale_y = -0.028;
    scale_z = 0.028;
    x =  10 ;   
    y = -2;
    z = -0.8 ;
        
 }

entity VWeaponSprite_U
 {
    type =  <weaponss.mdl>;
    view = camera;
    layer = -1;
    scale_x = 0.028;
    scale_y = -0.028;
    scale_z = 0.028;
    x =  10 ;   
    y = -2;
    z = -0.8 ;
        
 }


entity outcompass
 {
    type =  <outcompass.tga >;
    view = camera;
    
    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    x = 10; 
    y = 5;
    z = -3.5; 
    ambient = 100;
    layer = 1;
 }

entity EnemyPos
 {
    type =  <EnemyPos.tga>;
    view = camera;
    
    flags =  oriented;
    scale_x = -0.01;
    scale_y = 0.01;
    x = 10; 
    y = 5;
    z = -3.5; 
    alpha = 20;
 }

function ToNumberBut( Val1, val2, Ind)
{
var res;
if (abs(val1-val2)<2*ind)
{
res = sin((val1-val2)/10)*Ind*1.5;
}else
{

if (val1<val2)
{
res = ind;
}else
{
res = -ind;
}

}
return(res);
}

var NSpeed = 200;

function CompassFunc(Cmps)
{
me = cmps;
var LastCompasState = 0;
while (LoopRun)
{
if (player)
{
       /*if (camera.arc == 60)
        {           
		CPointer.scale_x = nearnumber( CPointer.scale_x, 0.011+AbdForce.y/10, 0.001);
		CPointer.scale_y = CPointer.scale_x;
	}*/
	if (speed != nspeed)
	{
		SetRate(CurrentSong,speed/20);
		nspeed = speed;
	}
	CPointer.visible = weapon._weaponnumber != gurnade;
	CPointer.frame = nearnumber( CPointer.frame, 0.2+AbdForce.y/5, 0.03);
 my.skill4 = maxmaxnum( my.skill4 , AngleDef( my.skill2, player.pan));

 my.skill2 = ang( player.pan);
 my.skill1 = nearangle( my.skill1, my.skill2, 1);
 if (abs(my.skill1 - my.skill2)<1)
 {
	my.skill3 -= 0.75;

	 if (my.skill4 > 0)
	 {
	  LastCompasState = 2;
	 } 
	  my.skill4 = nearnumber( my.skill4, 0 ,0.1);
	  my.skill6 = 0;
	 }else
	 {
	 if (LastCompasState == 2)
	 { 
	   my.skill4 = 0;
	 } 
	 LastCompasState = 1;
	 my.skill3 = 0;
	 my.skill6 = 1;
 }
// my.skill1 += ToNumberBut( my.skill1, my.skill2, 2);
 my.skill5 = nearangle( my.skill5, my.skill1 , 1);

 my.roll = camera.pan+90; //my.skill5 + sin(my.skill3) * my.skill4;
 if (EnemyPos.visible)
 {
	temp.x = EnemyPos.Enemy_X - player.x;
	temp.y = EnemyPos.Enemy_Y - player.y;
	temp.z = EnemyPos.Enemy_Z - player.z;
	vec_to_angle( temp, temp);
	EnemyPos.roll = player.pan - temp.pan;

	//enemypos.roll = player.pan - enemypos.skill1;
 }
}

wait(1);
}
}

entity Compass
 {
    type =  <incompass.bmp>;
    view = camera;
    
    flags = visible, oriented;
    scale_x = 0.015;
    scale_y = -0.015;
    x = 10; 
    y = 5;
    z = -3.5;  
    ambient = 100;
        
 }

function ShowEnemyPos(ValueR)
{
	EnemyPos.roll = Compass.roll-ValueR;
}


entity SpeechMsg
 {
    type =  <M_GM_47.tga>;
    view = camera;
    
    //flags =  bright;
    scale_x = 0.018;
    scale_y = 0.018;
    x = 10;   
    y = 0;
    z = 3.5;
        
 }

entity SpeechMsg2
 {
    type =  <M_GM_48.tga>;
    view = camera;
    
    //flags =  bright;
    scale_x = 0.018;
    scale_y = 0.018;
    x = 10;   
    y = 0;
    z = 3.5;
        
 }

entity SliderBtn
 {
    type =  <SliderBtn.tga>;
    view = camera;
    scale_x = 0.015;
    scale_y = 0.015;
    x = 10;   
    y = -0.6;
    z = 0.8;
     ambient = 100;
     event = ChangeVolume;
     skill1 = -0.6;
     skill2 = 1.2;
     skill3 = 0.2;
     skill4 = 0.2;
 }

entity SliderSBtn
 {
    type =  <SliderBtn.tga>;
    view = camera;
    
    scale_x = 0.015;
    scale_y = 0.015;
    x = 10;   
    y = -0.6;
    z = 1.28;
     ambient = 100;
     event = ChangeSVolume;
     skill1 = -0.6;
     skill2 = 1.2;
     skill3 = 0.2;
     skill4 = 0.2;
 }

entity SliderMSpeedBtn
 {
    type =  <SliderBtn.tga>;
    view = camera;
    
    scale_x = 0.015;
    scale_y = 0.015;
    x = 10;   
    y = -0.6;
    z = -0.6;
     ambient = 100;
     event = ChangeMouSpeed;
     skill1 = -0.6;
     skill2 = 1.2;
     skill3 = 0.2;
     skill4 = 0.2;
 }

entity SettingsOkBtn
 {
    type =  <ok.tga>;
    view = camera;
    
    scale_x = 0.015;
    scale_y = 0.015;
    x = 10;   
    y = -0.55;
    z = -1.85;
    ambient = 100;
    event = OkEvent;
     skill3 = 0.6;
     skill4 = 0.2;
 }


entity SettingsEscBtn
 {
    type =  <cancel.tga>;
    view = camera;
    
    scale_x = 0.015;
    scale_y = 0.015;
    x = 10;   
    y = 0.55;
    z = -1.85;
    ambient = 100;
    event = CancelEvent;
     skill3 = 0.6;
     skill4 = 0.2;
 }


entity VWeaponSprite1
 {
    type =  <weaponsign.mdl>;
    view = camera;
    flags visible;
    layer = 2;
    scale_x = 0.005;
    scale_y = -0.005;
    scale_z = 0.005;
    x =  10 ;   
    y = -4.5;
    z = -4 ;
    // ambient = 100;
        
 }
/*
entity object1
 {
    type =  <hobject.mdl>;
    view = camera;
    flags visible;
    layer = -10;
    scale_x = 0.005;
    scale_y = -0.005;
    scale_z = 0.005;
    x =  10 ;   
    y = 5;
    z = 3.8 ;
    // ambient = 100;
        
 }
entity object2
 {
    type =  <hobject.mdl>;
    view = camera;
    flags visible;
    layer = -10;
    scale_x = 0.005;
    scale_y = -0.005;
    scale_z = 0.005;
    x =  10 ;   
    y = 5;
    z = 1.8 ;
    // ambient = 100;
        
 }
entity object3
 {
    type =  <hobject.mdl>;
    view = camera;
    flags visible;
    layer = -10;
    scale_x = 0.005;
    scale_y = -0.005;
    scale_z = 0.005;
    x =  10 ;   
    y = 5;
    z = 2.8 ;
    // ambient = 100;
        
 }
entity object4
 {
    type =  <hobject.mdl>;
    view = camera;
    flags visible;
    layer = -10;
    scale_x = 0.005;
    scale_y = -0.005;
    scale_z = 0.005;
    x =  10 ;   
    y = 5;
    z = 0.8 ;
    // ambient = 100;
        
 }
*/

function OkiSettings()
{
		SettingsVisible(0);
		//ChangeResolution(SliderResBtn);
		RePosGui();
}

function EscapeSettings()
{
		SliderBtn.y       = LastSettingsValue[0];
		 Guifunction = SliderBtn.event;
		 Guifunction( SliderBtn);
		SliderSBtn.y      = LastSettingsValue[1];
		 Guifunction = SliderSBtn.event;
		 Guifunction( SliderSBtn);
		SliderMSpeedBtn.y = LastSettingsValue[2];
		 Guifunction = SliderMSpeedBtn.event;
		 Guifunction( SliderMSpeedBtn);
		//SliderResBtn.y     = LastSettingsValue[3];

		SettingsVisible(0);
}

entity HldBk
 {
    type =  <healthbk.tga>;
    view = camera;
    
    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    x = 10;   
    y = 0;
    z = -4;
     ambient = 100;
       
 }

entity HldSld
 {
    type =  <Hsld.mdl>;
    view = camera;
    
    flags = visible, bright;
    scale_x = 0.005;
    scale_y = 0.045;
    scale_z = 0.004;
    x = 10;   
    y = 0;
    z = -4;
    ambient = 100;
        
 }

entity WeaponStore
 {
    type =  <weaponstore.mdl>;
    view = camera;
    
    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = -5.5;
    z = -4;
    ambient = 100;
    skill1 =  6;
    skill1 =  101;
 }

entity DWeaponStore
 {
    type =  <weaponstore.mdl>;
    view = camera;
    
    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = -5.3;
    z = -4.15;
    skill1 =  6;
    skill1 =  101;
    skin =  4;
 }

entity SettingsBK
 {
    type =  <main.tga>;
    view = camera;
    
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 0;
    z = 0;
    ambient = 100;
 }



function SettingsVisible(Val)
{
if (val == SliderBtn.visible){return;}
 SliderBtn.visible = Val;
 SliderSBtn.visible = Val;
// SliderAmbBtn.visible = Val;
 SliderMSpeedBtn.visible = Val;
 //SliderResBtn.visible = Val;
 SettingsOkBtn.visible = Val;
 SettingsEscBtn.visible = Val;
 SettingsBK.visible = Val;
 //MouseFlare.visible = Val;
if (val)
{
	AlphaMainMenu(0);
	LastSettingsValue[0] = SliderBtn.y;
	LastSettingsValue[1] = SliderSBtn.y;
	LastSettingsValue[2] = SliderMSpeedBtn.y;
	//LastSettingsValue[3] = SliderResBtn.y;
	lastEscFuc = on_esc;
	on_esc = EscapeSettings;
	lastEnterFuc = on_enter;
	on_enter = OkiSettings;
	//mouseing();

}else
{
	AlphaMainMenu(100);

if (lastEscFuc)
{
	on_esc = lastEscFuc;
}
if (lastEscFuc)
{
	on_enter = lastEnterFuc;
}
}
}


panel WeaponPan
{
	pos_x		720;
	pos_y		550;
	digits	0,0,3, Ofont,1, CurrentAmmo.x;
	flags = visible, refresh;
}

panel WeaponPan2
{
	pos_x		760;
	pos_y		578;
	digits	0,0,3, Ofont,1, CurrentAmmo.Y;
	flags = visible, refresh;
}

panel DieSolder
{
	pos_x		0;
	pos_y		0;
	digits	0,0,3, Ofont,1, SolderCounter;
	//digits	50,0,3, Ofont,1, SnipersCount;
	//digits	100,0,3, Ofont,1, SnipersCount.y;
	//flags = visible, refresh;
}

function RePosGui()
{
		WeaponPan.pos_x	=   screen_size.x - 80;
		WeaponPan.pos_y	=   screen_size.y - 50;

		WeaponPan2.pos_x =  screen_size.x - 40;
		WeaponPan2.pos_y =  screen_size.y - 20;
		ResetSetting();

}

entity MisionsMsg1
 {
    type =  <PM_09_00.tga>;
    view = camera;

    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = 0;
    ambient = 100;
 }
/*
entity MisionsMsg2
 {
    type =  <brok-f-003.tga>;
    view = camera;

    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = +0.35;
    ambient = 100;
 }

entity MisionsMsg3
 {
    type =  <brok-f-003.tga>;
    view = camera;

    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = 0;
    ambient = 100;
 }


entity MisionsMsg4
 {
    type =  <brok-f-003.tga>;
    view = camera;

    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = -0.35;
    ambient = 100;
 }

entity MisionsMsg5
 {
    type =  <brok-f-003.tga>;
    view = camera;

    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = -0.75;
    ambient = 100;
 }
*/
/*
entity MisionsMsg6
 {
    type =  <PM_10_02.tga>;
    view = camera;

    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = +0.5;
    ambient = 100;
 }

entity MisionsMsg7
 {
    type =  <PM_10_03.tga>;
    view = camera;

    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = 0;
    ambient = 100;
 }

entity MisionsMsg8
 {
    type =  <PM_10_04.tga>;
    view = camera;

    flags = visible;
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = -0.5;
    ambient = 100;
 }
*/
entity missionsbk
 {
    type =  <misions_back.TGA>;
    view = camera;
    
    scale_x = 0.015;
    scale_y = 0.015;
    scale_z = 0.02;
    x = 10;   
    y = 8;
    z = 0;
    ambient = 100;
 }

function VisibleGui1(Val)		//replace
{
if (weapon==0)
{return;
}
	WeaponPan.visible = val;
	WeaponPan2.visible = val;
	//outcompass.visible = val;
	if ( bulletnum[weapon._ammotype - 1] >100)
	{
		DWeaponStore.visible = val;
	}
	WeaponStore.visible = val;
	//HldBk.visible = val;
	//HldSld.visible = val;
	//Compass.visible = val;
}


function Gun_Hand_state()
{
	if (Kick_Action == 0)
	{return;
	}
	cpointer.visible=1;
	if (Kick_state == 0)
	{
		Maine_state = 0;
		if (cameraction == EyCamera)&&(player != null)
		{
			camorder=3;
			cameraction = TPsCamra;
			player.invisible = 0;
			player.shadow = (player.invisible == 0)&&shadowenable;

		}
		Kick_state = 1;
		you = Pointer_To_Entity( player.WeaponMesh1);
		you.invisible = 1;
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponMesh2);
		you.invisible =1;
		you.shadow = 0;
		you =Pointer_To_Entity( player.WeaponStore2);
		you.invisible =1;
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponStore1);
		you.invisible =1;
		you.shadow = 0;
		SetActivePart( SharedEntity, BodyParts[11],1);
		SetActiveSeq( SharedEntity,  BodyParts[11],"walk");

		VisibleGui1(0);
		
	}
	else
	{
		Kick_state = 0;
		Kick_Action = 1;
		SetActivePart( SharedEntity, BodyParts[11],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"shot");
		you = Pointer_To_Entity( player.WeaponMesh1);
		you.invisible = 0;
		you.shadow = shadowenable;
		if (weapon_number == 14)
		{
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =0;
			you.shadow = shadowenable;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =0;
			you.shadow = shadowenable;
		}
		if (weapon_number != 1)&&(weapon_number != 8)&&(weapon_number != 9)&&(weapon_number != 15)&&(weapon_number != 16)
		{
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =0;
			you.shadow = shadowenable;
		}
		VisibleGui1(1);
	}
}

function Maines_State()
{
	if (Kick_Action == 0)
	{return;
	}
	if (Maine_state == 0)
	{
		Kick_state = 0;
		if (cameraction == EyCamera)&&(player != null)
		{
			camorder=3;
			cameraction = TPsCamra;
			player.invisible = 0;
			player.shadow = (player.invisible == 0) && shadowenable;

		}
		cpointer.visible=0;
		Maine_state = 1;
		PTempstr = WeapnsFiles[8];
		you = Pointer_To_Entity( player.WeaponMesh1);
		morph ( PTempstr, you);

		SetActivePart( SharedEntity, BodyParts[0],1);
		SetActiveSeq( SharedEntity,  BodyParts[0],"mines");
		SetActivePart( SharedEntity, BodyParts[0],0);
		you = Pointer_To_Entity( player.WeaponMesh1);
		you.invisible = 0;
		you.shadow = shadowenable;
		you = Pointer_To_Entity( player.WeaponMesh2);
		you.invisible =1;
		you.shadow = 0;
		you =Pointer_To_Entity( player.WeaponStore2);
		you.invisible =1;
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponStore1);
		you.invisible =1;
		you.shadow = 0;
		VisibleGui1(0);
		
	}
	else
	{
		Maine_state = 0;
		Kick_Action = 1;
		cpointer.visible=1;
		PTempstr = WeapnsFiles[weapon_number];
		you = Pointer_To_Entity( player.WeaponMesh1);
		morph ( PTempstr, you);
		SetActivePart( SharedEntity, BodyParts[8],1);
		SetActiveSeq( SharedEntity,  BodyParts[8],"shot");

		you = Pointer_To_Entity( player.WeaponMesh1);
		you.invisible = 0;
		you.shadow = shadowenable;
		if (weapon_number == 14)
		{
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =0;
			you.shadow = shadowenable;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =0;
			you.shadow = shadowenable;
		}
		if (weapon_number != 1)&&(weapon_number != 8)&&(weapon_number != 9)&&(weapon_number != 15)&&(weapon_number != 16)
		{
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =0;
			you.shadow = shadowenable;
		}
		VisibleGui1(1);
	}

}


function Showmessions()
{
if (freeze_mode || eplhealth){return;}
var lkey=key_lastpressed;
if (missionsbk.visible )
{ return;}

	missionsbk.y = 10.75;
	missionsbk.visible = 1;
	missionsbk.alpha = 0;
	while (key_pressed(lkey)==1)
	{
		missionsbk.alpha = min(missionsbk.alpha+5,100);
		MisionsMsg1.alpha  = missionsbk.alpha;
		
		missionsbk.y = max( 3.75, missionsbk.y-5);
		MisionsMsg1.y = missionsbk.y;
		
		wait(1);
	}

	while  (missionsbk.y<8)
	{
		missionsbk.alpha = max(missionsbk.alpha-5,0);
		MisionsMsg1.alpha  = missionsbk.alpha;
		
		missionsbk.y += 5;
		MisionsMsg1.y = missionsbk.y;
		
		wait(1);

	}
	missionsbk.visible = 0;
}

//--------------------------------------------------------
// hani code
function myShowmessions()
{
	me = player;
	var timer = 0;
	if (freeze_mode || eplhealth){return;}
	if (missionsbk.visible )
	{ return;}

	missionsbk.y = 10.75;
	missionsbk.visible = 1;
	missionsbk.alpha = 0;
	while (timer< 100){
		timer += 1;
		missionsbk.alpha = min(missionsbk.alpha+5,100);
		MisionsMsg1.alpha  = missionsbk.alpha;
		missionsbk.y  = max( 3.75, missionsbk.y-5);
		MisionsMsg1.y = missionsbk.y;
		
	   wait(1);
	}
	while  (missionsbk.y<8)
	{
		 missionsbk.alpha = max(missionsbk.alpha-5,0);
		 MisionsMsg1.alpha  = missionsbk.alpha;		
		 missionsbk.y += 5;
		 MisionsMsg1.y = missionsbk.y;
		
	 wait(1);
	}
	missionsbk.visible = 0;
}

function ShowMessionsAuto()
{
	var ApperanceTime = 0;
	if (freeze_mode || eplhealth){return;}
	missionsbk.y = 10.75;
	if (missionsbk.visible == 1)
	{return;
	}
	missionsbk.visible = 1;
	missionsbk.alpha = 0;
	while (1)
	{
		missionsbk.alpha = min(missionsbk.alpha+5,100);
		MisionsMsg1.alpha  = missionsbk.alpha;				
		missionsbk.y = max( 3.75, missionsbk.y-5);	
		MisionsMsg1.y = missionsbk.y;
		ApperanceTime+=2;
		if (ApperanceTime > 100)
		{ApperanceTime = 0;break;
		}
		wait(1);
	}
	while  (missionsbk.y<8)
	{
		missionsbk.alpha = max(missionsbk.alpha-5,0);
		MisionsMsg1.alpha  = missionsbk.alpha;
		
		missionsbk.y += 5;		
		MisionsMsg1.y = missionsbk.y;
		wait(1);
	}
	missionsbk.visible = 0;
}



entity ShowPressUses
 {
    type =  <armsg7.tga>;
    view = camera;

    scale_x = 0.015;
    scale_y = 0.015;
    x = 10;   
    y = 0;
    z = -3.5;
    ambient = 100;
    skill1 =1;
       
 }

function ShowUsesMission()
{
if (freeze_mode || eplhealth)
{return;}

me = ShowPressUses;

my.skill2 = min( my.skill2+1.01,3);

if (my.visible)
{ return; }
my.visible = 1;
while (my.skill2>=0)
{

	my.alpha += my.skill1;

	if (my.alpha<=0)
	{my.skill1 =1;	}

	if (my.alpha>=100)
	{my.skill1 =-1;	}

	my.skill2-=1;
	wait(1);
}
my.visible = 0;
}

function ShowHelp()
{
var lkey=key_lastpressed;
if splashscreen.visible || freeze_mode ||(messionfailed != 0)||(MovieOrSucess != 0)
{ return;}
zoomout();
freeze_mode = 1;
	splashscreen.visible = 1;
	splashscreen.alpha = 0;
	while (key_pressed(lkey)==1){
		splashscreen.alpha = min(splashscreen.alpha+5,50);
		wait(1);
	}

	while  (splashscreen.alpha>0)
	{
		splashscreen.alpha = max(splashscreen.alpha-10,0);
		wait(1);
	}
	splashscreen.visible = 0;
freeze_mode = 0;

}


entity mesges
{
	type = <Msgses.tga>;
	view = camera;
	flags = visible;
	scale_x = 0.008;
	scale_y = 0.008;
	scale_z = 0.008;
	x = 7;
	y = 0;
	z = 2.7;
ambient = -10;
}

function UpDownTextMsg(cmy)
{
my = 0;
you = cmy;

ofses = max(min( -1, ofses+ you.skill1), -ofses.y);
WriteALine( mesges, ofses);
you.ambient = -100;
you.skill2 = 0;
while (you.skill2 <10){ you.skill2 += 1;	if (mouse_left ==0 )	{goto  ending;}	wait(1);}

while (mouse_left){
you.skill2 += 1;
if (frc(you.skill2/5)==0){ 
	ofses = max(min( -1, ofses+ you.skill1), -ofses.y);
	WriteALine( mesges, ofses);
}
wait(1);}

ending : you.ambient = 0;

}

entity UpTextMsg
{
	type = <UpDownBtn.tga>;
	view = camera;
	scale_x = 0.005;
	scale_y = 0.005;
	x = 10;
	y = 4;
	z = 4;
	event = UpDownTextMsg;
	skill1 = -1;
	skill3 = 0.2;
	skill4 = 0.2;
	alpha = 10;
}

entity DownTextMsg
{
	type = <UpDownBtn.tga>;
	view = camera;
	scale_x = 0.005;
	scale_y = -0.005;
	x = 10;
	y = 4;
	z = 2.1;
	event = UpDownTextMsg;
	skill1 = 1;
	skill3 = 0.2;
	skill4 = 0.2;
	alpha = 10;
}

function msggdd(MsgId)
{
 ofses.y = WriteALine( mesges, MsgId);

}

function ZoomGui()
{
	   if (camera.arc==60)
	   {
		mesges.x = 7;
		mesges.z = 2.7;
		Compass.x = 10; 
		Compass.y = 5;
		Compass.z = -3.5;  
		VWeaponSprite1.y = -4.5;
		WeaponStore.y = -5.5;
		WeaponStore.z = -4;

	   }
	   if (camera.arc==30)
	   {
		mesges.x = 15;
		mesges.z = 2.68;
		Compass.x = 21.5; 
		Compass.y = 4.96;
		Compass.z = -3.47;  
		VWeaponSprite1.y = -4.464;
		WeaponStore.y = -5.445;
		WeaponStore.z = -3.968;
	   }
	   if (camera.arc==20)
	   {
		mesges.x = 23;
		mesges.z = 2.689;
		Compass.x = 32.85; 
		Compass.y = 4.97;
		Compass.z = -3.485;  
		VWeaponSprite1.y = -4.473;
		WeaponStore.y = -5.467;
		WeaponStore.z = -3.976;
	   }
	   if (camera.arc==15)
	   {
		mesges.x = 30;
		mesges.z = 2.67;
		Compass.x = 42.85; 
		Compass.y = 4.9;
		Compass.z = -3.46;
		VWeaponSprite1.y = -4.41;
		WeaponStore.y = -5.39;
		WeaponStore.z = -3.92;
		
	   }
	VWeaponSprite1.x =   Compass.x;
	WeaponStore.x =   Compass.x;

	VWeaponSprite1.z = WeaponStore.z;
	HldBk.z = WeaponStore.z;
	HldBk.x =   Compass.x;
	
	vec_set( HldSld.pos, HldBk.pos);
	vec_set( outcompass.pos, Compass.pos);
	vec_set( EnemyPos.pos, Compass.pos);
	vec_set( ObjecPos.pos, Compass.pos);
	//vec_set( ObjecPos1.pos, Compass.pos);
}

function AutoZoom(zoomval)
{
       if (camera.arc != 60)
        {           
	CamerAction = LCamerAction;
	InitPPCamera();
	   CPointer.scale_x = 0.011;
	   CPointer.scale_y = 0.011;
	   CPointer.bright = 1;
	   CPointer.x = 20;
           camera.arc=60;
	   morph ( <Cursor.MDL>, CPointer);
	   SoulderHI[0]=0;
        }
       else
        {           
	LCamerAction = CamerAction;
	CamerAction = EyCamera;
	InitPPCamera();
	   SoulderHI[0]= SoulderHI[1];
	   CPointer.scale_x = 0.011;
	   CPointer.scale_y = 0.011;
	   if (zoomval==30)
	   {
	    CPointer.x = 10; goto con;
	   }
	   if (zoomval==15)
	   {
	    CPointer.x = 20; goto con;
	   }
	   if (zoomval==20)
	   {
	    CPointer.x = 15.5; goto con;
	   }

con:	   CPointer.bright = 0;
	   morph ( <muasher.tga>, CPointer);

           camera.arc= zoomval; 

	}
	ZoomGui();

}


function ResetSetting()
{
	SetPosScroll( SliderMSpeedBtn, (MousPeed/2-1)*100/9);
	SetPosScroll( SliderBtn, musicvolume);
	SetPosScroll( SliderSBtn, sound_vol);
}
