/* ****************************************************************  */
// empty bullets movementoo

function _bfree_throw()
{
	if(event_type == event_block)
	{
		exclusive_entity;
		my.skill4=180;	

		temp.x = 10;
		temp.y = 0;
		temp.z = 0;
		vec_to_angle(my.angle,bounce);
		my.pan += random(90) - 45;
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);

		my.skill12 *= 0.5;
		if (my.skill12 <1)
		{

		if (random(10)>5)
		{
		play_entsound(my,SEBullete1,100);
		}else
		{
		play_entsound(my,SEBullete2,100);
		
		} wait(10);
		 remove me;
		 return;
		}
		if (random(10)>5)
		{
		play_entsound(my,SEBullete1,66);
		}else
		{
		play_entsound(my,SEBullete2,66);
		
		}
		wait (1);

		forces = my.skill12 ;
		bcirclethrow();


	}
}

action bcirclethrow {
	my.skill12= forces;
	wait (1);
	/*my.skill1 = my.skill12;
	my.skill3 = 0;

	vec_rotate( my.skill1, my.pan);
	vec_add( my.skill1, my.pos);
*/
	my.skill2 = random(10)-5;
	my.skill4=0;	
	while(my.skill4<180)
	{	
		my.passable = 0;
		my.pan = my.pan - 90;
		my.tilt = 90-my.skill4;
		temp.x = my.skill12/25;
		temp.y = my.skill2;
		temp.z = -my.skill4/5-my.skill12/10;
		move_mode = ignore_passable + ignore_models+ignore_sprites;
		ent_move( temp, nullskill);
		my.skill4 += 5;
		my.tilt = my.skill23;
		my.pan = my.pan + 90;
		my.passable = 1;
		wait (1);
	}
	//remove me;
}

function bullet_freethrow()
{	forces = 10;
	my.pan = you.pan ;	
	my.tilt = you.tilt;	

	my.skill23 = you.tilt ;

	my.enable_block = on;
	my.enable_stuck = on;
	my.event = _bfree_throw;

	bcirclethrow();
}

function Ubullet_freethrow()
{	forces = 10;
	my.pan = you.pan +180 ;	
	my.tilt = you.tilt +180;	

	my.skill23 = you.tilt ;

	my.enable_block = on;
	my.enable_stuck = on;
	my.event = _bfree_throw;

	bcirclethrow();
}

function EmptyBulleThrow()		//replace
{
	entiy = Pointer_To_Entity( player.WeaponMesh1);
	if (camorder!=2)
	{
		//me = ptr_for_handle( player.HandsLnk);
		bullet_pos = GetVertexNum( entiy);
		vec_for_vertex( temp, entiy, bullet_pos);
		create( empty_bullte,temp  , bullet_freethrow);
	}else
	{
		bullet_pos = GetVertexNum(entiy);
		vec_for_vertex( temp,  entiy, bullet_pos);
		//vec_for_vertex( temp, me, bullet_pos[ my._ammotype -1]);
		create( empty_bullte, temp , bullet_freethrow);
		if (weapon._weaponnumber==Doubleuzi)
		{
			vec_for_vertex( temp, me, 682);
			create( empty_bullte, temp , Ubullet_freethrow);
		}
	}

}

function FirePartss ()
{
my.scale_x = 0.01;
my.oriented = 1;
my.bright = 1;
my.passable = 1;
my.flare = 1;
vec_to_angle(my.pan,normal);
my.pan+=90;
wait(1);
remove me;
}

/* ****************************************************************  */

function WallEfShot()
{
//create( <dust.mdl>, target, Dusting);
create( <dust.mdl>, target, Dusting);
//effect( Bullete_Smoke, 10, my.pos, temp);
//play_entsound(me,BltSoundEfct,100);
PlaySoundGroup1(100);
my.scale_x = 0.081;
my.scale_y = 0.081;
my.scale_z = 0.081;
my.passable = on;

my.oriented = on;

vec_to_angle(my.pan,normal);

waitt(150);
remove me;
}

