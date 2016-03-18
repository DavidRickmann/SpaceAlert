function drawThreatTrack(ID, track, X, Y, object, size)
{
   baseY = Y - 16;
   color = 3;
   fa = 0;
   while(fa < track.length)
   {
      if(fa < 10)
      {
         color = 2;
      }
      if(fa < 5)
      {
         color = 1;
      }
      if(size == "BIG")
      {
         mult = 2;
      }
      else
      {
         mult = 1;
         size = "";
      }
      baseY = baseY - 18 * mult;
      if(fa == 5)
      {
         baseY = baseY - 6 * mult;
      }
      if(fa == 10)
      {
         baseY = baseY - 6 * mult;
      }
      object.attachMovie("threatTrack" + size + "-" + color,"threatTrack-" + ID + "-" + fa,object.getNextHighestDepth());
      object["threatTrack-" + ID + "-" + fa]._x = X;
      object["threatTrack-" + ID + "-" + fa]._y = baseY;
      object["threatTrack-" + ID + "-" + fa].gotoAndStop("f" + track[fa]);
      color = 3;
      fa++;
   }
}
function fillActions(crewNumber)
{
   fa = 0;
   while(fa < 12)
   {
      this.main["menu-actions-buttons"]["actionTile" + fa].removeMovieClip();
      this.main["menu-actions-buttons"].attachMovie("menu-actions-button-" + game.crew[crewNumber].actions[fa],"actionTile" + fa,this.main["menu-actions-buttons"].getNextHighestDepth());
      this.main["menu-actions-buttons"]["actionTile" + fa]._x = this.main["menu-actions-buttons"]["turn-" + fa]._x + 7;
      this.main["menu-actions-buttons"]["actionTile" + fa]._y = this.main["menu-actions-buttons"]["turn-" + fa]._y + 7;
      fa++;
   }
}
function fillThreats(type)
{
   fa = 0;
   while(fa < 10)
   {
      this.main["menu-threat"]["threat-" + fa].removeMovieClip();
      fa++;
   }
   if(type == "e1")
   {
      loopStart = 0;
      loopEnd = 9;
      type = "external";
   }
   if(type == "e2")
   {
      loopStart = 10;
      loopEnd = 16;
      type = "external";
   }
   if(type == "se1")
   {
      loopStart = 17;
      loopEnd = 24;
      type = "external";
   }
   if(type == "se2")
   {
      loopStart = 25;
      loopEnd = 30;
      type = "external";
   }
   if(type == "i1")
   {
      loopStart = 0;
      loopEnd = 6;
      type = "internal";
   }
   if(type == "i2")
   {
      loopStart = 7;
      loopEnd = 12;
      type = "internal";
   }
   if(type == "si1")
   {
      loopStart = 13;
      loopEnd = 18;
      type = "internal";
   }
   if(type == "si2")
   {
      loopStart = 19;
      loopEnd = 23;
      type = "internal";
   }
   slot = 0;
   fa = loopStart;
   while(fa <= loopEnd)
   {
      this.main["menu-threat"].attachMovie("menu-threat-threatBox","threat-" + slot,this.main["menu-threat"].getNextHighestDepth());
      XJump = 0;
      YJump = 0;
      if(slot > 4)
      {
         XJump = -1 * (5 * (this.main["menu-threat"]["threat-" + slot]._width + 8));
         YJump = 155;
      }
      this.main["menu-threat"]["threat-" + slot]._x = 159 + slot * (this.main["menu-threat"]["threat-" + slot]._width + 8) + XJump;
      this.main["menu-threat"]["threat-" + slot]._y = 0 + YJump;
      this.main["menu-threat"]["threat-" + slot].name.threatName = game.threatsLibrary[type][fa].threatName;
      this.main["menu-threat"]["threat-" + slot].pic.gotoAndStop(game.threatsLibrary[type][fa].TAG);
      this.main["menu-threat"]["threat-" + slot].TAG = game.threatsLibrary[type][fa].TAG;
      this.main["menu-threat"]["threat-" + slot].type = type;
      this.main["menu-threat"]["threat-" + slot].ID = fa;
      fb = 0;
      while(fb < 8)
      {
         if(this.main["menu-threat"]["menu-threat-" + fb].TAG == game.threatsLibrary[type][fa].TAG)
         {
            this.main["menu-threat"]["threat-" + slot]._alpha = 30;
         }
         fb++;
      }
      slot++;
      fa++;
   }
   currentThreatTypeChoice = 0;
   this.main["menu-threat"]["menu-threat-threatBox-frame"]._x = this.main["menu-threat"]["threat-" + currentThreatTypeChoice]._x;
   this.main["menu-threat"]["menu-threat-threatBox-frame"]._y = this.main["menu-threat"]["threat-" + currentThreatTypeChoice]._y;
   if(this.main["menu-threat"]["threat-0"]._alpha < 100)
   {
      currentThreatTypeChoice = null;
      this.main["menu-threat"]["menu-threat-threatBox-frame"]._alpha = 0;
   }
   if(type == "external")
   {
      externalAlpha = 100;
      internalAlpha = 30;
      if(currentZoneChoice == 3)
      {
         currentZoneChoice = 0;
         this.main["menu-threat"]["menu-threat-zone-frame"]._x = this.main["menu-threat"]["zone" + currentZoneChoice]._x;
         this.main["menu-threat"]["menu-threat-zone-frame"]._y = this.main["menu-threat"]["zone" + currentZoneChoice]._y;
      }
   }
   else
   {
      externalAlpha = 30;
      internalAlpha = 100;
      currentZoneChoice = 3;
      this.main["menu-threat"]["menu-threat-zone-frame"]._x = this.main["menu-threat"]["zone" + currentZoneChoice]._x;
      this.main["menu-threat"]["menu-threat-zone-frame"]._y = this.main["menu-threat"]["zone" + currentZoneChoice]._y;
   }
   this.main["menu-threat"].zone0._alpha = externalAlpha;
   this.main["menu-threat"].zone1._alpha = externalAlpha;
   this.main["menu-threat"].zone2._alpha = externalAlpha;
   this.main["menu-threat"].zone3._alpha = internalAlpha;
}
function updateThreats()
{
   fb = 0;
   while(fb < 25)
   {
      trace("CATALOG NAME " + game.threatsLibrary.external[fb].threatName);
      fb++;
   }
   fa = 0;
   while(fa < game.threats.length)
   {
      currentZoneChoice = game.threats[fa].zone;
      currentTChoice = game.threats[fa].T;
      currentThreatTypeChoice = game.threats[fa].ID;
      currentThreatType = "external";
      if(game.threats[fa].threatType == "internal")
      {
         currentThreatType = "internal";
         currentZoneChoice = 3;
      }
      this.main["menu-threat"].attachMovie("threatDisplay","menu-threat-" + currentTChoice,this.main["menu-threat"].getNextHighestDepth());
      if(currentZoneChoice == 0)
      {
         Xcoord = 15;
      }
      if(currentZoneChoice == 1)
      {
         Xcoord = 217;
      }
      if(currentZoneChoice == 2)
      {
         Xcoord = 418;
      }
      if(currentZoneChoice == 3)
      {
         Xcoord = 617;
      }
      Ycoord = 384 + this["currentZoneLimit" + currentZoneChoice] * 152;
      this.main["menu-threat"]["menu-threat-" + currentTChoice]._x = Xcoord;
      this.main["menu-threat"]["menu-threat-" + currentTChoice]._y = Ycoord;
      this.main["menu-threat"]["menu-threat-" + currentTChoice].zone = currentZoneChoice;
      this.main["menu-threat"]["menu-threat-" + currentTChoice].threatT = currentTChoice + 1;
      this.main["menu-threat"]["menu-threat-" + currentTChoice].speed = game.threatsLibrary[currentThreatType][currentThreatTypeChoice].speed;
      this.main["menu-threat"]["menu-threat-" + currentTChoice].HP = game.threatsLibrary[currentThreatType][currentThreatTypeChoice].HPMAX;
      this.main["menu-threat"]["menu-threat-" + currentTChoice].threatType = currentThreatType;
      this.main["menu-threat"]["menu-threat-" + currentTChoice].ID = currentThreatTypeChoice;
      this.main["menu-threat"]["menu-threat-" + currentTChoice].TAG = game.threatsLibrary[currentThreatType][currentThreatTypeChoice].TAG;
      if(currentThreatType == "external")
      {
         this.main["menu-threat"]["menu-threat-" + currentTChoice].shields = game.threatsLibrary[currentThreatType][currentThreatTypeChoice].shields;
      }
      else
      {
         this.main["menu-threat"]["menu-threat-" + currentTChoice].shields = "";
      }
      this.main["menu-threat"]["menu-threat-" + currentTChoice].pic.gotoAndStop(game.threatsLibrary[currentThreatType][currentThreatTypeChoice].TAG);
      trace("NAME " + game.threatsLibrary[currentThreatType][currentThreatTypeChoice].threatName);
      this.main["menu-threat"]["menu-threat-" + currentTChoice].name.threatName = game.threatsLibrary[currentThreatType][currentThreatTypeChoice].threatName;
      this["currentZoneLimit" + currentZoneChoice]++;
      this.main["menu-threat"]["menu-threat-T-" + currentTChoice].removeMovieClip();
      currentAvailableT[currentTChoice] = null;
      fa++;
   }
   currentThreatTypeChoice = 0;
   currentZoneChoice = 0;
   currentTChoice = -1;
   currentThreatType = "external";
   test = null;
   loopNum = 0;
   while(test == null && loopNum < 8)
   {
      currentTChoice++;
      if(currentTChoice == 8)
      {
         currentTChoice = 0;
      }
      test = currentAvailableT[currentTChoice];
      loopNum++;
   }
   if(test == null)
   {
      this.main["menu-threat"]["menu-threat-T-frame"].removeMovieClip();
      currentTChoice = null;
   }
}
function troubleShoot()
{
   fa = 0;
   while(fa < 8)
   {
      trace("=========================== " + fa + " ================================");
      trace(" X " + this.main["menu-threat"]["menu-threat-" + fa]._x + " \n" + " Y " + this.main["menu-threat"]["menu-threat-" + fa]._y + " \n" + " zone " + this.main["menu-threat"]["menu-threat-" + fa].zone + " \n" + " T " + this.main["menu-threat"]["menu-threat-" + fa].threatT + " \n" + " speed " + this.main["menu-threat"]["menu-threat-" + fa].speed + " \n" + " HP " + this.main["menu-threat"]["menu-threat-" + fa].HP + " \n" + " type " + this.main["menu-threat"]["menu-threat-" + fa].threatType + " \n" + " ID " + this.main["menu-threat"]["menu-threat-" + fa].ID + " \n" + " shield " + this.main["menu-threat"]["menu-threat-" + fa].shields + " \n" + " zoneLimit " + this["currentZoneLimit" + this.main["menu-threat"]["menu-threat-" + fa].zone] + " \n");
      fa++;
   }
}
function animDrawThreat(threat, buff, shieldsMAX, speedMAX, HPMAX)
{
   zone = game.threats[threat].zone;
   if(game.threats[threat].internal == true)
   {
      zone = 3;
   }
   trace("new problem " + zone);
   trace("new problem 2 " + game["threats" + zone]);
   trace("threat Name  " + game.threats[threat].threatName);
   Ycoord = 10 + 133 * game["threats" + zone];
   Xcoord = 115 + 230 * zone;
   if(game.threats[threat].internal == true)
   {
      Ycoord = 410 + 133 * game["threats" + zone];
      Xcoord = 129 + 230 * zone;
   }
   this.main.threats.attachMovie("threatDisplay","threatDisplay" + threat,this.main.threats.getNextHighestDepth());
   this.main.threats["threatDisplay" + threat]._x = Xcoord;
   this.main.threats["threatDisplay" + threat]._y = Ycoord;
   this.main.threats["threatDisplay" + threat].zone.gotoAndStop("z" + zone);
   this.main.threats["threatDisplay" + threat].name.threatName = game.threats[threat].threatName;
   this.main.threats["threatDisplay" + threat].threatT = game.threats[threat].T + 1;
   this.main.threats["threatDisplay" + threat].speed = speedMAX;
   this.main.threats["threatDisplay" + threat].HP = HPMAX;
   this.main.threats["threatDisplay" + threat].shields = shieldsMAX + buff;
   this.main.threats["threatDisplay" + threat].pic.gotoAndStop(game.threats[threat].TAG);
   this.main.threats["threatDisplay" + threat].cryo._alpha = 0;
   if(game.threats[threat].threatName == "STEALTH FIGHTER" || game.threats[threat].threatName == "PHANTOM FIGHTER")
   {
      this.main.threats["threatDisplay" + threat].pic._alpha = 20;
   }
   if(game.threats[threat].internal == true)
   {
      this.main.threats["threatDisplay" + threat].shields = "";
   }
   this.main.threats.attachMovie("threat-tracker","threat-tracker" + threat,this.main.threats.getNextHighestDepth());
   temp = "threatTrack-" + zone + "-" + (game.threatTracks[zone].length - 1);
   this.main.threats["threat-tracker" + threat]._x = this.main.threats[temp]._x + 16;
   this.main.threats["threat-tracker" + threat]._y = this.main.threats[temp]._y - 6;
   this.main.threats["threat-tracker" + threat].T = game.threats[threat].T + 1;
   game["threats" + zone]++;
}
function animDrawShip(e0, e1, e2, s0, s1, s2, b0, b1)
{
   this.main.ship._alpha = 100;
   this.main.stuff.attachMovie("fuelcounter","fuelcounter",this.main.stuff.getNextHighestDepth());
   this.main.stuff.fuelcounter._x = 310;
   this.main.stuff.fuelcounter._y = 711;
   this.main.stuff.fuelcounter.gotoAndStop("f3");
   this.main.stuff.attachMovie("energycounter","energycounter0",this.main.stuff.getNextHighestDepth());
   this.main.stuff.energycounter0._x = 145;
   this.main.stuff.energycounter0._y = 659;
   this.main.stuff.attachMovie("energycounter","energycounter1",this.main.stuff.getNextHighestDepth());
   this.main.stuff.energycounter1._x = 295;
   this.main.stuff.energycounter1._y = 659;
   this.main.stuff.attachMovie("energycounter","energycounter2",this.main.stuff.getNextHighestDepth());
   this.main.stuff.energycounter2._x = 500;
   this.main.stuff.energycounter2._y = 659;
   this.main.stuff.attachMovie("shieldcounter","shieldcounter0",this.main.stuff.getNextHighestDepth());
   this.main.stuff.shieldcounter0._x = 157;
   this.main.stuff.shieldcounter0._y = 308;
   this.main.stuff.attachMovie("shieldcounter","shieldcounter1",this.main.stuff.getNextHighestDepth());
   this.main.stuff.shieldcounter1._x = 420;
   this.main.stuff.shieldcounter1._y = 259;
   this.main.stuff.attachMovie("shieldcounter","shieldcounter2",this.main.stuff.getNextHighestDepth());
   this.main.stuff.shieldcounter2._x = 551;
   this.main.stuff.shieldcounter2._y = 308;
   this.main.stuff.attachMovie("rocket","rocket0",this.main.stuff.getNextHighestDepth());
   this.main.stuff.rocket0._x = game.coordinateLocations.rocket0[0];
   this.main.stuff.rocket0._y = game.coordinateLocations.rocket0[1];
   this.main.stuff.attachMovie("rocket","rocket1",this.main.stuff.getNextHighestDepth());
   this.main.stuff.rocket1._x = game.coordinateLocations.rocket1[0];
   this.main.stuff.rocket1._y = game.coordinateLocations.rocket1[1];
   this.main.stuff.attachMovie("rocket","rocket2",this.main.stuff.getNextHighestDepth());
   this.main.stuff.rocket2._x = game.coordinateLocations.rocket2[0];
   this.main.stuff.rocket2._y = game.coordinateLocations.rocket2[1];
   this.main.elevator.attachMovie("elevator","elevator0",this.main.stuff.getNextHighestDepth());
   this.main.elevator.elevator0._x = game.coordinateLocations[0][0].grav[2];
   this.main.elevator.elevator0._y = game.coordinateLocations[0][0].grav[3];
   this.main.elevator.elevator0.swapDepths(this.main.elevator.elevator0._y * 1000 + this.main.elevator.elevator0._x);
   this.main.elevator.attachMovie("elevator","elevator1",this.main.stuff.getNextHighestDepth());
   this.main.elevator.elevator1._x = game.coordinateLocations[1][0].grav[2];
   this.main.elevator.elevator1._y = game.coordinateLocations[1][0].grav[3];
   this.main.elevator.elevator1.swapDepths(this.main.elevator.elevator1._y * 1000 + this.main.elevator.elevator1._x);
   this.main.elevator.attachMovie("elevator","elevator2",this.main.stuff.getNextHighestDepth());
   this.main.elevator.elevator2._x = game.coordinateLocations[2][0].grav[2];
   this.main.elevator.elevator2._y = game.coordinateLocations[2][0].grav[3];
   this.main.elevator.elevator2.swapDepths(this.main.elevator.elevator2._y * 1000 + this.main.elevator.elevator2._x);
   fa = 0;
   while(fa < game.crewOrder.length)
   {
      Xcoord = game.coordinateLocations[1][0]["wait" + game.crewOrder[fa]][0] + this.main.ship._x;
      Ycoord = game.coordinateLocations[1][0]["wait" + game.crewOrder[fa]][1] + this.main.ship._y;
      this.main.crew.attachMovie("crew" + game.crew[game.crewOrder[fa]].color,"crew" + fa,Ycoord * 1000 + Xcoord);
      game.crewLocations[1][0].wait[game.crewLocations[1][0].wait.length] = fa;
      this.main.crew["crew" + fa]._x = Xcoord;
      this.main.crew["crew" + fa]._y = Ycoord;
      fa++;
   }
   if(b0 != null)
   {
      Xcoord = game.coordinateLocations.battlebots0[0];
      Ycoord = game.coordinateLocations.battlebots0[1];
      this.main.crew.attachMovie("battlebots","battlebots0",Ycoord * 1000 + Xcoord);
      this.main.crew.battlebots0._x = Xcoord;
      this.main.crew.battlebots0._y = Ycoord;
   }
   if(b1 != null)
   {
      Xcoord = game.coordinateLocations.battlebots1[0];
      Ycoord = game.coordinateLocations.battlebots1[1];
      this.main.crew.attachMovie("battlebots","battlebots1",Ycoord * 1000 + Xcoord);
      this.main.crew.battlebots1._x = Xcoord;
      this.main.crew.battlebots1._y = Ycoord;
   }
   this.main.fighters.attachMovie("fighter","fighter0",this.main.fighters.getNextHighestDepth());
   this.main.fighters.fighter0._x = game.coordinateLocations.fighter0[0];
   this.main.fighters.fighter0._y = game.coordinateLocations.fighter0[1];
   this.main.fighters.attachMovie("fighter","fighter1",this.main.fighters.getNextHighestDepth());
   this.main.fighters.fighter1._x = game.coordinateLocations.fighter1[0];
   this.main.fighters.fighter1._y = game.coordinateLocations.fighter1[1];
   this.main.fighters.attachMovie("fighter","fighter2",this.main.fighters.getNextHighestDepth());
   this.main.fighters.fighter2._x = game.coordinateLocations.fighter2[0];
   this.main.fighters.fighter2._y = game.coordinateLocations.fighter2[1];
   fa = 0;
   while(fa < 3)
   {
      fb = 0;
      while(fb < game.ship[fa].damageInflict.length)
      {
         damageType = game.ship[fa].damageChipsLibrary[game.ship[fa].damageInflict[fb]];
         trace(damageType);
         this.main.damage.attachMovie("ship-damage","damage-" + fa + "-" + damageType,this.main.damage.getNextHighestDepth());
         this.main.damage["damage-" + fa + "-" + damageType]._x = game.coordinateLocations[fa][0].damageLocation[damageType][0] + this.main.ship._x - 20;
         this.main.damage["damage-" + fa + "-" + damageType]._y = game.coordinateLocations[fa][0].damageLocation[damageType][1] + this.main.ship._y - 20;
         if(damageType == "shield")
         {
            this.main.damage["damage-" + fa + "-" + damageType].type = "SHIELD";
         }
         if(damageType == "energy")
         {
            this.main.damage["damage-" + fa + "-" + damageType].type = "GEN";
         }
         if(damageType == "gravChute")
         {
            this.main.damage["damage-" + fa + "-" + damageType].type = "GRAV";
         }
         if(damageType == "HLaser")
         {
            this.main.damage["damage-" + fa + "-" + damageType].type = "GUN";
         }
         if(damageType == "pulseCannon")
         {
            this.main.damage["damage-" + fa + "-" + damageType].type = "GUN";
         }
         if(damageType == "hull")
         {
            this.main.damage["damage-" + fa + "-" + damageType].type = "HULL";
         }
         if(damageType == "LLaser")
         {
            this.main.damage["damage-" + fa + "-" + damageType].type = "GUN";
         }
         fb++;
      }
      fa++;
   }
   this.main.stuff.energycounter0.gotoAndStop("e" + e0);
   this.main.stuff.energycounter1.gotoAndStop("e" + e1);
   this.main.stuff.energycounter2.gotoAndStop("e" + e2);
   this.main.stuff.shieldcounter0.gotoAndStop("s" + s0);
   this.main.stuff.shieldcounter1.gotoAndStop("s" + s1);
   this.main.stuff.shieldcounter2.gotoAndStop("s" + s2);
}
function anglePointToPoint(fax, fay, fbx, fby)
{
   aimAngle = Math.atan2(fay - fby,fax - fbx) / 3.141592653589793 * 180 + 90;
   return aimAngle;
}
function distPointToPoint(fax, fay, fbx, fby)
{
   distx = fbx - fax;
   disty = fby - fay;
   dist = Math.sqrt(Math.pow(distx,2) + Math.pow(disty,2));
   return dist;
}
function checkHeading(heading, startX, startY, endX, endY, rotVel)
{
   targetHeading = anglePointToPoint(endX,endY,startX,startY);
   if(targetHeading != heading)
   {
      if(targetHeading < 0)
      {
         targetHeading = targetHeading + 360;
      }
      angleDiff = targetHeading - heading;
      if(angleDiff > 180)
      {
         angleDiff = angleDiff - 360;
      }
      if(angleDiff < -180)
      {
         angleDiff = angleDiff + 360;
      }
      if(Math.abs(angleDiff) < rotVel)
      {
         heading = targetHeading;
      }
      else
      {
         heading = heading + angleDiff / Math.abs(angleDiff) * rotVel;
      }
   }
   return heading;
}
function moveClip(clip, destX, destY, speed)
{
   if(distPointToPoint(clip._x,clip._y,destX,destY) <= speed)
   {
      clip._x = destX;
      clip._y = destY;
   }
   else
   {
      angle = anglePointToPoint(destX,destY,clip._x,clip._y);
      xdisp = Math.sin(angle * 3.141592653589793 / 180) * speed;
      ydisp = Math.cos(angle * 3.141592653589793 / 180) * speed * -1;
      if(xdisp < 0)
      {
         clip._xscale = -100;
      }
      else
      {
         clip._xscale = 100;
      }
      clip._x = clip._x + xdisp;
      clip._y = clip._y + ydisp;
      clip.swapDepths(clip._y * 1000 + clip._x);
   }
}
