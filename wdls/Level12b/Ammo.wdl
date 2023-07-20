/* ****************************************************************  */

function ammocheck()
{
var i=0;
while( i < weaponscount){
	if(totalbullets[i] > maxnumcancarry[i])  {   totalbullets[i]= maxnumcancarry[i]; }
 i+=1;
}
weapongui();
}


function zoomout()
{

       if (camera.arc != 60)
        {           
		autozoom(60);
	}
}

/* ****************************************************************  */

var noammosound = 0;
function ammoevnt()
{
	if(event_type == event_push && you._type != _type_player) { return; }
	if (pweapons[ my._ammotype -1 ]!=0)
	{
		if(totalbullets[ my._ammotype -1] >= maxnumcancarry[ my._ammotype -1])  
		{
			if (noammosound == 0)
			{
				noammosound =1;
				showmessage(5,206);
				play_sound(takenomore,100); 
				wait(50);
				noammosound = 0;
				return;
			}
			return;
		}
	}
		if (my._ammotype==4)
		{totalbullets[7] +=1;
		}

	if (totalbullets[my._ammotype -1 ] == 0)
	{totalbullets[my._ammotype -1 ] +=  my._packamount*2; 
	}
	else
	{totalbullets[my._ammotype -1 ] +=  my._packamount; 
	}
	play_sound(ak_ok, 50);
	if (pweapons[ my._ammotype -1 ]==0)
	{
		if (my._ammotype > 10)
		{msggdd( 46+my._ammotype );
		}else
		{msggdd( 47+my._ammotype );
		}
		zoomout();
	if (my._ammotype == 12)
	{
		create( <rbgb.mdl>, temp, guny);
	}
	if (my._ammotype == colt)
	{
		create( <colt.mdl>, temp, guny);
	
	}
	if (my._ammotype == m16)
	{	
		create( <m16mdl.mdl>, temp, guny);
	
	}
	if (my._ammotype == m4)
	{	
		create( <mdlm4.mdl>, temp, guny);
	
	}
		if (my._ammotype == 8)
		{
			create( <Graned.MDL>, temp, guny);
		}
	if (my._ammotype == pumaction)
	{
		create( <bumpaction.mdl>, temp, guny);
	
	}
	if (my._ammotype == s99sniper)
	{
		create( <snpr.mdl>, temp, guny);
	
	}
	if (my._ammotype == uzi)
	{
		create( <uzi.mdl>, temp, guny);
	
	}
	if (my._ammotype == galili)
	{
		create( <galili.mdl>, temp, guny);
	
	}
	if (my._ammotype == lmg)
	{
		create( <cimg.mdl>, temp, guny);
	
	}
		you.skill1 = my._ammotype;
	}else
	{
	
	msggdd( 46+doubleuzi+1 );
	}
	ammocheck();
	remove(me);
}


/* ****************************************************************  */


action pickupammo
{    
my.passable = 1;
my.invisible = 1;
	if (you != 0)
	{
		my._ammotype    =  you.weaponnumber;
		if (level.y==1)
		{my._packamount=maxbulletnum[you.weaponnumber-1];
		}else
		{my._packamount  =  max(3,min(int(random(maxbulletnum[you.weaponnumber-1]/2)+maxbulletnum[you.weaponnumber-1]/2),20)); 
		}
	}else
	{
		my._ammotype    =  int(my.skill1);
		my._packamount  =  int(my.skill2); 
	}

	ptempstr = lonlyweapons[  my._ammotype];
	morph ( ptempstr, me);
	wait(1);
	sonar(me,4000);
	my.z -= result;
	wait(1);
	my.push = -1;
	my.enable_push = on;
	my.passable = 0;
	my.invisible = 0;
	
	my.event = ammoevnt;
}

/* ****************************************************************  */
sound getmedik, <medik.wav>;
function eventhealth()
{
	if(event_type == event_push && you._type != _type_player) { return; }
	entiy =  pointer_to_entity( player.bodylnk);
	if(entiy._health==0) { return; }
	entiy._health = min( 0, entiy._health + 25);
	hldsld.u =max(entiy._health*16/25,-64);
	play_sound(getmedik, 100);
	wait(1);
	msggdd( 47+doubleuzi+1);
	remove(me);
}

/* ****************************************************************  */

action pickuphealth
{    
	my.transparent = 0;
	sonar(me,4000);
	my.z -= result;
	wait(1);
	my.push = -1;
	my.enable_push = on;
	my.event = eventhealth;
	my.scale_x=2;
	my.scale_y=2;
	my.scale_z=2;
	if (my.skill20 == 1)&&(level.y != 1)
	{
		remove (me);
	}
	if (level.y == 3)
	{
		remove (me);
	}
}

