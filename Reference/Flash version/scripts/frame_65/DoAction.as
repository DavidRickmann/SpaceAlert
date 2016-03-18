function precessActionSelect(action)
{
   game.crew[currentSelectedCrew].actions[currentSelectedTurn] = action;
   this.main["menu-actions-buttons"]["actionTile" + currentSelectedTurn].removeMovieClip();
   if(a != 0 && a != 1)
   {
      trace("menu-actions-buttons-" + action);
      this.main["menu-actions-buttons"].attachMovie("menu-actions-button-" + action,"actionTile" + currentSelectedTurn,this.main["menu-actions-buttons"].getNextHighestDepth());
      this.main["menu-actions-buttons"]["actionTile" + currentSelectedTurn]._x = this.main["menu-actions-buttons"]["turn-" + currentSelectedTurn]._x + 7;
      this.main["menu-actions-buttons"]["actionTile" + currentSelectedTurn]._y = this.main["menu-actions-buttons"]["turn-" + currentSelectedTurn]._y + 7;
   }
   if(a != 1)
   {
      this.main["menu-actions-buttons"]["turn-" + currentSelectedTurn].gotoAndStop("off");
      currentSelectedTurn++;
      if(currentSelectedTurn == 12)
      {
         currentSelectedTurn = 0;
      }
      this.main["menu-actions-buttons"]["turn-" + currentSelectedTurn].gotoAndStop("on");
   }
}
if(Key.isDown(16))
{
   checkString();
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
      a = 2;
      if(keyPressed == "A")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("AH");
      }
      if(keyPressed == "B")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("BH");
      }
      if(keyPressed == "X")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("BattH");
      }
      if(keyPressed == "a")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("A");
      }
      if(keyPressed == "b")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("B");
      }
      if(keyPressed == "x")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("Batt");
      }
      if(keyPressed == "c")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("C");
      }
      if(keyPressed == "r")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("R");
      }
      if(keyPressed == "l")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("L");
      }
      if(keyPressed == "d")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("D");
      }
      if(keyPressed == "1")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("00");
      }
      if(keyPressed == "2")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("10");
      }
      if(keyPressed == "3")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("20");
      }
      if(keyPressed == "4")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("01");
      }
      if(keyPressed == "5")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("11");
      }
      if(keyPressed == "6")
      {
         _root.soundBox.playSound("clickSND");
         precessActionSelect("21");
      }
      keyCheck = 1;
      if(Key.isDown(32))
      {
         _root.soundBox.playSound("clickSND");
         a = 0;
         precessActionSelect("-");
      }
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
         this.main["menu-actions-buttons"].removeMovieClip();
         a = 0;
         while(a < game.crewOrder.length)
         {
            this.main["menu-crew" + a].removeMovieClip();
            a++;
         }
         this.main["menu-action-crew-frame"].removeMovieClip();
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
      if(this.main.menuButton._xmouse < 0 && this.main.menuButton._xmouse > -1 * this.main.menuButton._width / 2 && this.main.menuButton._ymouse > 0 && this.main.menuButton._ymouse < this.main.menuButton._height)
      {
         _root.soundBox.playSound("clickSND");
         this.main["menu-actions-buttons"].removeMovieClip();
         a = 0;
         while(a < game.crewOrder.length)
         {
            this.main["menu-crew" + a].removeMovieClip();
            a++;
         }
         this.main["menu-action-crew-frame"].removeMovieClip();
         currentPlayerSelect = game.crewOrder.length - 1;
         this.main.attachMovie("selectCrew","selectCrew",this.main.getNextHighestDepth());
         this.main.selectCrew.attachMovie("playerSelect","playerSelect0",this.main.selectCrew.getNextHighestDepth());
         this.main.selectCrew.playerSelect0._x = 500;
         this.main.selectCrew.playerSelect0._y = 30;
         this.main.selectCrew.playerSelect0.number = "1";
         this.main.selectCrew.attachMovie("playerSelect","playerSelect1",this.main.selectCrew.getNextHighestDepth());
         this.main.selectCrew.playerSelect1._x = 570;
         this.main.selectCrew.playerSelect1._y = 30;
         this.main.selectCrew.playerSelect1.number = "2";
         this.main.selectCrew.attachMovie("playerSelect","playerSelect2",this.main.selectCrew.getNextHighestDepth());
         this.main.selectCrew.playerSelect2._x = 640;
         this.main.selectCrew.playerSelect2._y = 30;
         this.main.selectCrew.playerSelect2.number = "3";
         this.main.selectCrew.attachMovie("playerSelect","playerSelect3",this.main.selectCrew.getNextHighestDepth());
         this.main.selectCrew.playerSelect3._x = 710;
         this.main.selectCrew.playerSelect3._y = 30;
         this.main.selectCrew.playerSelect3.number = "4";
         this.main.selectCrew.attachMovie("playerSelect","playerSelect4",this.main.selectCrew.getNextHighestDepth());
         this.main.selectCrew.playerSelect4._x = 780;
         this.main.selectCrew.playerSelect4._y = 30;
         this.main.selectCrew.playerSelect4.number = "5";
         this.main.selectCrew["playerSelect" + currentPlayerSelect].gotoAndStop("on");
         colorSet = [0,1,2,3,4];
         a = 0;
         while(a <= currentPlayerSelect)
         {
            this.main.selectCrew.attachMovie("menu-crew-box","menu-crew-box" + a,this.main.selectCrew.getNextHighestDepth());
            this.main.selectCrew["menu-crew-box" + a]._x = 50 + 191 * a;
            this.main.selectCrew["menu-crew-box" + a]._y = 150;
            this.main.selectCrew["menu-crew-box" + a].player = "CREW " + (a + 1);
            this.main.selectCrew["menu-crew-box" + a].crewRank = game.crew[a].crewRank;
            this.main.selectCrew["menu-crew-box" + a].crewName = game.crew[a].crewName;
            this.main.selectCrew["menu-crew-box" + a].man.gotoAndStop(game.crew[a].color + 1);
            colorSet[game.crew[a].color] = null;
            this.main.selectCrew["menu-crew-box" + a]["color-0"].gotoAndStop("off");
            this.main.selectCrew["menu-crew-box" + a]["color-1"].gotoAndStop("off");
            this.main.selectCrew["menu-crew-box" + a]["color-2"].gotoAndStop("off");
            this.main.selectCrew["menu-crew-box" + a]["color-3"].gotoAndStop("off");
            this.main.selectCrew["menu-crew-box" + a]["color-4"].gotoAndStop("off");
            this.main.selectCrew["menu-crew-box" + a]["color-" + game.crew[a].color].gotoAndStop("on");
            a++;
         }
         colorSet = cleanArray(colorSet);
         gotoAndStop("selectCrew");
         play();
      }
      a = 0;
      while(a < 5)
      {
         if(this.main["menu-crew" + a]._xmouse > 0 && this.main["menu-crew" + a]._xmouse < this.main["menu-crew" + a]._width && this.main["menu-crew" + a]._ymouse > 0 && this.main["menu-crew" + a]._ymouse < this.main["menu-crew" + a]._height)
         {
            _root.soundBox.playSound("clickSND");
            currentSelectedCrew = a;
            this.main["menu-action-crew-frame"]._y = 60 + 130 * a;
            this.main["menu-actions-buttons"]["turn-" + currentSelectedTurn].gotoAndStop("off");
            currentSelectedTurn = 0;
            this.main["menu-actions-buttons"]["turn-0"].gotoAndStop("on");
            fillActions(a);
         }
         a++;
      }
      a = 0;
      while(a < 12)
      {
         if(this.main["menu-actions-buttons"]["turn-" + a]._xmouse > 0 && this.main["menu-actions-buttons"]["turn-" + a]._xmouse < this.main["menu-actions-buttons"]["turn-" + a]._width && this.main["menu-actions-buttons"]["turn-" + a]._ymouse > 0 && this.main["menu-actions-buttons"]["turn-" + a]._ymouse < this.main["menu-actions-buttons"]["turn-" + a]._height)
         {
            _root.soundBox.playSound("click2SND");
            this.main["menu-actions-buttons"]["turn-" + currentSelectedTurn].gotoAndStop("off");
            currentSelectedTurn = a;
            this.main["menu-actions-buttons"]["turn-" + a].gotoAndStop("on");
         }
         a++;
      }
      a = 0;
      while(a < 18)
      {
         if(this.main["menu-actions-buttons"]["button-" + a]._xmouse > 0 && this.main["menu-actions-buttons"]["button-" + a]._xmouse < this.main["menu-actions-buttons"]["button-" + a]._width && this.main["menu-actions-buttons"]["button-" + a]._ymouse > 0 && this.main["menu-actions-buttons"]["button-" + a]._ymouse < this.main["menu-actions-buttons"]["button-" + a]._height)
         {
            _root.soundBox.playSound("clickSND");
            action = null;
            if(a == 0)
            {
               action = "-";
            }
            if(a == 1)
            {
               action = "-";
            }
            if(a == 2)
            {
               action = "Batt";
            }
            if(a == 3)
            {
               action = "A";
            }
            if(a == 4)
            {
               action = "B";
            }
            if(a == 5)
            {
               action = "C";
            }
            if(a == 6)
            {
               action = "D";
            }
            if(a == 7)
            {
               action = "00";
            }
            if(a == 8)
            {
               action = "10";
            }
            if(a == 9)
            {
               action = "20";
            }
            if(a == 10)
            {
               action = "BattH";
            }
            if(a == 11)
            {
               action = "AH";
            }
            if(a == 12)
            {
               action = "BH";
            }
            if(a == 13)
            {
               action = "L";
            }
            if(a == 14)
            {
               action = "R";
            }
            if(a == 15)
            {
               action = "01";
            }
            if(a == 16)
            {
               action = "11";
            }
            if(a == 17)
            {
               action = "21";
            }
            precessActionSelect(action);
         }
         a++;
      }
   }
   mouseClick = false;
};
