define _CarType       , skill1;
define _CarNumber     , skill3;
define _LightEffect   , skill4;
define _Axceleration  , skill7;
define _ImmediateShiftDegree , skill6;
define _MaxSpeed      , skill8;
define _break         , skill16; 
define _PointNumber   , skill30;
define _UseSmothPan   , skill20;
define _SmothingDegre , skill21;
define _Dest2Move2SecPoint , skill22;
define _PathOffset , skill23;

define _FrontRightLight , skill10;
define _FrontLeftLight	, skill11;
define _BackRightLight  , skill12;
define _BackLeftLight   , skill13;

define _FrontRightWheel , skill31;
define _FrontLeftWheel  , skill32;
define _BackRightWheel  , skill33;
define _BackLeftWheel   , skill34;
define _BackRightWheel2 , skill35;
define _BackLeftWheel2  , skill36;

define _FrontRightWheel_Vertex , skill24;
define _FrontLeftWheel_Vertex  , skill25;
define _BackRightWheel_Vertex  , skill26;
define _BackLeftWheel_Vertex   , skill27;
define _BackRightWheel2_Vertex , skill37;
define _BackLeftWheel2_Vertex  , skill38;

define _MyTailTrak ,skill14;

define _MySoldier , skill37;
define _SirenModle , skill37; 
define _MyRBGSoldier , skill38;

define _EnginSound , skill40;
define _SirenHornSound , skill41;

define _BraksPedal  , flag1;
define _GasPedal    , flag2;
define _ShiftMe     , flag3;
define _RollExpoled , flag4;
define _StopCar	    , flag5;
define _SlowDownToMax , flag6;

//@ Car ID 
define __Hummer    = 1;
define __Ceterween = 2;
define __Dodg      = 3;
define __Golf      = 4;
define __Nissan    = 5;
define __Van       = 7;
define __LandRover = 8;
define __Trak1     = 9;
define __WaterTank = 10;
define __Trak2     = 11;
define __BaradTank = 12;
define __FireBregate = 13;
define __Ambulance = 14;
define __Bus       = 15;
define __Taxi = 16;

//@ Cars Models
string Hummer      , <HummerNW.mdl>;
string LandRover   , <LandRoverNW.mdl>;
string Ceterween   , <Cetroen.mdl>;
string Dodg        , <Doge.mdl>;
string Golf        , <Golf.mdl>;
string Nissan      , <nissan.mdl>;
string Van         , <Van.mdl>;
string FireBregate , <FireCar.mdl>;
string Ambulance   , <ambulance.mdl>;
string BaradTank   , <BaradTank.mdl>;
string Bus         , <bus.mdl>;
string Taxi , <Taxi.mdl>;

//@ Exploded Mode Of the car
string HumerEx     , <exhummer.mdl>;
string SeterEx     , <excetroen.mdl>; 
string DodEx       , <exdoge.mdl>;
string GolfEx      , <exgolf.mdl>;
string NisanEx     , <exnissan.mdl>; 
string VanEx       , <exvan.mdl>;
string LandRoverEx , <exlandrover.mdl>;
string Burad1Ex    , <exburad.mdl>;
string WaterTankEx , <exwaterTank.mdl>;
string BaradTankEx , <exBaradtank.mdl>;
string Burad2Ex    , <exburad2.mdl>;
string FireBregateEx , <exFireCar.mdl>;
string AmbulanceEx , <exambulance.mdl>;
string BusEx       , <exbus.mdl>;
string TaxiEx , <extaxi.mdl>;

//@ Car Wheel
string WheelCetr      , <WheelCetr.mdl>;
string WheelDodg      , <WheelDodg.mdl>;
string WheelGolf      , <WheelGolf.mdl>;
string Wheelnissan    , <Wheelnissan.mdl>;
string WheelVan       , <WheelVan.mdl>;
string WheelHUm       , <WheelHUm.mdl>;
string Trak1Wheel     , <WheelBurad1.mdl>;
string WaterTankWheel , <wheelWTank.mdl>;
string BaradTankWheel , <Wheeltank.mdl>;
string Burad2Wheel    , <WheelBurad2.mdl>;
string FireBregateWheel , <WheelFire.mdl>;
string AmbulanceWheel , <WheelAmB.mdl>;
string LandRoverWheel , <WheelLan.mdl>;
string BusWheel	      ,	<WheelBus.mdl>;
string TaxiWheel , <Wheeltaxi.mdl>;

//@ Wheels vertics
define __Hummer_FrontRightWheel = 6;
define __Hummer_FrontLeftWheel  = 3;
define __Hummer_BackRightWheel  = 9;
define __Hummer_BackLeftWheel   = 12;

define __Ceterween_FrontRightWheel = 256;
define __Ceterween_FrontLeftWheel  = 254;
define __Ceterween_BackRightWheel  = 255;
define __Ceterween_BackLeftWheel   = 253;

define __Dodg_FrontRightWheel = 3;
define __Dodg_FrontLeftWheel  = 2;
define __Dodg_BackRightWheel  = 4;
define __Dodg_BackLeftWheel   = 1;

define __Golf_FrontRightWheel = 258;
define __Golf_FrontLeftWheel  = 257;
define __Golf_BackRightWheel  = 259;
define __Golf_BackLeftWheel   = 260;

define __Nissan_FrontRightWheel = 262;
define __Nissan_FrontLeftWheel  = 260;
define __Nissan_BackRightWheel  = 263;
define __Nissan_BackLeftWheel   = 261;

define __Van_FrontRightWheel = 180;
define __Van_FrontLeftWheel  = 183;
define __Van_BackRightWheel  = 189;
define __Van_BackLeftWheel   = 186;

define __LandRover_FrontRightWheel = 3;
define __LandRover_FrontLeftWheel  = 6;
define __LandRover_BackRightWheel  = 9;
define __LandRover_BackLeftWheel   = 12;

define __Trak1_FrontRightWheel = 4;
define __Trak1_FrontLeftWheel  = 2;
define __Trak1_BackRightWheel  = 3;
define __Trak1_BackLeftWheel   = 1;

define __WaterTank_FrontRightWheel = 132;
define __WaterTank_FrontLeftWheel  = 147;
define __WaterTank_BackRightWheel1 = 135;
define __WaterTank_BackRightWheel2 = 140;
define __WaterTank_BackLeftWheel1  = 144;
define __WaterTank_BackLeftWheel2  = 141;

define __Trak2_FrontRightWheel = 331;
define __Trak2_FrontLeftWheel  = 328;
define __Trak2_BackRightWheel  = 334;
define __Trak2_BackLeftWheel   = 326;

define __BaradTank_FrontRightWheel = 13;
define __BaradTank_FrontLeftWheel  = 10;
define __BaradTank_BackRightWheel1 = 16;
define __BaradTank_BackLeftWheel1  = 7;
define __BaradTank_BackRightWheel2 = 1;
define __BaradTank_BackLeftWheel2  = 4;

define __FireBregate_FreontRightWheel = 477;
define __FireBregate_FreontLeftWheel  = 474;
define __FireBregate_BackRightWheel   = 469;
define __FireBregate_BackLeftWheel    = 468;

