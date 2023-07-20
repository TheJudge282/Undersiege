function Merkavara_Event()
{
	if( event_type == event_detect)
	{
		if ((you.owntype==_type_player))
		{
			return;
		}
	}
}
function turnupper2target()
{

	PosYouMe( me, my.RightWheel);
	you = Pointer_To_Entity( my.EnemyId);
	if (you!=0)
	{
/*	if (you.ownlife<=-100)
	{	
		temp.x = my.cartarget_x - my.x ;
		temp.y = my.cartarget_y - my.y ;
		temp.z = my.cartarget_z - my.z ;
	}else
	{*/
		temp.x =  you.x- my.x ;
		temp.y =  you.y- my.y ;
		temp.z =  you.z- my.z ;	
	//}
	}else
	{
	temp.x = my.cartarget_x - my.x ;
	temp.y = my.cartarget_y - my.y ;
	temp.z = my.cartarget_z - my.z ;
	
	}	    
	you = my.RightWheel;
	you.tilt = my.tilt;
	you.roll = my.roll;
	vec_to_angle( my_angle, temp);
	you.pan = NearAngle( you.pan, my_angle.pan, 2);

	PosYouMe( me, my.LeftWheel);
	AngYouMe( you, my.LeftWheel);
	you = my.LeftWheel;
	temp.x = max(0, (my_angle.tilt+4)*100/90);
	set_frame( you, wWalk,  temp.x);
	
}

function Uturnupper2target()
{

	PosYouMe( me, my.RightWheel);

	you = my.RightWheel;
	you.tilt = my.tilt;
	you.roll = my.roll;
	you.pan = my.pan + my.cartarget_x;

	PosYouMe( me, my.LeftWheel);
	AngYouMe( you, my.LeftWheel);
	you = my.LeftWheel;
	temp.x = max(0, my.cartarget_y);
	set_frame( you, wWalk,  temp.x);
	
}


function FireFromTheBrj()
{
entiy = me;
me = my.LeftWheel;
my.mytilt = entiy.cartarget_y*0.25+45;
create( <bullet_rbg.mdl>, temp, Pazoka_Bullet);

}


function MerkavaFiringAuto()
{
var Pasrt;
while(1)
{/*
	if (random(100)>75)
	{
	Short_GunFlash( my.RightWheel , 46, 34);
	}
*/
	you = Pointer_To_Entity( my.EnemyId);
	if (you!=0)
	{
	if ((you.ownlife<=-100)||(vec_dist(you.pos,my.pos)>2000))
	{
		my.EnemyId=0;
		you=0;
	}
	}

	if ((you!=0)&&(random(100)>97))
	{
	 vec_for_vertex(temp,  my.LeftWheel, 13);
	 vec_for_vertex(my_angle, my.LeftWheel, 5);

	 my_angle.x = temp.x - my_angle.x;
	 my_angle.y = temp.y - my_angle.y;
	 my_angle.z = temp.z - my_angle.z;
	 vec_to_angle( my_angle, my_angle);
	 vec_for_vertex( temp, my.LeftWheel, 13);
	 FireFromTheBrj();
	 Pasrt=0;
	 while (Pasrt<100)
	 {
	 
		Pasrt += 1;
		temp2.x= random(2)-1;
		temp2.y= random(2)-1;
		temp2.z= random(1)-0.5+1;
	        vec_for_vertex( temp, my.LeftWheel, 13);
		temp.x+=random(10)-5;
		temp.y+=random(10)-5;
		temp.z+=random(10)-5;
		effect(Blacksmoke_Trail,1,temp,temp2);

	 }

	}

wait (1);
}
}

function Merkavafiring()
{
var Pasrt;
while(1)
{
	if (key_ctrl || mouse_left)
	{
	 vec_for_vertex(temp,   my.LeftWheel, 13);
	 vec_for_vertex(my_angle, my.LeftWheel, 5);

	 my_angle.x = temp.x - my_angle.x;
	 my_angle.y = temp.y - my_angle.y;
	 my_angle.z = temp.z - my_angle.z;
	 vec_to_angle( my_angle, my_angle);
	 vec_for_vertex( temp, my.LeftWheel, 13);
	 FireFromTheBrj();
		Pasrt=0;
	 while (Pasrt<100)
	 {
	 
		Pasrt += 1;
		temp2.x= random(2)-1;
		temp2.y= random(2)-1;
		temp2.z= random(1)-0.5+1;
	        vec_for_vertex( temp, my.LeftWheel, 13);
		temp.x+=random(10)-5;
		temp.y+=random(10)-5;
		temp.z+=random(10)-5;
		effect(Blacksmoke_Trail,1,temp,temp2);

	 }

	 while(key_ctrl || mouse_left)
	  {
	   wait (1);
		}
	}

wait (1);
}
}

