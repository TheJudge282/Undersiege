function newmorph(CString,CmY)
{
	me = CmY;
	PTempstr = CString;
	morph ( PTempstr, me);
}


function rotate2cam(rmy)
{
my = rmy;
var kd;
kd.x = my.x - camera.x;
kd.y = my.y - camera.y;
kd.z = my.z - camera.z;
vec_to_angle(my.pan,kd);
wait(1);

}

function camera_xyz()
{
	vec_rotate(my_pos,camera.pan);
	my_pos.x += camera.x;
	my_pos.y += camera.y;
	my_pos.z += camera.z;
}

function pos_for_vertex(mye,youe,posvert,rotvert)
{
     me = mye;
     you = youe;
     vec_for_vertex(you.pos,me, posvert);

     vec_for_vertex(temp,me, rotvert);

     temp.x = temp.x - you.x;
     temp.y = temp.y - you.y;
     temp.z = temp.z - you.z;
     vec_to_angle(my_angle,temp);
     you.tilt = my_angle.tilt;
     you.pan  = my_angle.pan ;

}

function pos_by_vertex(f,s,fv)
{
	you = f;
	me = s;
	vec_for_vertex( you.x, me, fv);
}


function rote_by_vertex(f,s,fv)
{

	me = s;
	you = f;

	vec_for_vertex ( temp, me, fv);
	temp.x = temp.x - you.x;
	temp.y = temp.y - you.y;
	temp.z = temp.z - you.z;

	vec_to_angle( temp, temp);
	you.pan = temp.pan;
	you.tilt = temp.tilt;
}


function rote_Cby_vertex(f,s,fv)
{

	me = s;
	you = f;

	vec_for_vertex ( temp, me, fv);
	temp.x = temp.x - you.x;
	temp.y = temp.y - you.y;
	temp.z = temp.z - you.z;

	vec_to_angle( temp, temp);
	you.tilt = temp.tilt;
}

function roll_by_vertex(f,s,fv)
{

	me = s;
	you = f;

	vec_for_vertex ( temp, me, fv);
	temp.x = temp.x - you.x;
	temp.y = temp.y - you.y;
	temp.z = temp.z - you.z;

	vec_to_angle( temp, temp);
	you.roll = temp.x+90;
}

function PosYouMe(f,s)
{
	me = f;
	you = s;
	vec_set( you.pos, my.pos);
}

function AngYouMe(f,s)
{

	me = f;
	you = s;
	vec_set( you.pan, my.pan);
}

