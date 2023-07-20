bmap blacksmoke_map = <black_smoke.tga>;

bmap browndust_map=<brown_dust.tga>;

bmap AtomSmoke, <Dust.tga>;
bmap FireAtome=<RYFire.tga>;

bmap RYFire_map=<RYFire.tga>;

var fire_p;
var forces;

var explosionscale = 0.5;


function BlackSmokeFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/200;
	my.y += my.vel_y*speed/200;
	my.z += my.vel_z*speed/200;

	my.alpha -= 10*speed/200;

	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function BlacksmokeTrail() {
	my.vel_x /= 10;
	my.vel_z /= 10;
	my.vel_y /= 10;
	my.red   =0;
	my.green =0;
	my.blue  =0;
	my.move=0;
	my.size=50;
	my.bmap=AtomSmoke;
	my.alpha=100;
	my.lifespan=100;
	my.function=BlackSmokeFunction;
}


function NBulletSmokeFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += (my.vel_z+(1-my.bright)*2)*speed/600;

	my.alpha-=(2)-(1-my.bright);
	my.size+=(1.5*explosionscale);
	
	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function BlackSmoke
{
	my.z += (1 - random(2))/100;
	my.x += (1 - random(2))/100;
	my.y += (1 - random(2))/100;

	my.size  =  my.vel_x*4*explosionscale;
	my.red   = -min(my.vel_x *3, 255);
	my.blue  = -min(my.vel_x *3, 255);
	my.green = -min(my.vel_x *3, 255);
	my.bright = my.vel_x<50;
	my.vel_x = ( 2 -random(4))/20;
	my.vel_y = ( 2 -random(4))/20 ;
	my.vel_z = ( 1 +random(1));

 	my.bmap = FireAtome;

	my.move = 0;
	my.alpha = 50;
	my.function = NBulletSmokeFunction;

}

function NBulletSmokeFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += (my.vel_z+(1-my.bright)*2)*speed/600;

	my.alpha-=(2)-(1-my.bright);
	my.size+=(1.5*explosionscale);
	
	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function NBulletSmokFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += (my.vel_z+(1-my.bright)*2)*speed/600;

	my.alpha-=(9)-(1-my.bright);
	my.size+=(1.5*explosionscale);
	
	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function PartsThrow
{
	my.z += (1 - random(2))/100;
	my.x += (1 - random(2))/100;
	my.y += (1 - random(2))/100;

	my.red   = my.vel_x;
	my.green = my.vel_y;
	my.blue  = my.vel_z;
	my.size  = 100;
	my.vel_x = 25;
	my.vel_y = 0;
	my.vel_z = 0;
	my_angle.x = random(360);
	my_angle.y = random(360);
	vec_rotate( my.vel_x, my_angle);
 	my.bmap = AtomSmoke;

	my.move = 0;
	my.alpha = 100;
	my.function = NBulletSmokFunction;

}

function AtomicExplosion()
{
my.invisible = 1;
my.passable  = 1;
my.tilt = 90;
my.scale_x = 3*explosionscale;
my.scale_y = 6*explosionscale;
my.scale_z = 6*explosionscale;
my.light = 1;

my.lightred = 255;
my.lightgreen = 150;
my.lightblue = 50;
my.lightrange = 1000;

while (my.skill1<100)
{	my.z += 1;
	my.skill2 = 0;
	while (my.skill2<6)
	{

		ent_frame( "frame", my.skill1);
		vec_for_vertex( temp, me, my.skill2);
		my_angle.x = 20+my.skill1;
		effect( BlackSmoke, 1, temp, my_angle);
		my.skill1+=(speed/100);
		my.skill2+=1;
	my.roll = random( 360);
	}
	wait(1); 
}
remove me;
}

function CandleFire()
{
my.invisible = 1;
my.passable  = 1;
my.scale_x = 2;
my.scale_y = 2;
my.scale_z = 2;
my.light = 1;

my.lightred = 255;
my.lightgreen = 150;
my.lightblue = 50;
my.skill3=1;
while (1)
{
	my.skill2 = 0;
	while (my.skill2<5)
	{

		ent_frame( "frame", my.skill1);
		vec_for_vertex( temp, me, my.skill2);
		my_angle.x = 20 + my.skill1;
		effect( BlackSmoke, 1, temp, my_angle);
		my.skill1+=my.skill3*((speed/100)*(0+random(2))+my.skill1/20);
		my.skill2+=1;
		my.roll = random( 360);
		my.lightrange = 100+  my.skill1/10;
		if (my.skill1>=100)
		{	my.skill1=10;}
		/*		if (my.skill1>=100)
		{	my.skill3=-1;}else
		{if (my.skill1<=0)
		{	my.skill3=1;}}*/
	 if (random(10)>5)
	 {
	  wait(1); 
	 }
	}
	wait(1); 
}
}

