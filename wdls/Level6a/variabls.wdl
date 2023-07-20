string weapo1 = <coltBl.mdl> ;
string weapo2 = <ak1.mdl> ;
string weapstor2 = <ak2.mdl> ;
string enerja = <ak3.mdl> ;
string weapo3 = <m16-1.mdl> ;
string weapstor3 = <m16-2.mdl> ;
string weapo4 = <m4-1.mdl> ;
string weapstor4 = <m4-2.mdl> ;
string weapo5 = <bompaction.mdl> ;
string weapstor5 = <bompaction1.mdl> ;
string weapo6 = <sniper1.mdl> ;
string weapstor6 = <sniper2.mdl> ;
string weapo7 = <lmg1.mdl> ;
string weapstor7 = <lmg2.mdl> ;
string weapo8 = <granedBl.mdl> ;
string weapo9 = <graned2.mdl> ;
string weapo11 = <uzi1.mdl> ;
string weapstor11 = <uzi2.mdl> ;
string weapo12 = <rbj1.mdl> ;
string weapstor12 = <rbj2.mdl> ;
string weapo13 = <galili1.mdl> ;
string weapstor13 = <galili2.mdl> ;
string weapo14 = <uzi1.mdl> ;
string weapstor14 = <uzi2.mdl> ;
string weapo15 = <stick.mdl> ;
string weapo16 = <graned2.mdl> ;
string weapo17 = <nik.mdl>;


string WepFram1 = "weapon";
string WepFram2 = "radyshot";
string WepFram3 = "shot";
string WepFram4 = "radysniper";
string WepFram5 = "sniper";
string WepFram6 = "1ammo";
string WepFram7 = "radyanerga";
string WepFram8 = "anergashot";
string WepFram9 = "1stand";
string WepFram10 = "radyknck";
string WepFram11 = "knck";
string WepFram12 = "rady1ammo";
string WepFram13 = "run";



var counter_1 = 0;
var see_scan = 3200;

var SharedEntity;
var PartIndex;
var numd;

var breat_starte =0;
var Key_pressed = 0;
var_nsave WeaponFrames[13];
var speed=200;

var_nsave WeapnsFiles[18];//new
var_nsave StoresFiles[18];//new
string HandsName,"weap8";

var_nsave flash_pos[weaponscount]        = 98 ,279 ,448 ,669 ,95 ,378 ,546 ,0 ,0 ,0 ,28 ,0 ,256 ,33 , 611, 0;
var bullet_pos =0;
var Tflash_P = 0;
var Tflash_T = 0;

//		                    1   ,   2   ,  3    ,  4    ,  5  ,  6    ,  7 , 8 , 9 , 10, 11 ,12 , 13 , 14
var_nsave gun_out[weaponscount]         = 30  ,  30   ,  25   ,  25   ,  0  ,  30   , 30 , 0 , 0 , 0 , 25  , 0 , 30 , 50;
var_nsave gun_in[weaponscount]          = 65  ,  65   ,  50   ,  50   ,  0  ,  65   , 65 , 0 , 0 , 0 , 50  , 0 , 65 , 50;
var_nsave gun_reload[weaponscount]      = 90  ,  85   ,  70   ,  70   ,  70 ,  75   , 80 , 0 , 0 , 0 , 70  , 0 , 75 , 50;
var_nsave animation_speed[weaponscount] = 1.5 ,    2  ,  1.6  ,  1.6  ,  0  ,  1.5  , 5  , 0 , 0 , 0 , 1.8 , 1 , 2  , 1;



//					   1	,2	,3	,4	,5	,6	,7	,8	,9	,10	,11	,12	,13	,14
var_nsave gun_out1[weaponscount]		 = 35	,30	,30	,25	,0	,30	,30	,0	,0	,0	,35	,0	,25	,35;
var_nsave gun_in1[weaponscount]		 = 45	,65	,65	,50	,0	,65	,65	,0	,0	,0	,45	,0	,50	,50;
var_nsave gun_reload1[weaponscount]		 = 90	,85	,85	,70	,70	,85	,80	,0	,0	,0	,90	,0	,70	,50;
var_nsave animation_speed1[weaponscount]	 = 1.5	,2	,2	,2	,0	,2	,3	,0	,0	,0	,2	,1	,2	,1;



