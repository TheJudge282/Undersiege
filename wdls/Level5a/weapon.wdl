

function checkifrepeatable()
{
var
res;
res = (weapon_number == ak47) ||(weapon_number == galili) || (weapon_number == m16) ||(weapon_number == m4) ||(weapon_number == uzi)||(weapon_number == pumaction) ||(weapon_number == Doubleuzi) ;
return(res);
}

/* ****************************************************************  */

function bltd()
{
  my.near=1;
  LMGBulletes = me;
  my.passable = 1;
 

}

/* ****************************************************************  */

function gun_restore()
{

	my._ammotype = int(my._ammotype);

	my.invisible = on;
	my.passable = on;
	my.enable_scan = off;
	my.enable_click = off;
	my.enable_push = off;
	my.event = null;
	if(my.__repeat == on)
	{
		wait(1);
		gun_loaded = 1;
	}
}

/* ****************************************************************  */

/* this function controls the position of the sprite on the screen  */
function sprite_weapon()
{
	VWeaponSprite.skin = weapon_number-(weapon_number>=10);
	if ( (weapon_number == rbj) && (CurrentAmmo.y <= 0))
	{
		VWeaponSprite.skin = 14;
	}
}

function ReloadBullet()
{

	if ( totalbullets[my._ammotype - 1] > maxbulletnum[my._ammotype - 1] )
	{
		// hani
		totalbullets[my._ammotype - 1 ] += bulletnum[my._ammotype - 1 ] ;
		totalbullets[my._ammotype - 1 ] -= maxbulletnum[my._ammotype - 1 ];
		//
		bulletnum[my._ammotype - 1 ] =  maxbulletnum[my._ammotype - 1 ];
	}
	else
	{
		//bulletnum[my._ammotype - 1] =  totalbullets[my._ammotype - 1];
		//totalbullets[my._ammotype - 1] = 0;
		// hani
		temp = bulletnum[my._ammotype - 1] ;
		bulletnum[my._ammotype - 1] =  min( (totalbullets[my._ammotype - 1] + bulletnum[my._ammotype - 1]) , maxbulletnum[my._ammotype - 1 ]  );
		
		if ( (totalbullets[my._ammotype - 1] + temp) - maxbulletnum[my._ammotype - 1 ]  > 0 ) 
		{
			totalbullets[my._ammotype - 1] = (totalbullets[my._ammotype - 1] + temp ) - maxbulletnum[my._ammotype - 1];
		}
		else
		{
			totalbullets[my._ammotype - 1] = 0;
		}
		//
	}
	WeaponGui();
}

/* ****************************************************************  */

// -----------------------------------
// hani code

var ImStillReloding = 0;
define __WaitOut = 5;
define __WaitIn = 5;
define __WaitOk = 5;


