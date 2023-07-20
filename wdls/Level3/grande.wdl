include <explosions.wdl>;

function _freeBumpthrow()
{
	if(event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push)
	{
		exclusive_entity;
		vec_set( p, target);
		p2.x = 100; p2.y = 0; p2.z = 0;
		vec_to_angle( my_angle, bounce);
		vec_to_angle( my.skill1, bounce);
		vec_rotate( p2 ,my_angle);
		vec_add( my.pos, p2);
		/*you = createline();
		you.flare = 0;
		you.scale_y = 1;
		you.scale_z = 1;*/
		my.flag1 =1;

		wait(1);
		forces = max(0,my.skill23 / 5+my.skill5/10);
		ShowCircleThrow(0);
	}
}

function ShowCircleThrow(Wt) {
	my.skill23= forces;

	my.skill5 = 0;
	my.flag1  = 0;
	while(1)
	{
		vec_set( p, my.pos);
		sonar (me ,4000);
		if (my.skill23>0 || abs(result) > my.max_z )
		{
		temp.x = my.skill23/2;
		temp.y = 0;
		temp.z = 0;
		vec_rotate( temp, my.skill1);
		temp.z += my.skill5;

		move_mode = ignore_models  +ignore_sprites;
		ent_move( temp, nullskill);
		}

		if (my.flag1!=0)
		{ 	
			return;     
		}

		vec_set( P2, my.pos);
		you = createline();
		you.scale_y = 10;
		you.scale_z = 10;


		my.skill23 = max( 0, my.skill23 -1);
		my.skill5  -= 1;

		my._health-=1;
		if (my._health<0)
		{ 
		goto gotenemy;}
		if (wt!=0)
		{wait(wt);
		}
	}

gotenemy :
if (wt!=0)
{
//create(<Hala.MDL>,my.pos,dust_explosion);
create( <xplosion.mdl>, my.pos, ExplosionsTga);
}
remove me;
}


function TempBump()
{
	
my.enable_block = on;
my.enable_entity = on;
my.enable_stuck = on;
my.enable_impact = on;
my.enable_push = on;
my.flag1 = 0;
my.invisible = 1;
my.event = _freeBumpthrow;
my.skill23 = forces;
}

function ShowGrenadeline(VNUm,Dist,Wt)
{

	vec_for_vertex( temp, player, VNUm);
	vec_set( ScanValues[0], temp);
	vec_set( ScanValues[3], temp);
	ScanValues[5] += player.mytilt*0.75;

	temp.x = Dist-abs(player.mytilt-60)*10;
	temp.y = 10;
	temp.z = 0;

	my_angle.pan = player.pan;
	my_angle.tilt = player.mytilt-60;

	vec_rotate( temp, my_angle);
	vec_add( temp, player.x);
	vec_set( ScanValues[6], temp.x);

	temp.x = Dist-abs(player.mytilt-60)*5;
	temp.y = 10;
	temp.z = 0;

	my_angle.pan = player.pan;
	my_angle.tilt = player.mytilt-60;

	vec_rotate( temp, my_angle);
	vec_add( temp, player.x);

	vec_set( ScanValues[9], temp.x);
	ScanValues[8] += player.mytilt*2;

	vec_for_vertex( temp, player, VNUm);

	forces= max(player.mytilt*4,50);
	create(<Wgraned.MDL>,temp,TempBump);
	me = you;
	vec_set( my.skill10, ScanValues[0]);
	vec_set( my.skill13, ScanValues[3]);
	vec_set( my.skill16, ScanValues[6]);
	vec_set( my.skill19, ScanValues[9]);

my._health = 75;
var kk = 0;
var kk2 = 0;
while (kk<200)
{
	vec_set( ScanValues[0], my.skill10);
	vec_set( ScanValues[3], my.skill13);
	vec_set( ScanValues[6], my.skill16);
	vec_set( ScanValues[9], my.skill19);

	kk2+=0.1;
	ArcPrcnt(kk/200);
	vec_set( p, target);
	kk += kk2;
	ArcPrcnt(kk/200);
	vec_set( P2, target);

	temp.x = target.x - my.x;
	temp.y = target.y - my.y;
	temp.z = target.z - my.z;
	vec_to_angle( my.skill1, temp);
	you = Pointer_To_Entity( my.EnemyId);
	move_mode = ignore_models + ignore_you +ignore_sprites;
	ent_move( temp, nullskill);

	if (my.flag1!=0)
	{ 	
		return;     
	}

	my._health-=1;
	if (my._health<0)
	{ goto gotenemy;}
	you = createline();
	you.scale_y = kk/20;
	you.scale_z = kk/20;
	my.skill23 = max( 0, my.skill23 -2);
		
		if (wt!=0)
		{
			wait(wt);
		}
}

forces = my.skill23;
ShowCircleThrow(0);
return;

gotenemy :
remove me;
}


