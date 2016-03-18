trace("HERE!!");
if(game.currentTurn < 14)
{
   gotoAndStop("processTurn");
   play();
}
else
{
   gotoAndStop("animate");
   play();
}