var player_state = 0;
var Hand_Active = 0;	
var Hand_Wait_Count = 100;
var Breath_Wait = 30;
var Hand_Frame_Count = 0;
var Hand_Frame_Max = 100;
var Hand_Frame_Num = 0;

var Waiting_stand = 100;
var Waiting_Hand = 20;

var KickNumber = 1;
var Kick_state = 0;
var Kick_Action = 1;
var Maine_state = 0;
var Maine_Action = 1;
var Jump_State = 0;

var car_num = 0;


string name = "                                      " ;

///////////////////////////////////////////
var point_see[27] = 246,305,279,281,303,251,475,398,464,451,530,587,585,529,570,579,583,264,319,479,534,538,538,538,538,538,538;

string Stnd           = "stnd";
string RunFront       = "1run";
string WalkFront      = "2walk";
string UpSnipFire     = "1shot";
string DownSnipFire   = "2shot";
string GunFire        = "6shot";
string DuckWalk       = "1walk";

string RunRight      = "2run";
string RunLeft       = "3run";


string FrontHit  = "Fhit";
string LeftHit   = "Lhit";
string RightHit  = "Rhit";
string DownHit   = "down";

string BodyUpStand    = "4stand";
string BodyUpUp       = "4up";
string BodyUpShot     = "4shot";

string HandUpStand    = "5stand";
string HandUpUp       = "5up";
string HandUpShot     = "5shot";

string RightStand    = "8stand";
string RightUp       = "8up";
string RightShot     = "8shot";

string LeftStand    = "9stand";
string LeftUp       = "9up";
string LeftShot     = "9shot";

string UseIt         = "bush";

string SwatWalkFront = "3walk";
string SwatWalkLeft  = "4walk";
string SwatWalkRight = "5walk";
string SwatFire      = "Fire";
string KasaShot      = "4shot";


//----------------------------------------------------------------

string HeadDie            = "head";
string LegDie             = "leg";
	             
string SideDie            = "side";
string FlyWallDie         = "1wal";
string WallDie            = "2wal";
string BackDie            = "back";
string FrontDie           = "frnt";
string SurHandUp          = "rise";
string SurDown            = "DnSr";
string SurRun             = "1RnSr";
string SurWalk            = "1WkSr";
string SurHandBehind      = "BHand";
string SurRunHandBehind   = "2RnSr";
string SurWalkHandBehind  = "2WkSr";
string SurBrith           = "Bsur";
string SurDie             = "Dsur";

string Lcolt       , <LColt.MDL>;
string Lak47       , <LKlashikov.MDL>;
string Lm16        , <LM16.MDL>;
string Lm4         , <LM_4.MDL>;
string Lpumaction  , <LBump.MDL>;
string Ls99sniper  , <LSniper.MDL>;
string Llmg        , <LBks.MDL>;
string Lgurnade    , <LBomp.MDL>;
string Lgasgurnade , <LGraned_Gas.MDL>;
string Luzi        , <LUzi.MDL>;
string Lrbj        , <LRbj.MDL>;
string Lgalili     , <LGalili.MDL>;
string LDoubleuzi  , <LUzi.MDL>;

string GrenadeThrower,"                              ";

// leader && solders
var ThemLeader[20];
var LeaderCount;


// Models Collision Dimenations

// Cars Own Properties
var CarsWieght [ carsnum], 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100;
var CarsShokeForce [ carsnum], 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1;
var CarsShokeMaxAngle [ carsnum], 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10;
var CarsEngineForce [ carsnum], 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10;
var CarsGearSpeed [ carsnum], 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10;

// left wheel vertex of the car
var_nsave VertexMLwheele [ carsnum], 245, 245, 253, 2 , 260, 260, 267, 186, 2   , 328, 474, 373, 3 , 6 , 324, 350, 10, 147;
var_nsave VertexFLwheele [ carsnum], 252, 246, 260, 8 , 262, 267, 268, 185, 277 , 329, 475, 374, 1 , 5 , 325, 351, 11, 148;
var_nsave VertexSLwheele [ carsnum], 253, 247, 262, 11, 263, 271, 269, 184, 278 , 330, 476, 375, 2 , 4 , 326, 352, 12, 149;
			                                                                                            	
