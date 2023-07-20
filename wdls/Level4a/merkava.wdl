function Merkavara_Event()
{
	if( event_type == event_detect)
	{
		if ((you.owntype==_type_player))
		{
			if (you.OwnLife>-100)
			{
				my.EnemyId = Entity_To_Pointer( you);
				ShowMessage(5,146);
				Play_My_Sounds(4,0);
				me = 0;
				wait(25);
				VisMainMenu(1);
				MBackMenu.visible = 0;
				on_esc = 0;
				on_enter = LLoadLastSave;

			}
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

	//pos_by_vertex( my.RightFlash, me, 37);
	//pos_by_vertex( my.LeftFlash, me, 12);


}


function MerkAAtMove()
{

	//CarMForce();

	my.roll = 0;
	you = Pointer_To_Entity( my.LeaderId);
	you.pan =  my.pan ;
	vec_set( my.x, you.x);

	//RotatByGround();
	turnupper2target();

	//pos_by_vertex( my.RightFlash, me, 37);
	//pos_by_vertex( my.LeftFlash, me, 12);


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
	//_car_DPath();

	MerkAAtMove();

	you = Pointer_To_Entity( my.EnemyId);
	if (you==0)
	{

 		temp.pan = 360;
		temp.tilt = 180;
		temp.z = 1000;
		scan(my.pos,my_angle,temp);

	}
	//my.MoveTimer += 1;
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
ent_path("path_000");
ent_waypoint(my.cartarget_x,1);
MerkavaFiringAuto();
MerkavarMovAuto();
}