function WallPlayerEfShot()
{
//create( <Explo+6.tga>, target, ExplosionsTga);
create( <dust.mdl>, target, Dusting);
//effect( Bullete_Smoke, 10, my.pos, temp);
//create( <dust.mdl>, target, AtomicExplosion);
my.EnemyId = player.BodyLnk;
my.enable_scan = 1;
PlaySoundGroup1(100);
my.scale_x = 0.081;
my.scale_y = 0.081;
my.scale_z = 0.081;
my.passable = on;

my.oriented = on;

vec_to_angle(my.pan,normal);

waitt(1);
temp.x = 360;
temp.y = 360;
temp.z = 360;
indicator = _gunfire;
scan( my.pos, my.pan, temp);

waitt(150);
remove me;
}

/* ****************************************************************  */

function dotbloodevent()
{
if (event_type == event_detect && you._type == _type_BloodDot)
{
	you.scale_x = min(0.57, you.scale_x + 0.02);
	you.scale_y = you.scale_x;
	you.scale_z = you.scale_x;
	you._health +=10;
	my._health  = 0;
	remove me;
}
}

function BloodFixedDot()
{
 my.oriented = 1;
 my.passable = 1;
 my.scale_x = 0.1;
 my.scale_y = 0.1;
 my.scale_z = 0.1;
 vec_to_angle( my.pan, normal);
 my._type = _type_BloodDot;
 my.enable_scan = 1;
 my.enable_detect = 1;
 my.event = dotbloodevent;
 
 temp.x = 360;
 temp.y = 360;
 temp.z = 50;
 my._health = 100;
 scan( my.pos, my.pan, temp);

while (my._health>0)
{
	me._health -=1;
	wait(1);
}
 remove me;
}


function DropBloodDot()
{
	var tractarg;
	vec_set( tractarg, target);
	tractarg.z-=1000;
	trace_mode = ignore_passable + ignore_models + ignore_sprites;
	result = trace( target, tractarg);
	if (result)
	{
		create( <blooder.tga>, target, BloodFixedDot);
	}
}

function MetalBullete()
{
	my.invisible = 1;
	my.passable  = 1;

	if (random(10)>5)
	{
		play_entsound( me, MetalHit1, 1000);
		goto fing;
	}
	if (random(10)>5)
	{
		play_entsound( me, MetalHit2, 1000);
		goto fing;
	}
	if (random(10)>5)
	{
		play_entsound( me, MetalHit3, 1000);
		goto fing;
	}
	play_entsound( me, MetalHit4, 1000);
	fing :
	my.skill1 = result;
	while (snd_playing(my.skill1))
	{
		wait(1);
	}
}

function ShotEffect()
{

	var Vnum=0;
	if(you == null)
	{
		   create( <black_hole.tga>, target, WallPlayerEfShot);
		
	}else
	{
	  if (you.owntype != TypeOfEngines )
	  {if (bloodenable)
	  {
		vnum+=1;
		vec_for_vertex( temp, you, vnum);
		temp.x = vec_dist( temp, target);
		vnum.y = vnum;
		vnum.z = temp.x;
		  while (vnum<you.VertexCount)
		  {
			vnum+=1;
			vec_for_vertex( temp, you, vnum);
			temp.x = vec_dist( temp, target);
			if (vnum.z>temp.x)
			{
			 vnum.y = vnum;
			 vnum.z = temp.x;
			}
		   }
			vec_for_vertex( target, you, vnum.y);
			temp.x = random(1);
			temp.y = random(1);
			temp.z = random(1);
			 effect( Bullete_Blood, 10, target, temp);
		wait(1);
		vnum = 0;
		if (you == null )
		{ return;}
		vnum.y = 10;
		if (you._health<=-200)
		{
		vnum.y = 50;
		}
		while (vnum<vnum.y)
		{
		if (you )
		{
		
			vec_for_vertex( target, you, vnum.y);
			temp.x = random(1)/10;
			temp.y = random(1)/10;
			temp.z = -random(5);
			 effect( DownBullete_Blood, 1, target, temp);
			 if (random(100)>50)
			 {
			 DropBloodDot();
			 }
			 vnum+=1;}else
			 {
			 return;
			 }
		wait(1);
		}
	  }
	  
	  }else
	  {  
		   effect( Bullete_Smoke, 10, target, temp);
		   effect( Metal_Parts, 10, target, normal);
		   create( <black_hole.tga>, target, MetalBullete);
	  }
	
	}
	
}