var Car_escape =0;


function CircleThrow(Wt) {
	my.skill23= forces;

	my.skill5 = 0;
	my.flag1  = 0;
	while(1)
	{
		you = Pointer_To_Entity(LandRoverPointer);
		if ( vec_dist(my.pos ,you.pos)< 100)
		{
			if (MisionsMsg2.visible)
			{
				Car_escape = 1;
			}			
			goto gotenemy;
		}

	 if (my.flag3)
	  {
		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 1, my.pos, my_angle);
		 if (snd_playing(my.skill30)==0)
		 {
			play_entsound( me, GazThrow, 100);
			my.skill30 = result;
		 }	
	 }
		my.passable = 0;
		vec_set( p, my.pos);
		sonar (me ,4000);
		if (my.skill23>0 || abs(result) > my.max_z )
		{
			temp.x = my.skill23/2 * speed / 200;
			temp.y = 0;
			temp.z = 0;
			vec_rotate( temp, my.skill1);
			temp.z += my.skill5 * speed / 200;

			move_mode = ignore_models  +ignore_sprites;
			ent_move( temp, nullskill);
		}

		if (my.flag1!=0)
		{ 	
			return;     
		}

		vec_set( P2, my.pos);


		my.skill23 = max( 0, my.skill23 -1 * speed / 200);
		my.skill5  -= 1 * speed / 200;

		my._health -= 1;
		my.passable = 1;
		if (my._health<0)
		{ 
			goto gotenemy;
		}
		if (wt!=0)
		{
			wait(wt);
		}
	}

gotenemy :
if (wt!=0)
{	my.skill1 = 0;
	while (my.flag3)
	{
		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 1, my.pos, my_angle);
		if (my.skill1>100)
		{ break;
		}
		my.skill1 += 2;
		wait(1);
	}
 create( <xplosion.mdl>, my.pos, ExplosionsTga);
}
remove me;
}

function _Grenade_Event()
{
	if(event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push)
	{
		exclusive_entity;
		play_entsound(me,dgrenade,1000);
		vec_to_angle( my.skill1, bounce);
		p2.x = 100; p2.y = 0; p2.z = 0;
		vec_rotate( p2 , my.skill1);
		vec_add( my.pos, p2);

		my.flag1 =1;

		wait(1);
		forces = max(0,my.skill23 / 5+my.skill5/10);
		CircleThrow(1);
	}
}

function Grenade_Throw()
{
	
my.flag3 = my_angle.x;
my.enable_block = on;
my.enable_entity = on;
my.enable_stuck = on;
my.enable_impact = on;
my.enable_push = on;
my.flag1 = 0;
my.event = _Grenade_Event;

	my.skill23 = forces;

	vec_set( my.skill10, ScanValues[0]);
	vec_set( my.skill13, ScanValues[3]);
	vec_set( my.skill16, ScanValues[6]);
	vec_set( my.skill19, ScanValues[9]);

my._health = 75;
var kk = 0;
while (kk<200)
{
		you = Pointer_To_Entity(LandRoverPointer);
		if ( vec_dist(my.pos ,you.pos)< 100)
		{
			if (MisionsMsg2.visible)
			{
				Car_escape = 1;
			}
			goto gotenemy;
		}

	if (my.flag3)
	{
		my_angle.x = 50;
		my_angle.y = 75;
		my_angle.z = 50;
		effect( PartsThrow, 1, my.pos, my_angle);
	 if (snd_playing(my.skill30)==0)
	 {
		play_entsound( me, GazThrow, 100);
		my.skill30 = result;
	 }	
	}
	my.passable = 0;
	vec_set( ScanValues[0], my.skill10);
	vec_set( ScanValues[3], my.skill13);
	vec_set( ScanValues[6], my.skill16);
	vec_set( ScanValues[9], my.skill19);

	ArcPrcnt(kk/200);
	vec_set( p, target);
	kk += 5 * speed / 200;
	ArcPrcnt(kk/200);
	if (CheckGrenadeMove())
	{
		goto gotenemy;
	}

	ArcPrcnt(kk/200);
	vec_set( P2, target);

	temp.x = target.x - my.x;
	temp.y = target.y - my.y;
	temp.z = target.z - my.z;
	vec_to_angle( my.skill1, temp);
	you = Pointer_To_Entity( my.EnemyId);
	move_mode = ignore_models + ignore_you +ignore_sprites;
	ent_move( temp, nullskill);

	if (my.flag1!=0)
	{ 	
		return;     
	}

	my._health-=1 * speed / 200;
	if (my._health<0)
	{ goto gotenemy;}

	my.skill23 = max( 0, my.skill23 -2 * speed / 200);
		
	my.passable = 1;
	wait(1);
}

forces = my.skill23;
CircleThrow(1);
return;

gotenemy :
create( <xplosion.mdl>, my.pos, ExplosionsTga);
remove me;

}

