
function BackCamera()
{
if (Camra2Player)
{
	CustomCamera(player);
}
}

function EyCamera()
{
	if (Camra2Player)
	{
		player.invisible = 1;
		EyeCamera(player);
	}
	else
	{
		player.invisible = 0;
	}
	player.shadow = (player.invisible == 0)&&shadowenable;
	if (weapon)
	{
		you = Pointer_To_Entity( player.WeaponMesh1);
		you.invisible = 1;
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponMesh2);
		you.invisible = 1;
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponStore1);
		you.invisible = 1;
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponStore2);
		you.invisible = 1;
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponAnerga);
		you.invisible = 1;
		you.shadow = 0;
		if (DecetPlayer == 1)
		{weapon.invisible = 1;
		}
		else
		{weapon.invisible = player.invisible == 0;
		}
		//weapon.invisible = player.invisible == 0;
	}
}

function TPsCamra()
{
	if (Camra2Player)
	{
		you = Pointer_To_Entity( player.WeaponMesh1);
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponMesh2);
		you.invisible =1;
		you.shadow = 0;
		you =Pointer_To_Entity( player.WeaponStore2);
		you.invisible =1;
		you.shadow = 0;
		you = Pointer_To_Entity( player.WeaponStore1);
		you.invisible =1;
		you.shadow = 0;

		if (Kick_state == 0)&&(Maine_state == 0)
		{
			you = Pointer_To_Entity( player.WeaponMesh1);
			you.invisible = 0;		
			you.shadow = shadowenable;
			if (weapon_number != 1)&&(weapon_number != 8)&&(weapon_number != 9)&&(weapon_number != 15)&&(weapon_number != 16)&&(weapon_number != 12)
			{
				you = Pointer_To_Entity( player.WeaponStore1);
				you.invisible = 0;
				you.shadow = shadowenable;
			}
			if (weapon_number==14)
			{
				you = Pointer_To_Entity( player.WeaponMesh2);
				you.invisible = 0;
				you.shadow = shadowenable;
				you = Pointer_To_Entity( player.WeaponStore2);
				you.invisible = 0;
				you.shadow = shadowenable;
			}
			if (weapon_number == 17)
			{
				you = Pointer_To_Entity( player.WeaponMesh2);
				you.invisible =1;
				you.shadow = 0;
				you =Pointer_To_Entity( player.WeaponStore2);
				you.invisible =1;
				you.shadow = 0;
				you = Pointer_To_Entity( player.WeaponMesh1);
				you.invisible =1;
				you.shadow = 0;
				you = Pointer_To_Entity( player.WeaponStore1);
				you.invisible =1;
				you.shadow = 0;
			}
		}
		temp.x = TPsCamera(player);
		if (temp.x<50)
		{
			player.transparent = 1;
			player.alpha = temp.x*2;
		}
		else
		{
			player.transparent = 0;
		}
		player.transparent = 0;
	}
}

function InitPPCamera()
{
	player.invisible = (camorder==2);
	player.shadow = (player.invisible == 0)&&shadowenable;
}

function CameraState()
{
	if (cameraction  == FreeCamera)
		{return;}
	if (weapon_reloading)
		{return;}
	if (camera.arc != 60)
		{ return;}
	if (player==null)
	{ return;}

	camorder += 1;

	if (camorder>3)
	{ camorder=2;}

	if (camorder==1)
	{
	 cameraction = BackCamera;
	}

	if (camorder==2)
	{
		if (weapon_number == 15)||(Kick_state == 1)||(Maine_state == 1)
		{return;
		}else
		{cameraction = EyCamera;
		}
	}

	if (camorder==3)
	{
	 cameraction = TPsCamra;
	}
	InitPPCamera();
}
