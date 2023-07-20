
function _Pazoka_Bullet_event()
{
	if( event_type == event_block
		|| event_type == event_entity
		|| event_type == event_stuck
		|| event_type == event_impact
		|| event_type == event_push)
	{
		exclusive_entity;
		create( <xplosion.mdl>, my.pos, ExplosionsTga);
		my.flag1=1;
		wait(1);
		remove me;
		return;
	}
}


function CheckBulleteMove()
{

	vec_set( FirstPoint, my.x);
	SecondPoint.x = my.force;
	SecondPoint.y =  0;
	SecondPoint.z =  0;
	vec_rotate( SecondPoint, my.pan);
	vec_add( SecondPoint, FirstPoint);
	my.passable =1;
	entiy = ntrace(me);
	if (CollisionDetection.x)
	{
	if (entiy)
	{
		you = entiy;}
		if (you)
		{
			if (entiy==0)||(you._type == _type_soldier)
			{
			  if (you._type == _type_glass)
				{
				   HitGlass(you,1000);
				}
			  vec_set( my.SinglePosX, target);
			  my.flag1=1;
			}else
			{
			  vec_set( my.SinglePosX, you.x);
			  my.flag1=0;
			}
		  my.passable =0;
		  you._health-=1000;
		  my.enemyid = entity_to_pointer( you);
		  return(1);
		}	
	}
	my.passable =0;
  return(0);
}

function FlyMeByExplode( cmy, cyou, FulDamage)
{
	my = cmy;
	you = cyou;

	var lastpass;

	var youx = you.x;
	var youy = you.y;
	var GraDamage = 0;

	GraDamage = FulDamage*my.wieght;
	my.animdie = int(random(IFrontDie+1));
	my = player;
	you = 0;
	 while (GraDamage>0)
	 {
		entiy = cmy;
		if (entiy)
		{
			temp.x = entiy.x - youx;
			temp.y = entiy.y - youy;
			temp.z = 0;// Newtargetz - youz;
			vec_to_angle( my_angle, temp);
			my_angle.pan -= entiy.pan;
			my_angle.tilt = 0;
			temp.x = (abs(GraDamage)/entiy.wieght);
			temp.y = 0;
			temp.z = 0;
			vec_rotate( temp, my_angle);
			sonar entiy ,4000;
			temp.z -= result-(GraDamage/entiy.wieght);
			entiy.tilt = 0;
			lastpass = entiy.passable;
			entiy.passable = 0;
			you = 0;
			my = cmy;
			move( my, temp, nullskill);
			my = player;
			entiy.passable = lastpass;
			GraDamage = nearnumber( GraDamage, 0, entiy.wieght*10); 
		}else
		{
			return;
		}
	 wait(1);
	 } 

}

function Pazoka_Bullet {

	my.flag2 = on;
	my.enable_block = on;
	my.enable_entity = on;
	my.enable_stuck = on;
	my.enable_impact = on;
	my.enable_push = on;
	my.enable_scan = on;
	my.enable_detect = on;
	my.event = _Pazoka_Bullet_event;

	CollisionOffset.x = 0;
	CollisionOffset.y = 0;
	CollisionOffset.z = 0;
	my.max_x *= 0.5;
	my.max_y *= 0.5;
	my.max_z *= 0.5;


	temp.x=1;

	my.pan = you.pan;
	my.tilt = (you.MyTilt*115/85)-70;
	my.skill1=180;	

	my.scale_x=temp.x;
	my.scale_y=temp.x;
	my.scale_z=temp.x;

	my.ambient = 255;
	my.lightred = 255;
	my.lightgreen = 200;
	my.lightblue = 100;
	my.lightrange = 50;
	my.owntype = TypeOfBullete;

	my.skill2=31.1468;

	my.skill1=180;	

	my.flag1 = 1;
	while ((my.skill1>0)&&(my.flag1 )) {
		temp.x=my.skill10-my.x;
		temp.y=my.skill11-my.y;
		temp.z=my.skill12-my.z;
		vec_to_angle(my_angle,temp);	
		temp2.x=0;
		temp2.y=0;
		temp2.z=1;
		vec_rotate(temp2,my_angle);

		temp.x=5;
		temp.y=0;
		temp.z=0;
		my_angle.pan=random(360);
		my_angle.tilt=random(360);
		vec_rotate(temp,my_angle);
		vec_add(temp,my.pos);
		effect(Blacksmoke_Trail,1,temp,temp2);

		temp.x = (my.skill2 + my.skill1 / 10) * speed / 200;
		temp.y = 0;
		temp.z = 0;

		my.force = temp.x*10;
		if (CheckBulleteMove())
		{ goto GotEnemy;
		}

		move ( my , temp , nullskill );
		my.skill1 -= 2 * speed / 200;
		wait(1);
	}


	while(my.flag1  ){

		temp.x=my.skill10-my.x;
		temp.y=my.skill11-my.y;
		temp.z=my.skill12-my.z;
		vec_to_angle(my_angle,temp);	
		temp2.x=0;
		temp2.y=0;
		temp2.z=0.01;
		vec_rotate(temp2,my_angle);

		temp.x=5;
		temp.y=0;
		temp.z=0;
		my_angle.pan=random(360);
		my_angle.tilt=random(360);
		vec_rotate(temp,my_angle);
		vec_add(temp,my.pos);
		effect(Blacksmoke_Trail,1,temp,temp2);

		my.tilt = max( -90 , my.tilt - 0.1*speed/200);
		temp.x=my.skill2*speed/200;
		temp.y=0;
		temp.z=0;


		my.force = temp.x*10;
		if (CheckBulleteMove())
		{ goto GotEnemy;
		}


		move(my,temp,nullskill);

	wait(1);
	}

  vec_set( my.SinglePosX, my.x);
GotEnemy :
vec_set( target, my.SinglePosX);
	if (my.flag1)
	{
		create( <xplosion.mdl>, target, ExplosionsTga);
		you = pointer_to_entity(my.enemyid);
		if (you._type == _type_soldier)
		{
			FlyMeByExplode( you, me, 50);
		}
	}else
	{
		create( <dust.mdl>, target,AtomicExplosion);
		entiy = pointer_to_entity(my.enemyid);
		if (entiy._health >-1500)
		{
			you.flag1 = 1;
		}
	}
remove me;
}

function PazokaShot(Shoterentity)
{
me = Shoterentity;

	FirstPoint.x =10;
	FirstPoint.y = 0;
	FirstPoint.z = 0;
	vec_rotate( FirstPoint, camera.pan);
	vec_add( FirstPoint , camera.x);

	create ( <bullet_rbg.mdl>, FirstPoint, pazoka_bullet);

}