// right wheel vertex of the                                                                                        	
var_nsave VertexMRwheele [ carsnum], 242, 248, 255, 3 , 259, 262, 270, 189, 4   , 331, 477, 376, 6 , 3 , 327, 2  , 13, 132;
var_nsave VertexFRwheele [ carsnum], 244, 249, 259, 7 , 262, 268, 271, 188, 276 , 332, 478, 377, 5 , 1 , 329, 3  , 14, 133;
var_nsave VertexSRwheele [ carsnum], 243, 250, 261, 12, 264, 266, 272, 187, 279 , 333, 479, 378, 4 , 2 , 328, 349, 15, 134;
			                                                                                                
// left back wheel vertex of                                                                                            
var_nsave VertexMLBwheele[ carsnum], 248, 239, 254, 1 , 257, 261, 261, 183, 1   , 326, 468, 1  , 12, 12, 304, 352, 4 , 141;	    
var_nsave VertexFLBwheele[ carsnum], 249, 240, 258, 6 , 266, 265, 262, 182, 274 , 325, 471, 368, 10, 11, 320, 354, 5 , 142;	    
var_nsave VertexSLBwheele[ carsnum], 250, 241, 263, 9 , 267, 270, 263, 181, 273 , 327, 472, 369, 11, 10, 319, 355, 6 , 143;	    
			                                                                                            	    
// right back wheel vertex of                                                                                       	    
var_nsave VertexMRBwheele[ carsnum], 247, 242, 256, 4 , 258, 263, 264, 180, 3   , 334, 469, 370, 9 , 9 , 321, 5  , 1 , 140;	    
var_nsave VertexFRBwheele[ carsnum], 251, 243, 257, 5 , 265, 264, 265, 178, 275 , 335, 470, 372, 8 , 8 , 322, 1  , 2 , 138;
var_nsave VertexSRBwheele[ carsnum], 246, 244, 264, 10, 268, 269, 266, 179, 272 , 336, 473, 371, 7 , 7 , 323, 4  , 3 , 139;

// back light
var_nsave VertexRFlash[ carsnum], 125,  247,  190,  123,  129 ;
var_nsave VertexLFlash[ carsnum], 34,  258,  325,  119,  213 ;

// smoke source
var_nsave VertexMSmoke[ carsnum], 52,  184,  424,  31,  171 ;
var_nsave VertexFSmoke[ carsnum], 37,  194,  238,  15,  117 ;

// trafic lower light pos
var_nsave VertexPosLL[ 3], 122,  123,  124;

// trafic higher light pos
var_nsave VertexPosHL[ 3], 125,  126,  127;

// Ground Collision
var_nsave VertexFGra[ carsnum], 254, 265, 265, 257, 269, 300, 273, 190, 294, 327, 480, 397, 304, 356, 330, 356, 139, 150, 190, 171, 78, 490, 238, 687;
var_nsave VertexBGra[ carsnum], 255, 266, 266, 258, 270, 301, 274, 191, 295, 338, 481, 380, 305, 357, 331, 357, 140, 151, 191, 172, 79, 491, 239, 688;
var_nsave VertexLGra[ carsnum], 256, 267, 267, 259, 271, 302, 275, 192, 296, 339, 482, 381, 306, 358, 332, 358, 141, 152, 192, 173, 80, 492, 240, 689;
var_nsave VertexRGra[ carsnum], 257, 268, 268, 260, 272, 303, 276, 193, 297, 340, 483, 382, 307, 359, 333, 359, 142, 153, 193, 174, 81, 493, 241, 690;

// weapon variabls
var temp2;
var force;
var indicator;
var headwave;
action*	carry;


entity* weapontmpsyn;
entity* CollisionEntity;

var gun_muzzle[3];
var gun_source[4];
var gun_target[3];
var gun_loaded = 1;

var weapon_number = 0;
var ammo_number = 0;

var damage = 0;

var weapon_firing = 0;
var grnade_firing = 0;
var Kick_state = 0;
var Kick_Action = 1;
var Maine_state = 0;
var Maine_Action = 1;
var Jump_State = 0;


 /* used to set sprite weapon mode */
