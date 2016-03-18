function repairThisSpot(item, zone, dam)
{
   trace("CURRENT SELECTED CREW!!! " + currentSelectedCrew);
   if(this.main["menu-repair"]["menu-damage-box"][item].damage == "on" && this.main["menu-repair"]["menu-damage-box"][item].repaired != "on")
   {
      _root.soundBox.playSound("repairSND");
      this.main["menu-repair"]["menu-damage-box"][game.crew[game.crewOrder[currentSelectedCrew]].repaired].repaired = "off";
      this.main["menu-repair"]["menu-damage-box"][game.crew[game.crewOrder[currentSelectedCrew]].repaired].repaorIcon.removeMovieClip();
      this.main["menu-repair"]["menu-damage-box"][item].repaired = "on";
      game.crew[game.crewOrder[currentSelectedCrew]].repaired = item;
      game.crew[game.crewOrder[currentSelectedCrew]].repairedZone = zone;
      game.crew[game.crewOrder[currentSelectedCrew]].repairedDam = dam;
      this.main["menu-repair"]["menu-damage-box"][item].attachMovie("icon-repair","repaorIcon",this.main["menu-repair"]["menu-damage-box"][item].getNextHighestDepth());
      this.main["menu-repair"]["menu-damage-box"][item].repaorIcon._x = 39;
      this.main["menu-repair"]["menu-damage-box"][item].repaorIcon._y = 39;
   }
   currentSelectedCrew++;
   if(currentSelectedCrew == game.crewOrder.length)
   {
      currentSelectedCrew = 0;
   }
   while(game.crew[game.crewOrder[currentSelectedCrew]].crewStatus == "knocked out")
   {
      currentSelectedCrew++;
      if(currentSelectedCrew == game.crewOrder.length)
      {
         currentSelectedCrew = 0;
      }
   }
   this.main["menu-repair"]["menu-action-crew-frame"]._x = 60;
   this.main["menu-repair"]["menu-action-crew-frame"]._y = 60 + 130 * currentSelectedCrew;
}
onMouseDown = function()
{
   mouseClick = true;
};
onMouseUp = function()
{
   if(mouseClick == true)
   {
      if(this.main["menu-repair"].begin._xmouse > 0 && this.main["menu-repair"].begin._xmouse < this.main["menu-repair"].begin._width && this.main["menu-repair"].begin._ymouse > 0 && this.main["menu-repair"].begin._ymouse < this.main["menu-repair"].begin._height)
      {
         _root.soundBox.playSound("clickSND");
         this.main["menu-repair"].removeMovieClip();
         varRefresh();
         trace("BATTLEBOT INFORMATION");
         trace("BATTLEBOT 0 " + game.battleBots[0].status);
         trace("BATTLEBOT 1 " + game.battleBots[1].status);
         trace("SHIP 0 " + game.ship[0].battleBots);
         trace("SHIP 2 " + game.ship[2].battleBots);
         game.ship[0].battleBots = null;
         if(game.battleBots[0].status == "ready")
         {
            game.ship[0].battleBots = 0;
         }
         game.ship[2].battleBots = null;
         if(game.battleBots[1].status == "ready")
         {
            game.ship[2].battleBots = 1;
         }
         a = 0;
         while(a < game.crewOrder.length)
         {
            trace("CHECK CHECK " + game.crew[game.crewOrder[a]].repairedDam);
            if(game.crew[game.crewOrder[a]].repairedDam == "bot")
            {
               if(game.crew[game.crewOrder[a]].repairedZone == 0)
               {
                  game.ship[0].battleBots = 0;
                  game.battleBots[0].status = "ready";
               }
               if(game.crew[game.crewOrder[a]].repairedZone == 2)
               {
                  game.ship[2].battleBots = 1;
                  game.battleBots[1].status = "ready";
               }
            }
            else
            {
               game.ship[game.crew[game.crewOrder[a]].repairedZone].damageInflict = deleteFromArray(game.ship[game.crew[game.crewOrder[a]].repairedZone].damageInflict,game.crew[game.crewOrder[a]].repairedDam);
            }
            a++;
         }
         tempSheilds = [game.ship[0].shields,game.ship[1].shields,game.ship[2].shields];
         tempEnergy = [game.ship[0].energy,game.ship[1].energy,game.ship[2].energy];
         a = 0;
         while(a < 3)
         {
            b = 0;
            while(b < game.ship[a].damageInflict.length)
            {
               damageType = game.ship[a].damageChipsLibrary[game.ship[a].damageInflict[b]];
               game.ship[a].damageChipsRandomizer = deleteFromArray(game.ship[a].damageChipsRandomizer,game.ship[a].damageInflict[b]);
               if(damageType == "shield")
               {
                  tempSheilds[a]--;
               }
               if(damageType == "energy")
               {
                  tempEnergy[a]--;
               }
               b++;
            }
            a++;
         }
         this.main.attachMovie("menu-missionSetup","menu-missionSetup",this.main.getNextHighestDepth());
         this.main.attachMovie("ship","ship",this.main.getNextHighestDepth());
         this.main.ship._x = 94;
         this.main.ship._y = 283;
         this.main.ship._alpha = 0;
         this.main.createEmptyMovieClip("stuff",this.main.getNextHighestDepth());
         this.main.createEmptyMovieClip("elevator",this.main.getNextHighestDepth());
         this.main.createEmptyMovieClip("crew",this.main.getNextHighestDepth());
         this.main.createEmptyMovieClip("fighters",this.main.getNextHighestDepth());
         this.main.createEmptyMovieClip("effects",this.main.getNextHighestDepth());
         this.main.createEmptyMovieClip("damage",this.main.getNextHighestDepth());
         animDrawShip(tempEnergy[0],tempEnergy[1],tempEnergy[2],tempSheilds[0],tempSheilds[1],tempSheilds[2],game.ship[0].battleBots,game.ship[2].battleBots);
         gotoAndStop("missionSetup");
         play();
      }
      a = 0;
      while(a < 5)
      {
         if(this.main["menu-repair"]["menu-crew" + a]._xmouse > 0 && this.main["menu-repair"]["menu-crew" + a]._xmouse < this.main["menu-repair"]["menu-crew" + a]._width && this.main["menu-repair"]["menu-crew" + a]._ymouse > 0 && this.main["menu-repair"]["menu-crew" + a]._ymouse < this.main["menu-repair"]["menu-crew" + a]._height)
         {
            _root.soundBox.playSound("clickSND");
            if(game.crew[game.crewOrder[a]].crewStatus != "knocked out")
            {
               currentSelectedCrew = a;
               this.main["menu-repair"]["menu-action-crew-frame"]._y = 60 + 130 * a;
            }
         }
         a++;
      }
      if(currentSelectedCrew != null)
      {
         if(this.main["menu-repair"]["menu-damage-box"].r0._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].r0._xmouse < this.main["menu-repair"]["menu-damage-box"].r0._width && this.main["menu-repair"]["menu-damage-box"].r0._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].r0._ymouse < this.main["menu-repair"]["menu-damage-box"].r0._height)
         {
            repairThisSpot("r0",0,0);
         }
         if(this.main["menu-repair"]["menu-damage-box"].r1._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].r1._xmouse < this.main["menu-repair"]["menu-damage-box"].r1._width && this.main["menu-repair"]["menu-damage-box"].r1._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].r1._ymouse < this.main["menu-repair"]["menu-damage-box"].r1._height)
         {
            repairThisSpot("r1",0,1);
         }
         if(this.main["menu-repair"]["menu-damage-box"].r2._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].r2._xmouse < this.main["menu-repair"]["menu-damage-box"].r2._width && this.main["menu-repair"]["menu-damage-box"].r2._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].r2._ymouse < this.main["menu-repair"]["menu-damage-box"].r2._height)
         {
            repairThisSpot("r2",0,2);
         }
         if(this.main["menu-repair"]["menu-damage-box"].r3._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].r3._xmouse < this.main["menu-repair"]["menu-damage-box"].r3._width && this.main["menu-repair"]["menu-damage-box"].r3._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].r3._ymouse < this.main["menu-repair"]["menu-damage-box"].r3._height)
         {
            repairThisSpot("r3",0,3);
         }
         if(this.main["menu-repair"]["menu-damage-box"].r4._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].r4._xmouse < this.main["menu-repair"]["menu-damage-box"].r4._width && this.main["menu-repair"]["menu-damage-box"].r4._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].r4._ymouse < this.main["menu-repair"]["menu-damage-box"].r4._height)
         {
            repairThisSpot("r4",0,4);
         }
         if(this.main["menu-repair"]["menu-damage-box"].r5._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].r5._xmouse < this.main["menu-repair"]["menu-damage-box"].r5._width && this.main["menu-repair"]["menu-damage-box"].r5._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].r5._ymouse < this.main["menu-repair"]["menu-damage-box"].r5._height)
         {
            repairThisSpot("r5",0,5);
         }
         if(this.main["menu-repair"]["menu-damage-box"].w0._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].w0._xmouse < this.main["menu-repair"]["menu-damage-box"].w0._width && this.main["menu-repair"]["menu-damage-box"].w0._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].w0._ymouse < this.main["menu-repair"]["menu-damage-box"].w0._height)
         {
            repairThisSpot("w0",1,0);
         }
         if(this.main["menu-repair"]["menu-damage-box"].w1._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].w1._xmouse < this.main["menu-repair"]["menu-damage-box"].w1._width && this.main["menu-repair"]["menu-damage-box"].w1._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].w1._ymouse < this.main["menu-repair"]["menu-damage-box"].w1._height)
         {
            repairThisSpot("w1",1,1);
         }
         if(this.main["menu-repair"]["menu-damage-box"].w2._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].w2._xmouse < this.main["menu-repair"]["menu-damage-box"].w2._width && this.main["menu-repair"]["menu-damage-box"].w2._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].w2._ymouse < this.main["menu-repair"]["menu-damage-box"].w2._height)
         {
            repairThisSpot("w2",1,2);
         }
         if(this.main["menu-repair"]["menu-damage-box"].w3._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].w3._xmouse < this.main["menu-repair"]["menu-damage-box"].w3._width && this.main["menu-repair"]["menu-damage-box"].w3._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].w3._ymouse < this.main["menu-repair"]["menu-damage-box"].w3._height)
         {
            repairThisSpot("w3",1,3);
         }
         if(this.main["menu-repair"]["menu-damage-box"].w4._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].w4._xmouse < this.main["menu-repair"]["menu-damage-box"].w4._width && this.main["menu-repair"]["menu-damage-box"].w4._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].w4._ymouse < this.main["menu-repair"]["menu-damage-box"].w4._height)
         {
            repairThisSpot("w4",1,4);
         }
         if(this.main["menu-repair"]["menu-damage-box"].w5._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].w5._xmouse < this.main["menu-repair"]["menu-damage-box"].w5._width && this.main["menu-repair"]["menu-damage-box"].w5._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].w5._ymouse < this.main["menu-repair"]["menu-damage-box"].w5._height)
         {
            repairThisSpot("w5",1,5);
         }
         if(this.main["menu-repair"]["menu-damage-box"].b0._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].b0._xmouse < this.main["menu-repair"]["menu-damage-box"].b0._width && this.main["menu-repair"]["menu-damage-box"].b0._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].b0._ymouse < this.main["menu-repair"]["menu-damage-box"].b0._height)
         {
            repairThisSpot("b0",2,0);
         }
         if(this.main["menu-repair"]["menu-damage-box"].b1._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].b1._xmouse < this.main["menu-repair"]["menu-damage-box"].b1._width && this.main["menu-repair"]["menu-damage-box"].b1._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].b1._ymouse < this.main["menu-repair"]["menu-damage-box"].b1._height)
         {
            repairThisSpot("b1",2,1);
         }
         if(this.main["menu-repair"]["menu-damage-box"].b2._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].b2._xmouse < this.main["menu-repair"]["menu-damage-box"].b2._width && this.main["menu-repair"]["menu-damage-box"].b2._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].b2._ymouse < this.main["menu-repair"]["menu-damage-box"].b2._height)
         {
            repairThisSpot("b2",2,2);
         }
         if(this.main["menu-repair"]["menu-damage-box"].b3._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].b3._xmouse < this.main["menu-repair"]["menu-damage-box"].b3._width && this.main["menu-repair"]["menu-damage-box"].b3._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].b3._ymouse < this.main["menu-repair"]["menu-damage-box"].b3._height)
         {
            repairThisSpot("b3",2,3);
         }
         if(this.main["menu-repair"]["menu-damage-box"].b4._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].b4._xmouse < this.main["menu-repair"]["menu-damage-box"].b4._width && this.main["menu-repair"]["menu-damage-box"].b4._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].b4._ymouse < this.main["menu-repair"]["menu-damage-box"].b4._height)
         {
            repairThisSpot("b4",2,4);
         }
         if(this.main["menu-repair"]["menu-damage-box"].b5._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].b5._xmouse < this.main["menu-repair"]["menu-damage-box"].b5._width && this.main["menu-repair"]["menu-damage-box"].b5._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].b5._ymouse < this.main["menu-repair"]["menu-damage-box"].b5._height)
         {
            repairThisSpot("b5",2,5);
         }
         if(this.main["menu-repair"]["menu-damage-box"].bb._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].bb._xmouse < this.main["menu-repair"]["menu-damage-box"].bb._width && this.main["menu-repair"]["menu-damage-box"].bb._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].bb._ymouse < this.main["menu-repair"]["menu-damage-box"].bb._height)
         {
            repairThisSpot("bb",2,"bot");
         }
         if(this.main["menu-repair"]["menu-damage-box"].rb._xmouse > 0 && this.main["menu-repair"]["menu-damage-box"].rb._xmouse < this.main["menu-repair"]["menu-damage-box"].rb._width && this.main["menu-repair"]["menu-damage-box"].rb._ymouse > 0 && this.main["menu-repair"]["menu-damage-box"].rb._ymouse < this.main["menu-repair"]["menu-damage-box"].rb._height)
         {
            repairThisSpot("rb",0,"bot");
         }
      }
   }
};
