Key.removeListener(keyListener);
keyListener = null;
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
         generateThreatsFinal();
         this.main["menu-threat"].removeMovieClip();
         gotoAndStop("checkZones");
         play();
      }
      if(this.main.menuButton._xmouse < 0 && this.main.menuButton._xmouse > -1 * this.main.menuButton._width / 2 && this.main.menuButton._ymouse > 0 && this.main.menuButton._ymouse < this.main.menuButton._height)
      {
         _root.soundBox.playSound("clickSND");
         generateThreats();
         this.main["menu-threat"].removeMovieClip();
         this.main.attachMovie("menu-track-selection","selectTrack",this.main.getNextHighestDepth());
         currentSelectedZone = 0;
         this.main.selectTrack.attachMovie("menu-track-zone-frame","menu-track-zone-frame",this.main.selectTrack.getNextHighestDepth());
         this.main.selectTrack["menu-track-zone-frame"]._x = this.main.selectTrack["menu-zone" + currentSelectedZone]._x;
         this.main.selectTrack["menu-track-zone-frame"]._y = this.main.selectTrack["menu-zone" + currentSelectedZone]._y + 76;
         this.main.selectTrack.attachMovie("menu-track-frame","menu-track0",this.main.selectTrack.getNextHighestDepth());
         this.main.selectTrack["menu-track0"]._x = 60;
         this.main.selectTrack["menu-track0"]._y = 100;
         drawThreatTrack(0,game.threatTracksLibrary[0],17,330,this.main.selectTrack["menu-track0"]);
         this.main.selectTrack["menu-track0"].track = "T1";
         this.main.selectTrack.attachMovie("menu-track-frame","menu-track1",this.main.selectTrack.getNextHighestDepth());
         this.main.selectTrack["menu-track1"]._x = 114;
         this.main.selectTrack["menu-track1"]._y = 100;
         drawThreatTrack(1,game.threatTracksLibrary[1],17,330,this.main.selectTrack["menu-track1"]);
         this.main.selectTrack["menu-track1"].track = "T2";
         this.main.selectTrack.attachMovie("menu-track-frame","menu-track2",this.main.selectTrack.getNextHighestDepth());
         this.main.selectTrack["menu-track2"]._x = 168;
         this.main.selectTrack["menu-track2"]._y = 100;
         drawThreatTrack(2,game.threatTracksLibrary[2],17,330,this.main.selectTrack["menu-track2"]);
         this.main.selectTrack["menu-track2"].track = "T3";
         this.main.selectTrack.attachMovie("menu-track-frame","menu-track3",this.main.selectTrack.getNextHighestDepth());
         this.main.selectTrack["menu-track3"]._x = 222;
         this.main.selectTrack["menu-track3"]._y = 100;
         drawThreatTrack(2,game.threatTracksLibrary[3],17,330,this.main.selectTrack["menu-track3"]);
         this.main.selectTrack["menu-track3"].track = "T4";
         this.main.selectTrack.attachMovie("menu-track-frame","menu-track4",this.main.selectTrack.getNextHighestDepth());
         this.main.selectTrack["menu-track4"]._x = 276;
         this.main.selectTrack["menu-track4"]._y = 100;
         drawThreatTrack(2,game.threatTracksLibrary[4],17,330,this.main.selectTrack["menu-track4"]);
         this.main.selectTrack["menu-track4"].track = "T5";
         this.main.selectTrack.attachMovie("menu-track-frame","menu-track5",this.main.selectTrack.getNextHighestDepth());
         this.main.selectTrack["menu-track5"]._x = 330;
         this.main.selectTrack["menu-track5"]._y = 100;
         drawThreatTrack(5,game.threatTracksLibrary[5],17,330,this.main.selectTrack["menu-track5"]);
         this.main.selectTrack["menu-track5"].track = "T6";
         this.main.selectTrack.attachMovie("menu-track-frame","menu-track6",this.main.selectTrack.getNextHighestDepth());
         this.main.selectTrack["menu-track6"]._x = 384;
         this.main.selectTrack["menu-track6"]._y = 100;
         drawThreatTrack(6,game.threatTracksLibrary[6],17,330,this.main.selectTrack["menu-track6"]);
         this.main.selectTrack["menu-track6"].track = "T7";
         zoneTracks = [];
         selectedTrack = null;
         previousZone = null;
         selectedZone = null;
         a = 0;
         while(a < game.threatTracks.length)
         {
            zoneTracks[a] = game.threatTracks[a];
            if(zoneTracks[a] != null)
            {
               this.main.selectTrack["menu-track" + game.threatTracks[a]]._alpha = 20;
               this.main.selectTrack.attachMovie("menu-track-frame","menu-zone-track" + a,this.main.selectTrack.getNextHighestDepth());
               this.main.selectTrack["menu-zone-track" + a]._x = this.main.selectTrack["menu-zone" + a]._x + 26;
               this.main.selectTrack["menu-zone-track" + a]._y = this.main.selectTrack["menu-zone" + a]._y + 100;
               drawThreatTrack(game.threatTracks[a],game.threatTracksLibrary[game.threatTracks[a]],17,330,this.main.selectTrack["menu-zone-track" + a]);
               this.main.selectTrack["menu-zone-track" + a].track = "T" + (game.threatTracks[a] + 1);
               this.main.selectTrack["menu-zone-track" + a].gotoAndPlay("on");
            }
            a++;
         }
         this.main.attachMovie("menu-setDamage","setDamage",this.main.getNextHighestDepth());
         this.main.setDamage._x = 60;
         this.main.setDamage._y = 600;
         this.main.menuButton.swapDepths(this.main.getNextHighestDepth());
         gotoAndStop("selectTracks");
         play();
      }
      top = true;
      if(this.main["menu-threat"]["button-e1"]._xmouse > 0 && this.main["menu-threat"]["button-e1"]._xmouse < this.main["menu-threat"]["button-e1"]._width && this.main["menu-threat"]["button-e1"]._ymouse > 0 && this.main["menu-threat"]["button-e1"]._ymouse < this.main["menu-threat"]["button-e1"]._height)
      {
         _root.soundBox.playSound("click2SND");
         fillThreats("e1");
         currentThreatType = "external";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("off");
         currentType = "e1";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
      }
      if(this.main["menu-threat"]["button-e2"]._xmouse > 0 && this.main["menu-threat"]["button-e2"]._xmouse < this.main["menu-threat"]["button-e2"]._width && this.main["menu-threat"]["button-e2"]._ymouse > 0 && this.main["menu-threat"]["button-e2"]._ymouse < this.main["menu-threat"]["button-e2"]._height)
      {
         _root.soundBox.playSound("click2SND");
         fillThreats("e2");
         currentThreatType = "external";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("off");
         currentType = "e2";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
      }
      if(this.main["menu-threat"]["button-se1"]._xmouse > 0 && this.main["menu-threat"]["button-se1"]._xmouse < this.main["menu-threat"]["button-se1"]._width && this.main["menu-threat"]["button-se1"]._ymouse > 0 && this.main["menu-threat"]["button-se1"]._ymouse < this.main["menu-threat"]["button-se1"]._height)
      {
         _root.soundBox.playSound("click2SND");
         fillThreats("se1");
         currentThreatType = "external";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("off");
         currentType = "se1";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
      }
      if(this.main["menu-threat"]["button-se2"]._xmouse > 0 && this.main["menu-threat"]["button-se2"]._xmouse < this.main["menu-threat"]["button-se2"]._width && this.main["menu-threat"]["button-se2"]._ymouse > 0 && this.main["menu-threat"]["button-se2"]._ymouse < this.main["menu-threat"]["button-se2"]._height)
      {
         _root.soundBox.playSound("click2SND");
         fillThreats("se2");
         currentThreatType = "external";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("off");
         currentType = "se2";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
      }
      if(this.main["menu-threat"]["button-i1"]._xmouse > 0 && this.main["menu-threat"]["button-i1"]._xmouse < this.main["menu-threat"]["button-i1"]._width && this.main["menu-threat"]["button-i1"]._ymouse > 0 && this.main["menu-threat"]["button-i1"]._ymouse < this.main["menu-threat"]["button-i1"]._height)
      {
         _root.soundBox.playSound("click2SND");
         fillThreats("i1");
         currentThreatType = "internal";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("off");
         currentType = "i1";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
      }
      if(this.main["menu-threat"]["button-i2"]._xmouse > 0 && this.main["menu-threat"]["button-i2"]._xmouse < this.main["menu-threat"]["button-i2"]._width && this.main["menu-threat"]["button-i2"]._ymouse > 0 && this.main["menu-threat"]["button-i2"]._ymouse < this.main["menu-threat"]["button-i2"]._height)
      {
         _root.soundBox.playSound("click2SND");
         fillThreats("i2");
         currentThreatType = "internal";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("off");
         currentType = "i2";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
      }
      if(this.main["menu-threat"]["button-si1"]._xmouse > 0 && this.main["menu-threat"]["button-si1"]._xmouse < this.main["menu-threat"]["button-si1"]._width && this.main["menu-threat"]["button-si1"]._ymouse > 0 && this.main["menu-threat"]["button-si1"]._ymouse < this.main["menu-threat"]["button-si1"]._height)
      {
         _root.soundBox.playSound("click2SND");
         fillThreats("si1");
         currentThreatType = "internal";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("off");
         currentType = "si1";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
      }
      if(this.main["menu-threat"]["button-si2"]._xmouse > 0 && this.main["menu-threat"]["button-si2"]._xmouse < this.main["menu-threat"]["button-si2"]._width && this.main["menu-threat"]["button-si2"]._ymouse > 0 && this.main["menu-threat"]["button-si2"]._ymouse < this.main["menu-threat"]["button-si2"]._height)
      {
         _root.soundBox.playSound("click2SND");
         fillThreats("si2");
         currentThreatType = "internal";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("off");
         currentType = "si2";
         this.main["menu-threat"]["button-" + currentType].gotoAndPlay("on");
      }
      a = 0;
      while(a < 10)
      {
         if(this.main["menu-threat"]["threat-" + a]._xmouse > 0 && this.main["menu-threat"]["threat-" + a]._xmouse < this.main["menu-threat"]["threat-" + a]._width && this.main["menu-threat"]["threat-" + a]._ymouse > 0 && this.main["menu-threat"]["threat-" + a]._ymouse < this.main["menu-threat"]["threat-" + a]._height)
         {
            _root.soundBox.playSound("click2SND");
            if(this.main["menu-threat"]["threat-" + a]._alpha == 100)
            {
               currentThreatTypeChoice = a;
               this.main["menu-threat"]["menu-threat-threatBox-frame"]._alpha = 100;
               this.main["menu-threat"]["menu-threat-threatBox-frame"]._x = this.main["menu-threat"]["threat-" + currentThreatTypeChoice]._x;
               this.main["menu-threat"]["menu-threat-threatBox-frame"]._y = this.main["menu-threat"]["threat-" + currentThreatTypeChoice]._y;
            }
         }
         a++;
      }
      a = 0;
      while(a < 4)
      {
         if(this.main["menu-threat"]["zone" + a]._alpha == 100)
         {
            if(this.main["menu-threat"]["zone" + a]._xmouse > 0 && this.main["menu-threat"]["zone" + a]._xmouse < this.main["menu-threat"]["zone" + a]._width && this.main["menu-threat"]["zone" + a]._ymouse > 0 && this.main["menu-threat"]["zone" + a]._ymouse < this.main["menu-threat"]["zone" + a]._height)
            {
               _root.soundBox.playSound("click2SND");
               currentZoneChoice = a;
               this.main["menu-threat"]["menu-threat-zone-frame"]._x = this.main["menu-threat"]["zone" + currentZoneChoice]._x;
               this.main["menu-threat"]["menu-threat-zone-frame"]._y = this.main["menu-threat"]["zone" + currentZoneChoice]._y;
            }
         }
         a++;
      }
      a = 0;
      while(a < 8)
      {
         if(this.main["menu-threat"]["menu-threat-T-" + a]._xmouse > 0 && this.main["menu-threat"]["menu-threat-T-" + a]._xmouse < this.main["menu-threat"]["menu-threat-T-" + a]._width && this.main["menu-threat"]["menu-threat-T-" + a]._ymouse > 0 && this.main["menu-threat"]["menu-threat-T-" + a]._ymouse < this.main["menu-threat"]["menu-threat-T-" + a]._height)
         {
            _root.soundBox.playSound("click2SND");
            currentTChoice = a;
            this.main["menu-threat"]["menu-threat-T-frame"]._x = this.main["menu-threat"]["menu-threat-T-" + currentTChoice]._x;
            this.main["menu-threat"]["menu-threat-T-frame"]._y = this.main["menu-threat"]["menu-threat-T-" + currentTChoice]._y;
         }
         a++;
      }
      if(this.main["menu-threat"]["button-proccess"]._xmouse > 0 && this.main["menu-threat"]["button-proccess"]._xmouse < this.main["menu-threat"]["button-proccess"]._width && this.main["menu-threat"]["button-proccess"]._ymouse > 0 && this.main["menu-threat"]["button-proccess"]._ymouse < this.main["menu-threat"]["button-proccess"]._height)
      {
         _root.soundBox.playSound("clickSND");
         if(this.main["menu-threat"]["button-proccess"]._currentFrame == 1)
         {
            if(currentTChoice != null && this["currentZoneLimit" + currentZoneChoice] != 2 && currentThreatTypeChoice != null)
            {
               this.main["menu-threat"].attachMovie("threatDisplay","menu-threat-" + currentTChoice,this.main["menu-threat"].getNextHighestDepth());
               if(currentZoneChoice == 0)
               {
                  Xcoord = 15;
               }
               if(currentZoneChoice == 1)
               {
                  Xcoord = 217;
               }
               if(currentZoneChoice == 2)
               {
                  Xcoord = 418;
               }
               if(currentZoneChoice == 3)
               {
                  Xcoord = 617;
               }
               Ycoord = 384 + this["currentZoneLimit" + currentZoneChoice] * 152;
               this.main["menu-threat"]["menu-threat-" + currentTChoice]._x = Xcoord;
               this.main["menu-threat"]["menu-threat-" + currentTChoice]._y = Ycoord;
               this.main["menu-threat"]["menu-threat-" + currentTChoice].zone = currentZoneChoice;
               this.main["menu-threat"]["menu-threat-" + currentTChoice].threatT = currentTChoice + 1;
               this.main["menu-threat"]["menu-threat-" + currentTChoice].speed = game.threatsLibrary[currentThreatType][this.main["menu-threat"]["threat-" + currentThreatTypeChoice].ID].speed;
               this.main["menu-threat"]["menu-threat-" + currentTChoice].HP = game.threatsLibrary[currentThreatType][this.main["menu-threat"]["threat-" + currentThreatTypeChoice].ID].HPMAX;
               this.main["menu-threat"]["menu-threat-" + currentTChoice].TAG = game.threatsLibrary[currentThreatType][this.main["menu-threat"]["threat-" + currentThreatTypeChoice].ID].TAG;
               this.main["menu-threat"]["menu-threat-" + currentTChoice].threatType = currentThreatType;
               this.main["menu-threat"]["menu-threat-" + currentTChoice].ID = this.main["menu-threat"]["threat-" + currentThreatTypeChoice].ID;
               if(currentThreatType == "external")
               {
                  this.main["menu-threat"]["menu-threat-" + currentTChoice].shields = game.threatsLibrary[currentThreatType][this.main["menu-threat"]["threat-" + currentThreatTypeChoice].ID].shields;
               }
               else
               {
                  this.main["menu-threat"]["menu-threat-" + currentTChoice].shields = "";
               }
               this.main["menu-threat"]["menu-threat-" + currentTChoice].pic.gotoAndStop(game.threatsLibrary[currentThreatType][this.main["menu-threat"]["threat-" + currentThreatTypeChoice].ID].TAG);
               this.main["menu-threat"]["menu-threat-" + currentTChoice].name.threatName = game.threatsLibrary[currentThreatType][this.main["menu-threat"]["threat-" + currentThreatTypeChoice].ID].threatName;
               this["currentZoneLimit" + currentZoneChoice]++;
               this.main["menu-threat"]["menu-threat-T-" + currentTChoice].removeMovieClip();
               currentAvailableT[currentTChoice] = null;
               test = null;
               loopNum = 0;
               while(test == null && loopNum < 8)
               {
                  currentTChoice++;
                  if(currentTChoice == 8)
                  {
                     currentTChoice = 0;
                  }
                  test = currentAvailableT[currentTChoice];
                  loopNum++;
               }
               if(test == null)
               {
                  this.main["menu-threat"]["menu-threat-T-frame"].removeMovieClip();
                  currentTChoice = null;
               }
               this.main["menu-threat"]["menu-threat-T-frame"]._x = this.main["menu-threat"]["menu-threat-T-" + currentTChoice]._x;
               this.main["menu-threat"]["menu-threat-T-frame"]._y = this.main["menu-threat"]["menu-threat-T-" + currentTChoice]._y;
               this.main["menu-threat"]["threat-" + currentThreatTypeChoice]._alpha = 30;
               fillThreats(currentType);
            }
         }
         else
         {
            currentAvailableT[currentThreatChoice] = currentThreatChoice;
            this.main["menu-threat"].attachMovie("menu-threat-T","menu-threat-T-" + currentThreatChoice,this.main["menu-threat"].getNextHighestDepth());
            XJump = 0;
            YJump = 0;
            if(currentThreatChoice > 3)
            {
               XJump = -1 * (4 * (this.main["menu-threat"]["menu-threat-T-" + currentThreatChoice]._width + 4));
               YJump = this.main["menu-threat"]["menu-threat-T-" + currentThreatChoice]._height + 4;
            }
            this.main["menu-threat"]["menu-threat-T-" + currentThreatChoice]._x = 748 + currentThreatChoice * (this.main["menu-threat"]["menu-threat-T-" + currentThreatChoice]._width + 4) + XJump;
            this.main["menu-threat"]["menu-threat-T-" + currentThreatChoice]._y = 0 + YJump;
            this.main["menu-threat"]["menu-threat-T-" + currentThreatChoice].number = currentThreatChoice + 1;
            a = 0;
            while(a < 8)
            {
               if(this.main["menu-threat"]["menu-threat-" + a].zone == this.main["menu-threat"]["menu-threat-" + currentThreatChoice].zone)
               {
                  this.main["menu-threat"]["menu-threat-" + a]._y = 384;
               }
               a++;
            }
            this["currentZoneLimit" + this.main["menu-threat"]["menu-threat-" + currentThreatChoice].zone]--;
            if(currentTChoice == null)
            {
               currentTChoice = -1;
               test = null;
               loopNum = 0;
               while(test == null)
               {
                  currentTChoice++;
                  if(currentTChoice == 8)
                  {
                     currentTChoice = 0;
                  }
                  test = currentAvailableT[currentTChoice];
                  loopNum++;
               }
               this.main["menu-threat"].attachMovie("menu-threat-T-frame","menu-threat-T-frame",this.main["menu-threat"].getNextHighestDepth());
               this.main["menu-threat"]["menu-threat-T-frame"]._x = this.main["menu-threat"]["menu-threat-T-" + currentTChoice]._x;
               this.main["menu-threat"]["menu-threat-T-frame"]._y = this.main["menu-threat"]["menu-threat-T-" + currentTChoice]._y;
            }
            this.main["menu-threat"]["menu-threat-" + currentThreatChoice].removeMovieClip();
            top = true;
            fillThreats(currentType);
         }
      }
      a = 0;
      while(a < 8)
      {
         if(this.main["menu-threat"]["menu-threat-" + a]._xmouse > 0 && this.main["menu-threat"]["menu-threat-" + a]._xmouse < this.main["menu-threat"]["menu-threat-" + a]._width && this.main["menu-threat"]["menu-threat-" + a]._ymouse > 0 && this.main["menu-threat"]["menu-threat-" + a]._ymouse < this.main["menu-threat"]["menu-threat-" + a]._height)
         {
            _root.soundBox.playSound("click2SND");
            currentThreatChoice = a;
            top = false;
            this.main["menu-threat"]["menu-threat-threat-frame"]._x = this.main["menu-threat"]["menu-threat-" + a]._x;
            this.main["menu-threat"]["menu-threat-threat-frame"]._y = this.main["menu-threat"]["menu-threat-" + a]._y;
         }
         a++;
      }
      if(top == true)
      {
         this.main["menu-threat"]["button-proccess"].gotoAndStop("add");
         this.main["menu-threat"]["menu-threat-threat-frame"]._alpha = 0;
         this.main["menu-threat"]["menu-threat-T-frame"]._alpha = 100;
         this.main["menu-threat"]["menu-threat-zone-frame"]._alpha = 100;
         if(currentThreatTypeChoice == null)
         {
            this.main["menu-threat"]["menu-threat-threatBox-frame"]._alpha = 0;
         }
         else
         {
            this.main["menu-threat"]["menu-threat-threatBox-frame"]._alpha = 100;
         }
      }
      else
      {
         this.main["menu-threat"]["button-proccess"].gotoAndStop("del");
         this.main["menu-threat"]["menu-threat-threat-frame"]._alpha = 100;
         this.main["menu-threat"]["menu-threat-T-frame"]._alpha = 0;
         this.main["menu-threat"]["menu-threat-zone-frame"]._alpha = 0;
         this.main["menu-threat"]["menu-threat-threatBox-frame"]._alpha = 0;
      }
      mouseClick = false;
   }
};
