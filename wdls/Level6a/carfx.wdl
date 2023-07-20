bmap  MtlBright, <MetalBright.tga>;

function MetalParts()
{

if freeze_mode == 0 {


	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += my.vel_z*speed/600;

	my.skill_x-=(10*time);
	
	if(my.skill_x < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function Metal_Parts()
{
	/*my.z += (1 - random(2))/10;
	my.x += (1 - random(2))/10;
	my.y += (1 - random(2))/10;*/

	vec_to_angle( my_angle, my.vel_x);
	my_angle.pan +=random(70)-35;
	my_angle.tilt +=random(70)-35;

	my.vel_x = 10;
	my.vel_y = 0;
	my.vel_z = 0;
	vec_rotate( my.vel_x, my_angle);
	my.skill_x = 50;
	my.size = 1;
 	my.bmap = MtlBright;

	my.move = 0;
	my.flare = on;
	my.bright = on;
	my.alpha = 50;
	my.function =  MetalParts;

}


function Vihicle_SmokeFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += my.vel_z*speed/600;
	my.vel_z += my.skill_x* my.vel_z*speed/6000;
	my.vel_x *= my.skill_x* speed/6000;
	my.vel_y *= my.skill_x* speed/6000;

	my.alpha-=(1*time);
	my.size+=(0.75*time);
	
	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function Vihicle_Smoke
{
	my.z += (1 - random(2))/10;
	my.x += (1 - random(2))/10;
	my.y += (1 - random(2))/10;

	/*my.vel_x = ( 2 -random(4))/2;
	my.vel_y = ( 2 -random(4))/2 ;
	my.vel_z = ( 1 +random(1))*10;*/
	my.skill_x = random(15)/10;
	my.size = 50;
 	my.bmap = browndust_map;

	my.move = 0;
	my.flare = on;
	my.alpha = 50;
	my.function =  Vihicle_SmokeFunction;

}

function Ambflashing()
{
my.LeaderId = entity_to_pointer( you);
my.invisible = 1;
	wait(random(100));
my.invisible = 0;

my.passable = 1;
my.bright = 1;
my.transparent = 1;
my.scale_x=0.4;
my.scale_y=0.4;
my.scale_z=0.4;

while(1)
{
you = Pointer_To_Entity( my.LeaderId);

my.invisible =  you.CarBreaker <= 0;
//my.skill1+=7;
//my.alpha = (sin(my.skill1)+0.5)*100;

wait (1);
}
}

function Ambulancelightl()
{
you.RightFlash = me;
Ambflashing();
}

function Lamacar()
{
my.bright = 1;
my.invisible = 1;
my.alpha = 20;
my.frame = you.frame;
you.BrightId = me;
my.passable = 1;
my.scale_x = you.scale_x + 0.01;
my.scale_y = you.scale_y + 0.01;
my.scale_z = you.scale_z + 0.01;

}

function Ambulancelightr()
{my.invisible=1;
you.LeftFlash = me;
Ambflashing();

}

bmap carsmoke_map = <CarSmoke.tga>;


function Blacksmoke_car_property();	


function Blacksmoke_car() {
	my.move=on;

	my.size=random(5) + 5;
	my.bmap=carsmoke_map;
	my.flare=on;
	my.transparent=on;
	my.alpha=12.5;
	my.function=Blacksmoke_car_property;
}

function Blacksmoke_car_property() {
	my.alpha -= 1 ;
	//my.size -= 1 ;
	if (my.alpha <= 0) {
		my.lifespan = 0;
	}
}

function Short_CarSmoke(msk,vers,vdrd)
{
me=msk;

var svertex = vers;
var dvertex = vdrd;
 
 vec_for_vertex(temp,my,dvertex);
 vec_for_vertex(my_angle,my,svertex);

 my_angle.x -= temp.x;
 my_angle.y -= temp.y;
 my_angle.z -= temp.z;
 vec_to_angle(my_angle,my_angle);

 force.x = random(10) + 5;
 force.y = (random(1)-0.5)*1;
 force.z = (random(1)-0.5)*1;
 vec_rotate(force,my_angle);

 vec_for_vertex(temp,my,svertex);

 effect(Blacksmoke_car,1,temp,force);

}

function CarSmoke()
{
	Short_CarSmoke( me, VertexMSmoke[my._carorder], VertexFSmoke[my._carorder] );
}

function PosBright()
{
if (my.CarRef)
{

	PosYouMe( me,  my.BrightId);
	AngYouMe( me,  my.BrightId);

	you = my.BrightId;
	you.v += my.CarForce /50 ;
	}

}

function mpos()
{

my.scale_x =10;
my.scale_y =10;
my.scale_z =10;
my.passable =1;
wait (1);
}

function MyCurrTrafic2()
{
my.scale_x = lngth/10;
my.scale_y = 10;
my.scale_z = 10;
my.passable = 1;
wait(1);
remove me;
}

function tracesee(w,e)
{

var d1[3];
var Ps[3];
var Pe[3];

	d1.x=0;
	d1.y=0;
	d1.z=0;

	ps.x=0;
	ps.y=0;
	ps.z=0;

	pe.x=0;
	pe.y=0;
	pe.z=0;

vec_add(Ps, w);
vec_add(Pe, e);

		d1.x = (ps.x - pe.x)/2;
		d1.y = (ps.y - pe.y)/2;
		d1.z = (ps.z - pe.z)/2;
		
		vec_add( d1, pe);

		create( "RYFire.tga", ps, MyToRemove);
		create( "Pblack_smoke.tga", d1, MyToRemove);
		create( "Pblack_smoke.tga", pe, MyToRemove);


}

function MyCurrTrafic()
{
my.scale_x = lngth/10;
my.scale_y = 10;
vec_set(my.angle,my_angle);
my.passable = 1;
wait(1);
remove me;
}

function Mytarget()
{
//you.EnemyId = me;
my.LeaderId = entity_to_pointer( you);
my.passable = 1;
my.invisible = 1;
wait (10);
var stemp;
while(1)
{
	you = Pointer_To_Entity( my.LeaderId);
if (you.carforce>0)
{
	Stemp.x = you.carforce*10+500;
}
else
{
	Stemp.x = you.carforce*10-500;

}
	Stemp.y = 0;
	Stemp.z = 0;
	you = Pointer_To_Entity( you.LeaderId);
	vec_rotate( Stemp, you.angle);
	vec_add( Stemp, you.x);

	vec_set( my.x, Stemp);
	
wait(1);
}
}

function LowLight()
{
	my.passable = 1; 
	my.bright = 1;
	my.oriented = 1;
	my.ambient = 100;
	you.lolight = me;

}

function aTargetLight()
{
	my.passable = 1; 
	my.bright = 1;
	my.oriented = 1;
	my.ambient = 100;
	my.lightred = 100;
	my.lightgreen = 100;
	my.lightblue = 100;
	my.lightrange = 500;
	my.scale_x = 10;
	my.scale_y = 10;
	you.Targetlight = me;

}

function highLight()
{
	my.passable = 1; 
	my.ambient = 100;
	my.bright = 1;
	my.oriented = 1;
	you.hilight = me;

}

string RedLight,<red.tga>;
string GreenLight,<green.tga>;
string YellowLight,<yellow.tga>;

function LightingTrafic()
{
var CurrInc;
CurrInc = 1;
while (1)
{
	my.traficstat += CurrInc;
	if (my.traficstat >= 2)
	{
	CurrInc = -1;
	}else
	{
	 if (my.traficstat <= 0)
	  {
	   CurrInc = 1;

	  }
	}

	pos_by_vertex( my.lolight, me, VertexPosLL[my.traficstat]);
	pos_by_vertex( my.hilight, me, VertexPosHL[my.traficstat]);
	rotate2cam( my.lolight);
	rotate2cam( my.hilight);
	if (my.traficstat==0)
	{
		newmorph ( RedLight, my.lolight);
		newmorph ( RedLight, my.hilight);
	goto IncTraf;
	}

	if (my.traficstat==1)
	{
		newmorph ( YellowLight, my.lolight);
		newmorph ( YellowLight, my.hilight);
	goto IncTraf;
	}

	if (my.traficstat==2)
	{
		newmorph ( GreenLight, my.lolight);
		newmorph ( GreenLight, my.hilight);
	goto IncTraf;
	}

IncTraf:
	my.traficwait = 0;
	while (my.traficwait<50)
	{
		my.traficwait+=1;
		wait(1);
		rotate2cam( my.lolight);
		rotate2cam( my.hilight);
	}

	if (my.traficstat!=1)
	{
	my.traficwait = 0;
	while (my.traficwait<300)
	{
		my.traficwait+=1;
		wait(1);
		rotate2cam( my.lolight);
		rotate2cam( my.hilight);
	}
	}
}
}

function TraficSingle()
{
my.max_x *= 0.5;
my.max_y *= 0.5;
AddColl(me);

temp.x = 5000;
temp.y = -5000;
temp.z = 0;
vec_rotate( temp, my.angle);
vec_add( temp, my.pos);
temp.z += 500;

vec_set( my.singleposx, temp);

create( <RYFire.tga>, my.x, lowlight);
create( <RYFire.tga>, my.x, highLight);


my.singleangz =  my.pan;
my.singleangy =  my.tilt;
my.singleangx = my.roll;

my.SingleWidth  = 5000;
my.SingleHeight = 6000;
my.SingleLength = 1500;


my.passable = 1;
my.owntype = TypeOfTraficSingle;
my.enable_detect = on;
my.enable_scan= on;
wait(random(100));
LightingTrafic();
while(1)
{ 

if (my.traficstat==0)
{
	TraficeScan(me);
}

//testbox(me);
wait (1);

}
}

function energycol()
{

my.passable = 1;
my.wieght = 20;
my.max_x = 1;
my.max_y = 1;
AddColl(me);
create( <white.tga>, my.x, aTargetLight);
create( <white.tga>, my.x, lowlight);
create( <light.mdl>, my.x, highLight);

you = my.lolight;
you.scale_x = 0.3;
you.scale_y = 0.3;
you.scale_z = 0.3;
pos_by_vertex( you,me,36);
you = my.hilight;
you.scale_x = 5;
you.scale_y = 5;
you.scale_z = 30;
pos_by_vertex( you,me,36);

you = my.targetlight;
you.alpha = 25;

while (1)
{
rotate2cam( my.lolight);
you = my.hilight;
you.u+=0.1;

vec_for_vertex( temp,me,36);
my_angle.x = 0;
my_angle.y = 0;
my_angle.z = -10000;

vec_rotate(my_angle,my.angle);
vec_add( my_angle, temp);
trace_mode = ignore_me + ignore_passable + ignore_sprites + ignore_models;
trace( temp, my_angle);
you = my.targetlight;
vec_to_angle( you.angle, normal);

target.z = vec_dist(temp,target);

you = my.hilight;
you.scale_z = target.z /9.0;

you = my.targetlight;
target.x = 0;
target.y = 0;
target.z = -target.z + 1;
vec_rotate( target, my.angle);
vec_add( target, temp);
vec_set( you.pos, target);

if (my.EPassable )
{
break;
}
wait(1);
}
you = my.lolight;
remove you;
you = my.targetlight;
remove you;
you = my.hilight;
remove you;
RemoveColl(me);
/*while (1)
{
vec_set(my.CarBPan,my.pan);
TestBox(me);
if (my.EPassable )
{
break;
}
wait(1);
}*/
}

function terrain()
{
my.scale_x = 250;
my.scale_y = 250;
my.scale_z = 50;

var vertx;
var Svertx = 0;

while (1)
{
vertx = 0;
my.u+=1;
while(vertx <= 8100)
{
vec_for_mesh( temp, me, vertx);
temp.z = 10+sin( vertx +Svertx  )*sin( Svertx  )*10;
vec_to_mesh( temp, me, vertx);

vertx+=1;
}
Svertx += 1;
wait(1);
}
}
