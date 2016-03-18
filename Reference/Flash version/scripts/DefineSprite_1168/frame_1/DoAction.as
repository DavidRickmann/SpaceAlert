function playSound(sound)
{
   soundBit.attachSound(sound);
   soundBit.start(0,1);
   soundBit.setVolume(volBit);
}
function stopSound()
{
   soundBit.stop();
}
function playSound2(sound)
{
   soundBit2.attachSound(sound);
   soundBit2.start(0,1);
   soundBit2.setVolume(volBit);
}
function stopSound2()
{
   soundBit2.stop();
}
function playSoundLoop(sound)
{
   soundBitLoop.attachSound(sound);
   soundBitLoop.start(0,99);
   soundBitLoop.setVolume(volBit);
}
function stopSoundLoop()
{
   soundBitLoop.stop();
}
function playSoundLoop2(sound)
{
   soundBitLoop2.attachSound(sound);
   soundBitLoop2.start(0,99);
   soundBitLoop2.setVolume(volBit);
}
function stopSoundLoop2()
{
   soundBitLoop2.stop();
}
function playMusic(sound)
{
   soundMusic.attachSound(sound);
   soundMusic.start(0,99);
   soundMusic.setVolume(volMusic);
}
function stopMusic()
{
   soundMusic.stop();
}
