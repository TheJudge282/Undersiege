
function RemoveWeapons()
{
var i = 0;
while (i <= 19)
{
ownedweapon[i]   = 0; 
PWeapons[i] = 0;
bulletnum[i]= 0;
//totalbullets[i]= 1000;
i+=1;

}

PAllWeapons[0] = GunSelect1;
PAllWeapons[1] = GunSelect2;
PAllWeapons[2] = GunSelect3;
PAllWeapons[3] = GunSelect4;
PAllWeapons[4] = GunSelect5;
PAllWeapons[5] = GunSelect6;
PAllWeapons[6] = GunSelect7;
PAllWeapons[7] = GunSelect8;
PAllWeapons[8] = GunSelect9;
PAllWeapons[9] = GunSelect10;
PAllWeapons[10] = GunSelect11;
PAllWeapons[11] = GunSelect12;
PAllWeapons[12] = GunSelect13;
PAllWeapons[13] = GunSelect14;
PAllWeapons[14] = GunSelect15;
PAllWeapons[15] = GunSelect16;
PAllWeapons[16] = GunSelect17;
PAllWeapons[17] = GunSelect18;

PFWeapons1 = 0;
PFWeapons2 = 0;
PFWeapons3 = 0;
PFWeapons4 = 0;

WeapnsFiles[0]  = weapo1;
WeapnsFiles[1]  = weapo1;
WeapnsFiles[2]  = weapo2;
WeapnsFiles[3]  = weapo3;
WeapnsFiles[4]  = weapo4;
WeapnsFiles[5]  = weapo5;
WeapnsFiles[6]  = weapo6;
WeapnsFiles[7]  = weapo7;
WeapnsFiles[8]  = weapo8;
WeapnsFiles[9]  = weapo9;
WeapnsFiles[11]  = weapo11;
WeapnsFiles[12] = weapo12;
WeapnsFiles[13] = weapo13;
WeapnsFiles[14] = weapo14;
WeapnsFiles[15] = weapo15;
WeapnsFiles[16] = weapo16;
WeapnsFiles[17] = weapo17;
WeapnsFiles[10] = weapo11;

//StoresFiles[0] = weapstor1;
//StoresFiles[1] = weapstor2;
StoresFiles[2] = weapstor2;
StoresFiles[3] = weapstor3;
StoresFiles[4] = weapstor4;
StoresFiles[5] = weapstor5;
StoresFiles[6] = weapstor6;
StoresFiles[7] = weapstor7;
//StoresFiles[8] = weapstor9;
//StoresFiles[9] = weapstor11;
StoresFiles[10] = weapstor11;
StoresFiles[11] = weapstor11;
StoresFiles[12] = weapstor12;
StoresFiles[13] = weapstor13;
StoresFiles[14] = weapstor14;
//StoresFiles[15] = weapstor15;
//StoresFiles[16] = weapstor16;

BodyParts[0]  = AllBody;
BodyParts[1]  = LegsBody;
BodyParts[2]  = HeadBody;
BodyParts[3]  = HandsBody;
BodyParts[4]  = ChestBody;
BodyParts[5]  = chestlegs;
BodyParts[6]  = chestlegshead;
BodyParts[7]  = chestheadhands;
BodyParts[8]  = ak47Body;
BodyParts[9]  = BksBody;
BodyParts[10] = coltBody;
BodyParts[11] = grenadeBody;
BodyParts[12] = nigaifaBody;
BodyParts[13] = STICKBody;
BodyParts[14] = RBJBody;
BodyParts[15] = uziBody;
BodyParts[16] = uzix2Body;
BodyParts[17] = bompactionBody;


WeaponFrames[0] = WepFram1;
WeaponFrames[1] = WepFram2;
WeaponFrames[2] = WepFram3;
WeaponFrames[3] = WepFram4;
WeaponFrames[4] = WepFram5;
WeaponFrames[5] = WepFram6;
WeaponFrames[6] = WepFram7;
WeaponFrames[7] = WepFram8;
WeaponFrames[8] = WepFram9;
WeaponFrames[9] = WepFram10;
WeaponFrames[10] = WepFram11;
WeaponFrames[11] = WepFram12;
WeaponFrames[12] = WepFram13;

}
function WeaponGui()
{
if (weapon)
{
CurrentAmmo.x = int((totalbullets[weapon._ammotype - 1]/ maxbulletnum[weapon._ammotype - 1]+ 0.5)-1);
CurrentAmmo.y = int(bulletnum[weapon._ammotype - 1] +0.5);

WeaponStore.scale_z = 0.025+ 1/ maxbulletnum[weapon._ammotype - 1]*0.5;

WeaponStore.frame = WeaponStore.skill1-(int(bulletnum[weapon._ammotype - 1] +0.5));
DWeaponStore.visible =  bulletnum[weapon._ammotype - 1] >100 ;
	if (DWeaponStore.visible)
	{
		DWeaponStore.scale_z = WeaponStore.scale_z;
		DWeaponStore.frame = DWeaponStore.skill1-((int(bulletnum[weapon._ammotype - 1] +0.5))-100);
	}
}
}

