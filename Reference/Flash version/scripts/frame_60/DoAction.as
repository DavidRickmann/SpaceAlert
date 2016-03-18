onMouseDown = function()
{
   if(this.main["menu-main"].startButton._xmouse > 0 && this.main["menu-main"].startButton._xmouse < 300 && this.main["menu-main"].startButton._ymouse > 0 && this.main["menu-main"].startButton._ymouse < 60)
   {
      this.main["menu-main"].removeMovieClip();
      _root.soundBox.playSound("clickSND");
      varInit();
      gotoAndStop("start");
      play();
   }
   mouseClick = true;
};
onMouseUp = function()
{
   if(mouseClick == true)
   {
   }
};
