////////////////////////////////////////////////////////////////////////////////////
/*
	i edit the folowing files:
		1: tplayer -->  2 entry
		2: variabls --> 1 entry
		3: defination --> 1entry

	m.h.safa
*/
////////////////////////////////////////////////////////////////////////////////////
path <..\\data>;

entity blackface
{
	type = <darks.tga>;
	view = camera;
	layer = 100;
	flags = visible;
	scale_x = 0.1;
	scale_y = 0.1;
	x = 10;
	y = 0;
	z = 0;
	alpha = 0;
}

entity helpKeys
{
	type = <keys.tga>;
	view = camera;
	//flags = visible;
	scale_x = 0.1;
	scale_y = 0.1;
	x = 60;
	y = 0;
	z = 0;
}
entity PreesEnter
{
	type = <pressmsg.tga>;
	view = camera;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = -20;
	layer =5;
}
entity splashscreen
{
	type = <Lev1Load.bmp>;
	view = camera;
	flags = visible;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = 0;
	layer =4;
}

entity* goldi_pointer ;
function GoldiHit();
path <music>;
path <sounds>;
path <weapons>;
include <definations.wdl>;
include <variabls.wdl>;
include <Mathe.wdl>;
include <Links.wdl>;
include <sounds.wdl>;
include <gui.wdl>;
include <SaveGui.wdl>;
include <MainGui.wdl>;
include <grande.wdl>;
include <pazoka.wdl>;
include <flashes.wdl>;
include <Ammo.wdl>;
include <WeaponFx.wdl>;
include <bullet.wdl>;
include <weapon.wdl>;
include <inpot.wdl>;
include <cars.wdl>;
include <Compars.wdl>;
include <tplayer.wdl>;
include <initiazation.wdl>;
include <equipments.wdl>;

include <SolderFx.wdl>;
include <SolderActS.wdl>;
//include <Solders.wdl>;
include <SolderLeader.wdl>;

var video_mode = 7;
var video_depth = 16;

string level_str = <level1.wmb>; // give file names in angular brackets

function main()
{
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;

	play_sound(sStartSound,100);
	StartSoundH = result;
	VWeaponSprite1.visible = 0;
	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
	initilization();
	
//	wait(10);
//  	splashscreen.visible = off;
	//entity_purge(splashscreen);
//	wait(10);
//	SaveAll(13,0);
	
	
	
	MyMainFunc();
	
	
}

function SetViewBright(CMBr)
{
		camera.ambient = CMBr-100;
		blackface.alpha = abs(min(0, camera.ambient)/3);

}

function NewlevelOrloaded()
{
	stop_sound(h_VictoryPlayer);
	stop_sound(h_PlDed);
}


var GlobalCounter = 0;
var GlobalSwitch = 1;
define __TimerToCreate = 200;

//@ this function responsible for creating the compars during the lifetime of the game.
function MyMainFunc()
{	
	while (player == null)
	{
		wait(1);
	}
	
	GlobalRandom = int(random(3));
	wait(80);
	if (level.y == 3)
	{
		MovieOrSucess = 1;
	}

	me = player;
	while (1)
	{	if (camra2player == 0)
		{
			break;
		}
		
		GlobalCounter += 1;

		if (GlobalCounter > __TimerToCreate)
		{
			GlobalCounter = 0;
			GlobalSwitch = -GlobalSwitch;
			
			if (GlobalSwitch == 1)
			{
				create_moving_compars_In_A();
			}
			else
			{
				create_moving_compars_In_B();
			
			}

		}
		wait(1);
	}
}

/////////////////////////////////////////////////////////////////////////
//								       //
//				comom functions			       //
//								       //
/////////////////////////////////////////////////////////////////////////

function CameraCarier()
{
	my.passable = 1;
	my.visible = 0;
	ent_path("CameraPath");
	ent_waypoint(my._target_x,1);
	my.flag1 = 0;
	my.flag2 = 0;
	while (1)
	{		
		temp.x= my._target_x - my.x;
		temp.y= my._target_y - my.y;
		temp.z= my._target_z - my.z;
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,1.5);
		
		temp.x = 0;
		temp.y = 0;
		temp.z = 60;
		vec_rotate(temp,my.pan);
		vec_add(temp,my.pos);
		vec_set(camera.pos,temp);
		camera.pan = my.pan;
		
		if (my.flag1)
		{
			
			camera.tilt += speed/50;
			if (camera.tilt > 20)
			{
				my.flag1 = 0;
			}
		}
		
		if (my.flag2)
		{
			camera.tilt -= speed/200;
			if (camera.tilt < 0)
			{
				my.flag2 = 0;
				camera.tilt = 0;
			}

		}
		temp.x = speed/200;
		temp.y = 0;
		temp.z = 0;
		move(my ,temp ,nullvector);

		if (vec_dist(my.x ,my._target_x ) < 60)
		{			 
			my.skill20 = ent_nextpoint(my._target_x);			
			if (my.skill20 == 2)
			{
				my.flag1 = 1;
			}
			if (my.skill20 == 3)
			{
				my.flag2 = 1;
			}
			
		}

		wait(1);
	}	
}

function Doflashing()
{
	BlackScreen.visible = 1;
}

function VictoryCamera()
{
	MovieOrSucess = 1;
	outcompass.visible = 0;
	EnemyPos.visible = 0;
	Compass.visible = 0;
	HldBk.visible = 0;
	HldSld.visible = 0;
	VWeaponSprite1.visible = 0;
	CPointer.visible = 0;
	looprun=0;
	mesges.visible = 0;
	CloseSong(CurrentSong);			
	camra2player = 0;

	temp.x = player.x;
	temp.y = player.y;
	temp.z = player.z;

	create(<point1.mdl>,temp,CameraCarier);
	you.pan = 260;
	camera.pan = 260;
	camera.tilt = 0;
	CloseSong(CurrentSong);
	RemoveAllKeys();
	on_enter = finalization;
	PreesNextLvl.visible = 1;
	Fade2black( 1, 0.5, Function_To_Pointer( "Doflashing"));
}

/* ---------------------------------------------------------------------------------------------- */    

function random_skin2()
{
	var rn;
	rn = int(random(7));
	if (rn == 0) { my.skin = 9; return;}
	if (rn == 1) { my.skin = 10; return;}
	if (rn == 2) { my.skin = 11; return;}
	if (rn == 3) { my.skin = 12; return;}
	if (rn == 4) { my.skin = 14; return;}
	if (rn == 5) { my.skin = 15; return;}
	if (rn == 6) { my.skin = 16; return;}
	if (rn == 7) { my.skin = 17; return;}
	
}

/* ---------------------------------------------------------------------------------------------- */    

function random_skin()
{
	var random_number;
	random_number = int(random(7));

	if (random_number == 0) { my.skin = 1; return;}
	if (random_number == 1) { my.skin = 2; return;}
	if (random_number == 2) { my.skin = 3; return;}
	if (random_number == 3) { my.skin = 4; return;}
	if (random_number == 4) { my.skin = 5; return;}
	if (random_number == 5) { my.skin = 6; return;}
	if (random_number == 6) { my.skin = 7; return;}
	if (random_number == 7) { my.skin = 8; return;}
	
}

/* ---------------------------------------------------------------------------------------------- */    

function random_compars()
{
	var rn;
	rn = int(random(3));

	if (rn.x == 0)  
	{
		morph(compars4,me);  // <Shakh.mdl>;
		return;
	}                                    
	if (rn.x == 1)  
	{
		morph(compars2,me);    // <child.mdl>;
		my.scale_x=1.3;  
		my.scale_y=1.3; 
		my.scale_z=1.3; 
		return;
	}          
	if (rn.x == 2) 
	{ 
		morph(compars3,me);  // <Flah.mdl>;
		return;
	}                  	
	if (rn.x == 3)                                 
	{
		morph(compars1,me);    // <f_man.mdl>;
		return;
	}      	              	        
}

/* ---------------------------------------------------------------------------------------------- */    

function Place_actor_on_ground()
{
       //exclusive_entity;
       sonar(my,500);
       my.z = target.z + abs(my.min_z);
       return;
}

/* ---------------------------------------------------------------------------------------------- */    

function smoothto(srcframe,dstframe,crntfrm,prcnt)
{
	ent_frame(srcframe, crntfrm);
	ent_blend(dstframe , 100-crntfrm, prcnt);
}

/* ---------------------------------------------------------------------------------------------- */    

function Test_Player_Vision()
{
	//my.skill41 Can_Player_See_Me ???  1=Yes   0=No
	while (player == null)
	{
	wait(1);
	}

	var Vision_angle;
	temp.x = player.x - my.x;
	temp.y = player.y - my.y;
	temp.z = player.z - my.z;      
	vec_to_angle(my_angle,temp);
	Vision_angle = ang(my_angle.pan - player.pan) ;
 
	if (   ((Vision_angle > 147) && (Vision_angle < 180))  ||  ((Vision_angle < -147) && (Vision_angle > -180))    )
	{		
		my.skill41 = 1;  // he can see me
		my.skill42 +=1;
	}
	else
	{
		my.skill41 = 0;  // he can't
	}                          
}

/* ---------------------------------------------------------------------------------------------- */    

