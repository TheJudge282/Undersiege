function CustomCamera(s)
{
my = s;
_camera_ins();
vec_set( temp, posc);

my_angle.pan = my.pan+panc.x;
my_angle.tilt = panc.y;
my_angle.roll = panc.z;

vec_rotate(temp,my_angle);
vec_add(temp,my.x);
vec_set(camera.x,temp);

temp.x = my.x - camera.x;
temp.y = my.y - camera.y;
temp.z = my.z - camera.z;

vec_to_angle(camera.pan,temp);

}

var lasttarget;
var CameraForce;

function UPBackCam(s)
{ 
	if (key_p!=0)
	{
	 return;
	}
	me = s;
	if ( my.force>=0)
	{
	  lasttarget.y = max( lasttarget.y - 10, -500);
	}
	else
	{
	  lasttarget.y = min( lasttarget.y + 10, 500);
	}
	 CameraForce.x = nearnumber( CameraForce.x, my.force*2, 1);
	 you = Pointer_To_Entity( my.LeaderId);
	 temp.x = lasttarget.y + CameraForce.x ;
	 temp.y = 00;
	 temp.z = 100 +( 500 - abs(lasttarget.y));
	 //vec_set( my_angle, my.pan);
	 lasttarget = nearnumber(maxminnum(nearaangle( lasttarget, ang(lasttarget.z -my.pan ), 1),45),0,0.5);
	 you = Pointer_To_Entity( my.LeaderId);
	 
	 lasttarget.z = ang(my.pan + sin(you.CarAcedant*10)*cos(you.CarAcedant)*5 + lasttarget);
	 my_angle   = lasttarget.z; 
	 my_angle.y = 0;
	 my_angle.z = 0;
	 vec_rotate(temp,my_angle);
	 vec_add(temp,my.x);
	 vec_set(camera.x,temp);

	 temp.x = my.x - camera.x;
	 temp.y = my.y - camera.y;
	 temp.z = my.z - camera.z + 50;
	 vec_to_angle(camera.pan,temp);
	 camera.roll = 0;//(lasttarget.y*360/500)/1;
/*
	 vec_to_angle(my_angle,temp);
	 camera.pan = nearaangle(camera.pan, my_angle.pan, 10);
	 camera.tilt = nearaangle( camera.tilt, my_angle.tilt, 10);*/
}

function PUPBackCam(s)
{ 
	if (key_p!=0)
	{
	 return;
	}
	me = s;
	if ( my.force>=0)
	{
	  lasttarget.y = max( lasttarget.y - 10, -500);
	}
	else
	{
	  lasttarget.y = min( lasttarget.y + 10, 500);
	}
	 CameraForce.x = nearnumber( CameraForce.x, my.force*2, 1);
	 temp.x = lasttarget.y + CameraForce.x ;
	 temp.y = 00;
	 temp.z = 50 +( 500 - abs(lasttarget.y));

	 lasttarget = nearnumber(maxminnum(nearaangle( lasttarget, ang(lasttarget.z -my.pan ), 1),45),0,0.5);
	 
	 lasttarget.z = ang(my.pan + lasttarget);
	 my_angle   = lasttarget.z; 
	 my_angle.y = 0;
	 my_angle.z = 0;
	 vec_rotate(temp,my_angle);
	 vec_add(temp,my.x);
	 vec_set(camera.x,temp);

	 temp.x = my.x - camera.x;
	 temp.y = my.y - camera.y;
	 temp.z = my.z - camera.z + 50;
	 vec_to_angle(camera.pan,temp);
/*
	 vec_to_angle(my_angle,temp);
	 camera.pan = nearaangle(camera.pan, my_angle.pan, 10);
	 camera.tilt = nearaangle( camera.tilt, my_angle.tilt, 10);*/
}

var LCamRot;
var LCamPos;

function RotCam(s)
{ 
	if (key_p!=0)
	{
	 return;
	}
	me = s;
	temp.x = -(lcampos.x - my.x);
	temp.y = -(lcampos.y - my.y);
	temp.z = -(lcampos.z - my.z);

	vec_to_angle( my_angle, temp);
	temp.x = -1000;
	temp.y = 0;
	temp.z = 0;
	vec_add( temp, my.pos);

	temp.x = (temp.x - lcampos.x);	 
	temp.y = (temp.y - lcampos.y);	 
	temp.z = (temp.z - lcampos.z);	 

	vec_to_angle( my_angle, temp);
	temp.x = min(1000,vec_length(temp)/20);
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add( lcampos, temp);
	temp.x = -(lcampos.x - my.x);
	temp.y = -(lcampos.y - my.y);
	temp.z = -(lcampos.z - my.z);

	vec_to_angle( my_angle, temp);

	vec_set( LCamRot, my_angle);
	vec_set( camera.x, lcampos);
	camera.pan = LCamRot.x;
	camera.tilt = LCamRot.y;
	camera.roll = maxminnum((vec_length(temp)-100)/100,85);

}

