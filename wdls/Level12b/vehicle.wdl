function _car_DPath()
{
my.ambient = my.TraficLight*-100; 
my.CarBreaker  = 10;
if (my.TraficLight)
{
	CurntCar = my.TraficLight;
	if (CurntCar)
	{
	 if (CurntCar.traficstat == 0)
	  {

		temp.x = my.skill42- my.x;
		temp.y = my.skill43- my.y;
		temp.z = my.skill44- my.z;
//
		my.CarBreaker  = vec_length(temp) < 2000;
/*
		vec_to_angle( my_angle, temp);
		Lngth = vec_length(temp);
		temp.x = Lngth / 2;
		temp.y = 0;
		temp.z = 0;
		vec_rotate( temp, my_angle);
		vec_add(temp, my.x);
		create( <trf.mdl>, temp, MyCurrTrafic);
*/

	  }
	  else
	  {
		my.TraficLight = 0;
	  }
	}
}

//if ( max( abs( my.x -  my.cartarget_x), abs( my.y - my.cartarget_y ) ) < 500)
vec_set(point_move.x,my.cartarget_x);
if ( EDistance(point_move,me)<500) 
{
	ent_nextpoint(my.cartarget_x);
/*
	stemp.x = my.cartarget_x - my.x ;
	stemp.y = my.cartarget_y - my.y ;
	stemp.z = my.cartarget_z - my.z ;

	vec_to_angle( my_angle, stemp);
	stemp.x = 100 ;
	stemp.y = 0 ;
	stemp.z = 0 ;
	if ()
	{
	}
	my_angle.x = my.pan + 90;
	vec_to_angle( my_angle, stemp);*/
}

temp.x = my.cartarget_x - my.x;
temp.y = my.cartarget_y - my.y;
temp.z = my.cartarget_z - my.z;

vec_to_angle( my_angle, temp);
my_angle.pan -= my.pan;
my_angle.pan = ang(my_angle.pan);
//nshowmessage( mesg.string);
if (my.CarLevel)
{


if ( my.MoveTimer>20 )
{
if (abs(my_angle.pan) < 90)
{
	temp.x = 100;
}
else
{
	temp.x = -20;
}
my.MoveTimer=0;
}else{

	temp.x = my.LastMoveForce;
}

if (abs(my_angle.pan) < 90)
{
	my_angle.pan = maxminnum( my_angle.pan , 0.5);

	if (my.CarForce<0)
	{
	my.CarBreaker = my.CarBreakerForce;
	}else
	{
	my.CarBreaker = 0;
	
	}
}
else
{
	my_angle.pan = -maxminnum( my_angle.pan, 0.5);
	if (my.CarForce>0)
	{
	my.CarBreaker = my.CarBreakerForce;
	}else
	{
	my.CarBreaker = 0;
	
	}
}
}
else
{
	temp.x = 100;
	my_angle.pan = maxminnum( my_angle.pan , 0.5);

}

	my.LastMoveForce = temp.x;
}

function RotatByGround
{
	
	you = Pointer_To_Entity( my.LeaderId);
	you.passable = 1;
	trace_mode = ignore_me + ignore_passable;
	var TempTarget;

	vec_for_vertex(temp, me, VertexFGra[my._carorder]);
	vec_set( TempTarget, temp);
	tempTarget.z-=10000;
	trace( temp, temptarget);
	vec_set( temp, target);

	vec_for_vertex(my_angle, me, VertexBGra[my._carorder]);

	vec_set( TempTarget, my_angle);
	tempTarget.z-=10000;
	trace( my_angle, temptarget);
	vec_set( my_angle, target);

	vec_sub( temp, my_angle);
	vec_to_angle( my_angle, temp);

	my.tilt = nearnumber( my.tilt  , my_angle.tilt, 0.4 *  my.carwieght);
	my.GravityWork = - my.tilt * my.carwieght/5;

	vec_for_vertex(temp, me, VertexLGra[my._carorder]);
	temp.z+=1000;
	vec_set( TempTarget, temp);
	tempTarget.z-=10000;
	trace( temp, temptarget);
	vec_set( temp, target);

	vec_for_vertex(my_angle, me, VertexRGra[my._carorder]);
	my_angle.z+=1000;

	vec_set( TempTarget, my_angle);
	tempTarget.z-=10000;
	trace( my_angle, temptarget);
	vec_set( my_angle, target);

	vec_sub( temp, my_angle);
	vec_to_angle( my_angle, temp);
	my.LastGround = nearnumber( my.LastGround, my_angle.tilt, 0.4 *  my.carwieght);
	you = Pointer_To_Entity( my.LeaderId);
	my.roll = my.currentroll+my.LastGround+you.RollAcedant+random(10)/100;
	//my.roll = maxminnum( my.currentroll  - ang(you.pan-my.pan), my.ShocksMaxAngle)+my.LastGround;

	//my.roll = my.currentroll;
	//you.passable = 0;


}

