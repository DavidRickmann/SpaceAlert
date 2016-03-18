function processTrackClick(a)
{
   _root.soundBox.playSound("clickSND");
   trace("AAAA " + a);
   if(zoneTracks[currentSelectedZone] != null)
   {
      this.main.selectTrack["menu-zone-track" + currentSelectedZone].removeMovieClip();
      this.main.selectTrack["menu-track" + zoneTracks[currentSelectedZone]]._alpha = 100;
   }
   if(this.main.selectTrack["menu-track" + a]._alpha < 100)
   {
      b = 0;
      while(b < 4)
      {
         if(zoneTracks[b] == a)
         {
            this.main.selectTrack["menu-zone-track" + b].removeMovieClip();
            zoneTracks[b] = null;
         }
         b++;
      }
   }
   zoneTracks[currentSelectedZone] = a;
   this.main.selectTrack["menu-track" + a]._alpha = 20;
   this.main.selectTrack.attachMovie("menu-track-frame","menu-zone-track" + currentSelectedZone,this.main.selectTrack.getNextHighestDepth());
   this.main.selectTrack["menu-zone-track" + currentSelectedZone]._x = this.main.selectTrack["menu-zone" + currentSelectedZone]._x + 26;
   this.main.selectTrack["menu-zone-track" + currentSelectedZone]._y = this.main.selectTrack["menu-zone" + currentSelectedZone]._y + 100;
   drawThreatTrack(a,game.threatTracksLibrary[a],17,330,this.main.selectTrack["menu-zone-track" + currentSelectedZone]);
   this.main.selectTrack["menu-zone-track" + currentSelectedZone].track = "T" + (a + 1);
   this.main.selectTrack["menu-zone-track" + currentSelectedZone].gotoAndPlay("on");
   currentSelectedZone++;
   if(currentSelectedZone == 4)
   {
      currentSelectedZone = 0;
   }
   this.main.selectTrack["menu-track-zone-frame"]._x = this.main.selectTrack["menu-zone" + currentSelectedZone]._x;
   this.main.selectTrack["menu-track-zone-frame"]._y = this.main.selectTrack["menu-zone" + currentSelectedZone]._y + 76;
}
keyCheck = 0;
Key.removeListener(keyListener);
keyListener = null;
keyListener = new Object();
keyListener.onKeyDown = function()
{
   keyPressed = String.fromCharCode(Key.getAscii());
   trace("You hit: " + keyPressed);
   if(keyCheck == 0)
   {
      trace("YESSSS");
      if(keyPressed == "1")
      {
         processTrackClick(0);
      }
      if(keyPressed == "2")
      {
         processTrackClick(1);
      }
      if(keyPressed == "3")
      {
         processTrackClick(2);
      }
      if(keyPressed == "4")
      {
         processTrackClick(3);
      }
      if(keyPressed == "5")
      {
         processTrackClick(4);
      }
      if(keyPressed == "6")
      {
         processTrackClick(5);
      }
      if(keyPressed == "7")
      {
         processTrackClick(6);
      }
      keyCheck = 1;
   }
};
Key.addListener(keyListener);
onMouseDown = function()
{
   mouseClick = true;
};
onMouseUp = function()
{
   if(mouseClick == true)
   {
      if(this.main.menuButton._xmouse > 0 && this.main.menuButton._xmouse < this.main.menuButton._width / 2 && this.main.menuButton._ymouse > 0 && this.main.menuButton._ymouse < this.main.menuButton._height)
      {
         _root.soundBox.playSound("clickSND");
         a = 0;
         while(a < zoneTracks.length)
         {
            game.threatTracks[a] = zoneTracks[a];
            a++;
         }
         this.main.selectTrack.removeMovieClip();
         this.main.setDamage.removeMovieClip();
         this.main["menu-damage-box"].removeMovieClip();
         this.main.attachMovie("menu-threat","menu-threat",this.main.getNextHighestDepth());
         this.main["menu-threat"]._x = 25;
         this.main["menu-threat"]._y = 35;
         currentThreatTypeChoice = 0;
         currentZoneChoice = 0;
         currentTChoice = 0;
         currentThreatChoice = null;
         currentThreatType = "external";
         currentZoneLimit0 = 0;
         currentZoneLimit1 = 0;
         currentZoneLimit2 = 0;
         currentZoneLimit3 = 0;
         currentAvailableT = [0,1,2,3,4,5,6,7];
         this.main["menu-threat"].attachMovie("menu-threat-threatBox-frame","menu-threat-threatBox-frame",this.main["menu-threat"].getNextHighestDepth());
         this.main["menu-threat"]["menu-threat-threatBox-frame"]._x = this.main["menu-threat"]["threat-" + currentThreatTypeChoice]._x;
         this.main["menu-threat"]["menu-threat-threatBox-frame"]._y = this.main["menu-threat"]["threat-" + currentThreatTypeChoice]._y;
         this.main["menu-threat"].attachMovie("menu-threat-zone-frame","menu-threat-zone-frame",this.main["menu-threat"].getNextHighestDepth());
         this.main["menu-threat"]["menu-threat-zone-frame"]._x = this.main["menu-threat"]["zone" + currentZoneChoice]._x;
         this.main["menu-threat"]["menu-threat-zone-frame"]._y = this.main["menu-threat"]["zone" + currentZoneChoice]._y;
         a = 0;
         while(a < 8)
         {
            this.main["menu-threat"].attachMovie("menu-threat-T","menu-threat-T-" + a,this.main["menu-threat"].getNextHighestDepth());
            XJump = 0;
            YJump = 0;
            if(a > 3)
            {
               XJump = -1 * (4 * (this.main["menu-threat"]["menu-threat-T-" + a]._width + 4));
               YJump = this.main["menu-threat"]["menu-threat-T-" + a]._height + 4;
            }
            this.main["menu-threat"]["menu-threat-T-" + a]._x = 748 + a * (this.main["menu-threat"]["menu-threat-T-" + a]._width + 4) + XJump;
            this.main["menu-threat"]["menu-threat-T-" + a]._y = 0 + YJump;
            this.main["menu-threat"]["menu-threat-T-" + a].number = a + 1;
            a++;
         }
         this.main["menu-threat"].attachMovie("menu-threat-threat-frame","menu-threat-threat-frame",this.main["menu-threat"].getNextHighestDepth());
         this.main["menu-threat"]["menu-threat-threat-frame"]._alpha = 0;
         updateThreats();
         this.main["menu-threat"].attachMovie("menu-threat-T-frame","menu-threat-T-frame",this.main["menu-threat"].getNextHighestDepth());
         this.main["menu-threat"]["menu-threat-T-frame"]._x = this.main["menu-threat"]["menu-threat-T-" + currentTChoice]._x;
         this.main["menu-threat"]["menu-threat-T-frame"]._y = this.main["menu-threat"]["menu-threat-T-" + currentTChoice]._y;
         this.main.menuButton.swapDepths(this.main.getNextHighestDepth());
         fillThreats("e1");
         currentType = "e1";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
         gotoAndStop("selectThreats");
         play();
      }
      if(this.main.menuButton._xmouse < 0 && this.main.menuButton._xmouse > -1 * this.main.menuButton._width / 2 && this.main.menuButton._ymouse > 0 && this.main.menuButton._ymouse < this.main.menuButton._height)
      {
         _root.soundBox.playSound("clickSND");
         a = 0;
         while(a < zoneTracks.length)
         {
            game.threatTracks[a] = zoneTracks[a];
            a++;
         }
         this.main.selectTrack.removeMovieClip();
         this.main.setDamage.removeMovieClip();
         this.main["menu-damage-box"].removeMovieClip();
         currentSelectedTurn = 0;
         currentSelectedCrew = 0;
         this.main.attachMovie("menu-action-crew-frame","menu-action-crew-frame",this.main.getNextHighestDepth());
         this.main["menu-action-crew-frame"]._x = 60;
         this.main["menu-action-crew-frame"]._y = 60;
         this.main.attachMovie("menu-actions-buttons","menu-actions-buttons",this.main.getNextHighestDepth());
         this.main["menu-actions-buttons"]["turn-0"].number = "1";
         this.main["menu-actions-buttons"]["turn-0"].gotoAndStop("on");
         this.main["menu-actions-buttons"]["turn-1"].number = "2";
         this.main["menu-actions-buttons"]["turn-2"].number = "3";
         this.main["menu-actions-buttons"]["turn-3"].number = "4";
         this.main["menu-actions-buttons"]["turn-4"].number = "5";
         this.main["menu-actions-buttons"]["turn-5"].number = "6";
         this.main["menu-actions-buttons"]["turn-6"].number = "7";
         this.main["menu-actions-buttons"]["turn-7"].number = "8";
         this.main["menu-actions-buttons"]["turn-8"].number = "9";
         this.main["menu-actions-buttons"]["turn-9"].number = "10";
         this.main["menu-actions-buttons"]["turn-10"].number = "11";
         this.main["menu-actions-buttons"]["turn-11"].number = "12";
         fillActions(0);
         a = 0;
         while(a < game.crewOrder.length)
         {
            this.main.attachMovie("menu-crew" + game.crew[game.crewOrder[a]].color,"menu-crew" + a,this.main.getNextHighestDepth());
            this.main["menu-crew" + a]._x = 60;
            this.main["menu-crew" + a]._y = 60 + 130 * a;
            a++;
         }
         gotoAndStop("selectActions");
         play();
      }
      if(this.main["menu-damage-box"]._x == null)
      {
         zoneSelected = false;
         a = 0;
         while(a < 4)
         {
            if(this.main.selectTrack["menu-zone" + a]._xmouse > 0 && this.main.selectTrack["menu-zone" + a]._xmouse < this.main.selectTrack["menu-zone" + a]._width && this.main.selectTrack["menu-zone" + a]._ymouse > 0 && this.main.selectTrack["menu-zone" + a]._ymouse < this.main.selectTrack["menu-zone" + a]._height)
            {
               _root.soundBox.playSound("click2SND");
               zoneSelected = true;
               currentSelectedZone = a;
               this.main.selectTrack["menu-track-zone-frame"]._x = this.main.selectTrack["menu-zone" + currentSelectedZone]._x;
               this.main.selectTrack["menu-track-zone-frame"]._y = this.main.selectTrack["menu-zone" + currentSelectedZone]._y + 76;
            }
            a++;
         }
         if(zoneSelected == false)
         {
            a = 0;
            while(a < 7)
            {
               if(this.main.selectTrack["menu-track" + a]._xmouse > 0 && this.main.selectTrack["menu-track" + a]._xmouse < this.main.selectTrack["menu-track" + a]._width && this.main.selectTrack["menu-track" + a]._ymouse > 0 && this.main.selectTrack["menu-track" + a]._ymouse < this.main.selectTrack["menu-track" + a]._height)
               {
                  processTrackClick(a);
               }
               a++;
            }
         }
      }
      if(this.main.setDamage._xmouse > 0 && this.main.setDamage._xmouse < this.main.setDamage._width && this.main.setDamage._ymouse > 0 && this.main.setDamage._ymouse < this.main.setDamage._height)
      {
         _root.soundBox.playSound("click2SND");
         if(this.main["menu-damage-box"]._x == null)
         {
            this.main.attachMovie("menu-damage-box","menu-damage-box",this.main.getNextHighestDepth());
            this.main["menu-damage-box"]._x = 150;
            this.main["menu-damage-box"]._y = 50;
            this.main["menu-damage-box"].repairText = "SELECT DAMAGED LOCATIONS";
            this.main["menu-damage-box"].r0.gotoAndPlay("on");
            this.main["menu-damage-box"].r1.gotoAndPlay("on");
            this.main["menu-damage-box"].r2.gotoAndPlay("on");
            this.main["menu-damage-box"].r3.gotoAndPlay("on");
            this.main["menu-damage-box"].r4.gotoAndPlay("on");
            this.main["menu-damage-box"].r5.gotoAndPlay("on");
            a = 0;
            while(a < game.ship[0].damageChipsRandomizer.length)
            {
               this.main["menu-damage-box"]["r" + game.ship[0].damageChipsRandomizer[a]].gotoAndPlay("off");
               a++;
            }
            this.main["menu-damage-box"].w0.gotoAndPlay("on");
            this.main["menu-damage-box"].w1.gotoAndPlay("on");
            this.main["menu-damage-box"].w2.gotoAndPlay("on");
            this.main["menu-damage-box"].w3.gotoAndPlay("on");
            this.main["menu-damage-box"].w4.gotoAndPlay("on");
            this.main["menu-damage-box"].w5.gotoAndPlay("on");
            a = 0;
            while(a < game.ship[1].damageChipsRandomizer.length)
            {
               this.main["menu-damage-box"]["w" + game.ship[1].damageChipsRandomizer[a]].gotoAndPlay("off");
               a++;
            }
            this.main["menu-damage-box"].b0.gotoAndPlay("on");
            this.main["menu-damage-box"].b1.gotoAndPlay("on");
            this.main["menu-damage-box"].b2.gotoAndPlay("on");
            this.main["menu-damage-box"].b3.gotoAndPlay("on");
            this.main["menu-damage-box"].b4.gotoAndPlay("on");
            this.main["menu-damage-box"].b5.gotoAndPlay("on");
            a = 0;
            while(a < game.ship[2].damageChipsRandomizer.length)
            {
               this.main["menu-damage-box"]["b" + game.ship[2].damageChipsRandomizer[a]].gotoAndPlay("off");
               a++;
            }
            this.main["menu-damage-box"].bb.gotoAndPlay("on");
            if(game.ship[2].battleBots != null)
            {
               this.main["menu-damage-box"].bb.gotoAndPlay("off");
            }
            this.main["menu-damage-box"].rb.gotoAndPlay("on");
            if(game.ship[0].battleBots != null)
            {
               this.main["menu-damage-box"].rb.gotoAndPlay("off");
            }
            this.main.selectTrack["menu-zone0"]._alpha = 0;
            this.main.selectTrack["menu-zone1"]._alpha = 0;
            this.main.selectTrack["menu-zone2"]._alpha = 0;
            this.main.selectTrack["menu-zone3"]._alpha = 0;
            this.main.selectTrack["menu-track0"]._alpha = 0;
            this.main.selectTrack["menu-track1"]._alpha = 0;
            this.main.selectTrack["menu-track2"]._alpha = 0;
            this.main.selectTrack["menu-track3"]._alpha = 0;
            this.main.selectTrack["menu-track4"]._alpha = 0;
            this.main.selectTrack["menu-track5"]._alpha = 0;
            this.main.selectTrack["menu-track6"]._alpha = 0;
            this.main.selectTrack["menu-zone-track0"]._alpha = 0;
            this.main.selectTrack["menu-zone-track1"]._alpha = 0;
            this.main.selectTrack["menu-zone-track2"]._alpha = 0;
            this.main.selectTrack["menu-zone-track3"]._alpha = 0;
            this.main.selectTrack["menu-track-zone-frame"]._alpha = 0;
         }
         else
         {
            this.main["menu-damage-box"].removeMovieClip();
            this.main.selectTrack["menu-zone0"]._alpha = 100;
            this.main.selectTrack["menu-zone1"]._alpha = 100;
            this.main.selectTrack["menu-zone2"]._alpha = 100;
            this.main.selectTrack["menu-zone3"]._alpha = 100;
            this.main.selectTrack["menu-track0"]._alpha = 100;
            this.main.selectTrack["menu-track1"]._alpha = 100;
            this.main.selectTrack["menu-track2"]._alpha = 100;
            this.main.selectTrack["menu-track3"]._alpha = 100;
            this.main.selectTrack["menu-track4"]._alpha = 100;
            this.main.selectTrack["menu-track5"]._alpha = 100;
            this.main.selectTrack["menu-track6"]._alpha = 100;
            this.main.selectTrack["menu-zone-track0"]._alpha = 100;
            this.main.selectTrack["menu-zone-track1"]._alpha = 100;
            this.main.selectTrack["menu-zone-track2"]._alpha = 100;
            this.main.selectTrack["menu-zone-track3"]._alpha = 100;
            this.main.selectTrack["menu-track-zone-frame"]._alpha = 100;
         }
         trace("SET DAMAGE");
      }
      if(this.main["menu-damage-box"]._x != null)
      {
         if(this.main["menu-damage-box"].r0._xmouse > 0 && this.main["menu-damage-box"].r0._xmouse < this.main["menu-damage-box"].r0._width && this.main["menu-damage-box"].r0._ymouse > 0 && this.main["menu-damage-box"].r0._ymouse < this.main["menu-damage-box"].r0._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[0].damageChipsRandomizer);
            if(this.main["menu-damage-box"].r0.damage == "off")
            {
               this.main["menu-damage-box"].r0.gotoAndStop("on");
               game.ship[0].damageChipsRandomizer = deleteFromArray(game.ship[0].damageChipsRandomizer,0);
               game.ship[0].damageInflict[game.ship[0].damageInflict.length] = 0;
               trace(game.ship[0].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].r0.damage == "on")
            {
               this.main["menu-damage-box"].r0.gotoAndStop("off");
               game.ship[0].damageChipsRandomizer[game.ship[0].damageChipsRandomizer.length] = 0;
               game.ship[0].damageInflict = deleteFromArray(game.ship[0].damageInflict,0);
               trace(game.ship[0].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].r1._xmouse > 0 && this.main["menu-damage-box"].r1._xmouse < this.main["menu-damage-box"].r1._width && this.main["menu-damage-box"].r1._ymouse > 0 && this.main["menu-damage-box"].r1._ymouse < this.main["menu-damage-box"].r1._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[0].damageChipsRandomizer);
            if(this.main["menu-damage-box"].r1.damage == "off")
            {
               this.main["menu-damage-box"].r1.gotoAndStop("on");
               game.ship[0].damageChipsRandomizer = deleteFromArray(game.ship[0].damageChipsRandomizer,1);
               game.ship[0].damageInflict[game.ship[0].damageInflict.length] = 1;
               trace(game.ship[0].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].r1.damage == "on")
            {
               this.main["menu-damage-box"].r1.gotoAndStop("off");
               game.ship[0].damageChipsRandomizer[game.ship[0].damageChipsRandomizer.length] = 1;
               game.ship[0].damageInflict = deleteFromArray(game.ship[0].damageInflict,1);
               trace(game.ship[0].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].r2._xmouse > 0 && this.main["menu-damage-box"].r2._xmouse < this.main["menu-damage-box"].r2._width && this.main["menu-damage-box"].r2._ymouse > 0 && this.main["menu-damage-box"].r2._ymouse < this.main["menu-damage-box"].r2._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[0].damageChipsRandomizer);
            if(this.main["menu-damage-box"].r2.damage == "off")
            {
               this.main["menu-damage-box"].r2.gotoAndStop("on");
               game.ship[0].damageChipsRandomizer = deleteFromArray(game.ship[0].damageChipsRandomizer,2);
               game.ship[0].damageInflict[game.ship[0].damageInflict.length] = 2;
               trace(game.ship[0].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].r2.damage == "on")
            {
               this.main["menu-damage-box"].r2.gotoAndStop("off");
               game.ship[0].damageChipsRandomizer[game.ship[0].damageChipsRandomizer.length] = 2;
               game.ship[0].damageInflict = deleteFromArray(game.ship[0].damageInflict,2);
               trace(game.ship[0].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].r3._xmouse > 0 && this.main["menu-damage-box"].r3._xmouse < this.main["menu-damage-box"].r3._width && this.main["menu-damage-box"].r3._ymouse > 0 && this.main["menu-damage-box"].r3._ymouse < this.main["menu-damage-box"].r3._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[0].damageChipsRandomizer);
            if(this.main["menu-damage-box"].r3.damage == "off")
            {
               this.main["menu-damage-box"].r3.gotoAndStop("on");
               game.ship[0].damageChipsRandomizer = deleteFromArray(game.ship[0].damageChipsRandomizer,3);
               game.ship[0].damageInflict[game.ship[0].damageInflict.length] = 3;
               trace(game.ship[0].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].r3.damage == "on")
            {
               this.main["menu-damage-box"].r3.gotoAndStop("off");
               game.ship[0].damageChipsRandomizer[game.ship[0].damageChipsRandomizer.length] = 3;
               game.ship[0].damageInflict = deleteFromArray(game.ship[0].damageInflict,3);
               trace(game.ship[0].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].r4._xmouse > 0 && this.main["menu-damage-box"].r4._xmouse < this.main["menu-damage-box"].r4._width && this.main["menu-damage-box"].r4._ymouse > 0 && this.main["menu-damage-box"].r4._ymouse < this.main["menu-damage-box"].r4._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[0].damageChipsRandomizer);
            if(this.main["menu-damage-box"].r4.damage == "off")
            {
               this.main["menu-damage-box"].r4.gotoAndStop("on");
               game.ship[0].damageChipsRandomizer = deleteFromArray(game.ship[0].damageChipsRandomizer,4);
               game.ship[0].damageInflict[game.ship[0].damageInflict.length] = 4;
               trace(game.ship[0].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].r4.damage == "on")
            {
               this.main["menu-damage-box"].r4.gotoAndStop("off");
               game.ship[0].damageChipsRandomizer[game.ship[0].damageChipsRandomizer.length] = 4;
               game.ship[0].damageInflict = deleteFromArray(game.ship[0].damageInflict,4);
               trace(game.ship[0].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].r5._xmouse > 0 && this.main["menu-damage-box"].r5._xmouse < this.main["menu-damage-box"].r5._width && this.main["menu-damage-box"].r5._ymouse > 0 && this.main["menu-damage-box"].r5._ymouse < this.main["menu-damage-box"].r5._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[0].damageChipsRandomizer);
            if(this.main["menu-damage-box"].r5.damage == "off")
            {
               this.main["menu-damage-box"].r5.gotoAndStop("on");
               game.ship[0].damageChipsRandomizer = deleteFromArray(game.ship[0].damageChipsRandomizer,5);
               game.ship[0].damageInflict[game.ship[0].damageInflict.length] = 5;
               trace(game.ship[0].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].r5.damage == "on")
            {
               this.main["menu-damage-box"].r5.gotoAndStop("off");
               game.ship[0].damageChipsRandomizer[game.ship[0].damageChipsRandomizer.length] = 5;
               game.ship[0].damageInflict = deleteFromArray(game.ship[0].damageInflict,5);
               trace(game.ship[0].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].w0._xmouse > 0 && this.main["menu-damage-box"].w0._xmouse < this.main["menu-damage-box"].w0._width && this.main["menu-damage-box"].w0._ymouse > 0 && this.main["menu-damage-box"].w0._ymouse < this.main["menu-damage-box"].w0._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[1].damageChipsRandomizer);
            if(this.main["menu-damage-box"].w0.damage == "off")
            {
               this.main["menu-damage-box"].w0.gotoAndStop("on");
               game.ship[1].damageChipsRandomizer = deleteFromArray(game.ship[1].damageChipsRandomizer,0);
               game.ship[1].damageInflict[game.ship[1].damageInflict.length] = 0;
               trace(game.ship[1].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].w0.damage == "on")
            {
               this.main["menu-damage-box"].w0.gotoAndStop("off");
               game.ship[1].damageChipsRandomizer[game.ship[1].damageChipsRandomizer.length] = 0;
               game.ship[1].damageInflict = deleteFromArray(game.ship[1].damageInflict,0);
               trace(game.ship[1].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].w1._xmouse > 0 && this.main["menu-damage-box"].w1._xmouse < this.main["menu-damage-box"].w1._width && this.main["menu-damage-box"].w1._ymouse > 0 && this.main["menu-damage-box"].w1._ymouse < this.main["menu-damage-box"].w1._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[1].damageChipsRandomizer);
            if(this.main["menu-damage-box"].w1.damage == "off")
            {
               this.main["menu-damage-box"].w1.gotoAndStop("on");
               game.ship[1].damageChipsRandomizer = deleteFromArray(game.ship[1].damageChipsRandomizer,1);
               game.ship[1].damageInflict[game.ship[1].damageInflict.length] = 1;
               trace(game.ship[1].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].w1.damage == "on")
            {
               this.main["menu-damage-box"].w1.gotoAndStop("off");
               game.ship[1].damageChipsRandomizer[game.ship[1].damageChipsRandomizer.length] = 1;
               game.ship[1].damageInflict = deleteFromArray(game.ship[1].damageInflict,1);
               trace(game.ship[1].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].w2._xmouse > 0 && this.main["menu-damage-box"].w2._xmouse < this.main["menu-damage-box"].w2._width && this.main["menu-damage-box"].w2._ymouse > 0 && this.main["menu-damage-box"].w2._ymouse < this.main["menu-damage-box"].w2._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[1].damageChipsRandomizer);
            if(this.main["menu-damage-box"].w2.damage == "off")
            {
               this.main["menu-damage-box"].w2.gotoAndStop("on");
               game.ship[1].damageChipsRandomizer = deleteFromArray(game.ship[1].damageChipsRandomizer,2);
               game.ship[1].damageInflict[game.ship[1].damageInflict.length] = 2;
               trace(game.ship[1].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].w2.damage == "on")
            {
               this.main["menu-damage-box"].w2.gotoAndStop("off");
               game.ship[1].damageChipsRandomizer[game.ship[1].damageChipsRandomizer.length] = 2;
               game.ship[1].damageInflict = deleteFromArray(game.ship[1].damageInflict,2);
               trace(game.ship[1].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].w3._xmouse > 0 && this.main["menu-damage-box"].w3._xmouse < this.main["menu-damage-box"].w3._width && this.main["menu-damage-box"].w3._ymouse > 0 && this.main["menu-damage-box"].w3._ymouse < this.main["menu-damage-box"].w3._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[1].damageChipsRandomizer);
            if(this.main["menu-damage-box"].w3.damage == "off")
            {
               this.main["menu-damage-box"].w3.gotoAndStop("on");
               game.ship[1].damageChipsRandomizer = deleteFromArray(game.ship[1].damageChipsRandomizer,3);
               game.ship[1].damageInflict[game.ship[1].damageInflict.length] = 3;
               trace(game.ship[1].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].w3.damage == "on")
            {
               this.main["menu-damage-box"].w3.gotoAndStop("off");
               game.ship[1].damageChipsRandomizer[game.ship[1].damageChipsRandomizer.length] = 3;
               game.ship[1].damageInflict = deleteFromArray(game.ship[1].damageInflict,3);
               trace(game.ship[1].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].w4._xmouse > 0 && this.main["menu-damage-box"].w4._xmouse < this.main["menu-damage-box"].w4._width && this.main["menu-damage-box"].w4._ymouse > 0 && this.main["menu-damage-box"].w4._ymouse < this.main["menu-damage-box"].w4._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[1].damageChipsRandomizer);
            if(this.main["menu-damage-box"].w4.damage == "off")
            {
               this.main["menu-damage-box"].w4.gotoAndStop("on");
               game.ship[1].damageChipsRandomizer = deleteFromArray(game.ship[1].damageChipsRandomizer,4);
               game.ship[1].damageInflict[game.ship[1].damageInflict.length] = 4;
               trace(game.ship[1].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].w4.damage == "on")
            {
               this.main["menu-damage-box"].w4.gotoAndStop("off");
               game.ship[1].damageChipsRandomizer[game.ship[1].damageChipsRandomizer.length] = 4;
               game.ship[1].damageInflict = deleteFromArray(game.ship[1].damageInflict,4);
               trace(game.ship[1].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].w5._xmouse > 0 && this.main["menu-damage-box"].w5._xmouse < this.main["menu-damage-box"].w5._width && this.main["menu-damage-box"].w5._ymouse > 0 && this.main["menu-damage-box"].w5._ymouse < this.main["menu-damage-box"].w5._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[1].damageChipsRandomizer);
            if(this.main["menu-damage-box"].w5.damage == "off")
            {
               this.main["menu-damage-box"].w5.gotoAndStop("on");
               game.ship[1].damageChipsRandomizer = deleteFromArray(game.ship[1].damageChipsRandomizer,5);
               game.ship[1].damageInflict[game.ship[1].damageInflict.length] = 5;
               trace(game.ship[1].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].w5.damage == "on")
            {
               this.main["menu-damage-box"].w5.gotoAndStop("off");
               game.ship[1].damageChipsRandomizer[game.ship[1].damageChipsRandomizer.length] = 5;
               game.ship[1].damageInflict = deleteFromArray(game.ship[1].damageInflict,5);
               trace(game.ship[1].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].b0._xmouse > 0 && this.main["menu-damage-box"].b0._xmouse < this.main["menu-damage-box"].b0._width && this.main["menu-damage-box"].b0._ymouse > 0 && this.main["menu-damage-box"].b0._ymouse < this.main["menu-damage-box"].b0._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[2].damageChipsRandomizer);
            if(this.main["menu-damage-box"].b0.damage == "off")
            {
               this.main["menu-damage-box"].b0.gotoAndStop("on");
               game.ship[2].damageChipsRandomizer = deleteFromArray(game.ship[2].damageChipsRandomizer,0);
               game.ship[2].damageInflict[game.ship[2].damageInflict.length] = 0;
               trace(game.ship[2].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].b0.damage == "on")
            {
               this.main["menu-damage-box"].b0.gotoAndStop("off");
               game.ship[2].damageChipsRandomizer[game.ship[2].damageChipsRandomizer.length] = 0;
               game.ship[2].damageInflict = deleteFromArray(game.ship[2].damageInflict,0);
               trace(game.ship[2].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].b1._xmouse > 0 && this.main["menu-damage-box"].b1._xmouse < this.main["menu-damage-box"].b1._width && this.main["menu-damage-box"].b1._ymouse > 0 && this.main["menu-damage-box"].b1._ymouse < this.main["menu-damage-box"].b1._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[2].damageChipsRandomizer);
            if(this.main["menu-damage-box"].b1.damage == "off")
            {
               this.main["menu-damage-box"].b1.gotoAndStop("on");
               game.ship[2].damageChipsRandomizer = deleteFromArray(game.ship[2].damageChipsRandomizer,1);
               game.ship[2].damageInflict[game.ship[2].damageInflict.length] = 1;
               trace(game.ship[2].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].b1.damage == "on")
            {
               this.main["menu-damage-box"].b1.gotoAndStop("off");
               game.ship[2].damageChipsRandomizer[game.ship[2].damageChipsRandomizer.length] = 1;
               game.ship[2].damageInflict = deleteFromArray(game.ship[2].damageInflict,1);
               trace(game.ship[2].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].b2._xmouse > 0 && this.main["menu-damage-box"].b2._xmouse < this.main["menu-damage-box"].b2._width && this.main["menu-damage-box"].b2._ymouse > 0 && this.main["menu-damage-box"].b2._ymouse < this.main["menu-damage-box"].b2._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[2].damageChipsRandomizer);
            if(this.main["menu-damage-box"].b2.damage == "off")
            {
               this.main["menu-damage-box"].b2.gotoAndStop("on");
               game.ship[2].damageChipsRandomizer = deleteFromArray(game.ship[2].damageChipsRandomizer,2);
               game.ship[2].damageInflict[game.ship[2].damageInflict.length] = 2;
               trace(game.ship[2].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].b2.damage == "on")
            {
               this.main["menu-damage-box"].b2.gotoAndStop("off");
               game.ship[2].damageChipsRandomizer[game.ship[2].damageChipsRandomizer.length] = 2;
               game.ship[2].damageInflict = deleteFromArray(game.ship[2].damageInflict,2);
               trace(game.ship[2].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].b3._xmouse > 0 && this.main["menu-damage-box"].b3._xmouse < this.main["menu-damage-box"].b3._width && this.main["menu-damage-box"].b3._ymouse > 0 && this.main["menu-damage-box"].b3._ymouse < this.main["menu-damage-box"].b3._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[2].damageChipsRandomizer);
            if(this.main["menu-damage-box"].b3.damage == "off")
            {
               this.main["menu-damage-box"].b3.gotoAndStop("on");
               game.ship[2].damageChipsRandomizer = deleteFromArray(game.ship[2].damageChipsRandomizer,3);
               game.ship[2].damageInflict[game.ship[2].damageInflict.length] = 3;
               trace(game.ship[2].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].b3.damage == "on")
            {
               this.main["menu-damage-box"].b3.gotoAndStop("off");
               game.ship[2].damageChipsRandomizer[game.ship[2].damageChipsRandomizer.length] = 3;
               game.ship[2].damageInflict = deleteFromArray(game.ship[2].damageInflict,3);
               trace(game.ship[2].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].b4._xmouse > 0 && this.main["menu-damage-box"].b4._xmouse < this.main["menu-damage-box"].b4._width && this.main["menu-damage-box"].b4._ymouse > 0 && this.main["menu-damage-box"].b4._ymouse < this.main["menu-damage-box"].b4._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[2].damageChipsRandomizer);
            if(this.main["menu-damage-box"].b4.damage == "off")
            {
               this.main["menu-damage-box"].b4.gotoAndStop("on");
               game.ship[2].damageChipsRandomizer = deleteFromArray(game.ship[2].damageChipsRandomizer,4);
               game.ship[2].damageInflict[game.ship[2].damageInflict.length] = 4;
               trace(game.ship[2].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].b4.damage == "on")
            {
               this.main["menu-damage-box"].b4.gotoAndStop("off");
               game.ship[2].damageChipsRandomizer[game.ship[2].damageChipsRandomizer.length] = 4;
               game.ship[2].damageInflict = deleteFromArray(game.ship[2].damageInflict,4);
               trace(game.ship[2].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].b5._xmouse > 0 && this.main["menu-damage-box"].b5._xmouse < this.main["menu-damage-box"].b5._width && this.main["menu-damage-box"].b5._ymouse > 0 && this.main["menu-damage-box"].b5._ymouse < this.main["menu-damage-box"].b5._height)
         {
            _root.soundBox.playSound("click2SND");
            trace(game.ship[2].damageChipsRandomizer);
            if(this.main["menu-damage-box"].b5.damage == "off")
            {
               this.main["menu-damage-box"].b5.gotoAndStop("on");
               game.ship[2].damageChipsRandomizer = deleteFromArray(game.ship[2].damageChipsRandomizer,5);
               game.ship[2].damageInflict[game.ship[2].damageInflict.length] = 5;
               trace(game.ship[2].damageChipsRandomizer);
            }
            if(this.main["menu-damage-box"].b5.damage == "on")
            {
               this.main["menu-damage-box"].b5.gotoAndStop("off");
               game.ship[2].damageChipsRandomizer[game.ship[2].damageChipsRandomizer.length] = 5;
               game.ship[2].damageInflict = deleteFromArray(game.ship[2].damageInflict,5);
               trace(game.ship[2].damageChipsRandomizer);
            }
         }
         if(this.main["menu-damage-box"].bb._xmouse > 0 && this.main["menu-damage-box"].bb._xmouse < this.main["menu-damage-box"].bb._width && this.main["menu-damage-box"].bb._ymouse > 0 && this.main["menu-damage-box"].bb._ymouse < this.main["menu-damage-box"].bb._height)
         {
            _root.soundBox.playSound("click2SND");
            if(this.main["menu-damage-box"].bb.damage == "off")
            {
               this.main["menu-damage-box"].bb.gotoAndStop("on");
               game.ship[2].battleBots = null;
               game.battleBots[1].status = "damaged";
            }
            if(this.main["menu-damage-box"].bb.damage == "on")
            {
               this.main["menu-damage-box"].bb.gotoAndStop("off");
               game.ship[2].battleBots = 1;
            }
         }
         if(this.main["menu-damage-box"].rb._xmouse > 0 && this.main["menu-damage-box"].rb._xmouse < this.main["menu-damage-box"].rb._width && this.main["menu-damage-box"].rb._ymouse > 0 && this.main["menu-damage-box"].rb._ymouse < this.main["menu-damage-box"].rb._height)
         {
            _root.soundBox.playSound("click2SND");
            if(this.main["menu-damage-box"].rb.damage == "off")
            {
               this.main["menu-damage-box"].rb.gotoAndStop("on");
               game.ship[0].battleBots = null;
               game.battleBots[0].status = "damaged";
            }
            if(this.main["menu-damage-box"].rb.damage == "on")
            {
               this.main["menu-damage-box"].rb.gotoAndStop("off");
               game.ship[0].battleBots = 0;
            }
         }
      }
      mouseClick = false;
   }
};