function Frontcam(s)
{ 
me = s;

	if (key_p!=0)
	{
	 return;
	}
vec_set(camera.x,my.x);
camera.z+=100;
vec_set(camera.pan,my.pan);
/*camera.pan = nearaangle( camera.pan , my.pan , 5 );
camera.tilt = nearaangle( camera.tilt , my.tilt , 5 );
camera.roll = nearaangle( camera.roll , my.roll , 5 );*/
	/*
	 temp.x = 300;
	 temp.y = 0;
	 temp.z = 0;
	 vec_rotate(temp,my.pan);
	 vec_add(temp,my.x);
	 vec_set(camera.x,temp);

	 temp.x = my.x - camera.x;
	 temp.y = my.y - camera.y;
	 temp.z = my.z - camera.z;
	 vec_to_angle(camera.pan,temp);*/
}


function LeftCam(s)
{ 
me = s;
	if (key_p!=0)
	{
	 return;
	}
	 temp.x = 0;
	 temp.y = -200;
	 temp.z = 0;
	 my_angle.x = my.pan;
	 my_angle.y = 0;
	 vec_rotate(temp,my_angle);
	 vec_add(temp,my.x);
	 vec_set(camera.x,temp);

	 temp.x = my.x - camera.x;
	 temp.y = my.y - camera.y;
	 temp.z = my.z - camera.z;
	 vec_to_angle(camera.pan,temp);
}


function RightCam(s)
{ 
me = s;
	if (key_p!=0)
	{
	 return;
	}
	 temp.x = 0;
	 temp.y = 200;
	 temp.z = 0;
	 my_angle.x = my.pan;
	 my_angle.y = 0;
	 vec_rotate(temp,my_angle);
	 vec_add(temp,my.x);
	 vec_set(camera.x,temp);

	 temp.x = my.x - camera.x;
	 temp.y = my.y - camera.y;
	 temp.z = my.z - camera.z;
	 vec_to_angle(camera.pan,temp);
}


function UpperCam(s)
{ 
me = s;
	if (key_p!=0)
	{
	 return;
	}
	 vec_set(camera.x,my.x);
	 camera.z += 3000;
	 temp.x = my.x - camera.x;
	 temp.y = my.y - camera.y;
	 temp.z = my.z - camera.z;
	 vec_to_angle(camera.pan,temp);
}

entity* CameraWater;

function CamerzainWater()
{
 CameraWater = me;
 my.passable = 1;
 my.alpha = 20;
 my.near = 1;

}

function EyeCamera(s)
{ 
   me = s;
	CameraHi[1] +=2;
	CameraHi[0] = 35 + SoulderHI[0]+2.5+sin(CameraHi[1])*1;
	vec_set( camera.x, my.x);
	camera.z-=PlaCru.z*my.max_z/3;
	camera.z += CameraHi[0];//+ sin(CamraPan)*2.5;
	camera.pan = my.pan;
	camera.tilt = (my.MyTilt*115/85)-70;
//	camera.roll = 0;//sin(CamraPan)/2;
	if (camera.arc!=60)
	{
		camera.tilt += sin(CameraHi[1]  ) * 0.1;
		camera.pan += sin(CameraHi[1]/2) * 0.1;
	}

		temp = ent_content(null,camera.x);

		if (CameraWater)
		{
		CameraWater.invisible = (temp == content_passable)==0;
			if (CameraWater.invisible==0)
			{
				CameraWater.u +=10;
				vec_set( CameraWater.x, camera.x);

			}
		}

}

function RotCaem(s)
{ 
me = s;
	if (key_p!=0)
	{
	 return;
	}
	 temp.x = my.x - camera.x;
	 temp.y = my.y - camera.y;
	 temp.z = my.z - camera.z;
	 vec_to_angle(camera.pan,temp);
}

var CameraDist;

function FreeCamera(s)
{ 
me = s;

	if (key_p!=0)
	{
	 return;
	}
}