//@ this function take care of reload sound of the sprite weapon.
function PlayRelodSound(Weapon)
{
	var SoundPlaying;
	
	if (Weapon == colt)
	{
		ImStillReloding = 1;
		play_sound(colt_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		
		wait(__WaitOut);
		
		play_sound(colt_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		
		wait(__WaitIn);
		
		play_sound(colt_ok,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		
		wait(__WaitOk);

		ImStillReloding = 0;
		return;

	}
	
	if (Weapon == ak47)
	{
		ImStillReloding = 1;
		play_sound(ak_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOut);
		play_sound(ak_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitIn);
		play_sound(ak_ok,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOk);
		ImStillReloding = 0;
		return;
	}
	
	if (Weapon == m16) || (Weapon == m4)
	{
		ImStillReloding = 1;
		play_sound(m16_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOut);
		play_sound(m16_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitIn);
		play_sound(m16_ok,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{	
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOk);
		ImStillReloding = 0;
		return;
	}
	
	
	
	if (Weapon == pumaction)
	{
		/*
		ImStillReloding = 1;
		play_sound(,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			wait(1);
		}
		wait(__WaitOut);wait(__WaitIn);wait(__WaitOk);
		play_sound(,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			wait(1);
		}
		
		play_sound(,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			wait(1);
		}
		ImStillReloding = 0;
		*/
		return;
	}

	if (Weapon == s99sniper)
	{
		ImStillReloding = 1;
		play_sound(s99_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOut);
		play_sound(s99_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitIn);
		play_sound(s99_ok,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOk);
		ImStillReloding = 0;
		return;
	}

	if (Weapon == lmg)
	{
		ImStillReloding = 1;
		play_sound(lmg_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOut);
		play_sound(lmg_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitIn);
		play_sound(lmg_ok,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOk);
		ImStillReloding = 0;
		return;
	}
	
	
	if (Weapon == uzi)
	{
		ImStillReloding = 1;
		play_sound(uzi_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOut);
		play_sound(uzi_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitIn);
		play_sound(uzi_ok,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOk);
		ImStillReloding = 0;
		return;
	}
	
	
	if (Weapon == rbj)
	{
		ImStillReloding = 1;
		play_sound(rbj_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOut);
		play_sound(rbj_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitIn);		
		ImStillReloding = 0;
		return;
	}
	
	if (Weapon == galili)
	{
		ImStillReloding = 1;
		play_sound(galili_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOut);
		play_sound(galili_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitIn);	
		play_sound(galili_ok,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOk);
		ImStillReloding = 0;
		return;
	}
	
	if (Weapon == Doubleuzi)
	{
		ImStillReloding = 1;
		play_sound(uzi2_out,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOut);
		play_sound(uzi2_in,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitIn);	
		play_sound(uzi2_ok,100);
		SoundPlaying = result;
		while (snd_playing(SoundPlaying))
		{
			if (weapon_reloading == 0)
			{
				stop_sound(SoundPlaying);
				return;
			}
			wait(1);
		}
		wait(__WaitOk);
		ImStillReloding = 0;
		return;
	}
}
// -----------------------------------

string xxx = "bullup";
var zzz; 
string lu = "    ";
function reload()
{     
	if (weapon_reloading)	{ return;}
	str_cpy(lu,"Ammo");
	if ( bulletnum[my._ammotype - 1] == maxbulletnum[my._ammotype - 1] )
	{
		WeaponGui();
		return(0);
	}
	var LZoom=0;
	if (camera.arc != 60)
	{
		zoom();
		LZoom = 1;
	}

	weapon_reloading = 1;
	var i = 0;
	var ii =0;
	var test = 100;
	var test2 =0;


	if (SpriteWeapon == 1)  /* sprite weapon */
	{
		var CWep = Weapon_Number;
		var icounter = 0;

		
		if (Weapon_Number == pumaction)
		{			
			while (i < 100)
			{
				if (CWep != Weapon_Number)
				{
					weapon_reloading = 0;
					VWeaponSprite.frame = 0;
					return;
				}

				i += 10;
				str_cpy(lu,"Reload");
				set_frame( VWeaponSprite, lu, i);
				wait(1);
				if (eplhealth){	return;	}
			}

			while ((bulletnum[my._ammotype - 1] < 5)&&(totalbullets[my._ammotype - 1] >0))
			{								
				play_sound(pumaction_reload_sound,50);
				totalbullets[my._ammotype - 1] -= 1;
				bulletnum[my._ammotype - 1] += 1;
				if (CWep != Weapon_Number)
				{
					weapon_reloading = 0;
					VWeaponSprite.frame = 0;
					return;
				}
				
				//@ wait before putting the second bullet.
				icounter = 0;
				while (icounter < 10)
				{
					icounter += 1;
					if (CWep != Weapon_Number)
					{
						weapon_reloading = 0;
						VWeaponSprite.frame = 0;
						return;
					}
					wait(1);
				}
				
				wait(1);
				
			}
			
			while (i > 0)
			{
				if (CWep != Weapon_Number)
				{
					weapon_reloading = 0;
					VWeaponSprite.frame = 0;
					return;
				}
				i -= 10;
				str_cpy( lu,"Reload");
				set_frame( VWeaponSprite, lu, i);
				wait(1);
				if (eplhealth){	return;	}
			}
		}
		else
		{
			while (i < 100)
			{
				if (CWep != Weapon_Number)
				{
					weapon_reloading = 0;
					VWeaponSprite.frame = 0;
					return;
				}

				i += 10;
				str_cpy(lu,"Reload");
				set_frame( VWeaponSprite, lu, i);
				wait(1);
				if (eplhealth){	return;	}
			}
			
			PlayRelodSound(Weapon_Number);
			while (ImStillReloding)
			{			
				if (CWep != Weapon_Number)
				{
					weapon_reloading = 0;
					VWeaponSprite.frame = 0;
					return;
				}
				if (eplhealth){	return;	}
				wait(1);
			}
			
			

			while (i > 0)
			{
				if (CWep != Weapon_Number)
				{
					weapon_reloading = 0;
					VWeaponSprite.frame = 0;
					return;
				}
				i -= 10;
				str_cpy( lu,"Reload");
				set_frame( VWeaponSprite, lu, i);
				wait(1);
				if (eplhealth){	return;	}
			}
		}
		
		
		
	}
	else               /* 3d weapon */
	{

		if (camorder == 2)	
		{
//	first personal shot
			/* handel the ak47 energa and the m-4 gurnade reloading frames */
				//	enerja
			if   (weapon._ammotype == 19)
			{
				morph (ak47_no_energa,weapon);
				while (test  > 0)
				{
					ent_frame("weapup",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
					if (eplhealth){	return;	}
					test -= 5*speed/200;
				}
				morph (ak47_energa,weapon);
				play_sound(rbj_in,50);
				wait(20);
				while (test < 100)
				{ 
					ent_frame("weapup",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
					if (eplhealth){	return;	}
					test += 5*speed/200;
				}
				you = Pointer_To_Entity( player.WeaponMesh1);
				you.frame = 2;
				you =Pointer_To_Entity( player.WeaponAnerga);
				you.invisible =1;
				you.shadow = 0;

				goto StepNull;
			}

					//	m4 bom
			if   (weapon._ammotype == 18)
			{
				while (test  > 0)
				{
					ent_frame("weapup",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
					if (eplhealth){	return;	}
					test -= 5*speed/200;
				}
				play_sound(rbj_in,50);
				wait(20);
					if (eplhealth){	return;	}
				while (test < 100)
				{ 
					ent_frame("weapup",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
					if (eplhealth){	return;	}
					test += 5*speed/200;
				}
				goto StepNull;
			}
						
				//	granade
			if (weapon._ammotype == 8)||(weapon._ammotype == 9)||(weapon._ammotype == 16)||(weapon._ammotype == 15)
			{     goto StepNull;
//				test = 0;
//				while (test < 100)
//				{
//					ent_frame("weapup",test);
//					if (my!=weapon)
//					{
//						goto StepNull2;
//					}
//					wait(1);
//					test += 10;
//				}
//				goto StepNull;
			}
				/* handel the lmg reloading frames */
				test = 0;

				//	lmg
			if (weapon._ammotype == lmg)
			{
				//pos_for_vertex(weapon,LMGBulletes,551,552);
				you = LMGBulletes;
				you.invisible = 1 ;
				while (test < 50)
				{
					ent_frame("wearel",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
					if (eplhealth){	return;	}
					test += animation_speed[weapon_number - 1]*speed/200;
				}
				play_sound(lmg_out,50);
				while (test < 100)
				{
					ent_frame("wearel",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
					if (eplhealth){	return;	}
					test += animation_speed[weapon_number - 1]*speed/200;
				}
				play_sound(lmg_out,50);
				while (test > 0)
				{
					ent_frame("weapup",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
					if (eplhealth){	return;	}
					test -= animation_speed[weapon_number - 1]*1.5*speed/200;
				}
				play_sound(lmg_in,50);
				play_sound(lmg_ok,50);
				test = 0;
				/*           pos_for_vertex(weapon,LMGBulletes,551,552);
				you = LMGBulletes;
				you.invisible = 0;*/
				str_cpy(xxx,"bullup");
				set_frame(you,xxx,100);

				while (test < 100)
				{
					ent_frame("weapup",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
						if (eplhealth){	return;	}
					test += animation_speed[weapon_number - 1]*1.5*speed/200;
					test2 = test * 0.5*speed/200;
				}
				zzz =0;
				goto StepNull;
			}

			/* handel the pum-action full reloading*/

				//	bomupaction
			if (weapon._ammotype ==  pumaction)
			{
				while ((bulletnum[my._ammotype - 1] < 5)&&(totalbullets[my._ammotype - 1] >0))
				{
					my.FrameAnim = 0;
					while (my.FrameAnim < 100)
					{
						ent_cycle("wearel", my.FrameAnim);
						my.FrameAnim += 5*speed/200;
						if (my!=weapon)
						{
							goto StepNull2;
						}
						wait(1);
						if (eplhealth){	return;	}

					}
					play_sound(pumaction_reload_sound,50);
					totalbullets[my._ammotype - 1] -= 1;
					bulletnum[my._ammotype - 1] += 1;
					WeaponGui();
				}
				wait(2);
				if (eplhealth){	return;	}
				play_sound(pum_ok,50);
				test = 0;
				while ( test < 100)
				{
					ent_frame("wearead",test);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					test +=7*speed/200;
				}

				goto StepNull2;
			}

			/* handel rbj reloading frames */

				//	rbj
			if (weapon._ammotype == rbj)
			{
				var dd = 0;
				while (dd < 10)
				{
					ent_frame("wearel",dd);
					dd += 0.6*speed/200;
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
				}
				play_sound(rbj_in,50);
				ReloadBullet();
				while (dd < 100)
				{ 
					ent_frame("wearel",dd);
					dd += 2*speed/200;
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
				}
				goto StepNull2;
			}

				//	double uzi
			if (weapon._ammotype == Doubleuzi)
			{
				
				var aa ;
				aa=0;
				while (aa < 50)
				{       
					ent_frame("wearel",aa);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					aa += 3*speed/200;
				}
				play_sound(uzi2_out, 30);
				while (aa < 100)
				{       
					ent_frame("wearel",aa);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					aa += 3*speed/200;
				}
				play_sound(uzi2_in, 30);
				ReloadBullet();
				aa=0;
				while (aa < 50)
				{
					ent_frame("weapup",aa);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					aa += 8*speed/200;
				}
				play_sound(uzi2_ok,30);
				while (aa < 100)
				{
					ent_frame("weapup",aa);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					aa += 8*speed/200;
				}
				goto StepNull2;
			}
			weapon_reloading = 1;

			/* moving out */
			while (test < gun_out[weapon_number - 1])
			{
				/////////////////
				//   my.FrameAnim = max( my.FrameAnim +20 , 60);
				//      ent_frame("Ammo", test);
				/////////////////


				ent_frame("wearel",test);
				if (my!=weapon)
				{
					goto StepNull2;
				}
				if (eplhealth){	return;	}
				wait(1);
				test += animation_speed[weapon_number -1]*speed/200;
			}

				//	all weapons
			if (weapon_number == colt     )   { play_sound(colt_out,50);       goto step1; }
			if (weapon_number == ak47     )   { play_sound(ak_out,50);         goto step1; }
			if (weapon_number == m16      )   { play_sound(m16_out,50);        goto step1; }
			if (weapon_number == m4       )   { play_sound(m16_out,50);        goto step1; }
			if (weapon_number == s99sniper)   { play_sound(s99_out,50);        goto step1; }
			if (weapon_number == uzi      )   { play_sound(uzi_out,50);        goto step1; }
			if (weapon_number == galili   )   { play_sound(galili_out,50);      goto step1;}
			//if (weapon_number == 14)  {play_sound(uzi2_out,50);        goto step1; }
			step1:
			//wait(70) ;

			/* moving in */
			test = gun_out[weapon_number - 1];
			// test2 = gun_out[weapon_number - 1];
			while (test < gun_in[weapon_number - 1])
			{
				/////////////////
				//   my.FrameAnim = max( my.FrameAnim +20 , 60);
				//ent_frame("Ammo", test );
				/////////////////

				ent_frame("wearel",test);
				if (my!=weapon)
				{
					goto StepNull2;
				}
				if (eplhealth){	return;	}
				wait(1);
				test += animation_speed[weapon_number -1]*speed/200;
			}

			if (weapon_number == colt     )  { play_sound(colt_in,50);       goto step2; }
			if (weapon_number == ak47     )  { play_sound(ak_in,50);           goto step2; }
			if (weapon_number == m16      )  { play_sound(m16_in,50);          goto step2; }
			if (weapon_number == m4       )  { play_sound(m16_in,50);          goto step2; }
			if (weapon_number == s99sniper)  { play_sound(s99_in,50);          goto step2; }
			if (weapon_number == uzi      )  { play_sound(uzi_in,50);          goto step2; }
			if (weapon_number == galili   )  { play_sound(galili_in,50);       goto step2; }
			//if (weapon_number == 14) { play_sound(uzi2_in,50);         goto step2; }
			step2:
			ReloadBullet();
			// wait(10) ;

			/* moving to reload pos*/
			test = gun_in[weapon_number - 1] ;
			while (test < gun_reload[weapon_number - 1] )
			{
				/////////////////
				//   my.FrameAnim = max( my.FrameAnim +20 , 60);
				//ent_frame("Ammo", test);
				/////////////////
				ent_frame("wearel",test);
				if (my!=weapon)
				{
					goto StepNull2;
				}
				if (eplhealth){	return;	}
				wait(1);
				test += animation_speed[weapon_number -1]*speed/200;
			}
			//wait(70);


			/* reloading */
			if (weapon_number == colt     )  { play_sound(colt_ok,50);         goto step3; }
			if (weapon_number == ak47     )  { play_sound(ak_ok,50);           goto step3; }
			if (weapon_number == m16      )  { play_sound(m16_ok,50);          goto step3; }
			if (weapon_number == m4       )  { play_sound(m16_ok,50);          goto step3; }
			if (weapon_number == s99sniper)  { play_sound(s99_ok,50);          goto step3; }
			if (weapon_number == uzi      )  { play_sound(uzi_ok,50);          goto step3; }
			if (weapon_number == galili   )  { play_sound(galili_ok,50);       goto step3; }
			//if (weapon_number == 14) { play_sound(uzi2_ok,50);         goto step3; }
			step3:

			while (test < 100)
			{
				/////////////////
				//my.FrameAnim = max( my.FrameAnim +20 , 60);
				//ent_frame("Ammo", test );
				/////////////////

				ent_frame("wearel",test);
				if (my!=weapon)
				{
					goto StepNull2;
				}
				if (eplhealth){	return;	}
				wait(1);
				test += animation_speed[weapon_number -1]*1.2*speed/200;
			}
			ent_frame("weapup",100);
			goto StepNull2;
		}
		else
		{
//	3D shot
			/* handel the ak47 energa and the m-4 gurnade reloading frames */

				//	enerja
			if   (weapon._ammotype == 19)
			{
				morph (ak47_energa,weapon);
				PartIndex = 8;
				SetActivePart( SharedEntity, BodyParts[PartIndex],0);
				SetActivePart( SharedEntity, BodyParts[PartIndex],1);
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[6]);
				you = Pointer_To_Entity( player.WeaponAnerga);
				you.invisible =0;
				you.shadow = shadowenable;

				while (test2  < 50)
				{
					AnimModelPart( SharedEntity, 50*speed/200, BodyParts[PartIndex]);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					test2 += 5*speed/200;
				}
				play_sound(rbj_in,50);
				//wait(20);
				while (test2 < 100)
				{ 
					AnimModelPart( SharedEntity, 50*speed/200, BodyParts[PartIndex]);
					//set_frame( you, lu, test );
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					test2 += 5*speed/200;
				}
				you = Pointer_To_Entity( player.WeaponMesh1);
				you.frame = 2;
				you = Pointer_To_Entity( player.WeaponAnerga);
				you.invisible =1;
				you.shadow = 0;
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[7]);
				AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);

				goto StepNull;
			}

					//	m4 bom
			if   (weapon._ammotype == 18)
			{
				PartIndex = 8;
				SetActivePart( SharedEntity, BodyParts[PartIndex],0);
				SetActivePart( SharedEntity, BodyParts[PartIndex],1);
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[8]);
				while (test2  < 50)
				{
					AnimModelPart( SharedEntity, 20*speed/200, BodyParts[PartIndex]);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					test2 += 5*speed/200;
				}
				play_sound(rbj_in,50);
				while (test2 < 100)
				{ 
					AnimModelPart( SharedEntity, -20*speed/200, BodyParts[PartIndex]);
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					test2 += 5*speed/200;
				}
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
				AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);

				goto StepNull;
			}

				//	granade
			if (weapon._ammotype == 8)||(weapon._ammotype == 9)||(weapon._ammotype == 16)||(weapon._ammotype == 15)
			{     goto StepNull;
//				test = 0;
//				you = ptr_for_handle(player.HandsLnk);
//				while (test < 100)
//				{
//					set_frame( you, lu, test );
//					if (my!=weapon)
//					{
//						goto StepNull2;
//					}
//					wait(1);
//					test += 10;
//				}
//				goto StepNull;
			}
				/* handel the lmg reloading frames */
				test = 0;

				//	lmg
			if (weapon._ammotype == lmg)
			{
				
				PartIndex = 9;
				
				SetActivePart( SharedEntity, BodyParts[PartIndex],0);
				SetActivePart( SharedEntity, BodyParts[PartIndex],1);
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[5]);
				//you = ptr_for_handle(player.HandsLnk);
				while (test < 50)
				{
					 AnimModelPart( SharedEntity, 20*speed/200, BodyParts[PartIndex]);
					//set_frame( you, lu, test );
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					test += animation_speed1[weapon_number - 1]*speed/200;
					test2 = test * 0.5*speed/200;
				}
				play_sound(lmg_out,50);
				while (test < 100)
				{
					 AnimModelPart( SharedEntity, 20*speed/200, BodyParts[PartIndex]);
					//set_frame( you, lu, test );
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					test += animation_speed1[weapon_number - 1]*speed/200;
					test2 = test * 0.5*speed/200;
				}
				play_sound(lmg_out,50);
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
				AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);

				goto StepNull;
			}

			/* handel the pum-action full reloading*/

				//	bomupaction
			if (weapon._ammotype ==  pumaction)
			{
				PartIndex = 17;
				SetActivePart( SharedEntity, BodyParts[PartIndex],0);
				SetActivePart( SharedEntity, BodyParts[PartIndex],1);
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[5]);

				//you = ptr_for_handle(player.HandsLnk);
				while ((bulletnum[my._ammotype - 1] < 5)&&(totalbullets[my._ammotype - 1] >0))
				{	
					SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[5]);

					my.FrameAnim = 0;
					str_cpy(lu,"Ammo");
					while (my.FrameAnim < 100)
					{	
						AnimModelPart( SharedEntity, 10*speed/200, BodyParts[PartIndex]);
						//set_frame( you, lu, my.FrameAnim );
						my.FrameAnim += 8*speed/200;
						if (my!=weapon)
						{
							goto StepNull2;
						}
						if (eplhealth){	return;	}
						wait(1);

					}
					play_sound(pumaction_reload_sound,50);
					totalbullets[my._ammotype - 1] -= 1;
					bulletnum[my._ammotype - 1] += 1;
					WeaponGui();
				}
				wait(2);
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[1]);
				str_cpy(lu,"Reload");
				play_sound(pum_ok,50);
				test = 0;
				while ( test < 100)
				{
					AnimModelPart( SharedEntity, 50*speed/200, BodyParts[PartIndex]);
					//set_frame( you, lu, test );
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					test +=6*speed/200;
				}
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
				AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);

				goto StepNull2;
			}

			/* handel rbj reloading frames */

				//	rbj
			if (weapon._ammotype == rbj)
			{
				PartIndex = 14;
				you = Pointer_To_Entity( player.WeaponStore1);
				//you.invisible =0;
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[5]);
				//you = ptr_for_handle(player.HandsLnk);
				var dd = 0;
				while (dd < 5)
				{ AnimModelPart( SharedEntity, 20*speed/200, BodyParts[PartIndex]);  
					//set_frame( you, lu, dd );
					dd += 1*speed/200;
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
				}
				play_sound(rbj_in,50);
				ReloadBullet();
				//you = Pointer_To_Entity( player.WeaponStore1);
				//you.invisible =1;

				while (dd < 100)
				{  AnimModelPart( SharedEntity, 20*speed/200, BodyParts[PartIndex]);  
					set_frame( you, lu, dd );
					dd += 2*speed/200;
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
				}
				dd = 0;
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
				AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);

				goto StepNull2;
			}

				//	double uzi
			if (weapon._ammotype == Doubleuzi)
			{
				PartIndex = 16;
				//you = ptr_for_handle(player.HandsLnk);
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[5]);
				var aa ;
				aa=0;
				play_sound(uzi2_out, 30);
				while (aa < 25)
				{     AnimModelPart( SharedEntity, 25*speed/200, BodyParts[PartIndex]);  
					set_frame( you, lu, aa );
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					aa += 3*speed/200;
				}
				
				play_sound(uzi2_ok,30);
				while (aa < 50)
				{       AnimModelPart( SharedEntity, 25*speed/200, BodyParts[PartIndex]);
					set_frame( you, lu, aa );
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					aa += 3*speed/200;
				}
				//play_sound(uzi2_ok,30);
				//play_sound(uzi2_in,30);
				ReloadBullet();
			/*	while (aa < 75)
				{AnimModelPart( SharedEntity, 25, BodyParts[PartIndex]);
					set_frame( you, lu, aa );
					if (my!=weapon)
					{
						goto StepNull2;
					}
					wait(1);
					aa += 3;
				}*/
				//
				while (aa < 100)
				{AnimModelPart( SharedEntity, 15*speed/200, BodyParts[PartIndex]);
					set_frame( you, lu, aa );
					if (my!=weapon)
					{
						goto StepNull2;
					}
					if (eplhealth){	return;	}
					wait(1);
					aa += 2*speed/200;
				}
				SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
				AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
				goto StepNull2;
			}
			weapon_reloading = 1;

				//	all weapons
			/* moving out */
			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);

			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[5]);
			while (test < gun_out1[weapon_number - 1])
			{
				/////////////////
				//   my.FrameAnim = max( my.FrameAnim +20 , 60);
				//      ent_frame("Ammo", test);
				//you = ptr_for_handle(player.HandsLnk);
				//set_frame( you, lu, test );
				/////////////////
				AnimModelPart( SharedEntity, 15*speed/200, BodyParts[PartIndex]);
				if (my!=weapon)
				{
					goto StepNull2;
				}
				if (eplhealth){	return;	}
				wait(1);
				test += animation_speed1[weapon_number -1]*speed/200;//*1.5;
				test2 += animation_speed1[weapon_number -1]*1.1*speed/200;
			}		
			if (weapon_number == colt     )   { play_sound(colt_out,50);       goto step4; }
			if (weapon_number == ak47     )   { play_sound(ak_out,50);         goto step4; }
			if (weapon_number == m16      )   { play_sound(m16_out,50);        goto step4; }
			if (weapon_number == m4       )   { play_sound(m16_out,50);        goto step4; }
			if (weapon_number == s99sniper)   { play_sound(s99_out,50);        goto step4; }
			if (weapon_number == uzi      )   { play_sound(uzi_out,50);        goto step4; }
			if (weapon_number == galili   )   { play_sound(galili_out,50);      goto step4;}
			//if (weapon_number == 14)  {play_sound(uzi2_out,50);        goto step4; }
			step4:
			//wait(70) ;
			
			/* moving in */
			test = gun_out1[weapon_number - 1];
			// test2 = gun_out[weapon_number - 1];
			while (test < gun_in1[weapon_number - 1])
			{
				/////////////////
				//   my.FrameAnim = max( my.FrameAnim +20 , 60);
				//ent_frame("Ammo", test );
				//you = ptr_for_handle(player.HandsLnk);
				AnimModelPart( SharedEntity, 20*speed/200, BodyParts[PartIndex]);
				set_frame( you, lu, test );
				/////////////////
				if (my!=weapon)
				{
					goto StepNull2;
				}
				if (eplhealth){	return;	}
				wait(1);
				test += animation_speed1[weapon_number -1]*speed/200;//*1.5;
				test2 += animation_speed1[weapon_number -1]*1.1*speed/200;
			}

			if (weapon_number == colt     )  { play_sound(colt_in,50);       goto step5; }
			if (weapon_number == ak47     )  { play_sound(ak_in,50);           goto step5; }
			if (weapon_number == m16      )  { play_sound(m16_in,50);          goto step5; }
			if (weapon_number == m4       )  { play_sound(m16_in,50);          goto step5; }
			if (weapon_number == s99sniper)  { play_sound(s99_in,50);          goto step5; }
			if (weapon_number == uzi      )  { play_sound(uzi_in,50);          goto step5; }
			if (weapon_number == galili   )  { play_sound(galili_in,50);       goto step5; }
			//if (weapon_number == 14) { play_sound(uzi2_in,50);         goto step5; }
			step5:
			ReloadBullet();
			// wait(70) ;

			/* moving to reload pos*/
			test = gun_in1[weapon_number - 1] ;
			//test2 = gun_in[weapon_number - 1] ;
			while (test < gun_reload1[weapon_number - 1] )
			{
				/////////////////
				//   my.FrameAnim = max( my.FrameAnim +20 , 60);
				//ent_frame("Ammo", test);
				//you = ptr_for_handle(player.HandsLnk);
				AnimModelPart( SharedEntity, 15*speed/200, BodyParts[PartIndex]);
				set_frame( you, lu, test );
				/////////////////
				if (my!=weapon)
				{
					goto StepNull2;
				}
				if (eplhealth){	return;	}
				wait(1);
				test += animation_speed1[weapon_number -1]*speed/200;//*1.5;
				test2 += animation_speed1[weapon_number -1]*1.1*speed/200;
			}
			//wait(20);

			/* reloading */
			if (weapon_number == colt     )  { play_sound(colt_ok,50);         goto step6; }
			if (weapon_number == ak47     )  { play_sound(ak_ok,50);           goto step6; }
			if (weapon_number == m16      )  { play_sound(m16_ok,50);          goto step6; }
			if (weapon_number == m4       )  { play_sound(m16_ok,50);          goto step6; }
			if (weapon_number == s99sniper)  { play_sound(s99_ok,50);          goto step6; }
			if (weapon_number == uzi      )  { play_sound(uzi_ok,50);          goto step6; }
			if (weapon_number == galili   )  { play_sound(galili_ok,50);       goto step6; }
			//if (weapon_number == 14) { play_sound(uzi2_ok,50);         goto step6; }
			step6:
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[1]);
			while (test < 100)
			{
				/////////////////
				//my.FrameAnim = max( my.FrameAnim +20 , 60);
				//ent_frame("Ammo", test );
				//you = ptr_for_handle(player.HandsLnk);
				AnimModelPart( SharedEntity, 30*speed/200, BodyParts[PartIndex]);
				set_frame( you, lu, test );
				/////////////////
				if (my!=weapon)
				{
					goto StepNull2;
				}
				if (eplhealth){	return;	}
				wait(1);
				test += animation_speed1[weapon_number -1]*speed/200;
				test2 += animation_speed1[weapon_number -1]*1.1*speed/200;
			}
			test2 =0;
			set_frame( you, lu, test2 );
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
			goto StepNull2;
		}
	}
	StepNull:

	if ( totalbullets[my._ammotype - 1] > maxbulletnum[my._ammotype - 1] )
	{
		//totalbullets[my._ammotype - 1 ] -= maxbulletnum[my._ammotype - 1 ];
		//      totalbullets[my._ammotype - 1 ] += bulletnum[my._ammotype - 1 ];
		//      bulletnum[my._ammotype - 1 ] =  maxbulletnum[my._ammotype - 1 ];
		totalbullets[my._ammotype - 1 ] += bulletnum[my._ammotype - 1 ] ;
		totalbullets[my._ammotype - 1] -= maxbulletnum[my._ammotype - 1] ;
		bulletnum[my._ammotype - 1] = maxbulletnum[my._ammotype - 1];
	}
	else
	{
		//bulletnum[my._ammotype - 1] =  totalbullets[my._ammotype - 1];
		//totalbullets[my._ammotype - 1] = 0;
		// hani
		temp = bulletnum[my._ammotype - 1] ;
		bulletnum[my._ammotype - 1] =  min( (totalbullets[my._ammotype - 1] + bulletnum[my._ammotype - 1]) , maxbulletnum[my._ammotype - 1 ]  );
		
		if ( (totalbullets[my._ammotype - 1] + temp) - maxbulletnum[my._ammotype - 1 ]  > 0 ) 
		{
			totalbullets[my._ammotype - 1] = (totalbullets[my._ammotype - 1] + temp ) - maxbulletnum[my._ammotype - 1];
		}
		else
		{
			totalbullets[my._ammotype - 1] = 0;
		}
	}

	StepNull2:
	weapon_reloading = 0;
	WeaponGui();

	if ( LZoom)
	{
		zoom();
	}

}