function GuiUpdate()
{
//SetPosScroll(SliderResBtn,(video_mode-6)*50);
SetPosScroll(SliderMSpeedBtn,MousPeed*10);

/*
while (LoopRun)
{


EnemyPos.roll+=10;

wait(1);
}*/
}

function InitAllGui()
{

HldSld.u = 0;
SSave1Btn.LeaderId = SSave1Txt;
SSave2Btn.LeaderId = SSave2Txt;
SSave3Btn.LeaderId = SSave3Txt;
SSave4Btn.LeaderId = SSave4Txt;
SSave5Btn.LeaderId = SSave5Txt;
SSave6Btn.LeaderId = SSave6Txt;
SSave7Btn.LeaderId = SSave7Txt;
SSave8Btn.LeaderId = SSave8Txt;
SSave9Btn.LeaderId = SSave9Txt;
SSave10Btn.LeaderId = SSave10Txt;

}

function wireframes()
{
if (wireframe==0)
{
wireframe = 1;
}else
{
wireframe = 0;
}
}

function Prnddd()
{
if (wireframe.y==0)
{
wireframe.y = 1;
while ( wireframe.y)
{
PrntScreen();
wait(1);
}
}else
{
wireframe.y = 0;
}
}

function DONothing()
{
	return(0);
}

function InitInterface()
{
var k=0;
while (k<30)
{
 PressedKeys[k]=0;
 k+=1;
}
k=0;
while (k<=255)
{
 key_set(k , DONothing);
 k+=1;
}

on_mouse_left =  0;
on_mouse_right =  0;


FH = file_open_read (InKFile);

var ky;

k=0;
while (k<30)
{
// Customkeys[k] = 
 file_var_read(FH);
 k+=1;
}

bloodenable = file_var_read(FH);

shadowenable = file_var_read(FH);

ky = file_var_read(FH) + 6;
SWITCH_VIDEO  ky,0,0;

MousPeed = file_var_read(FH);
level   = file_var_read(FH);
level.y = file_var_read(FH);

file_close(FH);
RePosGui();
}


function sNowMsg()
{
 ofses = -1;
 ofses.y = WriteALine(mesges,random(40));

}
string MyFileName,"                                 ";
function getMyName(CMy)
{
 str_for_entfile( MyFileName, CMy);
}

function savecolls()
{
me = player;
while (1)
{
LoadlevelEntity();
wait(1);
}
}

function WaiitthenRemove()
{
wait(1);
remove me;
}

function RemoveAllKeys()
{
	var ky = 0;
	while (ky<=255)
	{
	 key_set(ky , DONothing);
	 ky+=1;
	}

	on_mouse_left =  0;
	on_mouse_right =  0;
}

function InitInput()
{

var ky = 0;
while (ky<=255)
{
 key_set(ky , DONothing);
 ky+=1;
}

on_mouse_left =  0;
on_mouse_right =  0;


//on_p = game_puase;
on_mouse_left =  LMEvent;
on_esc = CallMainMenu;
//on_f10 = gameclose;
//on_f2 = new_game;
on_f5 = QSave_game;
on_f9 = QLoad_game;
on_f1 = ShowHelp;
//on_f4 = on_d;
//on_alt = NextWair;
on_tab = Showmessions;
//on_j = FrreCame;
//on_h = HideGui;
//on_f11 = wireframes;

//on_h = HideGui;

//on_g = Prnddd;
//on_l = MainesAmmo;
//on_p = HitActe;
//on_h = sNowMsg;


key_set(Customkeys[0] , KeyHideWeapon );

key_set(Customkeys[1] , KeyWeapon1    );

key_set(Customkeys[2] , KeyWeapon2    );

key_set(Customkeys[3] , KeyWeapon3    );

key_set(Customkeys[4] , KeyWeapon4    );

key_set(Customkeys[5] , KeyNxWeapon   );

key_set(Customkeys[6] , KeyPrvWeapon  );

key_set(Customkeys[7] , KeyZoom       );

key_set(Customkeys[8] , KeySlowFS     );

key_set(Customkeys[9] , KeySAttack    );

key_set(Customkeys[10] , KeyCamera     );

// key_set(Customkeys[11] , KeyMap     );

key_set(Customkeys[12] , keyFWalk);

key_set(Customkeys[13] , keyBWalk);

key_set(Customkeys[14] , KeySLeft );

key_set(Customkeys[15] , KeySRight );

key_set(Customkeys[16] , KeyLookUp     );

key_set(Customkeys[17] , KeyLookDown   );

key_set(Customkeys[18] , KeyTurnLeft   );

key_set(Customkeys[19] , KeyTurnRight  );

key_set(Customkeys[20] , KeyPAttack    );

key_set(Customkeys[21] , KeyReload     );

key_set(Customkeys[22] , KeyJump       );

key_set(Customkeys[23] , KeyCrouch     );

key_set(Customkeys[24] , KeyUse        );

key_set(Customkeys[25] , KeySlowMove   );



key_set(Customkeys[26] , KeyMainAmmo     );

key_set(Customkeys[27] , KeySecoAmmo     );

key_set(Customkeys[28] , KeyDrWeapon     );

}