/* ****************************************************************  */

function ddgun_shot_Damge()
{
	indicator = _gunfire;	// indicator for the entity that was hit
	trace_mode = ignore_me + ignore_passable + activate_shoot;
	
	if(gun_source[3] == 9) 	// player firing?
	  {
 		result = trace(gun_source,gun_target);
		gun_source[3] = 0;	// reset value
		vec_set(gun_muzzle,gun_source);	// important for when/if we calculate shot_speed
	  }
	else
	  {
	    result = trace(gun_muzzle,gun_target);
	  }		

   	if(result > 0) { ShotEffect(); }
}

function ShowToutchS(ShotedEntity)
{
me = ShotedEntity;
		if ( CollisionIndexs[ HeadTouch])
		{
			str_cat(mesg.string," head");
		}

		if ( CollisionIndexs[ ChestTouch])
		{
			str_cat(mesg.string," chest");
		}			      
		
		if ( CollisionIndexs[ LeftHandToutch])
		{
			str_cat(mesg.string," Left hand");
		}			      

		if ( CollisionIndexs[ LeftArmTouch])
		{
			str_cat(mesg.string," Left Arm");
		}			      

		if ( CollisionIndexs[ RightHandTouch])
		{
			str_cat(mesg.string," right hand");
		}			      

		if ( CollisionIndexs[ RightArmTouch])
		{
			str_cat(mesg.string," right arm");
		}			      

		if ( CollisionIndexs[ LeftFootTouch])
		{
			str_cat(mesg.string," Left Foot");
		}			      

		if ( CollisionIndexs[ LeftLegTouch])
		{
			str_cat(mesg.string," Left leg");
		}			      

		if ( CollisionIndexs[ RightFootTouch])
		{
			str_cat(mesg.string," right foot");
		}			      

		if ( CollisionIndexs[ RightLegTouch])
		{
			str_cat(mesg.string," right leg");
		}			      

}

function EffectedEntity(ShotedEntity)
{
me = ShotedEntity;
/*var MyLpan;
MyLpan = my.pan;
my.pan = 0;
temp.x = normal.x * 10;
temp.y = normal.y * 10;
temp.z = 0;
move( me, temp, nullskill);
my.pan = mylpan;   */

		my.string2 = RightHit;
		if ( CollisionIndexs[ HeadTouch])
		{
			my.string2 = AllAnimations[ IFrontHit];
			my.AnimDie = IHeadDie;
			goto Finals;
		}

		if ( CollisionIndexs[ ChestTouch])
		{
		temp.x = target.x - my.x;
		temp.y = target.y - my.y;
		temp.z = target.z - my.z;
		vec_to_angle(my_angle , temp);
		my_angle.x =ang(my_angle.x - my.pan);
		if (my_angle.x>0)
		{
			my.string2 = AllAnimations[ ILeftHit];
			my.AnimDie = IBackDie;
		}else
		{
			my.string2 = AllAnimations[ IRightHit];
			my.AnimDie = IBackDie;
		
		}
			goto Finals;
		}			      
		
		if ( CollisionIndexs[ LeftHandToutch])
		{
			my.string2 = AllAnimations[ ILeftHit];
			my.AnimDie = IBackDie;
			goto Finals;
		}			      

		if ( CollisionIndexs[ LeftArmTouch])
		{
			my.string2 = AllAnimations[ ILeftHit];
			my.AnimDie = IBackDie;
			goto Finals;
		}			      

		if ( CollisionIndexs[ RightHandTouch])
		{
			my.string2 = AllAnimations[ IRightHit];
			my.AnimDie = IBackDie;
			goto Finals;
		}			      

		if ( CollisionIndexs[ RightArmTouch])
		{
			my.string2 = AllAnimations[ IRightHit];
			my.AnimDie = IBackDie;
			goto Finals;
		}			      

		if ( CollisionIndexs[ LeftFootTouch])
		{
			my.string2 = AllAnimations[ IDownHit];
			my.AnimDie = ILegDie;
			goto Finals;
		}			      

		if ( CollisionIndexs[ LeftLegTouch])
		{
			my.string2 = AllAnimations[ IDownHit];
			my.AnimDie = ILegDie;
			goto Finals;
		}			      

		if ( CollisionIndexs[ RightFootTouch])
		{
			my.string2 = AllAnimations[ IDownHit];
			my.AnimDie = ILegDie;
			goto Finals;
		}			      

		if ( CollisionIndexs[ RightLegTouch])
		{
			my.string2 = AllAnimations[ IDownHit];
			my.AnimDie = ILegDie;
			goto Finals;
		}			      
Finals:
}

