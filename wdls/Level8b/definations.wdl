define IStnd           = 0;
define IRunFront       = 1;
define IWalkFront      = 2;
define IUpSnipFire     = 3;
define IDownSnipFire   = 4;
define IGunFire        = 5;
define IDuckWalk       = 6;
define IRunRight       = 7;
define IRunLeft        = 8;
define IFrontHit       = 9;
define ILeftHit        = 10;
define IRightHit       = 11;
define IDownHit        = 12;
define IBodyUpStand    = 13;
define IBodyUpUp       = 14;
define IBodyUpShot     = 15;
define IHandUpStand    = 16;
define IHandUpUp       = 17;
define IHandUpShot     = 18;
define IRightStand     = 19;
define IRightUp        = 20;
define IRightShot      = 21;
define ILeftStand      = 22;
define ILeftUp         = 23;
define ILeftShot       = 24;
define IUseIt          = 25;
define ISwatWalkFront  = 26;
define ISwatWalkLeft   = 27;
define ISwatWalkRight  = 28;
define ISwatFire       = 29;

define IHeadDie            = 0;
define ILegDie             = 1;
define ISideDie            = 2;
define IFlyWallDie         = 3;
define IWallDie            = 4;
define IBackDie            = 5;
define IFrontDie           = 6;
define ISurHandUp          = 7;
define ISurDown            = 8;
define ISurRun             = 9;
define ISurWalk            = 10;
define ISurHandBehind      = 11;
define ISurRunHandBehind   = 12;
define ISurWalkHandBehind  = 13;
define ISurBrith           = 14;
define ISurDie             = 15;




// inpu define the action

define Key_HideWeapon,1;
define Key_Weapon1   ,2;
define Key_Weapon2   ,3;
define Key_Weapon3   ,4;
define Key_Weapon4   ,5;
define Key_NxWeapon  ,6;
define Key_PrvWeapon ,7;

define Key_Zoom      ,8;
define Key_SlowFS    ,9;
define Key_SAttack   ,10;
define Key_Camera    ,11;

define Key_Map    ,12;

define Key_MoveFor1  ,13;
define Key_BackWard  ,14;

define Key_StrafLeft ,15;
define Key_StrafRight,16;

define Key_LookUp    ,17;
define Key_LookDown  ,18;

define Key_TurnLeft  ,19;
define Key_TurnRight ,20;

define Key_SlowMove  ,21;

define Key_PAttack   ,22;
define Key_Reload    ,23;

define Key_Jump      ,24;
define Key_Crouch    ,25;

define Key_Use       ,26;



define Key_MainAmmo    ,27;
define Key_SecoAmmo    ,28;
define Key_DrWeapon    ,29;

// Our font
font Ofont,<font.tga>,12,18;



// defination public
define Wieght, skill2;
define Force, skill15;
define EPassable, skill45;
define CarId, skill10;
define OwnLife, skill9;
define GravityWork, skill33;

define VertexCount, skill34;

// defination doors
define ActiveOpen, skill4;

// defination player

define BoneName		,skill33;

define WeaponMesh1	,skill10;
define WeaponMesh2	,skill11;
define WeaponStore1	,skill12;
define WeaponStore2	,skill13;
define WeaponAnerga	,skill14;


define ChestLnk, skill23;
define HeadLnk, skill24;
define HandsLnk, skill25;
define BodyLnk, skill27;
define FrameAnim, skill28;
define StepNow, skill32;
define MyTilt, skill30;
define PrcntSmoothAnim, skill16;

define HeadPan, skill1;
define HeadTilt, skill2;
define HeadFunction, skill3;
define HeadWait, skill4;

// defination compars
define IWanaFly, skill20;

// defination Solders

define Alarm, flag1;

define Grenader, flag1;
define PatrolAfter, flag2;
define Hunt, flag3;
define Hide, flag4;
define Flashing, flag6;


define ScaleCollision,skill1;
define DieEvent,skill3;
define HitEvent,skill4;
define CollFunction,skill5;

define _enem_count,skill6;
define EnemyHeight,skill7;
define defaultstate,skill7;
define _door_id,skill8;
define _health,skill9;
define _spot_hight,skill10;
define _leg_id,skill11;

define _fieringe_hid,skill16;