function CarMForce
{
	temp.x *= my.EngineForce;
	temp.x += my.gravitywork ;
	you = Pointer_To_Entity( my.LeaderId);

	my.CarForce = nearnumber( max(min( nearnumber( my.CarForce, temp, my.EngineProg/ my.CarWieght + abs(my.gravitywork/500)), Gears[abs(int(my.CarCurrentGear))] * my.GearSpeed/1),-Gears[abs(int(my.CarCurrentGear))] * my.GearSpeed) , 0, my.CarBreaker * my.BreakerForce) ;

	you.CarAcedant = nearnumber( you.CarAcedant, 0, my.wieght/20);
	you.RollAcedant = nearnumber( you.RollAcedant, 0, 1);

	my.CarRotation = nearnumber( max( min( my.CarRotation + my_angle.pan , 25), -25), 0 , min(0.1 * my.CarForce, 0.4));
//	str_for_num( mesg.string, my.CarRotation);

	temp.x = my.cartarget_x - my.x;
	temp.y = my.cartarget_y - my.y;
	temp.z = my.cartarget_z - my.z;

	temp.x = min( (my.CarForce /5 + abs(you.CarAcedant)/5)*speed/100, vec_length(temp));
	temp.y = 0;

	result = NSonar(me);

	temp.z = -result+10*my.scale_x;

	you = Pointer_To_Entity( my.LeaderId);
	you.carforce = my.carforce+ abs(you.CarAcedant)/5;
	you = Pointer_To_Entity( my.LeaderId); 
	/* //if (you.ambient==0)
	//{
		move( you, temp, nullskill);
		you = my.LeaderId; 
		my.pan +=  my.CarForce* my.CarRotation/250 + you.CarAcedant/2;
		vec_set( you.CarBPan, my.pan);
	//}

	TestACollsion( my.LeaderId);
*/
 CarMoveCollision();

}

function CarRotateCollision
{
		you = Pointer_To_Entity( my.LeaderId);
		you.skill11 +=  my.CarForce* my.CarRotation/250;
		if (TestCollsion(Pointer_To_Entity( my.LeaderId))==0)
		{
		you = Pointer_To_Entity( my.LeaderId);
		my.pan +=  my.CarForce* my.CarRotation/250+ you.CarAcedant/20;
		}

}

function CarMoveCollision
{
	you = Pointer_To_Entity( my.LeaderId);
	you.CarBPan= my.pan;
	you.CarBTilt= -my.tilt;
	you.CarBRoll= my.LastGround;
	you.carforce = my.carforce/5+ abs(you.CarAcedant)/5;
	you.skill11 = my.pan;
	if (TestCollsion(Pointer_To_Entity( my.LeaderId))==0)
	{
		you = Pointer_To_Entity( my.LeaderId);
		move( you, temp, nullskill);
		CarRotateCollision();
		//my.pan +=  my.CarForce* my.CarRotation/250;
	}else
	{

	Lngth.x = target.x - my.x;
	Lngth.y = target.y - my.y;
	Lngth.z = target.z - my.z;
	vec_to_angle(my_angle,Lngth);
	Lngth.x = 2* vec_length(Lngth);
	Lngth.y = 0;
	Lngth.z = 0;
	vec_rotate( Lngth, my_angle);
	vec_add( Lngth, my.pos);
	trace_mode = ignore_passable+ ignore_models+ ignore_sprites + ignore_maps;
	trace( my.pos, Lngth);
	vec_to_angle( my_angle, normal);
	my_angle.x = ang(my_angle.x);
	you = Pointer_To_Entity( my.LeaderId);
	if (my.carforce<0)
	{
	my_angle.y= ang(you.pan+180);
	}else
	{
	my_angle.y= ang(you.pan);
	
	}
	youpan = my_angle.x+random(10)/10;
	carpan = my_angle.y+random(10)/10;
	frictpan = int((ang(my.pan-my_angle.x)+180)/45)+random(10)/10;
	if (abs(ang(my_angle.x-my_angle.y))>90)
	{
			you.pan = my_angle.pan;
			if (tan(my.pan-my_angle.x)>0)
			{
			you.CarAcedant = abs(my.CarForce)/my.carwieght*10;
			}else
			{
			you.CarAcedant = -abs(my.CarForce)/my.carwieght*10;
			
			}
			my.CarForce /=my.carwieght;
			my.AccdentOrder = 7- int((ang(my.pan-my_angle.x)+180)/45+0.5);
			Accedant(my.AccdentOrder);
	}
	else
	{
		you = Pointer_To_Entity( my.LeaderId);
		move( you, temp, nullskill);
		CarRotateCollision();
		//my.pan +=  my.CarForce* my.CarRotation/250;
	
	}

	}

	carpan=carpan+(random(10)-5)/100;
	TestACollsion( Pointer_To_Entity( my.LeaderId));
}

