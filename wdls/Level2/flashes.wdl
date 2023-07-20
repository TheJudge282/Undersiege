function FlashFireFunction() {

if freeze_mode == 0 {
	my.lifespan = 0;}else{
	my.lifespan = 10;

	}

}

function FlashFire
{

	my.alpha = my.vel_x;
	my.size  =  10;
	my.bright = 1;
	my.vel_x = ( 2 -random(4))/20;
	my.vel_y = ( 2 -random(4))/20 ;
	my.vel_z = ( 1 +random(1));

 	my.bmap = FireAtome;

	my.move = 0;
	my.function = FlashFireFunction;

}

function flashFunction(Cme)
{
 my = Cme;
 my.skill1 = 0;//my.skill3/2;
 while (my.skill1<my.skill3)
 {
	my.skill2 = 0;
	while (my.skill2<5)
	{

		my.roll = random( 360);
		ent_frame( "frame", 100-my.skill1);
		vec_for_vertex( temp, me, my.skill2);
		my_angle.x = my.skill1;
		effect( FlashFire, 1, temp, my_angle);
		my.skill1+=(speed/50)+my.skill1/10;
		my.skill2+=1;
		if (my.skill1>=my.skill3) { break;}
	}
 }

}

function FlashTga()
{
 my.invisible =1;
 my.light  = 1;
 my.passable  = 1;

 my.scale_x = 0.2;
 my.scale_y = 0.1;
 my.scale_z = 0.1;

 my.lightrange = 25;
 my.lightred   = 255;
 my.lightgreen = 200;
 my.lightblue  = 128;
 my.skill3 = 0;
while (my.skill3<100)
{
 my.skill3 += 30;
 wait(1);
}
remove me;

}

function Short_GunFlash(msk,vers,vdrd)
{
me=msk;
var hhk;
var svertex = vers;
var dvertex = vdrd;
var
k=10;
var
j;
vec_for_vertex(temp , my, svertex);
create( <dust.mdl>, temp, FlashTga);

j = entity_to_pointer( you);
while(1)
{
 you = pointer_to_entity(j);
  if (you == 0)
   { return;}
   vec_for_vertex(temp , my, dvertex);
   vec_for_vertex(my_angle, my, svertex);
   vec_set( you.x, my_angle);
   vec_sub( temp, my_angle);
   vec_to_angle( you.pan, temp);
   temp.x = -20;
   temp.y = 0;
   temp.z = 0;
   vec_rotate( temp, you.pan);
   vec_add( you.x, temp);
  flashFunction(you);
 wait(1);
}

}
