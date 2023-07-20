/* ****************************************************************  */

function AmmoCheck()
{
var i=0;
while( i < weaponscount){
	if(totalbullets[i] > maxnumcancarry[i])  {   totalbullets[i]= maxnumcancarry[i]; }
 i+=1;
}
WeaponGui();
}


function ZoomOut()
{

       if (camera.arc != 60)
        {           
		AutoZoom(60);
	}
}

/* ****************************************************************  */

var NoAmmoSound = 0;
function AmmoEvnt()
{
	if(event_type == event_push && you._type != _type_player) { return; }
	//DamageBySomke = 1;
	if (PWeapons[ my._ammotype -1 ]!=0)
	{
		if(totalbullets[ my._ammotype -1] >= maxnumcancarry[ my._ammotype -1])  
		{
			if (NoAmmoSound == 0)
			{
				NoAmmoSound =1;
				ShowMessage(5,211);
				play_sound(TakeNoMore,100); 
				wait(50);
				NoAmmoSound = 0;
				return;
			}
			return;
		}
	}
	if (my._ammotype==4)
	{totalbullets[7] +=1;
	}
	totalbullets[my._ammotype -1 ] +=  my._packamount; 
	play_sound(ak_ok, 50);
	if (PWeapons[ my._ammotype -1 ]==0)
	{
		if (my._ammotype > 10)
		{msggdd( 46+my._ammotype );
		}else
		{msggdd( 47+my._ammotype );
		}
		ZoomOut();
	if (my._ammotype == 12)
	{
		create( <RbgB.MDL>, temp, guny);
	}
	if (my._ammotype == colt)
	{
		create( <Colt.MDL>, temp, guny);
	
	}
	if (my._ammotype == m16)
	{	
		if (level.z == 2)
		{create( <M16Mdl.MDL>, temp, guny);
		}
		else
		{create( <M16aMdl.MDL>, temp, guny);
		}
		
	
	}
	if (my._ammotype == m4)
	{
		create( <MdlM4.MDL>, temp, guny);
	}
	if (my._ammotype == 8)
	{
		create( <Graned.MDL>, temp, guny);
	}

	if (my._ammotype == pumaction)
	{
		create( <BumpAction.MDL>, temp, guny);
	
	}
	if (my._ammotype == s99sniper)
	{
		if (level.z == 2)
		{create( <sr99.MDL>, temp, guny);
		}
		else
		{create( <Sr99a.MDL>, temp, guny);
		}
					
	}
	if (my._ammotype == uzi)
	{
		create( <uzi.MDL>, temp, guny);
	
	}
	if (my._ammotype == galili)
	{
		create( <Galili.MDL>, temp, guny);
	
	}
	if (my._ammotype == lmg)
	{
		create( <CImg.MDL>, temp, guny);
	
	}
		you.skill1 = my._ammotype;
	}else
	{
	
	msggdd( 46+doubleuzi+1 );
	}
	AmmoCheck();		
	
	Kick_state = 1;
	Gun_Hand_state();
	remove(me);
}


/* ****************************************************************  */


action PickUpAmmo
{   
my.passable = 1;
my.invisible = 1;
VWeaponSprite1.visible = 1;
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

	PTempstr = LonlyWeapons[  my._ammotype];
	morph ( PTempstr, me);
	wait(1);
	sonar(me,4000);
	my.z -= result;
	wait(1);
	my.push = -1;
	my.enable_push = on;
	my.passable = 0;
	my.invisible = 0;
	
	my.event = AmmoEvnt;
	
	

}

/* ****************************************************************  */
sound GetMedik, <medik.wav>;
function Eventhealth()
{
	if(event_type == event_push && you._type != _type_player) { return; }
	entiy =  Pointer_To_Entity( player.BodyLnk);
	if(entiy._health==0) { return; }
	entiy._health = min( 0, entiy._health + 25);
	HldSld.u =max(entiy._health*16/25,-64);
	play_sound(GetMedik, 100);
	wait(1);
	msggdd( 47+doubleuzi+1);
	remove(me);
}

/* ****************************************************************  */

action PickUpHealth
{    
	while (player == null)
	{
	wait(1);
	}
	my.transparent = 0;
	sonar(me,4000);
	my.z -= result;
	wait(1);
	my.push = -1;
	my.enable_push = on;
	my.event = Eventhealth;
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

