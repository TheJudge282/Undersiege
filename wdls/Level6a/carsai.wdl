function StopMeIfuCan(Sme,Syou)
{

	my = Sme;
	you = Syou;
	my = Pointer_To_Entity( my.LeaderId);
	if ((you.OwnType==TypeOfEngines)||(you.OwnType==TypeOfCompars))
	{
		my.CarBreaker  = 10;
	}else
	{
		if (you.OwnType==TypeOfTraficSingle)
		{	
			//ent_prevpoint(my.cartarget_x);
			Stemp.x = 0;
			Stemp.y = 1000;
			Stemp.z = 0;
			vec_rotate( Stemp, my.angle);
			vec_add( Stemp, my.x);

		}
	}

}

function SeeTarget()
{
if (my.carforce>=0)
{
	Stemp.x = 700;//my.carforce*10+500;
}
else
{
	Stemp.x = -700;//my.carforce*10-500;

}
	you = Pointer_To_Entity( my.LeaderId);
	vec_set( you.CarBPan, you.pan);
	TestTarget(you,"StopMeIfuCan");	
}


function SeeNextTarget1()
{
	Stemp.x = -1000;
	Stemp.y = 1000;
	Stemp.z = 0;
	vec_rotate( Stemp, my.angle);
	vec_add( Stemp, my.x);
	you = Pointer_To_Entity( my.LeaderId);
	trace_mode = ignore_me + ignore_passable + ignore_you;
	trace( my.x, Stemp);
	if (you == 0)
	{
		vec_set( my.cartarget_x, Stemp);
	}
	else
	{
		SeeNextTarget2();
	}
	
}


function SeeNextTarget2()
{	
	Stemp.x = -1000;
	Stemp.y = 1000;
	Stemp.z = 0;
	vec_rotate( Stemp, my.angle);
	vec_add( Stemp, my.x);
	you = Pointer_To_Entity( my.LeaderId);
	trace_mode = ignore_me + ignore_passable + ignore_you;
	trace( my.x, Stemp);
	if (you == 0)
	{
		vec_set( my.cartarget_x, Stemp);
	}
	
}

function nicecar()
{
wait(1);
}