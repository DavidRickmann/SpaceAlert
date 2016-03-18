function animRunFunction2(animationArray)
{
   if(animationArray[0] == "activateBattleBots")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSoundLoop("robotWalkSND");
         Xcoord = this.main.crew["battlebots" + animationArray[1]]._x;
         Ycoord = this.main.crew["battlebots" + animationArray[1]]._y;
         this.main.crew["battlebots" + animationArray[1]].removeMovieClip();
         this.main.crew.attachMovie("battlebots","battlebots" + animationArray[1],Ycoord * 1000 + Xcoord);
         this.main.crew["battlebots" + animationArray[1]]._x = Xcoord;
         this.main.crew["battlebots" + animationArray[1]]._y = Ycoord;
         this.main.crew["battlebots" + animationArray[1]].bot1.gotoAndPlay("run");
         this.main.crew["battlebots" + animationArray[1]].bot2.gotoAndPlay("run");
         this.main.crew["battlebots" + animationArray[1]].bot3.gotoAndPlay("run");
         game.animationTimer = 0;
         if(animationArray[7] == true)
         {
            this.main.crew["battlebots" + animationArray[1]].bot1.smoke._alpha = 100;
            this.main.crew["battlebots" + animationArray[1]].bot2.smoke._alpha = 100;
            this.main.crew["battlebots" + animationArray[1]].bot3.smoke._alpha = 100;
         }
         targetX = game.coordinateLocations[animationArray[3]][animationArray[4]][animationArray[5] + "" + animationArray[6]][0] + this.main.ship._x;
         targetY = game.coordinateLocations[animationArray[3]][animationArray[4]][animationArray[5] + "" + animationArray[6]][1] + this.main.ship._y - 12;
      }
      moveClip(this.main.crew["battlebots" + animationArray[1]],targetX,targetY,7);
      if(this.main.crew["battlebots" + animationArray[1]]._y == targetY && this.main.crew["battlebots" + animationArray[1]]._x == targetX)
      {
         _root.soundBox.stopSoundLoop();
         this.main.crew["battlebots" + animationArray[1]].bot1.gotoAndStop("stand");
         this.main.crew["battlebots" + animationArray[1]].bot2.gotoAndStop("stand");
         this.main.crew["battlebots" + animationArray[1]].bot3.gotoAndStop("stand");
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "battleBotAttack")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         _root.soundBox.playSoundLoop("robotWalkSND");
         this.main.crew["battlebots" + animationArray[1]]._alpha = 0;
         Xcoord0 = this.main.crew["battlebots" + animationArray[1]]._x - 10;
         Ycoord0 = this.main.crew["battlebots" + animationArray[1]]._y;
         Xcoord1 = this.main.crew["battlebots" + animationArray[1]]._x - 23;
         Ycoord1 = this.main.crew["battlebots" + animationArray[1]]._y;
         Xcoord2 = this.main.crew["battlebots" + animationArray[1]]._x - 36;
         Ycoord2 = this.main.crew["battlebots" + animationArray[1]]._y;
         this.main.crew.attachMovie("battlebot","battlebot0",Ycoord0 * 1000 + Xcoord0);
         this.main.crew.battlebot0._x = Xcoord0;
         this.main.crew.battlebot0._y = Ycoord0;
         this.main.crew.battlebot0.gotoAndPlay("run");
         endX0 = game.coordinateLocations[animationArray[2]][animationArray[3]].center[0] + this.main.ship._x + 50;
         endY0 = game.coordinateLocations[animationArray[2]][animationArray[3]].center[1] + this.main.ship._y + 30;
         this.main.crew.attachMovie("battlebot","battlebot1",Ycoord1 * 1000 + Xcoord1);
         this.main.crew.battlebot1._x = Xcoord1;
         this.main.crew.battlebot1._y = Ycoord1;
         this.main.crew.battlebot1.gotoAndPlay("run");
         endX1 = game.coordinateLocations[animationArray[2]][animationArray[3]].center[0] + this.main.ship._x - 30;
         endY1 = game.coordinateLocations[animationArray[2]][animationArray[3]].center[1] + this.main.ship._y - 6;
         this.main.crew.attachMovie("battlebot","battlebot2",Ycoord2 * 1000 + Xcoord2);
         this.main.crew.battlebot2._x = Xcoord2;
         this.main.crew.battlebot2._y = Ycoord2;
         this.main.crew.battlebot2.gotoAndPlay("run");
         endX2 = game.coordinateLocations[animationArray[2]][animationArray[3]].center[0] + this.main.ship._x - 55;
         endY2 = game.coordinateLocations[animationArray[2]][animationArray[3]].center[1] + this.main.ship._y + 41;
         flag10 = false;
         flag11 = false;
         flag12 = false;
      }
      if(game.animationTimer < 3)
      {
         fa = 0;
         while(fa < 3)
         {
            moveClip(this.main.crew["battlebot" + fa],this["endX" + fa],this["endY" + fa],7);
            if(this.main.crew["battlebot" + fa]._x == this["endX" + fa] && this.main.crew["battlebot" + fa]._y == this["endY" + fa] && this["flag1" + fa] != true)
            {
               if(fa == 0)
               {
                  this.main.crew["battlebot" + fa]._xscale = -100;
               }
               if(fa == 1)
               {
                  this.main.crew["battlebot" + fa]._xscale = 100;
               }
               if(fa == 2)
               {
                  this.main.crew["battlebot" + fa]._xscale = 100;
               }
               this.main.crew["battlebot" + fa].gotoAndStop("stand");
               this["flag1" + fa] = true;
               game.animationTimer = game.animationTimer + 1;
            }
            fa++;
         }
      }
      if(game.animationTimer >= 3 && game.animationTimer < 13)
      {
         _root.soundBox.stopSoundLoop();
         _root.soundBox.playSound("botLaserSND");
         _root.soundBox.playSound("botLaserSND");
         this.main.crew.battlebot0.gotoAndPlay("s" + calculateRandom(1,2) + calculateRandom(1,4));
         this.main.crew.battlebot1.gotoAndPlay("s" + calculateRandom(1,2) + calculateRandom(1,4));
         this.main.crew.battlebot2.gotoAndPlay("s" + calculateRandom(1,2) + calculateRandom(1,4));
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 4 && animationArray[6] == true)
      {
         this.main.crew["intruder" + animationArray[4]].gotoAndPlay("counter");
         this.main.crew.battlebot0.bot1.smoke._alpha = 100;
         this.main.crew.battlebot1.bot2.smoke._alpha = 100;
         this.main.crew.battlebot2.bot3.smoke._alpha = 100;
      }
      if(game.animationTimer == 10 && animationArray[4] != null)
      {
         if(animationArray[5] == true)
         {
            type = "die";
         }
         else
         {
            type = "hit";
         }
         this.main.crew["intruder" + animationArray[4]].gotoAndPlay(type);
      }
      if(animationArray[7] == true && game.animationTimer == 11)
      {
         this.main.crew["crew" + animationArray[8]].gotoAndPlay("knockout");
         this.main.crew.battlebot0.bot1.smoke._alpha = 100;
         this.main.crew.battlebot1.bot2.smoke._alpha = 100;
         this.main.crew.battlebot2.bot3.smoke._alpha = 100;
      }
      if(game.animationTimer == 13)
      {
         _root.soundBox.playSoundLoop("robotWalkSND");
         endX0 = this.main.crew["battlebots" + animationArray[1]]._x - 10 + 20;
         endY0 = this.main.crew["battlebots" + animationArray[1]]._y;
         this.main.crew.battlebot0.gotoAndPlay("run");
         endX1 = this.main.crew["battlebots" + animationArray[1]]._x - 23 + 20;
         endY1 = this.main.crew["battlebots" + animationArray[1]]._y;
         this.main.crew.battlebot1.gotoAndPlay("run");
         endX2 = this.main.crew["battlebots" + animationArray[1]]._x - 36 + 20;
         endY2 = this.main.crew["battlebots" + animationArray[1]]._y;
         this.main.crew.battlebot2.gotoAndPlay("run");
         game.animationTimer = game.animationTimer + 1;
      }
      flag0 = false;
      flag1 = false;
      flag2 = false;
      if(game.animationTimer > 13)
      {
         fa = 0;
         while(fa < 3)
         {
            moveClip(this.main.crew["battlebot" + fa],this["endX" + fa],this["endY" + fa],7);
            if(this.main.crew["battlebot" + fa]._x == this["endX" + fa] && this.main.crew["battlebot" + fa]._y == this["endY" + fa] && this["flag" + fa] == false)
            {
               this.main.crew["battlebot" + fa].gotoAndPlay("stand");
               this["flag" + fa] = true;
            }
            fa++;
         }
      }
      if(flag0 == true && flag1 == true && flag2 == true)
      {
         _root.soundBox.stopSoundLoop();
         this.main.crew["battlebots" + animationArray[1]]._alpha = 100;
         if(animationArray[6] == true || animationArray[7] == true)
         {
            this.main.crew["battlebots" + animationArray[1]].bot1.smoke._alpha = 100;
            this.main.crew["battlebots" + animationArray[1]].bot2.smoke._alpha = 100;
            this.main.crew["battlebots" + animationArray[1]].bot3.smoke._alpha = 100;
         }
         else
         {
            this.main.crew["battlebots" + animationArray[1]].bot1.smoke._alpha = 0;
            this.main.crew["battlebots" + animationArray[1]].bot2.smoke._alpha = 0;
            this.main.crew["battlebots" + animationArray[1]].bot3.smoke._alpha = 0;
         }
         this.main.crew.battlebot0.removeMovieClip();
         this.main.crew.battlebot1.removeMovieClip();
         this.main.crew.battlebot2.removeMovieClip();
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "fixBattleBots")
   {
      if(animationArray[2] == null)
      {
         this.main.crew["battlebots" + animationArray[1]].bot1.smoke._alpha = 0;
         this.main.crew["battlebots" + animationArray[1]].bot2.smoke._alpha = 0;
         this.main.crew["battlebots" + animationArray[1]].bot3.smoke._alpha = 0;
      }
      else
      {
         this.main.crew["battlebots" + animationArray[1]].bot1.smoke._alpha = 100;
         this.main.crew["battlebots" + animationArray[1]].bot2.smoke._alpha = 100;
         this.main.crew["battlebots" + animationArray[1]].bot3.smoke._alpha = 100;
      }
      game.animationGoal = true;
   }
   if(animationArray[0] == "intruderAttack")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.crew["intruder" + animationArray[1]].gotoAndPlay("attack" + animationArray[2]);
      }
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 8)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "playSound")
   {
      _root.soundBox.playSound(animationArray[1]);
      game.animationGoal = true;
   }
   if(animationArray[0] == "playSound2")
   {
      _root.soundBox.playSound2(animationArray[1]);
      game.animationGoal = true;
   }
   if(animationArray[0] == "shipDestoyed")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         shipX = this.main.ship._x;
         shipY = this.main.ship._y;
         shipW = this.main.ship._width;
         shipH = this.main.ship._height;
      }
      if(game.animationTimer <= 20)
      {
         fa = 0;
         while(fa < 4)
         {
            if(calculateRandom(1,3) < 2)
            {
               this.main.effects.attachMovie("explosion","explosion" + (game.animationTimer * 100 + fa),this.main.effects.getNextHighestDepth());
               this.main.effects["explosion" + (game.animationTimer * 100 + fa)]._x = shipX + calculateRandom(0,shipW);
               this.main.effects["explosion" + (game.animationTimer * 100 + fa)]._y = shipY + calculateRandom(0,shipH);
               this.main.effects["explosion" + (game.animationTimer * 100 + fa)]._yscale = 300 + calculateRandom(0,300);
               this.main.effects["explosion" + (game.animationTimer * 100 + fa)]._xscale = this.main.effects["explosion" + (game.animationTimer * 100 + fa)]._yscale;
            }
            fa++;
         }
      }
      if(game.animationTimer == 20)
      {
         _root.soundBox.playSound("bigExplosionSND");
         this.main.effects.attachMovie("explosion","explosion" + game.animationTimer * 100,this.main.effects.getNextHighestDepth());
         this.main.effects["explosion" + game.animationTimer * 100]._x = shipX + shipW / 2;
         this.main.effects["explosion" + game.animationTimer * 100]._y = shipY + shipH / 2;
         this.main.effects["explosion" + game.animationTimer * 100]._yscale = 700;
         this.main.effects["explosion" + game.animationTimer * 100]._xscale = this.main.effects["explosion" + game.animationTimer * 100]._yscale;
      }
      if(game.animationTimer == 22)
      {
         this.main.ship.removeMovieClip();
         this.main.crew.removeMovieClip();
         this.main.fighters.removeMovieClip();
         this.main.elevator.removeMovieClip();
         this.main.stuff.removeMovieClip();
         this.main.damage.removeMovieClip();
      }
      game.animationTimer = game.animationTimer + 1;
      this.main._x = calculateRandom(0,60) - 30;
      this.main._y = calculateRandom(0,60) - 30;
      if(game.animationTimer == 28)
      {
         this.main._x = 0;
         this.main._y = 0;
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "playSoundLoop")
   {
      _root.soundBox.playSoundLoop(animationArray[1]);
      game.animationGoal = true;
   }
   if(animationArray[0] == "stopSoundLoop")
   {
      _root.soundBox.stopSoundLoop(animationArray[1]);
      game.animationGoal = true;
   }
   if(animationArray[0] == "playSoundLoop2")
   {
      _root.soundBox.playSoundLoop2(animationArray[1]);
      game.animationGoal = true;
   }
   if(animationArray[0] == "stopSoundLoop2")
   {
      _root.soundBox.stopSoundLoop2(animationArray[1]);
      game.animationGoal = true;
   }
   if(animationArray[0] == "fadeIcon")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.effects.attachMovie(animationArray[1],"fadeIcon",this.main.effects.getNextHighestDepth());
         this.main.effects.fadeIcon._x = this.main.ship._x + animationArray[2];
         this.main.effects.fadeIcon._y = this.main.ship._y + animationArray[3] - 54;
         if(animationArray[2] != null)
         {
            _root.soundBox.playSound(animationArray[4]);
         }
      }
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 10)
      {
         this.main.effects.fadeIcon.removeMovieClip();
      }
      if(this.main.effects.fadeIcon._x == null)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "warpOut")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
      }
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 1)
      {
         _root.soundBox.playSound("teleport");
         this.main.effects.attachMovie("warp","warp",this.main.effects.getNextHighestDepth());
         this.main.effects.warp._x = 388.5;
         this.main.effects.warp._y = 477;
      }
      if(game.animationTimer == 8)
      {
         this.main.ship.removeMovieClip();
         this.main.crew.removeMovieClip();
         this.main.fighters.removeMovieClip();
         this.main.elevator.removeMovieClip();
         this.main.stuff.removeMovieClip();
         this.main.damage.removeMovieClip();
      }
      if(this.main.effects.warp._x == null && game.animationTimer > 10)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "moveMouse")
   {
      this.main.ship.PC.gotoAndPlay("windows");
      _root.soundBox.playSound("chimeSND");
      game.animationGoal = true;
   }
   if(animationArray[0] == "screenSaver")
   {
      this.main.ship.PC.gotoAndPlay("saver");
      game.animationGoal = true;
   }
   if(animationArray[0] == "heroOn")
   {
      if(game.animationTimer == null)
      {
         this.main.crew["crew" + animationArray[1]].hero._alpha = 100;
         game.animationTimer = 0;
      }
      game.animationTimer = game.animationTimer + 1;
      if(game.animationTimer == 10)
      {
         game.animationGoal = true;
         game.animationTimer = null;
      }
   }
   if(animationArray[0] == "heroOff")
   {
      this.main.crew["crew" + animationArray[1]].hero._alpha = 0;
      game.animationGoal = true;
   }
   if(animationArray[0] == "battleBotUprisng-attack")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         _root.soundBox.playSoundLoop("robotWalkSND");
         Xcoord = this.main.crew["battlebots" + animationArray[1]]._x;
         Ycoord = this.main.crew["battlebots" + animationArray[1]]._y;
         Xcoord0 = this.main.crew["battlebots" + animationArray[1]]._x - 10;
         Ycoord0 = this.main.crew["battlebots" + animationArray[1]]._y;
         Xcoord1 = this.main.crew["battlebots" + animationArray[1]]._x - 23;
         Ycoord1 = this.main.crew["battlebots" + animationArray[1]]._y;
         Xcoord2 = this.main.crew["battlebots" + animationArray[1]]._x - 36;
         Ycoord2 = this.main.crew["battlebots" + animationArray[1]]._y;
         this.main.crew.attachMovie("battlebot","battlebot0",Ycoord0 * 1000 + Xcoord0);
         this.main.crew.battlebot0._x = Xcoord0;
         this.main.crew.battlebot0._y = Ycoord0;
         this.main.crew.battlebot0.gotoAndPlay("run");
         endX0 = game.coordinateLocations[animationArray[3]][animationArray[4]].center[0] + this.main.ship._x + 50;
         endY0 = game.coordinateLocations[animationArray[3]][animationArray[4]].center[1] + this.main.ship._y + 30;
         this.main.crew.attachMovie("battlebot","battlebot1",Ycoord1 * 1000 + Xcoord1);
         this.main.crew.battlebot1._x = Xcoord1;
         this.main.crew.battlebot1._y = Ycoord1;
         this.main.crew.battlebot1.gotoAndPlay("run");
         endX1 = game.coordinateLocations[animationArray[3]][animationArray[4]].center[0] + this.main.ship._x - 30;
         endY1 = game.coordinateLocations[animationArray[3]][animationArray[4]].center[1] + this.main.ship._y - 6;
         this.main.crew.attachMovie("battlebot","battlebot2",Ycoord2 * 1000 + Xcoord2);
         this.main.crew.battlebot2._x = Xcoord2;
         this.main.crew.battlebot2._y = Ycoord2;
         this.main.crew.battlebot2.gotoAndPlay("run");
         endX2 = game.coordinateLocations[animationArray[3]][animationArray[4]].center[0] + this.main.ship._x - 55;
         endY2 = game.coordinateLocations[animationArray[3]][animationArray[4]].center[1] + this.main.ship._y + 41;
         flag10 = false;
         flag11 = false;
         flag12 = false;
         if(animationArray[6] == "damaged")
         {
            this.main.crew.battlebot0.smoke._alpha = 100;
            this.main.crew.battlebot1.smoke._alpha = 100;
            this.main.crew.battlebot2.smoke._alpha = 100;
         }
         this.main.crew["battlebots" + animationArray[1]].removeMovieClip();
      }
      if(game.animationTimer < 3)
      {
         fa = 0;
         while(fa < 3)
         {
            moveClip(this.main.crew["battlebot" + fa],this["endX" + fa],this["endY" + fa],7);
            if(this.main.crew["battlebot" + fa]._x == this["endX" + fa] && this.main.crew["battlebot" + fa]._y == this["endY" + fa] && this["flag1" + fa] != true)
            {
               if(fa == 0)
               {
                  this.main.crew["battlebot" + fa]._xscale = -100;
               }
               if(fa == 1)
               {
                  this.main.crew["battlebot" + fa]._xscale = 100;
               }
               if(fa == 2)
               {
                  this.main.crew["battlebot" + fa]._xscale = 100;
               }
               this.main.crew["battlebot" + fa].gotoAndStop("stand");
               this["flag1" + fa] = true;
               game.animationTimer = game.animationTimer + 1;
            }
            fa++;
         }
      }
      if(game.animationTimer >= 3 && game.animationTimer < 13)
      {
         _root.soundBox.stopSoundLoop();
         _root.soundBox.playSound("botLaserSND");
         _root.soundBox.playSound("botLaserSND");
         this.main.crew.battlebot0.gotoAndPlay("s" + calculateRandom(1,2) + calculateRandom(1,4));
         this.main.crew.battlebot1.gotoAndPlay("s" + calculateRandom(1,2) + calculateRandom(1,4));
         this.main.crew.battlebot2.gotoAndPlay("s" + calculateRandom(1,2) + calculateRandom(1,4));
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 11)
      {
         this.main.crew["crew" + animationArray[2]].gotoAndPlay("knockout");
      }
      if(game.animationTimer == 13)
      {
         _root.soundBox.playSoundLoop("robotWalkSND");
         endX = Xcoord;
         endY = Ycoord;
         endX0 = endX - 10 + 20;
         endY0 = endY;
         this.main.crew.battlebot0.gotoAndPlay("run");
         endX1 = endX - 23 + 20;
         endY1 = endY;
         this.main.crew.battlebot1.gotoAndPlay("run");
         endX2 = endX - 36 + 20;
         endY2 = endY;
         this.main.crew.battlebot2.gotoAndPlay("run");
         game.animationTimer = game.animationTimer + 1;
      }
      flag0 = false;
      flag1 = false;
      flag2 = false;
      if(game.animationTimer > 13)
      {
         fa = 0;
         while(fa < 3)
         {
            moveClip(this.main.crew["battlebot" + fa],this["endX" + fa],this["endY" + fa],7);
            if(this.main.crew["battlebot" + fa]._x == this["endX" + fa] && this.main.crew["battlebot" + fa]._y == this["endY" + fa] && this["flag" + fa] == false)
            {
               this.main.crew["battlebot" + fa].gotoAndPlay("stand");
               this["flag" + fa] = true;
            }
            fa++;
         }
      }
      if(flag0 == true && flag1 == true && flag2 == true)
      {
         _root.soundBox.stopSoundLoop();
         this.main.crew.attachMovie("battlebots","battlebots" + animationArray[1],endY * 1000 + endX);
         this.main.crew["battlebots" + animationArray[1]]._x = endX;
         this.main.crew["battlebots" + animationArray[1]]._y = endY;
         if(animationArray[6] == "damaged")
         {
            this.main.crew["battlebots" + animationArray[1]].bot1.smoke._alpha = 100;
            this.main.crew["battlebots" + animationArray[1]].bot2.smoke._alpha = 100;
            this.main.crew["battlebots" + animationArray[1]].bot3.smoke._alpha = 100;
         }
         this.main.crew.battlebot0.removeMovieClip();
         this.main.crew.battlebot1.removeMovieClip();
         this.main.crew.battlebot2.removeMovieClip();
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "battleBotUprisng-move")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         if(animationArray[3] != null)
         {
            game.ship[animationArray[3]].deck[animationArray[4]].threats[game.threat[animationArray[5]].location[animationArray[1]]] = null;
         }
         if(game.ship[animationArray[7]].deck[animationArray[8]].threats[0] == null)
         {
            game.ship[animationArray[7]].deck[animationArray[8]].threats[0] = animationArray[5];
            adjust = 30;
            game.threat[animationArray[5]].location[animationArray[1]] = 0;
         }
         else
         {
            game.ship[animationArray[7]].deck[animationArray[8]].threats[1] = animationArray[5];
            adjust = -10;
            game.threat[animationArray[5]].location[animationArray[1]] = 1;
         }
         endX = game.coordinateLocations[animationArray[7]][animationArray[8]].center[0] + this.main.ship._x;
         endY = game.coordinateLocations[animationArray[7]][animationArray[8]].center[1] + this.main.ship._y + adjust;
         this.main.crew["battlebots" + animationArray[1]].bot1.gotoAndPlay("run");
         this.main.crew["battlebots" + animationArray[1]].bot2.gotoAndPlay("run");
         this.main.crew["battlebots" + animationArray[1]].bot3.gotoAndPlay("run");
         _root.soundBox.playSoundLoop("robotWalkSND");
      }
      moveClip(this.main.crew["battlebots" + animationArray[1]],endX,endY,7);
      if(this.main.crew["battlebots" + animationArray[1]]._y == endY && this.main.crew["battlebots" + animationArray[1]]._x == endX)
      {
         this.main.crew["battlebots" + animationArray[1]].bot1.gotoAndPlay("stand");
         this.main.crew["battlebots" + animationArray[1]].bot2.gotoAndPlay("stand");
         this.main.crew["battlebots" + animationArray[1]].bot3.gotoAndPlay("stand");
         _root.soundBox.stopSoundLoop();
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "battleBotUprisng-destroyed")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         if(animationArray[3] != null)
         {
            game.ship[animationArray[3]].deck[animationArray[4]].threats[game.threat[animationArray[5]].location[animationArray[1]]] = null;
         }
         _root.soundBox.playSoundLoop("robotWalkSND");
         endX = game.coordinateLocations["battlebots" + animationArray[1]][0] + this.main.ship._x;
         endY = game.coordinateLocations["battlebots" + animationArray[1]][1] + this.main.ship._y;
         this.main.crew["battlebots" + animationArray[1]].bot1.gotoAndPlay("run");
         this.main.crew["battlebots" + animationArray[1]].bot2.gotoAndPlay("run");
         this.main.crew["battlebots" + animationArray[1]].bot3.gotoAndPlay("run");
      }
      moveClip(this.main.crew["battlebots" + animationArray[1]],endX,endY,7);
      if(this.main.crew["battlebots" + animationArray[1]]._y == endY && this.main.crew["battlebots" + animationArray[1]]._x == endX)
      {
         this.main.crew["battlebots" + animationArray[1]].bot1.gotoAndPlay("stand");
         this.main.crew["battlebots" + animationArray[1]].bot2.gotoAndPlay("stand");
         this.main.crew["battlebots" + animationArray[1]].bot3.gotoAndPlay("stand");
         _root.soundBox.stopSoundLoop();
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "showCrewAction")
   {
      if(game.animationTimer == null)
      {
         game.animationTimer = 0;
         this.main.effects.attachMovie("crew-plate","crew-plate",this.main.effects.getNextHighestDepth());
         this.main.effects["crew-plate"]._x = 774;
         this.main.effects["crew-plate"]._y = 160;
         this.main.effects["crew-plate"]._alpha = 0;
         this.main.effects["crew-plate"].attachMovie("menu-crew" + animationArray[1],"menu-crew",this.main.effects["crew-plate"].getNextHighestDepth());
         this.main.effects["crew-plate"]["menu-crew"]._x = 20;
         this.main.effects["crew-plate"]["menu-crew"]._y = 53;
         this.main.effects["crew-plate"].attachMovie("menu-actions-button-" + animationArray[2],"menu-actions-button",this.main.effects["crew-plate"].getNextHighestDepth());
         this.main.effects["crew-plate"]["menu-actions-button"]._x = 81;
         this.main.effects["crew-plate"]["menu-actions-button"]._y = 61;
         this.main.effects["crew-plate"].name = animationArray[3];
      }
      if(game.animationTimer == 0)
      {
         this.main.effects["crew-plate"]._alpha = this.main.effects["crew-plate"]._alpha + 25;
         if(this.main.effects["crew-plate"]._alpha >= 100)
         {
            this.main.effects["crew-plate"]._alpha = 100;
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer > 0 && game.animationTimer < 8)
      {
         game.animationTimer = game.animationTimer + 1;
      }
      if(game.animationTimer == 8)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "hideCrewAction")
   {
      this.main.effects["crew-plate"]._alpha = this.main.effects["crew-plate"]._alpha - 25;
      if(this.main.effects["crew-plate"]._alpha <= 0)
      {
         this.main.effects["crew-plate"]._alpha = 0;
         this.main.effects["crew-plate"].removeMovieClip();
      }
      if(this.main.effects["crew-plate"]._x == null)
      {
         game.animationTimer = null;
         game.animationGoal = true;
      }
   }
   if(animationArray[0] == "threatFrame")
   {
      if(animationArray[2] == "show")
      {
         this.main.threats["threatDisplay" + animationArray[1]].frame._alpha = 100;
      }
      if(animationArray[2] == "hide")
      {
         this.main.threats["threatDisplay" + animationArray[1]].frame._alpha = 0;
      }
      game.animationGoal = true;
   }
   if(animationArray[0] == "chargeWeapon")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("chargeSND");
         game.animationTimer = 0;
      }
      this.main.ship[animationArray[1]]._alpha = this.main.ship[animationArray[1]]._alpha + 20;
      if(this.main.ship[animationArray[1]]._alpha >= 100)
      {
         this.main.ship[animationArray[1]]._alpha = 100;
         game.animationGoal = true;
         game.animationTimer = null;
      }
   }
   if(animationArray[0] == "landFighters")
   {
      if(game.animationTimer == null)
      {
         _root.soundBox.playSound("rocket2SND");
         this.main.fighters.fighter0.gotoAndPlay("thrust");
         this.main.fighters.fighter1.gotoAndPlay("thrust");
         this.main.fighters.fighter2.gotoAndPlay("thrust");
         game.animationTimer = 0;
         f0endX = game.coordinateLocations.fighter0[0];
         f0endY = game.coordinateLocations.fighter0[1];
         f1endX = game.coordinateLocations.fighter1[0];
         f1endY = game.coordinateLocations.fighter1[1];
         f2endX = game.coordinateLocations.fighter2[0];
         f2endY = game.coordinateLocations.fighter2[1];
      }
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
               this["f" + fa + "endY"] = null;
               _root.soundBox.stopSound();
               this.main.fighters["fighter" + fa].gotoAndPlay(1);
               this.main.fighters["fighter" + fa]._xscale = 100;
               game.ship[0]["Fighter" + fa + "Heading"] = 280;
               if(animationArray[4] == true)
               {
                  this.main.crew["crew" + animationArray[2]].gotoAndPlay("knockout");
               }
               game.animationTimer = game.animationTimer + 1;
            }
         }
         fa++;
      }
      if(game.animationTimer == 3)
      {
         this.main.crew["crew" + animationArray[2]]._alpha = this.main.crew["crew" + animationArray[2]]._alpha + 20;
         this.main.crew["battlebots" + animationArray[3]]._alpha = this.main.crew["battlebots" + animationArray[3]]._alpha + 20;
         if(this.main.crew["crew" + animationArray[2]]._alpha >= 100)
         {
            this.main.crew["crew" + animationArray[2]]._alpha = 100;
            this.main.crew["battlebots" + animationArray[3]]._alpha = 100;
            game.animationTimer = game.animationTimer + 1;
         }
      }
      if(game.animationTimer == 4)
      {
         game.animationGoal = true;
         game.animationTimer = null;
      }
   }
}