function MerkAtMove()
{

	CarMForce();

	my.roll = 0;
	you = Pointer_To_Entity( my.LeaderId);
	you.pan =  my.pan ;
	vec_set( my.x, you.x);

	//RotatByGround();
	Uturnupper2target();

	pos_by_vertex( my.RightFlash, me, 37);
	pos_by_vertex( my.LeftFlash, me, 12);


}


function MerkAAtMove()
{

	CarMForce();

	my.roll = 0;
	you = Pointer_To_Entity( my.LeaderId);
	you.pan =  my.pan ;
	vec_set( my.x, you.x);

	//RotatByGround();
	turnupper2target();

	pos_by_vertex( my.RightFlash, me, 37);
	pos_by_vertex( my.LeftFlash, me, 12);


}
function MovingMerkava
{

while (1)
{
	_tank_intent();

	my.cartarget_x -= temp.y *10;
	my.cartarget_y = max( 0, min( my.cartarget_y + temp.z , 90 ) );

	MerkAtMove();

	if (Camra2Player!=0){
	TPsCamera(me);}
	my.MyTilt += key_pgup - key_pgdn;


	my.MoveTimer += 1;
wait(1);
}

}

function MerkavarMovAuto()
{

while (1)
{
	_car_DPath();

	MerkAAtMove();

	you = Pointer_To_Entity( my.EnemyId);
	if (you==0)
	{

 		temp.pan = 360;
		temp.tilt = 180;
		temp.z = 1000;
		scan(my.pos,my_angle,temp);

	}
	my.MoveTimer += 1;
wait(1);
}

}

function merkavaInit()
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
my.CarWieght = 0.1; 
}

my.ShocksForce = 1;
my.passable = 1; 
my.ShocksMaxAngle = 10;
my.CarBreakerForce = 0.5;
my.CarLevel = 1;

my.CarCurrentGear= 4;
my.EngineForce= 10;
my.GearSpeed = 0.2;

create( <Up_body.MDL>, my.pos, wheler);
create( <Bustone.MDL>, my.pos, whelel);

create( <ambulance.mdl>, my.pos, CarEngine);

create( <ambulL.tga>, my.pos, Ambulancelightr);
create( <ambulL.tga>, my.pos, Ambulancelightl);

create( <ambulL.tga>, my.pos, ddss);
you = Pointer_To_Entity( my.LeaderId);
you.max_x *= 3.5;
you.max_y *= 2;

AddColl(you);
my.enable_scan = on;
my.enable_detect = on;
my.event = Merkavara_Event;

/*while (1)
{
	testbox(my.LeaderId);
	wait(1);
}*/
}

function car4wheelMerka
{
merkavaInit();
Merkavafiring();
MovingMerkava();
}

function car4wheelMerkauto
{
merkavaInit();
ent_path("RoodPath");
ent_waypoint(my.cartarget_x,1);
MerkavaFiringAuto();
MerkavarMovAuto();
}


function MerkavaCollision(TCMe)
{
my = TCMe;
var Result;
Result = 0;
	CollisionDimension.x = my.max_x;
	CollisionDimension.y = my.max_y;
	CollisionDimension.z = my.max_z*0.75;
	CollisionPostion.x = 50;
	CollisionPostion.y = 0;
	CollisionPostion.z = 10;
	vec_rotate( CollisionPostion, my.angle);
	vec_add( CollisionPostion, my.x);
	vec_set( CollisionAngle,my.pan);

	if (ModelCollision())
	{
		Result=1;		
	}
	
	CollisionDimension.x = my.max_x * 0.5;
	CollisionDimension.y = my.max_y * 0.5;
	CollisionDimension.z = my.max_z * 0.5; 
	vec_set( CollisionPostion, my.x);
	CollisionPostion.z += my.max_z;
	vec_set( CollisionAngle,my.pan);

	if (ModelCollision())
	{
		Result=1;		
	}

CollisionDetection.x = Result;
return(Result);

}