define __Ambulance_FrontRightWheel = 242;
define __Ambulance_FrontLeftWheel  = 245;
define __Ambulance_BackRightWheel  = 247;
define __Ambulance_BackLeftWheel   = 248;

define __Bus_FrontRightWheel = 248;
define __Bus_FrontLeftWheel  = 245;
define __Bus_BackRightWheel  = 242;
define __Bus_BackLeftWheel   = 239;

define __Taxi_FrontRightWheel = 270;
define __Taxi_FrontLeftWheel  = 267;
define __Taxi_BackRightWheel  = 264;
define __Taxi_BackLeftWheel   = 261;


//@ Light Mdls

string ComonLight , <nlight.mdl>;

//@ Light Vertixes
define __LandRover_FrontRightLight = 360;
define __LandRover_FrontLeftLight  = 361;

define __Track2_FrontRightLight = 341;
define __Track2_FrontLeftLight  = 342;

define __Dodg_FrontRightLight = 261;
define __Dodg_FrontLeftLight  = 262;

define __Van_FrontRightLight = 194;
define __Van_FrontLeftLight  = 195;

define __Golf_FrontRightLight = 273;
define __Golf_FrontLeftLight  = 274;

define __Hummer_FrontRightLight = 5;
define __Hummer_FrontLeftLight  = 1;

define __Nissan_FrontRightLight = 305;
define __Nissan_FrontLeftLight  = 304;

define __Taxi_FrontRightLight = 278;
define __Taxi_FrontLeftLight  = 277;

define __Bus_FrontRightLight = 270;
define __Bus_FrontLeftLight  = 269;

define __Ceterween_FrontRightLight = 270;
define __Ceterween_FrontLeftLight  = 269;

define __FireBergate_FrontRightLight = 484;
define __FireBergate_FrontLeftLight  = 485;

define __Track1_FrontRightLight = 299;
define __Track1_FrontLeftLight  = 298;

//@ size of light effect
define __LandRover_LightEffectSize = 1.7;
define __Hummer_LightEffectSize = 2;
define __Ceterween_LightEffectSize = 1.5;
define __Nissan_LightEffectSize = 1.5;
define __Van_LightEffectSize = 1.5;
define __Bus_LightEffectSize = 2.5;
define __FireBregate_LightEffectSize = 2.8;
define __Track1_LightEffectSize = 1.9;
define __Track2_LightEffectSize = 1.9;
define __Golf_LightEffectSize = 1;

//@ dest of light effect
define __LandRover_LightEffectDest = 1000;
define __Hummer_LightEffectDest = 1200;
define __Track1_LightEffectDest = 1000;
define __Track2_LightEffectDest = 1000;
define __Van_LightEffectDest = 1400;
define __Bus_LightEffectDest = 1200;
define __FireBergate_LightEffectDest = 1000;
define __Taxi_LightEffectDest = 1000;
define __Golf_LightEffectDest = 800;
define __Nissan_LightEffectDest = 1000;
define __Ceterween_LightEffectDest = 1100;

//@ Sound Def

sound Skid_1 , <SKID1.wav>;
sound Skid_2 , <SKID2.wav>;
sound Skid_4 , <SKID4.wav>;
sound Skid_5 , <SKID5.wav>;
sound Skid_6 , <SKID6.wav>;

sound Skid_OnSand , <SKID3OnSand.wav>;

sound Horn_1 , <HORN1.wav>;
sound Horn_2 , <HORN2.wav>;
sound Horn_3 , <HORN3.wav>;
sound Horn_4 , <HORN4.wav>;
sound Horn_5 , <HORN5.wav>;
sound Horn_6 , <HORN6.wav>;
sound Horn_Trak_1 , <TrakHorn1.wav>;
sound Horn_Trak_2 , <TrakHorn2.wav>;

define __PoliceSirenVolum = 6000;
sound PoliceSirenLoop , <PoliceSirenLoooooop.wav>;
sound PoliceSiren     , <PoliceSiren.wav>;

define __FireBregateSirenVolum = 5000;
sound FireBregaeSirenLoop , <FireBregateSirenLoop.wav>;
sound FireBregateSiren    , <FireBregateSiren.wav>;

sound BusEngin , <BusLoop.wav>;
sound Trak1Engin , <Trak1Engin.wav>;
sound Trak2Engin ,<Trak2Engin.wav>;

define __HummerEnginStopVolum = 1000;
sound HummerStopEngin , <hammerloop.wav>;
define __HuumerEnginVolum = 800;
sound HummerEngin , <hummerEngin.wav>;

define __LandRoverVolum = 900;
sound LandRoverEngin  ,<LandRover_loop.wav>;

define __ColisionSoundVolum = 100;
sound ColisionSound , <CarHitCar.wav>;
sound ColisionSound2 , <CarHitCar2.wav>;

define __BreakFutureVolum = 3000;
sound BreakFuture , <BreakFuture.wav>;
sound BreakFuture2 , <BreakFuture2.wav>;

define __HazesBreakVolum = 5000;
sound HazesBreak , <HagezBreak.wav>;

define __CharBrakVolum = 3500;
sound CharBrak , <CharBreak.wav>;

define __GardenDoorVolum = 4000;
sound GardenDoor1 , <GardenDoor1.wav>;
sound GardenDoor2 , <GardenDoor2.wav>;

define __LR_SkidVolum = 4000;
define __LR_RollOverVolum = 3000;
sound LR_RollOver , <RollOver.wav>;
sound LR_BreakDown , <BreakDown.wav>;

sound PC_ChangeGeer , <ChangeGeer.wav>;
sound PC_ReversGeer , <ReversGeer.wav>;
sound PC_EngenAccelerat_F0 , <Accelerate.wav>;
sound Pc_Accelerate , <AccelerateFast.wav>;
sound PC_MoveBackWard , <MoveBackWard.wav>;
sound PC_LongBreak , <LOOPSKID.wav>;

//@ General def

define __WheelsHight = 30;
define __PlayerCarNum = 374;

define __Forward  = 1;
define __BackWard = 2;
define __Left = 1;
define __Right = 2;

define __ManulaPointTrak = 0;
define __AutoPointTrak = 1; 

define __SixWheels = 1;
define __ForeWheels = 0;
define __FrontWheel = 1;
define __BackWheel = 0;

define __RollAndExplod = 1;
define __StopTurn = 2;

define __RemoveLights = 1;
define __RemoveLightEffect = 1;
define __RemoveWheels = 1;
define __DontRemoveLight = 0;
define __DontRemoveLightEffect = 0;
define __DontRemoveWheels = 0;

var pPlayerCar = 0;
var CarExploded = 0;
var iPlayerCarPos = 0;

/////////////////////////////////////////////////////////////////
//
//			Movements functions
//
////////////////////////////////////////////////////////////////