function  DirectUpdateInput
{
while (1)
{
if (on_mouse_left != 0)
{
	InputRefresh();
	if (MousePos[5])
	{
		KeyReload();
	}

	if (MousePos.z>0)
	{
		KeyNxWeapon();
	}else{
		if (MousePos.z<0)
		{
			KeyPrvWeapon();
		}
	}
}

wait(1);
}
}


function initSound()
{
 var lowp;
 Lowp = SliderSBtn.skill2 - SliderSBtn.skill1;
 SliderSBtn.y = SliderSBtn.skill2-soundvolume*Lowp/100;
 sound_vol = soundvolume;

 Lowp = SliderBtn.skill2 - SliderBtn.skill1;
 SliderBtn.y = SliderBtn.skill2-musicvolume*Lowp/100;
 SetVolume( CurrentSong,  musicvolume);

}

function initilization()
{


on_0 = 0;
LoopRun = 0;
freeze_mode = 1;
eplhealth = 0;
	dll_open("Plug1.dll");
	InitSky();
wait(10);
//freeze_mode = 0;
Camra2Player = 1;
LeaderCount = 0;
SolderDCounter = 0;
SolderCounter = 0;
speed = 200;
LoopRun = 1;
VisMainMenu(0);
	dll_open(DllName);
	DllInit(19);
	InitAllGui();
	AddPath("music");
	modelindex = Load3dMdel("khaled.012");
	fog_color = 1;
	camera.fog = 2;
	RemoveWeapons();

	camorder=2;
	cameraction = EyCamera;

	create( <point1.mdl>, temp, Entity2Collision);
	CompassFunc(Compass);
	wait(10);
	MousePos.x=  pointer.x;
	MousePos.y=  pointer.z;
//	hwakin = 1;
//	CreateRandomModels();
//Messagng();
CloseAllSongs();
CurrentSong=OpenSong(SongName);
//playSong(CurrentSong);

GuiUpdate();
CreateFnt(FontName);
CreateAtxt(TextName);

Load_PathPoints(levelpath);
LoadAllEntityes();
//SpriteWeapon = 1;


//throwsomthing();
LonlyWeapons[ colt       ]        = Lcolt            ;
LonlyWeapons[ ak47       ]        = Lak47            ;
LonlyWeapons[ m16        ]        = Lm16             ;
LonlyWeapons[ m4         ]        = Lm4              ;
LonlyWeapons[ pumaction  ]        = Lpumaction       ;
LonlyWeapons[ s99sniper  ]        = Ls99sniper       ;
LonlyWeapons[ lmg        ]        = Llmg             ;
LonlyWeapons[ gurnade    ]        = Lgurnade         ;
LonlyWeapons[ gasgurnade ]        = Lgasgurnade      ;
LonlyWeapons[ uzi        ]        = Luzi             ;
LonlyWeapons[ rbj        ]        = Lrbj             ;
LonlyWeapons[ galili     ]        = Lgalili          ;
LonlyWeapons[ Doubleuzi  ]        = LDoubleuzi       ;

AllAnimations[ IStnd           ]  = Stnd             ;
AllAnimations[ IRunFront       ]  = RunFront         ;
AllAnimations[ IWalkFront      ]  = WalkFront        ;
AllAnimations[ IUpSnipFire     ]  = UpSnipFire       ;
AllAnimations[ IDownSnipFire   ]  = DownSnipFire     ;
AllAnimations[ IGunFire        ]  = GunFire          ;
AllAnimations[ IDuckWalk       ]  = DuckWalk         ;
AllAnimations[ IRunRight       ]  = RunRight         ;
AllAnimations[ IRunLeft        ]  = RunLeft          ;
AllAnimations[ IFrontHit       ]  = FrontHit         ;
AllAnimations[ ILeftHit        ]  = LeftHit          ;
AllAnimations[ IRightHit       ]  = RightHit         ;
AllAnimations[ IDownHit        ]  = DownHit          ;
AllAnimations[ IBodyUpStand    ]  = BodyUpStand      ;
AllAnimations[ IBodyUpUp       ]  = BodyUpUp         ;
AllAnimations[ IBodyUpShot     ]  = BodyUpShot       ;
AllAnimations[ IHandUpStand    ]  = HandUpStand      ;
AllAnimations[ IHandUpUp       ]  = HandUpUp         ;
AllAnimations[ IHandUpShot     ]  = HandUpShot       ;
AllAnimations[ IRightStand     ]  = RightStand       ;
AllAnimations[ IRightUp        ]  = RightUp          ;
AllAnimations[ IRightShot      ]  = RightShot        ;
AllAnimations[ ILeftStand      ]  = LeftStand        ;
AllAnimations[ ILeftUp         ]  = LeftUp           ;
AllAnimations[ ILeftShot       ]  = LeftShot         ;
AllAnimations[ IUseIt          ]  = UseIt            ;
AllAnimations[ ISwatWalkFront  ]  = SwatWalkFront    ;
AllAnimations[ ISwatWalkLeft   ]  = SwatWalkLeft     ;
AllAnimations[ ISwatWalkRight  ]  = SwatWalkRight    ;
AllAnimations[ ISwatFire       ]  = SwatFire         ;

LonelyAnimat[ IHeadDie          ] = HeadDie          ;
LonelyAnimat[ ILegDie           ] = LegDie           ;
LonelyAnimat[ ISideDie          ] = SideDie          ;
LonelyAnimat[ IFlyWallDie       ] = FlyWallDie       ;
LonelyAnimat[ IWallDie          ] = WallDie          ;
LonelyAnimat[ IBackDie          ] = BackDie          ;
LonelyAnimat[ IFrontDie         ] = FrontDie         ;
LonelyAnimat[ ISurHandUp        ] = SurHandUp        ;
LonelyAnimat[ ISurDown          ] = SurDown          ;
LonelyAnimat[ ISurRun           ] = SurRun           ;
LonelyAnimat[ ISurWalk          ] = SurWalk          ;
LonelyAnimat[ ISurHandBehind    ] = SurHandBehind    ;
LonelyAnimat[ ISurRunHandBehind ] = SurRunHandBehind ;
LonelyAnimat[ ISurWalkHandBehind] = SurWalkHandBehind;
LonelyAnimat[ ISurBrith         ] = SurBrith         ;
LonelyAnimat[ ISurDie           ] = SurDie           ;

WeaponsBones[ IWeaponBone    ] = WeaponBone  ;  
WeaponsBones[ IStoreBone     ] = StoreBone   ;  
WeaponsBones[ IAnergaBone    ] = AnergaBone  ;  
WeaponsBones[ IWeapon2Bone   ] = Weapon2Bone ;  
WeaponsBones[ IStore2Bone    ] = Store2Bone  ;  

ofses.y = WriteALine(mesges,-1);
me = 0;
freeze_mode = 1;
PreesEnter.visible = 1;

freeze_mode = 1;
PreesEnter.visible = 1;
wait(10);
//object1.visible = 0;
while (1)
{	
	while (key_enter == 0)
	{			
		wait(1);
	}
	SplashCounter += 1;
	if (SplashCounter>2)
	{
		stop_sound(StartSoundH);
		break;
	}
	if (SplashCounter == 1)
	{
		stop_sound(StartSoundH);
		break;
		//morph EnterButum,PreesEnter;
	}
	while (key_enter == 1)
	{			
		wait(1);
	}
	wait(1);
}
freeze_mode = 0;
splashscreen.visible = off;
PreesEnter.visible = 0;
//CurrentSong=OpenSong(SongName);
playSong(CurrentSong);
SetVolume(CurrentSong,musicvolume);
if (level.z == 2)
{
	MisionsMsg1.visible=1;
	MisionsMsg2.visible=1;
	MisionsMsg3.visible=0;
	MisionsMsg4.visible=0;
	MisionsMsg5.visible=0;
	MisionsMsg1.ambient = -100;
	
}
if (level.z == 6)
{
	MisionsMsg1.visible=0;
	MisionsMsg2.visible=1;
	MisionsMsg3.visible=0;
	MisionsMsg4.visible=0;
	MisionsMsg5.visible=0;
	MisionsMsg6.visible=0;
	MisionsMsg7.visible=0;
	MisionsMsg8.visible=0;
	
}
DirectUpdateInput();
InitInput();
initSound();
wait(1);
SaveAll(13,0);
LoadWaitLevel();
}

function finalization()
{
CloseAllSongs();
wait (1);
exit;
}

function MissionFailed()
{
	messionfailed = 1;
	ZoomOut();
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;

}
