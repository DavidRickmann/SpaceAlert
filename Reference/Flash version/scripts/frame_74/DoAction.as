if(game.animationGoal == true)
{
   game.animationGoal = false;
   game.animationTimer = null;
   game.animationLocation = game.animationLocation + 1;
   if(game.animationLocation == game.animation.length)
   {
      this.main.pauseButton.removeMovieClip();
      this.main.ship.removeMovieClip();
      this.main.crew.removeMovieClip();
      this.main.fighters.removeMovieClip();
      this.main.elevator.removeMovieClip();
      this.main.stuff.removeMovieClip();
      this.main.damage.removeMovieClip();
      this.main.threats.removeMovieClip();
      this.main.zonebands.removeMovieClip();
      this.main.effects.removeMovieClip();
      a = 0;
      while(a < 14)
      {
         this.main["turnMarker" + a].removeMovieClip();
         a++;
      }
      threatsDestroyed = 0;
      threatsSurvived = 0;
      damagePenalty = 0;
      visualConfirmation = 0;
      KO = 0;
      a = 0;
      while(a < game.threats.length)
      {
         if(game.threats[a].status == "destroyed")
         {
            threatsDestroyed = threatsDestroyed + game.threats[a].VPkill;
         }
         trace(threatsDestroyed);
         if(game.threats[a].status == "survived")
         {
            threatsSurvived = threatsSurvived + game.threats[a].VPsurvive;
         }
         a++;
      }
      trace(threatsSurvived);
      biggest = 0;
      a = 0;
      while(a < 3)
      {
         damagePenalty = damagePenalty + (7 - game.ship[a].damage);
         if(7 - game.ship[a].damage > 7 - game.ship[biggest].damage)
         {
            biggest = a;
         }
         a++;
      }
      damagePenalty = damagePenalty + (7 - game.ship[biggest].damage);
      trace(damagePenalty);
      if(game.observationPhase1 == 5)
      {
         game.observationPhase1 = 7;
      }
      if(game.observationPhase1 == 4)
      {
         game.observationPhase1 = 5;
      }
      visualConfirmation = visualConfirmation + game.observationPhase1;
      if(game.observationPhase2 == 5)
      {
         game.observationPhase2 = 7;
      }
      if(game.observationPhase2 == 4)
      {
         game.observationPhase2 = 5;
      }
      visualConfirmation = visualConfirmation + game.observationPhase2;
      if(game.observationPhase3 == 5)
      {
         game.observationPhase3 = 7;
      }
      if(game.observationPhase3 == 4)
      {
         game.observationPhase3 = 5;
      }
      visualConfirmation = visualConfirmation + game.observationPhase3;
      trace(visualConfirmation);
      a = 0;
      while(a < game.crewOrder.length)
      {
         if(game.crew[game.crewOrder[a]].crewStatus == "knocked out")
         {
            KO = KO + 2;
         }
         a++;
      }
      a = 0;
      while(a < game.battleBots.length)
      {
         if(game.battleBots[a].status != "ready")
         {
            KO = KO + 1;
         }
         a++;
      }
      VPtotal = 0;
      VPtotal = threatsDestroyed + threatsSurvived + visualConfirmation - damagePenalty - KO;
      game.VPs[game.VPs.length] = VPtotal;
      VPGrandTotal = 0;
      a = 0;
      while(a < game.VPs.length)
      {
         VPGrandTotal = VPGrandTotal + game.VPs[a];
         a++;
      }
      trace(VPtotal);
      trace("Phase 1 obs: " + game.observationPhase1);
      trace("Phase 2 obs: " + game.observationPhase2);
      trace("Phase 3 obs: " + game.observationPhase3);
      if(game.destroyed != true)
      {
         this.main.attachMovie("menu-end","end",this.main.getNextHighestDepth());
         this.main.end.threatsDestroyed = "";
         this.main.end.threatsSurvived = "";
         this.main.end.damagePenalty = "";
         this.main.end.visualConfirmation = "";
         this.main.end.KO = "";
         this.main.end.VPtotal = "";
         this.main.end.VPGrandTotal = "";
         this.main.end.VPs = "";
      }
      else
      {
         _root.soundBox.stopMusic();
         _root.soundBox.playMusic("gameOverSND");
         this.main.attachMovie("menu-end2","end",this.main.getNextHighestDepth());
      }
      game.animationTimer = 0;
      gotoAndStop("end");
      play();
   }
}
else if(game.pauseGame == false)
{
   animRunFunction(game.animation[game.animationLocation]);
   animRunFunction2(game.animation[game.animationLocation]);
}
onMouseDown = function()
{
};
onMouseUp = function()
{
   if(this.main.pauseButton._xmouse > 0 && this.main.pauseButton._xmouse < this.main.pauseButton._width && this.main.pauseButton._ymouse > 0 && this.main.pauseButton._ymouse < this.main.pauseButton._height)
   {
      _root.soundBox.playSound("clickSND");
      if(game.pauseGame == false)
      {
         game.pauseGame = true;
         this.main.attachMovie("pauseMenu","pauseMenu",this.main.getNextHighestDepth());
         this.main.pauseMenu._x = 280;
         this.main.pauseMenu._y = 230;
      }
      else
      {
         game.pauseGame = false;
         this.main.pauseMenu.removeMovieClip();
      }
   }
   if(this.main.pauseMenu.abort._xmouse > 0 && this.main.pauseMenu.abort._xmouse < this.main.pauseMenu.abort._width && this.main.pauseMenu.abort._ymouse > 0 && this.main.pauseMenu.abort._ymouse < this.main.pauseMenu.abort._height)
   {
      this.main.pauseMenu.removeMovieClip();
      this.main.pauseButton.removeMovieClip();
      this.main.ship.removeMovieClip();
      this.main.crew.removeMovieClip();
      this.main.fighters.removeMovieClip();
      this.main.elevator.removeMovieClip();
      this.main.stuff.removeMovieClip();
      this.main.damage.removeMovieClip();
      this.main.threats.removeMovieClip();
      this.main.zonebands.removeMovieClip();
      this.main.effects.removeMovieClip();
      this.main.messageBox.removeMovieClip();
      _root.soundBox.stopSound();
      _root.soundBox.stopSound2();
      _root.soundBox.stopSoundLoop();
      _root.soundBox.stopSoundLoop2();
      _root.soundBox.playSound("clickSND");
      a = 0;
      while(a < 14)
      {
         this.main["turnMarker" + a].removeMovieClip();
         a++;
      }
      varInit();
      _root.soundBox.stopMusic();
      _root.soundBox.playMusic("track2");
      game.animationTimer = null;
      gotoAndStop("start");
      play();
   }
};