function Test_Vision()
{
	while (player == null)
	{
	wait(1);
	}
	you = Pointer_To_entity(Cube);
	temp.x = player.x - you.x;
        temp.y = player.y - you.y;
        temp.z = player.z - you.z;      
        vec_to_angle(my_angle,temp);

        you.skill1 = ang(my_angle.pan - player.pan) ;
      
       //+-147
       //@ to increes(+) the range decres(-) the 120 and (vers vas)
	if (   ((you.skill1 > 115) && (you.skill1 < 180))  ||  ((you.skill1 < -115) && (you.skill1 > -180))    )
        {		
		PlayerCanSeeMe = 1;  // he can see me	  
        }
        else
        {		
		PlayerCanSeeMe = 0;  // he can't 	  
        }                          
}

/* ---------------------------------------------------------------------------------------------- */    

function Play_My_Sounds(S_number,r_num)
{		
	stop_sound(SoundIsPlaying);
	stop_sound(SoundHandel);

	if (camra2player == 0)|| (PlayerIsDead)
	{
		return;
	}

	if (S_number == 1)
	{					
		showmessage(5,133);
		play_sound(S_M_L_02,100);
		SoundIsPlaying = result;
		while (snd_playing(SoundIsPlaying))
		{
			wait(1);
		}
		showmessage(5,132);
		play_sound(S_M_L_01,100);
		SoundIsPlaying = result;
		return;
	}
	
	if (S_number == 3)
	{				
		play_sound(S_M_L_03,100); 
		SoundIsPlaying = result; 		
		return;
	}
	
	if (S_number == 4)
	{				
		play_sound(S_M_L_10,100); 
		SoundIsPlaying = result; 		
		return;
	}
	
	if (S_number == 5)
	{			 		 		 
		 if (r_num == 0) 
		 { 
			play_sound(S_M_L_16,100); 
			SoundIsPlaying = result; 
			return;
		 }
		 
		 if (r_num == 1) 
		 { 
			play_sound(S_M_L_09,100); 
			SoundIsPlaying = result; 
			return;
		 }
		 
		 if (r_num == 2) 
		 { 
			play_sound(S_M_L_08,100); 
			SoundIsPlaying = result; 
			return;
		 }
		 
		 if (r_num == 3) 
		 { 
			play_sound(S_M_L_15,100); 
			SoundIsPlaying = result; 
			return;
		 }		 
	}

	if (S_number == 6)
	{				
		play_sound(S_M_L_04,100); 
		SoundIsPlaying = result; 		
		return;
	}

	if (S_number == 7)
	{				
		if (r_num == 1) 
		{ 
			play_sound(S_M_L_07,100); 
			SoundIsPlaying = result; 
		}
		else
		{ 
			play_sound(S_M_L_11,100); 
			SoundIsPlaying = result; 
		}
		return;
	}
}



/////////////////////////////////////////////////////////////////////////
//								       //
//		Goldi Functions					       //	
//								       //
/////////////////////////////////////////////////////////////////////////

sound hitright, <hitright.wav>;
sound hitleft, <hitleft.wav>;

var x2;
var goldi_angle[3];
var GoldiIsReloading = 0;

var DefultAm = 0;
var temp5[3];

function GoldiLight()
{
	my.passable = on;
	my.invisible = on;
	//my.light = on;
	my.lightrange = 80;

	my.scale_x = 0.05;
	my.scale_y = 0.05;
	my.scale_z = 0.05;
	DefultAm = goldi_pointer.ambient;
	
	my.pan = goldi_pointer.pan;
	while (IsGoldiDead == 0)
	{				
		while (GoldiIsReloading == 1)
		{
			my.red =0;
			my.green= 0;
			my.blue =0;
			goldi_pointer.ambient = DefultAm;
			wait(1);
		}
		
		goldi_pointer.ambient = -10;						
		
		vec_for_vertex(temp,goldi_pointer,577);
		vec_to_angle(my_angle,temp);
		//my.pan = my_angle.pan;
		vec_set(my.pos,temp);
		
		
		temp.x = 50;
		temp.y=0;
		temp.z=0;
		vec_rotate(temp,my.pan);
				
		vec_add(my.pos,temp);
		
		
		
		if (my.flag5 == 0)		
		{			
			my.red = 200;
			my.green = 180;
			my.blue = 60;									
			my.flag5 = 1;
		}
		else
		{
			my.red =0;
			my.green= 0;
			my.blue =0;
			my.flag5 = 0;
		}			
		
		wait(1.5);
	}
}

/* ------------------------------------------------------------------------ */  

function GoldyShot
{
	trace_mode = ignore_me + ignore_passable + ignore_sprites;

	vec_for_vertex(temp,me,577);
	temp.x = temp.x - my.x; 
	temp.y = temp.y - my.y; 
	temp.z = 0;
	vec_to_angle( my_angle, temp);
	my_angle.x+=2.5-random(5);
	my_angle.y+=2.5-random(5);

	temp.x = 10000;
	temp.y = 0;
	temp.z = 0;
	vec_rotate( temp, my_angle);
	vec_add( temp, my.pos);

	vec_for_vertex( my_angle,me,577);

	result = trace( my_angle, temp);
	if (result)
	{
		vec_set ( p2, target);
	}
	else
	{
		vec_set ( p2, temp);
	}
	if(you == null)
	{
		create( <black_hole.tga>, target, WallEfShot); 		   
	}

	vec_for_vertex ( p, my, 577);
	vec_set( FirstPoint, P);
	vec_set( SecondPoint, P2);

	Blt_Line();
}

/* ------------------------------------------------------------------------ */   

function goldi_gun_flash()
{								
	GoldyShot();
	if (random(10)>5)
	{return;}
	vec_for_vertex(temp,me,577);	
	Short_GunFlash( me, 577, 570);
	one_ok = -one_ok;

	rn +=1;
	if (rn == 2)
	{
		rn = 0;
		play_entsound(goldi_pointer,GoldiUzi,GoldiFireSoud);		
	}	
}

/* ------------------------------------------------------------------------ */    

function GoldiDied()
{	
	IsGoldiDead = 1;
	exclusive_entity;	
	my.event = null;
	
	if (int(random(1)) == 1 )
	{
		//showmessage(10,135);
		showmessage(10,138);
		Play_My_Sounds(7,1);
	}
	else
	{
		//showmessage(10,139);
		showmessage(10,142);
		Play_My_Sounds(7,2);
	}
	
	
	my.skill40 =0;	
	while (my.skill40 < 100)
	{
		ent_frame("diehead",my.skill40);
		my.skill40 += speed/50;
		wait(1);
	}
	
	
	//Fade2black( 1, 1, Function_To_Pointer( "finalization"));
	VictoryScream();
	VictoryCamera();
	//play_loop(VictoryPlayer, 100);
	play_loop VictoryPlayer, 100;
	h_VictoryPlayer  = result ;
}

/* ------------------------------------------------------------------------ */    

function goldi_found_person();
function GoldiHit(iHand)
{	
	my.event = null;
	 
	// right hand
	var d =0;	
	if (iHand == 1)
	{				
		play_sound(hitright,100);
		my._health -= 40;
		d =68;		
		while (d< 100)
		{
			if (my._health <= 0) 
			{ 				
				break;
			}	
			ent_frame("hit",d);
			d += speed/150;
			wait(1);
		}		
		my.event = goldi_found_person;
		return;
	}

	// left hand
	if (iHand == 2)
	{
		play_sound(hitleft,100);
		my._health -= 40;
		d = 32;
		while (d< 55)
		{
			if (my._health <= 0) 
			{ 				
				break;
			}	
			ent_frame("hit",d);
			d += speed/150;
			wait(1);
		}
		my.event = goldi_found_person;
		return;
	}							
}

/* ------------------------------------------------------------------------ */    

function goldi_found_person()
{
	var test_ang;
	var dd;
	 
	if ( (event_type == event_detect) && ( indicator == 1 ))
	{						
		my.event = 0; 
		my.enemyid = Entity_To_Pointer(you);	
		while(1)	
		{	
			Blt_Line();
			my.skill37 +=1;
			if (my.skill37 > 200)
			{
				break; 
			}
			you =Pointer_To_Entity(my.enemyid);
			if (you == null)
			{
				break; 
			}

			/* calculating the persantige between 
				you.pan and goldi fire frames   */
			temp.x = you.x - my.x;
			temp.y = you.y - my.y;
			temp.z = you.z - my.z;
			vec_to_angle( my_angle, temp);
	   	     									
			temp.x =  ang(my_angle.pan - my.pan);
			if (abs(temp.x)<=	90)  
			{
				temp.x += 90;
				temp.x  = 100- (temp.x * 100 / 180) - 8;   /* -8 becuse the frames r nor right 40% is the middle */
			        if ( my.skill10 < temp.x)
			        { 
  					my.skill10 += min( temp.x - my.skill10, 8);
				}
			        else
				{
					if ( my.skill10 > temp.x)
					{ 
						my.skill10 += max( temp.x - my.skill10, -8); 
					}
					else
					{ 
						break; 
					}	      
				}
                   
			
				ent_frame( "Shoot_C" ,  my.skill10);
				goldi_gun_flash();

				if (you._type == _type_player) 
				{ 																			
					HeartPlayer(40);
					temp.x = my.x - player.x;
					temp.y = my.y - player.y;
					temp.z = 0;
					vec_to_angle( my_angle, temp);
					ShowEnemyPos(ang(my_angle.pan));										
				}
				else
				{ 
					you._health = -25;
					/*
					if (you._health <0)
					{
						my.enemyid = 0;
					}
					*/
				}
		 	       
			        if ( abs(my.skill10 - temp.x) < 1 )
				{ 
					break; 
				}
			}		     
			else
			{ 				
				break;	
			}
	    	     
			wait(1);
		 }    
       		    
	my.event = goldi_found_person; 
	}
}

