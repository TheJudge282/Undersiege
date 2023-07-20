
function CheckVisMalEnemy(vnum)
{
	var res=0;
	entiy = Pointer_To_Entity( my.EnemyId);

	my = pointer_to_entity(my.leaderid);
	trace_mode = ignore_me + ignore_passable + ignore_passents + ignore_sprites;
	vec_for_vertex( temp, my, vnum);
	trace( temp, entiy.pos);
	my.EnemyHeight = 0;
	res = (you == entiy)||( result==0 );
	if (res==0)
	{
	  vec_set( temp2, entiy.pos);
	  temp2.z+= entiy.max_z;
	  trace( temp, temp2);
	  my.EnemyHeight = entiy.max_z*0.75;
	  res = (you == entiy)||( result==0 );
	  if (key_f)
	  {
		  create( <ryfire.tga>, temp2, mytoremove);
	  }
	}
	return(res);
}

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

		if(CheckVisMalEnemy(96)==1) 
		{
			my._signal = _detecte_enemy;
		}
		return;
	}
}

function Mallaupper2target()
{
	you = pointer_to_entity(my.leaderid);
	PosYouMe( me, you);
	AngYouMe( me, you);
	
}

function CameraMoveExplo()
{
	var oldz;
	oldz=my.z;
	my.z+=50;
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
	camera.roll=0;

}

function Mallalaexplosion()
{
	exclusive_entity;
	removecoll( my);
	you = pointer_to_entity(my.leaderid);
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
	you = my;
	my = pointer_to_entity(my.leaderid);
	my.enemyid = you.enemyid;
	Short_GunFlash( my, 96, 116);
	MalalehDamege(50,1,1,96);
}

function MallalaFiringAuto()
{
while(1)
{
	if (my._health<-200)
	{
		return;
	}

	you = Pointer_To_Entity( my.EnemyId);

	temp.x = you.x - my.x; 
	temp.y = you.y - my.y; 
	temp.z = you.z - my.z; 
	vec_to_angle( my_angle, temp);

	you = pointer_to_entity(my.leaderid);

	you.pan = my_angle.pan;
	if (random(100)>20)
	{
		if (CheckVisMalEnemy(96))
		{

			WeaponSound3d( lmg);
			shotfromhead();

		}
	}

wait (2);
}
}

function ScanMyEngine()
{
	if (my._signal == _hear_fire)
	{
		return(1);
	}
	temp.pan = 360;
	temp.tilt = 360;
	if (level.z==2)
	{temp.z = 1100;
	}else
	{temp.z = 5000;
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
	if (my._health<-200)
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
my._signal = 0;
while (1)
{
	if (my._health<-200)
	{
		Mallalaexplosion();		
		return;
	}
	my.skin+=speed/100;
	if (my.skin>3)
	{my.skin=1;
	}

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

function UpperMalPart()
{
	you.leaderid = entity_to_pointer(me);
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

create( <MallaU.MDL>, my.pos, UpperMalPart);

my.max_x *= 2.2;
my.max_z *= 1;
CollisionOffset.x = 0;
CollisionOffset.y = 0;
CollisionOffset.z = 10;
my.CollFunction  = Function_To_Pointer( "MallaCollision");
my.enable_detect = 1;
my.enable_scan = 1;
my.event = Mallalaevent;
my._type = TypeOfEngines;
AddColl(my);

}

function Mallalaauto
{
my.shadow = shadowenable;
MallalaInit();
	malalehpoint[malalehcount]=Entity_To_Pointer(me);
	malalehcount+=1;

//ent_path("path_000");
//ent_waypoint(my.cartarget_x,1);
MoveMallala();
//create( <pointhide1.mdl>, my.x, SldAnyLeader);
}

