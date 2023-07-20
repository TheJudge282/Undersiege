function CarEngine()
{
my.invisible = 1; 
my.passable = 1; 
if (you.OwnType == TypeOfCars)
{
my.OwnType = TypeOfEngines;
}else
{
my.OwnType = TypeOfPEngines;

}

you.LeaderId = entity_to_pointer(me);
my.LeaderId = entity_to_pointer(you);
wait(10);
my.scale_x = 2; 
my.scale_y = 2; 
my.scale_z = 2; 
}