define _target_x,skill17;
define _target_y,skill18;
define _target_z,skill19;

//define _player_id,skill20;
define _move_count_flage,skill20;

define AnimWalk      , skill20;
define AnimRun       , skill12;
define AnimShot      , skill13;
define AnimDie       , skill14;
define PathId        , skill16;

define _signal   ,skill21;
define _state    ,skill22;
define GotHit    ,skill23;
define LastState ,skill24;
define EnemyHide ,skill15;

define HiddenPoint, skill25;
define LeaderIndex, skill26;
define LeaderPan  , skill27;

define Shotting, skill29;
define WeaponNumber, skill31;

define Find_HidePoint, skill32;


define _kind_id,skill35;		// our coldier skill for AI (main)

define EnemyId, skill36;	// our coldier skill for AI (main)
define LeaderId,skill37;	// our coldier skill for AI (main)
define SoundWR,skill38;	// our coldier skill for AI (main)

define _type,skill39;

define _move_counter , skill40;		// our coldier skill for AI (main)
define _shot_counter , skill40;		// our coldier skill for AI (main)
define Enemy_Count , skill41;	// our coldier skill for AI (main)	

define _old_position_x,skill42;		// our coldier skill for AI (main)
define _old_position_y,skill43;		// our coldier skill for AI (main)
define _old_position_z,skill44;		// our coldier skill for AI (main)

define _colision_id,skill46;		// our coldier skill for AI (main)
define _move_flage,skill47;		// our coldier skill for AI (main)
define _find_point_flag,skill48;	// our coldier skill for AI (main)	

define Enemy_X, skill17;		// our coldier skill for AI (leg)
define Enemy_Y, skill18;		// our coldier skill for AI (leg)
define Enemy_Z, skill19;		// our coldier skill for AI (leg)

define _legs_pan,skill36;		// our coldier skill for AI (leg)

// Scan Array 

define scan_x, 0;
define scan_y, 1;
define scan_z, 2;

define scan_SPan, 3;
define scan_EPan, 4;

define scan_Range, 5;
define scan_Distance, 6;

define scan_target_x, 7;
define scan_target_y, 8;
define scan_target_z, 9;

define scan_Scan2Targets, 10;

define scan_target2_x, 11;
define scan_target2_y, 12;
define scan_target2_z, 13;

// point Parametrs definanations

define PointPos, 0;
define PointDirction, 3;
define PointLength, 6;
define PointLeft, 7;

//////////////////////////
define _handle		,1;		// scan via space key
define _explode		,2;	// scan by an explosion
define _gunfire		,3;	// shoot fired by a gun
define _watch		,4;		// looking for an enemy
define _detected	,5;	// detected by an enemy
define _shoot1		,6;		// shoot key pressed (not used yet)
define _hid_point	,7;		// shoot key pressed (not used yet)
define _path_point	,8;		// shoot key pressed (not used yet)
define _test_move	,9;    
define _test_umove	,10;  
define _find_point	,11;  
define _under_fire	,12;	// detected by an enemy
define _detecte_enemy	,13;	// detected by an enemy
define _hear_fire	,14;	// detected by an enemy
define _door_handle	,15;		// scan via space key
define _find_point1	,16; 
define _spot_point	,17;  
define _hid		,18;         
define _count		,19;       
define _hear_screem	,20;	// detected by an enemy
define _fireing		,21;     
define _daiing		,22;      
define _granade		,23;		// looking for an enemy
define _hit_wall	,24;	// detected by an enemy
define _see_granade	,25;	// detected by an enemy
define _granade_throw	,26;		// looking for an enemy
define _throw_granade	,27;	// detected by an enemy
define _move		,28;		// looking for an enemy
define _hear_explode	,29;	// detected by an enemy
define _explode_sound	,30;	// scan by an explosion
define _clossing	,31;    
define _back		,32;        
define _in		,33;          
define _gauid		,34;          
define _see_gauid	,35;
define CloseShot	,36;    
define StepSound	,37;
define _checkaround	,38;
define CarAccedant	,40;

// luai l8
define _Open_Door,41;
define _Close_Door,42;
// end

///////////////////////////////
//	compars
define nearplayer, skill29;
/////////////////////////////////
var p[3];