/* ****************************************************************  */
function spedds()
{
my.scale_x = 1000;
my.scale_y = 10;
my.scale_z = 10;
my.alpha = 5;
my.near = 1;
my.passable = 1;
you.LeaderId = entity_to_pointer( me);
}

function FlyBullete()
{
var LastP;
vec_set( LastP, target);
Camra2Player = 0;
	player.invisible = 0;
	player.shadow = (player.invisible == 0)&&shadowenable;
	you = ptr_for_handle( player.ChestLnk);
	you.invisible = player.invisible == 1;
	you.shadow = player.shadow == 1;

	you = ptr_for_handle( player.HandsLnk);
	you.invisible = player.invisible == 1;
	you.shadow = player.shadow == 1;

	you = ptr_for_handle( player.HeadLnk);
	you.invisible = player.invisible == 1;
	you.shadow = player.shadow == 1;

	if (weapon)
	{
	weapon.invisible = player.invisible == 0;
	}
	you = 0;
wait(1);
vec_set( target, LastP);

temp.x = target.x - my.x;
temp.y = target.y - my.y;
temp.z = target.z - my.z;

vec_to_angle( my.pan, temp);
temp.x = 100;
temp.y = 0;
temp.z = 0;
vec_rotate( temp, my.pan);
vec_add( my.pos, temp);
create( <speed.mdl>, camera.x, spedds);
you = me;
me = 0;

you.skill1 = vec_dist(you.pos,target);
you.skill5 = you.skill1;

you.skill2 = you.x + ( target.x- you.x)/2;
you.skill3 = you.y + ( target.y- you.y)/2;
you.skill4 = you.z + ( target.z- you.z)/2+150;


wait(1);
freeze_mode = 1;
LastP = cpointer.visible;
cpointer.visible=0;

while (you.skill1>0)
{

temp.x = max((you.skill5-you.skill1)*0.05,1);
you.skill1-=temp.x;
weapontmpsyn = Pointer_To_Entity( you.LeaderId);
weapontmpsyn.v+=temp.x/1;
temp.y = 0;
temp.z = 0;
vec_rotate( temp, you.pan);
vec_add( you.pos, temp);

temp.x = -50;
temp.y = 0;
temp.z = 0;
vec_rotate( temp, you.pan);
vec_add( temp, you.pos);

vec_set( camera.x, temp);
vec_set( weapontmpsyn.x, temp);

temp.x  = you.x - camera.x;
temp.y  = you.y - camera.y;
temp.z  = you.z - camera.z;
vec_to_angle( camera.pan, temp);
vec_set( weapontmpsyn.pan, camera.pan);

wait(1);
}
freeze_mode = 0;


			temp.x = random(1);
			temp.y = random(1);
			temp.z = random(1);
			 effect( Bullete_Blood, 10, you.pos, temp);

			temp.x = random(1)/10;
			temp.y = random(1)/10;
			temp.z = -random(5);
			 effect( DownBullete_Blood, 10, you.pos, temp);


cpointer.visible = LastP;
my = Pointer_To_Entity( you.EnemyId);
weapontmpsyn = Pointer_To_Entity( you.LeaderId);
remove weapontmpsyn;
remove you;
gameclose();
return;
Camra2Player = 1;
}