/* ****************************************************************  */

function GunNoAmmo()
{
	
if (eplhealth){	return;	}
if (my._fire)
{
return;
}
	my._fire = 10;
			
  	     if (weapon._ammotype == 1)                                   { play_sound(colt_empty_sound ,50);  }	
	     if (  (weapon._ammotype == 2) || (weapon._ammotype == 10)  ) { play_sound(ak_empty_sound ,50);    }
	     if (  (weapon._ammotype == 3) || (weapon._ammotype == 4) )	  { play_sound(m16_empty_sound ,50);   }	
	     if ((weapon._ammotype == 5)||(weapon._ammotype == 12))	  { play_sound(pum_empty,50); }
	     if (weapon._ammotype == s99sniper)					  { play_sound(s99_empty_sound ,50);	}			
             if (weapon._ammotype == 7)					  { play_sound(lmg_empty,50);	}
	     if (weapon._ammotype == 11)||(weapon._ammotype == 14)	  { play_sound(uzi_empty_sound ,50);	}
	     if (weapon._ammotype == 13)				  { play_sound(galili_empty,50);	}	

}

function AnimateLmgBullets(cmy)
{
  my = cmy;
  var FBAnimate = 0;
			    while (FBAnimate < 100)
			       {
			         FBAnimate += 50;
                                 my.FrameAnim += 50;
                                 ent_frame("bullup",  frc(my.FrameAnim/100)*100 );
			         wait(1);
                               }                    		  

}