/* ------------------------------------------------------------------------ */    


function goldimessages()
{
	while (1)
	{
		if (GoldiGotYou == 1)
		{			
			//showmessage(10,131);					
			showmessage(10,134);					
			Play_My_Sounds(3,0);
			wait(60);
		}
		if (PlayerIsDead == 1)
		{
			break;
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */

function goldi_scan_for_persons()
{
var test_ang;
var dd;	
my.skill11 = 1;
while (1)
{           	
	while (1)
        {Blt_Line();
		if (my._health <= 0) && (PlayerIsDead == 0)
		{ 
			GoldiDied();
			break;
		}	 
		
		if (my.event)
                {	              
			
			temp.pan = 200;
			temp.tilt = 90;
			temp.z = 250;
			indicator = 1 ;
  			if (PlayerIsDead == 0)
  			{
				scan(my.pos, goldi_angle.pan, temp);	              	              
  			}

			my.skill10 += my.skill11;                              
		      		      		    		      		      		      		    
				/* hurt the player from a distant */
	                trace_mode = ignore_me + ignore_passable + ignore_passents;
			trace(my.pos ,player.pos );		      		      		     		      		   
 
			
			if(you != null)
			{
				if  (you._type == _type_player) //&& ( vec_dist(my.pos ,player.pos ) > 300 )  )
				{					                           			   					
					temp.x = target.x - my.x;
					temp.y = target.y - my.y;
					temp.z = target.z - my.z;
			   
					vec_to_angle( my_angle, temp);                           
					test_ang = my_angle.pan;
					if (ang(my_angle.pan) < 0)
					{ 
						test_ang = 360 - abs(ang(my_angle.pan)) ;			      
					}
			    
					dd =  (test_ang - 90)/1.8 ;
					dd = abs(100 - dd) - 15;             // - 15 because the frames R right 40% is the middle                                                   

					if ( (my.skill10 < (dd + 1) )  &&  (my.skill10 > (dd - 1) ) ) 
					{			      						
						while (1)
						{
							trace_mode = ignore_me + ignore_passable + ignore_passents;
							trace(my.pos ,player.pos );
							if (you == null)
							{								
								break;
							}														

							if ( (you._type == _type_player) && (vec_dist(my.pos ,player.pos ) > 250 ) )
		  					{																					
								HeartPlayer(3);
								temp.x = my.x - player.x;
								temp.y = my.y - player.y;
								temp.z = 0;
								vec_to_angle( my_angle, temp);
								ShowEnemyPos(ang(my_angle.pan));
								goldi_gun_flash();								
								GoldiGotYou = 1;
							}
							else
							{
								break;
							}

						wait(1);
						}
						GoldiGotYou = 0;
					}				
				}	  		      
			}

			 /* Shift the movement from right to left */  	              
			GoldiIsReloading = 1;
			if ( my.skill10 > 100 )
	                {
				my.skill11 = -1;
			        my.skill10 = 100;			  
	                }
			else
			{
				if ( my.skill10 < 0 )
		                {
					my.skill11 = 1;
					my.skill10 = 0;
				}
			}
                         
			 /* time before reloading */
			my.skill37 += 1;			 
			if (my.skill37 > 200)
			{ 
				my.skill37 = 0; 
				break; 
			}

  			ent_frame( "Shoot_C" ,  my.skill10);
			GoldiIsReloading = 0;
			goldi_gun_flash();
                }	 	  
	        wait(1);
	}// the second while
  	  
        if (my._health <= 0) && (PlayerIsDead == 0)
        {
		GoldiDied();
		break;
        }
	     
	/* moving the shoot frames to the reload frames 
  		    then berform the reload frames */
           
	if ( my.skill10 >0 )
	{
		my.skill11 = -1; 
	}
	else
	{
		if ( my.skill10 < 0 ) {my.skill11 = 1; }
	}
        
	my.skill11 *= 5;	
  	while ( abs(my.skill10-20) > 6 )
	{	      
  		my.skill10 += my.skill11;	      	       	                       		
		if (my.skill10 < 0){ break; }
	        ent_frame( "Shoot_C" ,  my.skill10);
	        wait(1);
	}         	     	  
        my.skill11 /= 5;

	my.skill12 = 0;
	Goldi_Changing = 1;
	while ( my.skill12 <100)
  	{	      
  		if (my._health <= 0) && (PlayerIsDead == 0)
		{ 
			GoldiDied();
			break;
		}
		my.skill12 += 1;
		ent_frame( "reload" ,  my.skill12);
		wait(1);
	}
	Goldi_Changing = 0;
	wait (1);
} // the firest while
}

/* ------------------------------------------------------------------------ */    

function GoldiScreeming()
{	
	while (PlayerIsDead == 0)
	{
		// GoldiScreemSound definded in the variables 
		// and controled in tplyer
		play_entsound(my,GoldiScreem,GoldiScreemSound);
		wait(100);
	}
	
}


/* ------------------------------------------------------------------------ */    


action goldi
{    				
	my.enable_scan = on;
	//my.enable_shoot = on;
	my.enable_detect = on;

	my._health = 100;		
	goldi_angle.pan  = my.pan ;
	goldi_angle.tilt = my.tilt;
	goldi_angle.roll = my.roll;

	goldi_pointer = my;   	      
	wait(50);
	my.event = goldi_found_person;
	goldi_scan_for_persons();  
	GoldiScreeming();
	goldimessages();	
	scan_player_postion();

	vec_for_vertex(temp,me,577);
	create(<point1.mdl>,temp,GoldiLight);
	
}


/////////////////////////////////////////////////////////////////////////
//
//			  Compars Functions   
//
/////////////////////////////////////////////////////////////////////////
sound BelalHide1 , <com101.wav>;
sound BelalHide2 , <com102.wav>;
sound BelalHide3 , <com103.wav>;
sound BelalHide4 , <com104.wav>;

sound JawadHide1 , <com201.wav>;
sound JawadHide2 , <com202.wav>;
sound JawadHide3 , <com203.wav>;
sound JawadHide4 , <com204.wav>;

sound SabahHide1 , <com301.wav>;
sound SabahHide2 , <com302.wav>;
sound SabahHide3 , <com303.wav>;
sound SabahHide4 , <com304.wav>;

sound EmadHide1 , <com401.wav>;
sound EmadHide2 , <com402.wav>;
sound EmadHide3 , <com403.wav>;
sound EmadHide4 , <com404.wav>;

sound HaniHide1 , <comp501.wav>;
sound HaniHide2 , <comp502.wav>;
sound HaniHide3 , <comp503.wav>;
sound HaniHide4 , <comp504.wav>;

sound LuaiHide1 , <comp601.wav>;
sound LuaiHide2 , <comp602.wav>;
sound LuaiHide3 , <comp603.wav>;
sound LuaiHide4 , <comp604.wav>;


function HideingComSound(rn)
{
	if (camra2player == 0)
	{
		return;
	}
	if (my.skill21 == 1) //belal
	{
		if (rn == 0)
		{
			play_entsound(my,BelalHide1,ComparsSpitchV);
			return;
		}
		if (rn == 1)
		{
			play_entsound(my,BelalHide2,ComparsSpitchV);
			return;
		}
		if (rn == 2)
		{
			play_entsound(my,BelalHide3,ComparsSpitchV);
			return;
		}
		if (rn == 3)
		{
			play_entsound(my,BelalHide4,ComparsSpitchV);
			return;
		}

	}
	
	if (my.skill21 == 2) // jawad
	{
		if (rn == 0)
		{
			play_entsound(my,JawadHide1,ComparsSpitchV);
			return;
		}
		if (rn == 1)
		{
			play_entsound(my,JawadHide2,ComparsSpitchV);
			return;
		}
		if (rn == 2)
		{
			play_entsound(my,JawadHide3,ComparsSpitchV);
			return;
		}
		if (rn == 3)
		{
			play_entsound(my,JawadHide4,ComparsSpitchV);
			return;
		}
	}
	
	if (my.skill21 == 3) //sabah
	{
		if (rn == 0)
		{
			play_entsound(my,SabahHide1,ComparsSpitchV);
			return;
		}
		if (rn == 1)
		{
			play_entsound(my,SabahHide2,ComparsSpitchV);
			return;
		}
		if (rn == 2)
		{
			play_entsound(my,SabahHide3,ComparsSpitchV);
			return;
		}
		if (rn == 3)
		{
			play_entsound(my,SabahHide4,ComparsSpitchV);
			return;
		}
	}
	
	if (my.skill21 == 4)//emad
	{
		if (rn == 0)
		{
			play_entsound(my,EmadHide1,ComparsSpitchV);
			return;
		}
		if (rn == 1)
		{
			play_entsound(my,EmadHide2,ComparsSpitchV);
			return;
		}
		if (rn == 2)
		{
			play_entsound(my,EmadHide3,ComparsSpitchV);
			return;
		}
		if (rn == 3)
		{
			play_entsound(my,EmadHide4,ComparsSpitchV);
			return;
		}
	}
	
	if (my.skill21 == 5) // hani
	{
		if (rn == 0)
		{
			play_entsound(my,HaniHide1,ComparsSpitchV);
			return;
		}
		if (rn == 1)
		{
			play_entsound(my,HaniHide2,ComparsSpitchV);
			return;
		}
		if (rn == 2)
		{
			play_entsound(my,HaniHide3,ComparsSpitchV);
			return;
		}
		if (rn == 3)
		{
			play_entsound(my,HaniHide4,ComparsSpitchV);
			return;
		}
	}
	
	if (my.skill21 == 6)// luai
	{
		if (rn == 0)
		{
			play_entsound(my,LuaiHide1,ComparsSpitchV);
			return;
		}
		if (rn == 1)
		{
			play_entsound(my,LuaiHide2,ComparsSpitchV);
			return;
		}
		if (rn == 2)
		{
			play_entsound(my,LuaiHide3,ComparsSpitchV);
			return;
		}
		if (rn == 3)
		{
			play_entsound(my,LuaiHide4,ComparsSpitchV);
			return;
		}
	}
	
}
/* ---------------------------------------------------------------------------------------------- */   

sound BilalWatch1 , <com108.wav>;
sound BilalWatch2 , <com109.wav>;

sound JawadWatch1 , <com208.wav>;
sound JawadWatch2 , <com209.wav>;

sound SabahWatch1 , <com308.wav>;
sound SabahWatch2 , <com309.wav>;

sound EmadWatch1 , <com408.wav>;
sound EmadWatch2 , <com409.wav>;

sound HaniWatch1 , <comp508.wav>;
sound HaniWatch2 , <comp509.wav>;

sound LuaiWatch1 , <comp608.wav>;
sound LuaiWatch2 , <comp609.wav>;

function WatchComSound(rn)
{
	//play_entsound(my,BilalWatch1,ComparsSpitchV);
	
//	return;

	if (camra2player == 0)
	{
		return;
	}
	if (my.skill21 == 1)
	{
		
		if (rn == 1)
		{
			play_entsound(my,BilalWatch1,ComparsSpitchV);
		}
		else
		{
			play_entsound(my,BilalWatch2,ComparsSpitchV);
		}
		return;
	}
	
	if (my.skill21 == 2)
	{
		if (rn == 1)
		{
			play_entsound(my,JawadWatch1,ComparsSpitchV);
		}
		else
		{
			play_entsound(my,JawadWatch2,ComparsSpitchV);
		}
		return;
	}
	
	if (my.skill21 == 3)
	{
		
		if (rn == 1)
		{
			play_entsound(my,SabahWatch1,ComparsSpitchV);
		}
		else
		{
			play_entsound(my,SabahWatch2,ComparsSpitchV);
		}
		return;
	}
	
	if (my.skill21 == 4)
	{
		if (rn == 1)
		{
			play_entsound(my,EmadWatch1,ComparsSpitchV);
		}
		else
		{
			play_entsound(my,EmadWatch2,ComparsSpitchV);
		}
		return;
	}
	
	if (my.skill21 == 5)
	{
		if (rn == 1)
		{
			play_entsound(my,HaniWatch1,ComparsSpitchV);
		}
		else
		{
			play_entsound(my,HaniWatch2,ComparsSpitchV);
		}
		return;
	}
	
	if (my.skill21 == 6)
	{
		if (rn == 1)
		{
			play_entsound(my,LuaiWatch1,ComparsSpitchV);
		}
		else
		{
			play_entsound(my,LuaiWatch2,ComparsSpitchV);
		}
		return;
	}
	
}


/* ---------------------------------------------------------------------------------------------- */   
sound BelalCrazy1 , <com105.wav>;
sound BelalCrazy2 , <com106.wav>;

sound JawadCrazy1 , <com205.wav>;
sound JawadCrazy2 , <com206.wav>;

sound SabahCrazy1 , <com305.wav>;
sound SabahCrazy2 , <com306.wav>;

sound EmadCrazy1 , <com405.wav>;
sound EmadCrazy2 , <com406.wav>;

//sound HaniCrazy1 , <.wav>;
sound HaniCrazy2 , <comp506.wav>;

sound LuaiCrazy1 , <comp605.wav>;
sound LuaiCrazy2 , <comp606.wav>;

define __CrazyBoySou = 200;
define __CrazysoundInterval = 100;
function CrazyComSound(rn)
{	
	return;


	my.skill23 = random(100);
	if (my.skill21 == 1) // belal
	{
		while (1)
		{
			my.skill22 += 1;
			if (my.skill22 > my.skill23)
			{
				my.skill22 = 0;
				my.skill23 = __CrazysoundInterval + int(random(50));
				if (int(random(2)) == 1)
				{
					play_entsound(my,BelalCrazy1,__CrazyBoySou);
				}
				else
				{
					play_entsound(my,BelalCrazy2,__CrazyBoySou);
				}
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}																		
	}
	
	if (my.skill21 == 2) // jawad
	{				
		while (1)
		{
			my.skill22 += 1;
			if (my.skill22 > my.skill23)
			{
				my.skill22 = 0;
				my.skill23 = __CrazysoundInterval + int(random(50));
				if (int(random(2)) == 1)
				{
					play_entsound(my,JawadCrazy1,__CrazyBoySou);
				}
				else
				{
					play_entsound(my,JawadCrazy2,__CrazyBoySou);
				}
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}																		
		
	}
	
	if (my.skill21 == 3)// sabah
	{		
		while (1)
		{
			my.skill22 += 1;
			if (my.skill22 > my.skill23)
			{
				my.skill22 = 0;
				my.skill23 = __CrazysoundInterval + int(random(50));
				if (int(random(2)) == 1)
				{
					play_entsound(my,SabahCrazy1,__CrazyBoySou);
				}
				else
				{
					play_entsound(my,SabahCrazy2,__CrazyBoySou);
				}
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}
	}

	if (my.skill21 == 4)// emad
	{		
		while (1)
		{
			my.skill22 += 1;
			if (my.skill22 > my.skill23)
			{
				my.skill22 = 0;
				my.skill23 = __CrazysoundInterval + int(random(50));
				if (int(random(2)) == 1)
				{
					play_entsound(my,EmadCrazy1,__CrazyBoySou);
				}
				else
				{
					play_entsound(my,EmadCrazy2,__CrazyBoySou);
				}
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}																
		
	}	
	
	if (my.skill21 == 5)// hani
	{
		while (1)
		{
			my.skill22 += 1;
			
			if (my.skill22 > my.skill23)
			{
				my.skill22 = 0;	
				my.skill23 = __CrazysoundInterval + int(random(50));
				play_entsound(my,HaniCrazy2,__CrazyBoySou);
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}
	
	}	
	
	if (my.skill21 == 6)// luai
	{
		while (1)
		{
			my.skill22 += 1;
			if (my.skill22 > my.skill23)
			{
				my.skill22 = 0;
				my.skill23 = __CrazysoundInterval + int(random(50));
				if (int(random(2)) == 1)
				{
					play_entsound(my,LuaiCrazy1,__CrazyBoySou);
				}
				else
				{
					play_entsound(my,LuaiCrazy2,__CrazyBoySou);
				}
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}		
												
	}	


}

/* ---------------------------------------------------------------------------------------------- */   

sound BelalInPain1 , <com1pain01.wav>;
//sound BelalInPain2 , <.wav>;

sound JawadInPain1 , <com2pain01.wav>;
sound JawadInPain2 , <com2pain02.wav>;

sound SabahInPain1 , <com3pain01.wav>;
//sound SabahInPain2 , <.wav>;

sound EmadInPain1 , <com4pain01.wav>;
//sound EmadInPain2 , <.wav>;

sound HaniInPain1 , <comp5pain01.wav>;
sound HaniInPain2 , <comp5pain02.wav>;

sound LuaiInPain1 , <comp6pain02.wav>;
sound LuaiInPain2 , <comp6pain03.wav>;

define __WoandedSound = 150;
function InPainComSound(rn)
{
	
	if (my.skill21 == 1) // belal
	{				
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{
				play_entsound(my,BelalInPain1,__WoandedSound);
				my.skill22 = result; 
			}
			
			if (camra2player == 0) || (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}								
	}
	
	if (my.skill21 == 2) // jawad
	{		
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{
				if (int(random(2)) == 1)
				{
					play_entsound(my,JawadInPain1,__WoandedSound);
				}
				else
				{
					play_entsound(my,JawadInPain2,__WoandedSound);
				}
				
				my.skill22 = result;
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}																	
	}
	
	if (my.skill21 == 3)// sabah
	{
		
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{
				play_entsound(my,SabahInPain1,__WoandedSound);
				my.skill22 = result;
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}
		
	}	

	if (my.skill21 == 4)// emad
	{
		
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{
				play_entsound(my,EmadInPain1,__WoandedSound);
				my.skill22 = result;
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}
		
	}	
	
	if (my.skill21 == 5)// hani
	{		
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{					
				if (int(random(2)))
				{
					play_entsound(my,HaniInPain1,__WoandedSound);
				}
				else
				{
					play_entsound(my,HaniInPain2,__WoandedSound);
				}
				
				my.skill22 = result;
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}
	}	
	
	if (my.skill21 == 6)// luai
	{		
		while (1)
		{
			if (snd_playing(my.skill22) == 0)
			{
				if (int(random(2)) == 1)
				{
					play_entsound(my,LuaiInPain1,__WoandedSound);
				}
				else
				{
					play_entsound(my,LuaiInPain2,__WoandedSound);
				}					
				my.skill22 = result;
			}
			if (camra2player == 0)|| (PlayerIsDead)
			{
				break;
			}
			wait(1);
		}
	}	
}

/* ---------------------------------------------------------------------------------------------- */   

sound fight01, <fight01.wav>;
sound fight02, <fight02.wav>;
sound fight03, <fight03.wav>;
sound fight04, <fight04.wav>;
sound fight05, <fight05.wav>;
sound fight06, <fight06.wav>;
sound fight07, <fight07.wav>;
sound fight08, <fight08.wav>;
sound fight09, <fight09.wav>;
sound fight10, <fight10.wav>;


define __FighterVol = 1000;
function FighterSound()
{
	if (camra2player == 0)
	{
		return;
	}
	my.skill19 = int(random(9));

	if (my.skill19 == 0)
	{
		play_entsound(my,fight01,__FighterVol);
		return;
	}
	if (my.skill19 == 1)
	{
		play_entsound(my,fight02,__FighterVol);
		return;
	}
	if (my.skill19 == 2)
	{
		play_entsound(my,fight03,__FighterVol);
		return;
	}
	if (my.skill19 == 3)
	{
		play_entsound(my,fight04,__FighterVol);
		return;
	}
	if (my.skill19 == 4)
	{
		play_entsound(my,fight05,__FighterVol);
		return;
	}
	if (my.skill19 == 5)
	{
		play_entsound(my,fight06,__FighterVol);
		return;
	}
	if (my.skill19 == 6)
	{
		play_entsound(my,fight07,__FighterVol);
		return;
	}
	if (my.skill19 == 7)
	{
		play_entsound(my,fight08,__FighterVol);
		return;
	}
	if (my.skill19 == 8)
	{
		play_entsound(my,fight09,__FighterVol);
		return;
	}
	if (my.skill19 == 9)
	{
		play_entsound(my,fight10,__FighterVol);
		return;
	}
	
}


//function ComparsSound(MessageNumber)


/* ---------------------------------------------------------------------------------------------- */   
define __ComDieVol = 1000;
function CompareDieSound()
{		
	if (camra2player == 0)
	{
		return;
	}
	my.skill15 = int(random(4));
	if (my.skill15 == 0)
	{		
		play_entsound(my,ComparsDie0,__ComDieVol);
		return;
	}
	if (my.skill15 == 1)
	{
		play_entsound(my,ComparsDie1,__ComDieVol);
		return;
	}
	if (my.skill15 == 2)
	{
		play_entsound(my,ComparsDie2,__ComDieVol);
		return;
	}
	if (my.skill15 == 3)
	{
		play_entsound(my,ComparsDie3,__ComDieVol);
		return;
	}
	if (my.skill15 == 4)
	{
		play_entsound(my,ComparsDie4,__ComDieVol);
		return;
	}
}

/* ---------------------------------------------------------------------------------------------- */    

function RandomComNumber()
{			
	if (GlobalRandom == 0)
	{
		if (my.skill19 == 1)
		{
			my.skill21 = 1;
		}
		if (my.skill19 == 2)
		{
			my.skill21 = 2;
		}
		if (my.skill19 == 3)
		{
			my.skill21 = 3;
		}
		if (my.skill19 == 4)
		{
			my.skill21 = 4;
		}
		if (my.skill19 == 5)
		{
			my.skill21 = 5;
		}
		if (my.skill19 == 6)
		{
			my.skill21 = 6;
		}
		
		return;
	}

	if (GlobalRandom == 1)
	{
		if (my.skill19 == 1)
		{
			my.skill21 = 5;
		}
		if (my.skill19 == 2)
		{
			my.skill21 = 3;
		}
		if (my.skill19 == 3)
		{
			my.skill21 = 2;
		}
		if (my.skill19 == 4)
		{
			my.skill21 = 6;
		}
		if (my.skill19 == 5)
		{
			my.skill21 = 4;
		}
		if (my.skill19 == 6)
		{
			my.skill21 = 1;
		}
		return;
	}
	
	if (GlobalRandom == 2)
	{
		if (my.skill19 == 1)
		{
			my.skill21 = 2;
		}
		if (my.skill19 == 2)
		{
			my.skill21 = 5;
		}
		if (my.skill19 == 3)
		{
			my.skill21 = 4;
		}
		if (my.skill19 == 4)
		{
			my.skill21 = 6;
		}
		if (my.skill19 == 5)
		{
			my.skill21 = 3;
		}
		if (my.skill19 == 6)
		{
			my.skill21 = 1;
		}
		return;
	}
	
	if (GlobalRandom == 3)
	{
		if (my.skill19 == 1)
		{
			my.skill21 = 3;
		}
		if (my.skill19 == 2)
		{
			my.skill21 = 2;
		}
		if (my.skill19 == 3)
		{
			my.skill21 = 1;
		}
		if (my.skill19 == 4)
		{
			my.skill21 = 6;
		}
		if (my.skill19 == 5)
		{
			my.skill21 = 5;
		}
		if (my.skill19 == 6)
		{
			my.skill21 = 4;
		}
		return;
	}
}


/* ---------------------------------------------------------------------------------------------- */    

//var Ran = 0;
function SelectComSondType()
{		
	if (camra2player == 0)|| (PlayerIsDead)
	{
		return;
	}

	if (my.skill20 == 1)
	{
		my.skill25 = int(random(2));
		if (my.skill25 == 1)
		{
			showmessage(10,154);
		}
		else
		{
			showmessage(10,155);
		}
		WatchComSound(my.skill25);
	}
	
	if (my.skill20 == 2)
	{
		my.skill25 = int(random(3));
		if (my.skill25 == 0)
		{
			showmessage(10,148);
		}
		if (my.skill25 == 1)
		{
			showmessage(10,149);
		}
		if (my.skill25 == 2)
		{
			showmessage(10,150);
		}
		if (my.skill25 == 3)
		{
			showmessage(10,151);
		}
		
		HideingComSound(my.skill25);
	}
	
	//if (my.skill20 == 1)
	//{
	//}
	
	
}

function ComparsEvent()
{
	if (event_type == event_detect) && (MyIndecator == _ComparsScaning) 
	{
		if (you != null)
		{			
			if (you._type == _type_player)
			{
				my.event = null;
				SelectComSondType();
				wait(50);
				my.event = ComparsEvent;
			}
		}				
	}
}

/* ---------------------------------------------------------------------------------------------- */    

                                                                     
function move_on_path()   
{	
        /* skill 30 is used to set the pont where the compars die 
	 if goldi didn't kill him */
        
	
	//exclusive_entity;		
	if (int(random(2)) == 1) { my.string1 = "HORROR"; }
	else	                 { my.string1 = "Run";	 }
	
	//FighterSound();	
	while(1)
	{
	       ent_cycle(my.string1,my.skill1);
	       my.skill1 += speed/50;				
	      
	       temp.x = my.skill36 - my.x;
	       temp.y = my.skill37 - my.y;
	       temp.z = my.skill38 - my.z;
						
	       vec_to_angle(my_angle,temp);	       
	       my.pan = NearAngle(my.pan,my_angle,10);	       	      	      
	       if (vec_dist(my.x ,my.skill36 ) < 30)
	        {
	             ent_nextpoint(my.skill36) ; 		
                     my.skill30 += 1;		     
	        }	

	       if ( (my._health < 0) || (my.skill30 == 10))
		{
		  break;
		}			       	      
	       	      		
		temp.x = speed/40;
		temp.y = 0;
		temp.z = 0;
		move(me,temp,nullvector);
		                 		 
		wait(1);		
	}
	
       if ( my._health < 0 ) 
	 {		                    
	       my.enable_scan = off;
               my.enable_shoot = off;
               my.enable_detect = off;               		       
	       my.passable = on;
	       CompareDieSound();     
	       my.skill1=20;
	       my.skill15 = 1;
	       while (my.skill1 < 100)
	        {
	            ent_frame("2die",my.skill1);
	            my.skill1 += speed/30 ;		   
 		
		    temp.x = speed/200;
 	            temp.y = 0;
	            temp.z = 0;
  	            move(me,temp,nullvector);
			

			vec_for_vertex( target, me,222);
			temp.x = random(1)/10;
			temp.y = random(1)/10;
			temp.z = -random(5);
			effect( DownBullete_Blood, 20, target, temp);
			vec_for_vertex( target, me,101);
			effect( DownBullete_Blood, 20, target, temp);
			vec_for_vertex( target, me,284);
			effect( DownBullete_Blood, 20, target, temp);
			if (random(100)>50)
			{
				DropBloodDot();
			}


		    wait(1);	           
	        }
	      	      
	     //my.skill41 Can_Player_See_Me ???  1=Yes 0=No
	      my.skill41 = 1;
	      while ( (my.skill41 == 1) && (my.skill42 < Time_Befor_remove_me))
	       {  	          		  
		  Test_Player_Vision();
	          wait(1);
	       }	                       	      
	      remove(me);              
  	 }
       else   // (my.skill30 == 10)
        {
            my.enable_scan = off;
            my.enable_shoot = off;
            my.enable_detect = off; 
	    my.passable = on;
	    my.skill5 = 1;
	    remove(me);
        }	
}

/* ------------------------------------------------------------------------ */    

action moving_actor_From_A
{      
	if (camra2player == 0)
	{
		return;
	}

	my._health = 100; 
//        my.passable = 1;        

        my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;			

        random_compars();
        
	if (int(random(2)) == 1)
	{
		random_skin();
	}
	else
	{
		random_skin2();
	}
	
	wait(1);
	Place_actor_on_ground();
	
	
	if (int(random(2)) == 1)
	{
		ent_path("path_000");
	}
	else
	{ 
		ent_path("moving_actor_a"); 
	}
		
	ent_waypoint(my.skill36,1);
	move_on_path();	
}

/* ------------------------------------------------------------------------ */    

action moving_actor_From_B
{
      my.passable  = on;

       my._health = 100; 	      
       my.enable_scan = on;
       my.enable_shoot = on;
       my.enable_detect = on;		

       random_compars(); 
       wait(1);

       if (int(random(2)) == 1)
       {
		random_skin2();
       }
       else
       {
		random_skin();
       }
       
              
       wait(1);
       Place_actor_on_ground();
	wait(1);

	 //@ select Random Path 
       var random_number; 		 	
       random_number = int(random(3));

       if (random_number == 1)      { ent_path("kild_compars");  }
       else
        {
           if (random_number == 2)  { ent_path("path_049");	 }
	   else 	            { ent_path("kild_compars2"); }	   
        }
	      
       ent_waypoint(my.skill36,1);
       move_on_path();	
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

sound help1 , <help1.wav>;
function playLoopedS()
{
	while (1)
	{
		my.skill2 += 1;
		if (my.skill2 > 80)
		{
			my.skill2 = 0;
			play_entsound(my,help1,250);
		}

		if (camra2player == 0)|| (PlayerIsDead)
		{
			break;
		}
		wait(1);
	}
}

action Carry_Boy
{
	my.passable = on;
	my.invisible = on;
	wait(300);    
	my.invisible = off;
	my.passable = off;
	Place_actor_on_ground();
	wait(1);
	random_skin();
	
	if (my.skill1 == 2)
	{				
		playLoopedS();
	}
	if (my.skill1 == 1)
	{
		wait(60);
	}
	
	
	my.skill30 = 20;
	while (my.skill30 < 100)
	{
		//wait(10);
		ent_frame("2cary" ,my.skill30 );
		my.skill30 += speed/40;
		wait(1);
	}
   
	if (my.skill1 == 2)
	{						
		ent_path("path_067"); 	
		ent_waypoint(my.skill36,12);	
		my.passable = on;
	}
	if (my.skill1 == 1)	
	{
		ent_path("Cary_boy2_path"); 
		ent_waypoint(my.skill36,1);	
	}
    
	
	my.skill30= 0;	

	while (1)
	{
		 ent_cycle("3cary",my.skill40);
		 my.skill40 += speed/40;
		 
		 temp.x = my.skill36 - my.x ;
		 temp.y = my.skill37 - my.y; 
		 temp.z = my.skill38 - my.z; 
		 vec_to_angle( my_angle, temp);
		 
          	 my.pan = nearangle(my.pan,my_angle,20)  ;

  		 temp.x = speed/30;
		 temp.y = 0;
		 temp.z = 0;
		 move( my, temp, nullskill);
        
		 if (vec_dist(my.x ,my.skill36 ) < 50)
		   {		       
			ent_nextpoint(my.skill36) ; 			       
			my.skill30 +=1;
			if ((my.skill30 > 4) && (my.skill1 == 1))
			{		   
			   break;
			}
		   }
		 wait(1);
	}

	my.skill40 = 85 ;
	while (my.skill40 > 30)
	{
		ent_frame("2cary" ,my.skill40 );
		my.skill40 -=speed/200;
		wait(1);
	}
	man_help_boy();
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

function run_rundom()
{	
	if (int(random(2))==1) 
	{ 
		my.string1 = "HORROR"; 
	}
	else
	{
		my.string1 = "run";    
	}
     
	while(1)
	{	       	      	       		
		ent_cycle(my.string1,my.skill22);
		my.skill22 += speed/50;			
       
		temp.x = my.skill36 - my.x;
		temp.y = my.skill37 - my.y;
		temp.z = my.skill38 - my.z;
   					
		vec_to_angle(my_angle,temp);	    
		my.pan = my_angle.pan;
      	       
		if ( vec_dist(my.x ,my.skill36 ) < 40 )
		{ 
			ent_nextpoint(my.skill36) ; 		
			my.skill30 += 1; 
		}	        
	
		if ((my.skill30 == 7) || (my._health< 0))
		{
			break;
		}
	
		temp.x = speed/30;
		temp.y = 0;
		temp.z = 0;
		move(me,temp,nullskill);		 			                 		 
		wait(1);		
	}	         
   
	my.enable_scan = off;
	my.enable_shoot = off;
	my.enable_detect = off;
	    
	if (my._health < 0)
	{            
		my.skill41=20;	       	       	       	       	       	                      	       	       	       	       	       		                        	      	      	      	     	       
		CompareDieSound();
		while (my.skill41 < 100)
		{
		      ent_frame("2die",my.skill41);
		      my.skill41 += speed/50;		   
 	    		    
		      temp.x = speed/300;
		      temp.y = 0;
		      temp.z = 0;
  		      move(me,temp,nullvector);
		      wait(1);	           
		 }	      	      
         
		 //@ my.skill41 Can_Player_See_Me ??? 
		my.passable = on;
		my.skill41 = 1;
		while ( (my.skill41 == 1) && (my.skill42 < Time_Befor_remove_me) )
		{  	          		  
		       Test_Player_Vision();
		       wait(1);
		}	                       	      
		remove(me);   	 
        }    
        else
        {       
		if ( (my.skill20 == 1) || (my.skill20 == 2) || (my.skill20 == 3) ||(my.skill20 == 6) ||(my.skill20 == 7) || (my.skill20 == 8) || (my.skill20 == 10) || (my.skill20 == 11) )          
		 { 
			remove(me); 
		 }
	        else
		 {
			if ( (my.skill20 == 4) || (my.skill20 == 5) || (my.skill20 == 13))
		         {	        
 				 my.skill41=0;	       	       	       	       	       	                      	       	       	       	       	       		                        	      	      	      	     	       
	  			 CompareDieSound();
				 my.passable = on;
				 while (my.skill41 < 100)
 			         {
					 ent_frame("2die",my.skill41);
				         my.skill41 += speed/50;		   
 				    		    
					 temp.x = speed/300;
					 temp.y = 0;
					 temp.z = 0;
  	 				 move(me,temp,nullvector);
					 wait(1);	           
			         }	        	      	    	    
			 }
			else
			 {
				morph(<grop.mdl>,me);
				my.skin = my.skill40;
				my.pan +=180 ;
				my.skill40 = 40;
				
				if (my.skill20 == 9)
				{
					my.skill21 = 3;
				}
				else
				{
					my.skill21 = 4;
				}
				my.skill20 = 2;
				my.skill19 = 6;
				Man_brithing();                 
  		 	 } 	      
	          }   	 
     }
}

/* ------------------------------------------------------------------------ */    

action run_compars
{ 
	my._health = 100;
	my.enable_scan = on;
	my.enable_shoot = on;
	my.enable_detect = on;		

	if (int(random(2)) == 1)
	{
		random_skin();
	}
	else
	{
		random_skin2();
	}
	
	my.skill40 = my.skin;
	ent_frame("2PRAY",100); 

	    //@  skill20  connect the entity whith his path 
	if (my.skill20 == 1)  { ent_path("goto_1");  goto h1; }
	if (my.skill20 == 2)  { ent_path("goto_2");  goto h1; }
	if (my.skill20 == 3)  { ent_path("goto_3");  goto h1; }
	if (my.skill20 == 4)  { ent_path("goto_4");  goto h1; }
	if (my.skill20 == 5)  { ent_path("goto_5");  goto h1; }
	if (my.skill20 == 6)  { ent_path("goto_6");  goto h1; }
	if (my.skill20 == 7)  { ent_path("goto_7");  goto h1; }
	if (my.skill20 == 8)  { ent_path("goto_8");  goto h1; }
	if (my.skill20 == 9)  { ent_path("goto_9");  goto h1; }
	if (my.skill20 == 10) { ent_path("goto_10"); goto h1; }
	if (my.skill20 == 11) { ent_path("goto_11"); goto h1; }
	if (my.skill20 == 12) { ent_path("goto_12"); goto h1; }
	if (my.skill20 == 13) { ent_path("goto_13"); goto h1; }
 
	h1:
	wait(1);
	ent_waypoint(my.skill36,1);
	wait(5);
	run_rundom();
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

var SCounter = 0;
action died
{
	var random_number;

	my.passable = 1;     
  
	if (int(random(2)) == 1) 
	{
		SCounter+=1;
		if (SCounter > 2)
		{
			morph(<F_man_d.mdl>  ,my);		
		}
		else
		{
			morph(<Shaikh_d.mdl> ,my); 
		}
		
	}
	else 
	{ 
		morph(<F_man_d.mdl>  ,my); 
	}

	if (int(random(2)) == 1)
	{
		random_skin();  
	}
	else
	{
		random_skin2();  
	}
	
	wait(1);    
	Place_actor_on_ground();
	random_number = int(random(3));
	if (random_number == 0)
	{
		ent_frame("1die",100);
	}
	if (random_number==1)
	{
		ent_frame("2die",100);
	}
	if (random_number==2)
	{
		ent_frame("3die",100);
	} 
	if (random_number==3)
	{
		ent_frame("4die",100);
	}
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

function boysdEvent()
{
	if (event_type == event_detect) && ( MyIndecator == _BoyScan)
	{
		if (you != null)
		{
			if (you.passable == on)
			{
				return;
			}
		}
		my.event = null;
		my.skill15 = 1;
	}
}

/* ------------------------------------------------------------------------ */   

action boysd()
{
	my.passable = off;
	my.enable_scan = on;
	my.enable_detect = on;
	my.event =boysdEvent; 
	
	RandomComNumber();
	CrazyComSound();

	if (int(random(2)) == 1)
	{
		random_skin();
	}
	else
	{
		random_skin2();
	}


	while (1)
	{                      
		my.skill1 = 0;
		while (my.skill1<100)
		{
			my.skill1 += ((100-my.skill1)/15+5)*(speed/100);
			ent_frame("Hit",my.skill1);
			temp.x =(100-my.skill1)/50;
			temp.y = 0;
			temp.z = 0;
			move(me,temp,nullskill);
			wait (1);
		}
		
		wait (5);  //##
	
		my.skill1 = 0;
		while (my.skill1<100)
		{
			my.skill1 += speed/50;
			ent_frame("A_Turn",my.skill1);
			wait (1);
		}

		my.skill1 = 0;
		while (my.skill1<100)  
		{
			my.pan += random(1);  
			my.skill1 += speed/50;
			ent_frame("B_TUrn",my.skill1);
			wait (1);
		}
  
		my.pan += 180 + int(random(15));   
		my.skill1 = 0;
		  
		my.skill10 = 270 + int(random(10)); //##
		my.skill9 = 1;
		if (my.y > my.skill10) { my.skill9 = -1; }

		my.event =boysdEvent; 
		my.skill15 = 0;
		while (1) 
		{    
			ent_cycle("run",my.skill1);
			my.skill1 += speed/50;
			
			temp.pan = 180;
			temp.tilt = 180;
			temp.z = 50;
			MyIndecator = _BoyScan;
			scan(my.pos ,my.pan ,temp );
			MyIndecator = 0;
			if (my.skill15 == 1)
			{
				break;
			}
			  
			temp.x = 1000;
			temp.y =0;
			temp.z = 0;
			vec_rotate(temp , my.pan);
			temp.x += my.x;
			temp.y += my.y;
			temp.z += my.z;
			trace_mode = ignore_me + ignore_passable + ignore_passents ;
			trace(my.pos ,temp );
			   
			if ( (vec_dist(target,my.pos) < 80) || (  (my.y > my.skill10) && ( my.skill9 == 1)  )    ) 
			{
				break; 
			}
					
			temp.x = speed/30;
			temp.y = 0;
			temp.z = 0;
			move(me,temp,nullskill);
			if (result == 0)
			{
				break;
			}
			if (my.y > 320)
			{
			}
			wait (1);
		}

		wait(1);
}

}

/* ------------------------------------------------------------------------ */    

action cu_a
{     
  Cube = entity_to_pointer(me);
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */ 

function ComparsScanForPlayer()
{
	RandomComNumber();
	while (1)
	{
		temp.pan= 180;
		temp.tilt = 60;
		temp.z = 40;
		MyIndecator = _ComparsScaning;
		scan(my.pos,my.pan,temp);
		wait(1);
	}
	
}

/* ------------------------------------------------------------------------ */ 

action Turn_left
{	
	if (int(random(2)) == 1)
	{
		random_skin();
	}
	else
	{
		random_skin2();
	}

	
	my.enable_scan = on;
	my.enable_detect = on;
	my.event = ComparsEvent;
	ComparsScanForPlayer();
  
	while (1)
	{      
		my.skill30 = 0;
		while (my.skill30 < 100)
		{
			ent_frame("Turn" ,my.skill30 );
			my.skill30 +=speed/100;
			wait(1);
		}	
     
		my.skill30 = 0;
		while (my.skill30 < 300)
		{
			ent_cycle("brth" ,my.skill30 );
			my.skill30 += speed/50;
			wait(1);
		}   
		wait(1);
	}	
  
}

/* ------------------------------------------------------------------------ */    

action Turn_right
{
	if (int(random(2))== 1)
	{
		random_skin();
	}
	else
	{
		random_skin2();
	}
	

	my.enable_scan = on;
	my.enable_detect = on;
	my.event = ComparsEvent;
	ComparsScanForPlayer();

	while (1)
	{       
		my.skill30 = 0;
		while (my.skill30 < 100)
		{
			ent_frame("2Turn" ,my.skill30 );
			my.skill30 +=speed/100;
			wait(1);
		}
   
		my.skill30 = 0;
		while (my.skill30< 300)
		{
			ent_cycle("brth" ,my.skill30 );
			my.skill30 += speed/50;
			wait(1);
		}		
		
		wait(1);
	}  
}

/* ------------------------------------------------------------------------ */    

action Turn_right_down
{
	if (int(random(2)) == 1)
	{
		random_skin();
	}
	else
	{
		random_skin2();
	}
	
	my.enable_scan = on;
	my.enable_detect = on;	
	my.event = ComparsEvent;
	ComparsScanForPlayer();

	while (1)
	{		
		my.skill30 = 0;
		while (my.skill30 < 100)
		{
			ent_frame("3Turn" ,my.skill30 );
			my.skill30 +=speed/100;									
			wait(1);
		}
   
		my.skill30 = 0;
		while (my.skill30< 300)
		{
			ent_cycle("2brth" ,my.skill30 );
			my.skill30 += speed/50;						
			wait(1);	
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */    

action Man_brithing
{
	if (my.skill40 != 40)
	{
		if (int(random(2)) == 1)
		{
			random_skin();
		}
		else
		{
			random_skin2();
		}
		
	}
	if (my.skill40 == 40)
	{
	temp.x = -500;
	temp.y =0;
	temp.z = 0;
	vec_rotate( temp, my.pan);
	trace(my.pos , temp);
	temp.x = 10;
	temp.y= 8;
	temp.z = 0;
	vec_rotate(temp,my.pan);
	vec_add(target,temp);
	vec_set (my.pos,target);
	}
	
	

	my.enable_detect = on;
	my.enable_scan = on;
	my.event = ComparsEvent;
	ComparsScanForPlayer();
	
	while (1)
	{
		ent_cycle("brth" ,my.skill30 );
		my.skill30 += speed/50;
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

action man_help_boy
{
	while (LetTheGameBegin == 0)
        {
		wait(1);
        }

    RandomComNumber();	
InPainComSound();
    var s;
    while (1)
     {
	  while (my.skill30 < 100)
	  {
	      ent_frame("aid" ,my.skill30 );
	      my.skill30 += speed/400;                  
	      wait(1);
	  }
	  my.skill30 =0;
	  s=0;
	  my.string1="aid";   //old
	  my.string2="aid";   //new

	  while (s < 100)
	   {	         
	       smoothto(my.string1 ,my.string2 ,  100 , s );
	       s += speed/20;
	       wait(1);	       
	   }
          wait(1);
     }
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

action wounded
{
        while (LetTheGameBegin == 0)
        {
        wait(1);
        }

	wait(1);
        Place_actor_on_ground();
	RandomComNumber();	
	InPainComSound();
	my.skill30 = 0;
	my.skill31  = 1;
	while (1)
	{		
		ent_frame("1leg" , my.skill30);
		my.skill30 += my.skill31;

		if (my.skill30 > 100) 
		{ 
			my.skill31 = -speed/200; 
		}       
		if (my.skill30 < 0) 
		{ 
			my.skill31 = speed/200;  
		}
		wait(1);
	}
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */    

function Run_with_chear()
{    
     my.skill30=0;          
     while(1)
	{	     
	       ent_cycle("Rn",my.skill33);
	       my.skill33 += speed/50;				
	      
	       temp.x = my.skill36 - my.x;
	       temp.y = my.skill37 - my.y;
	       temp.z = my.skill38 - my.z;
						
	       vec_to_angle(my_angle,temp);
	       
	       my.pan = nearangle(my.pan,my_angle,10);
	       if (vec_dist(my.x ,my.skill36 ) < 50)
	        {
	             ent_nextpoint(my.skill36) ; 		
                     my.skill30 += 1;
		     if (my.skill30 > 9)
		     {
			break;
		     }
	        }	                			       

	       if (vec_dist(my.pos ,goldi_pointer.pos )< 200 )
		{
		  break;
		}			       	      
	       	    		
		temp.x =speed/40;
		temp.y = 0;
		temp.z = 0;
		move(me,temp,nullvector);
		                 		 
		wait(1);		
	}

     
     my.skill33 = 0;
 
     FighterSound();
     while (my.skill33 < 100)
      {
           ent_cycle("Dn",my.skill33);
           my.skill33 += speed/50;	
   
           temp.x = my.skill36 - my.x;
	   temp.y = my.skill37 - my.y;
	   temp.z = my.skill38 - my.z;
						
	   vec_to_angle(my_angle,temp);
	   my.pan = nearangle(my.pan,my_angle,10);
	   if (vec_dist(my.x ,my.skill36 ) < 50)
	    {
	        ent_nextpoint(my.skill36) ; 		
                my.skill30 += 1;
		if (my.skill30 > 9)
		{
			break;
		}
	    }	                			       

	   if (vec_dist(my.pos ,goldi_pointer.pos )< 120   )
	    {		  
	        my.enable_scan = on;
                my.enable_shoot = on;
                my.enable_detect = on;
	    }			       	      
	       	
	   if (my._health < 0) 
	   { 
		break;	
	   }		

	   temp.x = speed/50;
	   temp.y = 0;
	   temp.z = 0;
	   move(me,temp,nullvector);

           wait(1);
      }	
    
     morph(<f_man.mdl>,me);    
     if (my.skill40 == 1)
     {
            my.skin = 2;
     }
     if (my.skill40 == 2)
     {
	    my.skin = 9;
     }
     if (my.skill40 == 3)
     {
	    my.skin = 16;
     }
    
     my.skill2 = 0;
     while (my._health > 0)
     {           
	   ent_cycle("run",my.skill2);
           my.skill2 += speed/100;	
   
           temp.x = my.skill36 - my.x;
	   temp.y = my.skill37 - my.y;
	   temp.z = my.skill38 - my.z;
						
	   vec_to_angle(my_angle,temp);

	   my.pan = nearangle(my.pan,my_angle,10);
	   temp.x = speed/50;
	   temp.y = 0;
	   temp.z = 0;
	   move(me,temp,nullvector);


           if (vec_dist(my.x ,my.skill36 ) < 50)
	    {
	        ent_nextpoint(my.skill36) ; 		
                my.skill30 += 1;		
		if (my.skill30 > 9) 
		{
			break; 
		}
	    }	                			       
	       	
	   

          wait(1);
     }

  // the way the entitys are removed - death frames or just remove -
     if (my._health <= 0)
     {
         my.enable_scan = off;
         my.enable_shoot = off;
         my.enable_detect = off; 
	 my.passable = on;        
	 
         my.skill40=0;	       	       	       	       	       	                      	       	       	       	       	       		                        	      	      	      	     	       
         while (my.skill40 < 100)
          {
                ent_frame("2die",my.skill40);
                my.skill40 += speed/50;

                temp.x = speed/300;
     	        temp.y = 0;
	        temp.z = 0;
                move(me,temp,nullvector);

	        vec_for_vertex( target, me,222);
		temp.x = random(1)/10;
		temp.y = random(1)/10;
		temp.z = -random(5);
		effect( DownBullete_Blood, 20, target, temp);
		vec_for_vertex( target, me,101);
		effect( DownBullete_Blood, 20, target, temp);
		vec_for_vertex( target, me,284);
		effect( DownBullete_Blood, 20, target, temp);
		if (random(100)>50)
		{
			DropBloodDot();
		}

	        wait(1);
           }     
     }               	      	                
     wait(300);
     remove(me);              	
}

/* ------------------------------------------------------------------------ */  

action Compars_with_chear
{       
	
	my._health = 100; 

	var rn = 0;
	rn = int(random(2));    
	if (rn == 0){ my.skin = 1;}
	if (rn == 1){ my.skin = 2;}
	if (rn == 2){ my.skin = 3;}
	my.skill40 = my.skin;
    
	wait(1);
	Place_actor_on_ground();
    
	
	ent_path("path_000");
	ent_waypoint(my.skill36,1);
	Run_with_chear();
}

/* ------------------------------------------------------------------------ */   
/* ------------------------------------------------------------------------ */  

function hit_man_die()
{      
	
	while(1)
	{	     
		ent_cycle("run",my.skill1);
		my.skill1 += speed/50;
	
		temp.x = my.skill36 - my.x;
		temp.y = my.skill37 - my.y;
		temp.z = my.skill38 - my.z;

		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,10)   ;
		if (vec_dist(my.x ,my.skill36 ) < 50)
		{
			ent_nextpoint(my.skill36) ; 		
			my.skill30 += 1;		     
		}	                			       
	
		if (vec_dist(my.pos ,goldi_pointer.pos )< 200 ) 
		{
			break;
		}	

		temp.x = speed/30;
		temp.y = 0;
		temp.z = 0;
		move(me,temp,nullvector);

		wait(1);		
	}
    
	morph(<Grop.mdl>,me);
	my.skin = my.skill40;
	my.skill2 = 0;
	
	FighterSound();
	while (my.skill2 < 100)
	{
		ent_frame("HitUp",my.skill2);
		my.skill2 += speed/50;	
   
		temp.x = my.skill36 - my.x;
		temp.y = my.skill37 - my.y;
		temp.z = my.skill38 - my.z;						
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,10);
		if (vec_dist(my.x ,my.skill36 ) < 50)
		{
			ent_nextpoint(my.skill36) ; 		
			my.skill30 += 1;	
			if (my.skill30 > 9)
			{
				break;
			}
		}	                			       

		if (vec_dist(my.pos ,goldi_pointer.pos )< 100   )
		{		  
			my.enable_scan = on;
			my.enable_shoot = on;
			my.enable_detect = on;
		}			       	      
	       	
		if (my._health < 0) 
		{	
			break; 
		}		
	
		temp.x = speed/40;
		temp.y = 0;
		temp.z = 0;
		move(me,temp,nullvector);
		wait(1);
	}	
	
	morph(<f_man.mdl>,me);
	my.skin = my.skill40;

	while (1)
	{
		if (my._health < 0)
		{
			break;
		}
		ent_frame("run",my.skill2);
		my.skill2 += speed/50;	
   
		temp.x = my.skill36 - my.x;
		temp.y = my.skill37 - my.y;
		temp.z = my.skill38 - my.z;						
		vec_to_angle(my_angle,temp);
		my.pan = nearangle(my.pan,my_angle,10);
		temp.x = speed/40;
		temp.y = 0;
		temp.z = 0;
		move(me,temp,nullvector);

		if (vec_dist(my.x ,my.skill36 ) < 50)
		{
			ent_nextpoint(my.skill36) ; 		
			my.skill30 += 1;	
			if (my.skill30 > 9)
			{
				break;
			}
		}		
		wait(1);
	}
	
	my.enable_scan = off;
	my.enable_shoot = off;
	my.enable_detect = off; 
	my.passable = on;
	
	my.skill40=0;
	CompareDieSound();
									
	while (my.skill40 < 100)
	{
		
		ent_frame("2die",my.skill40);
		my.skill40 +=speed/50;		   
		    		    				
		vec_for_vertex( target, me,222);
		temp.x = random(1)/10;
		temp.y = random(1)/10;
		temp.z = -random(5);
		effect( DownBullete_Blood, 20, target, temp);
		vec_for_vertex( target, me,101);
		effect( DownBullete_Blood, 20, target, temp);
		vec_for_vertex( target, me,284);
		effect( DownBullete_Blood, 20, target, temp);
		if (random(100)>50)
		{
			DropBloodDot();
		}

		temp.x = speed/300;
		temp.y = 0;
		temp.z = 0;
		move(me,temp,nullvector);
		
		wait(1);	           
	}
	      	      
	wait(100);
	remove(me);              
}

/* ------------------------------------------------------------------------ */    

action Hit_man
{	
	my._health = 100; 
    	
	if (int(random(2)) == 2)
	{
		random_skin(); 	
	}
	else
	{
		random_skin2(); 	
	}
	
	
	my.skill40 = my.skin;
	
	Place_actor_on_ground();
	wait(1);
	ent_path("path_000");
	ent_waypoint(my.skill36,1);
	Hit_man_die();
}

/* ------------------------------------------------------------------------ */    
/* ------------------------------------------------------------------------ */   



function create_moving_compars_In_A()
{
	temp.x = -1040;
	temp.y = 530;//512
	temp.z = 50;          

	var rn;	
	rn =  int(random(2));
    
	if (rn == 0)
	{ 
		ent_create(fMan,temp,Hit_man); 
		return;
	}       
	if (rn == 1) 
	{ 		
		ent_create(ChareMan,temp,Compars_with_chear); 	 						
		return;
	}
	else
	{ 
		ent_create(compars1,temp,moving_actor_From_A); 
		return;
	}
  
}

/* ------------------------------------------------------------------------ */

function create_moving_compars_In_B()
{
	Test_Vision();
	wait(1);
	if (PlayerCanSeeMe == 0)
	{
		temp.x= -840;     
		temp.y = 120;
		temp.z = 50;
		ent_create(compars1,temp,moving_actor_From_B); 
	}
}



/////////////////////////////////////////////////////////////////////////
//
//			     player function  
//
/////////////////////////////////////////////////////////////////////////

function scan_player_postion()
{   
wait(3); 
while (1)
{       	
	if ((IsGoldiDead == 1) || (PlayerIsDead == 1))
	{
		break;
	}
			
	if (player.x > -560)
	{
		if (Goldi_Changing == 1)
		{	
			Goldi_Changing = 0;
			Play_My_Sounds(6,0);
			//ShowMessage(10,132); //4			
			ShowMessage(10,135); //4			
		}
	}		
	wait(1);
}  
}

/* ------------------------------------------------------------------------ */

function start_level()
{
	return;
}

/* ------------------------------------------------------------------------ */

action HeartPlyerInSmoke
{
	var rn2;
	my.invisible = on;
	my.passable = on;
	wait(10);
	while (1)
	{			
		if ((IsGoldiDead == 1) || (PlayerIsDead == 1))
		{
			break;
		}
		if (player != null)
		{	
			if ((player.y > 550) && (player.x < -700)) || ( (player.y > 602) && (player.x > -700) )
			{			
				rn2 +=1;			
				if (rn2 > 5)  
				{	
					rn2 = 0;
					you = player;
					SmokeSound = 1;
					HeartPlayer(5);
					temp.x = my.x - player.x;
					temp.y = my.y - player.y;
					temp.z = 0;
					vec_to_angle( my_angle, temp);
					ShowEnemyPos(ang(my_angle.pan));
	
					stop_sound(SoundIsPlaying);
					if (snd_playing(SoundHandel) == 0 )
					{				
						play_sound(S_M_L7_23,100);
						SoundHandel = result;
					}
				}
				SmokeSound =0;
			}		
		}
		wait(1);
	}
}