define	_MyUpBody , skill4;
define	_MyBustone, skill5;
define	_UpperPan , skill6;
define	_ShotPazoka , flag1;

function shotfromMerkahead()
{
	you = my._MyUpBody;
	if (you._signal==0)
	{	return;}
	you.enemyid = my.enemyid;
	my = you;

	WeaponSound3d( lmg);
	Short_GunFlash( my, 52, 51);
	MalalehDamege(50,1,1,52);
}


function PosMyPart()
{
	//playsound
	temp.x = 0;
	temp.y = 0;
	temp.z = 10;	
	vec_add(temp,my.pos);
	
	you = my._MyUpBody;
	vec_set(you.pos,temp);
	you._signal = my._signal;
	if (my._signal == 0)
	{
		you.pan = nearangle( you.pan, my.pan + my._UpperPan, 2);
		if (abs(ang(you.pan-my.pan))>2)
		{//playsound
		}
	}else
	{
		you.enemyid = my.enemyid;
		entiy = pointer_to_entity(my.enemyid);
		temp.x = entiy.x - my.x;
		temp.y = entiy.y - my.y;
		temp.z = 0;
		vec_to_angle( my_angle, temp);
		you.pan = nearangle( you.pan, my_angle, 1);
		you._signal = abs(ang(you.pan-my_angle))<2;
		
		if (you._signal==0)
		{//playsound
		}
	}
	temp.x = 0;
	temp.y = 0;
	temp.z = 10;	
	vec_add(temp,my.pos);
	entiy = me;	
	my = my._MyUpBody;
	you = my._MyBustone;
	vec_set( you.pos,temp);	
	if (entiy._signal == 0)
	{
			vec_set( you.pan, my.pan);
			if (entiy._ShotPazoka)
			{

			if (you.frameanim>-25)
			{
				vec_for_vertex( FirstPoint, you, 18);
				temp2.x = random( 5)+ 5;
				temp2.y = 0;
				temp2.z = random( 5)- 2.5;
				vec_rotate( temp2, you.pan);
				effect( Black_smoke2up, 1, FirstPoint, temp2);
			}
			if (you.frameanim==0)
			{
				my.MyTilt = 51.7391;
				create ( <bullet_rbg.mdl>, FirstPoint, pazoka_bullet);
				you = my._MyBustone;
			}
			you.frameanim -= 2;
			temp.x = 100+you.frameanim;
			set_frame( you, wwalk, temp.x);
			if (you.frameanim<-100)
			{
				you.frameanim = 0;
				entiy._ShotPazoka = 0;
			}
		}else
		{
			you.frameanim = 0;
			set_frame( you, wwalk, you.frameanim);
		
		}
	}else
	{
		you.enemyid = my.enemyid;
		entiy = pointer_to_entity(my.enemyid);
		temp.x = entiy.x - my.x;
		temp.y = entiy.y - my.y;
		temp.z = entiy.z - my.z;
		vec_to_angle( my_angle, temp);
		you.pan = my.pan;
		you.tilt = nearangle( you.tilt, min(35,max(-2.5, ang(my_angle.tilt))), 1);
	}
}

function upperpart()
{
	create(<Bustone.mdl>,my.pos,null);
	my._MyBustone = you;
	my.passable = 1;
	you.passable = 1;
	}


function merkavaexplode()
{
	you = my._MyUpBody;
	if (you)
	{
		you = you._MyBustone;
		remove you;
	}
	you = my._MyUpBody;
	remove you;

	removecoll(me);
	CameraMoveExplo();
	morph ( <marcava.mdl>, me);
	my.frameanim = 0;
	my.passable = 0;
	while (my.frameanim <100000)
	{

		temp.x = sin(my.frameanim*10)*explosionscale*2;
		temp.y = cos(my.frameanim*10)*explosionscale*2;
		temp.z = (10+random(10))*explosionscale;
		my_angle.x = (100-random(200))*explosionscale;
		my_angle.y = (100-random(200))*explosionscale;
		my_angle.z = (-random(24))*explosionscale;
		vec_add( my_angle, my.pos);
		effect( BlackMinismokeup, 1, my_angle, temp);	

		my.frameanim += 1;
		ent_frame( "explo", my.frameanim*4);
		wait(1);
	}
}

