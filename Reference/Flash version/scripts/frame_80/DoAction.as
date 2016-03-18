onMouseDown = function()
{
   mouseClick = true;
};
onMouseUp = function()
{
   if(mouseClick == true)
   {
      if(this.main["menu-missionSetup"].begin._xmouse > 0 && this.main["menu-missionSetup"].begin._xmouse < this.main["menu-missionSetup"].begin._width && this.main["menu-missionSetup"].begin._ymouse > 0 && this.main["menu-missionSetup"].begin._ymouse < this.main["menu-missionSetup"].begin._height)
      {
         _root.soundBox.playSound("clickSND");
         this.main["menu-missionSetup"].removeMovieClip();
         this.main.ship.removeMovieClip();
         this.main.stuff.removeMovieClip();
         this.main.elevator.removeMovieClip();
         this.main.crew.removeMovieClip();
         this.main.fighters.removeMovieClip();
         this.main.effects.removeMovieClip();
         this.main.damage.removeMovieClip();
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
         mouseClick = false;
         this.main.attachMovie("button","menuButton",this.main.getNextHighestDepth());
         this.main.menuButton._x = 900;
         this.main.menuButton._y = 600;
         gotoAndStop("selectActions");
         play();
      }
   }
};
