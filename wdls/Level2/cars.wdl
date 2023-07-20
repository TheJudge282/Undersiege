include <Wheels.wdl>;
include <carfx.wdl>;
include <merkava.wdl>;
include <mallala.wdl>;
include <vehicle.wdl>;
include <CarEngine.wdl>;
include <carsai.wdl>;
//include <explosions.wdl>;

var ss=0;

function ddss()
{
my.passable = 1; 

while (1)
{
if (you !=0)
{
	vec_set(my.pos,you.cartarget_x);
}
	wait(1);
}
}

function Car4WheelEvent()
{
	if(event_type == event_scan)
	{
		if (you.owntype == TypeOfTraficSingle)
		{
			CurntCar = Pointer_To_Entity( my.LeaderId);
			CurntCar.TraficLight = you;
		}
	}

	if(event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push)
	{
	if (you!=0)
	{
	if (you.OwnType == TypeOfEngines)
	{
		my.event =0;
		CurntCar = Pointer_To_Entity( my.LeaderId);
		temp.x = abs(CurntCar.carforce);
		tempent = Pointer_To_Entity( you.LeaderId);
		temp.x += abs(tempent.carforce);

		CurntCar.carforce = temp.x/2.1;
		tempent.carforce = temp.x/2.1;

		temp.x = -target.x + my.x;
		temp.y = -target.y + my.y;
		temp.z = -target.z + my.z;
		vec_to_angle( my_angle, temp);
		
		my.pan = my_angle+random(10);
		//temp.x = int((ang(CurntCar .pan - my_angle)+180)/45 + 1);

		//CurntCar.AccdentOrder = temp.x;
		//myacc(CurntCar,"weqa");
		
		wait (10);
		my.event =Car4WheelEvent;
	}
	else
	{

	if (you.OwnType ==  TypeOfCompars)
	{

		you.IWanaFly = 1;

		temp.x = you.x - my.x;
		temp.y = you.y - my.y;
		temp.z = you.z - my.z;

		vec_to_angle( my_angle, temp);
		you.pan = my_angle.pan;

		CurntCar = Pointer_To_Entity( my.LeaderId);
		forces = abs(CurntCar.carforce);
		temp.x = CurntCar.carforce;
		temp.y = 0;
		temp.z = 0;
		vec_rotate( temp, my.pan);
		vec_add( you.pos, temp);


	}

	}
	}

	}
}

function CarInit()
{
CurrentOrder +=1;
my.frame = CurrentOrder;
if (MyName(my,WheelName))
{
	Morph WheelName,  me;	 
}
else
{
exit;
}
create( WheelName, my.pos, CarEngine);

if (my.CarWieght ==0)
{
	my.CarWieght =  CarsWieght[my._carorder]; 
}


if (my.ShocksForce ==0)
{
	my.ShocksForce =  CarsShokeForce[my._carorder]; 
}

if (my.ShocksMaxAngle ==0)
{
my.ShocksMaxAngle = CarsShokeMaxAngle[my._carorder]; 
}

if (my.EngineForce ==0)
{
my.EngineForce = CarsEngineForce[my._carorder]; 
}

if (my.GearSpeed ==0)
{
my.GearSpeed = CarsGearSpeed[my._carorder]; 
}

my.passable = 1; 
my.CarBreakerForce = 0.5;


my.CarCurrentGear= 4;

my.Carwheel = MyWheel(my,WheelName);
if (my.Carwheel)
{
create( WheelName, my.pos, wheler);
create( WheelName, my.pos, whelel);
create( WheelName, my.pos, whelerb);
create( WheelName, my.pos, whelelb);

}


my.CarRef = MyReflection(my,WheelName);
if (my.CarRef)
{
	create( WheelName, my.pos, Lamacar);
}

create( <ambulL.tga>, my.pos, Ambulancelightr);
create( <ambulL.tga>, my.pos, Ambulancelightl);

create( <ambulL.tga>, my.pos, ddss);

you = Pointer_To_Entity( my.LeaderId);
you.enable_detect = on;
you.enable_scan= on;

you.event = Car4WheelEvent;
you.max_x *= 2.2;
CollisionOffset.x = 0;
CollisionOffset.y = 0;
CollisionOffset.z = 10;
AddColl(you);

}

function RollingCarAuto
{

while (1)
{
	RollCarF();
	if (Currentcar==my._carorder)
	{
		cameraction();
	}

	wait(1);
	you= Pointer_To_Entity( my.LeaderId);
if ((frc(my.CarlastRoll / 90) == 0)  && ( abs(you.CarAcedant) < 1 )){
break;
}
}
if (random(10)>5)
{
wait (100);
	my.CarRoll =  0;

MovingAutoCar();
}else
{
	create( <dust.mdl>, my.pos,AtomicExplosion);
	carexplosion();
}

}

