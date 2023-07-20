function MNewFunction(cmy)
{
me = 0;
you = cmy;
morph ( <new2.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <new1.tga>, you);
	if (SCheckIfClick(you))
	{
	 VisMainMenu(0);
	 new_game();
	}

}

function MLoadFunction(cmy)
{
me = 0;
you = cmy;

morph ( <LoadSave1.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <LoadSave.tga>, you);
	if (SCheckIfClick(you))
	{
	VisSaveDialog(1);
	SaveDialog.flag1 = 0;
	}

}

function MSettFunction(cmy)
{
me = 0;
you = cmy;

morph ( <Set2.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <Set1.tga>, you);
	if (SCheckIfClick(you))
	{
	SettingsVisible(1);
	}

}

function MBackFunction(cmy)
{
me = 0;
you = cmy;

morph ( <Back2.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <Back1.tga>, you);
	if (SCheckIfClick(you))
	{
	VisMainMenu(0);
	}

}

function MExitFunction(cmy)
{
me = 0;
you = cmy;

morph ( <exit2.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <exit1.tga>, you);
	if (SCheckIfClick(you))
	{
	 gameclose();
	}

}

entity  MNewMenu
{
type = <New1.tga>;
view = camera;
flags = visible;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0;
z = -0.69;//1.38;
event = MNewFunction;
skill3 = 0.8;
skill4 = 0.2;
}

entity  MLoadMenu
{
type = <LoadSave.tga>;
view = camera;
flags = visible;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0;
z = 0.69;
event = MLoadFunction;
skill3 = 0.8;
skill4 = 0.2;
}

entity  MSettingsMenu
{
type = <set1.tga>;
view = camera;
flags = visible;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0;
z = 0;
event = MSettFunction;
skill3 = 0.8;
skill4 = 0.2;
}

entity  MBackMenu
{
type = <back1.tga>;
view = camera;
flags = visible;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0;
z = 1.38;//-0.69;
event = MBackFunction;
skill3 = 0.8;
skill4 = 0.2;
}

entity  MExitMenu
{
type = <exit1.tga>;
view = camera;
flags = visible;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0;
z = -1.38;
event = MExitFunction;
skill3 = 0.8;
skill4 = 0.2;
}

entity mainMenu
{
type = <firstmenu.tga>;
view = camera;
flags = visible;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0;
z = 0;
}


function VisMainMenu(val)
{
if (val == MainMenu.visible){return;}
 cpointer.visible = abs(val-1);

 MNewMenu.visible = val;
 MLoadMenu.visible = val;
 MSettingsMenu.visible = val;
 MBackMenu.visible = val;
 MExitMenu.visible = val;
 MainMenu.visible = val;
 DownTextMsg.visible = val;
 UpTextMsg.visible = val;
 MouseFlare.visible = Val;
 freeze_mode = val;
 //pause(CurrentSong);
if (val)
{
	AlphaMainMenu(100);
	mouseing();
}
}

function AlphaMainMenu(val)
{
if (MainMenu.visible==0){return;}

 MNewMenu.alpha = val;
 MLoadMenu.alpha = val;
 MSettingsMenu.alpha = val;
 MBackMenu.alpha = val;
 MExitMenu.alpha = val;
 MainMenu.alpha = val;
}

entity BlackScreen
 {
    type =  <blackscrn.tga>;
    view = camera;
    scale_x = 0.2;
    scale_y = 0.2;
    x = 0.5;   
    y = 0;
    z = 0;
    event = finalization;
    skill1 =1;
    layer = -101;
 }

entity WhiteScreen
 {
    type =  <whitescrn.tga>;
    view = camera;
    scale_x = 0.2;
    scale_y = 0.2;
    x = 0.5;   
    y = 0;
    z = 0;
    layer = 100;
    skill1 =1;
       
 }

function Fade2black(Flg,Spd,exece)
{
me = 0;
BlackScreen.visible = 1;
BlackScreen.alpha=0;
while (1)
{
BlackScreen.alpha+=Spd;
if (BlackScreen.alpha>95)
{break;}
wait(1);
}
BlackScreen.visible = 0;
Pointer_To_Function( exece, 0, 0, 0);
}


function ShowMessage(WaitVal,MsgId)
{
if (MessageViwer != 0)
{return;
}
me = player;
wait( WaitVal);
msggdd( MsgId);

}