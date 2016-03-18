if(BG2.getDepth() > BG1.getDepth())
{
   BG2._x = BG2._x - 1;
   if(BG2._x < -400)
   {
      BG2._alpha = BG2._alpha - 1;
      BG1._x = BG1._x - 1;
   }
   if(BG2._alpha <= 0)
   {
      BG2._alpha = 100;
      BG2._x = 0;
      BG2.swapDepths(BG1.getDepth());
   }
}
else
{
   BG1._x = BG1._x - 1;
   if(BG1._x < -400)
   {
      BG1._alpha = BG1._alpha - 1;
      BG2._x = BG2._x - 1;
   }
   if(BG1._alpha <= 0)
   {
      BG1._alpha = 100;
      BG1._x = 0;
      BG1.swapDepths(BG2.getDepth());
   }
}