//@ this function calc the offset of the path.
function NexttargetOffset(init,offs,pnum)
{
	if (init)
	{
			vec_set( temp, my.x);
			ent_waypoint( my._old_position_x, pnum);
	}else
	{
			vec_set( temp, my._old_position_x);
			ent_nextpoint( my._old_position_x);

	}
			my_angle.x = my._old_position_x - temp.x;
			my_angle.y = my._old_position_y - temp.y;
			my_angle.z = my._old_position_z - temp.z;
			vec_to_angle( my_angle, my_angle);
			my._target_x = offs;
			my._target_y = 0;
			my._target_z = 0;
			my_angle.pan += 90;
			my_angle.tilt = 0;
			vec_rotate( my._target_x, my_angle);
			vec_add( my._target_x, my._old_position_x);
}

/* ------------------------------------------------------------------------ */

function MoveOnly(iGeer,WheelsHieght)
{
	if (iGeer == __Forward)
	{
		temp.x = my.CarForce * speed/200;
	}
	else
	{
		temp.x = -1 * (my.CarForce * speed/200);
	}
	
	temp.y = 0;
	sonar(me,5000);
	temp.z = -result + WheelsHieght ;
	move(me ,temp ,nullvector);  		
}

/* ------------------------------------------------------------------------ */

//@ this function move the cars
function MoveCars(iGeer,iAutoPointTrack,WheelsHieght)
{				
	if (iGeer == __Forward)
	{
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = my._target_z - my.z;
	}
	else
	{
		temp.x = my.x - my._target_x;
		temp.y = my.y - my._target_y;
		temp.z = my.z - my._target_z;
	}
	vec_to_angle(my_angle,temp);
	if (my._UseSmothPan)
	{	
		temp.x = my.pan;
		my.pan = my._ImmediateShiftDegree + nearangle(my.pan,my_angle,my._SmothingDegre *(speed/200));
		if (my._CarNumber == __PlayerCarNum )
		{
			player.pan += my.pan - temp.x;
		}
	}
	else
	{ 
		my.pan = my._ImmediateShiftDegree + my_angle.pan;
	}
		
	//@ SlowDown To Max Speed
	if (my._SlowDownToMax)
	{
		if (my.CarForce > my._MaxSpeed)
		{
			my.CarForce -= my._break; 
		}
		else
		{
			my.CarForce = my._MaxSpeed;
			my._SlowDownToMax = 0;
		}
	}
	
	//@ break..
	if (my._BraksPedal)
	{				
		my.CarForce -= my._break; 
		
		if (my._StopCar)
		{
			if (my._break > my.CarForce )
			{
				my.CarForce = 0;
				my._BraksPedal = 0;
			}
		}
		else
		{
			if (my.CarForce < 45)
			{
				my.CarForce = 45;
				my._BraksPedal = 0;
				my._GasPedal = 1;
			}
		}
	}

	//@ Axceleration..
	if (my._GasPedal)
	{
		if (my.CarForce < my._MaxSpeed)
		{
			my.CarForce += my._Axceleration;
		}
		else
		{
			my._GasPedal = 0;
			my.CarForce = my._MaxSpeed;
		}
	}

	MoveOnly(iGeer,WheelsHieght);

	if (iAutoPointTrack)
	{
		vec_set(point_move.x,my._target_x);
		if ( EDistance(point_move,me)< my._Dest2Move2SecPoint) 
		{
			NexttargetOffset( 0, my._PathOffset, 0);			
			my._PointNumber += 1;

			if (IsItACornar() > 12) 
			{
				my._BraksPedal = 1;
			}
		}
	}
}

/////////////////////////////////////////////////////////////////
//
//		Utility functions
//
/////////////////////////////////////////////////////////////////

define __SkidSoundVolum = 10000;

function PlayRandomSkidSound()
{
	wait(10 + random(10));
	
	var r;
	r = int(random(2));
	
	if (r== 0)	{		play_entsound(me,Skid_4,__SkidSoundVolum);	}
	if (r == 1)	{		play_entsound(me,Skid_5,__SkidSoundVolum);	}
	if (r == 2)	{		play_entsound(me,Skid_6,__SkidSoundVolum);	}
}

/* ------------------------------------------------------------------------ */

define __CarHornVolum = 10000;