function FlyBullete2()
{

temp.x = target.x - you.x;
temp.y = target.y - you.y;
temp.z = target.z - you.z;
vec_to_angle( my.pan, temp);
temp.x = 100;
temp.y = 0;
temp.z = 0;
vec_rotate( temp, my.pan);
vec_add( my.pos, temp);
you = me;
me = 0;

you.skill1 = vec_dist(you.pos,target);
you.skill5 = you.skill1;

you.skill2 = you.x + ( target.x- you.x)/2;
you.skill3 = you.y + ( target.y- you.y)/2;
you.skill4 = you.z + ( target.z- you.z)/2+150;
wait(1);
freeze_mode = 1;
cpointer.visible=0;

while (you.skill1>0)
{

temp.x = max((you.skill5-you.skill1)*0.1,0.1);
you.skill1-=temp.x;
temp.y = 0;
temp.z = 0;
vec_rotate( temp, you.pan);
vec_add( you.pos, temp);

vec_set( camera.x, you.skill2);

temp.x  = you.x - camera.x;
temp.y  = you.y - camera.y;
temp.z  = you.z - camera.z;
vec_to_angle( camera.pan, temp);

wait(1);
}
freeze_mode = 0;
cpointer.visible=1;
remove you;
}

function gun_shot_Damge()		//replace
{
  	you = ntrace(me);
	if (CollisionDetection.x)
	{
	if (you)
	{
		var Ltrgt;
		vec_set( Ltrgt, target);
		var LYou;
		LYou = you;

		
		ShotEffect();
		
		
		
		you = LYou;
		EffectedEntity(you);
		event_type = event_shoot;
		you = Pointer_To_Entity( player.BodyLnk);
		me = LYou;
		guifunction = my.event;
		indicator = _gunfire;
		guifunction();
		/*you = ptr_for_handle(LYou);
		you._health -= damage + CollisionIndexs[ HeadTouch]*200 + CollisionIndexs[ ChestTouch]*10;
		you.GotHit = 100;


		you = TempEnt;

		//vec_set( target, Ltrgt);*/
	}else
	{
		ShotEffect();
	}
	
	}

	//if(result > 0) {  }
}
/* ****************************************************************  */

function PlayBultEffect()
{
me = weapon;
	you.MyTilt = max( min( you.MyTilt + Weap_Force[my._weaponnumber-1] ,99), 0);
	CPointer.frame =  min( Weap_Force[my._weaponnumber-1] /2, 1);
	wait(1);
	if (my.__repeat)
	{
	you.MyTilt = max( min( you.MyTilt - (Weap_Force[my._weaponnumber-1] *random(1)),99), 0);
	}else
	{
	var RePos =0;
	while (RePos<10)
	{ RePos+=1;
 	  you.MyTilt = max( min( you.MyTilt - (Weap_Force[my._weaponnumber-1] *(1)/10),99), 0);
	wait(1);
	}
	}

}

function ShotBullet(shoterentity)		//replace
{
 me = shoterentity;
 you = shoterentity;
// me = ptr_for_handle( you.HandsLnk);
 if (camorder!=2)
 {
	entiy = Pointer_To_Entity( player.WeaponMesh1);
	Tflash_P = GetVertexNum( entiy)-2;
	Tflash_T = GetVertexNum( entiy)-1;
	Short_GunFlash( entiy, Tflash_P, Tflash_T); }
	str_cpy(mesg.string,"");

	//vec_for_vertex( FirstPoint, me, 141);
	vec_set(FirstPoint , camera.x);
	//FirstPoint.z += CameraHi[0];

	SecondPoint.x = 2 * weapon._bulletspeed;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	my_angle.pan = you.pan;
	my_angle.tilt =  camera.tilt;//(you.MyTilt*115/85)-70;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, FirstPoint);

	gun_shot_Damge();
	PlayBultEffect();
}

/* ****************************************************************  */