function TpsCamera123(s)
{ 
me = s;
	if (key_p!=0)
	{
	 return;
	}
	you = me;//ptr_for_handle(my.HeadLnk);
	camera.pan = my.pan;
	camera.tilt = (my.MyTilt*115/85)-70 ;//+ sin(CamraPan)/2;
	camera.roll = 0;
	CollisionEntity.passable = 0;
	//CollisionEntity.invisible = 0;
	move_mode = ignore_passable + ignore_models + ignore_sprites;

	temp.x = my.max_x;
	temp.y = -0;
	temp.z = 30;
	vec_rotate( temp, my.pan);
	vec_set( CollisionEntity.pos, temp);
	vec_add( CollisionEntity.pos, you.pos);
	vec_set( p, CollisionEntity.pos);
	//vec_set( temp2, CollisionEntity.pos);

	temp2.x = 0;
	temp2.y = -20;
	temp2.z = 30;
	vec_rotate( temp2, my.pan);
	me = CollisionEntity;
	ent_move( temp2, nullskill);
	vec_set( p2, CollisionEntity.pos);
	//createline();
	vec_set( p, CollisionEntity.pos);
	vec_add( temp2, you.pos);
	
	
	temp.x = -100 + camera.tilt;//+ abs(camera.tilt)*1;
	temp.y = 0;//-abs(camera.tilt)*0.25;
	temp.z = 0;//abs(camera.tilt)*0.5;

	vec_rotate( temp, camera.pan);
	//move( CollisionEntity, temp, nullskill);
	ent_move( temp, nullskill);
	vec_set( p2, CollisionEntity.pos);
	//createline();

	CollisionEntity.passable = 1;

	//vec_set( camera.x, CollisionEntity.pos);
	CameraDist.y =vec_dist( CollisionEntity.x , temp2);
	CameraDist.x = nearnumber( CameraDist.x, max(CameraDist.y-10,0), 10);//max(abs( CameraDist.x- CameraDist.y)/5,10));

	temp.x = -CameraDist.x;
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, camera.pan);
	vec_add( temp,  temp2);
	
	vec_set(camera.x , temp);
	
	return(CameraDist.x);

}

var camera_dist[4] = 150,10,0,0;
function TpsCamera(junc)
{
	var   vec_view_target[3];
	var temp_cdist;
	my = junc;
	if (my != null)
	{

 		camera.diameter = 0;
		//camera.genius = my;


 		camera.pan = my.pan;

		camera.tilt = (my.MyTilt*115/85)-70;
		camera_dist.z = -(my.max_z-my.min_z)*0.5;


		vec_set(vec_view_target.x,my.x);
		vec_view_target.z-=PlaCru.z*my.max_z/4;

		vec_view_target.z += (my.max_z)*0.5;
		temp.x = 0;
		temp.y = -10;
		temp.z = 0;
		vec_rotate( temp, my.pan); vec_add( vec_view_target, temp);


		vec_set(temp,camera_dist);
		temp.x -= abs(sin(camera.tilt)*100);
		vec_scale(temp,-1);

		temp2 = my.tilt;
		my.tilt = camera.tilt;
		vec_rotate(temp,my.pan);
		my.tilt = temp2;


		vec_add(temp,my.x);
		temp.z-=PlaCru.z*my.max_z/4;

		temp2 = 1;
		temp_cdist.x += temp.x - temp_cdist.x;
		temp_cdist.y += temp.y - temp_cdist.y;
		temp_cdist.z += temp.z - temp_cdist.z;


		vec_diff( temp2.x, temp_cdist.x, vec_view_target.x);
		vec_normalize( temp2.x, 16);
		vec_add( temp2.x, temp_cdist.x);

		trace_mode = ignore_me + ignore_passable + ignore_models + ignore_sprites;
		if( trace(vec_view_target.x,temp2.x) > 0)
		{

			vec_diff(temp2.x,vec_view_target.x,target.x);
			vec_normalize(temp2.x,16);

			vec_set(camera.x,target.x);
			vec_add(camera.x,temp2.x);
		}
		else
		{
			vec_set(camera.x,temp_cdist.x);
		}

		temp = ent_content(null,camera.x);

		if (CameraWater)
		{
		CameraWater.invisible = (temp == content_passable)==0;
			if (CameraWater.invisible==0)
			{
				CameraWater.u +=10;
				vec_set( CameraWater.x, camera.x);

			}
		}

	}

}
