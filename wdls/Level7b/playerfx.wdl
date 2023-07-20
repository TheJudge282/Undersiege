function FootMarca()
{
my.pan = you.pan;

my.passable = 1;
my.oriented = 1;
my.scale_x = 0.05;
my.scale_y = 0.05;
my.tilt = -90;
my.alpha = 40;

trace_mode = ignore_models+ignore_sprites+ignore_passable;
my.z+=100;
vec_set( temp, my.x);
temp.z -= 5000;
trace( my.x, temp);
vec_set( my.x, target);
my.z+=1;

while (my.alpha>2)
{
my.alpha-=2;
wait(1);
}
remove me;
}

function OCBlood(Pine)
{
my = 0;
you = 0;
EnemyPos.alpha = min(EnemyPos.alpha+ Pine*5,99); 
PlayerBood.alpha = min(PlayerBood.alpha+ Pine*3,50);
if (PlayerBood.visible){return;}
PlayerBood.visible =1;
PlayerBood.alpha = Pine;
PlayerBood.transparent = 1;

EnemyPos.visible =1;
EnemyPos.alpha = Pine*5;
EnemyPos.transparent = 1;
EnemyPos.flare = 0;

while (1)
{
	PlayerBood.alpha =max(0,PlayerBood.alpha-2);
	EnemyPos.alpha = max(0,EnemyPos.alpha-0.5); 
	if (PlayerBood.alpha<2)&&(EnemyPos.alpha<2)
	{break;
	}
	wait(1);
}
PlayerBood.visible =0;
EnemyPos.visible =0;
}

function FlashEntity(fmy)
{
me = fmy;
my.ambient = -100;
wait(1);
my.ambient = -50;
wait(1);
my.ambient = 0;

}

function MyToRemove()
{
	you = me;
	me =  0;
	you.scale_x = 0.1;
	you.scale_y = 0.1;
	you.scale_z = 0.1;
	you.oriented = 1;
	you.passable = 1;
	var kd;
	kd.x = you.x - camera.x;
	kd.y = you.y - camera.y;
	kd.z = you.z - camera.z;
	vec_to_angle(you.pan,kd);
	wait(1);
remove you;
}

action MyToRemove2()
{
you = me;
me =  0;

	you.scale_x = 0.1;
	you.scale_y = 0.1;
	you.scale_z = 0.1;
	you.oriented = 1;
	you.passable = 1;
	var kd;
	kd.x = you.x - camera.x;
	kd.y = you.y - camera.y;
	kd.z = you.z - camera.z;
	vec_to_angle(you.pan,kd);
	wait(1);
	remove you;
}

function SkyClouds()
{
my.passable =1;
my.scale_x=40;
my.scale_y=40;
my.ambient =100;
my.invisible =100;
while (1)
{
my.u += 0.1;
if (player)
{
 my.x = camera.x;
 my.y = camera.y;
 my.z = camera.z + 2000;

 my.tilt = -10*cos(player.pan);
 my.roll = -10*sin(player.pan);

}
 wait(1);
}
}

function PanoPict()
{
my.passable =1;
my.scale_z/=10;
}

function topsky()
{
my.passable =1;
my.ambient =100;
my.scale_x=40;
my.scale_y=40;

while (1)
{
if (player)
{
 my.x = camera.x;
 my.y = camera.y;
 my.z = camera.z + 2000;

 my.tilt = -10*cos(camera.pan);
 my.roll = -10*sin(camera.pan);

}
 wait(1);
}
}

function Terrain()
{
my.tex_scale = 0.1;
my.scale_z *= 0.5;
my.z += 50;
my.passable = 1;
}