define _type_player,250;
define _type_player1,317;
define _type_soldier,100;
define _type_flag,251;
define _type_compars,150.5;
define _type_player_granade,103;
define _type_soldier_granade,104;
define _type_actor,2;
define _type_foe,3;
define _type_door,10;
define _type_gate,11;
define _type_elevator,12;
define _type_gun,20;
define _type_ammo,21;
define _type_armor,22;
define _type_health,23;
define _type_BloodDot,24;
define _type_glass,13;

define _state_wait,1;
define _state_move,8;
define _state_attack,2;
define _state_escape,3;
define _state_die,4;
define _state_freeze,5;       
define _state_hunt,6;
define _state_un_attack,7;
define _state_path,9;
define _state_granade,10;
define _state_hit,13;
define _state_standby,14;
define _state_Walk,15;
define _state_fallow,16;


// defination for cars
define CarLevel, flag1;
define CarRef, flag2;
define CarBlend, flag3;
define Carwheel, flag4;

define _CarOrder, skill1;
define CarWieght, skill2;
//define CMaxSpeed, skill3; not used and not usefull
define ShocksForce, skill4;
define ShocksMaxAngle, skill5;
define EngineForce, skill6;
define GearSpeed, skill7;
define EngineProg, skill8;
define BreakerForce, skill9;

define CarlastRoll, skill36;
define CurrentRoll, skill10;
define CarCurrentGear, skill11;
define CarRotation, skill12;
define CarCurrentRotPos, skill13;
define CarRoll, skill14;
define CarForce, skill15;

define Cartarget_x, skill16;
define Cartarget_y, skill17;
define Cartarget_z, skill18;

define NearRoll, skill19;
define ShocksForceD, skill20;
define CarBreaker, skill21;
define CarBreakerForce, skill22;

define LeftWheel, skill23;
define RightWheel, skill24;
define LeftBackWheel, skill25;
define RightBackWheel, skill26;

define RightFlash, skill27;
define LeftFlash, skill28;

define RightFlashPos, skill29;
define LeftFlashPos, skill30;
define BrightId, skill31;

define LastGround, skill32;
define MoveTimer, skill34;
define LastMoveForce, skill35;

define AccdentAng, skill43;

define AccdentOrder, skill38;
define OwnType, skill39;
define TraficLight, skill40;

define Life1, skill12;
define Life2, skill13;
define Life3, skill14;
define Life4, skill15;
define Life5, skill16;
define Life6, skill17;
define Life7, skill18;
define Life8, skill19;

define PLife1, skill20;
define PLife2, skill21;
define PLife3, skill22;
define PLife4, skill23;
define PLife5, skill24;
define PLife6, skill25;
define PLife7, skill26;
define PLife8, skill27;

define CarAcedant, skill28;

define CarBPan, skill29;
define CarBTilt, skill30;
define CarBRoll, skill31;
define MyEvent, skill32;

define RollAcedant, skill33;
define TiltAcedant, skill34;

// trafic defination 
define lolight, skill3;
define hilight, skill4;
define targetlight, skill23;

define traficstat, skill5;
define traficwait, skill6;

define SinglePosX, skill20;
define SinglePosY, skill21;
define SinglePosZ, skill22;

define SingleAngX, skill13;
define SingleAngY, skill14;
define SingleAngZ, skill15;

define SingleWidth, skill16;
define SingleHeight, skill17;
define SingleLength, skill18;

// defination for wheels 
define PosVertex, skill10;
define FrontVertex, skill11;
define SideVertex, skill12;

// weapon definations
define weaponscount  20;

define _handle,1;
define _explode,2;
define _gunfire,3;
define _watch,4;
define _detected,5;
define _shoot1,6;
define _GrenadeTest,7;

define __repeat,flag7;

define _weaponnumber,skill1;
define _firemode,skill2;
define _ammotype,skill3;
define _bulletspeed,skill4;
define _firetime,skill5;

define _damage,skill16;
define _fire,skill17;

define _packamount, skill8;
define Zoomable, skill9;

// constants
define CollMode       , 10;
define LeftHandToutch  , 0;
define LeftArmTouch    , 1;
define RightHandTouch  , 2;
define RightArmTouch   , 3;
define ChestTouch      , 4;
define LeftFootTouch   , 5;
define LeftLegTouch    , 6;
define RightFootTouch  , 7;
define RightLegTouch   , 8;
define HeadTouch       , 9;