var_nsave SpriteWeapon = 0;

string empty_bullte <bullet.mdl>;
var weapon_reloading = 0;
var weapon_number ;
var weapon_firing;

var ownedweapon[weaponscount] = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 	/* set to 1 if the player owns that weapon */
var PWeapons[weaponscount];
var_nsave PAllWeapons[weaponscount];

//action* PFWeapons1;
//action* PFWeapons2;
//action* PFWeapons3;
//action* PFWeapons4;

var_nsave WeaponK1[WeaponK1N] = colt, SThrower;
var_nsave WeaponK2[WeaponK2N] = ak47, m16, m4, uzi, galili, stake;
var_nsave WeaponK3[WeaponK3N] = pumaction, s99sniper, lmg, rbj, Doubleuzi;
var_nsave WeaponK4[WeaponK4N] = gurnade, gasgurnade;

var WeaponLastUsed[4] = -1,-1,-1,-1;

var_nsave WeaponSZoomAble[3] = m4, s99sniper, rbj;
var_nsave WeaponSZoomVal[3] = 30, 15, 20;

entity* LMGBulletes;

var_nsave Weap_offs[3] = 5 , -3.7, -59;

//					  1	,2	,3	,4	,5	,6	,7	,8	,9	,10	,11	,12	,13	,14	,15	,16	,17	,18	,19	,20;	

var bulletnum[weaponscount]		= 0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0;		//bulletnum
var maxbulletnum[weaponscount]		= 9	,30	,30	,30	,5	,25	,400	,1	,1	,1	,33	,1	,35	,33	,1	,1	,1	,1	,1	,1;		//maxbulletnum
var totalbullets[weaponscount]		= 18	,120	,30	,30	,0	,0	,0	,2	,0	,0	,33	,3	,0	,0	,0	,0	,0	,0	,0	,0;		//totalbullets
var maxnumcancarry[weaponscount]	= 36	,120	,120	,120	,30	,50	,400	,6	,4	,6	,165	,6	,140	,165	,6	,6	,6	,6	,6	,6;		//maxnumcancarry
var Weap_Force[weaponscount]		= 5	,2	,1	,1	,3	,5	,1.5	,0	,0	,2	,0	,1	,2	,0.5	,2	,2	,2	,2	,2	,2;		//Weap_Force
var Weap_fire_time[weaponscount]	= 5	,2	,2	,2	,0	,0	,2	,0	,0	,40	,1	,0	,2	,1	,1	,1	,1	,1	,1	,1;		//Weap_fire_time
var Weap_Weight[weaponscount]		= 1	,1.5	,1.5	,1.5	,1.5	,1.5	,3.5	,1.5	,1.5	,2	,1.5	,3.5	,1.5	,2.5	,2	,2	,2	,2	,2	,2;		//Weap_Weight
var Weap_damage[weaponscount]		= 25	,45	,40	,40	,75	,191	,200	,100	,100	,80	,30	,1000	,40	,60	,80	,80	,80	,80	,80	,80;		//Weap_damage
var Weap_ammo_type[weaponscount]	= 1.09	,2.30	,3.30	,4.30	,5.05	,6.25	,7.9	,8.24	,9.04	,10.01	,11.33	,12.01	,13.35	,14.33	,15.01	,16.01	,17.01	,18.01	,19.01	,20.01;		//Weap_ammo_type
var Weap_bullet_speed[weaponscount]	= 10000	,10000	,10000	,10000	,10000	,10000	,10000	,10000	,10000	,10000	,10000	,10000	,5000	,10000	,10000	,10000	,10000	,10000	,10000	,10000;		//Weap_bullet_sp
var_nsave LonlyWeapons[weaponscount];																			


/* used in reload fumction */
//                        1   ,   2   ,  3    ,  4    ,  5  ,  6    ,  7 , 8 , 9 , 10, 11 ,12 , 13 , 14

var LastSettingsValue[4] = 0, 0, 0, 0;



// vertex collision

var_nsave VLeftArm[2], 1, 2;
var_nsave VLeftHand[2], 3, 4;