/* ****************************************************************  */

function WeaponSound3d(WeaponN)
{
	if (WeaponN == colt)             { play_entsound( me, colt_fire_sound, 1000);		goto Snd;}
	if (WeaponN == ak47)            { play_entsound( me, ak_fire_sound,1000);                goto Snd;}
	if ( (WeaponN == m16) ||(WeaponN == m4)){ if (random(10)>5){play_entsound(me,m16fire1,1000);}else{play_entsound(me,m16fire2,1000);}	goto Snd;}
	if (WeaponN == pumaction)        { play_entsound( me, pumaction_fire_sound, 1000);	goto Snd;}
	if (WeaponN == s99sniper)        { play_entsound( me, s99_fire_sound, 10000);		goto Snd;}
	if (WeaponN == lmg)             { play_entsound( me, lmg_fire_sound, 1000);		goto Snd;}
	if (WeaponN == uzi)              { play_entsound( me, uzi_fire_sound, 1000);		goto Snd;}
	if (WeaponN == rbj)              { play_entsound( me, rbj_fire_sound, 1000);		goto Snd;}
	if (WeaponN == galili)           { play_entsound( me, galili_fire_sound, 1000);		goto Snd;}
	if (WeaponN == Doubleuzi)       { play_entsound( me, uzi_fire_sound, 1000);		goto Snd;}
	if (WeaponN == 15)               { play_entsound( me, Stick_fire, 1000);			goto Snd;}
	//if (WeaponN == 16)               { play_entsound( me, gurnade_fire, 1000);                 return;}
	Snd :
	temp.x = speed/2;
	tune_sound( result, 0, temp.x);

}