entity* weapon;

define	kmaxweapons = 7;

define WeaponK1N, 2;
define WeaponK2N, 6;
define WeaponK3N, 5;
define WeaponK4N, 2;

 define colt, 1;
 define ak47, 2;
 define m16, 3;
 define m4, 4;
 define pumaction, 5;
 define s99sniper, 6;
 define lmg, 7;
 define gurnade, 8;
 define gasgurnade, 9;
 define uzi, 11;
 define rbj, 12;
 define galili, 13;
 define Doubleuzi, 14;
 define stake, 15;
 define SThrower, 16;

   
   define ak47_energa ,<anergaak47.mdl>; 
   define ak47_no_energa ,<ak47.mdl>; 

  
  /* this is the zoom panel */
   bmap snipzoom = <muasher.tga>; 

//car numbers for array of vertex of wheels
// car 1 Ambulance car 2 Bus 3 Cetron 4 Dodge 5 Golf 6 Nissan 7 Taxi 8 Van 9 Buard 10 Buard-2 11 Fire Car 12 Fork 13 Hummer 14 Land Rover 15 Mercedess Tank 16 Safari 17 Tank 18 Water Tank 19 Mallal 20 mallala 21 merkava 22 Mbldozer 23 Mdfa 24 Patriot
define carsnum , 24;
define GearsNum , 5;
define TypeOfCars , 1200.1;
define TypeOfEngines , 1300.2;
define TypeOfPCars , 1700.8;
define TypeOfPEngines , 1800.9;
define TypeOfCompars , 1400.3;
define TypeOfTraficSingle , 1500.4;
define TypeOfBullete , 1600.5;

define camnumber = 10;

dllfunction TestTarget(Me,Fnam);
dllfunction LinetoPlane;
dllfunction ModelCollision();
dllfunction ModelShowCollision();
dllfunction RemoveColl(Me);
dllfunction NTrace(Me);
dllfunction AddColl(Me);
//dllfunction InitColl;
dllfunction  TestCollsion(Me);
dllfunction  TestACollsion(Me);
dllfunction  TestBox(Me);
dllfunction  TraficeScan(Me);
dllfunction  MyName(Me, Wheel);
dllfunction  MyExName(Me, Wheel);
dllfunction  MyAcc(Me, Wheel);
dllfunction  MyWheel(Me, Wheel);
dllfunction  MyReflection(Me, Wheel);
dllfunction NearNumber(Num1, Num2, lowvalue);

