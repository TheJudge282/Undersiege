
function GetVertexNum(cme)
{

me = cme;
var
Cvertx = 1;
var
Nvertx;
var
ltmp;
while (1)
{

vec_for_vertex( temp, me, Cvertx);
vec_for_vertex( ltmp, me, Cvertx +1 );

if ((temp.x == ltmp.x)&&(temp.y== ltmp.y)&&(temp.z==ltmp.z) )
{
Nvertx = 1;
Nvertx. y = 0;

   while (Nvertx<100)
    {
     vec_for_vertex( ltmp, me, Cvertx +Nvertx );
     
      if ((temp.x != ltmp.x)||(temp.y!= ltmp.y)||(temp.z!=ltmp.z) )
       {
        Nvertx. y = 1;
        break;
       }
       Nvertx += 1;
    }

   if (Nvertx. y != 1)
   {
      return(Cvertx);
   }
}

Cvertx += 1;
}
}

function maxminnum(num1,val)
{
var
Res;
res = max(-val,min(val,num1));
return(res);
}

function maxmaxnum(num1,val)
{
var
Res;
if (abs(val)>abs(num1))
{
res = val;
}
else
{
res = num1;
}
return(res);
}

function AngleDef(Nm1, Nm2)
{
nm2 = ang(nm2);
nm1 = ang(nm1);
var Reslt = 0;

if (abs(nm1-nm2)<180) {

		   Reslt = Nm2 - Nm1;
}
else
{
		   Reslt =  Nm1 - Nm2;
}

return( Reslt);

}

function NearAngle(Nm1, Nm2, lowvalue)
{
nm2 = ang(nm2);
nm1 = ang(nm1);
var Reslt = Nm1;

if (abs(nm1-nm2)<=180) {

		if (nm1<=nm2)
		{
		   Reslt = Reslt + min( lowvalue, Nm2 - Nm1);
		}
		else
		{
		  if (Nm1>Nm2)
		   {
		      Reslt = Reslt - min( lowvalue, Nm1 - Nm2);
		   }
		}
}
else
{
		if (Nm1<=Nm2)
		{
		   Reslt = Reslt - min( lowvalue, Nm2 - Nm1);
		}
		else
		{
		  if (Nm1>Nm2)
		  {
		      Reslt = Reslt + min( lowvalue, Nm1 - Nm2);
		  }
		}
}

return( Reslt);
}

function NearAangle(Nm1, Nm2, lowvalue)
{
nm2 = ang(nm2);
nm1 = ang(nm1);
var Reslt = Nm1;

if (abs(nm1-nm2)<180) {

		if (nm1<nm2)
		{
		   Reslt = Reslt + min( lowvalue, (Nm2 - Nm1)/2);
		}
		else
		{
		  if (Nm1>Nm2)
		   {
		      Reslt = Reslt - min( lowvalue, (Nm1 - Nm2)/2);
		   }
		}
}
else
{
		if (Nm1<Nm2)
		{
		   Reslt = Reslt - min( lowvalue, (Nm2 - Nm1)/2);
		}
		else
		{
		  if (Nm1>Nm2)
		  {
		      Reslt = Reslt + min( lowvalue, (Nm1 - Nm2)/2);
		  }
		}
}

return( Reslt);
}

/*
function nearnumber(num1,num2,lowvalue)
{
var nextnum = num1;

if (num1<num2)
{
   nextnum += min( lowvalue, num2 - num1);
}
else
{
 if (num1>num2)
  {
     nextnum -= min( lowvalue, num1 - num2);
  }

}
return(nextnum);
}
*/
function VecDistXY(V1,v2)
{
var
Vec1 = v1;
var 
vec2 = v2;
var
Dst ;
dst= max(abs(Vec1.x-Vec2.x),abs(vec1.y-vec2.y));
return(Dst);
}