sound nukaifa,<nukaifa.wav>;

function Nthrow()
{
	play_sound(nukaifa,100);
		

	FirstPoint.x = vec_dist( camera.x, player.x);
	FirstPoint.y =  0;
	FirstPoint.z =  0;
	my_angle.pan = player.pan;
	my_angle.tilt =  camera.tilt;
	vec_rotate( FirstPoint, my_angle);
	vec_add( FirstPoint, camera.x);
	
	SecondPoint.x = 2000;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	my_angle.pan = player.pan;
	my_angle.tilt =  camera.tilt;
	vec_rotate( SecondPoint, my_angle);
	vec_add( SecondPoint, camera.x);
	
	you = ntrace(player);
	if (you)
	{		
		if (you._type != 12548)
		{
			EffectedEntity(you);
			you._health -= 50;
			you.gothit = 100;
			if (you._type == _type_compars)
			{
				showmessage(10,167);						
				you = player;
				heartplayer(20);
				wait(10);						
			}
		}
		
		
	}
}

function NowGrenadeThow(VNUm,Dist,Gaz)
{
	vec_for_vertex( temp, player, VNUm);
	vec_set( ScanValues[0], temp);
	vec_set( ScanValues[3], temp);
	ScanValues[5] += player.mytilt*0.75;

	temp.x = Dist-abs(player.mytilt-60)*10;
	temp.y = 10;
	temp.z = 0;

	my_angle.pan = player.pan;
	my_angle.tilt = player.mytilt-60;

	vec_rotate( temp, my_angle);
	vec_add( temp, player.x);
	vec_set( ScanValues[6], temp.x);

	temp.x = Dist-abs(player.mytilt-60)*5;
	temp.y = 10;
	temp.z = 0;

	my_angle.pan = player.pan;
	my_angle.tilt = player.mytilt-60;

	vec_rotate( temp, my_angle);
	vec_add( temp, player.x);

	vec_set( ScanValues[9], temp.x);
	ScanValues[8] += player.mytilt*2;

	vec_for_vertex( temp, player, VNUm);
	forces= max(player.mytilt*4,50);
	my_angle.x = Gaz;
	create( <Wgraned.MDL>, temp, Grenade_Throw);
	you.flag2 = 1;
	play_sound(through,100);
	vec_for_vertex( temp, player, 364);
	forces= max(player.mytilt*4,50);
	create(<granedG.mdl>,temp,Grenade_Throw);
	wait(5);
	gunselect9();
	you = Pointer_To_Entity(player.WeaponMesh1);
	you.BoneName = IWeapon2Bone;
}

string  weaponupnow,"weapuP";

