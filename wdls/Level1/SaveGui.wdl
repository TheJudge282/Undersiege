entity* LastSave;
function OkiDelete();
function OkiReplace();

function RemoveSave(cmy)
{
me = 0;
you = cmy;

morph ( <del2.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <del1.tga>, you);
	if (SCheckIfClick(you))
	{

	if (LastSave)
	{
		VisConFirmDel(1);
	}

	}
	}

}

entity SRemoveBtn
{
type = <del1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0.28;
z = -1.98;
event = RemoveSave;
skill3 = 0.6;
skill4 = 0.2;
}

function EscDelete()
{
		VisConFirmDel(0); 

}

function EscReplace()
{
		VisConFirmRep(0); 

}

function DelOkEvent(cmy)
{
my = 0;
you = cmy;

morph ( <ok1.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <ok.tga>, )you;
	if (SCheckIfClick(you))
	{
		 Guifunction = on_enter;
		 Guifunction();
	}
}

function DelEscEvent(cmy)
{
my = 0;
you = cmy;

morph ( <cancel1.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <cancel.tga>, )you;
	if (SCheckIfClick(you))
	{
		 Guifunction = on_esc;
		 Guifunction();
	}
}

entity ConfirmOkDelete
{
type = <ok.tga>;
view = camera;
scale_x =  0.015;
scale_y =  0.015;
x = 10;
y = -0.75;
z = -0.4;
    event = DelOkEvent;
     skill3 = 0.6;
     skill4 = 0.2;
}

entity ConfirmEscDelete
{
type = <cancel.tga>;
view = camera;
scale_x =  0.015;
scale_y =  0.015;
x = 10;
y =  0.75;
z = -0.4;
    event = DelEscEvent;
     skill3 = 0.6;
     skill4 = 0.2;
}

entity ConfirmDelete
{
type = <delet_level.tga>;
view = camera;
scale_x =  0.015;
scale_y =  0.015;
x = 10;
y = 0;
z = 0;
}

entity ConfirmReplace
{
type = <replace_level.tga>;
view = camera;
scale_x =  0.015;
scale_y =  0.015;
x = 10;
y = 0;
z = 0;
}

function VisConFirmDel(Val)
{
ConfirmOkDelete.visible = val;
ConfirmEscDelete.visible = val;
ConfirmDelete.visible = val;

if (val)
{
	LlastEscFuc = on_esc;
	on_esc = EscDelete;
	LlastEnterFuc = on_enter;
	on_enter = OkiDelete;

}else
{

if (LlastEscFuc)
{
	on_esc = LlastEscFuc;
}
if (LlastEscFuc)
{
	on_enter = LlastEnterFuc;
}

}
}

function VisConFirmRep(Val)
{
ConfirmOkDelete.visible = val;
ConfirmEscDelete.visible = val;
ConfirmReplace.visible = val;

if (val)
{
	LlastEscFuc = on_esc;
	on_esc = EscReplace;
	LlastEnterFuc = on_enter;
	on_enter = OkiReplace;

}else
{

if (LlastEscFuc)
{
	on_esc = LlastEscFuc;
}
if (LlastEscFuc)
{
	on_enter = LlastEnterFuc;
}

}
}

entity SSavePict
{
type = <level0.tga>;
view = camera;
scale_x = 0.028;
scale_y = 0.020;
x = 10;
y = 1.5;
z = 0.4;
}

entity SSave1Txt
{
type = <SaveTxt1.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = 1.38;
}

entity SSave2Txt
{
type = <SaveTxt2.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = 1;
}

entity SSave3Txt
{
type = <SaveTxt3.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = 0.62;
}

entity SSave4Txt
{
type = <SaveTxt4.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = 0.24;
}

entity SSave5Txt
{
type = <SaveTxt5.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -0.14;
}

entity SSave6Txt
{
type = <SaveTxt6.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -0.52;
}

entity SSave7Txt
{
type = <SaveTxt7.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -0.9;
}

entity SSave8Txt
{
type = <SaveTxt8.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -1.28;
}

entity SSave9Txt
{
type = <SaveTxt9.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -1.66;
}

entity SSave10Txt
{
type = <SaveTxt10.tga>;
view = camera;
flags = bright;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -2.04;
}


function CancelSave(cmy)
{
me = 0;
you = cmy;

morph ( <cancel1.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <cancel.tga>, you);
	if (SCheckIfClick(you))
	{
	EscapeSave();
	}

}

