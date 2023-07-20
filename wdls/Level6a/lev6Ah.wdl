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
	type = <Lev6HintA.bmp>;
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
	type = <PressMsg2.tga>;
	view = camera;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = -20;
	layer=4;
}

entity splashscreen
{
	type = <load6_2.bmp>;
	view = camera;
	flags = visible;
	scale_x = 0.11;
	scale_y = 0.11;
	x = 60;
	y = 0;
	z = 0;
	layer=3;
}

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
include <apatchi.wdl>;
include <level6scripte2.wdl>;
var video_mode = 7;
var video_depth = 16;

string level_str = <lev6Ah.wmb>; // give file names in angular brackets

function main()
{
	str_cpy(levelpath,"PPoint1.pts");
	InitInterface();
	fps_max = 25;
	splashscreen.visible = on;
	play_sound(StartSound,100);
	StartSoundh=result;
	fog_color=1;
	camera.fog=11;
	level.z=1;
	tex_share = on;
	wait(3);

	level_load(level_str);
	wait(1);
	LevelNumberId = 6;
	initilization();
}

function SetViewBright(CMBr)
{
		camera.ambient = CMBr-100;
		blackface.alpha = abs(min(0, camera.ambient)/3);

}

function my_new_door()
{
remove(me);
return;
}
function my_new_window()
{
return;
}


function game_act1()
{
return;
}

function tank()
{
return;
}

function malaleh()
{
return;
}



function soldier_patrol1()
{
return;
}

