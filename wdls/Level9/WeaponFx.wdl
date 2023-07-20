/* ****************************************************************  */
bmap BulletSmoke, <Dust.tga>;
bmap PartSmoke, <DustPart.tga>;
bmap BulletBlood, <Blooder.tga>;



function Bullete_SmokeFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += my.vel_z*speed/600;

	my.alpha-=(2*time);
	my.size+=(0.75*time);
	
	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function Bullete_BlooFunction() {

if freeze_mode == 0 {

	my.alpha-= 2;
	my.vel_x = nearnumber( my.vel_x, 0 , 0.1);
	my.vel_y = nearnumber( my.vel_y, 0 , 0.1);
	my.vel_z -=  0.5;

	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += my.vel_z*speed/600;
	
	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}
	
}

function Bullete_Smoke
{
	my.z += 1 - random(2);
	my.x += 1 - random(2);
	my.y += 1 - random(2);

	my.vel_x = ( 2 -random(4));
	my.vel_y = ( 2 -random(4)) ;
	my.vel_z = ( 0.1 +random(4));

	my.size = 15;
 	my.bmap = BulletSmoke;

	my.move = 0;
	my.flare = on;
	my.alpha = 15;
	my.function = Bullete_SmokeFunction;

}

function Sniper_Smoke
{
	my.z += random(2)/50;
	my.x += (1 - random(2))/100;
	my.y += (1 - random(2))/100;
/*
	my.vel_x = ( 2 -random(4))/20;
	my.vel_y = ( 2 -random(4))/20 ;
	my.vel_z = ( 1 +random(1));*/

	my.size = 5;
 	my.bmap = BulletSmoke;

	my.move = 0;
	my.flare = on;
	my.alpha = 15;
	my.function = Bullete_SmokeFunction;

}

function Bullete_Blood
{
	my.size = random(10);
 	my.bmap = BulletBlood;

	my.move = 0;
	my.flare = on;
	my.alpha = 15;
	my.function = Bullete_SmokeFunction;

}


function DownBullete_Blood
{
	my.z += 1 - random(2);
	my.x += 1 - random(2);
	my.y += 1 - random(2);

	my.vel_x = (random(2)-1)*2;
	my.vel_y = (random(2)-1)*2;
	my.vel_z = -random(10)/5;


	my.size = random(1);
 	my.bmap = BulletBlood;

	my.move = 0;
	my.flare = on;
	my.alpha = random(100);
	my.function = Bullete_BlooFunction;

}

function DownBullete_Parts
{
	my.z += 1 - random(2);
	my.x += 1 - random(2);
	my.y += 1 - random(2);

	my.vel_x = (random(2)-1)*2;
	my.vel_y = (random(2)-1)*2;
	my.vel_z = -random(10)/1.25;


	my.size = random(1);
 	my.bmap = PartSmoke;

	my.move = 0;
	my.flare = on;
	my.alpha = random(100);
	my.function = Bullete_BlooFunction;

}


function NBulleteSmokeFunction() {

if freeze_mode == 0 {


	my.x += my.vel_x*speed/600;
	my.y += my.vel_y*speed/600;
	my.z += my.vel_z*speed/600;

	my.alpha-=(2);
	my.size+=(0.75);
	
	if(my.alpha < 0) { my.lifespan = 0; }else{my.lifespan = 10;} }else{
	my.lifespan = 10;

	}

}

function NBulletSmoke
{
	my.z += (1 - random(2))/100;
	my.x += (1 - random(2))/100;
	my.y += (1 - random(2))/100;

	my.vel_x = ( 2 -random(4))/20;
	my.vel_y = ( 2 -random(4))/20 ;
	my.vel_z = ( 1 +random(1));

	my.size = 20;
 	my.bmap = BulletSmoke;

	my.move = 0;
//	my.flare = on;
	my.alpha = 30;
	my.function = NBulleteSmokeFunction;

}

function Dusting()
{
my.invisible = 1;
my.passable  = 1;
vec_set( my.pos, target);
vec_to_angle( my.pan, normal);
my.scale_x = 0.3;
my.scale_y = 0.12;
my.scale_z = 0.12;
my.roll = random( 360);
while (my.skill1<100)
{
	my.skill2 = 0;
	while (my.skill2<5)
	{

		ent_frame( "frame", my.skill1);
		vec_for_vertex( temp, me, my.skill2);
		effect( NBulletSmoke, 1, temp, temp);
		my.skill1+=speed/10;
		my.skill2+=1;
		if (random(1)>0.5)
		{
			wait(1);
		}
	}
		ent_frame( "frame", my.skill1);
		vec_for_vertex( temp, me, 5);
		effect( DownBullete_Parts, 10, temp, temp);
		my.skill1+=speed/10;
		my.skill2+=1;
		if (random(1)>0.5)
		{
			wait(1);
		}
}
remove me;
}