var_nsave VRightArm[2], 7, 8;
var_nsave VRightHand[2], 5, 6;

var_nsave VChest[2], 9, 10;

var_nsave VLeftLeg[2], 11, 12;
var_nsave VLeftLArm[2], 13, 14;

var_nsave VRightLeg[2], 17, 18;
var_nsave VRightlArm[2], 15, 16;

var_nsave VHead[2], 19, 20;

//  for the gear		
var maxspeed = 20;

//  current camera order
var camorder=1;
//  current car speed
var	carspeed ;
//  current car gear
var	carsgear ;
// message string
string MsgEmpStr,"                                                            ";

// walk frame name for wheel
string wWalk,"Frame";

// Libray name to load on load
string DllName,<plug.dll>;
string DllName1,<plug1.dll>;
string SkyBox,<SKYCUBE.X>;
string SkyTexture,<Sky.bmp>;
string PlayerModel,<Ahmad.012>;

string WheelName, "                  ";

///        hit strings

string RightHit, "Rhit";
string LeftHit, "Lhit";
string DownHit, "Down";


string SongName, <all06.mp3>;
string FontName, <Font.AFt>;
string TextName, <lev6.AMg>;
string InKFile, <InKeys.kys>;

////      die strings

string LegDie, "leg";
string SideDie, "side";

var Gears[GearsNum], 2, 4, 6, 8, 10;

entity*	cameraentity;

action*	cameraction;
action*	LCamerAction;

action*	guifunction;
action*	lastEscFuc;
action*	lastEnterFuc;
action*	LlastEscFuc;
action*	LlastEnterFuc;
string*	PTempstr;

//to see the current car
var Currentcar;
var CurrentOrder;
var carrolle;

entity CPointer
{
type = <Cursor.MDL>;
view = camera;
//flags = flare;
scale_x = 0.011;
scale_y = 0.011;
scale_z = 0.011;
layer = -3;
x = 20;
y = 0;
z = 0;
ambient = 100;
}

entity PlayerBood
{
	type = <BlowBlood.tga>;
	view = camera;
	scale_x = 0.2;
	scale_y = 0.2;
	x = 2;
	y = 0;
	z = 0;
	ambient = 100;
}

entity* CurntCar;
entity* TempEnt;

var CamraPan;
var Camra2Player=1;
var FH;
var forces;
var AbdForce;
var Lngth;
var carpan ;
var youpan ;
var frictpan ;
var_nsave CurrentSong;

var FirstPoint;
var SecondPoint;
var TDistance;
var CollisionPostion;
var CollisionDimension;
var CollisionAngle;
var CollisionOffset;
var CollisionDetection;
var CollisionParts;
var_nsave MousPeed = 2;
var LoopRun = 0;
var CurrentAmmo = 0;
var SnipersCount = 0;
var SolderCounter = 0;
var SolderDCounter = 0;
var SoulderHI[2],0,1;
var CameraHi[2],25,0;

var_nsave bloodenable = 1;
var_nsave shadowenable = 1;
entity* entiy;

// Input function keys
var modelindex;

var PressedKeys[30]=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;

var CollisionIndexs[10]=0,1,2,3,4,5,0,0,0,0;

var ScanValues[15]=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;

var PointParameters[8];
var BoneParam[9];
var GroupValue[3] = 100, 2,0;
var level = 100;

var p2[3];

entity point_move
{
	type = <point1.mdl>;
}

var_nsave  AllAnimations[30];
var_nsave  LonelyAnimat[16];
var  GrenadeThrow[4],0,0,0,0;
var  PlayerWalkSound;

string WeaponBone, "Klasinkov ";
string StoreBone,  "KlasinkovO";
string AnergaBone,  "body zanarga";
string Weapon2Bone,  "uzi01";
string Store2Bone,  "uziO01";

string AllBody,"all";
string LegsBody,"legs";
string HeadBody,"head";
string HandsBody,"hands";
string ChestBody,"chest";
string chestlegs,"chestlegs";
string chestlegshead,"chestlegshead";
string chestheadhands,"chestheadhands";
string ak47Body,"ak47";
string BksBody,"Bks";
string coltBody,"colt";
string grenadeBody,"grenade";
string nigaifaBody,"nigaifa";
string STICKBody,"STICK";
string RBJBody,"RBJ";
string uziBody,"uzi";
string uzix2Body,"uzix2";
string bompactionBody,"bompaction";

