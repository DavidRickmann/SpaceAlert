if(_root.getBytesLoaded() == _root.getBytesTotal())
{
   trace("HERE");
   trace(_root.vessel);
   _root.button._alpha = 100;
   gotoAndPlay(3);
}
else
{
   gotoAndPlay(1);
}
