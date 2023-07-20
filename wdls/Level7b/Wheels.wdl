
function pos_mebyskill(f)
{
	you = f;
	pos_by_vertex( you, me, you.PosVertex);
	rote_by_vertex( you, me, you.FrontVertex);

	you.roll = my.roll;
if (my.CarBreaker==0)
{
	set_cycle( you, wWalk, my.CarCurrentRotPos);
}

}

function whelel()
{
my.passable = 1; 
my.PosVertex   = VertexMRwheele[you._CarOrder];
my.FrontVertex = VertexFRwheele[you._CarOrder];
my.SideVertex  = VertexSRwheele[you._CarOrder];

you.LeftWheel = me;

my.scale_x = you.scale_x;
my.scale_y = you.scale_y;
my.scale_z = you.scale_z;


}


function wheler()
{
my.passable = 1; 

my.PosVertex   = VertexMLwheele[you._CarOrder];
my.FrontVertex = VertexFLwheele[you._CarOrder];
my.SideVertex  = VertexSLwheele[you._CarOrder];

you.RightWheel = me;

my.scale_x = you.scale_x;
my.scale_y = you.scale_y;
my.scale_z = you.scale_z;


}

function whelerb()
{
my.passable = 1; 

my.PosVertex   = VertexMRBwheele[you._CarOrder];
my.FrontVertex = VertexFRBwheele[you._CarOrder];
my.SideVertex  = VertexSRBwheele[you._CarOrder];

you.RightBackWheel = me;

my.scale_x = you.scale_x;
my.scale_y = you.scale_y;
my.scale_z = you.scale_z;


}


function whelelb()
{
my.passable = 1; 

my.PosVertex   = VertexMLBwheele[you._CarOrder];
my.FrontVertex = VertexFLBwheele[you._CarOrder];
my.SideVertex  = VertexSLBwheele[you._CarOrder];


you.LeftBackWheel = me;

my.scale_x = you.scale_x;
my.scale_y = you.scale_y;
my.scale_z = you.scale_z;
}