var_nsave BodyParts[18];
var_nsave LevelNumberId;
var PlaCru = 0;
var_nsave JustLoaded = 0;
var_nsave SaveFuncHa = 0;
var eplhealth = 0;
var_nsave lastsaveid=0;
action* MouseWheelDN;
action* MouseWheelUP;

var	MousePos[7];
var_nsave Customkeys[30];
var ofses[3] = 0,1,0;

var MessageViwer = 0;

var SolderCreationCounter[7]=0,0,0,0,0,0,0; 
var OpjectDetectedCounter[4]=0,0,0,0;
var Game_State[6]=0,0,0,0,0,0;	
string levelpath = "ppoints.pts";
var GameState=0;    
var game_time = 0;
var objectposition;
var objectposition1;
var bullettarget;
var malalehcount=0;
var malalehpoint[4]=0,0,0,0;

var_nsave GunFlashFront[23] =	177 ,215 ,14 ,41 ,62 ,4  ,172 ,154 ,145 ,155 ,135 ,14 ,35 ,41 ,24 ,62 ,4  ,24 ,62 ,35 ,62 ,41 ,4;		
var_nsave GunFlashBack[23] =	166 ,214 ,21 ,23 ,42 ,100,148 ,173 ,152 ,144 ,148 ,21 ,48 ,99 ,179,42 ,82 ,19 ,42 ,42 ,42 ,23 ,94;

var_nsave GunSpriteFlashX[11] =	97, 51, 75, 60, 65, 57, 85, 15, 50, 75, 96;
var_nsave GunSpriteFlashY[11] =	88, 76, 85, 85, 80, 75, 93, 60, 79, 90, 60;


var SoldersPosx[5] =  1785	,-140	,-693	,-77	,711;
var SoldersPosy[5] = -670	,-1576	,1735	,2330	,2413;
var SoldersPosz[5] =  40	,40	,60	,60	60;

define IWeaponBone  , 0;
define IStoreBone   ,  1;
define IAnergaBone  ,  2;
define IWeapon2Bone ,  3;
define IStore2Bone  ,  4;
var_nsave WeaponsBones[10];

var_nsave	ArmDimension[3]=6, 2, 2;
var_nsave	HandDimension[3]=6, 4, 4;
var_nsave	CheastDimension[3]=10, 10, 5;
var_nsave	LegDimension[3]= 10, 4, 2;
var_nsave	FootDimension[3]= 10, 3, 3;
var_nsave	HeadDimension[3]= 4, 4, 3;
var Stemp;

var DedSolders=0;
var h_PlDed = 0;
var h_VictoryPlayer = 0;
var SplashCounter=0;
string HintPage1,<Lev6HintA.bmp>;
string EnterButum,<pressmsg.tga>;

entity* entiy;
var FollowingP;
var Marem_State=0;
var Mareim_Point;
var H_counter =0;
var BoompingWall = 0;
var RunerState=0;
var RunerPoint=0;
var RunerExist=0;
var RunerPos;
var GroupExist=0;
var SRunerType;
var PlaneNum=0;
var PlanePos;
var Mareinspos;
var EndExplosion;
var ssSmoke;
var GazPazokanum = 0;
var_nsave soundvolume = 100;
var_nsave musicvolume = 50;

//
//var test_num1 = 0;
//var test_num2 = 0;
//var test_num3 = 0;
//var test_num4 = 0;
//var test_num5 = 0;
//var test_num6 = 0;
//panel Ammo_panel
//{
//	digits = 50,0,4,ofont,1,test_num1;
//	digits = 40,0,10,ofont,1,test_num2;
//	digits = 40,0,15,ofont,1,test_num3;
//	digits = 50,0,20,ofont,1,test_num4;
//	digits = 40,0,25,ofont,1,test_num5;
//	digits = 40,0,30,ofont,1,test_num6;
//	flags = refresh,d3d,visible,overlay;
//}
/////////////////////////////////////////
