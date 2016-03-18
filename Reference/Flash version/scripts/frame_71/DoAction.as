test = true;
trace("THE TRACKS");
trace(game.threatTracks[0]);
trace(game.threatTracks[1]);
trace(game.threatTracks[2]);
trace(game.threatTracks[3]);
if(game.threatTracks.length < 4)
{
   test = false;
}
a = 0;
while(a < game.threatTracks.length)
{
   trace(game.threatTracks[a]);
   if(game.threatTracks[a] == null)
   {
      test = false;
   }
   a++;
}
if(test == false)
{
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
else
{
   a = 0;
   while(a < zoneTracks.length)
   {
      game.threatTracks[a] = game.threatTracksLibrary[zoneTracks[a]];
      a++;
   }
   this.main.menuButton.removeMovieClip();
   a = 0;
   while(a < 3)
   {
      b = 0;
      while(b < game.ship[a].damageInflict.length)
      {
         doDamageInitial(a,game.ship[a].damageInflict[b]);
         game.ship[a].damageInflicted[b] = game.ship[a].damageInflict[b];
         b++;
      }
      a++;
   }
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
   game.animation[game.animation.length] = ["warpIn",game.ship[0].energy,game.ship[1].energy,game.ship[2].energy,game.ship[0].shields,game.ship[1].shields,game.ship[2].shields,game.ship[0].battleBots,game.ship[2].battleBots];
   onMouseUp = function()
   {
   };
   onMouseDown = function()
   {
   };
   gotoAndStop("processTurn");
   play();
}
