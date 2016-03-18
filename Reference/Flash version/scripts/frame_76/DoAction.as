game.animationTimer = game.animationTimer + 1;
trace(game.animationTimer);
if(game.destroyed != true)
{
   if(game.animationTimer == 10)
   {
      this.main.end.threatsDestroyed = threatsDestroyed;
      _root.soundBox.playSound("slamSND");
   }
   if(game.animationTimer == 20)
   {
      this.main.end.threatsSurvived = threatsSurvived;
      _root.soundBox.playSound("slamSND");
   }
   if(game.animationTimer == 30)
   {
      this.main.end.visualConfirmation = visualConfirmation;
      _root.soundBox.playSound("slamSND");
   }
   if(game.animationTimer == 40)
   {
      this.main.end.damagePenalty = damagePenalty;
      _root.soundBox.playSound("slamSND");
   }
   if(game.animationTimer == 50)
   {
      this.main.end.KO = KO;
      _root.soundBox.playSound("slamSND");
   }
   if(game.animationTimer == 60)
   {
      this.main.end.VPtotal = VPtotal;
      _root.soundBox.playSound("slamSND");
   }
   if(game.animationTimer == 70)
   {
      this.main.end.VPs = game.VPs.length + " MISSION TOTAL";
      this.main.end.VPGrandTotal = VPGrandTotal;
      _root.soundBox.playSound("slamSND");
      game.animationTimer = null;
   }
}
onMouseDown = function()
{
   mouseClick = true;
};
onMouseUp = function()
{
   if(mouseClick == true)
   {
      if(this.main.end.newGame._xmouse > 0 && this.main.end.newGame._xmouse < this.main.end.newGame._width && this.main.end.newGame._ymouse > 0 && this.main.end.newGame._ymouse < this.main.end.newGame._height)
      {
         this.main.end.removeMovieClip();
         _root.soundBox.playSound("clickSND");
         varInit();
         _root.soundBox.stopMusic();
         _root.soundBox.playMusic("track2");
         game.animationTimer = null;
         gotoAndStop("start");
         play();
      }
   }
   if(mouseClick == true)
   {
      if(this.main.end.continueMission._xmouse > 0 && this.main.end.continueMission._xmouse < this.main.end.continueMission._width && this.main.end.continueMission._ymouse > 0 && this.main.end.continueMission._ymouse < this.main.end.continueMission._height)
      {
         this.main.end.removeMovieClip();
         _root.soundBox.playSound("clickSND");
         _root.soundBox.stopMusic();
         _root.soundBox.playMusic("track2");
         game.animationTimer = null;
         this.main.attachMovie("menu-repair","menu-repair",this.main.getNextHighestDepth());
         this.main["menu-repair"].attachMovie("menu-damage-box","menu-damage-box",this.main["menu-repair"].getNextHighestDepth());
         this.main["menu-repair"]["menu-damage-box"]._x = 250;
         this.main["menu-repair"]["menu-damage-box"]._y = 50;
         this.main["menu-repair"]["menu-damage-box"].repairText = "SELECT REPAIR LOCATION";
         a = 0;
         while(a < game.crewOrder.length)
         {
            this.main["menu-repair"].attachMovie("menu-crew" + game.crew[game.crewOrder[a]].color,"menu-crew" + a,this.main["menu-repair"].getNextHighestDepth());
            this.main["menu-repair"]["menu-crew" + a]._x = 60;
            this.main["menu-repair"]["menu-crew" + a]._y = 60 + 130 * a;
            if(game.crew[game.crewOrder[a]].crewStatus == "knocked out")
            {
               this.main["menu-repair"].attachMovie("menu-actions-button-KO","menu-actions-button-KO" + a,this.main["menu-repair"].getNextHighestDepth());
               this.main["menu-repair"]["menu-actions-button-KO" + a]._x = 150;
               this.main["menu-repair"]["menu-actions-button-KO" + a]._y = 60 + 130 * a;
            }
            game.crew[game.crewOrder[a]].repaired = null;
            a++;
         }
         currentSelectedCrew = null;
         crewNum = 0;
         while(currentSelectedCrew == null && crewNum < game.crewOrder.length)
         {
            if(game.crew[game.crewOrder[crewNum]].crewStatus != "knocked out")
            {
               currentSelectedCrew = crewNum;
               this.main["menu-repair"].attachMovie("menu-action-crew-frame","menu-action-crew-frame",this.main["menu-repair"].getNextHighestDepth());
               this.main["menu-repair"]["menu-action-crew-frame"]._x = 60;
               this.main["menu-repair"]["menu-action-crew-frame"]._y = 60 + 130 * crewNum;
            }
            crewNum++;
         }
         trace("IS THIS NULL?  ? ? ? ? ? ? ? ? ? ?  " + currentSelectedCrew);
         a = 0;
         while(a < game.ship[0].damageInflicted.length)
         {
            this.main["menu-repair"]["menu-damage-box"]["r" + game.ship[0].damageInflicted[a]].gotoAndPlay("on");
            a++;
         }
         a = 0;
         while(a < game.ship[1].damageInflicted.length)
         {
            this.main["menu-repair"]["menu-damage-box"]["w" + game.ship[1].damageInflicted[a]].gotoAndPlay("on");
            a++;
         }
         a = 0;
         while(a < game.ship[2].damageInflicted.length)
         {
            this.main["menu-repair"]["menu-damage-box"]["b" + game.ship[2].damageInflicted[a]].gotoAndPlay("on");
            a++;
         }
         if(game.battleBots[0].status == "damaged")
         {
            this.main["menu-repair"]["menu-damage-box"].rb.gotoAndPlay("on");
         }
         if(game.battleBots[1].status == "damaged")
         {
            this.main["menu-repair"]["menu-damage-box"].bb.gotoAndPlay("on");
         }
         game.ship[0].damageInflict = game.ship[0].damageInflicted;
         game.ship[1].damageInflict = game.ship[1].damageInflicted;
         game.ship[2].damageInflict = game.ship[2].damageInflicted;
         game.ship[0].damageInflicted = [];
         game.ship[1].damageInflicted = [];
         game.ship[2].damageInflicted = [];
         gotoAndStop("repairLoop");
         play();
      }
   }
   if(mouseClick == true)
   {
      if(this.main.end.replay._xmouse > 0 && this.main.end.replay._xmouse < this.main.end.replay._width && this.main.end.replay._ymouse > 0 && this.main.end.replay._ymouse < this.main.end.replay._height)
      {
         this.main.end.removeMovieClip();
         game.animationGoal = false;
         game.animationLocation = 0;
         game.animationCurrent = null;
         game.animationTimer = null;
         game.threats0 = 0;
         game.threats2 = 0;
         game.threats1 = 0;
         game.threats3 = 0;
         game.VPs[game.VPs.length - 1] = null;
         game.VPs = cleanArray(game.VPs);
         game.ship[0].deck[1].threats = [null,null];
         game.ship[0].deck[0].threats = [null,null];
         game.ship[1].deck[1].threats = [null,null];
         game.ship[1].deck[0].threats = [null,null];
         game.ship[2].deck[1].threats = [null,null];
         game.ship[2].deck[0].threats = [null,null];
         this.main.attachMovie("zonebands","zonebands",this.main.getNextHighestDepth());
         this.main.zonebands._x = 50;
         this.main.zonebands._y = 0;
         this.main.attachMovie("button-sound-pause","pauseButton",this.main.getNextHighestDepth());
         this.main.pauseButton._x = 742;
         this.main.pauseButton._y = 7;
         a = 0;
         while(a < 14)
         {
            this.main.attachMovie("turnMarker","turnMarker" + a,this.main.getNextHighestDepth());
            XJump = 0;
            YJump = 0;
            if(a > 6)
            {
               XJump = -273;
               YJump = 39;
            }
            this.main["turnMarker" + a]._x = 742 + 39 * a + XJump;
            this.main["turnMarker" + a]._y = 46 + YJump;
            this.main["turnMarker" + a].turn = a + 1;
            this.main.turnMarker13.turn = "END";
            a++;
         }
         this.main.createEmptyMovieClip("threats",this.main.getNextHighestDepth());
         drawThreatTrack(0,game.threatTracks[0],60,326,this.main.threats,"");
         drawThreatTrack(1,game.threatTracks[1],290,326,this.main.threats,"");
         drawThreatTrack(2,game.threatTracks[2],520,326,this.main.threats,"");
         drawThreatTrack(3,game.threatTracks[3],765,726,this.main.threats,"");
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
         _root.soundBox.stopMusic();
         _root.soundBox.playMusic("track1");
         onMouseUp = function()
         {
         };
         onMouseDown = function()
         {
         };
         gotoAndStop("animate");
         play();
      }
   }
};
