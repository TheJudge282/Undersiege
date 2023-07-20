function weqa(dd,ww)
{
me = dd;
var k;
k = ;
vec_for_mesh(temp,me,ww);
vec_to_angle( my_angle, temp);
k = vec_length(temp) *(1-random(10)/50);
temp.x =  k;
temp.y = 0;
temp.z = 0;
vec_rotate(temp, my_angle);
vec_to_mesh(temp,me,ww);

me = my.brightid;

vec_for_mesh(temp,me,ww);
vec_to_angle( my_angle, temp);
temp.x = k ;
temp.y = 0;
temp.z = 0;
vec_rotate(temp, my_angle);
vec_to_mesh(temp,me,ww);

return(1);
}


function Accedant(Order)
{
you = Pointer_To_Entity( my.LeaderId);
order +=1;
if (order==1)
{
you.Life1 -= abs(you.CarAcedant*10);
if ((you.life1 <= -10)&&(you.plife1!=1))
{
	you.plife1 = 1;
	myacc(me,"weqa");
	return;
}

	return;
}

if (order==2)
{
you.Life2 -= abs(you.CarAcedant*10);
if ((you.life2 <= -10)&&(you.plife2!=1))
{
	you.plife2 = 1;
	myacc(me,"weqa");
	return;
}

	return;
}

if (order==3)
{
you.Life3 -= abs(you.CarAcedant*10);
if ((you.life3 <= -10)&&(you.plife3!=1))
{
	you.plife3 = 1;
	myacc(me,"weqa");
	return;
}

	return;
}

if (order==4)
{
you.Life4 -= abs(you.CarAcedant*10);
if ((you.life4 <= -10)&&(you.plife4!=1))
{
	you.plife4 = 1;
	myacc(me,"weqa");
	return;
}

	return;
}

if (order==5)
{
you.Life5 -= abs(you.CarAcedant*10);
if ((you.life5 <= -10)&&(you.plife5!=1))
{
	you.plife5 = 1;
	myacc(me,"weqa");
	return;
}

	return;
}

if (order==6)
{
you.Life6 -= abs(you.CarAcedant*10);
if ((you.life6 <= -10)&&(you.plife6!=1))
{
	you.plife6 = 1;
	myacc(me,"weqa");
	return;
}

	return;
}

if (order==7)
{
you.Life7 -= abs(you.CarAcedant*10);
if ((you.life7 <= -10)&&(you.plife7!=1))
{
	you.plife7 = 1;
	myacc(me,"weqa");
	return;
}

	return;
}

if (order==8)
{
you.Life8 -= abs(you.CarAcedant*10);
if ((you.life8 <= -10)&&(you.plife8!=1))
{
	you.plife8 = 1;
	myacc(me,"weqa");
	return;
}

	return;
}

}

function StopByNormal(cmy)
{
my = cmy;
	vec_to_angle( my_angle, normal);
	my_angle.x = ang(my_angle.x);
	you = Pointer_To_Entity( my.LeaderId);
	if (you.carforce<0)
	{
	my_angle.y= ang(my.pan+180);
	}else
	{
	my_angle.y= ang(my.pan);
	
	}
	youpan = my_angle.x+random(10)/10;
	carpan = my_angle.y+random(10)/10;
	return((abs(ang(my_angle.x-my_angle.y))>90));

}