function Horn(iTimes ,iWait)
{	
	wait(iWait);

	var iCounter = iTimes;
	while (1)
	{		
		if (snd_playing(my._SirenHornSound) == 0) && (iCounter > 0)
		{
			if (my._CarType  == __Hummer) {	play_entsound(me , Horn_1, __CarHornVolum); goto ss1;}
			if (my._CarType  == __Hummer) {	play_entsound(me , Horn_2, __CarHornVolum); goto ss1;}
			if (my._CarType  == __Hummer) {	play_entsound(me , Horn_3, __CarHornVolum); goto ss1;}
			if (my._CarType  == __Van) {	play_entsound(me , Horn_4, __CarHornVolum); goto ss1;}
			if (my._CarType  == __Taxi) {	play_entsound(me , Horn_5, __CarHornVolum); goto ss1;}
			if (my._CarType  == __Bus) {	play_entsound(me , Horn_6, __CarHornVolum); goto ss1;}
			if (my._CarType  == __Trak2) {	play_entsound(me , Horn_Trak_1, __CarHornVolum); goto ss1;}
			if (my._CarType  == __Trak1) {	play_entsound(me , Horn_Trak_2, __CarHornVolum); }
			ss1:

			my._SirenHornSound = result;
			iCounter -= 1;
		}
		
		if (iCounter<= 0)
		{
			break;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */

action TanelScan
{
	my.invisible = 1;
	my.passable = 1;
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);
	
	while (iPlayerCarPos < 29) { wait(1); }
			
	while (1)
	{
		you = pointer_to_entity(VWeaponSprite1.skill1);
		if (you== null)
		{
			return;		
		}
		
		if (vec_dist(my.pos ,you.pos ) < 100)
		{
			if (my.skill1 == 1) 
			{ 
				you.tilt -= 8; 
				remove(me);					
				return; 
			}
			if (my.skill1 == 2) 
			{
				you.tilt  = 0 ; 
				you.z -= 5;
				you.tilt += 1.5;
				wait(2);
				you = pointer_to_entity(VWeaponSprite1.skill1);
				if (you)
				{	
					you.tilt -=  1.5;
					you.z += 5;
				}
				
				remove(me);				
				return; 
			}
			if (my.skill1 == 3) 
			{ 
				you.tilt += 8; 
				remove(me);					
				return; 
			}
			if (my.skill1 == 4) 
			{ 
				you.tilt  = 0 ;
				remove(me); 
				return; 
			}
		}
		
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */

function MoveTarget(pYou , iTime)
{
	you = pyou;	
	wait(iTime);
	you = pyou;
	you._ImmediateShiftDegree = 0;

	vec_set( temp, you.x);
	my_angle.x = you._old_position_x - temp.x;
	my_angle.y = you._old_position_y - temp.y;
	my_angle.z = you._old_position_z - temp.z;
	vec_to_angle( my_angle, my_angle);
	you._target_x = you._PathOffset;
	you._target_y = 0;
	you._target_z = 0;
	my_angle.pan += 90;
	my_angle.tilt = 0;
	vec_rotate( you._target_x, my_angle);
	vec_add( you._target_x, you._old_position_x);
}

/* ------------------------------------------------------------------------ */

function ViolentStop()
{
	my.z -= 5;
	my.tilt -= 3;
	wait(3);
	my.tilt +=  3;
	my.z += 5;
}

/* ------------------------------------------------------------------------ */

function TimerToSoldow(iWaitAfterTerbo)
{	
	my._GasPedal = 0;
	wait(iWaitAfterTerbo);
	my._SlowDownToMax = 1;		
}

/* ------------------------------------------------------------------------ */

function LookAtPlayer()
{
	temp.x = player.x - my.x;
	temp.y = player.y - my.y;
	temp.z = player.z - my.z;
	vec_to_angle(my_angle , temp);
	my.pan = my_angle.pan;
	return(my_angle);
}

/* ------------------------------------------------------------------------ */

function RemoveLightsWheels(bLights,bLightEffect,bWheels)
{
	if (bLights)
	{
		//@ removing Lights
		RemoveEntity(Pointer_To_Entity(my._FrontRightLight));
		RemoveEntity(Pointer_To_Entity(my._FrontLeftLight));
	}

	if (bLightEffect)
	{
		//@ removing LightEffect
		RemoveEntity(Pointer_To_Entity(my._LightEffect));
	}

	if (bWheels)
	{
		//@ removing wheels.
		RemoveEntity(Pointer_To_Entity(my._FrontRightWheel ));
		RemoveEntity(Pointer_To_Entity(my._FrontLeftWheel  ));
		RemoveEntity(Pointer_To_Entity(my._BackRightWheel  ));
		RemoveEntity(Pointer_To_Entity(my._BackLeftWheel   ));		
		RemoveEntity(Pointer_To_Entity(my._BackRightWheel2 ));
		RemoveEntity(Pointer_To_Entity(my._BackLeftWheel2  ));	
	}
}

/* ------------------------------------------------------------------------ */

function ImmediateRemove()
{
	RemoveLightsWheels(__RemoveLights,__RemoveLightEffect,__RemoveWheels);
	RemoveColl(me);
	remove(me);	
}

/* ------------------------------------------------------------------------ */

function RemoveEntity(cme)
{
	me = cme;
	if (me) 
	{
		remove me;
	}
}

/* ------------------------------------------------------------------------ */

function SetWheelByWheel(Cyou,Vert)
{
	you = Cyou;
	vec_for_vertex(temp,my,Vert);
	vec_set(you.pos,temp);	
	you.pan = my.pan;
}

/* ------------------------------------------------------------------------ */

function SetMyWheele(bSixWheels)
{			
	you = pointer_to_entity(my._FrontRightWheel);
	vec_for_vertex(temp , my , my._FrontRightWheel_Vertex);
	vec_set(you.pos,temp);
				
	you = pointer_to_entity(my._FrontLeftWheel);
	vec_for_vertex(temp , my , my._FrontLeftWheel_Vertex);
	vec_set(you.pos,temp);
	
	you = pointer_to_entity(my._BackRightWheel);
	vec_for_vertex(temp , my , my._BackRightWheel_Vertex);
	vec_set(you.pos,temp);
	
	you = pointer_to_entity(my._BackLeftWheel);
	vec_for_vertex(temp , my , my._BackLeftWheel_Vertex);
	vec_set(you.pos,temp);
	
	if (bSixWheels)
	{		
		you = pointer_to_entity(my._BackRightWheel2);
		vec_for_vertex(temp , my , my._BackRightWheel2_Vertex);
		vec_set(you.pos,temp);		

		you = pointer_to_entity(my._BackLeftWheel2);
		vec_for_vertex(temp , my , my._BackLeftWheel2_Vertex);
		vec_set(you.pos,temp);
	}
}

/* ------------------------------------------------------------------------ */

//@ responsibl of the rotation of the wheels and turning them on corners
//@ Wheels With flag (1) set, that mean they r front wheels

define __RotationAngle = 25;
define __OwnCar ,skill20;
define __ComparativPan , skill5;

function WheelsMakrsAct()
{	
	my.passable = 1;
	my.oriented = 1;	
	my.pan = you.pan;
	my.tilt = 90;
		
	//@ for some reson one of the sprites is caried with the car
	//@ in the front light place, i use this way so i can detect it and reome it.
	my.skill7 = my.z;
	wait(2);
	if (my.z != my.skill7)
	{
		remove(me);
		return;
	}
		
	wait(75);	
	remove(me);
} 

/* ------------------------------------------------------------------------ */

function ShowWheelMark()
{
	if (random(3) > 1)
	{
		temp.x = 0;
		temp.y = 0;
		temp.z = -600;
		vec_add(temp,my.pos);
		trace_mode = ignore_me + ignore_passable + ignore_sprites; 
		trace(my.pos ,temp);
		create(<WheelsMarks.tga> ,target , WheelsMakrsAct);
	}
}

/* ------------------------------------------------------------------------ */

function WheelsRotation()
{
	//@ skill Used: 
	//@  5  --> ( __ComparativPan ): used to check if the car is turning or not.
	//@  20 --> ( __OwnCar	      ): Pointer to wheel car.
	//@  28 --> ( FrameAnim       ): animation speed of the wheel.
	
	//@ Flags Used:
	//@  1  --> () : indecats that this is a front wheel

	my.passable = 1;
	my.__OwnCar = entity_to_pointer(you);
	my.pan = you.pan;
	my.__ComparativPan = you.pan;
	while (1)
	{
		you = pointer_to_entity(my.__OwnCar);
		if (you == null) { return; }
		my.pan = you.pan;
		my.invisible = you.invisible == 1;
		if (you.CarForce > 3)
		{
			ent_cycle( "Frame" , my.FrameAnim );
			my.FrameAnim += 10 * (speed/200);
		}
						
		if  ( (my.__ComparativPan + 2) < you.pan ) || ( (my.__ComparativPan - 2) > you.pan ) 
		{
			if (my.flag1 )
			{
				if (you.pan > my.__ComparativPan)
				{
					my.pan += __RotationAngle;
				}
				else
				{
					my.pan -= __RotationAngle;
				}				
			}
			my.__ComparativPan = you.pan;
			ShowWheelMark();
		}				
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */

//@ creat the wheels, it need the wheel file name , vertix , and is it a front wheel of back wheel

function CreateMyWheele(namf,Vert , bFrontWheel)
{		
	ptempstr = namf;
	create(ptempstr,temp,WheelsRotation);
	if (bFrontWheel)
	{ 
		you.flag1 = 1;	
	}
	SetWheelByWheel(you,Vert);	
	return(entity_to_pointer(you));
}

/* ------------------------------------------------------------------------ */

//@ set the front left , right lights and the light effect on grownd when the car moves

function SetMyLights(iFrontRightLight , iFrontLeftLight ,iLightEffectDest )
{
	you = pointer_to_entity(my._FrontRightLight);
	if (you)
	{
		vec_for_vertex(temp,my,iFrontRightLight);
		vec_set(you.pos,temp);
		you.pan = my.pan;
	}
	
	you = pointer_to_entity(my._FrontLeftLight);
	if (you)
	{
		vec_for_vertex(temp,my,iFrontLeftLight);
		vec_set(you.pos,temp);
		you.pan = my.pan;
	}	

	//@ this means that light are broken..
	if (my.flag7) && (my.flag8) 
	{
		return;
	}	
	entiy = pointer_to_entity(my._LightEffect);
	if (entiy)
	{		
		temp.x = iLightEffectDest;
						
		if (my.flag7 == 0) && (my.flag8 == 0)
		{
			temp.y = 0;
		}
		else
		{
			entiy.scale_x = 1;
			entiy.scale_y = 1;
			entiy.scale_z = 1;
									
			if (my.flag7)
			{
				temp.y = 30; 
			}
			else
			{			
				temp.y = -30;
			}
		}		
		temp.z = -200;
		vec_rotate(temp , my.pan);
		vec_add(temp , my.pos);
		trace_mode = ignore_me + ignore_passable + ignore_sprites;
		trace( my.pos, temp);
		target.z += 10;
		vec_set(entiy.x , target);
		vec_to_angle(entiy.pan , normal);
	}	
}

/* ------------------------------------------------------------------------ */

//@ the effect of the light on the grownd

function SetLightFxScale(iScale_x )
{	
	my.scale_x = iScale_x;
	my.scale_y = iScale_x;
	my.scale_z = iScale_x;
}

/* ------------------------------------------------------------------------ */

function LightFX()
{
	my.skill5 = entity_to_pointer(you);
	my.passable = 1;
	my.oriented = 1;
	
	//my.bright = 1;
	//my.alpha = 100;
	my.ambient = 50;
	my.tilt = 90;
	my.pan = you.pan;
	
	if (you._CarType == __Hummer     ) { SetLightFxScale(__Hummer_LightEffectSize );      goto LFX1; }
	if (you._CarType == __Ceterween  ) { SetLightFxScale(__Ceterween_LightEffectSize);    goto LFX1; }
	if (you._CarType == __Dodg       ) { SetLightFxScale(__Hummer_LightEffectSize);	      goto LFX1; }
	if (you._CarType == __LandRover  ) { SetLightFxScale(__LandRover_LightEffectSize );   goto LFX1; }
	if (you._CarType == __Nissan     ) { SetLightFxScale(__Nissan_LightEffectSize);	      goto LFX1; }
	if (you._CarType == __Golf       ) { SetLightFxScale(__Golf_LightEffectSize);	      goto LFX1; }
	if (you._CarType == __FireBregate) { SetLightFxScale(__FireBregate_LightEffectSize);  goto LFX1; }
	if (you._CarType == __Van        ) { SetLightFxScale(__Van_LightEffectSize);	      goto LFX1; }	
	if (you._CarType == __Trak1      ) { SetLightFxScale(__Track1_LightEffectSize);	      goto LFX1; }
	if (you._CarType == __Trak2      ) { SetLightFxScale(__Track2_LightEffectSize);	      goto LFX1; }
	if (you._CarType == __Bus        ) { SetLightFxScale(__Bus_LightEffectSize);	      goto LFX1; }
	if (you._CarType == __PlayerCarNum)	{SetLightFxScale(__Hummer_LightEffectSize );      	}
	LFX1:

	while (1)
	{
		you = pointer_to_entity(my.skill5);
		if (you)
		{
			my.invisible = you.invisible == 1;
		}
		else
		{
			remove(me);
			return;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */

function CarLightsAction()
{	
	my.passable = 1;
	my.skill1 = entity_to_pointer(you);	
	my.scale_z = 6;
	my.scale_x = 2;
	my.scale_y = 2;
	my.tilt = 65;	
	my.skin = 2;	
	//my.bright = 1;
	while (1)
	{
		you = pointer_to_entity(my.skill1);
		if (you)
		{
			my.invisible = you.invisible == 1;
		}
		else
		{
			remove(me);
			return;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */

//@ used in the creation of the light so the light take its posion on the light vertix.

function SetLightByLight(pYou , iVerNum)
{
	you = pYou;
	vec_for_vertex(temp,my,iVerNum);
	vec_set(you.pos,temp);
	you.pan = my.pan ;
}

/* ------------------------------------------------------------------------ */

function CreateMyLights(sFileName , iVertixNumber)
{
	ptempstr = sFileName;
	create(ptempstr,temp,CarLightsAction);	
	SetLightByLight(you, iVertixNumber);		
	return(entity_to_pointer(you));
}

/* ------------------------------------------------------------------------ */

//@ determen if its a corner by megaring the angle between the next 2 points of the car path

var temp1;
var my_angle2;
function IsItACornar()
{
	ent_waypoint(temp1,my._PointNumber+1);
	ent_waypoint(temp2,my._PointNumber+2);	
	ent_prevpoint(temp);
	ent_prevpoint(temp);
	
	temp.x = my.x - temp1.x;
	temp.y = my.y - temp1.y;
	temp.z = my.z - temp1.z;
	vec_to_angle(my_angle, temp);
	
	temp.x = temp2.x - temp1.x;
	temp.y = temp2.y - temp1.y;
	temp.z = temp2.z - temp1.z;
	vec_to_angle(my_angle2, temp);
		
	return( abs( abs(ang(my_angle2 - my_angle)) - 180));
	// > 12 is a cornar	
}

/* ------------------------------------------------------------------------ */

//@ used with the hummer cars so they dont hit player car on corners

function HoldDist(iDist)
{
	you = pointer_to_entity(pPlayerCar);
	if (vec_dist( my.pos,you.pos) < iDist )
	{
		my._GasPedal = 0;
		my._BraksPedal = 1;
	}
}

/* ------------------------------------------------------------------------ */

//@ used with landrover cras to attack the player car , used as a collision

function TempCoCocO(iDist)
{
	you = pointer_to_entity(pPlayerCar);
	if (vec_dist( my.pos,you.pos) < iDist )
	{
		my.CarForce -= 30;
		my._BraksPedal = 0;
		my._GasPedal   = 1;

		you._GasPedal = 0;
		you.CarForce += 20;
		you._SlowDownToMax = 1;
		return(1); 
	}
	else
	{
		return(0); 
	}
}

/////////////////////////////////////////////////////////////////
//
//		FX functions
//
/////////////////////////////////////////////////////////////////

//@ control the animation of the camera when the landrover cars hit player car

function CameraExplosionMove()
{	
	var Myflh=0;
	var Myflhk=0;
	var SmoeVar = 1;
		
	while (Myflhk<10)
	{
		Myflhk +=1;
		Myflh    = abs(Myflh -1);
		camera.roll+= cos(Myflh *180)*3;		
		iCameraAngles.pan += cos(Myflh *180)*5;
		wait(1);
	}
	
	camera.roll = 0;
}

/* ---------------------------------------------------------------- */

function SmokeMeSome()
{
	temp.x = 0;
	temp.y = 0;
	temp.z = 0;
	my_angle.x = 50-random(100);
	my_angle.y = 50-random(100);
	my_angle.z = -random(25);
	vec_add( my_angle, my.pos);
	effect( Blacksmokeup, 1, my_angle, temp);
}

/* ---------------------------------------------------------------- */

//@ used when roll explosion or stop cut rod functions

function InharetOldCar()
{
	my.pan = you.pan;
	my.skill5 = entity_to_pointer(you);
	my.frame = you.frame;
	my.skin = you.skin;
	my._CarType = you._CarType;
	my._CarNumber = you._CarNumber;
	my._FrontRightWheel_Vertex = you._FrontRightWheel_Vertex;
	my._FrontLeftWheel_Vertex  = you._FrontLeftWheel_Vertex;
	my._BackRightWheel_Vertex  = you._BackRightWheel_Vertex;
	my._BackLeftWheel_Vertex   = you._BackLeftWheel_Vertex;
	my._FrontRightWheel = you._FrontRightWheel;
	my._FrontLeftWheel  = you._FrontLeftWheel;
	my._BackRightWheel  = you._BackRightWheel;
	my._BackLeftWheel   = you._BackLeftWheel;
	my._FrontRightLight = you._FrontRightLight;
	my._FrontLeftLight = you._FrontLeftLight;

	my._SirenModle = you._SirenModle;
	my._MySoldier  = you._MySoldier;
	my._MyRBGSoldier = you._MyRBGSoldier;

	you = pointer_to_entity(my._FrontRightWheel);
	you.skill20 = entity_to_pointer(me);
	you = pointer_to_entity(my._FrontLeftWheel);
	you.skill20 = entity_to_pointer(me);
	you = pointer_to_entity(my._BackRightWheel);
	you.skill20 = entity_to_pointer(me);
	you = pointer_to_entity(my._BackLeftWheel);
	you.skill20 = entity_to_pointer(me);	
}

/* ---------------------------------------------------------------- */

function RollAndExplode2()
{	
	my.passable = 1;
	InharetOldCar();	
	my.skill10 = 0;	
	
	//@Skid
	while (my.skill10 < 30) && (my.flag1 == 0)
	{
		if (snd_playing(my.skill11) == 0)
		{
			play_entsound(me,Skid_6,__LR_SkidVolum);
			my.skill11 = result;
		}
		you = pointer_to_entity(my.skill5);		
		vec_set(my.pos,you.pos);		
		SetMyWheele(__ForeWheels);		
		SetMySiren();
		my.skill10+=1;
		
		if (random(10) > 5)
		{
			SmokeMeSome();
		}		
				
		if (my.skill10 > 0) && (my.skill10 < 6)	{ my.pan += 6;	}		
		if (my.skill10 > 6) && (my.skill10 < 12){ my.pan -= 12;	}
		if (my.skill10 > 12)			{ my.pan += 6;	}
		
		wait(1);
	}
	
	//@ Skid And Prepar To RollOver
	while (abs(ang(you.pan - my.pan)) < 90) && (my.flag1 == 0)
	{
		if (snd_playing(my.skill11) == 0)
		{
			play_entsound(me,Skid_6,__LR_SkidVolum);
			my.skill11 = result;
		}
		you = pointer_to_entity(my.skill5);
		vec_set(my.pos,you.pos);
		SetMyWheele(__ForeWheels);		
		SetMySiren();
		if (random(10) > 5)
		{
			SmokeMeSome();
		}				
		
		my.pan += 20;				
		wait(1);
	}
	
	stop_sound(my.skill11);

	//@ RollOver Until My Gide Stops
	while (my.flag1 == 0)
	{
		if (snd_playing(my.skill11) == 0)
		{
			play_entsound(me,LR_RollOver,__LR_RollOverVolum);
			my.skill11 = result;
		}
		you = pointer_to_entity(my.skill5);
		vec_set(my.pos,you.pos);
		SetMyWheele(__ForeWheels);
		SetMySiren();
		if (random(10) > 5)
		{
			SmokeMeSome();
		}
		
		my.roll+= 25 ;
		wait(1);
	}
	
	CarExplosion();		
}

/* ---------------------------------------------------------------- */

define _GlobalTimer , skill2;
define _PanSpeed , skill3;

define _FirestTurnTime , skill7;
define _FirestTurnSpeed , skill8;
define _SecondTurnTime , skill9;
define _SecondTurnSpeed , skill4;

//function SetMySiren();
function SetCarriedSolder();

function StopCutRoad()
{	
	InharetOldCar();
	my.flag1 = 0;
				
	my._FirestTurnTime = 30;
	my._FirestTurnSpeed = 2;
	my._SecondTurnTime = 60;
	my._SecondTurnSpeed = -2;
	
	my._GlobalTimer = 0;	
	my._PanSpeed = my._FirestTurnSpeed;
	
	while (my.flag1 == 0)
	{		
		you = pointer_to_entity(my.skill5);
		vec_set(my.pos,you.pos);
		SetMyWheele(__ForeWheels);				
		
		SetCarriedSolder();
	
		SetMyLights( __Hummer_FrontRightLight , __Hummer_FrontLeftLight ,__Hummer_LightEffectDest );
		
		
		my._GlobalTimer += 1;

		my.pan += my._PanSpeed;
		
		if (my._GlobalTimer > my._FirestTurnTime) && (my._GlobalTimer <my._SecondTurnTime)
		{
			my._PanSpeed = my._FirestTurnSpeed; 
		}

		if (my._GlobalTimer > my._SecondTurnTime)
		{
			my._PanSpeed = my._SecondTurnSpeed;
		}

		wait(1);
	}				
}

/* ---------------------------------------------------------------- */

function RollAndExplode(iState)
{
	
	removecoll(me);
	my.invisible = 1;
	my.passable =0;

	//@ Creating cover car..
	if (iState == __RollAndExplod)
	{
		RemoveLightsWheels(__RemoveLights,__RemoveLightEffect,__DontRemoveWheels);
		if (my._CarType == __Hummer)	  { create(Hummer      ,my.pos ,RollAndExplode2 ); goto CarRE1; }	
		if (my._CarType == __Ceterween)	  { create(Ceterween   ,my.pos ,RollAndExplode2 ); goto CarRE1; }
		if (my._CarType == __Dodg)	  { create(Dodg        ,my.pos ,RollAndExplode2 ); goto CarRE1; }
		if (my._CarType == __Golf)	  { create(Golf        ,my.pos ,RollAndExplode2 ); goto CarRE1; }
		if (my._CarType == __Nissan)	  { create(Nissan      ,my.pos ,RollAndExplode2 ); goto CarRE1; }
		if (my._CarType == __Van)	  { create(Van         ,my.pos ,RollAndExplode2 ); goto CarRE1; }
		if (my._CarType == __LandRover)	  { create(LandRover   ,my.pos ,RollAndExplode2 ); goto CarRE1; }
		if (my._CarType == __FireBregate) { create(FireBregate ,my.pos ,RollAndExplode2 ); goto CarRE1; }
		if (my._CarType == __Ambulance)   { create(Ambulance   ,my.pos ,RollAndExplode2 );		}
	}
	else
	{
		if (my._CarType == __Hummer)	  { create(Hummer      ,my.pos ,StopCutRoad ); goto CarRE1; }	
		if (my._CarType == __Ceterween)	  { create(Ceterween   ,my.pos ,StopCutRoad ); goto CarRE1; }
		if (my._CarType == __Dodg)	  { create(Dodg        ,my.pos ,StopCutRoad ); goto CarRE1; }
		if (my._CarType == __Golf)	  { create(Golf        ,my.pos ,StopCutRoad ); goto CarRE1; }
		if (my._CarType == __Nissan)	  { create(Nissan      ,my.pos ,StopCutRoad ); goto CarRE1; }
		if (my._CarType == __Van)	  { create(Van         ,my.pos ,StopCutRoad ); goto CarRE1; }
		if (my._CarType == __LandRover)	  { create(LandRover   ,my.pos ,StopCutRoad ); goto CarRE1; }
		if (my._CarType == __FireBregate) { create(FireBregate ,my.pos ,StopCutRoad ); goto CarRE1; }
		if (my._CarType == __Ambulance)   { create(Ambulance   ,my.pos ,StopCutRoad );		    }
	}

	CarRE1:

	my.skill5 = entity_to_pointer(you);

	while (1)
	{
		temp.x = my.CarForce;
		temp.y = 0;
		sonar(me,5800);
		temp.z = - result + 12;
		move(me ,temp ,nullvector );
		if (result == 0)
		{			
			
			break;
		}				
		my.CarForce -= my._break ;
		if (my.CarForce < 10)
		{
			break;
		}		
		wait(1);
	}

	you = pointer_to_entity(my.skill5);
	you.flag1 = 1;
	wait(1);
	remove(me);
}

/* ---------------------------------------------------------------- */

function MisionFaled()
{
	wait(50);
	messionfailed = 1;
	ZoomOut();
	play_sound( PlDed,100);
	h_PlDed = result;
	me = 0;
	VisMainMenu(1);
	MBackMenu.visible = 0;
	on_esc = 0;
	on_enter = LLoadLastSave;
}

/* ---------------------------------------------------------------- */

sound CarExplo1 , <CarExplo1.wav>;
sound CarExplo2 , <CarExplo2.wav>;
define __ExplosionVolume = 100000;
//@ this function create the explosion of the car.
function CarExplosion()
{		
	wait(1);
	my.passable = 0; 
	//@ Create The Explosion			
	
	if (random(2) > 1)
	{
		play_entsound(me,CarExplo1,__ExplosionVolume);
	}
	else
	{
		play_entsound(me,CarExplo2,__ExplosionVolume);
	}
	create( <dust.mdl>, my.pos,AtomicExplosion);
	temp.pan = 360;
	temp.tilt = 360;
	temp.z = 300;
	indicator = _explode;
	scan(my.pos ,my.pan ,temp );
	indicator = 0;

	CameraMoveExplo();
	removeColl(me);				
	CarExploded.x = my._CarType;
	CarExploded.y = my._CarNumber;
	

	RemoveLightsWheels(__RemoveLights,__RemoveLightEffect,__RemoveWheels);
	you = pointer_to_entity(my._SirenModle);
	remove(you);

	my.skill5 = my.frame;

	//@ morphing to the right exploded car
	if (my._CarType == __Hummer    ){ morph(HumerEx     , me) ; goto step1; }
	if (my._CarType == __Ceterween ){ morph(SeterEx     , me) ; goto step1; }
	if (my._CarType == __Dodg      ){ morph(DodEx       , me) ; goto step1; }
	if (my._CarType == __Golf      ){ morph(GolfEx      , me) ; goto step1; }
	if (my._CarType == __Nissan    ){ morph(NisanEx     , me) ; goto step1; }
	if (my._CarType == __Van       ){ morph(VanEx       , me) ; goto step1;	}	
	if (my._CarType == __LandRover ){ morph(LandRoverEx , me) ; goto step1; }
	if (my._CarType == __Trak1     ){ morph(Burad1Ex    , me) ; goto step1; }
	if (my._CarType == __WaterTank ){ morph(WaterTankEx , me) ; goto step1; }
	if (my._CarType == __Bus       ){ morph(BusEx	    , me) ;		}
	step1:
	
	my.frame = my.skill5;
	

	if (my._CarType == __Van) && (my._CarNumber == 1)
	{
		my._CarType = __Hummer;
	}
	if (my._CarType != __Hummer) && (my._CarType != __LandRover)
	{
		MisionFaled();
	}
	
	//@ Make Smoke
	my.skill1= 0;
	while (my.skill1<400)
	{		
		temp.x = 0;
		temp.y = 0;
		temp.z = 0;
		my_angle.x = 50-random(100);
		my_angle.y = 50-random(100);
		my_angle.z = -random(25);
		vec_add( my_angle, my.pos);
		effect( Blacksmokeup, 1, my_angle, temp);	
		my.skill1+= 1;
		wait(1);
	}	
	remove(me);
	
	
}

/////////////////////////////////////////////////////////////////
//
//		flying entitys functions
//
/////////////////////////////////////////////////////////////////

function MyGide()
{
	my.passable = 1;
	my.invisible = 1;
	my.pan = 320;	
	my.skill3 = 5;
	while (1)
	{	
		my.skill1 += 1;
		if (my.skill1 > 10){my.skill3 = -5;	}
		if (my.skill1 > 22){break;		}
		temp.x = 20;
		temp.y = 0;
		temp.z = my.skill3;
		move(me  ,temp ,nullvector );
		wait(1);
	}
	my.flag1 = 1;
}

/* -------------------------------------------------------- */

action Hajes
{
	while (player == null){	wait(1);}

	while (1)
	{
		you = pointer_to_entity(pPlayerCar);
		vec_set(temp , you.pos);
		temp.z = my.z;		
		if (vec_dist(my.pos ,temp) < 180) { break; }
		wait(1);
	}

	play_entsound(me ,HazesBreak ,__HazesBreakVolum );
	create(<Wheeltank.mdl>,my.pos,MyGide);
	my.skill5 = entity_to_pointer(you);
	
	you = pointer_to_entity(my.skill5);
	while (you.flag1 == 0)
	{
		you = pointer_to_entity(my.skill5);
		vec_set(my.pos, you.pos);
		my.tilt += 20;
		my.pan += 15;		
		wait(1);
	}

	while (my.skill25 < 30)
	{
		my.skill25 += 1;
		my.pan += 2;
		wait(1);
	}
}

/* -------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------------------------------------------*/

function SetDoors()
{
	temp.x = 80;
	temp.y = 0;
	temp.z = 0;
	vec_rotate(temp,my.pan);
	vec_add(temp ,my.pos);
	you = pointer_to_entity(my.skill1);
	vec_set(you.pos , temp);
	you.pan = my.pan +90;
}

/* --------------------------------------------------*/

function MyPostion()
{	
	my.passable = 1;
	my.invisible = 1;
	
	my.flag1 = you.flag1 == 1;
	my.skill1 = entity_to_pointer(you);
	my.pan = you.pan + 90;

	while (1)
	{
		you = pointer_to_entity(pPlayerCar);
		vec_set(temp , you.pos);
		temp.z = my.z;		
		if (vec_dist(my.pos ,temp) < 160) { break; }
		wait(1);
	}

	if (my.flag1)
	{
		while (my.pan > 20)
		{
			my.pan -= 10;
			SetDoors();
			wait(1);
		}
		while (my.pan < 70 +random(15) )
		{
			my.pan += 2 + random(3);
			SetDoors();
			wait(1);
		}
	}
	else
	{
		my.pan = 60;
		while (my.pan < 160)
		{
			my.pan += 10;
			SetDoors();
			wait(1);
		}
		while (my.pan > 80 +random(15) )
		{
			my.pan -= 2 + random(3);
			SetDoors();			
			wait(1);
		}
	}
}

/* --------------------------------------------------*/

action GardenDoor
{
	while (iPlayerCarPos < 35)
	{
		wait(1);
	}

	you = pointer_to_entity(pPlayerCar);
	while (vec_dist(my.pos ,you.pos) > 100)
	{
		you = pointer_to_entity(pPlayerCar);
		wait(1);
	}

	
	temp.x = -80;
	temp.y = 0;
	temp.z = 0;		
	my_angle.pan = my.pan + 90;	
	vec_rotate(temp,my_angle.pan);
	vec_add(temp ,my.pos);
	create(<ckdie.mdl>,temp,MyPostion);	
	
	if (my.flag1)
	{
		wait(1 + random(5));
	}
	if (random(3) > 1)
	{
		play_entsound(me,GardenDoor1,__GardenDoorVolum);
	}
	else
	{
		play_entsound(me,GardenDoor2,__GardenDoorVolum);
	}
}

/* -------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------------------------------------------*/

function GideingChar()
{			
	my.passable = 1;
	my.invisible = 1;
	my.pan = 60;
	
	my.skill3 = 20;
	while (1)
	{	
		my.skill1 += 1;
		if (my.skill1 > 10){my.skill3 = -20;	}
		if (my.skill1 > 20){break;		}

		temp.x = 30;
		temp.y = 0;
		temp.z = my.skill3;
		move(me  ,temp ,nullvector );
		wait(1);
	}
	my.flag1 = 1;	
}

/* --------------------------------------------------*/

action FlyingChar
{
	while (player == null){	wait(1);}

	while (1)
	{
		you = pointer_to_entity(pPlayerCar);
		vec_set(temp , you.pos);
		temp.z = my.z;		
		if (vec_dist(my.pos ,temp) < 200) { break; }
		wait(1);
	}
	
	play_entsound(me , CharBrak ,__CharBrakVolum );
	create(<Wheeltank.mdl>,my.pos,GideingChar);
	my.skill5 = entity_to_pointer(you);
	
	you = pointer_to_entity(my.skill5);
	while (you.flag1 == 0)
	{
		you = pointer_to_entity(my.skill5);
		vec_set(my.pos, you.pos);
		my.tilt -= 20;
		my.pan += 15;		
		wait(1);
	}

	while (my.skill25 < 30)
	{
		my.tilt -= 2;
		my.skill25 += 1;
		my.pan += 2;
		wait(1);
	}
	you = pointer_to_entity(my.skill5);
	remove(you);
	wait(100);
	remove(me);
}

/* -------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------------------------------------------*/

action StreentBol
{
	sonar(my,10000);
	my.z = target.z +abs(my.min_z);
	my.passable = 0;
}

/* -------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------------------------------------------*/

function FlyingFutureGide()
{	
	my.passable = 1;
	my.invisible = 1;
	my.skill1 = entity_to_pointer(you);
	you = pointer_to_entity(VWeaponSprite1.skill1);	
	my.pan = you.pan + random(5);
	
	while (my.skill2 < 10)
	{
		temp.x = 30;
		temp.y = 0;
		temp.z = 10;
		move(me ,temp ,nullvector );
		you= pointer_to_entity(my.skill1);
		vec_set(you.pos , my.pos);
		my.skill2 += 1;
		wait(1);
	}
	while (my.skill2 > -5)
	{
		temp.x = 30;
		temp.y = 0;
		temp.z = -10;
		move(me ,temp ,nullvector );
		you= pointer_to_entity(my.skill1);
		vec_set(you.pos , my.pos);
		my.skill2 -= 1;
		wait(1);
	}
	you= pointer_to_entity(my.skill1);
	you.flag1 = 1;
	remove(me);
}
/* ---------------------------------------------------- */

action FlyingFuture
{
	my.passable = 1;

	while (iPlayerCarPos < 20) { wait(1);}

	while (1)
	{
		you = pointer_to_entity(VWeaponSprite1.skill1);
		if (you== null)
		{
			return;		
		}
		if (vec_dist(my.pos ,you.pos) < 150)
		{
			break;
		}
		wait(1);
	}

	if (random(3) > 1)
	{
		play_entsound(me ,BreakFuture ,__BreakFutureVolum);
	}
	else
	{
		play_entsound(me ,BreakFuture2 ,__BreakFutureVolum);
	}
	
	create(<Wheeltank.mdl>, my.pos, FlyingFutureGide);
	while (my.skill5 < 20) 
	{
		my.pan += 5;
		my.tilt -= 10;
		if (my.flag1)
		{
			break;
		}
		wait(1);
	}
	my.pan = 90;
	my.roll = 0;
}

/* -------------------------------------------------------------------------------------------------*/
/* -------------------------------------------------------------------------------------------------*/

function TraficLightGide()
{
	my.passable = 1;
	my.invisible = 1;
	my.skill1 = entity_to_pointer(you);
	you = pointer_to_entity(VWeaponSprite1.skill1);	
	my.pan = you.pan + random(5);
	
	while (my.skill2 < 5)
	{
		temp.x = 20;
		temp.y = 0;
		temp.z = 5;
		move(me ,temp ,nullvector );
		you= pointer_to_entity(my.skill1);
		vec_set(you.pos , my.pos);
		my.skill2 += 1;
		wait(1);
	}
	while (my.skill2 > -15)
	{
		temp.x = 20;
		temp.y = 0;
		temp.z = -5;
		move(me ,temp ,nullvector );
		you= pointer_to_entity(my.skill1);
		vec_set(you.pos , my.pos);
		my.skill2 -= 1;
		wait(1);
	}
	
	you= pointer_to_entity(my.skill1);
	you.flag1 = 1;
	remove(me);	
}

/* ---------------------------------------------------- */

action MyTraficLight
{
	my.passable = 1;
	while (iPlayerCarPos < 20) { wait(1);}

	while (1)
	{
		you = pointer_to_entity(VWeaponSprite1.skill1);
		if (you== null)
		{
			return;		
		}
		if (vec_dist(my.pos ,you.pos) < 150)
		{
			break;
		}
		wait(1);
	}

	create(<Wheeltank.mdl>, my.pos, TraficLightGide);
	while (my.skill5 < 20)
	{
		my.roll +=9;
		my.tilt -= 5;
		if (my.flag1)
		{
			break;
		}
		wait(1);
	}

	while (my.tilt < -90)
	{
		my.tilt += 8;
		my.pan -= 5;
		wait(1);
	}

	while (my.pan > -65)
	{
		my.pan -= 3;
		wait(1);
	}
}