function SLoadFun(cmy)
{
me = 0;
you = cmy;

morph ( <Load2.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <Load1.tga>, you);
	if (SCheckIfClick(you))
	{
	OkSave(0);
	}

}

function SSaveFun(cmy)
{
me = 0;
you = cmy;

morph ( <Save2.tga>, you);
while (mouse_left)
{
wait(1);
}
morph ( <Save1.tga>, you);
	if (SCheckIfClick(you))
	{

	if (SaveMorphScrn( LastSave.skill5))
	{
	VisConFirmRep(1);
	}else
	{
		OkSave(1);
	
	}
	}

}


function SSaveFunc(cmy)
{
me = 0;
you = cmy;
	if (LastSave == you)
	{
		return;
	}

morph ( <Savebtn2.tga>, you);
	if (LastSave)
	{
		LastSave.skill10=0;
	}
while (mouse_left)
{
	if (LastSave)
	{
		LastSave.skill1 += 20;
		LastSave.alpha = cos(LastSave.skill1)*10+30;
	}
wait(1);
}

SSSaveFunc(cmy);

}
entity SCancelBtn
{
type = <Cancel.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 2.6;
z = -2;
event = CancelSave;
skill3 = 0.6;
skill4 = 0.2;
}

entity SLoadBtn
{
type = <Load1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 2.1;
z = -1.45;
event = SLoadFun;
skill3 = 0.6;
skill4 = 0.2;
}

entity SSaveBtn
{
type = <Save1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0.85;
z = -1.45;
event = SSaveFun;
skill3 = 0.6;
skill4 = 0.2;
}

entity SSave1Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = 1.38;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 1; 
}

entity SSave2Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = 1.;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 2; 
}

entity SSave3Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = 0.62;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 3; 
}

entity SSave4Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = 0.24;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 4; 
}

entity SSave5Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -0.14;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 5; 
}

entity SSave6Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -0.52;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 6; 
}

entity SSave7Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -0.9;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 7; 
}

entity SSave8Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -1.28;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 8; 
}

entity SSave9Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -1.66;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 9; 
}

entity SSave10Btn
{
type = <saveBtn1.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = -1.9;
z = -2.04;
event = SSaveFunc;
skill3 = 1.3;
skill4 = 0.2;
skill5 = 10; 
}

entity SaveDialog
{
type = <savemain.tga>;
view = camera;
scale_x = 0.015;
scale_y = 0.015;
x = 10;
y = 0;
z = 0;
}

function SSave(kk)
{
	save ("Level", kk);
}

function LLoad(kk)
{
	load ("Levelt", kk);

}

	
function EntityRendr()
{
		render_entities = 0;
		wait(1);
       if (camera.arc != 60)
        {           
 	   morph ( <muasher.tga>, CPointer);
       }
       else
        {           
	   morph ( <Cursor.MDL>, CPointer);
	   }
		mesges.visible = 1;
		RePosGui();
//		nshowmessage("Level Loaded");
		LoadLevel(JustLoaded,2);
		SaveFuncHa = 0;
		if (JustLoaded.y)
		{
			msggdd( 1 );
		}else
		{
			ofses.y = WriteALine(mesges,-1);		
		}
}

function LoadTheSave(kk,Apper)
{	
	NewlevelOrloaded();
	if (SaveMorphScrn( kk))
	{
		LoadLevel(kk,0);
		JustLoaded = kk;
		JustLoaded.y = Apper;
		InitInput();
		render_entities = EntityRendr;
		SaveFuncHa = 1;
		LoadLevel(kk,1);
		//load ("Level", kk);
	}

}

function LLoadLastSave
{
	LoadTheSave(lastsaveid,1);
}

function SaveAll(kk,Apper)
{
	if (messionfailed != 0)||(MovieOrSucess != 0)
	{return;
	}
	lastsaveid = kk;
	if (kk)
	{
		wait(1);
		if (SaveFuncHa)
		{ return;}
		screenshot  "Level", kk;
		mesges.visible = 0;
		wait(1);
		if (SaveFuncHa)
		{ return;}
		SaveSizeScrn( "Level", kk);
		SaveLevel(kk);
		if (Apper)
		{
			msggdd( 0);
		}
		mesges.visible = 1;
	}

}

function OkSave(val)
{
var kk==0;
if (LastSave)
{
	kk =LastSave.skill5;
}
VisSaveDialog(0);
VisMainMenu(0);
if (val)
{		
		SaveAll(kk,1);
}else
{
		LoadTheSave(kk,1);
}
}

function EscapeSave()
{
		VisSaveDialog(0);
}