function  AnimateWeapon()
{     		

	if (my._ammotype == colt)                { play_sound(colt_fire_sound,30);      goto Snd;	}
	if (my._ammotype == ak47)               { play_sound(ak_fire_sound ,30);	goto Snd;	}
	if ( (my._ammotype == m16) ||
	(my._ammotype == m4)   )            { play_sound(m16_fire_sound ,30);		goto Snd;	}

	if (my._ammotype == pumaction)           { play_sound(pumaction_fire_sound ,30);goto Snd;	}
	if (my._ammotype == s99sniper)           { play_sound(s99_fire_sound ,30);	goto Snd;	}
	if (my._ammotype == lmg)                { play_sound(lmg_fire_sound ,30);	goto Snd;	}
	if (my._ammotype == uzi)         { play_sound(uzi_fire_sound ,30);		goto Snd;	}
	if (my._ammotype == rbj)                 { play_sound (rbj_fire_sound,30);	goto Snd;	}
	if (my._ammotype == galili)              { play_sound(galili_fire_sound ,30);	goto Snd;	}
	if (my._ammotype == Doubleuzi)          { play_sound(uzi_fire_sound ,60);	goto Snd;	}
	//if (my._ammotype == 15)          { play_sound(Stick_fire,30);        }
	//if (my._ammotype == 16)              { play_sound(gurnade_fire,30);              }
	//if (my._ammotype == 17)          { play_sound(rbj_fire_sound,30);        }
	Snd :
	temp.x = speed/2;
	tune_sound( result, 0, temp.x);

	var speed2 = 0;
	var xx = 0;
	
	if (my._ammotype != 8)&&(my._ammotype != 9)&&(my._ammotype != 16)&&(my._ammotype != 15)
	{
	
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
		while ((my.FrameAnim<60))
		{
			AnimModelPart( SharedEntity, 50*speed/200, BodyParts[PartIndex]);
			my.FrameAnim = max( my.FrameAnim +20*speed/200 , 60);
			ent_frame("weasho", my.FrameAnim );
			if (eplhealth){	return;	}
			wait(1);
		}
	}
	
	if (my._ammotype == lmg)
	{
		//                         pos_for_vertex(my,LMGBulletes,551,552);
		you = LMGBulletes;
		if ( bulletnum[my._ammotype - 1] < 4)
		{
			str_cpy(xxx,"weahide");
			zzz = 100-bulletnum[my._ammotype - 1]*30;
			set_frame( you, xxx, zzz);
		}
		if ( bulletnum[my._ammotype - 1] > 4)
		{
			AnimateLmgBullets(you);
		}
	}
	if ((my._ammotype == pumaction)&&(bulletnum[my._ammotype - 1] > 0))
	{
		wait(5);
		play_sound(pum_ok,50);

		EmptyBulleThrow();
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[1]);
		my.FrameAnim = 0;
		while (my.FrameAnim<100)
		{
			AnimModelPart( SharedEntity, 50*speed/200, BodyParts[PartIndex]);
			my.FrameAnim += 5*speed/200;
			ent_frame("wearead", my.FrameAnim );
			my.FrameAnim += 5*speed/200;
			if (my.FrameAnim <= 50)
			{
				temp.x = my.FrameAnim*2;
			}
			else
			{
				temp.x = (100-my.FrameAnim)*2;
			}
			if (eplhealth){	return;	}
			wait(1);
		}
	}
	if(my.__repeat == on) 
	{
		if (Weap_fire_time[my._weaponnumber-1]>0)
		{
			wait(Weap_fire_time[my._weaponnumber-1]*200/speed);
		}
		VWeaponSprite.frame = 1;
		my._fire = 0; gun_loaded = 1;
	}
	else
	{
		VWeaponSprite.frame = 1;
		my._fire = 0;
		if (my._ammotype != 8)&&(my._ammotype != 9)&&(my._ammotype != 16)&&(my._ammotype != 15)
		{
			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);			

			while ((my.FrameAnim >10)&&(my._fire  == 0))
			{
				my.FrameAnim -= 10*speed/200;
				ent_frame("weasho", my.FrameAnim );
				AnimModelPart( SharedEntity, 50*speed/200, BodyParts[PartIndex]);
				if (eplhealth){	return;	}
				wait(1);
			}
			ent_frame("weapuP", 100 );
		}
	}
}



function GunShot()
{
	if (eplhealth){	return;	}	          
  	my_pos.x =  my.max_x - 1;
	my_pos.y = 0;
	my_pos.z = 0;
	vec_rotate(my_pos,camera.pan);
        my_pos.x += camera.x;
	my_pos.y += camera.y;
	my_pos.z += camera.z;	
	
	vec_set(gun_muzzle.x,my_pos.x);

	  
	  /* handle  rocket  launch  */		
	if( ( my._ammotype == 12)  || ( my._ammotype == 19) || ( my._ammotype == 18))              
	{  
			PazokaShot(player);
	}else
	{

	  /* handle gurnade launch */
        if (my._ammotype == 8)
	  { 
		throwthegrenade(weapon, player.MyTilt , 0, 1);
	  	return;    
	  }
        if ( my._ammotype == 9)
	  { 
		throwthegrenade(weapon, player.MyTilt , 1, 1);
	  	return;    
	  }
       if (my._ammotype == 16)  
	  { 
		HitWithStone(weapon, player.MyTilt , 1);
	  	return;    
	  }
	if ( my._ammotype == 15)
	  { 
		HitWithStick(player,1);
		  	return;    
	  }
		
	else
	{	
		if (weapon_number == Doubleuzi)
		{
			DblShotBullet( player);
		}else
		{
		 if (weapon_number == pumaction)
		 {
			RandShotBullet( player);
		 }else
		 {
			ShotBullet( player);
		 }
		
		}
	}  
	
	}


	/*  handle ejecting the empty bulltes */
	if(   ((my._ammotype >= colt) && ( my._ammotype <= lmg) ) || ( my._ammotype == uzi) || ( my._ammotype == galili) || ( my._ammotype == Doubleuzi) )&& ( my._ammotype != pumaction)
	{ 
	//EmptyBulleThrow();

	}

     
}

/* ****************************************************************  */