function CollisionCar(Cmy, Cyou)
{
my = cmy;
you = cyou;
if ((you.owntype == TypeOfEngines)||(you.owntype == TypeOfPEngines))
{
var acdforce;
		CurntCar = Pointer_To_Entity( my.LeaderId);
		acdforce = abs(CurntCar.carforce)*CurntCar.CarWieght;
		tempent = Pointer_To_Entity( you.LeaderId);
		acdforce += abs(tempent.carforce)*tempent.CarWieght;
		acdforce /=2;
		temp.x =my.x - target.x ;
		temp.y =my.y - target.y ;
		temp.z =my.z - target.z ;
		vec_to_angle( my_angle, temp);
		
		my.pan = my_angle+random(10);

		you.pan = 180+my_angle+random(10);


		temp.x = target.x - my.x;
		temp.y = target.y - my.y;
		temp.z = target.z - my.z;
var RDV;

		rdv = ang(my_angle.pan-CurntCar.pan);

		if ( (abs(rdv)>=45)&&(abs(rdv)<=135) )
		{
		if (rdv>0)
		{
		my.RollAcedant =  -acdforce/(tempent.CarWieght+CurntCar.CarWieght)*2;
		}else
		{
		my.RollAcedant =  acdforce/(tempent.CarWieght+CurntCar.CarWieght)*2;
		
		}
		}else
		{
		if ( abs(rdv)>135 ){
			my.TiltAcedant =-25;
		}
		}

		vec_to_angle( my_angle, temp);
		if (tan(CurntCar.pan- my_angle.x)>0)
		{
		my.CarAcedant = acdforce/CurntCar.CarWieght;
		}else
		{
		my.CarAcedant = -acdforce/CurntCar.CarWieght;
		
		}

		my = CurntCar;
		CurntCar.AccdentOrder = 7- int((ang( CurntCar.pan- my_angle.x))/45+0.5);
		Accedant(CurntCar.AccdentOrder);

		temp.x = target.x - you.x;
		temp.y = target.y - you.y;
		temp.z = target.z - you.z;
		vec_to_angle( my_angle, temp);
		rdv = ang(my_angle.pan-tempent.pan);
		if ( (abs(rdv)>=45)&&(abs(rdv)<=135) )
		{//you.invisible = abs(you.invisible-1);
		if (rdv>0)
		{
		you.RollAcedant =  -acdforce/(tempent.CarWieght+CurntCar.CarWieght)*2;
		}else
		{
		you.RollAcedant =  acdforce/(tempent.CarWieght+CurntCar.CarWieght)*2;
		
		}
		}else
		{
		if ( abs(rdv)>135 ){
			you.TiltAcedant =-25;
		}
		}


		if (tan(tempent.pan- my_angle.x)>0)
		{
		you.CarAcedant = acdforce/tempent.CarWieght;
		}else
		{
		you.CarAcedant = -acdforce/tempent.CarWieght;
		
		}

		//CurntCar.carforce = 0;
		//if (StopByNormal(tempent))
		//{
		tempent.carforce = 0;
		//}

my = cmy;
my.EPassable = 1;		
wait (10);
my.EPassable = 0;		
}else
{
if (you.owntype==TypeOfBullete)
{
	you.flag1 = 0;
	vec_set(you.SinglePosX,my.x);
	my.OwnLife -=100;
}
}

}

function CollisionColl(Cmy, Cyou)
{
my = cmy;
you = cyou;
if ((you.owntype == TypeOfEngines)||(you.owntype == TypeOfPEngines))
{
		CurntCar = Pointer_To_Entity( you.LeaderId);

		if (my.Wieght>0)
		{
			CurntCar.carforce *= min(CurntCar.Wieght / my.Wieght, 0.75) ;
		}
		my.EPassable = 1;

		temp.x = my.x - you.x;
		temp.y = my.y - you.y;
		temp.z = my.z - you.z;

		vec_to_angle( my_angle, temp);
		my.pan = my_angle.pan;
		while (my.tilt>-90)
		{
		my.tilt -= 1 * 6;
		my.z-= 1.1 * 6;
		wait(1);
		}
}else
{
if (you.owntype==TypeOfBullete)
{
	you.flag1 = 0;
	vec_set(you.SinglePosX,target);
		my.EPassable = 1;

		temp.x = my.x - you.x;
		temp.y = my.y - you.y;
		temp.z = my.z - you.z;

		vec_to_angle( my_angle, temp);
		my.pan = my_angle.pan;
		while (my.tilt>-90)
		{
		my.tilt -= 1 * 6;
		my.z-= 1.1 * 6;
		wait(1);
		}
}
}
}