function throwthegrenade(throwerentity,forcesd,gaz,scan_thekeys)		//replace
{
	if (grnade_firing == 1)
	{
		return;
	}
	
	var iLoake = 0;
	grnade_firing = 1;
	var Ggernade= gaz;
	me = throwerentity;
	var ThrowFrame = 0;
	var throwkey = key_lastpressed;
	var scan_thekey = scan_thekeys;
	SetActivePart( SharedEntity, BodyParts[PartIndex-8],0);
	SetActivePart( SharedEntity, BodyParts[PartIndex-8],1);
	if (weapon_number == 8)
	{
		SetActivePart( SharedEntity, BodyParts[1],0);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex-8],"Ston");
	}else
	{
		SetActivePart( SharedEntity, BodyParts[0],0);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex-8],"Nakefa");
	}
	while( ThrowFrame < 15 )
	{
		if (weapon_number == 8)
		{	AnimModelPart( SharedEntity, 0.27*speed, BodyParts[PartIndex-8]);  
		}else
		{	AnimModelPart( SharedEntity, 0.17*speed, BodyParts[PartIndex-8]); 
		}
		ThrowFrame +=5*speed/200;
		wait (1);
		if (eplhealth){	return;	}
	}
	if (cameraction == EyCamera)
	{play_sound(gurnade_in,50);
	}
	while( ThrowFrame < 25 )
	{
		ent_frame("WeaRRing", ThrowFrame*3);
		if (weapon_number == 8)
		{AnimModelPart( SharedEntity, 0.27*speed, BodyParts[PartIndex-8]);  
		}else
		{AnimModelPart( SharedEntity, 0.17*speed, BodyParts[PartIndex-8]); 
		}
		ThrowFrame +=2*speed/200;
		wait (1);
		if (eplhealth){	return;	}
	}
	var DistThrow = 1500;
	if (scan_thekey)
	{
		while (key_pressed(throwkey)==1)
		{	
			if (weapon_number != 9)
			{
				ShowGrenadeline(364,DistThrow,0);
			}
			
			my.frame=6;
			wait (1);
		if (eplhealth){	return;	}
		}
	}

	forces = forcesd;
	bullet_pos = GetVertexNum(Pointer_To_Entity(player.WeaponMesh1));
	vec_for_vertex( temp, Pointer_To_Entity(player.WeaponMesh1), bullet_pos);

	ThrowFrame  = 25;
	while( ThrowFrame < 100 )
	{	
		ent_frame("Weasho", ThrowFrame*2);
		if (weapon_number == 8)
		{
		AnimModelPart( SharedEntity, 0.27*speed, BodyParts[PartIndex-8]);  
		}
		else
		{
		AnimModelPart( SharedEntity, 0.17*speed, BodyParts[PartIndex-8]); 
		}
		ThrowFrame +=5*speed/200;
		
		if (ThrowFrame > 70) && (iLoake == 0)
		{
			iLoake = 1;
			if (weapon_number != 9)
			{
				NowGrenadeThow( 430, DistThrow, 1);
			}
			else
			{	
				Nthrow();
			}
		}
		wait (1);
		if (eplhealth)
		{
			return;
		}
	}	

	my.frame=1;
	set_frame( weapon, weaponupnow, 100 );

	

	SetActiveSeq( SharedEntity,  BodyParts[PartIndex-8],"run");
	SetActivePart( SharedEntity, BodyParts[PartIndex-8],1);
	AnimModelPart( SharedEntity, 50, BodyParts[PartIndex-8]);
	if (ThrowFrame >= 75)
	{grnade_firing = 0;
	}


}

sound BltSoundEfct,<pl_step3.wav>;

function FlyPart()
{
	if(event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push)
	{
		exclusive_entity;
		my.skill4=180;	

		temp.x = 10;
		temp.y = 0;
		temp.z = 0;
		vec_to_angle(my.angle,bounce);
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);

		forces = my.skill23/7.5;
		if (forces<1)
		{
		 remove me;
		 return;
		}
		CircleFly();


	}
}


function CircleFly {
	my.skill23= forces;
	wait (1);
	my.skill1 = my.skill23;
	my.skill2 = 0;
	my.skill3 = 0;
	vec_rotate( my.skill1, my.pan);
	vec_add( my.skill1, my.pos);
	my.skill4=0;	
	while(my.skill4<180)
	{
		my.tilt = 90-my.skill4;
		temp.x = my.skill23/15*speed/200;
		temp.y = 0;
		temp.z = -my.skill4/5-my.skill23/10*speed/200;
		move( my, temp, nullskill);
		my.skill4 += my.skill5*speed/200;
		if (random(10)>2)
		{
			temp.x=5;
			temp.y=0;
			temp.z=0;
			my_angle.pan=random(360);
			my_angle.tilt=random(360);
			vec_rotate(temp,my_angle);
			vec_set( temp2, temp);
			vec_add(temp,my.pos);
			effect(BlacksmokeTrail,1,temp,temp2);
		}

		
		wait (1);
	}
}


function FlyingPart()
{
	my.enable_block = on;
	my.enable_entity = on;
	my.enable_stuck = on;
	my.enable_impact = on;
	my.enable_push = on;
	my.event = FlyPart;
	my.scale_x = 1.2;
	my.scale_y = 1.2;
	my.scale_z = 1.2;
	my.pan=random(360);
	my.skill5=2;
	forces = 100;
	CircleFly();
}



function CheckGrenadeMove()
{

	vec_set( FirstPoint, my.x);
	vec_set( SecondPoint, target);
	my.passable =1;
	you = ntrace(me);
	if (CollisionDetection.x)
	{
		if (you)
		{
		  return(1);
		}
	}
	my.passable =0;
  return(0);
}