function FireGun()
{ 
	// check to make sure we have ammo
	// if so, reduce ammo# count by one
	// else got 'no_ammo'
	if(bulletnum[my._ammotype - 1] > 0) 
	{
		if (weapon_number !=15)&&(weapon_number !=16)
		{
			bulletnum[my._ammotype - 1] -= 1;
		}
		
	}
	else
	{ 
	    if ( totalbullets[my._ammotype - 1] > 0)
	    {                       		       
	       
	       reload();	
	       return;
	    }
	    else
	    {
		GunNoAmmo();
		return;
	     }
	    
	}

	 WeaponGui();
	gun_loaded = 0;
        

  	//GunFlash();	
	weapon.Flashing  = 1;

	damage = my._damage;
	
	if(player.passable == off)
	  {		
		player.passable = on;
		GunShot();
 		player.passable = off;
	  }
	else
	  {
				
		GunShot();
	  }
	if (eplhealth){	return;	}	          

	my._fire = 10;
	VWeaponSprite.frame = 2;
	AnimateWeapon(); 
        if (my._weaponnumber == rbj)
        {
	wait(1);
	if (eplhealth){	return;	}	          
		    if ( totalbullets[my._ammotype - 1] > 0)
		    {                       		       
		       reload();	
		    }
        }
        if (my._weaponnumber == 8)||(my._weaponnumber == 9)||(my._weaponnumber == 16)||(my._weaponnumber == 15)
        {
			wait(1);
	if (eplhealth){	return;	}	          
		    if ( totalbullets[my._ammotype - 1] > 0)
		    {                       		       
		       reload();	
		    }
        }
	
	if (my._ammotype == 19)||(my._ammotype == 18)
        {
	
	wait(1);
	if (eplhealth){	return;	}	          
		    
		    if ( totalbullets[my._ammotype - 1] > 0)
		    {                       		       
		       reload();	
		    }
		    else
		    {
		         morph(ak47_no_energa,weapon);
		    }
        }
}

/* ****************************************************************  */
string walk_frame = "walk";
var xx = 0;
var lxx = 0;
function CarryWeapon()
{
	if (eplhealth){	return;	}
  	if(weapon == null || player == null) { return; }
        weapon.passable = on;

	weapon.near = on;     // don't clip to player view
		
	if (SpriteWeapon == 1) { sprite_weapon();	weapon.invisible = 1;	VWeaponSprite.visible = player.invisible==1;}
	else		    { weapon.invisible = 1-player.invisible;VWeaponSprite.visible = 0;	}
//////////////////////////////luai code/////////////
	VWeaponSprite1.invisible = 1;
	VWeaponSprite1.skin = weapon_number;
/////////////////////////////////////////////////
		
				
	my_pos.x =  Weap_offs.x;
	my_pos.y =  Weap_offs.y;
	my_pos.z =  Weap_offs.z;

	camera_xyz();
	CamraPan.roll = nearnumber(CamraPan.roll,abs(CamraPan.tilt),0.1);
	weapon.x = my_pos.x ;
	weapon.y = my_pos.y;
	weapon.z = my_pos.z;
	weapon.pan = camera.pan   + weapon.skill30 - CamraPan.roll*abs(1.125+sin(CamraPan/2)*0.2);
	weapon.tilt = camera.tilt + weapon.skill31 - CamraPan.roll*abs(1.25+sin(CamraPan/2)*0.5);
	weapon.roll = 0;//sin(CamraPan)/2;
	VWeaponSprite.y = -2.5	+ (weapon.skill30 - CamraPan.roll*abs(1.125+sin(CamraPan/2)*0.2))*0.1; 
	VWeaponSprite.z = -0.8	+ (weapon.skill31 - CamraPan.roll*abs(1.25+sin(CamraPan/2)*0.5))*0.1;
	if(weapon._weaponnumber==7)
	  {			
//		pos_for_vertex(weapon,LMGBulletes,551,552);
	  }
                
	if ((weapon._weaponnumber == 8)&&(weapon._fire == 0))
          {
		xx = max( xx+ abs( headwave - lxx )*10 - 1, 0);
		if (xx>100)
		{
		xx=0;
		}
		lxx = headwave;
		set_cycle( weapon, walk_frame, xx);
           }
	if (weapon.Flashing)
	{  GunFlash(); weapon.Flashing=0;	}

}

/* ****************************************************************  */

function SelectNewGun()
{
	if (eplhealth){	return;	}
	if(weapon != null)
	{       // remove old weapon
		weapon.invisible = on;
		weapon.passable = on;
	}
	me = Pointer_To_Entity( PWeapons[weapon_number-1]);

	if(me == null) { return(-1); }
	if (weapon_number == 15)
	{
		if (cameraction == EyCamera)&&(player != null)
		{
			camorder=3;
			cameraction = TPsCamra;
			player.invisible = 0;
			player.shadow = (player.invisible == 0)&&shadowenable;

		}
	}
	if (player)
	{
		
		if ( weapon_number==2 || weapon_number==3 || weapon_number==4 || weapon_number==13 )
		{
			VisibleGui1(1);
			you =Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =0;
			//if (camorder!=2)
			//{you.shadow = 1;}

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 8;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			goto shapeme;
		}
		if (weapon_number==s99sniper)
		{
			VisibleGui1(1);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =0;
			//if (camorder!=2)
			//{you.shadow = 1;}

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 8;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			goto shapeme;
		}

		if ( weapon_number==7 )
		{
			VisibleGui1(1);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =0;
			//if (camorder!=2)
			//{you.shadow = 1;}

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 9;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			goto shapeme;
		}

		if ( weapon_number==5 )
		{
			VisibleGui1(1);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =0;
			//if (camorder!=2)
			//{you.shadow = 1;}

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 17;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			goto shapeme;
		}

		if ( weapon_number==12 )
		{

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 14;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			VisibleGui1(1);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =1;
			//if (camorder!=2)
			//{you.shadow = 1;}

			goto shapeme;
		}

		if ( weapon_number==11 )
		{
			VisibleGui1(1);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =0;
			//if (camorder!=2)
			//{you.shadow = 1;}

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 15;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			goto shapeme;
		}

		if ( weapon_number==1 )
		{
			VisibleGui1(1);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =1;
			//you.shadow = 0;

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 10;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			goto shapeme;
		}

		if ( weapon_number==15 )
		{
			VisibleGui1(0);
			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 13;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[0]);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =1;
			//you.shadow = 0;

			goto shapeme;
		}
		
		if ( weapon_number==14 )
		{
			VisibleGui1(1);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =0;
			//if (camorder!=2)
			//{you.shadow = 1;}
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =0;
			//if (camorder!=2)
			//{you.shadow = 1;}
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =0;
			//if (camorder!=2)
			//{you.shadow = 1;}

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 16;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
			goto shapeme;
		}

		if ( weapon_number==8 || weapon_number==9 )
		{
			VisibleGui1(1);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =1;
			//you.shadow = 0;

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 11;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[8]);
			goto shapeme;
		}
		if (weapon_number==16)
		{
			VisibleGui1(0);
			you = Pointer_To_Entity( player.WeaponMesh2);
			you.invisible =1;
			//you.shadow = 0;
			you =Pointer_To_Entity( player.WeaponStore2);
			you.invisible =1;
			//you.shadow = 0;
			you = Pointer_To_Entity( player.WeaponStore1);
			you.invisible =1;
			//you.shadow = 0;

			SetActivePart( SharedEntity, BodyParts[PartIndex],0);
			PartIndex = 11;
			SetActivePart( SharedEntity, BodyParts[PartIndex],1);
			SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[8]);
			goto shapeme;
		}

	shapeme:
		//nshowmessage(str_for_num(weapon_number));
		PTempstr = WeapnsFiles[weapon_number];
		you = Pointer_To_Entity( player.WeaponMesh1);
		morph ( PTempstr, you);
		AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);  
		if (StoresFiles[weapon_number]!=0)
		{
			PTempstr = StoresFiles[weapon_number];
			you = Pointer_To_Entity( player.WeaponStore1);
			morph ( PTempstr, you);
		}
	}


	if ((my._weaponnumber==colt)||(my._weaponnumber==uzi)||(my._weaponnumber==Doubleuzi))
	{
		WeaponStore.skin = 3;
	}
	else
	{
		if (my._weaponnumber== pumaction)
		{
			WeaponStore.skin = 2;
		}
		else
		{
			if (my._weaponnumber== gurnade)
			{
		 		WeaponStore.skin = 5;
			}
			 else
			{
				if (my._weaponnumber== lmg)
				{
					WeaponStore.skin = 4;
				}
				else
				{
					if (my._weaponnumber== rbj)
					{
		 				WeaponStore.skin = s99sniper;
					}
					 else
					{
						WeaponStore.skin = 1;
					}
				}
			}
		}
	}

	ammo_number = my._ammotype;
	my.invisible =  0;
	my.passable = on;       // prevent collision with obstacles
	my.near = on;   // prevent clipping
	weapon = me;            // i'm the current weapon now

	if ( my._weaponnumber != rbj)
	{
		ent_frame("weapuP", 100 );
	}
	else
	{
		if ( bulletnum[my._ammotype - 1] <= 0)
		{
			ent_frame("wearel", 0 );
		}
		else
		{
			ent_frame("wearel", 100 );
		}
	}

	if ( bulletnum[my._ammotype - 1] <= 0)
	{
		if ( totalbullets[my._ammotype - 1] > 0)
		{
			reload();
		}
	}


	carry = CarryWeapon;
	exclusive_global;


	/*if (PWeapons[lmg]!=0)
	{
		you = Entity_To_Pointer( PWeapons[lmg]);
		if (you)
		{
			you = LMGBulletes;
			you.invisible = abs((weapon_number ==7)-1);		
		}
	}*/


	WeaponGui();
	// handle firing
	while( weapon == me )
	{
		if((weapon_firing == 1) && (gun_loaded > 0) && (my._fire <= 0) && ( weapon_reloading == 0) )
		{
			FireGun();
		}

		if((weapon_firing == 0) && (gun_loaded == 0) && (my.__repeat == off))
		{
			gun_loaded = 1;
		}
		wait(1);
		if (eplhealth){	return;	}
	}
	return(weapon_number);
}
      