/////////////////////
	function BackCamera();
	function EyCamera();
	function TPsCamra();
	function FindPaths2Him(myt,pind,paind);
	function SniperFindPath2Him(myt,PMF);
	function TraceCollision(TCMe);
	function MallaCollision(TCMe);
	function MoveTurnFallAnim2Target(MSForce,AnimForce);
	function Metal_Parts();
	function ShotAndDamage(RandDist,Line,Hole,Vnum);
	function MalalehDamege(RandDist,Line,Hole,Vnum);
	function finalization();
	function HitGlass(cyou, cdmg);
	//function rain( vel_x, vel_y, vel_z, intensity);	

	dllfunction OpenSong(file_name);
        dllfunction CloseSong(Tson);
        dllfunction CloseAllSongs;
        dllfunction SetVolume(Tson,Nvol);
        dllfunction playSong(Tson);
        dllfunction pause(Tson);
        dllfunction Setbalance(Tson,Nbal);
        dllfunction SetRate(Tson,NRate);
        dllfunction Setpostion(Tson,Npos);
        dllfunction getpostion(Tson);
        dllfunction getSONGNAME(Tson,T);

	dllfunction SetAutoLoop(Tson,Npos);
        dllfunction SetMcute(Tson,npos);
        dllfunction SetNStart(Tson,Npos);
        dllfunction SetNEnd(Tson,Npos);

        dllfunction GetV(Tson);

        dllfunction EDistance(value,Value2);
        dllfunction NScan(value);

	 dllfunction En_Pass(ID,Val);
	 dllfunction En_UPass(ID,Val);

         dllfunction Add_Ent(value);
         dllfunction delete_Ent(value);
	 dllfunction E_Pass(ID,Val);
	 dllfunction E_UPass(ID,Val);
	 dllfunction Alert(val,dis,Fun);

         dllfunction Free_Point(value);
         dllfunction Add_Point(value);
         //dllfunction Destr_Point;
         dllfunction Get_Next_Point(value);

         dllfunction MyString(NewStringd, Me);
         dllfunction GetMyString(dMe);
         dllfunction GetDieString(NewString, dMe);

	 dllfunction NShowMessage(FILENAME);
	 dllfunction AddPath(FILENAME);
	 dllfunction Save_Points(FILENAME);
	 dllfunction Load_Points(FILENAME);
	 dllfunction CreateRandomModels();
	 dllfunction File_exist(FILENAME);
	 dllfunction SaveMorphScrn(num);
	 dllfunction CVMorph(ent,fname,num);
	 dllfunction SaveSizeScrn(fname,num);
	 dllfunction FDate2Ent(ent,fname,num);
	 dllfunction Draw2Objct(fname,num);
	 dllfunction LDeleteV(ent,FILENAME,num);

	 dllfunction CreateFnt(FNam);
         dllfunction CreateAtxt(FNam);
         dllfunction WriteAtxt(ent);
	 dllfunction WriteALine(ent, id);

	 dllfunction NHScan(value);
         dllfunction Add_HPoint(value);
         dllfunction Free_HPoint(value);
	 dllfunction Get_NextH_Point(value);
	 dllfunction DrawPointsWLnk;
	 dllfunction ScanMyHPoint(value);

         dllfunction Add_PathPoint;
         dllfunction DrawPointsPathLnk;
         dllfunction CalcVisPoint;
         dllfunction GetNextPathPoint(ent);
         dllfunction FindTargetPath(PointInd,PathIndex);
         dllfunction Load_PathPoints(FILENAME);
         dllfunction Save_PathPoints(FILENAME);
	 dllfunction AddSmallEntity(ent, ent1);
	 dllfunction SubSmallEntity(ent, ent2);


	 dllfunction GetPosFromLeader(ent, ent2);
	 dllfunction leaderdie(ent);
         dllfunction Load3dMdel(ent);
         dllfunction AddShareEntity(id,ent);
         dllfunction GetMeshVertex(id,ent);
         dllfunction AnimModel(id,fric);
         dllfunction SetActivePart(id,Pname,acte);
         dllfunction SetActiveSeq(id,Pname,Sname);
         dllfunction GetBoneParam(id,Pname);
         dllfunction SetBoneParam(id,Pname);
         dllfunction ALocatePoint;
         dllfunction UnLocatePoint;
         dllfunction DllInit(LevelOrder);
	 dllfunction  SetActiveBlendSeq( Modul, PartName, SeqName, SeqName2);
         dllfunction  SetBlendSeqPrcnt( Modul, PartName, Value);
	 dllfunction  AnimModelPart( Modul, VInd, PartName);
	 dllfunction  GetBonePosParam(Ent,Modul,BoneName);
         dllfunction  ArcPrcnt(fric);
         dllfunction  CheckBox1Click;
	 dllfunction SaveLevel(LevelId);
	 dllfunction LoadLevel(LevelId,State);
         dllfunction  InputRefresh;
         dllfunction  saveCollPoints;
         dllfunction  SavelevelEntity;
         dllfunction  LoadlevelEntity;
         dllfunction DrawPointsTar;
	 dllfunction Psfle(value);
	 dllfunction PrntScreen;
	 dllfunction WriteFrame(value);
	 dllfunction  LoadAllEntityes; 
	 dllfunction  ResetSetGui;

	 dllfunction  Entity_To_Pointer(pEntity);
         dllfunction  Pointer_To_Entity(Id);
         dllfunction  Function_To_Pointer(FuncName);
         dllfunction  Pointer_To_Function(FuncID, Param1, param2, param3);

	 dllfunction VictoryScream;
         dllfunction LoadWaitLevel;

	 var_nsave cubes;
	 var testwert = 777;
	 var wireframe = 0;
	 dllfunction InitSky(void_var);
	 dllfunction ExitSky(void_var);
	 dllfunction SkyRender(void_var);
	 render_sky = SkyRender;