function CollisionTrafic(Cmy, Cyou)
{
my = cmy;
you = cyou;
if ((you.owntype == TypeOfEngines)||(you.owntype == TypeOfPEngines))
{
my = Pointer_To_Entity( you.LeaderId);
//my.CarForce /= my.carwieght/10;

	normal.x = target.x - my.x;
	normal.y = target.y - my.y;
	normal.z = target.z - my.z;

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
	frictpan = int((ang(my.pan-my_angle.x)+180)/45)+random(10)/10;//abs(ang(my_angle.x-my_angle.y))+random(10)/10;
	if (abs(ang(my_angle.x-my_angle.y))<=90)
	{
		//frictpan.x = ;
			you.pan = my_angle.pan;
			if (tan(my.pan-my_angle.x)>0)
			{
			you.CarAcedant = abs(my.CarForce)/my.carwieght;
			}else
			{
			you.CarAcedant = -abs(my.CarForce)/my.carwieght;
			
			}
			my.CarForce /=my.carwieght;
			my.AccdentOrder = 7- int((ang(my.pan-my_angle.x)+180)/45+0.5);
			Accedant(my.AccdentOrder);
	}
}

}

function CollisionBullete(Cmy, Cyou)
{
my = cmy;
you = cyou;
my.flag1 = 0;
you.OwnLife -=100;

}

function CollisionCompars(Cmy, Cyou)
{
my = cmy;
you = cyou;
if ((you.owntype == TypeOfEngines)||(you.owntype == TypeOfPEngines))
{

		my.IWanaFly = 1;

		temp.x = my.x - you.x;
		temp.y = my.y - you.y;
		temp.z = my.z - you.z;

		vec_to_angle( my_angle, temp);
		my.pan = my_angle.pan;

		CurntCar = Pointer_To_Entity( you.LeaderId);
		forces = abs(CurntCar.carforce);
		temp.x = CurntCar.carforce;
		temp.y = 0;
		temp.z = 0;
		vec_rotate( temp, you.pan);
		vec_add( my.pos, temp);
		if (my.Wieght>0)
		{
			CurntCar.carforce *= min(CurntCar.Wieght / my.Wieght, 0.75) ;
		}

}else
{
if (you.owntype==TypeOfBullete)
{
	vec_set(you.SinglePosX,target);
	you.flag1 = 0;
	my.IWanaFly = 1;

	temp.x = my.x - you.x;
	temp.y = my.y - you.y;
	temp.z = my.z - you.z;

	vec_to_angle( my_angle, temp);
	my.pan = my_angle.pan;

	forces = 100;
	temp.x = forces;
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, you.pan);
	vec_add( my.pos, temp);
}
}
}
function test_coll(emy,vp,vt)
{
	my=emy;

	CollisionDimension.x*=my.ScaleCollision;
	CollisionDimension.y*=my.ScaleCollision;
	CollisionDimension.z*=my.ScaleCollision;

	vec_for_vertex(CollisionPostion,my,vp);
	vec_for_vertex(CollisionAngle,my,vt);
	vec_sub(CollisionAngle,CollisionPostion);
	vec_to_angle(CollisionAngle,CollisionAngle);
	//CollisionPostion.Z-=5;
	if (ModelCollision())
	{
		return(1);
	}
}

function CollisionHappen ( TCMe, TCyou)
{
	  my          = TCMe;
	  you         = TCyou;
	  event_type  = event_entity;
	  guifunction = my.event;
	  guifunction();
}

