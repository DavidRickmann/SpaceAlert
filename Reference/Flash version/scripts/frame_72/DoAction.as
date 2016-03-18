trace("TURN " + game.currentTurn);
game.animation[game.animation.length] = ["moveTurnCounter",game.currentTurn];
if(game.currentTurn == 13)
{
   game.animation[game.animation.length] = ["postMessage","MSSION SUCCESFULL !!?"];
}
else
{
   game.animation[game.animation.length] = ["postMessage","TURN　" + (game.currentTurn + 1)];
}
game.ship[0].GravChute = "ready";
game.ship[1].GravChute = "ready";
game.ship[2].GravChute = "ready";
game.ship[0].reactorStauts = "ready";
game.ship[1].reactorStauts = "ready";
game.ship[2].reactorStauts = "ready";
game.ship[0].HLaserStatus = "ready";
game.ship[1].HLaserStatus = "ready";
game.ship[2].HLaserStatus = "ready";
game.ship[0].LLaserStatus = "ready";
game.ship[2].LLaserStatus = "ready";
game.ship[1].PulseStatus = "ready";
game.ship[0].FighterStatus = "ready";
if(game.ship[2].RocketsStatus == "fired")
{
   game.ship[2].RocketsDeployed = true;
}
game.ship[1].computer = "ready";
game.ship[2].RocketsStatus = "ready";
if(game.currentTurn == 2 && game.computerPhase1 == false)
{
   trace("========================================== COMPUTER DELAY");
   game.animation[game.animation.length] = ["playSound","boobooSND"];
   game.animation[game.animation.length] = ["postMessage","Computer down"];
   a = 0;
   while(a < game.crewOrder.length)
   {
      if(game.crew[game.crewOrder[a]].zone != "space" && game.crew[a].crewStatus != "knocked out")
      {
         delayActions(game.crewOrder[a],game.currentTurn);
      }
      a++;
   }
}
if(game.currentTurn == 5 && game.computerPhase2 == false)
{
   trace("========================================== COMPUTER DELAY");
   game.animation[game.animation.length] = ["playSound","boobooSND"];
   game.animation[game.animation.length] = ["postMessage","Computer down"];
   a = 0;
   while(a < game.crewOrder.length)
   {
      if(game.crew[game.crewOrder[a]].zone != "space" && game.crew[a].crewStatus != "knocked out")
      {
         delayActions(game.crewOrder[a],game.currentTurn);
      }
      a++;
   }
}
if(game.currentTurn == 9 && game.computerPhase3 == false)
{
   trace("========================================== COMPUTER DELAY");
   game.animation[game.animation.length] = ["playSound","boobooSND"];
   game.animation[game.animation.length] = ["postMessage","Computer down"];
   a = 0;
   while(a < game.crewOrder.length)
   {
      if(game.crew[game.crewOrder[a]].zone != "space" && game.crew[a].crewStatus != "knocked out")
      {
         delayActions(game.crewOrder[a],game.currentTurn);
      }
      a++;
   }
}
if(game.currentTurn == 3)
{
   game.currentPhase = 2;
   game.animation[game.animation.length] = ["screenSaver"];
}
if(game.currentTurn == 7)
{
   game.currentPhase = 3;
   game.animation[game.animation.length] = ["screenSaver"];
}
addThreatProcess();
a = 0;
while(a < game.threats.length)
{
   if(game.threats[a].range < game.threats[a].targetableRange)
   {
      game.threats[a].targetable = true;
   }
   a++;
}
a = 0;
while(a < game.crewOrder.length)
{
   if(game.currentTurn < 12 && game.crew[game.crewOrder[a]].crewStatus != "knocked out")
   {
      game.animation[game.animation.length] = ["showCrewAction",game.crew[game.crewOrder[a]].color,game.crew[game.crewOrder[a]].actions[game.currentTurn],game.crew[game.crewOrder[a]].crewName];
   }
   game.crew[game.crewOrder[a]].observe = false;
   if(game.crew[game.crewOrder[a]].crewStatus == "knocked out")
   {
      trace("crew " + a + " is knocked out NO ACTION");
      if(game.currentTurn < 12)
      {
         game.animation[game.animation.length] = ["showCrewAction",game.crew[game.crewOrder[a]].color,"KO",game.crew[game.crewOrder[a]].crewName];
      }
      if(game.crew[game.crewOrder[a]].zone == "space")
      {
         trace("============================================    LANDING");
         game.animation[game.animation.length] = ["landFighters",game.ship[0].FighterTargets,game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,true];
         game.crew[game.crewOrder[a]].zone = 0;
         game.crew[game.crewOrder[a]].deck = 0;
      }
   }
   if(game.crew[game.crewOrder[a]].crewStatus == "active")
   {
      trace("Crew " + a + " zone " + game.crew[game.crewOrder[a]].zone);
      game.currentCrew = game.crewOrder[a];
      if(game.crew[game.crewOrder[a]].zone == "space" && (game.crew[game.crewOrder[a]].actions[game.currentTurn] != "Batt" && game.crew[game.crewOrder[a]].actions[game.currentTurn] != "BattH"))
      {
         trace("============================================    LANDING");
         game.animation[game.animation.length] = ["landFighters",game.ship[0].FighterTargets,game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots];
         delayActions(game.crewOrder[a],game.currentTurn,"Landing\n\n");
         game.crew[game.crewOrder[a]].zone = 0;
         game.crew[game.crewOrder[a]].deck = 0;
      }
      pressA();
      pressB();
      pressC();
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "Batt" || game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BattH")
      {
         if(game.crew[game.crewOrder[a]].zone != "space")
         {
            if(game.crew[game.crewOrder[a]].battleBots != null && game.battleBots[game.crew[game.crewOrder[a]].battleBots].status == "ready")
            {
               hero = false;
               if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BattH")
               {
                  hero = true;
                  game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                  game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
               }
               moveData = moveCheck(game.crewOrder[a],"wait");
               tempPastLocation = moveData[0];
               tempCrewArray = moveData[1];
               tempNewLocation = moveData[2];
               game.animation[game.animation.length] = ["wait",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
               internalTargetScan(game.crew[game.crewOrder[a]].zone,game.crew[game.crewOrder[a]].deck,hero,game.crewOrder[a]);
            }
            else
            {
               if(game.crew[game.crewOrder[a]].battleBots == null)
               {
                  trace("NO BATTLEBOTS");
               }
               if(game.battleBots[game.crew[game.crewOrder[a]].battleBots].status == "damaged")
               {
                  game.animation[game.animation.length] = ["playSound","boobooSND"];
                  trace("BATTLE BOTS DAMAGED");
               }
            }
         }
         if(game.crew[game.crewOrder[a]].zone == "space")
         {
            trace("======================================   FIGHTERS IN SPACE");
            game.ship[0].FighterStatus = "fired";
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BattH")
            {
               game.ship[0].FighterStatus = "firedH";
            }
         }
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "L")
      {
         game.crew[game.crewOrder[a]].zone = game.crew[game.crewOrder[a]].zone - 1;
         if(game.crew[game.crewOrder[a]].zone < 0)
         {
            game.crew[game.crewOrder[a]].zone = 0;
         }
         moveData = moveCheck(game.crewOrder[a],"wait");
         tempPastLocation = moveData[0];
         tempCrewArray = moveData[1];
         tempNewLocation = moveData[2];
         game.animation[game.animation.length] = ["moveZone",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
         if(game.ship[game.crew[game.crewOrder[a]].zone].deck[game.crew[game.crewOrder[a]].deck].delay > 0)
         {
            delayActions(a,game.currentTurn + 1);
         }
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "R")
      {
         game.crew[game.crewOrder[a]].zone = game.crew[game.crewOrder[a]].zone + 1;
         if(game.crew[game.crewOrder[a]].zone > 2)
         {
            game.crew[game.crewOrder[a]].zone = 2;
         }
         moveData = moveCheck(game.crewOrder[a],"wait");
         tempPastLocation = moveData[0];
         tempCrewArray = moveData[1];
         tempNewLocation = moveData[2];
         game.animation[game.animation.length] = ["moveZone",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
         if(game.ship[game.crew[game.crewOrder[a]].zone].deck[game.crew[game.crewOrder[a]].deck].delay > 0)
         {
            delayActions(a,game.currentTurn + 1);
         }
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "D")
      {
         if(game.ship[game.crew[game.crewOrder[a]].zone].GravChute != "ready")
         {
            game.animation[game.animation.length] = ["playSound","boobooSND"];
            game.animation[game.animation.length] = ["postMessage","Grav lift is busy"];
            delayActions(a,game.currentTurn + 1);
         }
         if(game.crew[game.crewOrder[a]].deck == 0)
         {
            game.crew[game.crewOrder[a]].deck = 1;
         }
         else
         {
            game.crew[game.crewOrder[a]].deck = 0;
         }
         moveData = moveCheck(game.crewOrder[a],"wait");
         tempPastLocation = moveData[0];
         tempCrewArray = moveData[1];
         tempNewLocation = moveData[2];
         game.animation[game.animation.length] = ["moveDeck",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
         if(game.ship[game.crew[game.crewOrder[a]].zone].GravChuteDamage == true)
         {
            game.animation[game.animation.length] = ["playSound","boobooSND"];
            game.animation[game.animation.length] = ["postMessage","Grav lift is damaged"];
            delayActions(a,game.currentTurn + 1);
         }
         game.ship[game.crew[game.crewOrder[a]].zone].GravChute = "occupied";
         if(game.ship[game.crew[game.crewOrder[a]].zone].deck[game.crew[game.crewOrder[a]].deck].delay > 0)
         {
            delayActions(a,game.currentTurn + 1);
         }
      }
      heroicMoveVar = false;
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "00")
      {
         tempZone = game.crew[game.crewOrder[a]].zone;
         tempDeck = game.crew[game.crewOrder[a]].deck;
         heroicMoveVar = true;
         goalZone = 0;
         goalDeck = 0;
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "01")
      {
         tempZone = game.crew[game.crewOrder[a]].zone;
         tempDeck = game.crew[game.crewOrder[a]].deck;
         heroicMoveVar = true;
         goalZone = 0;
         goalDeck = 1;
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "10")
      {
         tempZone = game.crew[game.crewOrder[a]].zone;
         tempDeck = game.crew[game.crewOrder[a]].deck;
         heroicMoveVar = true;
         goalZone = 1;
         goalDeck = 0;
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "11")
      {
         tempZone = game.crew[game.crewOrder[a]].zone;
         tempDeck = game.crew[game.crewOrder[a]].deck;
         heroicMoveVar = true;
         goalZone = 1;
         goalDeck = 1;
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "20")
      {
         tempZone = game.crew[game.crewOrder[a]].zone;
         tempDeck = game.crew[game.crewOrder[a]].deck;
         heroicMoveVar = true;
         goalZone = 2;
         goalDeck = 0;
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "21")
      {
         tempZone = game.crew[game.crewOrder[a]].zone;
         tempDeck = game.crew[game.crewOrder[a]].deck;
         heroicMoveVar = true;
         goalZone = 2;
         goalDeck = 1;
      }
      if(heroicMoveVar == true)
      {
         heroicMoveVar = false;
         trace("IN THE HEROIC MOVE");
         heroicMove(game.crewOrder[a],tempZone,tempDeck,goalZone,goalDeck);
         if(game.ship[game.crew[game.crewOrder[a]].zone].deck[game.crew[game.crewOrder[a]].deck].delay > 0)
         {
            delayActions(game.crewOrder[a],game.currentTurn + 1);
         }
      }
      if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "-")
      {
         moveData = moveCheck(game.crewOrder[a],"wait");
         tempPastLocation = moveData[0];
         tempCrewArray = moveData[1];
         tempNewLocation = moveData[2];
         game.animation[game.animation.length] = ["wait",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
      }
      if(game.ship[game.crew[game.crewOrder[a]].zone].deck[game.crew[game.crewOrder[a]].deck].knockout > 0)
      {
         executeAction(null,"knockout","crew");
      }
   }
   game.animation[game.animation.length] = ["heroOff",game.crewOrder[a]];
   game.animation[game.animation.length] = ["hideCrewAction",game.crew[game.crewOrder[a]].color,game.crew[game.crewOrder[a]].actions[game.currentTurn],game.crew[game.crewOrder[a]].crewName];
   a++;
}
observePoints = 0;
a = 0;
while(a < game.crewOrder.length)
{
   if(game.crew[game.crewOrder[a]].observe == true)
   {
      observePoints++;
   }
   a++;
}
if(observePoints > game["observationPhase" + game.currentPhase])
{
   game["observationPhase" + game.currentPhase] = observePoints;
}
if(game.currentTurn == 12)
{
   game.animation[game.animation.length] = ["warpOut"];
}
a = 0;
while(a < game.threats.length)
{
   game.threats[a].shieldsCurrent = game.threats[a].shields + game.shieldBuff;
   if(game.threats[a].threatName == "NEMESIS")
   {
      trace("threat is NEMESIS *******************************************");
      game.threats[a].tookDamage = game.threats[a].HP;
   }
   if(game.threats[a].damageLimit[0] != null)
   {
      game.threats[a].damageLimit[1] = 0;
   }
   game.threats[a].targetedWeapons = [];
   if(game.threats[a].internal == true)
   {
      trace(game.threats[a].threatName + " HP: " + game.threats[a].HP + " ZONE: " + game.threats[a].zone + " DECK: " + game.threats[a].deck);
   }
   else
   {
      trace(game.threats[a].threatName + " HP: " + game.threats[a].HP + " SHIELDS: " + game.threats[a].shieldsCurrent);
   }
   a++;
}
if(game.ship[1].PulseStatus == "fired" || game.ship[1].PulseStatus == "firedH")
{
   pulseTarget();
}
if(game.ship[0].HLaserStatus == "fired" || game.ship[0].HLaserStatus == "firedH")
{
   laserTarget(0,"HLaser");
}
if(game.ship[1].HLaserStatus == "fired" || game.ship[1].HLaserStatus == "firedH")
{
   laserTarget(1,"HLaser");
}
if(game.ship[2].HLaserStatus == "fired" || game.ship[2].HLaserStatus == "firedH")
{
   laserTarget(2,"HLaser");
}
if(game.ship[0].LLaserStatus == "fired" || game.ship[0].LLaserStatus == "firedH")
{
   laserTarget(0,"LLaser");
}
if(game.ship[2].LLaserStatus == "fired" || game.ship[2].LLaserStatus == "firedH")
{
   laserTarget(2,"LLaser");
}
if(game.ship[2].RocketsDeployed == true)
{
   rocketTarget();
}
if(game.ship[0].FighterStatus == "fired" || game.ship[0].FighterStatus == "firedH")
{
   fighterTarget();
}
if(game.ship[1].PulseStatus == "fired" || game.ship[1].PulseStatus == "firedH")
{
   dam = game.ship[1].PulseCanon;
   if(game.ship[1].PulseStatus == "firedH")
   {
      dam++;
   }
   game.animation[game.animation.length] = ["shipBeamPulse",game.ship[1].PulseTargets,game.ship[1].PulseCannonRange];
   a = 0;
   while(a < game.ship[1].PulseTargets.length)
   {
      if(game.threats[game.ship[1].PulseTargets[a]].pulseVulnerable == true)
      {
         game.threats[game.ship[1].PulseTargets[a]].shieldsCurrent = 0;
      }
      doDamageToThreat(game.ship[1].PulseTargets[a],dam);
      a++;
   }
}
if(game.ship[0].HLaserStatus == "fired" || game.ship[0].HLaserStatus == "firedH")
{
   dam = game.ship[0].HLaserCanon;
   if(game.ship[0].HLaserStatus == "firedH")
   {
      dam++;
   }
   if(game.ship[0].HLaserTargets == "miss")
   {
      game.animation[game.animation.length] = ["shipHeavyBeam",0,"miss"];
   }
   else
   {
      game.animation[game.animation.length] = ["shipHeavyBeam",0,game.ship[0].HLaserTargets];
      doDamageToThreat(game.ship[0].HLaserTargets,dam);
   }
}
if(game.ship[1].HLaserStatus == "fired" || game.ship[1].HLaserStatus == "firedH")
{
   dam = game.ship[1].HLaserCanon;
   if(game.ship[1].HLaserStatus == "firedH")
   {
      dam++;
   }
   if(game.ship[1].HLaserTargets == "miss")
   {
      game.animation[game.animation.length] = ["shipHeavyBeam",1,"miss"];
   }
   else
   {
      game.animation[game.animation.length] = ["shipHeavyBeam",1,game.ship[1].HLaserTargets];
      doDamageToThreat(game.ship[1].HLaserTargets,dam);
   }
}
if(game.ship[2].HLaserStatus == "fired" || game.ship[2].HLaserStatus == "firedH")
{
   dam = game.ship[2].HLaserCanon;
   if(game.ship[2].HLaserStatus == "firedH")
   {
      dam++;
   }
   if(game.ship[2].HLaserTargets == "miss")
   {
      game.animation[game.animation.length] = ["shipHeavyBeam",2,"miss"];
   }
   else
   {
      game.animation[game.animation.length] = ["shipHeavyBeam",2,game.ship[2].HLaserTargets];
      doDamageToThreat(game.ship[2].HLaserTargets,dam);
   }
}
if(game.ship[0].LLaserStatus == "fired" || game.ship[0].LLaserStatus == "firedH")
{
   dam = game.ship[0].LLaserCanon;
   if(game.ship[0].LLaserStatus == "firedH")
   {
      dam++;
   }
   if(game.ship[0].LLaserTargets == "miss")
   {
      game.animation[game.animation.length] = ["shipLightBeam",0,"miss"];
   }
   else
   {
      game.animation[game.animation.length] = ["shipLightBeam",0,game.ship[0].LLaserTargets];
      doDamageToThreat(game.ship[0].LLaserTargets,dam);
   }
}
if(game.ship[2].LLaserStatus == "fired" || game.ship[2].LLaserStatus == "firedH")
{
   dam = game.ship[2].LLaserCanon;
   if(game.ship[2].LLaserStatus == "firedH")
   {
      dam++;
   }
   if(game.ship[2].LLaserTargets == "miss")
   {
      game.animation[game.animation.length] = ["shipLightBeam",2,"miss"];
   }
   else
   {
      game.animation[game.animation.length] = ["shipLightBeam",2,game.ship[2].LLaserTargets];
      doDamageToThreat(game.ship[2].LLaserTargets,dam);
   }
}
if(game.ship[2].RocketsDeployed == true)
{
   if(game.ship[2].RocketsTargets == "miss")
   {
      game.animation[game.animation.length] = ["rocketStrike","miss"];
   }
   else
   {
      if(game.threats[game.ship[2].RocketsDeployed].rocketInvulnerable == null)
      {
         game.animation[game.animation.length] = ["rocketStrike",game.ship[2].RocketsTargets];
         doDamageToThreat(game.ship[2].RocketsTargets,3);
      }
      if(game.threats[game.ship[2].RocketsTargets].threatName == "JUGGERNAUT")
      {
         game.threats[game.ship[2].RocketsTargets].shields = game.threats[game.ship[2].RocketsTargets].shields + 1;
         game.animation[game.animation.length] = ["iconShield",game.ship[2].RocketsTargets,game.threats[game.ship[2].RocketsTargets].shieldsCurrent + 1];
      }
   }
   game.ship[2].RocketsDeployed = false;
}
if(game.ship[0].FighterStatus == "fired" || game.ship[0].FighterStatus == "firedH")
{
   if(game.ship[0].deck[0].C == "normal")
   {
      hero = false;
      if(game.ship[0].FighterStatus == "firedH")
      {
         hero = true;
         game.animation[game.animation.length] = ["playSound2","epicMoveSND"];
      }
      if(game.ship[0].FighterTargets.length > 0)
      {
         if(game.ship[0].FighterTargets.length == 1)
         {
            dam = 3;
            if(game.threats[game.ship[0].FighterTargets[0]].threatName == "BEHEMOTH")
            {
               dam = 9;
               c = 0;
               while(c < game.crew.length)
               {
                  if(game.crew[c].zone == "space")
                  {
                     game.crew[c].crewStatus = "knocked out";
                  }
                  c++;
               }
            }
            if(hero == true)
            {
               dam++;
            }
            c = 0;
            while(c < game.crew.length)
            {
               if(game.crew[c].zone == "space")
               {
                  tempCrew = c;
               }
               c++;
            }
            game.animation[game.animation.length] = ["launchFighters",game.ship[0].FighterTargets,tempCrew,game.crew[tempCrew].battleBots];
            doDamageToThreat(game.ship[0].FighterTargets[0],dam);
         }
         else
         {
            dam = 1;
            if(hero == true)
            {
               dam++;
            }
            c = 0;
            while(c < game.crew.length)
            {
               if(game.crew[c].zone == "space")
               {
                  tempCrew = c;
               }
               c++;
            }
            game.animation[game.animation.length] = ["launchFighters",game.ship[0].FighterTargets,tempCrew,game.crew[tempCrew].battleBots];
            if(game.ship[0].FighterTargets.length != 0)
            {
               a = 0;
               while(a < game.ship[0].FighterTargets.length)
               {
                  doDamageToThreat(game.ship[0].FighterTargets[a],dam);
                  a++;
               }
            }
         }
      }
   }
   else
   {
      trace("FIX FISSURE");
      b = 0;
      a = 0;
      while(a < game.threats.length)
      {
         if(game.threats[a].threatName == "FISSURE")
         {
            b = a;
         }
         a++;
      }
      damage = 1;
      if(game.ship[0].FighterStatus == "firedH")
      {
         damage = 2;
      }
      trace("FIX FISSURE " + b + " DAMAGE: " + damage);
      game.threats[b].HP = game.threats[b].HP - damage;
      HPDisplay = game.threats[b].HP;
      if(HPDisplay < 1)
      {
         HPDisplay = 0;
      }
      c = 0;
      while(c < game.crew.length)
      {
         if(game.crew[c].zone == "space")
         {
            tempCrew = c;
         }
         c++;
      }
      game.animation[game.animation.length] = ["launchFighters",game.ship[0].FighterTargets,tempCrew,game.crew[tempCrew].battleBots,"fissure"];
      game.animation[game.animation.length] = ["iconDamage",b,HPDisplay];
      if(game.threats[b].HP < 1)
      {
         game.animation[game.animation.length] = ["threatDestroyed",b];
         trace("REPAIR " + (game.threatTracks[3].length - 1) + " " + range);
         d = game.threatTracks[3].length - 1;
         while(d >= game.threats[b].range)
         {
            if(game.threatTracks[3][d] == 1)
            {
               game.ship[0].doubleDamage = game.ship[0].doubleDamage - 1;
            }
            if(game.threatTracks[3][d] == 2)
            {
               game.ship[0].doubleDamage = game.ship[0].doubleDamage - 1;
               game.ship[1].doubleDamage = game.ship[1].doubleDamage - 1;
               game.ship[2].doubleDamage = game.ship[2].doubleDamage - 1;
            }
            d--;
         }
         trace("game.ship[0].doubleDamage " + game.ship[0].doubleDamage);
         trace("game.ship[1].doubleDamage " + game.ship[1].doubleDamage);
         trace("game.ship[2].doubleDamage " + game.ship[2].doubleDamage);
         trace("FISSURE DESTROYED!");
         game.threats[b].HP = 0;
         game.threats[b].range = null;
         game.threats[b].status = "destroyed";
         game.ship[0].deck[0].C = "normal";
         game.animation[game.animation.length] = ["revealFissure",false];
         game.animation[game.animation.length] = ["showMalfunction",0,0,"C","hide"];
      }
   }
}
a = 0;
while(a < game.threats.length)
{
   if(game.threats[a].threatName == "NEMESIS")
   {
      if(game.threats[a].tookDamage > game.threats[a].HP)
      {
         trace("NEMESIS TOOK DAMAGE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
         trace("NEMESIS COUNTER ATTACK");
         game.animation[game.animation.length] = ["shootBeamWide",a];
         executeAction(a,"attackAllZone",1,true);
      }
   }
   a++;
}
a = 0;
while(a < game.threats.length)
{
   if(game.threats[a].cryoshield == "hit")
   {
      game.threats[a].cryoshield = false;
      game.animation[game.animation.length] = ["cryoshieldDown",a];
   }
   a++;
}
tempShieldArray = [];
tempShieldArray2 = [];
a = 0;
while(a < game.threats.length)
{
   if(game.threats[a].range != null && game.currentTurn < 12 && game.threats[a].threatName != "proxy" && game.destroyed != true)
   {
      game.animation[game.animation.length] = ["threatFrame",a,"show"];
      tempSpeed = game.threats[a].speed;
      while(tempSpeed > 0 && game.threats[a].range > -1 && game.destroyed != true)
      {
         tempSpeed = tempSpeed - 1;
         game.threats[a].range = game.threats[a].range - 1;
         threatTrack = 0;
         if(game.threats[a].internal == true)
         {
            threatTrack = 3;
         }
         else
         {
            threatTrack = game.threats[a].zone;
         }
         if(game.threats[a].threatName != "proxy")
         {
            trace("BEFORE TRACK MOVEMENT " + game.threats[a].range);
            game.animation[game.animation.length] = ["moveThreatTraker",a,threatTrack,game.threats[a].range];
         }
         checkThreatActions(a,threatTrack);
         trace("Threat: " + a + " range: " + game.threats[a].range);
         if(game.threats[a].proxies[0] != null)
         {
            b = 0;
            while(b < game.threats[a].proxies.length)
            {
               prox = game.threats[a].proxies[b];
               if(game.threats[prox].born != true && game.threats[prox].status != "destroyed" && game.destroyed != true)
               {
                  pthreatTrack = 0;
                  if(game.threats[prox].internal == true)
                  {
                     pthreatTrack = 3;
                  }
                  else
                  {
                     pthreatTrack = game.threats[prox].zone;
                  }
                  game.threats[prox].range = game.threats[a].range;
                  checkThreatActions(prox,pthreatTrack);
                  trace("PROXY Threat: " + prox + " range: " + game.threats[prox].range);
               }
               else
               {
                  game.threats[prox].born = null;
               }
               b++;
            }
         }
      }
      if(game.threats[a].range < 1)
      {
         game.threats[a].range = null;
         if(game.threats[a].proxies[0] != null)
         {
            b = 0;
            while(b < game.threats[a].proxies.length)
            {
               game.threats[game.threats[a].proxies[b]].range = null;
               b++;
            }
         }
      }
      game.animation[game.animation.length] = ["threatFrame",a,"hide"];
   }
   a++;
}
a = 0;
while(a < game.threats.length)
{
   if(game.threats[a].internal != true && game.threats[a].range != null)
   {
      tempShieldArray[tempShieldArray.length] = a;
      tempShieldArray2[tempShieldArray2.length] = game.threats[a].shields + game.shieldBuff;
   }
   a++;
}
game.animation[game.animation.length] = ["beginTurnRefreshShelds",tempShieldArray,tempShieldArray2];
if(game.destroyed == true)
{
   trace("************  SHIP DESTROYED ***********************");
   game.animation[game.animation.length] = ["postMessage","TRANSMISSION ENDED",30];
   gotoAndStop("animate");
   play();
}
trace("===========================");
trace("zone0 - damage: " + game.ship[0].damage + " energy: " + game.ship[0].energy + " shield: " + game.ship[0].shields + " DD: " + game.ship[0].doubleDamage);
trace("zone1 - damage: " + game.ship[1].damage + " energy: " + game.ship[1].energy + " shield: " + game.ship[1].shields + " DD: " + game.ship[1].doubleDamage);
trace("zone2 - damage: " + game.ship[2].damage + " energy: " + game.ship[2].energy + " shield: " + game.ship[2].shields + " DD: " + game.ship[2].doubleDamage);
trace("fuel: " + game.ship[1].fuelCells);
game.currentTurn = game.currentTurn + 1;
trace(game.currentTurn);
