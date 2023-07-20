// Bulets

	sound SoundBulet1 , <ric1.wav>;
	sound SoundBulet2 , <ric2.wav>;
	sound SoundBulet3, <ric3.wav>;
	sound SoundBulet4 , <ric4.wav>;
	sound SoundBulet5 , <ric5.wav>;
	sound SoundBulet6 , <ric6.wav>;
	sound SoundBulet7 , <ric7.wav>;
	sound SoundBulet8 , <ric8.wav>;
	sound SoundBulet9 , <ric9.wav>;
	sound SoundBulet10 , <ric10.wav>;
	sound SoundBulet11 , <ric11.wav>;
	sound SoundBulet12 , <whizz1.wav>;
	sound SoundBulet13 , <whizz2.wav>;
	sound SoundBulet14 , <whizz3.wav>;
	sound SoundBulet15 , <whizz4.wav>;
	sound SoundBulet16 , <whizz5.wav>;
	sound SoundBulet17 , <whizz6.wav>;
	sound SoundBulet18 , <whizz7.wav>;
	sound SoundBulet19 , <whizz8.wav>;
	sound SoundBulet20 , <whizz9.wav>;
	sound SoundBulet21 , <whizz10.wav>;
	sound SoundBulet22 , <whizz11.wav>;
	sound SoundBulet23 , <whizz12.wav>;
	sound SoundBulet24 , <whizz13.wav>;
	sound SoundBulet25 , <whizz14.wav>;
	sound SoundBulet26 , <whizz15.wav>;
	sound SoundBulet27 , <whizz16.wav>;
	sound SoundBulet28 , <whizz17.wav>;

var counter[2] = 1,1;