function TraceCollision(TCMe)
{
var Result;
Result = 0;
		CollisionParts = 0;
		me = tcme;
		vec_set( CollisionDimension, ArmDimension);
		if ( test_coll( me , my.VertexCount + VLeftArm[0] , my.VertexCount + VLeftArm[1]))
		{
			Result = 1;
			CollisionIndexs[ LeftArmTouch ]= 1;
		}else
		{
			CollisionIndexs[ LeftArmTouch ] = 0;
		}			      

		vec_set( CollisionDimension, HandDimension);
		if ( test_coll( me , my.VertexCount + VLeftHand[0] , my.VertexCount + VLeftHand[1]))
		{ 
			Result = 1;
			CollisionIndexs[ LeftHandToutch ]= 1;
		}else
		{
			CollisionIndexs[ LeftHandToutch ]= 0;
		}			      

		vec_set( CollisionDimension, ArmDimension);
		if ( test_coll( me , my.VertexCount + VRightArm[0] , my.VertexCount + VRightArm[1]))
		{
			Result = 1;
			CollisionIndexs[ RightArmTouch ]= 1;
		}else
		{
			CollisionIndexs[ RightArmTouch ]= 0;
		}			      
			      

		vec_set( CollisionDimension, HandDimension);
		if ( test_coll( me , my.VertexCount + VRightHand[0] , my.VertexCount + VRightHand[1]))
		{
			Result = 1;
			CollisionIndexs[ RightHandTouch ]= 1;
		}else
		{
			CollisionIndexs[ RightHandTouch ]= 0;
		}			      

		vec_set( CollisionDimension, CheastDimension);
		if ( test_coll( me , my.VertexCount + VChest[0] , my.VertexCount + VChest[1]))
		{
			Result = 1;
			CollisionIndexs[ ChestTouch ]= 1;
		}else
		{
			CollisionIndexs[ ChestTouch ]= 0;
		}			      

		vec_set( CollisionDimension, FootDimension);
		if ( test_coll( me , my.VertexCount + VLeftLeg[0] , my.VertexCount + VLeftLeg[1]))
		{
			Result = 1;
			CollisionIndexs[ LeftFootTouch ]= 1;
		}else
		{
			CollisionIndexs[ LeftFootTouch ]= 0;
		}			      

		vec_set( CollisionDimension, LegDimension);
		if ( test_coll( me , my.VertexCount + VLeftLArm[0] , my.VertexCount + VLeftLArm[1]))
		{
			Result = 1;
			CollisionIndexs[ LeftLegTouch ]= 1;
		}else
		{
			CollisionIndexs[ LeftLegTouch ]= 0;
		}			      

		vec_set( CollisionDimension, LegDimension);
		if ( test_coll( me , my.VertexCount + VRightLeg[0] , my.VertexCount + VRightLeg[1]))
		{
			Result = 1;
			CollisionIndexs[ RightFootTouch ]= 1;
		}else
		{
			CollisionIndexs[ RightFootTouch ]= 0;
		}			      

		vec_set( CollisionDimension, FootDimension);
		if ( test_coll( me , my.VertexCount + VRightlArm[0] , my.VertexCount + VRightlArm[1]))
		{
			Result = 1;
			CollisionIndexs[ RightLegTouch ]= 1;
		}else
		{
			CollisionIndexs[ RightLegTouch ]= 0;
		}			      

		vec_set( CollisionDimension, HeadDimension);
		if ( test_coll( me , my.VertexCount + VHead[0] , my.VertexCount + VHead[1]))
		{
			Result = 1;
			CollisionIndexs[ HeadTouch ]= 1;
		}else
		{
			CollisionIndexs[ HeadTouch ]= 0;
		}	
		CollisionDetection.x = Result;
		return(Result);

}
/*
function MallaCollision(TCMe)
{
my = TCMe;
var Result;
Result = 0;
	CollisionDimension.x = my.max_x * 2;
	CollisionDimension.y = my.max_y;
	CollisionDimension.z = my.max_z;
	vec_set( CollisionPostion, my.x);
//	CollisionPostion.z += 10;
	vec_set( CollisionAngle,my.pan);

	if (ModelCollision())
	{
		Result=1;		
	}
	
	CollisionDimension.x = my.max_x ;
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
*/