function VisSaveDialog(val)
{
	LastSave = 0;


SCancelBtn.visible = val;
SSavePict.visible = val;
if (val==0)
{
	SRemoveBtn.visible = val;
	SSaveBtn.visible = val;
	SLoadBtn.visible = val;
}
morph ( <Savebtn1.tga>, SSave1Btn);
morph ( <Savebtn1.tga>, SSave2Btn);
morph ( <Savebtn1.tga>, SSave3Btn);
morph ( <Savebtn1.tga>, SSave4Btn);
morph ( <Savebtn1.tga>, SSave5Btn);
morph ( <Savebtn1.tga>, SSave6Btn);
morph ( <Savebtn1.tga>, SSave7Btn);
morph ( <Savebtn1.tga>, SSave8Btn);
morph ( <Savebtn1.tga>, SSave9Btn);
morph ( <Savebtn1.tga>, SSave10Btn);
SSave1Btn.visible = val;
SSave2Btn.visible = val;
SSave3Btn.visible = val;
SSave4Btn.visible = val;
SSave5Btn.visible = val;
SSave6Btn.visible = val;
SSave7Btn.visible = val;
SSave8Btn.visible = val;
SSave9Btn.visible = val;
SSave10Btn.visible = val;

SSave1Txt.visible = val;
SSave2Txt.visible = val;
SSave3Txt.visible = val;
SSave4Txt.visible = val;
SSave5Txt.visible = val;
SSave6Txt.visible = val;
SSave7Txt.visible = val;
SSave8Txt.visible = val;
SSave9Txt.visible = val;
SSave10Txt.visible = val;

SaveDialog.visible = val;

if (val)
{
	AlphaMainMenu(0);
	CVMorph( SSavePict, "level", 0);
	lastEscFuc = on_esc;
	on_esc = EscapeSave;
	lastEnterFuc = on_enter;
	on_enter = 0;

	morph ( <WCursor.tga>, MouseFlare);
	MouseFlare.alpha = 100;
	wait(2);
	MouseFlare.alpha = 100;
	FDate2Ent( SSave1Txt, "level", 1);
	FDate2Ent( SSave2Txt, "level", 2);
	FDate2Ent( SSave3Txt, "level", 3);
	FDate2Ent( SSave4Txt, "level", 4);
	FDate2Ent( SSave5Txt, "level", 5);
	FDate2Ent( SSave6Txt, "level", 6);
	FDate2Ent( SSave7Txt, "level", 7);
	FDate2Ent( SSave8Txt, "level", 8);
	FDate2Ent( SSave9Txt, "level", 9);
	FDate2Ent( SSave10Txt, "level", 10);
	morph ( <Cursor.tga>, MouseFlare);


}else
{
	AlphaMainMenu(100);

if (lastEscFuc)
{
	on_esc = lastEscFuc;
}
if (lastEscFuc)
{
	on_enter = lastEnterFuc;
}

}

}

function SSSaveFunc(cmy)
{
me = 0;
you = cmy;
	if (LastSave)
	{
		LastSave.alpha = 100;
	}
	if (SCheckIfClick(you))
	{
	if (player)
	{
	 entiy =  Pointer_To_Entity( player.BodyLnk);

	 SSaveBtn.visible = ((entiy._health<-100)==0)&&(messionfailed == 0)&&(MovieOrSucess == 0);
	}else
	{
	 SSaveBtn.visible = 1;	
	}

	if (LastSave)
	{
	morph ( <Savebtn1.tga>, LastSave);
	}
	LastSave = you;
	if (SaveMorphScrn( LastSave.skill5))
	{
	SRemoveBtn.visible = 1;
	SLoadBtn.visible = 1;
	morph ( <WCursor.tga>, MouseFlare);
	MouseFlare.alpha = 100;
	wait(2);
	MouseFlare.alpha = 100;
	CVMorph( SSavePict, "level", LastSave.skill5);
	morph ( <Cursor.tga>, MouseFlare);
	play_sound( OkiSound, 100);

	}else
	{
	SRemoveBtn.visible = 0;
	SLoadBtn.visible = 0;
	
	}
	}else
	{
	morph ( <Savebtn1.tga>, you);
	
	}

}

function OkiDelete()
{
		SRemoveBtn.visible = 0;
		SLoadBtn.visible = 0;
		LDeleteV( LastSave.LeaderId, "level", LastSave.skill5);
		//morph ( <Savebtn1.tga>, LastSave);
		play_sound( OkiSound, 100);
		VisConFirmDel(0); 

}

function OkiReplace()
{
		VisConFirmRep(0); 
		OkSave(1);
}