function CarPForce
{
	temp.x *= my.EngineForce;
	temp.x += my.gravitywork ;

	you = Pointer_To_Entity( my.LeaderId);
	my.CarForce = nearnumber( max(min( nearnumber( my.CarForce, temp, my.EngineProg/ my.CarWieght*10 + abs(my.gravitywork/500)), Gears[abs(int(my.CarCurrentGear))] * my.GearSpeed/1),-Gears[abs(int(my.CarCurrentGear))] * my.GearSpeed) , 0, my.CarBreaker * my.BreakerForce) ;
//	my.CarForce = nearnumber( max(min( nearnumber( my.CarForce, temp, my.EngineProg/ my.CarWieght + abs(my.gravitywork/500)), Gears[abs(int(my.CarCurrentGear))] * my.GearSpeed*1.2),-Gears[abs(int(my.CarCurrentGear))] * my.GearSpeed) , 0, my.CarBreaker);
	 
	you.CarAcedant = nearnumber( you.CarAcedant, 0, my.wieght/20);
	you.RollAcedant = nearnumber( you.RollAcedant, 0, 1);

	my.CarRotation = nearnumber( max( min( my.CarRotation + my_angle.pan , 25), -25), 0 , min(abs(0.1 * my.CarForce), 0.4));
	my.AccdentAng = nearnumber( my.AccdentAng, my.CarRotation, 1);
	temp.x = my.CarForce /5 + abs(you.CarAcedant)/5;
	temp.y = 0;
	result = NSonar(me);

	temp.z = -result+20*my.scale_x;
	CarMoveCollision();

}

function CarBodyRoll
{
//	if (  (abs(my.roll) < 10)&&(abs(ang(you.pan-my.pan))<10) )

	if (  abs(my.roll) < 2 )
	{

		my.NearRoll += my.ShocksForceD*10 ;
		my.CarlastRoll = nearnumber( my.CarlastRoll, 0, my.ShocksForce);
		my.roll = my.CarlastRoll * sin( ang( my.NearRoll ) );

	}else{
	my.NearRoll = 0;}


}

function Car_Roll
{

	my.CarRoll = max( 0 , min( my.CarRoll - (my.CarWieght /5)  + abs( my.CarForce/3  * my.CarRotation/25 ), 25) );
	my.CarCurrentRotPos += my.CarForce /10;

	 if ( my.CarRotation>0)
	 {
	  my.currentroll = nearnumber( my.currentroll, my.CarRoll , 1);
	  my.ShocksForceD = -1;

	 }
	 else
	 {
	  my.currentroll = nearnumber( my.currentroll, -my.CarRoll , 1);
	  my.ShocksForceD = 1;

	 }
	you = Pointer_To_Entity( my.LeaderId);
	my.CarlastRoll = maxminnum(max(  my.CarlastRoll, my.currentroll + abs(you.RollAcedant) ), my.ShocksMaxAngle);

	//my.roll = my.currentroll;

//my.pan - my.currentroll*5;
	you.pan = nearangle( you.pan,  my.pan - my.currentroll*5 , 2);

	vec_set( my.x, you.x);

}
/*
function CarRoll
{

	my.CarRoll = max( 0 , min( my.CarRoll - (my.CarWieght /5)  + abs( my.CarForce/3  * my.CarRotation/50 ), 25) );
	my.CarCurrentRotPos += my.CarForce /10;

	 if ( my.CarRotation>0)
	 {
	  my.currentroll = nearnumber( my.currentroll, my.CarRoll , 1);
	  my.ShocksForceD = -1;

	 }
	 else
	 {
	  my.currentroll = nearnumber( my.currentroll, -my.CarRoll , 1);
	  my.ShocksForceD = 1;

	 }
	  my.CarlastRoll = min(max(  my.CarlastRoll, my.currentroll+  abs(maxminnum(ang(you.pan-my.pan),45))), my.ShocksMaxAngle);

	my.roll = my.currentroll;

	you = my.LeaderId;

	you.pan = nearangle( you.pan,  my.pan - my.currentroll*5 , 2);

	vec_set( my.x, you.x);

}*/