/* ****************************************************************  */

function CheckIfCanSelect(id)
{ 
if (weapon){
 if (weapon._fire != 0){ return(1);} 
 if (weapon_firing){ return(1);}
 if (camera.arc != 60){ return(1);}
}
if (weapon_number == id){return(1);}
if (PWeapons[id-1]==0){return(1);}
weapon_number = id;
return(0);
}

function GunSelect1   { if ( CheckIfCanSelect(1 ) ){return;}   SelectNewGun(); }
function GunSelect2   { if ( CheckIfCanSelect(2 ) ){return;}   SelectNewGun(); }
function GunSelect3   { if ( CheckIfCanSelect(3 ) ){return;}   SelectNewGun(); }
function GunSelect4   { if ( CheckIfCanSelect(4 ) ){return;}   SelectNewGun(); }
function GunSelect5   { if ( CheckIfCanSelect(5 ) ){return;}   SelectNewGun(); }
function GunSelect6   { if ( CheckIfCanSelect(6 ) ){return;}   SelectNewGun(); }
function GunSelect7   { if ( CheckIfCanSelect(7 ) ){return;}   SelectNewGun(); }
function GunSelect8   { if ( CheckIfCanSelect(8 ) ){return;}   SelectNewGun(); }
function GunSelect9   { if ( CheckIfCanSelect(9 ) ){return;}   SelectNewGun(); }
function GunSelect10  { if ( CheckIfCanSelect(10) ){return;}   SelectNewGun(); }
function GunSelect11  { if ( CheckIfCanSelect(11) ){return;}   SelectNewGun(); }
function GunSelect12  { if ( CheckIfCanSelect(12) ){return;}   SelectNewGun(); }
function GunSelect13  { if ( CheckIfCanSelect(13) ){return;}   SelectNewGun(); }
function GunSelect14  { if ( CheckIfCanSelect(14) ){return;}   SelectNewGun(); }
function GunSelect15  { if ( CheckIfCanSelect(15) ){return;}   SelectNewGun(); }
function GunSelect16  { if ( CheckIfCanSelect(16) ){return;}   SelectNewGun(); }
function GunSelect17  { if ( CheckIfCanSelect(17) ){return;}   SelectNewGun(); }
function GunSelect18  { if ( CheckIfCanSelect(18) ){return;}   SelectNewGun(); }

/* ****************************************************************  */

function SetInputOrDrop()
{
	var Wid=0;
	while (wid<WeaponK1N)
	{
		 if (WeaponK1[wid]==weapon_number)
		{
		 if (PFWeapons1==0)
		 {
		  PFWeapons1 = PAllWeapons[weapon_number-1];
		 }
		  goto Rep;
		}
	Wid+=1;
	}

	 Wid=0;
	while (wid<WeaponK2N)
	{
		 if (WeaponK2[wid]==weapon_number)
		{
		 if (PFWeapons2==0)
		 {
		  PFWeapons2 = PAllWeapons[weapon_number-1];
		 }
		  goto Rep;
		}
	Wid+=1;
	}

	 Wid=0;
	while (wid<WeaponK3N)
	{
		 if (WeaponK3[wid]==weapon_number)
		{
		 if (PFWeapons3==0)
		 {
		  PFWeapons3 = PAllWeapons[weapon_number-1];
		 }
		  goto Rep;
		}
	Wid+=1;
	}

	 Wid=0;
	while (wid<WeaponK4N)
	{
		 if (WeaponK4[wid]==weapon_number)
		{
		 if (PFWeapons4==0)
		 {
		  PFWeapons4 = PAllWeapons[weapon_number-1];
		 }
		  goto Rep;
		}
	Wid+=1;
	}
Rep :
}

function GunPick()
{   	
	  // amont of amunition given when pickingup the gun.

	bulletnum[int(my._ammotype)-1] += frc(my._ammotype)*100 ;
	bulletnum[my._weaponnumber-1]= min( maxbulletnum[my._weaponnumber-1], bulletnum[my._weaponnumber-1]);

	my._ammotype = int(my._ammotype);	// ammo type
	AmmoCheck();

	weapon_number = my._weaponnumber;

	      // setting the right weapon depending on the weapon number giving in the _weaponnumber
	
	PWeapons[ weapon_number-1] =  Entity_To_Pointer( me);
	OwnedWeapon[ weapon_number-1]   = 1;
	SetInputOrDrop();
	SelectNewGun();
}

/* ****************************************************************  */


action GunY
{
wait(1);
    
    
	my.skin = 2;
    
    weapon_number = int(my._weaponnumber);    
    my.__repeat  = checkifrepeatable()||(my._weaponnumber== lmg);
    
   
    my._weaponnumber = weapon_number;
    my.metal = 1;

    // the frams that the weapon will perform befour it's being picked up
    
    ent_frame("weapup" , 100);    
    
    my._ammotype    = Weap_ammo_type[weapon_number - 1];
    my._bulletspeed = Weap_bullet_speed[weapon_number - 1];    
    my._firetime    = Weap_fire_time[weapon_number -1];     
   
    if (weapon_number == lmg)
     { 
        create( <cbulllet.mdl>, my.pos, bltd);
	you = LMGBulletes; 
	you.invisible = on;
     } 

     // make sure we have a valid _weaponnumber 
    if ( (my._weaponnumber <= colt-1) || ( my._weaponnumber > SThrower+1) )
     { 
       my._weaponnumber = colt; 
     }  

    my._damage = Weap_damage[weapon_number -1];    

    my._bulletspeed = abs(my._bulletspeed);
    var Wid = 0;

    while (Wid<3)
    {
     if (weapon_number == WeaponSZoomAble[Wid])
     {
      my.zoomable = WeaponSZoomVal[Wid];
      break;
     }
     Wid+=1;
    }
    GunPick();

   // check whether this gun was picked up before in another level,
   // and has to be re-created for this level

        you = Pointer_To_Entity( PWeapons[my._weaponnumber-1]);

	if( ownedweapon[my._weaponnumber-1] == 1 && you == null)
	{ 
	PWeapons[my._weaponnumber-1] = Entity_To_Pointer( me); 
	gun_restore(); 
	return; }

}
/* ****************************************************************  */

function manual_reload()
{
       if (weapon == null){return;}

       me = weapon;

       /* 8,9,13 have no manual reload */

if( totalbullets[my._ammotype - 1 ] > 0 )
     {
	reload();		  
	}

}

/* ****************************************************************  */