function MallaCollision(TCMe)
{
my = TCMe;
var Result;
Result = 0;
	CollisionDimension.x = my.max_x * 2;
	CollisionDimension.y = my.max_y;
	CollisionDimension.z = my.max_z*0.35;
	vec_set( CollisionPostion, my.x);
	CollisionPostion.z -= 10;
	vec_set( CollisionAngle,my.pan);

	if (ModelCollision())
	{
		Result=1;		
	}
	
	CollisionDimension.x = my.max_x * 0.75;
	CollisionDimension.y = my.max_y * 0.5;
	CollisionDimension.z = my.max_z * 0.2; 
	vec_set( CollisionPostion, my.x);
	CollisionPostion.z += my.max_z*0.4;
	vec_set( CollisionAngle,my.pan);

	if (ModelCollision())
	{
		Result=1;		
	}

CollisionDetection.x = Result;
return(Result);

}

function ApatciCollision(TCMe)
{
	my = TCMe;
	CollisionDetection.x = 1;
	return( 1);
}

function ComparsCollision(TCMe)
{
my = TCMe;
var Result;
Result = 0;
	CollisionDimension.x = my.max_x;
	CollisionDimension.y = my.max_y;
	CollisionDimension.z = my.max_z;
	vec_set( CollisionPostion, my.x);
	vec_set( CollisionAngle,my.pan);

	if (ModelCollision())
	{
		Result=1;		
	}
	

CollisionDetection.x = Result;
return(Result);

}

function Show_Coll(emy,vp,vt)
{
	my=emy;


	CollisionDimension.x*=my.ScaleCollision;
	CollisionDimension.y*=my.ScaleCollision;
	CollisionDimension.z*=my.ScaleCollision;

	vec_for_vertex(CollisionPostion,my,vp);
	vec_for_vertex(CollisionAngle,my,vt);
	vec_sub(CollisionAngle,CollisionPostion);
	vec_to_angle(CollisionAngle,CollisionAngle);
	if (ModelShowCollision())
	{
		return(1);
	}
}

function ShowCollision(TCMe)
{
var Result;
Result = 0;
		CollisionParts = 0;
		me = tcme;
		vec_set( CollisionDimension, ArmDimension);
		 Show_Coll( me , my.VertexCount + VLeftArm[0] , my.VertexCount + VLeftArm[1]);

		vec_set( CollisionDimension, HandDimension);
		 Show_Coll( me , my.VertexCount + VLeftHand[0] , my.VertexCount + VLeftHand[1]);

		vec_set( CollisionDimension, ArmDimension);
		Show_Coll( me , my.VertexCount + VRightArm[0] , my.VertexCount + VRightArm[1]);

		vec_set( CollisionDimension, HandDimension);
		 Show_Coll( me , my.VertexCount + VRightHand[0] , my.VertexCount + VRightHand[1]);

		vec_set( CollisionDimension, CheastDimension);
		 Show_Coll( me , my.VertexCount + VChest[0] , my.VertexCount + VChest[1]);

		vec_set( CollisionDimension, FootDimension);
		 Show_Coll( me , my.VertexCount + VLeftLeg[0] , my.VertexCount + VLeftLeg[1]);

		vec_set( CollisionDimension, LegDimension);
		 Show_Coll( me , my.VertexCount + VLeftLArm[0] , my.VertexCount + VLeftLArm[1]);

		vec_set( CollisionDimension, LegDimension);
		 Show_Coll( me , my.VertexCount + VRightLeg[0] , my.VertexCount + VRightLeg[1]);

		vec_set( CollisionDimension, FootDimension);
		 Show_Coll( me , my.VertexCount + VRightlArm[0] , my.VertexCount + VRightlArm[1]);

		vec_set( CollisionDimension, HeadDimension);
		 Show_Coll( me , my.VertexCount + VHead[0] , my.VertexCount + VHead[1]);


}

function Entity2Collision()
{
	my.invisible = 1;
	my.passable  = 1;
	my.scale_x  /= 2.5;
	my.scale_y  /= 2.5;
	my.scale_z  /= 2.5;
	CollisionEntity = me;
}