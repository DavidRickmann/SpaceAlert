onMouseDown = function()
{
   mouseClick = true;
};
onMouseUp = function()
{
   if(mouseClick == true)
   {
      if(_parent["sound-buttons"].music._xmouse > 0 && _parent["sound-buttons"].music._xmouse < _parent["sound-buttons"].music._width && _parent["sound-buttons"].music._ymouse > 0 && _parent["sound-buttons"].music._ymouse < _parent["sound-buttons"].music._height)
      {
         _root.soundBox.playSound("clickSND");
         if(_root.soundBox.volMusic == 100)
         {
            _parent["sound-buttons"]["music-frame"]._alpha = 0;
            _root.soundBox.volMusic = 0;
            _root.soundBox.soundMusic.setVolume(_root.soundBox.volMusic);
         }
         else
         {
            _parent["sound-buttons"]["music-frame"]._alpha = 100;
            _root.soundBox.volMusic = 100;
            _root.soundBox.soundMusic.setVolume(_root.soundBox.volMusic);
         }
      }
      if(_parent["sound-buttons"].soundFX._xmouse > 0 && _parent["sound-buttons"].soundFX._xmouse < _parent["sound-buttons"].soundFX._width && _parent["sound-buttons"].soundFX._ymouse > 0 && _parent["sound-buttons"].soundFX._ymouse < _parent["sound-buttons"].soundFX._height)
      {
         _root.soundBox.playSound("clickSND");
         if(_root.soundBox.volBit == 100)
         {
            _parent["sound-buttons"]["soundFX-frame"]._alpha = 0;
            _root.soundBox.volBit = 0;
            _root.soundBox.soundBitLoop2.setVolume(_root.soundBox.volBit);
            _root.soundBox.soundBitLoop.setVolume(_root.soundBox.volBit);
            _root.soundBox.soundBit.setVolume(_root.soundBox.volBit);
            _root.soundBox.soundBit2.setVolume(_root.soundBox.volBit);
         }
         else
         {
            _parent["sound-buttons"]["soundFX-frame"]._alpha = 100;
            _root.soundBox.volBit = 100;
            _root.soundBox.soundBitLoop2.setVolume(_root.soundBox.volBit);
            _root.soundBox.soundBitLoop.setVolume(_root.soundBox.volBit);
            _root.soundBox.soundBit.setVolume(_root.soundBox.volBit);
            _root.soundBox.soundBit2.setVolume(_root.soundBox.volBit);
         }
      }
   }
};
