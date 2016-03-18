function addEgg(zone, deck, num)
{
   Xcoord = game.coordinateLocations[zone][deck].center[0] + this.main.ship._x + calculateRandom(0,70) - 70;
   Ycoord = game.coordinateLocations[zone][deck].center[1] + this.main.ship._y + calculateRandom(0,70) - 35;
   this.main.crew.attachMovie("egg","egg" + num,Ycoord * 1000 + Xcoord);
   this.main.crew["egg" + num]._x = Xcoord;
   this.main.crew["egg" + num]._y = Ycoord;
   this.main.crew["egg" + num]._xscale = 75;
   this.main.crew["egg" + num]._yscale = 75;
}
function animRunFunction(animationArray)
{
   if(animationArray[0] == "addThreat")
   {
      _root.soundBox.playSound("redalertSND");
      animDrawThreat(animationArray[1],animationArray[2],animationArray[3],animationArray[4],animationArray[5]);
      game.animationGoal = true;
   }
   if(animationArray[0] == "warpIn")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
      }
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 10)
      {
         _root.soundBox.playSound("teleport");
         this.main.effects.attachMovie("warp","warp",this.main.effects.getNextHighestDepth());
         this.main.effects.warp._x = 388.5;
         this.main.effects.warp._y = 477;
      }
      if(game.animationTimer == 17)
      {
         animDrawShip(animationArray[1],animationArray[2],animationArray[3],animationArray[4],animationArray[5],animationArray[6],animationArray[7],animationArray[8]);
         this.main.ship.PC.gotoAndPlay("saver");
      }
      if(this.main.effects.warp._x == null && game.animationTimer > 10)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "moveTurnCounter")
   {
      this.main["turnMarker" + (animationArray[1] - 1)].gotoAndStop("off");
      this.main["turnMarker" + animationArray[1]].gotoAndStop("on");
      game.animationGoal = true;
   }
   if(animationArray[0] == "postMessage")
   {
      if(game.animationTimer == null)
      {
         if(animationArray[2] != null)
         {
            game.animationTimer = animationArray[2];
         }
         else
         {
            game.animationTimer = 14;
         }
         this.main.attachMovie("messageBox","messageBox",this.main.getNextHighestDepth());
         this.main.messageBox._x = 280;
         this.main.messageBox._y = 230;
         this.main.messageBox.textArea.note = animationArray[1];
         this.main.messageBox.textArea._y = this.main.messageBox._height / 2 - this.main.messageBox.textArea._height / 2;
      }
      game.animationTimer--;
      if(game.animationTimer < 0)
      {
         this.main.messageBox.removeMovieClip();
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "moveZone")
   {
      if(game.animationTimer == null)
      {
         this.main.crew["crew" + animationArray[1]].gotoAndPlay("run");
         _root.soundBox.playSoundLoop("footstepSND");
         if(animationArray[2] != null)
         {
            _root.soundBox.playSoundLoop("doubleWalkSND");
         }
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndPlay("run");
         }
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               this.main.crew["crew" + animationArray[4][fa][0]].gotoAndPlay("run");
               if(animationArray[4][fa][1] != null)
               {
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot1.gotoAndPlay("run");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot2.gotoAndPlay("run");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot3.gotoAndPlay("run");
               }
               fa++;
            }
         }
         game.animationTimer = 0;
         endX = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][0] + this.main.ship._x;
         endY = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][1] + this.main.ship._y;
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               this["sub" + fa + "flag"] = false;
               this["sub" + fa + "endX"] = game.coordinateLocations[animationArray[5][0]][animationArray[5][1]][animationArray[5][2] + "" + (animationArray[5][3] + fa)][0] + this.main.ship._x;
               this["sub" + fa + "endY"] = game.coordinateLocations[animationArray[5][0]][animationArray[5][1]][animationArray[5][2] + "" + (animationArray[5][3] + fa)][1] + this.main.ship._y;
               fa++;
            }
         }
      }
      if(game.animationTimer == 0)
      {
         if(animationArray[5][0] == 0)
         {
            if(animationArray[3][0] == 2)
            {
               door = 2;
            }
            else
            {
               door = 0;
            }
         }
         else if(animationArray[3][0] == 0)
         {
            door = 0;
         }
         else
         {
            door = 2;
         }
         targetX = game.coordinateLocations[door][animationArray[3][1]].door[0] + this.main.ship._x;
         targetY = game.coordinateLocations[door][animationArray[3][1]].door[1] + this.main.ship._y;
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 2)
      {
         targetX = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][0] + this.main.ship._x;
         targetY = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][1] + this.main.ship._y;
         game.animationTimer = game.animationTimer + 1;
      }
      moveClip(this.main.crew["crew" + animationArray[1]],targetX,targetY,7);
      if(animationArray[2] != null)
      {
         subTargetX = targetX;
         subTargetY = targetY - 12;
         moveClip(this.main.crew["battlebots" + animationArray[2]],subTargetX,subTargetY,7);
      }
      if(animationArray[4][0][0] != null)
      {
         fa = 0;
         while(fa < animationArray[4].length)
         {
            moveClip(this.main.crew["crew" + animationArray[4][fa][0]],this["sub" + fa + "endX"],this["sub" + fa + "endY"],7);
            if(animationArray[4][fa][1] != null)
            {
               this["sub" + fa + "TargetX"] = this["sub" + fa + "endX"];
               this["sub" + fa + "TargetY"] = this["sub" + fa + "endY"] - 12;
               moveClip(this.main.crew["battlebots" + animationArray[4][fa][1]],this["sub" + fa + "TargetX"],this["sub" + fa + "TargetY"],7);
            }
            if(this.main.crew["crew" + animationArray[4][fa][0]]._x == this["sub" + fa + "endX"] && this.main.crew["crew" + animationArray[4][fa][0]]._y == this["sub" + fa + "endY"] && this["sub" + fa + "flag"] == false)
            {
               this.main.crew["crew" + animationArray[4][fa][0]].gotoAndPlay("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot1.gotoAndPlay("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot2.gotoAndPlay("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot3.gotoAndPlay("stand");
               this["sub" + fa + "flag"] = true;
            }
            fa++;
         }
      }
      if(this.main.crew["crew" + animationArray[1]]._x == targetX && this.main.crew["crew" + animationArray[1]]._y == targetY)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(this.main.crew["crew" + animationArray[1]]._x == endX && this.main.crew["crew" + animationArray[1]]._y == endY)
      {
         this.main.crew["crew" + animationArray[1]].gotoAndStop("stand");
         _root.soundBox.stopSoundLoop();
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndStop("stand");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndStop("stand");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndStop("stand");
         }
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               pass = true;
               if(this["sub" + fa + "flag"] == false)
               {
                  pass = false;
               }
               fa++;
            }
            if(pass == true)
            {
               game.animationTimer = null;
               game.animationGoal = true;
            }
         }
         else
         {
            game.animationTimer = null;
            game.animationGoal = true;
         }
      }
   }
   if(animationArray[0] == "moveDeck")
   {
      if(game.animationTimer == null)
      {
         trace("START **** ");
         if(animationArray[3][1] == 0)
         {
            startDeck = 1;
         }
         else
         {
            startDeck = 0;
         }
         game.animationTimer = 0;
         endX = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][0] + this.main.ship._x;
         endY = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][1] + this.main.ship._y;
         targetX = endX;
         targetY = endY;
         trace("end " + endX + " " + endY);
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               this["sub" + fa + "flag"] = false;
               this["sub" + fa + "endX"] = game.coordinateLocations[animationArray[5][0]][animationArray[5][1]][animationArray[5][2] + "" + (animationArray[5][3] + fa)][0] + this.main.ship._x;
               this["sub" + fa + "endY"] = game.coordinateLocations[animationArray[5][0]][animationArray[5][1]][animationArray[5][2] + "" + (animationArray[5][3] + fa)][1] + this.main.ship._y;
               fa++;
            }
         }
      }
      if(game.animationTimer == 0)
      {
         trace(" 0 **** ");
         trace("AT CHECK elevTarget Y " + elevTargetY + "   current Y " + this.main.elevator["elevator" + animationArray[3][0]]._y);
         if(this.main.elevator["elevator" + animationArray[3][0]]._y == game.coordinateLocations[animationArray[3][0]][animationArray[5][1]].grav[3])
         {
            game.animationTimer = game.animationTimer + 1;
         }
         else
         {
            elevTargetX = game.coordinateLocations[animationArray[3][0]][animationArray[5][1]].grav[2];
            elevTargetY = game.coordinateLocations[animationArray[3][0]][animationArray[5][1]].grav[3];
            trace("elevTarget1 " + elevTargetX + " " + elevTargetY);
         }
      }
      if(game.animationTimer == 1)
      {
         trace(" 1 **** ");
         this.main.crew["crew" + animationArray[1]].gotoAndPlay("run");
         _root.soundBox.playSoundLoop("footstepSND");
         if(animationArray[2] != null)
         {
            _root.soundBox.playSoundLoop("doubleWalkSND");
         }
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndPlay("run");
         }
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               this.main.crew["crew" + animationArray[4][fa][0]].gotoAndPlay("run");
               if(animationArray[4][fa][1] != null)
               {
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot1.gotoAndPlay("run");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot2.gotoAndPlay("run");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot3.gotoAndPlay("run");
               }
               fa++;
            }
         }
         targetX = game.coordinateLocations[animationArray[3][0]][animationArray[5][1]].grav[0] + this.main.ship._x;
         targetY = game.coordinateLocations[animationArray[3][0]][animationArray[5][1]].grav[1] + this.main.ship._y;
         trace("target1 " + targetX + " " + targetY);
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 3)
      {
         trace(" 2 **** ");
         this.main.crew["crew" + animationArray[1]].gotoAndStop("stand");
         _root.soundBox.stopSoundLoop();
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndPlay("stand");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndPlay("stand");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndPlay("stand");
         }
         targetX = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]].grav[0] + this.main.ship._x;
         targetY = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]].grav[1] + this.main.ship._y;
         elevTargetX = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]].grav[2];
         elevTargetY = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]].grav[3];
         trace("target2 " + targetX + " " + targetY);
         trace("elevTarget2 " + elevTargetX + " " + elevTargetY);
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 5)
      {
         trace(" 3 **** ");
         this.main.crew["crew" + animationArray[1]].gotoAndPlay("run");
         _root.soundBox.playSoundLoop("footstepSND");
         if(animationArray[2] != null)
         {
            _root.soundBox.playSoundLoop("doubleWalkSND");
         }
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndPlay("run");
         }
         targetX = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][0] + this.main.ship._x;
         targetY = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][1] + this.main.ship._y;
         trace("target3 " + targetX + " " + targetY);
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 0 || game.animationTimer == 4)
      {
         trace(" 4 **** ");
         moveClip(this.main.elevator["elevator" + animationArray[3][0]],elevTargetX,elevTargetY,7);
         trace("elevTarget Y " + elevTargetY + "   current Y " + this.main.elevator["elevator" + animationArray[3][0]]._y);
      }
      if(game.animationTimer != 0)
      {
         trace(" 5 **** ");
         moveClip(this.main.crew["crew" + animationArray[1]],targetX,targetY,7);
         if(animationArray[2] != null)
         {
            subTargetX = targetX;
            subTargetY = targetY - 12;
            moveClip(this.main.crew["battlebots" + animationArray[2]],subTargetX,subTargetY,7);
         }
      }
      if(this.main.crew["crew" + animationArray[1]]._x == targetX && this.main.crew["crew" + animationArray[1]]._y == targetY)
      {
         trace(" 6 **** ");
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer > 0)
      {
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               moveClip(this.main.crew["crew" + animationArray[4][fa][0]],this["sub" + fa + "endX"],this["sub" + fa + "endY"],7);
               if(animationArray[4][fa][1] != null)
               {
                  this["sub" + fa + "TargetX"] = this["sub" + fa + "endX"];
                  this["sub" + fa + "TargetY"] = this["sub" + fa + "endY"] - 12;
                  moveClip(this.main.crew["battlebots" + animationArray[4][fa][1]],this["sub" + fa + "TargetX"],this["sub" + fa + "TargetY"],7);
               }
               if(this.main.crew["crew" + animationArray[4][fa][0]]._x == this["sub" + fa + "endX"] && this.main.crew["crew" + animationArray[4][fa][0]]._y == this["sub" + fa + "endY"] && this["sub" + fa + "flag"] == false)
               {
                  this.main.crew["crew" + animationArray[4][fa][0]].gotoAndPlay("stand");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot1.gotoAndPlay("stand");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot2.gotoAndPlay("stand");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot3.gotoAndPlay("stand");
                  this["sub" + fa + "flag"] = true;
               }
               fa++;
            }
         }
      }
      if(this.main.crew["crew" + animationArray[1]]._x == endX && this.main.crew["crew" + animationArray[1]]._y == endY)
      {
         trace(" END **** ");
         this.main.crew["crew" + animationArray[1]].gotoAndStop("stand");
         _root.soundBox.stopSoundLoop();
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndStop("stand");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndStop("stand");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndStop("stand");
         }
         elevTargetY = null;
         elevTargetX = null;
         targetX = null;
         targetY = null;
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               pass = true;
               if(this["sub" + fa + "flag"] == false)
               {
                  pass = false;
               }
               fa++;
            }
            if(pass == true)
            {
               game.animationTimer = null;
               game.animationGoal = true;
            }
         }
         else
         {
            game.animationTimer = null;
            game.animationGoal = true;
         }
      }
   }
   if(animationArray[0] == "wait")
   {
      if(game.animationTimer == null)
      {
         this.main.crew["crew" + animationArray[1]].gotoAndPlay("run");
         _root.soundBox.playSoundLoop("footstepSND");
         if(animationArray[2] != null)
         {
            _root.soundBox.playSoundLoop("doubleWalkSND");
         }
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndPlay("run");
         }
         trace("length " + animationArray[4].length);
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               this.main.crew["crew" + animationArray[4][fa][0]].gotoAndPlay("run");
               if(animationArray[4][fa][1] != null)
               {
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot1.gotoAndPlay("run");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot2.gotoAndPlay("run");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot3.gotoAndPlay("run");
               }
               fa++;
            }
         }
         game.animationTimer = 0;
         endX = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][0] + this.main.ship._x;
         endY = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][1] + this.main.ship._y;
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               this["sub" + fa + "flag"] = false;
               this["sub" + fa + "endX"] = game.coordinateLocations[animationArray[5][0]][animationArray[5][1]][animationArray[5][2] + "" + (animationArray[5][3] + fa)][0] + this.main.ship._x;
               this["sub" + fa + "endY"] = game.coordinateLocations[animationArray[5][0]][animationArray[5][1]][animationArray[5][2] + "" + (animationArray[5][3] + fa)][1] + this.main.ship._y;
               fa++;
            }
         }
      }
      moveClip(this.main.crew["crew" + animationArray[1]],endX,endY,7);
      if(animationArray[2] != null)
      {
         subTargetX = endX;
         subTargetY = endY - 12;
         moveClip(this.main.crew["battlebots" + animationArray[2]],subTargetX,subTargetY,7);
      }
      if(animationArray[4][0][0] != null)
      {
         fa = 0;
         while(fa < animationArray[4].length)
         {
            moveClip(this.main.crew["crew" + animationArray[4][fa][0]],this["sub" + fa + "endX"],this["sub" + fa + "endY"],7);
            if(animationArray[4][fa][1] != null)
            {
               this["sub" + fa + "TargetX"] = this["sub" + fa + "endX"];
               this["sub" + fa + "TargetY"] = this["sub" + fa + "endY"] - 12;
               moveClip(this.main.crew["battlebots" + animationArray[4][fa][1]],this["sub" + fa + "TargetX"],this["sub" + fa + "TargetY"],7);
            }
            if(this.main.crew["crew" + animationArray[4][fa][0]]._x == this["sub" + fa + "endX"] && this.main.crew["crew" + animationArray[4][fa][0]]._y == this["sub" + fa + "endY"] && this["sub" + fa + "flag"] == false)
            {
               trace("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  " + fa);
               this["sub" + fa + "flag"] = true;
               this.main.crew["crew" + animationArray[4][fa][0]].gotoAndStop("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot1.gotoAndStop("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot2.gotoAndStop("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot3.gotoAndStop("stand");
            }
            fa++;
         }
      }
      if(this.main.crew["crew" + animationArray[1]]._x == endX && this.main.crew["crew" + animationArray[1]]._y == endY)
      {
         this.main.crew["crew" + animationArray[1]].gotoAndStop("stand");
         _root.soundBox.stopSoundLoop();
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndStop("stand");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndStop("stand");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndStop("stand");
         }
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               pass = true;
               if(this["sub" + fa + "flag"] == false)
               {
                  pass = false;
               }
               fa++;
            }
            if(pass == true)
            {
               game.animationTimer = null;
               game.animationGoal = true;
            }
         }
         else
         {
            game.animationTimer = null;
            game.animationGoal = true;
         }
      }
   }
   if(animationArray[0] == "moveThreatTraker")
   {
      if(this.main.threats["threat-tracker" + animationArray[1]]._y == this.main.threats["threatTrack-" + animationArray[2] + "-" + animationArray[3]]._y - 6 || animationArray[3] < 0)
      {
         game.animationGoal = true;
      }
      else
      {
         this.main.threats["threat-tracker" + animationArray[1]]._y = this.main.threats["threat-tracker" + animationArray[1]]._y + 2;
         if(this.main.threats["threat-tracker" + animationArray[1]]._y > this.main.threats["threatTrack-" + animationArray[2] + "-" + animationArray[3]]._y - 6)
         {
            this.main.threats["threat-tracker" + animationArray[1]]._y = this.main.threats["threatTrack-" + animationArray[2] + "-" + animationArray[3]]._y - 6;
         }
      }
   }
   if(animationArray[0] == "endThreatMove")
   {
      this.main.threats["threat-tracker" + animationArray[1]].removeMovieClip();
      this.main.threats["threatDisplay" + animationArray[1]].gotoAndStop("survived");
      game.animationGoal = true;
   }
   if(animationArray[0] == "pushButton")
   {
      if(game.animationTimer == null)
      {
         this.main.crew["crew" + animationArray[1]].gotoAndPlay("run");
         _root.soundBox.playSoundLoop("footstepSND");
         if(animationArray[2] != null)
         {
            _root.soundBox.playSoundLoop("doubleWalkSND");
         }
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndPlay("run");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndPlay("run");
         }
         trace("length " + animationArray[4].length);
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               this.main.crew["crew" + animationArray[4][fa][0]].gotoAndPlay("run");
               if(animationArray[4][fa][1] != null)
               {
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot1.gotoAndPlay("run");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot2.gotoAndPlay("run");
                  this.main.crew["battlebots" + animationArray[4][fa][1]].bot3.gotoAndPlay("run");
               }
               fa++;
            }
         }
         game.animationTimer = 0;
         endX = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][0] + this.main.ship._x;
         endY = game.coordinateLocations[animationArray[3][0]][animationArray[3][1]][animationArray[3][2] + "" + animationArray[3][3]][1] + this.main.ship._y;
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               this["sub" + fa + "flag"] = false;
               this["sub" + fa + "endX"] = game.coordinateLocations[animationArray[5][0]][animationArray[5][1]][animationArray[5][2] + "" + (animationArray[5][3] + fa)][0] + this.main.ship._x;
               this["sub" + fa + "endY"] = game.coordinateLocations[animationArray[5][0]][animationArray[5][1]][animationArray[5][2] + "" + (animationArray[5][3] + fa)][1] + this.main.ship._y;
               fa++;
            }
         }
      }
      moveClip(this.main.crew["crew" + animationArray[1]],endX,endY,7);
      if(animationArray[2] != null)
      {
         subTargetX = endX;
         subTargetY = endY - 12;
         moveClip(this.main.crew["battlebots" + animationArray[2]],subTargetX,subTargetY,7);
      }
      if(animationArray[4][0][0] != null)
      {
         fa = 0;
         while(fa < animationArray[4].length)
         {
            moveClip(this.main.crew["crew" + animationArray[4][fa][0]],this["sub" + fa + "endX"],this["sub" + fa + "endY"],7);
            if(animationArray[4][fa][1] != null)
            {
               this["sub" + fa + "TargetX"] = this["sub" + fa + "endX"];
               this["sub" + fa + "TargetY"] = this["sub" + fa + "endY"] - 12;
               moveClip(this.main.crew["battlebots" + animationArray[4][fa][1]],this["sub" + fa + "TargetX"],this["sub" + fa + "TargetY"],7);
            }
            if(this.main.crew["crew" + animationArray[4][fa][0]]._x == this["sub" + fa + "endX"] && this.main.crew["crew" + animationArray[4][fa][0]]._y == this["sub" + fa + "endY"] && this["sub" + fa + "flag"] == false)
            {
               trace("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  " + fa);
               this["sub" + fa + "flag"] = true;
               this.main.crew["crew" + animationArray[4][fa][0]].gotoAndStop("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot1.gotoAndStop("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot2.gotoAndStop("stand");
               this.main.crew["battlebots" + animationArray[4][fa][1]].bot3.gotoAndStop("stand");
            }
            fa++;
         }
      }
      if(this.main.crew["crew" + animationArray[1]]._x == endX && this.main.crew["crew" + animationArray[1]]._y == endY)
      {
         this.main.crew["crew" + animationArray[1]].gotoAndStop("stand");
         _root.soundBox.stopSoundLoop();
         if(animationArray[2] != null)
         {
            this.main.crew["battlebots" + animationArray[2]].bot1.gotoAndStop("stand");
            this.main.crew["battlebots" + animationArray[2]].bot2.gotoAndStop("stand");
            this.main.crew["battlebots" + animationArray[2]].bot3.gotoAndStop("stand");
         }
         if(animationArray[4][0][0] != null)
         {
            fa = 0;
            while(fa < animationArray[4].length)
            {
               pass = true;
               if(this["sub" + fa + "flag"] == false)
               {
                  pass = false;
               }
               fa++;
            }
            if(pass == true)
            {
               game.animationTimer = null;
               game.animationGoal = true;
            }
         }
         else
         {
            game.animationTimer = null;
            game.animationGoal = true;
         }
      }
   }
   if(animationArray[0] == "addDamageMarker")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.effects.attachMovie("explosion","explosion",this.main.effects.getNextHighestDepth());
         this.main.effects.explosion._x = game.coordinateLocations[animationArray[1]][0].damageLocation[animationArray[2]][0] + this.main.ship._x;
         this.main.effects.explosion._y = game.coordinateLocations[animationArray[1]][0].damageLocation[animationArray[2]][1] + this.main.ship._y;
         this.main.effects.explosion._xscale = 300;
         this.main.effects.explosion._yscale = 300;
         this.main.effects.explosion._rotation = calculateRandom(0,360);
      }
      if(this.main.effects.explosion._x == null)
      {
         trace("DAMAGE IS SUPPOSED TO BE " + animationArray[2]);
         this.main.damage.attachMovie("ship-damage","damage-" + animationArray[1] + "-" + animationArray[2],this.main.damage.getNextHighestDepth());
         this.main.damage["damage-" + animationArray[1] + "-" + animationArray[2]]._x = game.coordinateLocations[animationArray[1]][0].damageLocation[animationArray[2]][0] + this.main.ship._x - 20;
         this.main.damage["damage-" + animationArray[1] + "-" + animationArray[2]]._y = game.coordinateLocations[animationArray[1]][0].damageLocation[animationArray[2]][1] + this.main.ship._y - 20;
         if(animationArray[2] == "gravChute")
         {
            this.main.damage["damage-" + animationArray[1] + "-" + animationArray[2]].type = "GRAV";
         }
         if(animationArray[2] == "hull")
         {
            this.main.damage["damage-" + animationArray[1] + "-" + animationArray[2]].type = "HULL";
         }
         if(animationArray[2] == "energy")
         {
            this.main.damage["damage-" + animationArray[1] + "-" + animationArray[2]].type = "GEN";
         }
         if(animationArray[2] == "shield")
         {
            this.main.damage["damage-" + animationArray[1] + "-" + animationArray[2]].type = "SHIELD";
         }
         if(animationArray[2] == "pulseCannon" || animationArray[2] == "LLaser" || animationArray[2] == "HLaser")
         {
            this.main.damage["damage-" + animationArray[1] + "-" + animationArray[2]].type = "GUN";
         }
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "addEnergy")
   {
      this.main.stuff["energycounter" + animationArray[1]].gotoAndStop("e" + animationArray[2]);
      if(animationArray[3] == "up")
      {
         _root.soundBox.playSound("chargeSND");
      }
      game.animationGoal = true;
   }
   if(animationArray[0] == "addShield")
   {
      this.main.stuff["shieldcounter" + animationArray[1]].gotoAndStop("s" + animationArray[2]);
      if(animationArray[3] == "up")
      {
         _root.soundBox.playSound("chargeSND");
      }
      game.animationGoal = true;
   }
   if(animationArray[0] == "addFuel")
   {
      this.main.stuff.fuelcounter.gotoAndStop("f" + animationArray[1]);
      game.animationGoal = true;
   }
   if(animationArray[0] == "threatDestroyed")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.threats["threat-tracker" + animationArray[1]].removeMovieClip();
         this.main.threats["threatDisplay" + animationArray[1]].swapDepths(this.main.threats.getNextHighestDepth());
         if(game.threats[animationArray[1]].internal != true)
         {
            this.main.effects.attachMovie("explosion","explosion",this.main.effects.getNextHighestDepth());
            this.main.effects.explosion._x = this.main.threats["threatDisplay" + animationArray[1]]._x + this.main.threats["threatDisplay" + animationArray[1]]._width / 2;
            this.main.effects.explosion._y = this.main.threats["threatDisplay" + animationArray[1]]._y + this.main.threats["threatDisplay" + animationArray[1]]._height / 2;
            this.main.effects.explosion._yscale = 400;
            this.main.effects.explosion._xscale = 400;
            this.main.effects.explosion._rotation = calculateRandom(0,360);
         }
      }
      if(this.main.effects.explosion._x == null)
      {
         this.main.threats["threatDisplay" + animationArray[1]].gotoAndPlay("destroyed");
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "damageThreat")
   {
      this.main.threats["threatDisplay" + animationArray[1]].HP = animationArray[2];
      game.animationGoal = true;
   }
   if(animationArray[0] == "damageThreatShields")
   {
      this.main.threats["threatDisplay" + animationArray[1]].shields = animationArray[2];
      game.animationGoal = true;
   }
   if(animationArray[0] == "beginTurnRefreshShelds")
   {
      trace("AT THE SHIELD REFRESH " + animationArray[1]);
      fa = 0;
      while(fa < animationArray[1].length)
      {
         if(game.threats[animationArray[1][fa]].internal != true)
         {
            this.main.threats["threatDisplay" + animationArray[1][fa]].shields = animationArray[2][fa];
         }
         fa++;
      }
      game.animationGoal = true;
   }
   if(animationArray[0] == "shootBeams")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("blastSND");
         game.animationTimer = 8;
         this.main.effects.attachMovie("beam","beam1",this.main.effects.getNextHighestDepth());
         this.main.effects.beam1._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 81;
         this.main.effects.beam1._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 72;
         this.main.effects.beam1._rotation = 187;
         if(this.main.effects.beam1._y > 140)
         {
            this.main.effects.beam1._yscale = 60;
         }
         if(game.threats[animationArray[1]].zone == 0)
         {
            this.main.effects.beam1._rotation = this.main.effects.beam1._rotation - 6;
         }
         if(game.threats[animationArray[1]].zone == 2)
         {
            this.main.effects.beam1._rotation = this.main.effects.beam1._rotation + 10;
         }
         this.main.effects.attachMovie("beam","beam2",this.main.effects.getNextHighestDepth());
         this.main.effects.beam2._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 101;
         this.main.effects.beam2._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 72;
         this.main.effects.beam2._rotation = 173;
         if(this.main.effects.beam2._y > 140)
         {
            this.main.effects.beam2._yscale = 60;
         }
         if(game.threats[animationArray[1]].zone == 0)
         {
            this.main.effects.beam2._rotation = this.main.effects.beam2._rotation - 6;
         }
         if(game.threats[animationArray[1]].zone == 2)
         {
            this.main.effects.beam2._rotation = this.main.effects.beam2._rotation + 10;
         }
      }
      if(game.animationTimer == 5)
      {
         _root.soundBox.playSound("explosionSND" + _root.calculateRandom(1,4));
      }
      trace(game.animationTimer);
      this.main._x = calculateRandom(0,30) - 15;
      this.main._y = calculateRandom(0,30) - 15;
      game.animationTimer--;
      if(game.animationTimer == 0)
      {
         game.animationGoal = true;
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
      }
   }
   if(animationArray[0] == "shootBeamWide")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSoundLoop("laser2SND");
         game.animationTimer = 8;
         this.main.effects.attachMovie("beamWide","beam1",this.main.effects.getNextHighestDepth());
         this.main.effects.beam1._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 81;
         this.main.effects.beam1._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 72;
         this.main.effects.beam1._rotation = 180;
         if(this.main.effects.beam1._y > 140)
         {
            this.main.effects.beam1._yscale = 60;
         }
         if(game.threats[animationArray[1]].zone == 0)
         {
            this.main.effects.beam1._rotation = this.main.effects.beam1._rotation - 6;
         }
         if(game.threats[animationArray[1]].zone == 2)
         {
            this.main.effects.beam1._rotation = this.main.effects.beam1._rotation + 10;
         }
      }
      if(game.animationTimer == 5)
      {
         _root.soundBox.playSound("explosionSND" + _root.calculateRandom(1,4));
      }
      trace(game.animationTimer);
      this.main._x = calculateRandom(0,30) - 15;
      this.main._y = calculateRandom(0,30) - 15;
      game.animationTimer--;
      if(game.animationTimer == 0)
      {
         _root.soundBox.stopSoundLoop();
         game.animationGoal = true;
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
      }
   }
   if(animationArray[0] == "shootBeamPulse")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("shieldSND");
         trace("TIMER IS NULL");
         game.animationTimer = 8;
         this.main.effects.attachMovie("beamPulse","beam1",this.main.effects.getNextHighestDepth());
         this.main.effects.beam1._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 81;
         this.main.effects.beam1._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 72;
         this.main.effects.beam1._rotation = 180;
         if(this.main.effects.beam1._y > 140)
         {
            this.main.effects.beam1._yscale = 60;
         }
         if(game.threats[animationArray[1]].zone == 0)
         {
            this.main.effects.beam1._rotation = this.main.effects.beam1._rotation - 6;
         }
         if(game.threats[animationArray[1]].zone == 2)
         {
            this.main.effects.beam1._rotation = this.main.effects.beam1._rotation + 10;
         }
         if(game.threats[animationArray[1]].internal == true)
         {
            this.main.effects.beam1._rotation = 0;
         }
      }
      trace(game.animationTimer);
      game.animationTimer--;
      if(game.animationTimer <= 0)
      {
         game.animationGoal = true;
         game.animationTimer = null;
      }
   }
   if(animationArray[0] == "shootLightning")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("lightningSND");
         trace("TIMER IS NULL");
         game.animationTimer = 8;
         this.main.effects.attachMovie("lightning","beam1",this.main.effects.getNextHighestDepth());
         this.main.effects.beam1._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 81;
         this.main.effects.beam1._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 72;
         this.main.effects.beam1._rotation = 180;
         this.main.effects.beam1.gotoAndStop(calculateRandom(1,4));
         if(this.main.effects.beam1._y > 140)
         {
            this.main.effects.beam1._yscale = 60;
         }
         if(game.threats[animationArray[1]].zone == 0)
         {
            this.main.effects.beam1._rotation = this.main.effects.beam1._rotation - 6;
         }
         if(game.threats[animationArray[1]].zone == 2)
         {
            this.main.effects.beam1._rotation = this.main.effects.beam1._rotation + 10;
         }
      }
      this.main._x = calculateRandom(0,16) - 8;
      this.main._y = calculateRandom(0,16) - 8;
      this.main.effects.beam1._rotation = 180 + calculateRandom(0,20) - 10;
      if(game.threats[animationArray[1]].zone == 0)
      {
         this.main.effects.beam1._rotation = this.main.effects.beam1._rotation - 6;
      }
      if(game.threats[animationArray[1]].zone == 2)
      {
         this.main.effects.beam1._rotation = this.main.effects.beam1._rotation + 10;
      }
      if(game.threats[animationArray[1]].internal == true)
      {
         this.main.effects.beam1._rotation = 270 + calculateRandom(0,30) - 15;
         this.main.effects.beam1._yscale = 120;
      }
      this.main.effects.beam1.gotoAndStop(calculateRandom(1,4));
      game.animationTimer--;
      if(game.animationTimer == 5)
      {
         _root.soundBox.playSound("explosionSND" + _root.calculateRandom(1,4));
      }
      if(game.animationTimer <= 0)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         this.main._x = 0;
         this.main._y = 0;
         this.main.effects.beam1.removeMovieClip();
      }
   }
   if(animationArray[0] == "iconHeal")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         _root.soundBox.playSound("speed-upSND");
         this.main.effects.attachMovie("icon-medical","icon-medical",this.main.effects.getNextHighestDepth());
         this.main.effects["icon-medical"]._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 67;
         this.main.effects["icon-medical"]._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 100;
         this.main.effects["icon-medical"]._alpha = 5;
      }
      if(game.animationTimer == 0)
      {
         this.main.effects["icon-medical"]._y = this.main.effects["icon-medical"]._y - 5;
         this.main.effects["icon-medical"]._alpha = this.main.effects["icon-medical"]._alpha + 20;
         if(this.main.effects["icon-medical"]._alpha >= 100)
         {
            this.main.effects["icon-medical"]._alpha = 100;
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer > 0 && game.animationTimer < 10)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 10)
      {
         this.main.effects["icon-medical"]._y = this.main.effects["icon-medical"]._y - 5;
         this.main.effects["icon-medical"]._alpha = this.main.effects["icon-medical"]._alpha - 20;
         if(this.main.effects["icon-medical"]._alpha <= 0)
         {
            this.main.effects["icon-medical"]._alpha = 0;
            this.main.threats["threatDisplay" + animationArray[1]].HP = animationArray[2];
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer == 11)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         this.main.effects["icon-medical"].removeMovieClip();
      }
   }
   if(animationArray[0] == "iconSpeed")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.effects.attachMovie("icon-speed","icon-speed",this.main.effects.getNextHighestDepth());
         this.main.effects["icon-speed"]._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 67;
         this.main.effects["icon-speed"]._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 100;
         this.main.effects["icon-speed"]._alpha = 5;
         if(animationArray[3] == "down")
         {
            this.main.effects["icon-speed"]._yscale = -100;
            _root.soundBox.playSound("speed-downSND");
         }
         else
         {
            _root.soundBox.playSound("speed-upSND");
         }
      }
      if(game.animationTimer == 0)
      {
         this.main.effects["icon-speed"]._y = this.main.effects["icon-speed"]._y - 5;
         this.main.effects["icon-speed"]._alpha = this.main.effects["icon-speed"]._alpha + 20;
         if(this.main.effects["icon-speed"]._alpha >= 100)
         {
            this.main.effects["icon-speed"]._alpha = 100;
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer > 0 && game.animationTimer < 10)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 10)
      {
         this.main.effects["icon-speed"]._y = this.main.effects["icon-speed"]._y - 5;
         this.main.effects["icon-speed"]._alpha = this.main.effects["icon-speed"]._alpha - 20;
         if(this.main.effects["icon-speed"]._alpha <= 0)
         {
            this.main.effects["icon-speed"]._alpha = 0;
            this.main.threats["threatDisplay" + animationArray[1]].speed = animationArray[2];
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer == 11)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         this.main.effects["icon-speed"].removeMovieClip();
      }
   }
   if(animationArray[0] == "iconDamage")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         _root.soundBox.playSound("icon-popSND");
         this.main.effects.attachMovie("icon-damage","icon-damage",this.main.effects.getNextHighestDepth());
         this.main.effects["icon-damage"]._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 67;
         this.main.effects["icon-damage"]._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 100;
         this.main.effects["icon-damage"]._alpha = 5;
      }
      if(game.animationTimer == 0)
      {
         this.main.effects["icon-damage"]._y = this.main.effects["icon-damage"]._y - 5;
         this.main.effects["icon-damage"]._alpha = this.main.effects["icon-damage"]._alpha + 20;
         if(this.main.effects["icon-damage"]._alpha >= 100)
         {
            this.main.effects["icon-damage"]._alpha = 100;
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer > 0 && game.animationTimer < 10)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 10)
      {
         this.main.effects["icon-damage"]._y = this.main.effects["icon-damage"]._y - 5;
         this.main.effects["icon-damage"]._alpha = this.main.effects["icon-damage"]._alpha - 20;
         if(this.main.effects["icon-damage"]._alpha <= 0)
         {
            this.main.effects["icon-damage"]._alpha = 0;
            this.main.threats["threatDisplay" + animationArray[1]].HP = animationArray[2];
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer == 11)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         this.main.effects["icon-damage"].removeMovieClip();
      }
   }
   if(animationArray[0] == "iconShield")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.effects.attachMovie("icon-shield","icon-shield",this.main.effects.getNextHighestDepth());
         this.main.effects["icon-shield"]._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 67;
         this.main.effects["icon-shield"]._y = this.main.threats["threatDisplay" + animationArray[1]]._y + 100;
         this.main.effects["icon-shield"]._alpha = 5;
         if(animationArray[3] == "down")
         {
            this.main.effects["icon-shield"]._yscale = -100;
            _root.soundBox.playSound("speed-downSND");
         }
         else
         {
            _root.soundBox.playSound("speed-upSND");
         }
      }
      if(game.animationTimer == 0)
      {
         this.main.effects["icon-shield"]._y = this.main.effects["icon-shield"]._y - 5;
         this.main.effects["icon-shield"]._alpha = this.main.effects["icon-shield"]._alpha + 20;
         if(this.main.effects["icon-shield"]._alpha >= 100)
         {
            this.main.effects["icon-shield"]._alpha = 100;
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer > 0 && game.animationTimer < 10)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 10)
      {
         this.main.effects["icon-shield"]._y = this.main.effects["icon-shield"]._y - 5;
         this.main.effects["icon-shield"]._alpha = this.main.effects["icon-shield"]._alpha - 20;
         if(this.main.effects["icon-shield"]._alpha <= 0)
         {
            this.main.effects["icon-shield"]._alpha = 0;
            this.main.threats["threatDisplay" + animationArray[1]].shields = animationArray[2];
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer == 11)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         this.main.effects["icon-shield"].removeMovieClip();
      }
   }
   if(animationArray[0] == "buffShields")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         fa = 0;
         while(fa < animationArray[1].length)
         {
            _root.soundBox.playSound("speed-upSND");
            this.main.effects.attachMovie("icon-shield","icon-shield" + fa,this.main.effects.getNextHighestDepth());
            this.main.effects["icon-shield" + fa]._x = this.main.threats["threatDisplay" + animationArray[1][fa][0]]._x + 67;
            this.main.effects["icon-shield" + fa]._y = this.main.threats["threatDisplay" + animationArray[1][fa][0]]._y + 100;
            this.main.effects["icon-shield" + fa]._alpha = 5;
            fa++;
         }
      }
      if(game.animationTimer == 0)
      {
         fa = 0;
         while(fa < animationArray[1].length)
         {
            this.main.effects["icon-shield" + fa]._y = this.main.effects["icon-shield" + fa]._y - 5;
            this.main.effects["icon-shield" + fa]._alpha = this.main.effects["icon-shield" + fa]._alpha + 20;
            if(this.main.effects["icon-shield" + fa]._alpha >= 100)
            {
               this.main.effects["icon-shield" + fa]._alpha = 100;
            }
            fa++;
         }
      }
      if(this.main.effects["icon-shield0"]._alpha == 100)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 1)
      {
         fa = 0;
         while(fa < animationArray[1].length)
         {
            this.main.effects["icon-shield" + fa]._y = this.main.effects["icon-shield" + fa]._y - 5;
            this.main.effects["icon-shield" + fa]._alpha = this.main.effects["icon-shield" + fa]._alpha - 20;
            if(this.main.effects["icon-shield" + fa]._alpha <= 0)
            {
               this.main.effects["icon-shield" + fa]._alpha = 0;
               this.main.threats["threatDisplay" + animationArray[1][fa][0]].shields = animationArray[1][fa][1];
            }
            fa++;
         }
      }
      if(this.main.effects["icon-shield0"]._alpha == 0)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         fa = 0;
         while(fa < animationArray[1].length)
         {
            this.main.effects["icon-shield" + fa].removeMovieClip();
            fa++;
         }
      }
   }
   if(animationArray[0] == "deBuffShields")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         fa = 0;
         while(fa < animationArray[1].length)
         {
            _root.soundBox.playSound("speed-downSND");
            this.main.effects.attachMovie("icon-shield","icon-shield" + fa,this.main.effects.getNextHighestDepth());
            this.main.effects["icon-shield" + fa]._x = this.main.threats["threatDisplay" + animationArray[1][fa][0]]._x + 67;
            this.main.effects["icon-shield" + fa]._y = this.main.threats["threatDisplay" + animationArray[1][fa][0]]._y + 100;
            this.main.effects["icon-shield" + fa]._alpha = 5;
            this.main.effects["icon-shield" + fa]._yscale = -100;
            fa++;
         }
      }
      if(game.animationTimer == 0)
      {
         fa = 0;
         while(fa < animationArray[1].length)
         {
            this.main.effects["icon-shield" + fa]._y = this.main.effects["icon-shield" + fa]._y - 5;
            this.main.effects["icon-shield" + fa]._alpha = this.main.effects["icon-shield" + fa]._alpha + 20;
            if(this.main.effects["icon-shield" + fa]._alpha >= 100)
            {
               this.main.effects["icon-shield" + fa]._alpha = 100;
            }
            fa++;
         }
      }
      if(this.main.effects["icon-shield0"]._alpha == 100)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 1)
      {
         fa = 0;
         while(fa < animationArray[1].length)
         {
            this.main.effects["icon-shield" + fa]._y = this.main.effects["icon-shield" + fa]._y - 5;
            this.main.effects["icon-shield" + fa]._alpha = this.main.effects["icon-shield" + fa]._alpha - 20;
            if(this.main.effects["icon-shield" + fa]._alpha <= 0)
            {
               this.main.effects["icon-shield" + fa]._alpha = 0;
               this.main.threats["threatDisplay" + animationArray[1][fa][0]].shields = animationArray[1][fa][1];
            }
            fa++;
         }
      }
      if(this.main.effects["icon-shield0"]._alpha == 0)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         fa = 0;
         while(fa < animationArray[1].length)
         {
            this.main.effects["icon-shield" + fa].removeMovieClip();
            fa++;
         }
      }
   }
   if(animationArray[0] == "leviathanExplosion")
   {
      trace("LEV EXPLOSION");
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.effects.attachMovie("explosion","explosion",this.main.effects.getNextHighestDepth());
         this.main.effects.explosion._x = this.main.threats["threatDisplay" + animationArray[2]]._x + this.main.threats["threatDisplay" + animationArray[2]]._width / 2;
         this.main.effects.explosion._y = this.main.threats["threatDisplay" + animationArray[2]]._y + this.main.threats["threatDisplay" + animationArray[2]]._height / 2;
         this.main.effects.explosion._yscale = 900;
         this.main.effects.explosion._xscale = 900;
         this.main.effects.explosion._rotation = calculateRandom(0,360);
         fa = 0;
         while(fa < animationArray[1].length)
         {
            _root.soundBox.playSound("icon-popSND");
            this.main.effects.attachMovie("icon-damage","icon-damage" + fa,this.main.effects.getNextHighestDepth());
            this.main.effects["icon-damage" + fa]._x = this.main.threats["threatDisplay" + animationArray[1][fa][0]]._x + 67;
            this.main.effects["icon-damage" + fa]._y = this.main.threats["threatDisplay" + animationArray[1][fa][0]]._y + 100;
            this.main.effects["icon-damage" + fa]._alpha = 5;
            this.main.effects["icon-damage" + fa]._yscale = -100;
            fa++;
         }
      }
      if(game.animationTimer == 0)
      {
         if(animationArray[1].length > 0)
         {
            fa = 0;
            while(fa < animationArray[1].length)
            {
               this.main.effects["icon-damage" + fa]._y = this.main.effects["icon-damage" + fa]._y - 5;
               this.main.effects["icon-damage" + fa]._alpha = this.main.effects["icon-damage" + fa]._alpha + 20;
               if(this.main.effects["icon-damage" + fa]._alpha >= 100)
               {
                  this.main.effects["icon-damage" + fa]._alpha = 100;
               }
               fa++;
            }
         }
         else
         {
            game.animationTimer = 2;
         }
      }
      if(this.main.effects["icon-damage0"]._alpha == 100)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 1)
      {
         fa = 0;
         while(fa < animationArray[1].length)
         {
            this.main.effects["icon-damage" + fa]._y = this.main.effects["icon-damage" + fa]._y - 5;
            this.main.effects["icon-damage" + fa]._alpha = this.main.effects["icon-damage" + fa]._alpha - 20;
            if(this.main.effects["icon-damage" + fa]._alpha <= 0)
            {
               this.main.effects["icon-damage" + fa]._alpha = 0;
            }
            fa++;
         }
      }
      if(this.main.effects["icon-damage0"]._alpha == 0 || game.animationTimer == 2)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         fa = 0;
         while(fa < animationArray[1].length)
         {
            this.main.effects["icon-damage" + fa].removeMovieClip();
            fa++;
         }
      }
   }
   if(animationArray[0] == "shipHeavyBeam")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("heavyBeamSND");
         game.animationTimer = 0;
         this.main.effects.attachMovie("ship-beam","ship-beam",this.main.effects.getNextHighestDepth());
         this.main.effects["ship-beam"]._x = game.coordinateLocations[animationArray[1]][0].weapon.HLaser[0] + this.main.ship._x;
         this.main.effects["ship-beam"]._y = game.coordinateLocations[animationArray[1]][0].weapon.HLaser[1] + this.main.ship._y;
         if(animationArray[2] != "miss")
         {
            tempX = this.main.threats["threatDisplay" + animationArray[2]]._x + 81;
            tempY = this.main.threats["threatDisplay" + animationArray[2]]._y + 72;
         }
         else
         {
            tempX = game.coordinateLocations[animationArray[1]][0].weapon.HLaser[0] + this.main.ship._x;
            tempY = -50;
         }
         tempX2 = this.main.effects["ship-beam"]._x;
         tempY2 = this.main.effects["ship-beam"]._y;
         this.main.effects["ship-beam"].beam._yscale = distPointToPoint(tempX,tempY,tempX2,tempY2) * 100;
         this.main.effects["ship-beam"].beam._xscale = 10;
         this.main.effects["ship-beam"]._rotation = anglePointToPoint(tempX,tempY,tempX2,tempY2);
         this.main.effects["ship-beam"].ball._yscale = 50;
         this.main.effects["ship-beam"].ball._xscale = 50;
         this.main.effects["ship-beam"].hit._y = distPointToPoint(tempX,tempY,tempX2,tempY2) * -1;
         this.main.effects["ship-beam"].hit._yscale = 20;
         this.main.effects["ship-beam"].hit._xscale = 20;
      }
      this.main.ship["HL" + animationArray[1]]._alpha = this.main.ship["HL" + animationArray[1]]._alpha - 20;
      if(this.main.ship["HL" + animationArray[1]]._alpha < 0)
      {
         this.main.ship["HL" + animationArray[1]]._alpha = 0;
      }
      if(game.animationTimer == 1)
      {
         this.main.effects["ship-beam"].beam._xscale = 100;
         this.main.effects["ship-beam"].ball._yscale = 100;
         this.main.effects["ship-beam"].ball._xscale = 100;
      }
      if(game.animationTimer > 3)
      {
         if(this.main.effects["ship-beam"].beam._xscale != 0)
         {
            this.main.effects["ship-beam"].beam._xscale = this.main.effects["ship-beam"].beam._xscale - 20;
         }
      }
      if(game.animationTimer < 5)
      {
         this.main.effects["ship-beam"].hit._yscale = this.main.effects["ship-beam"].hit._yscale + 20;
         this.main.effects["ship-beam"].hit._xscale = this.main.effects["ship-beam"].hit._xscale + 20;
      }
      if(game.animationTimer > 4)
      {
         this.main.effects["ship-beam"].ball._yscale = this.main.effects["ship-beam"].ball._yscale - 15;
         this.main.effects["ship-beam"].ball._xscale = this.main.effects["ship-beam"].ball._xscale - 15;
         if(this.main.effects["ship-beam"].ball._yscale <= 0)
         {
            this.main.effects["ship-beam"].ball._yscale = 0;
            this.main.effects["ship-beam"].ball._xscale = 0;
         }
         this.main.effects["ship-beam"].hit._yscale = this.main.effects["ship-beam"].hit._yscale - 10;
         this.main.effects["ship-beam"].hit._xscale = this.main.effects["ship-beam"].hit._xscale - 10;
      }
      game.animationTimer = game.animationTimer + 1;
      if(this.main.effects["ship-beam"].hit._xscale <= 0)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         this.main.effects["ship-beam"].removeMovieClip();
      }
   }
   if(animationArray[0] == "launchRocket")
   {
      trace("ROCKET NUM " + animationArray[1]);
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("rocketSND");
         game.animationTimer = 0;
         endY = 900;
         speed = 5;
         this.main.stuff["rocket" + animationArray[1]].gotoAndPlay("launch");
      }
      this.main.stuff["rocket" + animationArray[1]]._y = this.main.stuff["rocket" + animationArray[1]]._y + speed;
      speed = speed + 5;
      if(this.main.stuff["rocket" + animationArray[1]]._y > endY)
      {
         game.animationTimer = null;
         game.animationGoal = true;
         this.main.stuff["rocket" + animationArray[1]].removeMovieClip();
      }
   }
   if(animationArray[0] == "rocketStrike")
   {
      trace("ROCKET TARGET IS " + animationArray[1]);
      trace("game.animationTimer " + game.animationTimer);
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("rocket2SND");
         game.animationTimer = 0;
         this.main.effects.attachMovie("rocket","rocket",this.main.effects.getNextHighestDepth());
         if(animationArray[1] == "miss")
         {
            this.main.effects.rocket._x = 400 + calculateRandom(0,200);
         }
         else
         {
            this.main.effects.rocket._x = this.main.threats["threatDisplay" + animationArray[1]]._x + 81;
         }
         this.main.effects.rocket._y = 900;
         this.main.effects.rocket._rotation = 180;
         game.animationTimer = 0;
         if(animationArray[1] == "miss")
         {
            endY = -50;
         }
         else
         {
            endY = this.main.threats["threatDisplay" + animationArray[1]]._y + 72 + this.main.effects.rocket._height;
         }
         this.main.effects.rocket.gotoAndPlay("deployed");
      }
      this.main.effects.rocket._y = this.main.effects.rocket._y - 40;
      trace(this.main.effects.rocket._y + " " + endY);
      if(this.main.effects.rocket._y <= endY && game.animationTimer < 1)
      {
         if(animationArray[1] != "miss")
         {
            this.main.effects.attachMovie("explosion","explosionX",this.main.effects.getNextHighestDepth());
            this.main.effects.explosionX._x = this.main.effects.rocket._x + 10;
            this.main.effects.explosionX._y = this.main.effects.rocket._y - 30;
            this.main.effects.explosionX._yscale = 300;
            this.main.effects.explosionX._xscale = 300;
         }
         this.main.effects.rocket.removeMovieClip();
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 1 && this.main.effects.explosionX._y == null)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "shipBeamPulse")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("shieldSND");
         trace("TIMER IS NULL");
         game.animationTimer = 0;
         this.main.effects.attachMovie("beamPulseGreen","beam1",this.main.effects.getNextHighestDepth());
         this.main.effects.beam1._x = this.main.ship._x + 295;
         this.main.effects.beam1._y = this.main.ship._y + 374;
         if(animationArray[2] != 5)
         {
            this.main.effects.beam1._xscale = 130;
            this.main.effects.beam1._yscale = 130;
         }
         if(animationArray[1].length != 0)
         {
            fa = 0;
            while(fa < animationArray[1].length)
            {
               this.main.effects.attachMovie("icon-damage","icon-damage" + fa,this.main.effects.getNextHighestDepth());
               this.main.effects["icon-damage" + fa]._x = this.main.threats["threatDisplay" + animationArray[1][fa]]._x + 67;
               this.main.effects["icon-damage" + fa]._y = this.main.threats["threatDisplay" + animationArray[1][fa]]._y + 100;
               this.main.effects["icon-damage" + fa]._alpha = 5;
               fa++;
            }
         }
      }
      this.main.ship.PB._alpha = this.main.ship.PB._alpha - 20;
      if(this.main.ship.PB._alpha < 0)
      {
         this.main.ship.PB._alpha = 0;
      }
      if(animationArray[1].length != 0)
      {
         if(game.animationTimer == 0)
         {
            fa = 0;
            while(fa < animationArray[1].length)
            {
               this.main.effects["icon-damage" + fa]._y = this.main.effects["icon-damage" + fa]._y - 5;
               this.main.effects["icon-damage" + fa]._alpha = this.main.effects["icon-damage" + fa]._alpha + 20;
               if(this.main.effects["icon-damage" + fa]._alpha >= 100)
               {
                  this.main.effects["icon-damage" + fa]._alpha = 100;
               }
               fa++;
            }
         }
         if(this.main.effects["icon-damage0"]._alpha == 100)
         {
            game.animationTimer = game.animationTimer + 1;
         }
         if(game.animationTimer == 1)
         {
            fa = 0;
            while(fa < animationArray[1].length)
            {
               this.main.effects["icon-damage" + fa]._y = this.main.effects["icon-damage" + fa]._y - 5;
               this.main.effects["icon-damage" + fa]._alpha = this.main.effects["icon-damage" + fa]._alpha - 20;
               if(this.main.effects["icon-damage" + fa]._alpha <= 0)
               {
                  this.main.effects["icon-damage" + fa].removeMovieClip();
               }
               fa++;
            }
         }
      }
      if(this.main.effects["icon-damage0"]._alpha == null && this.main.effects.beam1._x == null)
      {
         game.animationGoal = true;
         game.animationTimer = null;
      }
   }
   if(animationArray[0] == "shipLightBeam")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("lightBeamSND");
         game.animationTimer = 0;
         this.main.effects.attachMovie("ship-beam","ship-beam",this.main.effects.getNextHighestDepth());
         this.main.effects["ship-beam"]._x = game.coordinateLocations[animationArray[1]][0].weapon.LLaser[0] + this.main.ship._x;
         this.main.effects["ship-beam"]._y = game.coordinateLocations[animationArray[1]][0].weapon.LLaser[1] + this.main.ship._y;
         this.main.effects.attachMovie("ship-beam","ship-beam2",this.main.effects.getNextHighestDepth());
         this.main.effects["ship-beam2"]._x = game.coordinateLocations[animationArray[1]][0].weapon.LLaser[2] + this.main.ship._x;
         this.main.effects["ship-beam2"]._y = game.coordinateLocations[animationArray[1]][0].weapon.LLaser[3] + this.main.ship._y;
         if(animationArray[2] != "miss")
         {
            tempX = this.main.threats["threatDisplay" + animationArray[2]]._x + 81;
            tempY = this.main.threats["threatDisplay" + animationArray[2]]._y + 72;
            temp2X = this.main.threats["threatDisplay" + animationArray[2]]._x + 81;
            temp2Y = this.main.threats["threatDisplay" + animationArray[2]]._y + 72;
         }
         else
         {
            tempX = game.coordinateLocations[animationArray[1]][0].weapon.LLaser[0] + this.main.ship._x;
            tempY = -50;
            temp2X = game.coordinateLocations[animationArray[1]][0].weapon.LLaser[1] + this.main.ship._x;
            temp2Y = -50;
         }
         tempX2 = this.main.effects["ship-beam"]._x;
         tempY2 = this.main.effects["ship-beam"]._y;
         temp2X2 = this.main.effects["ship-beam"]._x;
         temp2Y2 = this.main.effects["ship-beam"]._y;
         this.main.effects["ship-beam"].beam._yscale = distPointToPoint(tempX,tempY,tempX2,tempY2) * 100;
         this.main.effects["ship-beam"].beam._xscale = 5;
         this.main.effects["ship-beam"]._rotation = anglePointToPoint(tempX,tempY,tempX2,tempY2);
         this.main.effects["ship-beam"].ball._yscale = 25;
         this.main.effects["ship-beam"].ball._xscale = 25;
         this.main.effects["ship-beam2"].beam._yscale = distPointToPoint(temp2X,temp2Y,temp2X2,temp2Y2) * 100;
         this.main.effects["ship-beam2"].beam._xscale = 5;
         this.main.effects["ship-beam2"]._rotation = this.main.effects["ship-beam"]._rotation;
         this.main.effects["ship-beam2"].ball._yscale = 25;
         this.main.effects["ship-beam2"].ball._xscale = 25;
         this.main.effects["ship-beam"].hit._y = distPointToPoint(tempX,tempY,tempX2,tempY2) * -1;
         this.main.effects["ship-beam"].hit._yscale = 10;
         this.main.effects["ship-beam"].hit._xscale = 10;
         this.main.effects["ship-beam2"].hit._y = distPointToPoint(temp2X,temp2Y,temp2X2,temp2Y2) * -1;
         this.main.effects["ship-beam2"].hit._yscale = 10;
         this.main.effects["ship-beam2"].hit._xscale = 10;
      }
      this.main.ship["LL" + animationArray[1]]._alpha = this.main.ship["LL" + animationArray[1]]._alpha - 20;
      if(this.main.ship["LL" + animationArray[1]]._alpha < 0)
      {
         this.main.ship["LL" + animationArray[1]]._alpha = 0;
      }
      if(game.animationTimer == 1)
      {
         this.main.effects["ship-beam"].beam._xscale = 50;
         this.main.effects["ship-beam"].ball._yscale = 50;
         this.main.effects["ship-beam"].ball._xscale = 50;
         this.main.effects["ship-beam2"].beam._xscale = 50;
         this.main.effects["ship-beam2"].ball._yscale = 50;
         this.main.effects["ship-beam2"].ball._xscale = 50;
      }
      if(game.animationTimer > 3)
      {
         if(this.main.effects["ship-beam"].beam._xscale != 0)
         {
            this.main.effects["ship-beam"].beam._xscale = this.main.effects["ship-beam"].beam._xscale - 10;
            this.main.effects["ship-beam2"].beam._xscale = this.main.effects["ship-beam2"].beam._xscale - 10;
         }
      }
      if(game.animationTimer < 5)
      {
         this.main.effects["ship-beam"].hit._yscale = this.main.effects["ship-beam"].hit._yscale + 10;
         this.main.effects["ship-beam"].hit._xscale = this.main.effects["ship-beam"].hit._xscale + 10;
         this.main.effects["ship-beam2"].hit._yscale = this.main.effects["ship-beam2"].hit._yscale + 10;
         this.main.effects["ship-beam2"].hit._xscale = this.main.effects["ship-beam2"].hit._xscale + 10;
      }
      if(game.animationTimer > 4)
      {
         this.main.effects["ship-beam"].ball._yscale = this.main.effects["ship-beam"].ball._yscale - 8;
         this.main.effects["ship-beam"].ball._xscale = this.main.effects["ship-beam"].ball._xscale - 8;
         this.main.effects["ship-beam2"].ball._yscale = this.main.effects["ship-beam2"].ball._yscale - 8;
         this.main.effects["ship-beam2"].ball._xscale = this.main.effects["ship-beam2"].ball._xscale - 8;
         if(this.main.effects["ship-beam"].ball._yscale <= 0)
         {
            this.main.effects["ship-beam"].ball._yscale = 0;
            this.main.effects["ship-beam"].ball._xscale = 0;
            this.main.effects["ship-beam2"].ball._yscale = 0;
            this.main.effects["ship-beam2"].ball._xscale = 0;
         }
         this.main.effects["ship-beam"].hit._yscale = this.main.effects["ship-beam"].hit._yscale - 5;
         this.main.effects["ship-beam"].hit._xscale = this.main.effects["ship-beam"].hit._xscale - 5;
         this.main.effects["ship-beam2"].hit._yscale = this.main.effects["ship-beam2"].hit._yscale - 5;
         this.main.effects["ship-beam2"].hit._xscale = this.main.effects["ship-beam2"].hit._xscale - 5;
      }
      game.animationTimer = game.animationTimer + 1;
      if(this.main.effects["ship-beam"].hit._xscale <= 0)
      {
         game.animationGoal = true;
         game.animationTimer = null;
         this.main.effects["ship-beam"].removeMovieClip();
         this.main.effects["ship-beam2"].removeMovieClip();
      }
   }
   if(animationArray[0] == "boardCrew")
   {
      trace(animationArray[1] + " " + this.main.crew["crew" + animationArray[1]]._x);
      this.main.crew["crew" + animationArray[1]]._alpha = this.main.crew["crew" + animationArray[1]]._alpha - 20;
      this.main.crew["battlebots" + animationArray[2]]._alpha = this.main.crew["battlebots" + animationArray[2]]._alpha - 20;
      if(this.main.crew["crew" + animationArray[1]]._alpha <= 0)
      {
         this.main.crew["crew" + animationArray[1]]._alpha = 0;
         this.main.crew["battlebots" + animationArray[2]]._alpha = 0;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "launchFighters")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         if(animationArray[4] == "fissure")
         {
            fissureLoop = 10;
            f0endX = game.coordinateLocations[0][0].center[0] + this.main.ship._x + 50;
            f0endY = game.coordinateLocations[0][0].center[1] + this.main.ship._y;
            f1endX = game.coordinateLocations[0][0].center[0] + this.main.ship._x - 50;
            f1endY = game.coordinateLocations[0][0].center[1] + this.main.ship._y + 10;
            f2endX = game.coordinateLocations[0][0].center[0] + this.main.ship._x - 30;
            f2endY = game.coordinateLocations[0][0].center[1] + this.main.ship._y - 30;
         }
         else if(animationArray[1].length == 1)
         {
            f0endX = game.coordinateLocations[0][0]["fighterZone" + game.threats[animationArray[1][0]].zone][0];
            f0endY = game.coordinateLocations[0][0]["fighterZone" + game.threats[animationArray[1][0]].zone][1];
            f1endX = game.coordinateLocations[0][0]["fighterZone" + game.threats[animationArray[1][0]].zone][0] + 5;
            f1endY = game.coordinateLocations[0][0]["fighterZone" + game.threats[animationArray[1][0]].zone][1] + 10;
            f2endX = game.coordinateLocations[0][0]["fighterZone" + game.threats[animationArray[1][0]].zone][0] + 110;
            f2endY = game.coordinateLocations[0][0]["fighterZone" + game.threats[animationArray[1][0]].zone][1] + 5;
         }
         else
         {
            f0endX = game.coordinateLocations[0][0].fighterZone0[0];
            f0endY = game.coordinateLocations[0][0].fighterZone0[1];
            f1endX = game.coordinateLocations[0][0].fighterZone1[0];
            f1endY = game.coordinateLocations[0][0].fighterZone1[1];
            f2endX = game.coordinateLocations[0][0].fighterZone2[0];
            f2endY = game.coordinateLocations[0][0].fighterZone2[1];
         }
      }
      if(game.animationTimer == 0)
      {
         _root.soundBox.playSound("launchFightersSND");
         _root.soundBox.playSound("rocket2SND");
         this.main.fighters.fighter0.gotoAndPlay("thrust");
         this.main.fighters.fighter1.gotoAndPlay("thrust");
         this.main.fighters.fighter2.gotoAndPlay("thrust");
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer > 0 && game.animationTimer < 4)
      {
         fa = 0;
         while(fa < 3)
         {
            if(this["f" + fa + "endY"] != null)
            {
               startX = this.main.fighters["fighter" + fa]._x;
               startY = this.main.fighters["fighter" + fa]._y;
               game.ship[0]["Fighter" + fa + "Heading"] = checkHeading(game.ship[0]["Fighter" + fa + "Heading"],startX,startY,this["f" + fa + "endX"],this["f" + fa + "endY"],15);
               xvel = Math.sin(game.ship[0]["Fighter" + fa + "Heading"] * 3.141592653589793 / 180) * 15;
               yvel = Math.cos(game.ship[0]["Fighter" + fa + "Heading"] * 3.141592653589793 / 180) * 15 * -1;
               if(xvel <= 0)
               {
                  this.main.fighters["fighter" + fa]._xscale = 100;
               }
               if(xvel > 0)
               {
                  this.main.fighters["fighter" + fa]._xscale = -100;
               }
               if(distPointToPoint(startX,startY,this["f" + fa + "endX"],this["f" + fa + "endY"]) > 15)
               {
                  this.main.fighters["fighter" + fa]._x = this.main.fighters["fighter" + fa]._x + xvel;
                  this.main.fighters["fighter" + fa]._y = this.main.fighters["fighter" + fa]._y + yvel;
               }
               else
               {
                  this.main.fighters["fighter" + fa]._x = this["f" + fa + "endX"];
                  this.main.fighters["fighter" + fa]._y = this["f" + fa + "endY"];
               }
               if(this.main.fighters["fighter" + fa]._x == this["f" + fa + "endX"] && this.main.fighters["fighter" + fa]._y == this["f" + fa + "endY"])
               {
                  this.main.fighters["fighter" + fa].gotoAndPlay("hover");
                  if(fa < 2)
                  {
                     this.main.fighters["fighter" + fa]._xscale = -100;
                  }
                  if(animationArray[1].length == 1)
                  {
                     this.main.fighters.fighter2._xscale = 100;
                  }
                  this["f" + fa + "endY"] = null;
                  game.animationTimer = game.animationTimer + 1;
               }
            }
            fa++;
         }
      }
      if(game.animationTimer == 4)
      {
         _root.soundBox.stopSound();
         if(animationArray[1] != "miss" && animationArray[4] != "fissure")
         {
            fa = 0;
            while(fa < animationArray[1].length)
            {
               this.main.effects.attachMovie("fighter-explosion","fe" + fa,this.main.effects.getNextHighestDepth());
               this.main.effects["fe" + fa]._x = this.main.threats["threatDisplay" + animationArray[1][fa]]._x + 81;
               this.main.effects["fe" + fa]._y = this.main.threats["threatDisplay" + animationArray[1][fa]]._y + 72;
               this.main.effects["fe" + fa]._rotation = calculateRandom(0,360);
               fa++;
            }
            game.animationTimer = game.animationTimer + 1;
         }
         else if(animationArray[4] == "fissure")
         {
            game.animationTimer = game.animationTimer + 1;
         }
         else
         {
            game.animationTimer = 6;
         }
      }
      if(game.animationTimer == 5)
      {
         if(animationArray[4] == "fissure")
         {
            if(fissureLoop == 10)
            {
               _root.soundBox.playSound("weldSND");
               this.main.fighters.fighter0._xscale = 100;
               fa = 0;
               while(fa < 3)
               {
                  this.main.fighters["fighter" + fa].gotoAndPlay("fix");
                  fa++;
               }
            }
            fissureLoop--;
            if(fissureLoop == 0)
            {
               game.animationTimer = game.animationTimer + 1;
               this.main.fighters.fighter0.gotoAndPlay("hover");
               this.main.fighters.fighter1.gotoAndPlay("hover");
               this.main.fighters.fighter2.gotoAndPlay("hover");
            }
         }
         else if(this.main.effects.fe0._x == null)
         {
            game.animationTimer = game.animationTimer + 1;
            this.main.fighters.fighter0.gotoAndPlay("hover");
            this.main.fighters.fighter1.gotoAndPlay("hover");
            this.main.fighters.fighter2.gotoAndPlay("hover");
         }
         else
         {
            fa = 0;
            while(fa < 3)
            {
               this.main.fighters["fighter" + fa].gotoAndPlay("shoot" + calculateRandom(1,5));
               fa++;
            }
         }
      }
      if(game.animationTimer == 6)
      {
         game.animationGoal = true;
         game.animationTimer = null;
      }
   }
   if(animationArray[0] == "reveal")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         _root.soundBox.playSound("shieldSND");
      }
      this.main.threats["threatDisplay" + animationArray[1]].pic._alpha = this.main.threats["threatDisplay" + animationArray[1]].pic._alpha + 15;
      if(this.main.threats["threatDisplay" + animationArray[1]].pic._alpha > 100)
      {
         this.main.threats["threatDisplay" + animationArray[1]].pic._alpha = 100;
      }
      if(this.main.threats["threatDisplay" + animationArray[1]].pic._alpha >= 100)
      {
         game.animationGoal = true;
         game.animationTimer = null;
      }
   }
   if(animationArray[0] == "impact")
   {
      if(game.animationTimer == null)
      {
         this.main.effects.attachMovie("explosion","explosion",this.main.effects.getNextHighestDepth());
         this.main.effects.explosion._x = this.main.ship._x + this.main.ship._width / 2;
         this.main.effects.explosion._y = this.main.ship._y + this.main.ship._height / 3;
         this.main.effects.explosion._yscale = 800;
         this.main.effects.explosion._xscale = 800;
         game.animationTimer = 0;
      }
      this.main._x = calculateRandom(0,40) - 20;
      this.main._y = calculateRandom(0,40) - 20;
      if(this.main.effects.explosion._y == null)
      {
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "debrisAttack")
   {
      if(game.animationTimer == null)
      {
         this.main.threats.attachMovie("debris","explosion",this.main.threats.getNextHighestDepth());
         this.main.threats.explosion._x = 253 + animationArray[1] * 225;
         this.main.threats.explosion._y = this.main.ship._y + this.main.ship._height / 4;
         game.animationTimer = 0;
      }
      this.main._x = calculateRandom(0,30) - 15;
      this.main._y = calculateRandom(0,30) - 15;
      if(this.main.threats.explosion._y == null)
      {
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "crabBattle")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("roar");
         this.main.threats.attachMovie("crab","crab",this.main.threats.getNextHighestDepth());
         this.main.threats.crab._x = 400;
         this.main.threats.crab._y = this.main.ship._y + this.main.ship._height / 2;
         this.main.threats.crab._alpha = 20;
         game.animationTimer = 0;
      }
      if(game.animationTimer == 0)
      {
         this.main.threats.crab._y = this.main.threats.crab._y - 7;
         this.main.threats.crab._alpha = this.main.threats.crab._alpha + 20;
         if(this.main.threats.crab._alpha > 100)
         {
            this.main.threats.crab._alpha = 100;
         }
         if(this.main.threats.crab._y < this.main.ship._y + this.main.ship._height / 4)
         {
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer == 1)
      {
         this.main.threats.crab._y = this.main.threats.crab._y + 7;
         if(this.main.threats.crab._y > this.main.ship._y + this.main.ship._height / 2)
         {
            game.animationTimer = game.animationTimer + 1;
            _root.soundBox.playSound("bigExplosionSND");
         }
      }
      if(game.animationTimer > 1)
      {
         this.main._x = calculateRandom(0,30) - 15;
         this.main._y = calculateRandom(0,30) - 15;
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 15)
      {
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
         game.animationGoal = true;
         this.main.threats.crab.removeMovieClip();
      }
   }
   if(animationArray[0] == "octopusBattle")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("roar");
         this.main.threats.attachMovie("octopus","octopus",this.main.threats.getNextHighestDepth());
         this.main.threats.octopus._x = 400;
         this.main.threats.octopus._y = this.main.ship._y + this.main.ship._height / 2;
         this.main.threats.octopus._alpha = 20;
         game.animationTimer = 0;
      }
      if(game.animationTimer == 0)
      {
         this.main.threats.octopus._y = this.main.threats.octopus._y - 7;
         this.main.threats.octopus._alpha = this.main.threats.octopus._alpha + 20;
         if(this.main.threats.octopus._alpha > 100)
         {
            this.main.threats.octopus._alpha = 100;
         }
         if(this.main.threats.octopus._y < this.main.ship._y + this.main.ship._height / 6)
         {
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer == 1)
      {
         this.main.threats.octopus._y = this.main.threats.octopus._y + 7;
         if(this.main.threats.octopus._y > this.main.ship._y + this.main.ship._height / 2)
         {
            game.animationTimer = game.animationTimer + 1;
            _root.soundBox.playSound("bigExplosionSND");
         }
      }
      if(game.animationTimer > 1)
      {
         this.main._x = calculateRandom(0,30) - 15;
         this.main._y = calculateRandom(0,30) - 15;
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 15)
      {
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
         game.animationGoal = true;
         this.main.threats.octopus.removeMovieClip();
      }
   }
   if(animationArray[0] == "cryoshieldDown")
   {
      if(game.animationTimer == null)
      {
         if(game.threats[animationArray[1]].TAG == "SE1-05")
         {
            newPic = "SE1-01";
         }
         if(game.threats[animationArray[1]].TAG == "E1-06")
         {
            newPic = "E1-07";
         }
         this.main.threats["threatDisplay" + animationArray[1]].cryo._alpha = 100;
         this.main.threats["threatDisplay" + animationArray[1]].cryo.gotoAndStop(newPic);
         _root.soundBox.playSound("shieldSND");
         game.animationTimer = 0;
      }
      this.main.threats["threatDisplay" + animationArray[1]].pic._alpha = this.main.threats["threatDisplay" + animationArray[1]].pic._alpha - 20;
      if(this.main.threats["threatDisplay" + animationArray[1]].pic._alpha < 0)
      {
         this.main.threats["threatDisplay" + animationArray[1]].pic._alpha = 0;
      }
      if(this.main.threats["threatDisplay" + animationArray[1]].pic._alpha == 0)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "showMalfunction")
   {
      if(animationArray[4] == "show")
      {
         this.main.ship["M" + animationArray[1] + animationArray[2] + animationArray[3]]._alpha = 100;
      }
      if(animationArray[4] == "hide")
      {
         this.main.ship["M" + animationArray[1] + animationArray[2] + animationArray[3]]._alpha = 0;
      }
      game.animationTimer = null;
      game.animationGoal = true;
   }
   if(animationArray[0] == "detonateRockets")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         loop = animationArray[2] - 1;
         trace("########## " + animationArray[1]);
         trace("########## " + animationArray[2]);
         fa = animationArray[2] - 1;
         while(fa > animationArray[2] - animationArray[1] - 1)
         {
            this.main.effects.attachMovie("explosion","explosion" + fa,this.main.effects.getNextHighestDepth());
            this.main.effects["explosion" + fa]._x = this.main.stuff["rocket" + fa]._x + 10;
            this.main.effects["explosion" + fa]._y = this.main.stuff["rocket" + fa]._y + 40;
            this.main.effects["explosion" + fa]._yscale = 250;
            this.main.effects["explosion" + fa]._xscale = 250;
            this.main.stuff["rocket" + fa].removeMovieClip();
            fa--;
         }
      }
      if(this.main.effects["explosion" + loop]._x == null)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "knockout")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         dir = calculateRandom(0,1);
         if(dir == 0)
         {
            this.main.crew["crew" + animationArray[1]]._xscale = -100;
         }
         else
         {
            this.main.crew["crew" + animationArray[1]]._xscale = 100;
         }
         this.main.crew["crew" + animationArray[1]].gotoAndPlay("knockout");
      }
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 10)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "internalExplosion")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = animationArray[4];
         this.main.effects.attachMovie("explosion","explosion" + animationArray[4],this.main.effects.getNextHighestDepth());
         if(animationArray[2] == "all")
         {
            Xcoord = calculateRandom(0,2);
         }
         else
         {
            Xcoord = animationArray[2];
         }
         if(animationArray[3] == "all")
         {
            Ycoord = calculateRandom(0,1);
         }
         else
         {
            Ycoord = animationArray[3];
         }
         this.main.effects["explosion" + animationArray[4]]._x = game.coordinateLocations[Xcoord][Ycoord].center[0] + this.main.ship._x + calculateRandom(0,70) - 35;
         this.main.effects["explosion" + animationArray[4]]._y = game.coordinateLocations[Xcoord][Ycoord].center[1] + this.main.ship._y + calculateRandom(0,70) - 35;
         this.main.effects["explosion" + animationArray[4]]._yscale = 250 + calculateRandom(0,20) - 10;
         this.main.effects["explosion" + animationArray[4]]._xscale = 250 + calculateRandom(0,20) - 10;
         this.main.effects["explosion" + animationArray[4]]._rotation = calculateRandom(0,360);
         game.animationTimer--;
         loop = 3;
      }
      if(loop == 0 && game.animationTimer > 0)
      {
         this.main.effects.attachMovie("explosion","explosion" + game.animationTimer,this.main.effects.getNextHighestDepth());
         if(animationArray[2] == "all")
         {
            Xcoord = calculateRandom(0,2);
         }
         else
         {
            Xcoord = animationArray[2];
         }
         if(animationArray[3] == "all")
         {
            Ycoord = calculateRandom(0,1);
         }
         else
         {
            Ycoord = animationArray[3];
         }
         this.main.effects["explosion" + game.animationTimer]._x = game.coordinateLocations[Xcoord][Ycoord].center[0] + this.main.ship._x + calculateRandom(0,70) - 35;
         this.main.effects["explosion" + game.animationTimer]._y = game.coordinateLocations[Xcoord][Ycoord].center[1] + this.main.ship._y + calculateRandom(0,70) - 35;
         this.main.effects["explosion" + game.animationTimer]._yscale = 250 + calculateRandom(0,20) - 10;
         this.main.effects["explosion" + game.animationTimer]._xscale = 250 + calculateRandom(0,20) - 10;
         this.main.effects["explosion" + game.animationTimer]._rotation = calculateRandom(0,360);
         game.animationTimer--;
         loop = 3;
      }
      loop--;
      this.main._x = calculateRandom(0,30) - 15;
      this.main._y = calculateRandom(0,30) - 15;
      if(this.main.effects.explosion1._x == null && game.animationTimer <= 0)
      {
         game.animationTimer = null;
         game.animationGoal = true;
         this.main._x = 0;
         this.main._y = 0;
      }
   }
   if(animationArray[0] == "fissure1")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         _root.soundBox.playSound("bigExplosionSND");
      }
      this.main._x = calculateRandom(0,30) - 15;
      this.main._y = calculateRandom(0,30) - 15;
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 4)
      {
         this.main.ship.fissure.gotoAndStop("F2");
      }
      if(game.animationTimer == 8)
      {
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "fissure2")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         _root.soundBox.playSound("bigExplosionSND");
      }
      this.main._x = calculateRandom(0,30) - 15;
      this.main._y = calculateRandom(0,30) - 15;
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 4)
      {
         this.main.ship.fissure.gotoAndStop("F3");
      }
      if(game.animationTimer == 8)
      {
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "fissure3")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         _root.soundBox.playSound("bigExplosionSND");
      }
      this.main._x = calculateRandom(0,30) - 15;
      this.main._y = calculateRandom(0,30) - 15;
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 4)
      {
         this.main.ship.fissure.gotoAndStop("F4");
      }
      if(game.animationTimer == 8)
      {
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "revealFissure")
   {
      if(animationArray[1] == true)
      {
         if(game.animationTimer == null)
         {
            game.animationTimer = 0;
         }
         this.main._x = calculateRandom(0,30) - 15;
         this.main._y = calculateRandom(0,30) - 15;
         game.animationTimer = game.animationTimer + 1;
         if(game.animationTimer == 4)
         {
            this.main.ship.fissure._alpha = 100;
            _root.soundBox.playSound("bigExplosionSND");
         }
         if(game.animationTimer == 8)
         {
            this.main._x = 0;
            this.main._y = 0;
            game.animationTimer = null;
            game.animationGoal = true;
         }
      }
      else
      {
         this.main.ship.fissure._alpha = 0;
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "revealNuke")
   {
      if(animationArray[1] == true)
      {
         this.main.ship.nuklearDevice._alpha = this.main.ship.nuklearDevice._alpha + 20;
         if(this.main.ship.nuklearDevice._alpha > 100)
         {
            this.main.ship.nuklearDevice._alpha = 100;
         }
         if(this.main.ship.nuklearDevice._alpha == 100)
         {
            game.animationTimer = null;
            game.animationGoal = true;
         }
      }
      else
      {
         this.main.ship.nuklearDevice._alpha = 0;
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "showContam")
   {
      this.main.effects.attachMovie("contamination","intruder" + animationArray[1],this.main.effects.getNextHighestDepth());
      this.main.effects["intruder" + animationArray[1]]._x = game.coordinateLocations[0][0].center[0] + this.main.ship._x;
      this.main.effects["intruder" + animationArray[1]]._y = game.coordinateLocations[0][0].center[1] + this.main.ship._y;
      tempLocation = animationArray[1] + 1;
      this.main.effects.attachMovie("contamination","intruder" + tempLocation,this.main.effects.getNextHighestDepth());
      this.main.effects["intruder" + tempLocation]._x = game.coordinateLocations[0][1].center[0] + this.main.ship._x;
      this.main.effects["intruder" + tempLocation]._y = game.coordinateLocations[0][1].center[1] + this.main.ship._y;
      tempLocation++;
      this.main.effects.attachMovie("contamination","intruder" + tempLocation,this.main.effects.getNextHighestDepth());
      this.main.effects["intruder" + tempLocation]._x = game.coordinateLocations[2][0].center[0] + this.main.ship._x;
      this.main.effects["intruder" + tempLocation]._y = game.coordinateLocations[2][0].center[1] + this.main.ship._y;
      tempLocation++;
      this.main.effects.attachMovie("contamination","intruder" + tempLocation,this.main.effects.getNextHighestDepth());
      this.main.effects["intruder" + tempLocation]._x = game.coordinateLocations[2][1].center[0] + this.main.ship._x;
      this.main.effects["intruder" + tempLocation]._y = game.coordinateLocations[2][1].center[1] + this.main.ship._y;
      game.animationGoal = true;
   }
   if(animationArray[0] == "remIcon")
   {
      this.main.effects[animationArray[1]].removeMovieClip();
      game.animationGoal = true;
   }
   if(animationArray[0] == "fisionSurplus")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.effects.attachMovie("atomicBlast","explosion",this.main.effects.getNextHighestDepth());
         this.main.effects.explosion._x = this.main.ship._x + this.main.ship.nuklearDevice._x;
         this.main.effects.explosion._y = this.main.ship._y + this.main.ship.nuklearDevice._y;
      }
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 10)
      {
         this.main.ship.removeMovieClip();
         this.main.crew.removeMovieClip();
         this.main.fighters.removeMovieClip();
         this.main.elevator.removeMovieClip();
         this.main.stuff.removeMovieClip();
         this.main.damage.removeMovieClip();
      }
      if(this.main.effects.explosion._x == null)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "revealIntruder")
   {
      if(animationArray[5] == true)
      {
         _root.soundBox.playSound("intruderSND");
         trace("REVEAL INTRUDER " + game.threats[animationArray[1]].location);
         trace("REVEAL INTRUDER # " + animationArray[1]);
         if(game.ship[animationArray[2]].deck[animationArray[3]].threats[0] == null)
         {
            game.ship[animationArray[2]].deck[animationArray[3]].threats[0] = animationArray[1];
            adjust = 30;
            game.threats[animationArray[1]].location = 0;
         }
         else
         {
            game.ship[animationArray[2]].deck[animationArray[3]].threats[1] = animationArray[1];
            adjust = -10;
            game.threats[animationArray[1]].location = 1;
         }
         trace("REVEAL INTRUDER 2 " + game.threats[animationArray[1]].location);
         Xcoord = game.coordinateLocations[animationArray[2]][animationArray[3]].center[0] + this.main.ship._x;
         Ycoord = game.coordinateLocations[animationArray[2]][animationArray[3]].center[1] + this.main.ship._y + adjust;
         trace(Xcoord + " " + Ycoord);
         this.main.crew.attachMovie(animationArray[4],"intruder" + animationArray[1],Ycoord * 1000 + Xcoord);
         this.main.crew["intruder" + animationArray[1]]._x = Xcoord;
         this.main.crew["intruder" + animationArray[1]]._y = Ycoord;
         game.animationGoal = true;
      }
      else
      {
         this.main.crew["intruder" + animationArray[1]].removeMovieClip();
         game.animationGoal = true;
         game.ship[animationArray[2]].deck[animationArray[3]].threats[game.threats[animationArray[1]].location] = null;
      }
   }
   if(animationArray[0] == "growAlien")
   {
      if(animationArray[2] == 1)
      {
         _root.soundBox.playSound("slimeSquishSND");
         Xcoord = this.main.crew["intruder" + animationArray[1]]._x;
         Ycoord = this.main.crew["intruder" + animationArray[1]]._y;
         this.main.crew["intruder" + animationArray[1]].removeMovieClip();
         this.main.crew.attachMovie("alien1","intruder" + animationArray[1],Ycoord * 1000 + Xcoord);
         this.main.crew["intruder" + animationArray[1]]._x = Xcoord;
         this.main.crew["intruder" + animationArray[1]]._y = Ycoord;
         game.animationGoal = true;
      }
      if(animationArray[2] == 2)
      {
         if(game.animationTimer == null)
         {
            _root.soundBox.playSound("slimeSquishSND");
            game.animationTimer = 0;
            Xcoord = this.main.crew["intruder" + animationArray[1]]._x;
            Ycoord = this.main.crew["intruder" + animationArray[1]]._y;
            this.main.crew["intruder" + animationArray[1]].removeMovieClip();
            this.main.crew.attachMovie("alien2","intruder" + animationArray[1],Ycoord * 1000 + Xcoord);
            this.main.crew["intruder" + animationArray[1]]._x = Xcoord;
            this.main.crew["intruder" + animationArray[1]]._y = Ycoord;
         }
         game.animationTimer = game.animationTimer + 1;
         if(game.animationTimer == 3)
         {
            _root.soundBox.playSound("slimeSND");
            addEgg(1,0,0);
         }
         if(game.animationTimer == 4)
         {
            addEgg(1,0,1);
         }
         if(game.animationTimer == 6)
         {
            _root.soundBox.playSound("slimeSND");
            addEgg(1,0,2);
         }
         if(game.animationTimer == 7)
         {
            _root.soundBox.playSound("slimeSND");
            addEgg(1,0,3);
            addEgg(1,1,4);
         }
         if(game.animationTimer == 8)
         {
            addEgg(1,1,5);
            addEgg(1,1,6);
            addEgg(0,1,7);
         }
         if(game.animationTimer == 9)
         {
            _root.soundBox.playSound("slimeSND");
            addEgg(1,1,8);
            addEgg(1,1,9);
            addEgg(0,0,10);
            addEgg(0,0,11);
            addEgg(2,1,12);
            addEgg(2,1,13);
         }
         if(game.animationTimer == 10)
         {
            _root.soundBox.playSound("slimeSND");
            addEgg(0,1,14);
            addEgg(0,1,15);
            addEgg(2,0,16);
            addEgg(2,0,31);
            addEgg(2,1,17);
            addEgg(2,1,18);
         }
         if(game.animationTimer == 10)
         {
            _root.soundBox.playSound("slimeSND");
            addEgg(0,1,19);
            addEgg(0,1,20);
            addEgg(2,0,21);
            addEgg(2,0,22);
            addEgg(2,1,23);
            addEgg(2,1,24);
         }
         if(game.animationTimer == 11)
         {
            addEgg(0,0,25);
            addEgg(0,0,26);
            addEgg(0,0,27);
            addEgg(2,0,28);
            addEgg(2,1,29);
            addEgg(0,1,30);
         }
         if(game.animationTimer == 30)
         {
            game.animationTimer = null;
            game.animationGoal = true;
         }
      }
   }
   if(animationArray[0] == "moveIntruder")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         trace("MOVE INTRUDER " + game.threats[animationArray[1]].location);
         game.ship[animationArray[4]].deck[animationArray[5]].threats[game.threats[animationArray[1]].location] = null;
         if(game.ship[animationArray[2]].deck[animationArray[3]].threats[0] == null)
         {
            game.ship[animationArray[2]].deck[animationArray[3]].threats[0] = animationArray[1];
            adjust = 30;
            game.threats[animationArray[1]].location = 0;
         }
         else
         {
            game.ship[animationArray[2]].deck[animationArray[3]].threats[1] = animationArray[1];
            adjust = -10;
            game.threats[animationArray[1]].location = 1;
         }
         endX = game.coordinateLocations[animationArray[2]][animationArray[3]].center[0] + this.main.ship._x;
         endY = game.coordinateLocations[animationArray[2]][animationArray[3]].center[1] + this.main.ship._y + adjust;
         this.main.crew["intruder" + animationArray[1]].gotoAndPlay("run");
      }
      moveClip(this.main.crew["intruder" + animationArray[1]],endX,endY,7);
      if(this.main.crew["intruder" + animationArray[1]]._y == endY && this.main.crew["intruder" + animationArray[1]]._x == endX)
      {
         this.main.crew["intruder" + animationArray[1]].gotoAndPlay("stand");
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "showSlime")
   {
      if(animationArray[4] == true)
      {
         Xcoord = game.coordinateLocations[animationArray[2]][animationArray[3]].center[0] + this.main.ship._x;
         Ycoord = game.coordinateLocations[animationArray[2]][animationArray[3]].center[1] + this.main.ship._y;
         this.main.crew.attachMovie("slime","intruder" + animationArray[1],Ycoord * 1000 + Xcoord);
         this.main.crew["intruder" + animationArray[1]]._x = Xcoord;
         this.main.crew["intruder" + animationArray[1]]._y = Ycoord;
      }
      else
      {
         this.main.crew["intruder" + animationArray[1]].removeMovieClip();
      }
      game.animationGoal = true;
   }
}