function PlaySoundGroup1(sndvol)
{
	if (counter[0] >11)
	{
		counter[0] = 1;
	}
	if (counter[0] == 1)
	{
		play_entsound( me,SoundBulet1 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 2)
	{
		play_entsound( me,SoundBulet2 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 3)
	{
		play_entsound( me,SoundBulet3 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 4)
	{
		play_entsound( me,SoundBulet4 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 5)
	{
		play_entsound( me,SoundBulet5 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 6)
	{
		play_entsound( me,SoundBulet6 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 7)
	{
		play_entsound( me,SoundBulet7 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 8)
	{
		play_entsound( me,SoundBulet8 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 9)
	{
		play_entsound( me,SoundBulet9 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 10)
	{
		play_entsound( me,SoundBulet10 , sndvol);
		goto PlayS1;
	}
	if (counter[0] == 11)
	{
		play_entsound( me,SoundBulet11 , sndvol);
		goto PlayS1;
	}
	
	PlayS1:
	temp.x = speed/2;
	tune_sound( result, 0, temp.x);
	counter[0] +=1;
}

function PlaySoundGroup2(sndvol)
{
	if (counter[1] >17)
	{
		counter[1] = 1;
	}
	if (counter[1] == 1)
	{
		play_entsound( me,SoundBulet12 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 2)
	{
		play_entsound( me,SoundBulet13 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 3)
	{
		play_entsound( me,SoundBulet14 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 4)
	{
		play_entsound( me,SoundBulet15, sndvol);
		goto PlayS2;
	}
	if (counter[1] == 5)
	{
		play_entsound( me,SoundBulet16 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 6)
	{
		play_entsound( me,SoundBulet17 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 7)
	{
		play_entsound( me,SoundBulet18 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 8)
	{
		play_entsound( me,SoundBulet19 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 9)
	{
		play_entsound( me,SoundBulet20 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 10)
	{
		play_entsound( me,SoundBulet21 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 11)
	{
		play_entsound( me,SoundBulet22 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 12)
	{
		play_entsound( me,SoundBulet23 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 13)
	{
		play_entsound( me,SoundBulet24 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 14)
	{
		play_entsound( me,SoundBulet25 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 15)
	{
		play_entsound( me,SoundBulet26 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 16)
	{
		play_entsound( me,SoundBulet27 , sndvol);
		goto PlayS2;
	}
	if (counter[1] == 17)
	{
		play_entsound( me,SoundBulet28 , sndvol);
		goto PlayS2;
	}
	
	PlayS2:
	temp.x = speed/2;
	tune_sound( result, 0, temp.x);
	counter[1] +=1;
}


function soundeffect()
{
	my.invisible = 1;
	my.passable = 1;
	PlaySoundGroup2(100);
	while (my.skill1<100)
	{
	my.skill1+=1;
	wait(1);
	}
	remove me;
}

function ShotAndDamage(RandDist,Line,Hole,Vnum)
{
	
	RandDist = abs(RandDist *level/100);
	you = Pointer_To_Entity( my.EnemyId);
	
	//RandDist = RandDist*(max(0, min(0.01,vec_dist(my.x,you.x)/10) ));
	
	p2.x = RandDist;
	p2.y = 0;
	p2.z = 0;
	
	my_angle.x = random(360);
	my_angle.y = random(360);
	
	vec_rotate( p2, my_angle);
	
	p2.x += you.x;
	p2.y += you.y;
	p2.z += you.z + my.EnemyHeight;
	
	trace_mode = ignore_me + ignore_passable + ignore_sprites;
	
	temp.x = p2.x - my.x;
        temp.y = p2.y - my.y;
	temp.z = p2.z - my.z-50;
	vec_to_angle( my_angle, temp);
	temp.x = 10000;
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add( temp, my.pos);
	vec_for_vertex ( my_angle, my, Vnum);
	
	result = trace( my_angle, temp);
	if (result)
	{
		vec_set ( p2, target);
	}else
	{
        	vec_set ( p2, temp);
	}
	if(you == null && hole)
	{
		   create( <black_hole.tga>, target, WallEfShot); 		   
		   FirstPoint.x = P2.x - p.x;
		   FirstPoint.y = P2.y - p.y;
		   FirstPoint.z = P2.z - p.z;
		   vec_to_angle( my_angle, FirstPoint);
		   you = Pointer_To_Entity( my.EnemyId);
		   FirstPoint.x = vec_dist( p , you.x);
		   FirstPoint.y = 0;
		   FirstPoint.z = 0;
		   vec_rotate( FirstPoint, my_angle);
		   vec_add( FirstPoint, p);
		   create( <point1.MDL>, FirstPoint, soundeffect);

		   	
	}else
	{
	if (you._type != _type_player)
	{
		you._health-=10;
	}else
	{
		HeartPlayer(10);
		temp.x = my.x - player.x;
		temp.y = my.y - player.y;
		temp.z = 0;
		vec_to_angle( my_angle, temp);
		//my_angle.pan -=player.pan;
		ShowEnemyPos(ang(my_angle.pan));
	
	}
	}


vec_for_vertex ( p, my, Vnum);
vec_set( FirstPoint, P);
vec_set( SecondPoint, P2);
if (Line)
{
Blt_Line();
}

}


function MalalehDamege(RandDist,Line,Hole,Vnum)
{

RandDist = abs(RandDist *level/100);
you = Pointer_To_Entity( my.EnemyId);
//RandDist = RandDist*(max(0, min(0.01,vec_dist(my.x,you.x)/10) ));
p2.x = RandDist;
p2.y = 0;
p2.z = 0;

my_angle.x = random(360);
my_angle.y = random(360);

vec_rotate( p2, my_angle);
	
p2.x += you.x;
p2.y += you.y;
p2.z += you.z + my.EnemyHeight;

trace_mode = ignore_me + ignore_passable + ignore_sprites;

temp.x = p2.x - my.x;
temp.y = p2.y - my.y;
temp.z = p2.z - my.z-50;
vec_to_angle( my_angle, temp);
temp.x = 10000;
temp.y = 0;
temp.z = 0;
vec_rotate( temp, my_angle);
vec_add( temp, my.pos);
vec_set( my_angle, my.pos);
my_angle.z+=my.max_z;
result = trace( my_angle, temp);
if (result)
{
vec_set ( p2, target);
}else
{
vec_set ( p2, temp);
}
	if(you == null && hole)
	{
		   create( <black_hole.tga>, target, WallEfShot); 		   
		   FirstPoint.x = P2.x - p.x;
		   FirstPoint.y = P2.y - p.y;
		   FirstPoint.z = P2.z - p.z;
		   vec_to_angle( my_angle, FirstPoint);
		   you = Pointer_To_Entity( my.EnemyId);
		   FirstPoint.x = vec_dist( p , you.x);
		   FirstPoint.y = 0;
		   FirstPoint.z = 0;
		   vec_rotate( FirstPoint, my_angle);
		   vec_add( FirstPoint, p);
		   create( <point1.MDL>, FirstPoint, soundeffect);

		   	
	}else
	{
		if (you._type == _type_player)
		{HeartPlayer(10);
		}
		if (you._type == _type_compars)
		{you._health-=50;
		}
		
		temp.x = my.x - player.x;
		temp.y = my.y - player.y;
		temp.z = 0;
		vec_to_angle( my_angle, temp);
		//my_angle.pan -=player.pan;
		ShowEnemyPos(ang(my_angle.pan));
	}


vec_for_vertex ( p, my, Vnum);
vec_set( FirstPoint, P);
vec_set( SecondPoint, P2);
if (Line)
{
Blt_Line();
}

}

function CheckVisEnemy(Vnum)
{
	var res=0;
	entiy = Pointer_To_Entity( my.EnemyId);
	if (entiy==null)
	{
		return(0);
	}
	trace_mode = ignore_me + ignore_passable + ignore_passents + ignore_sprites;
	vec_for_vertex( temp, my, Vnum);
	result = trace( temp, entiy.pos);
	my.EnemyHeight = 0;
	res = (you == entiy)||( result==0 );
	if (res==0)
	{
	 vec_set( temp2, entiy.pos);
	 temp2.z += entiy.max_z*1.5;
	 result = trace( temp, temp2);
	 my.EnemyHeight = entiy.max_z*0.75;
	 res = (you == entiy)||( result==0 );
	}
	return(res);
}

function CheckVisPosEnemy()
{
	var res=0;
	entiy = Pointer_To_Entity( my.EnemyId);
	trace_mode = ignore_me + ignore_passable + ignore_passents + ignore_sprites;
	vec_set( temp, my.pos);
	trace( temp, entiy.pos);
	my.EnemyHeight = 0;
	res = (you == entiy)||( result==0 );
	if (res==0)
	{
	  vec_set( temp2, entiy.pos);
	  temp2.z+= entiy.max_z*1.5;
	  trace( temp, temp2);
	  my.EnemyHeight = entiy.max_z*0.75;
	  res = (you == entiy)||( result==0 );
	}
	return(res);
}

function CheckTheFLoor(FloorHigh)
{
while (player == null)
{
wait(1);
}

var myhight=0;
var FloorPos;

    if (sin(int(frc(my.FrameAnim/100)*100)/100*90)>0.5)
    {
	you = Pointer_To_Entity( player.bodylnk);
	 trace_mode = ignore_me + ignore_passable + ignore_sprites + ignore_you;
	 vec_set( FloorPos, my.pos);
	 FloorPos.z -= FloorHigh;
	 myhight  = trace( my.x, FloorPos)+ my.min_z;
	 myhight  = max(min( myhight, 10),-10);
    }else
    {
	you = Pointer_To_Entity( player.bodylnk);
	 trace_mode = ignore_me + ignore_passable + ignore_sprites + ignore_you;
	 vec_set( FloorPos, my.pos);
	 FloorPos.z -= FloorHigh;
	 myhight  = trace( my.x, FloorPos)+ my.min_z;
	 myhight  = max(min( myhight, 2),-2);
    
    }
	 return(myhight);

}

function CheckTheFLoor4(FloorHigh)
{
while (player == null)
{
wait(1);
}

var myhight=0;
var FloorPos;

	you = Pointer_To_Entity( player.bodylnk);
	 trace_mode = ignore_me + ignore_passable + ignore_sprites + ignore_you;
	 vec_set( FloorPos, my.pos);
	 FloorPos.z -= FloorHigh;
	 myhight  = trace( my.x, FloorPos)+ my.min_z*10;
	 myhight  = max(min( myhight, 100),-100);
	 return(myhight);

}

function CheckTheFLoor2(FloorHigh)
{
while (player == null)
{
wait(1);
}

var myhight=0;
var FloorPos;

    if (sin(int(frc(my.FrameAnim/100)*100)/100*90)>0.5)
    {
	you = Pointer_To_Entity( player.bodylnk);
	 trace_mode = ignore_me + ignore_passable + ignore_sprites + ignore_you;
	 vec_set( FloorPos, my.pos);
	 FloorPos.z -= FloorHigh;
	 myhight  = trace( my.x, FloorPos)-0.1;
	 myhight  = max(min( myhight, 10),-10);
    }
	 return(myhight);

}

function spot_point2(myt)
{	
	var Reslt;

	var Lastpass;
	you = myt;

	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan] = ang(my.pan+180);
	ScanValues[scan_EPan] = 360;//temp.y;
	ScanValues[scan_Range] = 1000;
	ScanValues[scan_Distance] = 100;
	ScanValues[scan_Scan2Targets] = 0;


	you = myt;
	if(you!=null)	{
	vec_set( ScanValues[scan_target_x],you.x);
	Lastpass = you.passable;
		you.passable = 1;}
	Reslt.x = NHScan(me);
	you = myt;
	if(you!=null)	{	you.passable = Lastpass;}

	if (Reslt.x !=0)
	{
		get_nextH_point(me);
		vec_set( my._target_x, PointParameters[ PointPos]);
	}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}

function SniperSpot_point(myt)
{	
	var Reslt;
	var Lastpass;
	you = myt;

	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan] = 0;
	ScanValues[scan_EPan] = 360;//temp.y;
	ScanValues[scan_Range] = 1000000;
	ScanValues[scan_Distance] = 100;
	ScanValues[scan_Scan2Targets] = 1;


	you = myt;
	if(you!=null)	{
	vec_set( ScanValues[scan_target_x],you.x);
	Lastpass = you.passable; 
	you.passable = 1;}
	Reslt.x = NHScan(me);
	you = myt;
	if(you!=null)	{	you.passable = Lastpass;}

	if (Reslt.x !=0)
	{
		get_nextH_point(me);
		vec_set( my._old_position_x, PointParameters[ PointPos]);
	}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}

function CheckTHPoint(myt)
{	
	var Reslt;

	you = myt;
	var Lastpass;

	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan] = ang(my.pan+180);
	ScanValues[scan_EPan] = 360;//temp.y;
	ScanValues[scan_Range] = 10000;
	ScanValues[scan_Distance] = 10;
	ScanValues[scan_Scan2Targets] = 10;


	you = myt;
	if(you!=null)	{
	vec_set( ScanValues[scan_target_x],you.x);
	Lastpass = you.passable;
	you.passable = 1;}
	Reslt.x = ScanMyHPoint(my);
	you = myt;
	if(you!=null)	{	you.passable = Lastpass;}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}

function FindPath2Him(myt)
{	
	var Reslt;
	var Lastpass;

	you = myt;
	if(you==null)	{	return(0);}

	Lastpass = you.passable ;
	you.passable = 1;
	vec_set( PointParameters[ PointPos], my.pos);
	vec_set( PointParameters[ PointDirction], you.pos);
	PointParameters[ PointLength] = 1;
	Reslt.x = FindTargetPath(0,0);
	you = myt;
	you.passable = Lastpass;

	if ( reslt.x && PointParameters[ PointLeft] == 0)
	{
		vec_set( my._target_x,  PointParameters[ PointDirction]);
		Reslt.y = my.PathId;
		my.PathId = PointParameters[ PointLength];
		ALocatePoint();
		PointParameters[ PointLength] = Reslt.y;
		UnLocatePoint();
	}

	return(Reslt.x);
}

function SniperFindPath2Him(myt,PMF)
{	
	var Reslt;
	var Lastpass;

	you = myt;
	if(you==null)	{	return(0);}
	Lastpass = you.passable ;
	you.passable = 1;
	vec_set( PointParameters[ PointPos], my.pos);
	vec_set( PointParameters[ PointDirction], my._old_position_x);
	PointParameters[ PointLength] = 1;
	Reslt.x = FindTargetPath(PMF,0);
	you = myt;
	you.passable = Lastpass;
	vec_set( my._target_x,  PointParameters[ PointDirction]);
	return(Reslt.x);
}

function FindPaths2Him(myt,pind,paind)
{	
	var Reslt;
	var Lastpass;

	you = myt;
	if(you==null)	{	return(0);}
	Lastpass = you.passable;
	you.passable = 1;
//	vec_set( PointParameters[ PointPos], my.pos);
	vec_set( PointParameters[ PointDirction], you.pos);
	Reslt.x = FindTargetPath( pind, paind);
	you = myt;
	you.passable = Lastpass;
	vec_set( my._target_x,  PointParameters[ PointDirction]);
	return(Reslt.x);
}

function FindNext2Him(myt)
{	
	var Lastpass;
	var Reslt;

	you = myt;
	if(you==null)	{	return(0);}
	Lastpass = you.passable;
	you.passable = 1;
	vec_set( PointParameters[ PointPos], my.pos);
	vec_set( PointParameters[ PointDirction], you.pos);
	PointParameters[ PointLength] = 1;
	Reslt.x = FindTargetPath(1,0);
	you = myt;
	you.passable = Lastpass;
	if ( reslt.x && PointParameters[ PointLeft] == 0)
	{
		vec_set( my._target_x,  PointParameters[ PointDirction]);
		Reslt.y = my.PathId;
		my.PathId = PointParameters[ PointLength];
		ALocatePoint();
		PointParameters[ PointLength] = Reslt.y;
		UnLocatePoint();
	}
	return(Reslt.x);
}

function spot3_point(myt)
{	

	var TTemp;
	var Reslt;

	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan]		= temp.x;        
	ScanValues[scan_EPan]		= temp.y;      
	ScanValues[scan_Range]		= my_angle.x;
	ScanValues[scan_Distance]	= my_angle.y;  
	ScanValues[scan_Scan2Targets]	= my_angle.z;    
	vec_set(ScanValues[scan_target_x],my.x);

	Reslt.x = NScan(me);

	if (Reslt.x !=0)
	{
		get_next_point(me);
	}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}

function spot4_point(myt)
{	
	en_upass(30,310);

	var TTemp;
	var Reslt;

	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan] = ang(my.pan+20+random(45));
	ScanValues[scan_EPan] = 90;
	ScanValues[scan_Range] = 100000;
	ScanValues[scan_Distance] = 500;
	ScanValues[scan_Scan2Targets] =10;
	vec_set(ScanValues[scan_target_x],my.x);

	Reslt.x = NScan(me);

	if (Reslt.x !=0)
	{
		get_next_point(me);
	}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}

function spot5_point(myt)
{	
	en_upass(30,310);

	var TTemp;
	var Reslt;

	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan] = my_angle;
	ScanValues[scan_EPan] = 90;
	ScanValues[scan_Range] = 100000;
	ScanValues[scan_Distance] = 500;
	ScanValues[scan_Scan2Targets] =10;
	vec_set(ScanValues[scan_target_x],my.x);

	Reslt.x = NScan(me);

	if (Reslt.x !=0)
	{
		get_next_point(me);
	}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}

function spot6_point(myt)
{	
	en_upass(30,310);

	var TTemp;
	var Reslt;

	vec_set(ScanValues[scan_x],my.x);

	ScanValues[scan_SPan] = my_angle.x;
	ScanValues[scan_EPan] = my_angle.y;
	ScanValues[scan_Range] = 100000;
	ScanValues[scan_Distance] = 100;
	ScanValues[scan_Scan2Targets] =10;
	vec_set(ScanValues[scan_target_x],my.x);

	Reslt.x = NScan(me);

	if (Reslt.x !=0)
	{
		get_next_point(me);
	}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}

function spot2_point(myt)
{	

	var TTemp;
	var Reslt;
	var Lastpass;

	you = myt;
	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan] = 0;
	ScanValues[scan_EPan] = 350;
	ScanValues[scan_Range] = 1000;
	ScanValues[scan_Distance] = 200;
	ScanValues[scan_Scan2Targets] = 20;
	ttemp.x = my.x - you.x;
	ttemp.y = my.y - you.y;
	ttemp.z = my.z - you.z;
	vec_to_angle( ttemp, ttemp);
	ScanValues[scan_target2_x] = ttemp.x;
	ScanValues[scan_target2_y] = 90;
	vec_set( ScanValues[scan_target_x],you.x);

	you = myt;
	if(you!=null)	{	Lastpass = you.passable;
				you.passable = 1;}
	Reslt.x = NScan(me);
	you = myt;
	if(you!=null)	{	you.passable = Lastpass;}

	if (Reslt.x !=0)
	{
		get_next_point(me);
	}

	if (Reslt.x !=0)
	{
		return(1);
	}
		return(0);
}

function Shwe_point(myt)
{	

	var TTemp;
	var Reslt;
	var Lastpass;

	you = myt;
	vec_set(ScanValues[scan_x],my.x);
	ScanValues[scan_SPan] = 0;
	ScanValues[scan_EPan] = 350;
	ScanValues[scan_Range] = 1000;
	ScanValues[scan_Distance] = 200;
	ScanValues[scan_Scan2Targets] = 20;
	ttemp.x = my.x - you.x;
	ttemp.y = my.y - you.y;
	ttemp.z = my.z - you.z;
	vec_to_angle( ttemp, ttemp);
	ScanValues[scan_target2_x] = ttemp.x;
	ScanValues[scan_target2_y] = 45;
	vec_set( ScanValues[scan_target_x],you.x);

	you = myt;
	if(you!=null)	{	Lastpass = you.passable;
				you.passable = 1;}
	Reslt.x = Psfle(me);
	you = myt;
	if(you!=null)	{	you.passable = Lastpass;}

}

function check(val)
{	
	if (my._type==100)
	{
		e_upass(30,_type_player);
	}
	else
	{
		e_upass(30,100);
	}
	//ent_vertex(temp,point_see[my._kind_id]);
	vec_set( temp, my.x);
	temp.z += my.max_z*1.75;

	entiy = Pointer_To_Entity( my.EnemyId);
	if entiy==0 {goto czfin;}

	counter_1.x = entiy.x;
	counter_1.y = entiy.y;
	counter_1.z = entiy.z + entiy.max_z*0.75;

	if entiy == null {goto czfin;}

	trace_mode = ignore_me + ignore_passable + ignore_passents;

	result=trace(temp,counter_1);
	if(result>val){goto czfin;}
	if (you == entiy)
	{
		my._spot_hight=0.75;
		goto cfin;
	}
	else
	{
		counter_1.z = entiy.z;		
		trace(temp,counter_1);
		if(result>val){goto czfin;}
		if (you == entiy)
		{
			my._spot_hight=0;
			goto cfin;
		}
		else
		{
			counter_1.z= entiy.z+ entiy.min_z*0.75;
	
			trace(temp,counter_1);
			if(result>val){goto czfin;}
			if (you == entiy)
			{
				my._spot_hight=-0.75;
				goto cfin;
			}
			else
			{
			czfin:	if (my._type==100)
				{
					e_pass(30,_type_player);
				}
				else
				{
					e_pass(30,100);
				}	
				return(-1);
			}
		}
	}
	cfin:
	if (my._type==100)
	{
		e_pass(30,_type_player);
	}
	else
	{
		e_pass(30,100);
	}
	return(1);
}


function check_and_fire()
{
	if(Check(see_scan)==1)	// spotted him!
	{
		WeaponSound3d(my.WeaponNumber);

		ent_frame("1shot",my.FrameAnim);

		entiy = ptr_for_handle(my._leg_id);
		you = Pointer_To_Entity( my.EnemyId);

		vec_set( p, my.pos);
		p.z+=my.max_z*0.75;

		temp.x = entiy.enemy_x - p.x;
		temp.y = entiy.enemy_y - p.y;
		temp.z = entiy.enemy_z - p.z + you.max_z * my._spot_hight;

		vec_to_angle(my_angle,temp);

		my.pan=my_angle.pan;

		p2.x = 100000;
		p2.y = 0;
		p2.z = 0;
		my_angle.pan += Weap_Force[my.WeaponNumber-1] *(my._shot_counter-2.5)*random(5);
		my_angle.tilt += Weap_Force[my.WeaponNumber-1] *(my._shot_counter-2.5)*random(5);
		vec_rotate(p2,my_angle);
		vec_add(p2,p);

		indicator = _gunfire;

		damage=Weap_damage[my.WeaponNumber-1];
		trace_mode = ignore_me + ignore_passable + ignore_passents + activate_shoot;
		if (my._type==100)
		{
			e_upass(30,_type_player);
		}
		else
		{
			e_upass(30,100);
		}

		you = 0;
		result=trace(p,p2);
		if (you)
		{
		ShotEffect();
		if (you._type == _type_player)
			{
				HeartPlayer( damage );}
		}else
		{
			ShotEffect();
		}


		if (my._type==100)
		{
			e_pass(30,_type_player);
		}
		else
		{
			e_pass(30,100);
		}

		if result>0
		{
			vec_set(p2,target);
		}
		Blt_Line();
	}
	else
	{
		return(-1);
	}

}


function Fire()
{

		WeaponSound3d(my.WeaponNumber);
		ent_frame("1shot",my.FrameAnim);
		entiy = ptr_for_handle(my._leg_id);
		you = Pointer_To_Entity( my.EnemyId);
		vec_set( p, my.pos);
		p.z+=my.max_z*0.75;
		temp.x = entiy.enemy_x - p.x;
		temp.y = entiy.enemy_y - p.y;
		temp.z = entiy.enemy_z - p.z + you.max_z * my._spot_hight;
		vec_to_angle(my_angle,temp);
		my.pan=my_angle.pan;
		p2.x = 100000;
		p2.y = 0;
		p2.z = 0;
		my_angle.pan += Weap_Force[my.WeaponNumber-1] *(my._shot_counter-2.5)*random(5);
		my_angle.tilt += Weap_Force[my.WeaponNumber-1] *(my._shot_counter-2.5)*random(5);
		vec_rotate(p2,my_angle);
		vec_add(p2,p);
		indicator = _gunfire;
		damage=Weap_damage[my.WeaponNumber-1];
		trace_mode = ignore_me + ignore_passable + ignore_passents + activate_shoot;
		if (my._type==100)
		{
			e_upass(30,_type_player);
		}
		else
		{
			e_upass(30,100);
		}
		you = 0;
		result=trace(p,p2);
		if (you)
		{
			if (you._type == _type_player)
			{
				HeartPlayer( damage );}
		}else
		{
			ShotEffect();
		}
		if (my._type==100)
		{
			e_pass(30,_type_player);
		}
		else
		{
			e_pass(30,100);
		}
		if result>0
		{
			vec_set(p2,target);
		}
		Blt_Line();
}