function main_ammo()
{
	if (eplhealth){	return;	}
	if (weapon == null){return;}
	if (Kick_state == 1)||(Maine_state == 1)
	{
		return;
	}
	me =  weapon;
	var xx = 0;
	if (weapon._weaponnumber == ak47)
	{
		if (totalbullets[my._ammotype - 1] <= 0)
		{goto noemo1;
		}
		if   (weapon._ammotype != 19) {return;}
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[6]);
		AnimModelPart( SharedEntity, -50, BodyParts[PartIndex]);
		you = Pointer_To_Entity( player.WeaponAnerga);
		you.invisible =0;
		you.shadow = shadowenable;

		if (totalbullets[16] > 0)
		{
			
			while (xx < 50)
			{
				AnimModelPart( SharedEntity, -50, BodyParts[PartIndex]);
				ent_frame("weapup",xx);
				if (eplhealth){	return;	}
				wait(1);
				xx += 5;
			}
			morph (ak47_no_energa,weapon);
			play_sound(rbj_out,50);
			//wait(20);
			you = Pointer_To_Entity( player.WeaponMesh1);
			you.frame = 1;
			xx = 50;
			while (xx < 100)
			{
				AnimModelPart( SharedEntity, -50, BodyParts[PartIndex]);
				ent_frame("weapup",xx);
				if (eplhealth){	return;	}
				wait(1);
				xx += 5;
			}
		}
		else
		{
			morph (ak47_no_energa,weapon);
		}
		noemo1:
		me._ammotype    = int(Weap_ammo_type[1]) ;
		me._bulletspeed = Weap_bullet_speed[1];
		me._firetime    = Weap_fire_time[1] ;
		me._damage      = Weap_damage[1];
		me._firemode    = int(my._firemode);
		me._bulletspeed = abs(my._bulletspeed);
		WeaponGui();
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
		AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
		you = Pointer_To_Entity( player.WeaponAnerga);
		you.invisible =1;
		you.shadow = 0;
	}

	if (weapon._weaponnumber == m4)
	{
		if (totalbullets[my._ammotype - 1] <= 0)
		{goto noemo2;
		}
		if   (weapon._ammotype != 18) {return;}
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[8]);
		AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
		if (totalbullets[17] > 0)
		{
			while (xx < 50)
			{
				AnimModelPart( SharedEntity, 20, BodyParts[PartIndex]);
				ent_frame("weapup",xx);
				if (eplhealth){	return;	}
				wait(1);
				xx += 5;
			}
			play_sound(rbj_in,50);
			while (xx < 100)
			{
				AnimModelPart( SharedEntity, -20, BodyParts[PartIndex]);
				ent_frame("weapup",xx);
				if (eplhealth){	return;	}
				wait(1);
				xx += 5;
			}
		}
		noemo2:
		me._ammotype    = int(Weap_ammo_type[3]) ;
		me._bulletspeed = Weap_bullet_speed[3];
		me._firetime    = Weap_fire_time[3] ;
		me._damage      = Weap_damage[3];
		me._firemode    = int(my._firemode);
		me._bulletspeed = abs(my._bulletspeed);
		WeaponGui();
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
		AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
	}
}

/* ****************************************************************  */

function secondary_ammo()
{       

	var xx = 0;
	if (weapon == null) { return; }
	if (Kick_state == 1)||(Maine_state == 1)
	{
		return;
	}


	if (weapon._weaponnumber == ak47)
	{	me = weapon;
		if (totalbullets[18] <= 0)
		{ goto noemo3;
		}
		if   (weapon._ammotype == 19) {return;}
		//if (totalbullets[18] == 0){ mesg.string = "no energa ammo !"; /*show_message();*/return;    }	
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);	
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[6]);	
		
		while (xx < 50)
		{
			AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
			ent_frame("weapup",xx);
			if (eplhealth){	return;	}
			wait(1);
			xx += 5;
		}
		morph (ak47_energa,weapon);
		play_sound(rbj_in,50);
		you = Pointer_To_Entity( player.WeaponAnerga);
		you.invisible = 0;
		you.shadow = shadowenable;
		//wait(20);
		while (xx < 100)
		{
			AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
			ent_frame("weapup",xx);
			if (eplhealth){	return;	}
			wait(1);
			xx += 5;
		}
		you = Pointer_To_Entity( player.WeaponMesh1);
		you.frame = 2;
		you = Pointer_To_Entity( player.WeaponAnerga);
		you.invisible =1;
		you.shadow = 0;
		noemo3:
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[7]);
		AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
		me._ammotype    = int(Weap_ammo_type[18] );
		me._firetime    = Weap_fire_time[18] ;
		me._bulletspeed = Weap_bullet_speed[18];
		me._damage      = Weap_damage[18];
		me._bulletspeed = abs(my._bulletspeed);
		if (totalbullets[18] > 0)
		{bulletnum[me._ammotype - 1] = 1;
		}
		
		WeaponGui();

	}
	if (weapon._weaponnumber == m4)
	{
		me = weapon;
		if (totalbullets[17] <= 0)
		{ goto noemo4;
		}
		if   (weapon._ammotype == 18) {return;}
		//if (totalbullets[17] == 0){ mesg.string = " no m203 grenade !"; /*show_message();*/return;    }	
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[8]);
		
		while (xx < 50)
		{
			AnimModelPart( SharedEntity, 20, BodyParts[PartIndex]);
			ent_frame("weapup",xx);
			if (eplhealth){	return;	}
			wait(1);
			xx += 5;
		}
		play_sound(rbj_in,50);
		while (xx < 100)
		{
			AnimModelPart( SharedEntity, -20, BodyParts[PartIndex]);
			ent_frame("weapup",xx);
			if (eplhealth){	return;	}
			wait(1);
			xx += 5;
		}
		noemo4:
		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
		AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
		me._ammotype    = int(Weap_ammo_type[17] );
		me._firetime    = Weap_fire_time[17] ;
		me._bulletspeed = Weap_bullet_speed[17];
		me._damage      = Weap_damage[17];
		me._bulletspeed = abs(my._bulletspeed);
		if (totalbullets[18] > 0)
		{bulletnum[me._ammotype - 1] = 1;
		}
		WeaponGui();
	}
}


/* ****************************************************************  */

function ShotSecondaryAmmo()
{
	if (eplhealth){	return;	}

	if (weapon_firing == 1)
	{
		return;
	}

	me = weapon;
	if (me==0)
	{
		return;
	}
	if (my._fire)
	{
		return;
	}

	if (weapon_reloading)
	{
		return;
	}
	if ( my._weaponnumber == m4)
	{
		weapon_firing = 1;
		my._fire = 1;
		PazokaShot(player);
		my.frame = 4;
		wait(2);
		my.frame = 3;
		wait(8);
		weapon_firing = 0;
		my._fire = 0;
	}
}

function WeaponFire()
{
	var firekey = key_lastpressed;
	if (eplhealth){	return;	}
	if (Kick_state == 1)
	{
		KickAttac();
		return;
	}
	if (Maine_state == 1)
	{
		MainePlacing();
		return;
	}
	if (weapon_firing == 1)
	{
		return;
	}

	me = weapon;
	if (me==0)
	{
		return;
	}
	if (my._fire)
	{
		return;
	}

	if (weapon_reloading)
	{
		return;
	}

	if (my._fire==0)
	{
		my.FrameAnim = 0;
	}

	you = Pointer_To_Entity( player.WeaponMesh1);
	you.frame = 1;

	if (weapon._weaponnumber == 8)||(weapon._weaponnumber == 9)||(weapon._weaponnumber == 16)||(weapon._weaponnumber == 15)
	{
		my.FrameAnim = 100;
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[1]);
	}
	else
	{
		my.FrameAnim = 20;
		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],WeaponFrames[2]);
		
	}
	weapon_firing = 1;
	while (key_pressed(firekey))
	{
		if (Kick_Action == 0)
		{break;
		}
		if (eplhealth){	return;	}
		wait(1);
	}

	weapon_firing = 0;
	
	if (bulletnum[my._ammotype - 1] <= 0)
	{
		my._fire = 0;
	}
	if (weapon_reloading)
	{
		return;
	}
	if((my.__repeat)&&(my._ammotype != pumaction))
	{
		while ((my.FrameAnim >10)&&( weapon_firing == 0))
		{
			my.FrameAnim -= 10;
			ent_frame("weasho", my.FrameAnim );
			AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
			if (my._ammotype == lmg)
			{
			//               pos_for_vertex(my,LMGBulletes,551,552);
			}
			if (eplhealth){	return;}
			wait(1);
		}
		ent_frame("weapuP", 100 );
	}

}


/* ****************************************************************  */

function zoom()
{
   if (  eplhealth ){ return;}
   if (  weapon==0 ){ return;}
   if (  weapon_reloading ){ return;}
   if (  weapon.Zoomable)
    {
	AutoZoom(weapon.Zoomable);
   }
  else  
   { return; }
}


/* ****************************************************************  */

function ChangeBFastSlow()
{
    if (weapon == null){return;}
    if ( checkifrepeatable() )
    {
	weapon.__repeat =  abs(1-weapon.__repeat) ;
    }
}


		
		
//		SetActivePart( SharedEntity, BodyParts[PartIndex],0);
//		SetActivePart( SharedEntity, BodyParts[PartIndex],1);
//		SetActiveSeq( SharedEntity,  BodyParts[PartIndex],"radyshot");
//		AnimModelPart( SharedEntity, 50, BodyParts[PartIndex]);
