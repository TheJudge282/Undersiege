bmap blacksmoke_map = <black_smoke.tga>;

bmap browndust_map=<brown_dust.tga>;

bmap AtomSmoke, <Dust.tga>;
bmap FireAtome=<RYFire.tga>;

bmap RYFire_map=<RYFire.tga>;

var fire_p;
var forces;

var explosionscale = 0.5;

function Blacksmoke_Trail_property();	
function Black_smoke2up_property();

function BigBlacksmoke_Trail() {
	my.vel_x=temp2.x;
	my.vel_z=temp2.z;
	my.vel_y=temp2.y;
	my.move=0;
	my.size=50;
	my.bmap=blacksmoke_map;
	my.flare=on;
	my.transparent=on;
	my.alpha=10;
	my.lifespan=100;
	my.function=Blacksmoke_Trail_property;
}

function Black_smoke2up() {
	my.vel_x=temp2.x;
	my.vel_z=temp2.z;
	my.move=0;
	my.vel_y=temp2.y;
	my.size=20+random(20);
	my.bmap=blacksmoke_map;
	my.flare=on;
	my.transparent=on;
	my.alpha=10;
	my.lifespan=100;
	my.function=Black_smoke2up_property;
}


function Blacksmoke_Trail() {
	my.vel_x=temp2.x;
	my.vel_z=temp2.z;
	my.move=0;
	my.vel_y=temp2.y;
	my.size=15;
	my.bmap = AtomSmoke;
	my.flare=on;
	my.transparent=on;
	my.alpha=10;
	my.lifespan=100;
	my.function=Blacksmoke_Trail_property;
}

function Black_smoke2up_property() {
if (freeze_mode)
{

	my.lifespan += 1;
}
else
{

	my.x += my.vel_x*speed/200;
	my.y += my.vel_y*speed/200;
	my.z += my.vel_z*speed/200;
	my.alpha-=0.1*speed/200;
	my.lifespan += 1;
	if (my.alpha<=0) {
		my.lifespan=0;
	}
}
}

function Blacksmoke_Trail_property() {
if (freeze_mode)
{

	my.lifespan += 1;
}
else
{


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
play_entsound( me, MallaExplosion, 1000000);

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
 if (you.skill6 == -100)
 {temp.z = 400;
 }
 else
 {temp.z = 250;
 }

 
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

function FireUpSk_property() {
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
	my.x += my.vel_x*speed/100;
	my.y += my.vel_y*speed/100;
	my.z += my.vel_z*speed/100;
	temp.x = my.red   ;
	temp.y = my.green ;
	temp.z = my.blue  ;
	vec_to_angle( my_angle, temp);
	temp.x = max(0,vec_length( temp)-speed/20);
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	my.red   = temp.x ;
	my.green = temp.y ;
	my.blue  = temp.z ;

	my.bright = vec_length( temp)>128;

	my.alpha-=speed/100;
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

//bmap blacks=<BlcSml.tga>;

function BlackMinismokeup() {
	my.size=100+random(25);
	my.bmap= FireAtome;
	/*my.red = my.vel_x;
	my.green = my.vel_y;
	my.blue = my.vel_z;*/
	my.bright = 1;
	my.vel_x = 0;
	my.vel_y = 0;
	my.vel_z = 5+random(5);
	my.move=0;
	my.alpha=60+random(40);
	my.function=FireUpSk_property;
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

function ExplsionWallEffFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += my.vel_z*speed/600;
	my.vel_z -= 2;
	my.alpha-=(2);
	my.size+=(0.75);
	
	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function ExplsionWallEff
{
	my.size = random(100)+50;
 	my.bmap = AtomSmoke;

	my.move = 0;
	my.alpha = 40;
	my.function = ExplsionWallEffFunction;

}

function WallFlyEffFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/60;
	my.y += my.vel_y*speed/60;
	my.z += my.vel_z*speed/60;
	my.skill_x-=(5);
	if(my.skill_x < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function WallFlyEff
{
	my.size = random(20);
 	my.bmap = AtomSmoke;

	my.move = 0;
	my.alpha = 20;
	my.skill_x = 40;
	my.function = WallFlyEffFunction;

}

function ExplodedWallFunc()
{
 my.skill1 = 0;

while (my.skill1<10)
 {
 my.skill1 += 1;
 my.skill2 = 0;
 	while (my.skill2<(10+random(10)))
 	{
		temp.x = (random(20)-5)*2;
		temp.y = 0;
		temp.z = 0;
		vec_set( my_angle, my.skill6);
		my_angle.x += random(10)-5;
		my_angle.y += random(10)-5;
		vec_rotate( temp, my_angle);
		temp2.x = 0;
		temp2.y = (100 - random(200));
		temp2.z = (100 - random(200));
		vec_rotate( temp2, my_angle);
		vec_add( temp2, my.pos);
		effect( ExplsionWallEff, 1, temp2, temp);
		if (random(10)>5)
		{
			temp.x = (random(20)-5)*2;
			temp.y = 0;
			temp.z = 0;
			vec_set( my_angle, my.skill6);
			my_angle.x += random(90)-45;
			my_angle.y += random(90)-45;
			vec_rotate( temp, my_angle);
			effect( WallFlyEff, 1, my.pos, temp);
		}
		my.skill2+=1;
	}
 wait(1);
 }
 if (my.flag2)
 {
	 remove me;
 }else
 {
	 my.flag2 = 1;
 }
}

function ExplodedWall()
{
 ExplodedWallFunc();
 if (you)
 {
  vec_set( my.skill6, normal);
 }

 indicator = _explode;
 temp.pan  = 360;
 temp.tilt = 360;
 temp.z = 150;
 my.flag1  = 1;
 scan(my.pos,my.angle,temp);

 my.bright = 1;
 my.light  = 1;
 my.passable  = 1;

 my.scale_x = 1.2;
 my.scale_y = my.scale_x;
 my.scale_z = my.scale_x;

 temp.x = camera.x - my.x;
 temp.y = camera.y - my.y;
 temp.z = camera.z - my.z;
 vec_to_angle( my.pan, temp);
 my.lightrange = 500;

 my.lightred   = 255;
 my.lightgreen = 255;
 my.lightblue  = 255;
  while (my.frameanim<100)
  {
	my.frameanim+=15;
	my.skin = my.frameanim*7/100;
	ent_frame(  "frame", my.frameanim);
	my.lightrange  = max( 10, 50- my.frameanim)*10;
	wait(1);
  }
 if (my.flag2)
 {
	remove me;
 }else
 {
	my.flag2 = 1;
	my.invisible = 1;
 }
}


function ExplosionWall()
{
nothing :
while (my.flag1==0)
{
	wait(1);
}
temp2.x = 0;
temp2.y = 0;//(200 - random(400));
temp2.z = 0;//(100 - random(200));
vec_rotate( temp2, my_angle);
vec_add( temp2, my.pos);
vec_set( normal, my.pan);
normal.x -= 90;
create( <xplosion.mdl>, temp2, ExplodedWall);
str_for_entname( name, me);
morph ( name, me);
wait(1);
my.flag1=0;
goto nothing;
} 