function merkavaevent()
{
if (event_type == event_detect && you._type == _type_player)
{
		my.enemyid = entity_to_pointer(you);
		if(CheckVisPosEnemy()==1) 
		{
			my._signal = 1;
			my.enemyid = entity_to_pointer(you);
		}
}
}

function SmokeMeFromAshtman(cme,PushForce)
{
me  = cme;
			vec_for_vertex( temp, me, 79);
			temp.x += random(50)-25;
			temp.y += random(50)-25;
			temp.z -= random(25)+25;
		
			my_angle.x = -(random(10)+  5)*PushForce;
			my_angle.y =  (random(1)- 0.5)*PushForce;
			my_angle.z =  (random(1)+ 0.5)*PushForce;
			vec_rotate( my_angle, my.pan);
			effect( BigBlacksmoke_Trail, 1, temp, my_angle);

}


sound TankSound , <tankloop.wav>;

function Merkava()
{
//wait(40);
create(<Up_body.mdl>,my.pos,upperpart);
my._MyUpBody = you;

my.passable = 1;
my.max_x *= 2.0;
my.max_y *= 1.5;
my.max_z *= 1.2;
CollisionOffset.x = 50;
CollisionOffset.y = 0;
CollisionOffset.z = 25;
my.CollFunction  = Function_To_Pointer( "MerkavaCollision");
my.enable_detect = 1;
my.enable_scan = 1;
my.event = Mallalaevent;
my._type = TypeOfEngines;
AddColl(my);

my.enable_detect = 1;
my.enable_scan = 1;
my.event = merkavaevent;

ent_path("RoodPath");
ent_waypoint( my._target_x, 1);

var iCounter = 0;
var TankSoundh=0;
while (1)
{
	if (snd_playing(TankSoundh) == 0)
	{
		play_entsound(me,TankSound,800);
		TankSoundh = result;
	}

	if (my._health <-1100)
	{
		merkavaexplode();
		return;
	}

	if (my._health <-100)
	{
		if (random(100)>80)
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
	}

	if (my._signal==0)
	{
	 if (my._ShotPazoka==0)
	  {
		vec_set( point_move.x, my._target_x);
		if ( EDistance( point_move, me)<50) 
		{
			ent_nextpoint(my._target_x);
			iCounter += 1;
			if (iCounter == 2)
			{	
				CountDownToEx();
				
			}
			if (iCounter == 3)
			{
				//var icounter;
				//you = pointer_to_entity(my._MyUpBody);
				//you.pan -=  45;
				break;
			}

		}
		my.force = nearnumber( my.force, 5, 0.1);
		temp.x = my._target_x - my.x;
		temp.y = my._target_y - my.y;
		temp.z = 0;
		vec_to_angle( my_angle, temp);
		my.pan = nearangle( my.pan, my_angle, 6);
		my.flag2 = abs(ang(my.pan - my_angle))>5;
		temp.x = my.force;
		temp.y = 0;
		sonar me, 40000;
		temp.z = -result;
		move( me, temp, nullskill);
		my.FrameAnim +=0.5;
		my.skin = int(frc(my.FrameAnim/5)*5);
		if (random(100)>50)||(my.force <4)||(my.flag2)
		{
			SmokeMeFromAshtman(me, 0.1+0.5*((my.force <4)||(my.flag2)));
		}

	  }

		//temp.pan = 360;
		//temp.tilt = 360;
		//temp.z = 10000;
		//indicator = _watch;
		//scan (my.x,my.pan,temp);
	}else
	{
		//my.force = 0;
		//if(CheckVisPosEnemy()==1) 
		//{
		//	if (random(100)>50)
		//	{
		//		shotfromMerkahead();
		//	}	
		//}else
		//{
			my._signal = 0;
		//}
	}
	//if (my._ShotPazoka==0)
	//{
	//	//my._UpperPan = sin(vec_length(my.pos))*100;
	//	my._ShotPazoka = random(100)<0.1;
	//}
	PosMyPart();
wait(1);
}

	clip_range = 3000;
	while (1)
	{
		if (my._health <-1100)
		{
			merkavaexplode();
			return;
		}

		if (my._health <-100)
		{
			if (random(100)>80)
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
		}
		wait(1);
	}
}