function ExplosionsTga()
{

 my.flag3 = 1-you.flag3;
 indicator = _explode;
 temp.pan  = 360;
 temp.tilt = 360;
 temp.z = 150;
 my.flag1  = you.flag2 == 1;
 scan(my.pos,my.angle,temp);
if (my.flag3)
{
 play_entsound( me, grenadex,10000);
}else
{
 play_entsound( me, gazExplosion,10000);

}
 my.bright = 1;
 my.light  = 1;
 my.passable  = 1;

 my.scale_x = 1.2;
 my.scale_y = 1.2;
 my.scale_z = 1.2;
 temp.x = camera.x - my.x;
 temp.y = camera.y - my.y;
 temp.z = camera.z - my.z;
 vec_to_angle( my.pan, temp);
 my.lightrange = 500;

 my.lightred   = 50+130*my.flag3;
 my.lightgreen = 50+110*my.flag3;
 my.lightblue  = 50+80*my.flag3;

 my_angle.x = my.lightred;
 my_angle.y = my.lightgreen;
 my_angle.z = my.lightblue;
 effect( PartsThrow, 5, my.pos, my_angle);
while (my.frameanim<100)
{
 my_angle.x = my.lightred;
 my_angle.y = my.lightgreen;
 my_angle.z = my.lightblue;
 effect( PartsThrow, 5, my.pos, my_angle);
 if (my.flag3==0)
 {
	temp.x = random(50)+50;
	temp.y = 0;
	temp.z = 0;
	temp2.x = random(360);
	temp2.y = random(180)-90;
	vec_rotate( temp, temp2);
	vec_add( temp, my.x);
	effect( PartsThrow, 5, temp, my_angle);
 }
	my.frameanim+=15;
	my.skin = my.frameanim*7/100;
	ent_frame(  "frame", my.frameanim);
	my.lightrange  = max( 0, 50- my.frameanim)*10;
	wait(1);
}
my.invisible =1;
wait(1000);
remove me;
}

function Black_smokeup_property() {
if (freeze_mode)
{

	my.lifespan += 1;
}
else
{


	if (my.size>0.1*speed/200)
	{
		my.size-=0.1*speed/200;
	}
	my.x += my.vel_x*speed/200;
	my.y += my.vel_y*speed/200;
	my.z += my.vel_z*speed/200;
	my.alpha-=speed/200;
	my.lifespan += 1;
	if (my.alpha<=0) {
		my.lifespan=0;
	}
}

}

function Black_smokeup() {
	my.size=300+random(50);
	my.bmap=AtomSmoke;
	my.red = my.vel_x;
	my.green = my.vel_y;
	my.blue = my.vel_z;
	my.vel_x = 0;
	my.vel_y = 0;
	my.vel_z = 5+random(5);
	my.move=0;
	my.alpha=60+random(40);
	my.function=Black_smokeup_property;
}

function Blacksmokeup() {
	my.size=150+random(50);
	my.bmap=AtomSmoke;
	my.red = my.vel_x;
	my.green = my.vel_y;
	my.blue = my.vel_z;
	my.vel_x = 0;
	my.vel_y = 0;
	my.vel_z = 5+random(5);
	my.move=0;
	my.alpha=60+random(40);
	my.function=Black_smokeup_property;
}

function Smoky()
{

my.invisible = 1;
ent_path("smoke_path");
ent_waypoint(my.skill1,1);
ent_nextpoint(my.skill4);
while(vec_dist(my.skill1,my.skill4)>1)
{

	temp.x = my.skill4 - my.skill1;
	temp.y = my.skill5 - my.skill2;
	temp.z = my.skill6 - my.skill3;
	vec_to_angle( my_angle, temp);

	temp.x = min(my.skill7 + random(my.skill7 ) , vec_dist(my.skill1,my.skill4));
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add( my.skill1, temp);
	temp.x = 0;
	temp.y = 0;
	temp.z = 2;

	effect(Black_smokeup,1,my.skill1,my.skill10);	
}

while (1)
{
ent_nextpoint(my.skill4);

while(vec_dist(my.skill1,my.skill4)>1)
{

	temp.x = my.skill4 - my.skill1;
	temp.y = my.skill5 - my.skill2;
	temp.z = my.skill6 - my.skill3;
	vec_to_angle( my_angle, temp);

	temp.x = min(my.skill7 + random(my.skill7 ) , vec_dist(my.skill1,my.skill4));
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add( my.skill1, temp);
	temp.x = 0;
	temp.y = 0;
	temp.z = 2;

	effect(Black_smokeup,1,my.skill1,my.skill10);	
}

wait(1);
}
}