function GunFlash2()
{
    my.scale_x = 0.05;
    my.scale_y = 0.05;
    my.scale_z = 0.05;
    my.alpha = 50;
    my.passable = 1;
    my.oriented = 1;
    my.bright = 1;
    var kd;
    kd.x = my.x - camera.x;
    kd.y = my.y - camera.y;
    kd.z = my.z - camera.z;
    vec_to_angle(my.pan,kd);
    my.near = on;
    my.roll = random(360)*(SpriteWeapon==0);
    if (you == weapon)
    {
	create( <Flashs.MDL>, my.pos, GunFlash2);
	you.skin = 11;
    }
    wait (1);
   remove me;
}

function BUmpActionLama()
{
my.near = 1;
my.bright = 1;
while (1)
{
 my.v+=1;
 my.u+=1;
 wait(1);
}
}

var one_ok = 1;

function flashable()
{
var res;
res = (weapon._ammotype == colt )||(weapon._ammotype ==  s99sniper)||(weapon._ammotype == ak47 )||(weapon._ammotype == m16 )||(weapon._ammotype == m4 )||(weapon._ammotype == pumaction )||(weapon._ammotype == lmg )|| (weapon._ammotype == uzi ) || (weapon._ammotype == galili )|| (weapon._ammotype == Doubleuzi ) ;
return(res);
}

function GunFlash()
{
 if (camorder!=2)||(flashable()==0)
 {
 return;
}
       me = weapon; 

	if  (weapon._ammotype == s99sniper ) 
	{
	       var temp2x = 0;
	       while (temp2x < 5)
	       {
	        vec_for_vertex(temp, me, flash_pos[weapon._ammotype - 1]);
	        temp2x += 1;
	        my_angle.x = random(5)+2;
	        my_angle.y = random(1);
	        my_angle.z = random(1);
		vec_rotate( my_angle, my.pan);
		effect( Sniper_Smoke, 2, temp, my_angle);wait(1);
	       }

		return;
	}

	one_ok = -one_ok;
	if (SpriteWeapon)
	{
	 temp.X = screen_size.x-GunSpriteFlashX[weapon_number-(weapon_number > gurnade)-(weapon_number > gasgurnade)*2-(weapon_number > s99sniper)]*2;
	 temp.Y = screen_size.y-GunSpriteFlashY[weapon_number-(weapon_number > gurnade)-(weapon_number > gasgurnade)*2-(weapon_number > s99sniper)]*1.5;
	 temp.Z = 30;
	 vec_for_screen(temp,camera);

	}else
	{
	 vec_for_vertex(temp,me, flash_pos[weapon._ammotype - 1]);
	}
	create( <Flashs.MDL>, temp, gunflash2);	
	//@ -----------------------------------------
	//@ hani code
	if (weapon._ammotype == Doubleuzi) && (SpriteWeapon)
	{
		you.skin= 3 + (one_ok == 1);
		temp.X = 300;//448 + 70;
		temp.Y = 500;//390 + 20;
		temp.Z = 30;
		vec_for_screen(temp,camera);
		create( <Flashs.MDL>, temp, gunflash2);	
		you.skin= 3 + (one_ok == 1);
		return;
	}
	//@ -----------------------------------------
	if (SpriteWeapon)
	{
		you.frame = VWeaponSprite.frame;
	}
	if (weapon._ammotype == colt )
	  {
 	       you.skin= 9 + (one_ok == 1);
		return;
	  }

	if (weapon._ammotype == ak47 )
	{
 	       you.skin= 5 + (one_ok == 1);
		return;
	}

	if  (weapon._ammotype == m16 )||(weapon._ammotype == m4 ) 
	{
 	       you.skin= 7 + (one_ok == 1);
		return;
	}

	if  (weapon._ammotype == pumaction ) 
	{
 	       you.skin= 1 + (one_ok == 1);
		return;
	}
	
	if  (weapon._ammotype == lmg )|| (weapon._ammotype == uzi ) || (weapon._ammotype == galili ) 
	{
 	       you.skin= 3 + (one_ok == 1);
		return;
	}

	if  (weapon._ammotype == Doubleuzi ) 
	{

 		you.skin= 3 + (one_ok == 1);
		vec_for_vertex(temp,me, flash_pos[weapon._ammotype ]);	
			create(<Flashs.MDL>,temp,gunflash2); 
 			you.skin= 3 + (one_ok == 1);
		return;
	}
}
