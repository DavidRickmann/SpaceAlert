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
         game.crewOrder = [];
         trace(currentPlayerSelect);
         a = 0;
         while(a <= currentPlayerSelect)
         {
            game.crewOrder[game.crewOrder.length] = a;
            a++;
         }
         trace(game.crewOrder);
         game.crew[0].crewRank = this.main.selectCrew["menu-crew-box0"].crewRank;
         game.crew[0].crewName = this.main.selectCrew["menu-crew-box0"].crewName;
         game.crew[0].color = this.main.selectCrew["menu-crew-box0"].man._currentFrame - 1;
         trace(game.crew[0].crewRank);
         trace(game.crew[0].crewName);
         trace(game.crew[0].color);
         game.crew[1].crewRank = this.main.selectCrew["menu-crew-box1"].crewRank;
         game.crew[1].crewName = this.main.selectCrew["menu-crew-box1"].crewName;
         game.crew[1].color = this.main.selectCrew["menu-crew-box1"].man._currentFrame - 1;
         game.crew[2].crewRank = this.main.selectCrew["menu-crew-box2"].crewRank;
         game.crew[2].crewName = this.main.selectCrew["menu-crew-box2"].crewName;
         game.crew[2].color = this.main.selectCrew["menu-crew-box2"].man._currentFrame - 1;
         game.crew[3].crewRank = this.main.selectCrew["menu-crew-box3"].crewRank;
         game.crew[3].crewName = this.main.selectCrew["menu-crew-box3"].crewName;
         game.crew[3].color = this.main.selectCrew["menu-crew-box3"].man._currentFrame - 1;
         game.crew[4].crewRank = this.main.selectCrew["menu-crew-box4"].crewRank;
         game.crew[4].crewName = this.main.selectCrew["menu-crew-box4"].crewName;
         game.crew[4].color = this.main.selectCrew["menu-crew-box4"].man._currentFrame - 1;
         trace(game.crew[4].crewRank);
         trace(game.crew[4].crewName);
         trace(game.crew[4].color);
         this.main.selectCrew.removeMovieClip();
         currentSelectedTurn = 0;
         currentSelectedCrew = 0;
         game.crewLocations[1][0].wait = [];
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
            game.crewLocations[1][0].wait[game.crewLocations[1][0].wait.length] = game.crewOrder[a];
            a++;
         }
         this.main.attachMovie("menu-action-crew-frame","menu-action-crew-frame",this.main.getNextHighestDepth());
         this.main["menu-action-crew-frame"]._x = 60;
         this.main["menu-action-crew-frame"]._y = 60;
         gotoAndStop("selectActions");
         play();
      }
      if(this.main.menuButton._xmouse < 0 && this.main.menuButton._xmouse > -1 * this.main.menuButton._width / 2 && this.main.menuButton._ymouse > 0 && this.main.menuButton._ymouse < this.main.menuButton._height)
      {
         _root.soundBox.playSound("clickSND");
         this.main.selectCrew.removeMovieClip();
         this.main.menuButton.removeMovieClip();
         this.main.attachMovie("menu-main","menu-main",this.main.getNextHighestDepth());
         gotoAndStop("menuLoop");
         play();
      }
      a = 0;
      while(a < 5)
      {
         if(this.main.selectCrew["playerSelect" + a]._xmouse > 0 && this.main.selectCrew["playerSelect" + a]._xmouse < this.main.selectCrew["playerSelect" + a]._width && this.main.selectCrew["playerSelect" + a]._ymouse > 0 && this.main.selectCrew["playerSelect" + a]._ymouse < this.main.selectCrew["playerSelect" + a]._height)
         {
            _root.soundBox.playSound("click2SND");
            this.main.selectCrew["playerSelect" + currentPlayerSelect].gotoAndStop("off");
            if(a < currentPlayerSelect)
            {
               b = a + 1;
               while(b < currentPlayerSelect + 1)
               {
                  colorSet[colorSet.length] = this.main.selectCrew["menu-crew-box" + b].man._currentFrame - 1;
                  this.main.selectCrew["menu-crew-box" + b].removeMovieClip();
                  b++;
               }
            }
            else
            {
               b = currentPlayerSelect + 1;
               while(b < a + 1)
               {
                  this.main.selectCrew.attachMovie("menu-crew-box","menu-crew-box" + b,this.main.selectCrew.getNextHighestDepth());
                  this.main.selectCrew["menu-crew-box" + b]._x = 50 + 191 * b;
                  this.main.selectCrew["menu-crew-box" + b]._y = 150;
                  this.main.selectCrew["menu-crew-box" + b].player = "CREW " + (b + 1);
                  this.main.selectCrew["menu-crew-box" + b].crewRank = game.tempCrewData[b].crewRank;
                  this.main.selectCrew["menu-crew-box" + b].crewName = game.tempCrewData[b].crewName;
                  this.main.selectCrew["menu-crew-box" + b].man.gotoAndStop(colorSet[colorSet.length - 1] + 1);
                  this.main.selectCrew["menu-crew-box" + b]["color-0"].gotoAndStop("off");
                  this.main.selectCrew["menu-crew-box" + b]["color-1"].gotoAndStop("off");
                  this.main.selectCrew["menu-crew-box" + b]["color-2"].gotoAndStop("off");
                  this.main.selectCrew["menu-crew-box" + b]["color-3"].gotoAndStop("off");
                  this.main.selectCrew["menu-crew-box" + b]["color-4"].gotoAndStop("off");
                  this.main.selectCrew["menu-crew-box" + b]["color-" + colorSet[colorSet.length - 1]].gotoAndStop("on");
                  colorSet[colorSet.length - 1] = null;
                  colorSet = cleanArray(colorSet);
                  trace(colorSet);
                  b++;
               }
            }
            currentPlayerSelect = a;
            this.main.selectCrew["playerSelect" + currentPlayerSelect].gotoAndStop("on");
         }
         b = 0;
         while(b < 5)
         {
            if(this.main.selectCrew["menu-crew-box" + a]["color-" + b]._xmouse > 0 && this.main.selectCrew["menu-crew-box" + a]["color-" + b]._xmouse < this.main.selectCrew["menu-crew-box" + a]["color-" + b]._width && this.main.selectCrew["menu-crew-box" + a]["color-" + b]._ymouse > 0 && this.main.selectCrew["menu-crew-box" + a]["color-" + b]._ymouse < this.main.selectCrew["menu-crew-box" + a]["color-" + b]._height)
            {
               _root.soundBox.playSound("click2SND");
               setColor = false;
               c = colorSet.length - 1;
               while(c >= 0)
               {
                  if(b == colorSet[c])
                  {
                     colorSet[c] = null;
                     colorSet = cleanArray(colorSet);
                     setColor = true;
                     colorSet[colorSet.length] = this.main.selectCrew["menu-crew-box" + a].man._currentFrame - 1;
                     trace(colorSet);
                  }
                  c--;
               }
               if(setColor == false)
               {
                  c = 0;
                  while(c < 5)
                  {
                     if(b == this.main.selectCrew["menu-crew-box" + c].man._currentFrame - 1 && c != a)
                     {
                        this.main.selectCrew["menu-crew-box" + c]["color-0"].gotoAndStop("off");
                        this.main.selectCrew["menu-crew-box" + c]["color-1"].gotoAndStop("off");
                        this.main.selectCrew["menu-crew-box" + c]["color-2"].gotoAndStop("off");
                        this.main.selectCrew["menu-crew-box" + c]["color-3"].gotoAndStop("off");
                        this.main.selectCrew["menu-crew-box" + c]["color-4"].gotoAndStop("off");
                        this.main.selectCrew["menu-crew-box" + c]["color-" + (this.main.selectCrew["menu-crew-box" + a].man._currentFrame - 1)].gotoAndStop("on");
                        this.main.selectCrew["menu-crew-box" + c].man.gotoAndStop(this.main.selectCrew["menu-crew-box" + a].man._currentFrame);
                     }
                     c++;
                  }
               }
               this.main.selectCrew["menu-crew-box" + a]["color-0"].gotoAndStop("off");
               this.main.selectCrew["menu-crew-box" + a]["color-1"].gotoAndStop("off");
               this.main.selectCrew["menu-crew-box" + a]["color-2"].gotoAndStop("off");
               this.main.selectCrew["menu-crew-box" + a]["color-3"].gotoAndStop("off");
               this.main.selectCrew["menu-crew-box" + a]["color-4"].gotoAndStop("off");
               this.main.selectCrew["menu-crew-box" + a]["color-" + b].gotoAndStop("on");
               this.main.selectCrew["menu-crew-box" + a].man.gotoAndStop(b + 1);
            }
            b++;
         }
         a++;
      }
   }
   mouseClick = false;
};