function CarAttach
{
	pos_mebyskill( my.LeftWheel);

	you = Pointer_To_Entity( my.LeaderId);
	
	you =  my.LeftWheel;

	you.pan +=  my.CarRotation*2;

	pos_mebyskill( my.RightWheel);
	you = my.RightWheel;
	you.pan += my.CarRotation*2;

	pos_mebyskill(  my.RightBackWheel);

	pos_mebyskill( my.LeftBackWheel);

	pos_by_vertex(  my.RightFlash, me, VertexRFlash[ my._carorder]);
	pos_by_vertex(  my.LeftFlash, me, VertexLFlash[ my._carorder]);

}

function RollCarF()
{

	//my.CarForce = nearnumber( my.CarForce+my.CarAcedant, 0, my.carwieght / 20);
	 

	//my.CarRotation = nearnumber( my.CarRotation , 0 , min(0.01 * my.CarForce, 0.4));
	you = Pointer_To_Entity( my.LeaderId);
	if ((frc(my.CarlastRoll / 90) != 0) && ( abs(you.CarAcedant) < 1 )){
		temp.x =  my.ShocksForceD+ my.gravitywork/5  ;

	}else{
	you.CarAcedant = nearnumber( you.CarAcedant, 0, my.wieght/20);
	temp.x =  my.gravitywork/50 + abs(you.CarAcedant);
	}
	temp.y = 0;
	result = NSonar(me);

	temp.z = -result+20*my.scale_x;
	you = Pointer_To_Entity( my.LeaderId);
	you.carforce = temp.x;
	you.CarBPan= my.pan;
	you.CarBTilt= my.tilt;
	you.CarBRoll= 0;
	//you.skill11 = my.pan;
	if (TestCollsion(Pointer_To_Entity( my.LeaderId))==0)
	{
		you = Pointer_To_Entity( my.LeaderId);
		move( you, temp, nullskill);
	}


	you = Pointer_To_Entity( my.LeaderId);
	my.CarCurrentRotPos += 10;

        my.CarlastRoll= nearnumber( ang(my.CarlastRoll + you.CarAcedant*0.5  ) ,int(my.CarlastRoll / 90)*90 , 2) ;

	vec_set( my.x, you.x);
	RotatByGround();
	my.roll = my.CarlastRoll;
       if (my.Carwheel)
       {
 	CarAttach();
      }

	PosBright();


}


function RollCarF2()
{

	my.CarForce = nearnumber( my.CarForce, 0, my.carwieght / 200);
	 

	my.CarRotation = nearnumber( my.CarRotation , 0 , min(0.01 * my.CarForce, 0.4));
	if ((frc(my.CarlastRoll / 90) != 0) && ( my.carforce == 0 )){
		temp.x =  my.ShocksForceD+ my.gravitywork/5  ;

	}else{
	temp.x = my.CarForce /5 + my.gravitywork/50 ;}
	temp.y = 0;
	result = NSonar(me);

	temp.z = -result+20*my.scale_x;

	you = Pointer_To_Entity( my.LeaderId);
	you.carforce = temp.x;
	you.CarBPan= my.pan;
	you.CarBTilt= my.tilt;
	you.CarBRoll= 0;
	//you.skill11 = my.pan;
	if (TestCollsion(Pointer_To_Entity( my.LeaderId))==0)
	{
		you = Pointer_To_Entity( my.LeaderId);
		move( you, temp, nullskill);
	}

	my.CarCurrentRotPos += my.CarForce /10;

        my.CarlastRoll= nearnumber( ang(my.CarlastRoll -my.ShocksForceD * my.CarForce * 0.1 ) ,int(my.CarlastRoll / 90)*90 , 2) ;

	you = Pointer_To_Entity( my.LeaderId);
	vec_set( my.x, you.x);
	my.currentroll = my.CarlastRoll;
	RotatByGround();
       if (my.Carwheel)
       {
 	CarAttach();
      }

	PosBright();


}
