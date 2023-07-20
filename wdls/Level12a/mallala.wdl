
function Mallalaevent()
{


	if event_type == event_scan && indicator == _explode
	{	
		my._health-=100;
		return;
	}

	if event_type == event_scan && indicator == _gunfire && my._state == _state_wait
	{ 
		my.EnemyId = you.EnemyId;
		my._signal = _hear_fire;
		return;
	}

	if event_type == event_detect && you._type == _type_player
	{
		my.EnemyId = Entity_To_Pointer( you);

		if(CheckVisEnemy(0)==1) 
		{
			my._signal = _detecte_enemy;
		}
		return;
	}

	if (event_type == event_shoot && indicator == _gunfire)
	{ 
		//my._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		my.GotHit = 100;
	}
}

function Mallaupper2target()
{

	PosYouMe( me, my.RightWheel);
	AngYouMe( me, my.RightWheel);
	/*you = my.RightWheel;
	vec_to_angle( my_angle, temp);
	you.pan = my_angle.pan;//nearnumber( you.pan, my_angle.pan, 5);*/
	
}

function CameraMoveExplo()
{
	var oldpos;
	oldpos = my.z;
	my.z+=50;
	play_entsound( me, MallaExplosion, 1000000);
	while (oldpos < my.z)
	{
		my.flag8    = abs( my.flag8 -1);
		my.roll    -= cos( my.flag8*180)*10;
		camera.roll+= cos( my.flag8*180)*1.5;
		//sonar me, 4000;
		//if (result==0)
		//{ break;}
		my.z -= 5;
		wait(1);
	}
	camera.roll=0;

}

function Mallalaexplosion()
{
	exclusive_entity;
	my.entity1 = Pointer_To_Entity( my.LeaderId);
	removecoll( my.entity1);
	you = my.RightWheel;
	remove you;
	my.entity1 = Pointer_To_Entity( my.LeaderId);
	remove my.entity1;
	you = my.RightFlash;
	remove you;
	you = my.LeftFlash;
	remove you;
	if (MyExName(my,WheelName))
	{
		Morph WheelName,  me;	 
	}
	//Game_State[0]=1;
	CameraMoveExplo();
  my.skill1= 0;
	while (my.skill1<100)
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
	 wait(4);
	}

}

function shotfromhead()
{
	me = Pointer_To_Entity( my.LeaderId);
	MalalehDamege(50,1,1,33);
}

function MallalaFiringAuto()
{
var Pasrt;
	you = Pointer_To_Entity( my.LeaderId);
	my.EnemyId = you.EnemyId;
while(1)
{
	you = Pointer_To_Entity( my.LeaderId);
	if (you._health<-200)
	{
		return;
	}

	you = Pointer_To_Entity( my.EnemyId);

	temp.x = you.x - my.x; 
	temp.y = you.y - my.y; 
	temp.z = you.z - my.z; 
	vec_to_angle( my_angle, temp);

	you = my.RightWheel;
//	vec_to_angle( my_angle, temp);
	you.pan = my_angle.pan;
	if (random(100)>20)
	{
	you = Pointer_To_Entity( my.EnemyId);
	trace_mode = ignore_me + ignore_passable + ignore_sprites;
	trace( my.pos, you.pos);
	if (you==Pointer_To_Entity( my.EnemyId))
	{

		WeaponSound3d( lmg);
		Short_GunFlash( my.RightWheel, 96, 116);
		shotfromhead();

	}
	}

wait (2);
}
}


function MallalatMove()
{

	CarMForce();

	my.roll = 0;
	you = Pointer_To_Entity( my.LeaderId);		
	you.pan =  my.pan ;
	vec_set( my.x, you.x);

	RotatByGround();

	Mallaupper2target();

	pos_by_vertex( my.RightFlash, me, 52);
	pos_by_vertex( my.LeftFlash, me, 64);

}

function ScanMyEngine()
{

my = Pointer_To_Entity( my.LeaderId);
	if (my._signal == _hear_fire)
	{
		return(1);
	}
	temp.pan = 360;
	temp.tilt = 360;
	if (level.z==2)
	{temp.z = 2500;
	}else
	{temp.z = 1100;
	}
	indicator = _watch;
	scan (my.x,my.pan,temp);
	if (my._signal == _detecte_enemy)
	{
		return(1);
	}
return(0);
}

function MallalAttack()
{
exclusive_entity;
mallalaFiringAuto();
while (1)
{
	you = Pointer_To_Entity( my.LeaderId);
	if (you._health<-200)
	{
		Mallalaexplosion();		
		return;
	}

	wait(1);
}
}

function MoveSoundMalla()
{
while (1)
{
	play_entsound( me, MallaMove, 10000);
waitt(5);
}
}

function MoveMallala()
{
you = Pointer_To_Entity( my.LeaderId);
you._signal = 0;
//MoveSoundMalla();
while (1)
{
	//MallaShowCollision(me);
	you = Pointer_To_Entity( my.LeaderId);
	if (you._health<-200)
	{
		Mallalaexplosion();		
		return;
	}
	my.skin+=speed/100;
	if (my.skin>3)
	{my.skin=1;
	}
	_car_DPath();
	MallalatMove();
	//if (random(100)>75)
	//{
	/*temp2.x = -50; temp2.y=random(20);temp2.z=1; vec_rotate( temp2, my.pan);
	vec_for_vertex(temp,me,176);
	effect( Vihicle_Smoke, 1, temp, temp2);
	vec_for_vertex(temp,me,175);
	effect( Vihicle_Smoke, 1, temp, temp2);*/
	//}

if (Currentcar==carsnum+2){
	carspeed = abs(my.CarForce)+random(1)/2;
	carsgear = abs(int(my.CarCurrentGear))+random(1)/2+1;

	cameraction();}

	my.MoveTimer += 1;
	if ( ScanMyEngine() )
	{
		MallalAttack();
		return;
	}
wait(1);
}

}

function MallalaInit
{
if (MyName(my,WheelName))
{
	Morph WheelName,  me;	 
}
else
{
exit;
}
if (my.CarWieght ==0)
{
my.CarWieght = 100; 
}

my.ShocksForce = 1;
//my.overlay = 1;
my.passable = 1; 
my.ShocksMaxAngle = 10;
my.CarBreakerForce = 0.5;
my.CarLevel = 0;

my.CarCurrentGear= 4;
my.EngineForce= 5;
my.GearSpeed = 1;

create( <MallaU.MDL>, my.pos, wheler);

create( <ambulance.mdl>, my.pos, CarEngine);

create( <ambulL.tga>, my.pos, Ambulancelightr);
create( <ambulL.tga>, my.pos, Ambulancelightl);

//create( <ambulL.tga>, my.pos, ddss);
you = Pointer_To_Entity( my.LeaderId);

you.max_x *= 2.2;
you.max_z *= 1;
CollisionOffset.x = 0;
CollisionOffset.y = 0;
CollisionOffset.z = 10;
you.CollFunction  = Function_To_Pointer( "MallaCollision");
you.enable_detect = 1;
you.enable_scan = 1;
you.event = Mallalaevent;
wait(5);
you = Pointer_To_Entity( my.LeaderId);
AddColl(you);

}

function Mallalaauto
{
my.shadow = shadowenable;
MallalaInit();
//ent_path("path_000");
//ent_waypoint(my.cartarget_x,1);
MoveMallala();
//create( <pointhide1.mdl>, my.x, SldAnyLeader);
}

