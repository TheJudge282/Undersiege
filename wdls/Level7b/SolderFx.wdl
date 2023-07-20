
function My2Line()
{
	my.scale_x = lngth;
	my.scale_y = 0.1;
	my.oriented = 1;
	my.flare = 1;
	//my.near = 1;
	vec_set(my.angle,my_angle);
	//my.tilt+=90;
	my.passable = 1;
	wait(1);
	remove me;
}



function create2line()
{
	vec_set(temp,  PointParameters[ PointPos]);

	temp.x = PointParameters[ PointPos]- PointParameters[ PointDirction];
	temp.y = PointParameters[ PointPos+1]- PointParameters[ PointDirction+1];
	temp.z = PointParameters[ PointPos+2]- PointParameters[ PointDirction+2];

	vec_to_angle( my_angle, temp);
	Lngth = vec_length(temp);
	temp.x = Lngth / 2;
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add(temp,  PointParameters[ PointDirction]);
	Lngth /= 10;
	create( <trf2.mdl>, temp, My2Line);
}



function My3DLine()
{
	if (key_y)
	{
		my.scale_x = lngth;
		//my.scale_y = 0.2;
		//my.scale_z = 0.2;

		//my.flare = 1;
		//my.near = 1;
		vec_set(my.angle,my_angle);
		my.passable = 1;
		wait(1);
	}
	remove me;
}

function My23DLine()
{
if (key_y)
{
	my.scale_x = lngth;
	my.scale_y = 0.2;
	my.scale_z = 0.2;

	my.flare = 1;
	my.alpha = 20;
	vec_set(my.angle,my_angle);
	my.passable = 1;
	wait(1);
}
	remove me;
}


function MyLine()
{
	if (lngth>10)
	{

		my.passable = 1;
		my.bright = 1;
		my.oriented = 1;
		vec_set( temp, P2);
		vec_sub( temp, my.x);
		my.scale_y = vec_length(temp)/256;
		my.scale_x = my.scale_y/1000;
		vec_to_angle(my.angle,temp);
		my.tilt += 90;
		wait(1);
		remove me;
	}
	remove me;
}


function Blt_Line()
{

	temp.x = p2.x- p.x;
	temp.y = p2.y- p.y;
	temp.z = p2.z- p.z;

	vec_to_angle( my_angle, temp);
	Lngth = vec_length(temp);
	temp.x = Lngth *0.5;//(1+ random(10)/20);
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add(temp, p);
	Lngth /= 100;
	create( <blteffect.tga>, temp, MyLine);
}



function createline()
{
	temp.x = P2.x - P.x;
	temp.y = P2.y - P.y;
	temp.z = P2.z - P.z;

	vec_to_angle( my_angle, temp);
	Lngth = vec_length(temp);
	temp.x = Lngth / 2;
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add( temp,  P);
	Lngth /= 10;
	create( <trf.mdl>, temp, My23DLine);
	return( you);
}


function create3Dline()
{

	you = Pointer_To_Entity( my.EnemyId);

	/*temp.x = you.x - my.x;
	temp.y = you.y - my.y;
	temp.z = you.z - my.z;
	*/

	temp.x = my._target_x - my.x;
	temp.y = my._target_y - my.y;
	temp.z = 0;//my.z - my.z;

	vec_to_angle( my_angle, temp);
	Lngth = vec_length(temp);
	temp.x = Lngth / 2;
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add(temp,  my.x);
	Lngth /= 10;
	create( <trf.mdl>, temp, My3DLine);
}
function create3DEline()
{

	you = Pointer_To_Entity( my.EnemyId);
	if (you==0)
	{
		return;
	}
	temp.x = you.x - my.x;
	temp.y = you.y - my.y;
	temp.z = you.z - my.z;

	vec_to_angle( my_angle, temp);
	Lngth = vec_length(temp);
	temp.x = Lngth / 2;
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add(temp,  my.x);
	Lngth /= 10;
	create( <trf.mdl>, temp, My3DLine);
}

function PaPoint1()
{
my.VertexCount = GetVertexNum(me);
my.invisible = 1;
my.passable = 1;
wait(10);
my.skill1 = 0;

while (my.skill1<=my.VertexCount)
{
	vec_for_vertex( PointParameters[ PointPos], me, my.skill1);
	Add_PathPoint();
	CalcVisPoint();
	my.skill1+=1;
}
remove me;
}

function PaPoint()
{
// my.invisible = 1; 
 remove me;	return;

 
 my.passable = 1;
 wait(1);
 if (my.flag1==0)
 {

	 trace_mode = ignore_me + ignore_passable;
	 vec_set( temp, my.pos);
	 temp.z-=4000;
	 temp.z  = trace( my.x, temp)-15;
	 my.z -= temp.z;
 }
wait(1);
 vec_set( PointParameters[ PointPos], my.x);
 Add_PathPoint();
 CalcVisPoint();
 remove me;
}

function see_point4()
{
	my.passable=1;
	sonar(me,5000);
	my.z-=result.x-5;
//	my.invisible=1;
	add_point(me);
	remove me;
}

function AddPoinFrmVertx(Num)
{
	vec_for_vertex( temp, me, Num);
	vec_set(PointParameters[PointPos],temp);
	vec_set( PointParameters[PointDirction], my.pos);
	Add_HPoint(me);

}

function Hide_Point()
{
	my.passable=1;
	wait(1);
	//sonar(me,5000);
//	my.z-=result.x-50;
	PointParameters[PointLeft] = 0;
	AddPoinFrmVertx(2);
	PointParameters[PointLeft] = 1;
	AddPoinFrmVertx(3);
	remove me;
}

function Hide_Point2()
{
	my.passable=1;
	wait(1);
	PointParameters[PointLeft] = my.skill1;
	AddPoinFrmVertx(2);
	remove me;
}