function DblShotBullet(shoterentity)
{
 you = shoterentity;
 me = Pointer_To_Entity( player.WeaponMesh1);
 if (camorder!=2)
 {
	Tflash_P = GetVertexNum(me)-4;
	Tflash_T = GetVertexNum(me)-3;
	Short_GunFlash( me, Tflash_P, Tflash_T); 
	Tflash_P = GetVertexNum(me)-2;
	Tflash_T = GetVertexNum(me)-1;
	Short_GunFlash( me, Tflash_P, Tflash_T); 
 }
	str_cpy(mesg.string,"");

	temp.x = 0;
	temp.y = 10;
	temp.z = 0;
	vec_rotate(temp,you.pan);
	vec_set(FirstPoint , you.x);
	vec_add( FirstPoint, temp);
	FirstPoint.z += CameraHi[0];

	SecondPoint.x = 2 * weapon._bulletspeed;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	my_angle.pan = you.pan;
	my_angle.tilt =  (you.MyTilt*115/85)-70;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, you.x);

	gun_shot_Damge();

	temp.x = 0;
	temp.y = -10;
	temp.z = 0;
	vec_rotate(temp,you.pan);

	vec_set( FirstPoint , you.x);
	vec_add( FirstPoint, temp);
	FirstPoint.z += CameraHi[0];

	SecondPoint.x = 2 * weapon._bulletspeed;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	my_angle.pan = you.pan;
	my_angle.tilt =  (you.MyTilt*115/85)-70;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, you.x);

	gun_shot_Damge();
	PlayBultEffect();
}

/* ****************************************************************  */

function RandShotBullet(shoterentity)		//replace
{
 you = shoterentity;
 me = shoterentity;
 //me = ptr_for_handle( you.HandsLnk);
 if (camorder!=2)
 {
	entiy = Pointer_To_Entity( player.WeaponMesh1);
	Tflash_P = GetVertexNum(entiy)-2;
	Tflash_T = GetVertexNum(entiy)-1;
	Short_GunFlash( entiy, Tflash_P, Tflash_T);
	//Short_GunFlash( me, Tflash_P[weapon_number-1], Tflash_T[weapon_number-1]);
	//ThrowFromVers(142,141,10);
 }
	str_cpy(mesg.string,"");
var ShotSNum = 0;

while (ShotSNum<10)
{
	ShotSNum.y = random(360);

	temp.x = weapon._bulletspeed/10;
	temp.y = 0;
	temp.z = 0;

	vec_set( my_angle, you.pan);
	my_angle.pan += ShotSNum.y;//ShotSNum*36;
	my_angle.tilt += ShotSNum.y;//ShotSNum*36;
	vec_rotate( temp, my_angle);
	vec_set( FirstPoint , you.x);
//	vec_add( FirstPoint, temp);
	FirstPoint.z += CameraHi[0];

	SecondPoint.x = 2 * weapon._bulletspeed;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	my_angle.pan = you.pan;
	my_angle.tilt =  (you.MyTilt*115/85)-70;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, you.x);
	vec_add( SecondPoint, temp);

	gun_shot_Damge();
	ShotSNum+=1;
}

	PlayBultEffect();
}
/* ****************************************************************  */

function LShotBullet(shoterentity)		//replace
{
 you = shoterentity;
 me = shoterentity;
 //me = ptr_for_handle( you.HandsLnk);
 if (camorder!=2)
 {
	entiy = Pointer_To_Entity( player.WeaponMesh1);
	Tflash_P = GetVertexNum(entiy)-2;
	Tflash_T = GetVertexNum(entiy)-1;
	Short_GunFlash( entiy, Tflash_P, Tflash_T);
	//Short_GunFlash( me, Tflash_P[weapon_number-1], Tflash_T[weapon_number-1]);
 }

	vec_set(FirstPoint , you.x);
	SecondPoint.x = 2 * my._bulletspeed;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	my_angle.pan = you.pan;
	my_angle.tilt =  (you.MyTilt*115/85)-70;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, FirstPoint);

 	vec_set( gun_source, FirstPoint); 
	vec_set( gun_target, SecondPoint);

	ddgun_shot_Damge();
	
}
