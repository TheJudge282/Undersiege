
bmap rain_parmap=<rain.bmp>;
bmap rain_parmp=<DotUp.tga>;
bmap rain_parmp1=<ToSpot2.tga>;
bmap dust_b=<dust.bmp>;

function rain_effect();
function rain_property();

function ran_effect();
function ran_property();

function ran_effect() {

	my.vel_z=(-12.5-random(5))*2;
	my.x=camera.x+random(1500)-750;
	my.y=camera.y+random(1500)-750;
	my.skill_x = my.x;
	my.skill_y = my.y;
	my.skill_z = my.z-10000;
	my.z=camera.z+500;
	my.bright=on;
	my.move=on;
	my.x-=33*my.vel_x;
	my.y-=33*my.vel_y;
	trace_mode = ignore_me + scan_texture + ignore_models + ignore_sprites+ ignore_passable;
	trace(my.x,my.skill_x);
	my.z=target.z;

	my.vel_x=0;
	my.vel_y=0;
	my.vel_z=0;
	if random(2)>1{
	my.bmap=rain_parmp;}
	else{
	my.bmap=rain_parmp1;}

	my.flare=on;
	my.move=off;
	my.alpha=100 ;
	my.size=random(25)+ 5 ;
	my.function=ran_property;

}

function ran_property()
{
if freeze_mode == 0 {


	my.alpha-=20;
	if (my.alpha<=0) {
	my.lifespan=0;}
	else{
	     my.lifespan = 10;} 
	}else
	{
	 my.lifespan = 10;}


}
var raining=0;
var rainsound=0;

function rain_effect() {
	my.x=camera.x+random(1500)-750;
	my.y=camera.y+random(1500)-750;
	my.skill_x=my.x;
	my.skill_y=my.y;
	my.skill_z=player.z+player.min_z;
	my.skill_x=my.x;
	my.skill_y=my.y;
	my.skill_z=player.z+player.min_z;
	my.z=camera.z+500;
	my.bright=on;
	my.move=0;
	my.x-=33*my.vel_x;
	my.y-=33*my.vel_y;
	trace_mode = ignore_me + scan_texture + ignore_passable;
	trace(my.x,my.skill_x);
	my.skill_x=0;
	if str_cmpi(TEX_NAME,"brownwood")==1
	{
	my.skill_x=1;
	}
	my.skill_z=target.z;
	my.bmap=rain_parmap;
	my.flare = on;
	my.alpha = 10;
	my.function=rain_property;
}

function rain_property() {
if freeze_mode == 0 {

	my.size=vec_dist(my.x,camera.x)/15;

	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += my.vel_z*speed/600;

	if (my.z<=my.skill_z) {	
	     my.lifespan=0;}
	else{
	     my.lifespan = 10;} 
	}else
	{
	 my.lifespan = 10;}
}

function dust_p()
{
if freeze_mode == 0 {


	my.x += my.vel_x*speed/200;
	my.y += my.vel_y*speed/200;
	my.z += my.vel_z*speed/200;

	my.skill_y-=1;
	if (my.skill_y<=0) {

		my.lifespan=0;
	}
	}else
	{
	 my.lifespan = 10;}




}


function dust()
{
	my.skill_y=20;
	my.skill_x=0;

	my.move=0;

	my.bmap     = AtomSmoke;
	my.flare    = on;
	my.function = dust_p;
	my.alpha    = 25;
	my.size     = 500;
}


function rain( vel_x, vel_y, vel_z, intensity) {
	if (intensity==0) {intensity=20;}
	if (raining==1) {
		raining=0;
	} else {
		raining=1;
	}
	while ((raining==1)&&(LoopRun)) {
	if (freeze_mode==0)&&(player!=0)
	{
		temp.x=vel_x;
		temp.y=vel_y;
		temp.z=-vel_z*10-random(100);
		effect(rain_effect, intensity/20, temp, temp);

	    	effect(ran_effect, 2, temp, temp);

		temp.x=500+random(100);
		temp.y=500-random(1000);
		temp.z=50-random(100);

		temp2.x=-100+random(20);
		temp2.y=0;
		temp2.z=0;

		vec_add(temp,player.x);

		effect(dust, 1, temp, temp2);
	}
		wait(1);
	}
}