function RollingCar
{

while (1)
{
	RollCarF2();

	if (Camra2Player!=0){
	TPsCamera(me);}
	my.MyTilt += key_pgup - key_pgdn;

	wait(1);
if (key_y)
{
break;
}
if ((frc(my.CarlastRoll / 90) == 0) && ( my.carforce == 0 )){
{
	create( <dust.mdl>, my.pos,AtomicExplosion);
	create(<exwhell.mdl>,my.pos,FlyingPart);
	you.pan = my.pan+90;
	carexplosion();
	return;

}
}

MovingPlayerCar();

}

function carexplosion()
{
exclusive_entity;
removecoll(Pointer_To_Entity( my.LeaderId));
you = my.LeftWheel;
remove you;
you = my.RightWheel;
remove you;
you = my.LeftBackWheel;
remove you;
you = my.RightBackWheel;
remove you;

my.entity1 = Pointer_To_Entity( my.LeaderId);
remove my.entity1;

you = my.RightFlash;
remove you;
you = my.LeftFlash;
remove you;
you = my.brightid;
remove you;
if (MyExName(my,WheelName))
{
	Morph WheelName,  me;	 
}
}

function MovingAutoCar
{

while (1)
{
	my.CarCurrentGear= min(4,(my.CarForce+1)/20);
	 temp.x = 0;
	 temp.y = 0;
	 temp.z = 0;
	_car_DPath();

	 if (my.CarBlend==0)
	 {
	  SeeTarget();
	 }

	CarMForce();
	Car_Roll();
	//RotatByGround();
        if (my.Carwheel)
        {
 	 CarAttach();
        }
	CarBodyRoll();
	PosBright();
	you= Pointer_To_Entity( my.LeaderId);
	if ( (abs(you.RollAcedant)> 25)&&(abs(you.CarAcedant)> 25))
	{
		RollingCarAuto();
		return;
	}
	//if (Camra2Player!=0){
	//TPsCamera(me);}

	my.MoveTimer += 1;
	you = Pointer_To_Entity( my.LeaderId);
	if (you.OwnLife<=-100)
	{ 
		carexplosion();
		return;
	}
	my.MyTilt += key_pgup - key_pgdn;
	wait(1);
}

}

function MovingPlayerCar
{

while (1)
{
	my.CarCurrentGear= min(4,(my.CarForce+1)/20);
	_car_intent();
	// SeeTarget();
	CarPForce();
	Car_Roll();
	RotatByGround();

	CarAttach();

	Car_Roll();
	CarBodyRoll();
	PosBright();
	carrolle = my.LastGround;

	you= Pointer_To_Entity( my.LeaderId);
	if ( (abs(you.RollAcedant)> 25)&&(abs(you.CarAcedant)> 25))
	{
	RollingCarAuto();
	return;
	}

	if ( abs(my.roll) >= my.ShocksMaxAngle*2 && my.CarForce > 50)
	{

	RollingCar();
	return;
	}

	if (Camra2Player!=0){
	TPsCamera(me);}
	my.MyTilt += key_pgup - key_pgdn;


wait(1);
}
}

function ddsaa()
{
while (1)
{ ss+=1;
 my.skill38 =0;
while(my.skill38<8)
{
 myacc(me,"weqa");
 my.skill38 +=1;
}
wait(1);
}

}

action car4wheelacs
{
 if (my._carorder==20)
 {
  car4wheelMerka();
  return;
 }
CarInit();
ddsaa();
}

// uses _CarOrder ,CarWieght, ShocksForce, ShocksMaxAngle, EngineForce, GearSpeed, EngineProg, BreakerForce
// uses CarLevel
action car4wheel
{
wait(10);
my.OwnType = TypeOfPCars;

//my.invisible =1;

 if (my._carorder==20)
 {
  car4wheelMerka();
  return;
 }
CarInit();
create(<CarSmoke.tga>,my.pos,Mytarget);
MovingPlayerCar();

}

// uses _CarOrder ,CarWieght, ShocksForce, ShocksMaxAngle, EngineForce, GearSpeed, EngineProg, BreakerForce
// uses CarLevel
action car4wheelauto
{
wait(10);
my.OwnType = TypeOfCars;
my.CarBlend = 0;//random(100)>60;

 if (my._carorder==20)
 {
  car4wheelMerkauto();
  return;
 }

 if (my._carorder==19)
 {
  Mallalaauto();
  return;
 }

CarInit();

if (random(10)>5)
{
ent_path("path_000");
}else
{
if (random(10)>5)
{
ent_path("path_001");
}else
{
ent_path("path_002");

}

}
ent_waypoint(my.cartarget_x,1);
create(<CarSmoke.tga>,my.pos,Mytarget);

you = Pointer_To_Entity( my.LeaderId);
if (you==0)
{
	exit;
}

MovingAutoCar();
}
function movemeauto()
{
while (1)
{
	my.CarCurrentGear= min(4,(my.CarForce+1)/20);
	 temp.x = 0;
	 temp.y = 0;
	 temp.z = 0;
	_car_DPath();

	 /*if (my.CarBlend==0)
	 {
	  SeeTarget();
	 }*/

	CarMForce();
	Car_Roll();
	RotatByGround();
        if (my.Carwheel)
        {
 	 CarAttach();
        }
	CarBodyRoll();
	PosBright();
	you= Pointer_To_Entity( my.LeaderId);
	if ( (abs(you.RollAcedant)> 25)&&(abs(you.CarAcedant)> 25))
	{
		RollingCarAuto();
		return;
	}
	if (Camra2Player!=0){
	TPsCamera(me);}

	my.MoveTimer += 1;
	you = Pointer_To_Entity( my.LeaderId);
	if (you.OwnLife<=-100)
	{ 
		carexplosion();
		return;
	}
	my.MyTilt += key_pgup - key_pgdn;
	wait(1);
}
}

function movemeauto2()
{
while (1)
{
if (Camra2Player!=0){
	TPsCamera(me);}
	my.CarForce = min( my.CarForce +0.1,50);

vec_set(point_move.x,my.cartarget_x);
if ( EDistance(point_move,me)<500) 
{
	ent_nextpoint(my.cartarget_x);
}

	temp.x = my.cartarget_x - my.x;
	temp.y = my.cartarget_y - my.y;
	temp.z = my.cartarget_z - my.z;
	vec_to_angle( my_angle, temp);

	temp.x = my.CarForce;
	temp.y = 0;
	result = NSonar(me);
	temp.z = -result;
	
	vec_rotate( temp, my.pan);

	vec_add( my.pos, temp);
	my.pan = nearangle( my.pan , my_angle, 1);
	my.skill29 = my.pan;
	my.MyTilt += key_pgup - key_pgdn;
	my.unlit =TestACollsion( my);
wait(1);
}
}

/*aaaaaaaaaaaaaaaaaaaaaaaaaa*/

function CarFixedEvent()
{ 
 if (event_type  == event_entity)
 {
	var Newtargetx = target.x;
	var Newtargety = target.y;
	var Newtargetz = target.z;
	var ggg = 0;

	ggg = abs(you.CarForce)*you.wieght;
	you.CarForce = -you.CarForce*0.5;
	entiy = my;
//	entiy.flag1 = 1;
//	entiy.epassable = 1;

	 while (ggg>0)
	 {

		temp.x = Newtargetx - you.x;
		temp.y = Newtargety - you.y;
		temp.z = Newtargetz - you.z;
		vec_to_angle( my_angle, temp);
		my_angle.pan -= my.pan;
		my_angle.tilt = 0;
		temp.x = abs(ggg)/my.wieght;
		temp.y = 0;
		temp.z = 0;
		vec_rotate( temp, my_angle);
		move( my, temp, nullskill);
		ggg = nearnumber( ggg, 0, my.wieght); 
		temp.x = my.x - Newtargetx;
		temp.y = my.y - Newtargety;
		temp.z = my.z - Newtargetz;
		vec_to_angle( my_angle, temp);
		my.pan = nearangle( ang(my.pan), ang(my_angle), 1);

	 wait(1);
	 } 
	entiy = my;
//	entiy.epassable = 0;
//	entiy.flag1 = 0;
 }
}

action ExplodedThing
{

	wait(10);
	my.OwnType = TypeOfCars;
	my.epassable = 0;
	my.CarBlend = 0;

	my.max_x *= 2.2;
//	my.passable = 1;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	my.wieght = 100;
	AddColl(my);
	my.event = CarFixedEvent;
}


action Moving_Car
{

	wait(10);
//	my.passable = 1;
	my.OwnType = TypeOfCars;
	my.CarBlend = 0;

	my.max_x *= 2.2;
	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 10;
	AddColl(my);
	my.wieght = 50;
	my.event = CarFixedEvent;
	while (1)
	{
	if (Camra2Player!=0){
		TPsCamera(me);}

		my.CarForce = nearnumber(max(min( my.CarForce +key_force.y*10,90),-100),0,2.5);
		my.unlit =TestACollsion( my);

		temp.x = my.CarForce ;
		temp.y = 0;
		result = NSonar(me);
		temp.z = -result;

		move( me, temp, nullskill);
		my.pan = nearangle( my.pan , my.pan-key_force.x, 1);
		my.MyTilt += key_pgup - key_pgdn;
	wait(1);
	}

}
