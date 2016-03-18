function addThreatProcess()
{
   a = 0;
   while(a < game.threats.length)
   {
      if(game.threats[a].T == game.currentTurn)
      {
         if(game.threats[a].threatName != "proxy")
         {
            game.animation[game.animation.length] = ["addThreat",a,game.shieldBuff,game.threats[a].shieldsMAX,game.threats[a].speedMAX,game.threats[a].HPMAX];
         }
         game.threats[a].range = game.threatTracks[game.threats[a].zone].length - 1;
         if(game.threats[a].internal == true)
         {
            game.threats[a].range = game.threatTracks[3].length - 1;
         }
         if(game.threats[a].malfunction == true)
         {
            game.ship[game.threats[a].zone].deck[game.threats[a].deck][game.threats[a].solveAction] = "fix";
            if(game.threats[a].solveAction != "Batt" && game.threats[a].solveAction != null)
            {
               game.animation[game.animation.length] = ["showMalfunction",game.threats[a].zone,game.threats[a].deck,game.threats[a].solveAction,"show"];
            }
         }
         if(game.threats[a].threatName == "FISSURE")
         {
            game.animation[game.animation.length] = ["revealFissure",true];
         }
         if(game.threats[a].threatName == "ALIEN")
         {
            game.animation[game.animation.length] = ["revealIntruder",a,1,1,"alien0",true];
         }
         if(game.threats[a].threatName == "SEEKER")
         {
            game.animation[game.animation.length] = ["revealIntruder",a,1,0,"seeker",true];
         }
         if(game.threats[a].threatName == "EXECUTIONER")
         {
            game.animation[game.animation.length] = ["revealIntruder",a,2,0,"executioner",true];
         }
         if(game.threats[a].threatName == "SKIRMISHERS")
         {
            game.animation[game.animation.length] = ["revealIntruder",a,game.threats[a].zone,game.threats[a].deck,"skirmishers",true];
         }
         if(game.threats[a].threatName == "SABOTEUR")
         {
            game.animation[game.animation.length] = ["revealIntruder",a,game.threats[a].zone,game.threats[a].deck,"saboteur",true];
         }
         if(game.threats[a].threatName == "TROOPERS")
         {
            game.animation[game.animation.length] = ["revealIntruder",a,game.threats[a].zone,game.threats[a].deck,"troopers",true];
         }
         if(game.threats[a].threatName == "COMMANDOS")
         {
            game.animation[game.animation.length] = ["revealIntruder",a,game.threats[a].zone,game.threats[a].deck,"commandos",true];
         }
         if(game.threats[a].threatName == "NUCLEAR DEVICE")
         {
            game.animation[game.animation.length] = ["revealNuke",true];
         }
         if(game.threats[a].threatName == "UNSTABLE WARHEADS")
         {
            game.threats[a].HP = game.ship[2].Rockets;
         }
         if(game.threats[a].threatName == "POWER SYSTEM OVERLOAD")
         {
            game.threats[a].proxies = [];
            game.ship[0].deck[1].B = "fix";
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].solveAction = "B";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].malfunction = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 0;
            game.threats[newThreat].deck = 1;
            game.threats[newThreat].proxy = a;
            game.threats[newThreat].speed = 3;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.animation[game.animation.length] = ["showMalfunction",0,1,"B","show"];
            game.ship[2].deck[1].B = "fix";
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].solveAction = "B";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].malfunction = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 2;
            game.threats[newThreat].deck = 1;
            game.threats[newThreat].proxy = a;
            game.threats[newThreat].speed = 3;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.animation[game.animation.length] = ["showMalfunction",2,1,"B","show"];
         }
         if(game.threats[a].threatName == "BATTLEBOT UPRISING")
         {
            game.threats[a].proxies = [];
            game.ship[2].deck[0].B = "fix";
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].solveAction = "C";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].malfunction = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 2;
            game.threats[newThreat].deck = 0;
            game.threats[newThreat].proxy = a;
            game.threats[newThreat].speed = 2;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.animation[game.animation.length] = ["showMalfunction",2,0,"C","show"];
         }
         if(game.threats[a].threatName == "CONTAMINATION")
         {
            game.threats[a].proxies = [];
            game.animation[game.animation.length] = ["showContam",game.threats.length];
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].movieClip = "intruder" + newThreat;
            game.threats[newThreat].solveAction = "Batt";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 0;
            game.threats[newThreat].deck = 0;
            game.threats[newThreat].proxy = a;
            game.threats[newThreat].speed = 2;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.threats[newThreat].action1 = [["delay","deck"]];
            game.threats[newThreat].action2 = [["attack",1,false]];
            game.threats[newThreat].action3 = [["knockout","location",0,0],["knockoutSector",0,0]];
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].movieClip = "intruder" + newThreat;
            game.threats[newThreat].solveAction = "Batt";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 0;
            game.threats[newThreat].deck = 1;
            game.threats[newThreat].proxy = a;
            game.threats[newThreat].speed = 2;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.threats[newThreat].action1 = [["delay","deck"]];
            game.threats[newThreat].action2 = [["attack",1,false]];
            game.threats[newThreat].action3 = [["knockout","location",0,1],["knockoutSector",0,1]];
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].movieClip = "intruder" + newThreat;
            game.threats[newThreat].solveAction = "Batt";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 2;
            game.threats[newThreat].deck = 0;
            game.threats[newThreat].proxy = a;
            game.threats[newThreat].speed = 2;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.threats[newThreat].action1 = [["delay","deck"]];
            game.threats[newThreat].action2 = [["attack",1,false]];
            game.threats[newThreat].action3 = [["knockout","location",2,0],["knockoutSector",2,0]];
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].movieClip = "intruder" + newThreat;
            game.threats[newThreat].solveAction = "Batt";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 2;
            game.threats[newThreat].deck = 1;
            game.threats[newThreat].proxy = a;
            game.threats[newThreat].speed = 2;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.threats[newThreat].action1 = [["delay","deck"]];
            game.threats[newThreat].action2 = [["attack",1,false]];
            game.threats[newThreat].action3 = [["knockout","location",2,1],["knockoutSector",2,1]];
         }
         if(game.threats[a].TAG == "I2-01")
         {
            game.threats[a].proxies = [];
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].solveAction = "Batt";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 2;
            game.threats[newThreat].deck = 1;
            game.threats[newThreat].parent = a;
            game.threats[newThreat].speed = 2;
            game.threats[newThreat].HPMAX = 2;
            game.threats[newThreat].HP = 2;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.threats[newThreat].action1 = [["destroyRocket",1]];
            game.threats[newThreat].action2 = [["slime1"]];
            game.threats[newThreat].action3 = [["attack",2,false]];
            game.threats[newThreat].actionAnim1 = [["intruderAttack",1]];
            game.threats[newThreat].actionAnim2 = [["intruderAttack",1]];
            game.threats[newThreat].actionAnim3 = [["intruderAttack",1]];
            game.threats[newThreat].actionDeath = [["removeSectorDelay",2,1]];
            game.ship[2].deck[1].delay = game.ship[2].deck[1].delay + 1;
            game.animation[game.animation.length] = ["revealIntruder",newThreat,2,1,"slime",true];
         }
         if(game.threats[a].TAG == "I2-02")
         {
            game.threats[a].proxies = [];
            newThreat = game.threats.length;
            game.threats[a].proxies[game.threats[a].proxies.length] = newThreat;
            game.threats[newThreat] = [];
            game.threats[newThreat].solveAction = "Batt";
            game.threats[newThreat].internal = true;
            game.threats[newThreat].threatName = "proxy";
            game.threats[newThreat].VPsurvive = 0;
            game.threats[newThreat].VPkill = 0;
            game.threats[newThreat].zone = 0;
            game.threats[newThreat].deck = 1;
            game.threats[newThreat].speed = 2;
            game.threats[newThreat].parent = a;
            game.threats[newThreat].HPMAX = 2;
            game.threats[newThreat].HP = 2;
            game.threats[newThreat].T = game.threats[a].T;
            game.threats[newThreat].range = game.threats[a].range;
            game.threats[newThreat].action1 = [["damageBattlebot",0]];
            game.threats[newThreat].action2 = [["slime2"]];
            game.threats[newThreat].action3 = [["attack",2,false]];
            game.threats[newThreat].actionAnim1 = [["intruderAttack",1]];
            game.threats[newThreat].actionAnim2 = [["intruderAttack",1]];
            game.threats[newThreat].actionAnim3 = [["intruderAttack",1]];
            game.threats[newThreat].actionDeath = [["removeSectorDelay",0,1]];
            game.ship[0].deck[1].delay = game.ship[0].deck[1].delay + 1;
            game.animation[game.animation.length] = ["revealIntruder",newThreat,0,1,"slime",true];
         }
         trace("NEW Threat: " + a + " range: " + game.threats[a].range);
      }
      if(game.threats[a].threatName == "NUCLEAR DEVICE")
      {
         game.threats[a].crewFixes = 0;
      }
      if(game.threats[a].threatName == "POWER SYSTEM OVERLOAD")
      {
         game.threats[a].zone0 = false;
         game.threats[a].zone1 = false;
         game.threats[a].zone2 = false;
      }
      if(game.threats[a].threatName == "BATTLEBOT UPRISING")
      {
         game.threats[a].zone0 = false;
         game.threats[a].zone2 = false;
      }
      a++;
   }
}
function pressA()
{
   if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "A" || game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
   {
      if(game.crew[game.crewOrder[a]].location[2] != "A")
      {
         moveData = moveCheck(game.crewOrder[a],"A");
         tempPastLocation = moveData[0];
         tempCrewArray = moveData[1];
         tempNewLocation = moveData[2];
         game.animation[game.animation.length] = ["pushButton",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
      }
      if(game.crew[game.crewOrder[a]].zone == 0 && game.crew[game.crewOrder[a]].deck == 0)
      {
         if(game.ship[0].deck[0].A == "normal")
         {
            if(game.ship[0].HLaserStatus == "ready")
            {
               if(game.ship[0].energy > 0)
               {
                  game.ship[0].energy = game.ship[0].energy - 1;
                  game.ship[0].HLaserStatus = "fired";
                  if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
                  {
                     game.ship[0].HLaserStatus = "firedH";
                     game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                     game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
                  }
                  game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
                  game.animation[game.animation.length] = ["addEnergy",0,game.ship[0].energy];
                  game.animation[game.animation.length] = ["chargeWeapon","HL0"];
               }
               else
               {
                  game.animation[game.animation.length] = ["playSound","boobooSND"];
               }
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(0,0,hero,game.crewOrder[a],"A");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 0 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[0].deck[1].A == "normal")
         {
            if(game.ship[0].LLaserStatus == "ready")
            {
               game.ship[0].LLaserStatus = "fired";
               if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
               {
                  game.ship[0].LLaserStatus = "firedH";
                  game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                  game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
               }
               game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
               game.animation[game.animation.length] = ["chargeWeapon","LL0"];
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(0,1,hero,game.crewOrder[a],"A");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 1 && game.crew[game.crewOrder[a]].deck == 0)
      {
         if(game.ship[1].deck[0].A == "normal")
         {
            if(game.ship[1].HLaserStatus == "ready")
            {
               if(game.ship[1].energy > 0)
               {
                  game.ship[1].energy = game.ship[1].energy - 1;
                  game.ship[1].HLaserStatus = "fired";
                  if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
                  {
                     game.ship[1].HLaserStatus = "firedH";
                     game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                     game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
                  }
                  game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
                  game.animation[game.animation.length] = ["addEnergy",1,game.ship[1].energy];
                  game.animation[game.animation.length] = ["chargeWeapon","HL1"];
               }
               else
               {
                  game.animation[game.animation.length] = ["playSound","boobooSND"];
               }
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(1,0,hero,game.crewOrder[a],"A");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 1 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[1].deck[1].A == "normal")
         {
            if(game.ship[1].PulseStatus == "ready")
            {
               if(game.ship[1].energy > 0)
               {
                  game.ship[1].energy = game.ship[1].energy - 1;
                  game.ship[1].PulseStatus = "fired";
                  if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
                  {
                     game.ship[1].PulseStatus = "firedH";
                     game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                     game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
                  }
                  game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
                  game.animation[game.animation.length] = ["addEnergy",1,game.ship[1].energy];
                  game.animation[game.animation.length] = ["chargeWeapon","PB"];
               }
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(1,1,hero,game.crewOrder[a],"A");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 2 && game.crew[game.crewOrder[a]].deck == 0)
      {
         if(game.ship[2].deck[0].A == "normal")
         {
            if(game.ship[2].HLaserStatus == "ready")
            {
               if(game.ship[2].energy > 0)
               {
                  game.ship[2].energy = game.ship[2].energy - 1;
                  game.ship[2].HLaserStatus = "fired";
                  if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
                  {
                     game.ship[2].HLaserStatus = "firedH";
                     game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                     game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
                  }
                  game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
                  game.animation[game.animation.length] = ["addEnergy",2,game.ship[2].energy];
                  game.animation[game.animation.length] = ["chargeWeapon","HL2"];
               }
               else
               {
                  game.animation[game.animation.length] = ["playSound","boobooSND"];
               }
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(2,0,hero,game.crewOrder[a],"A");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 2 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[2].deck[1].A == "normal")
         {
            if(game.ship[2].LLaserStatus == "ready")
            {
               game.ship[2].LLaserStatus = "fired";
               if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
               {
                  game.ship[2].LLaserStatus = "firedH";
                  game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                  game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
               }
               game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
               game.animation[game.animation.length] = ["chargeWeapon","LL2"];
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "AH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(2,1,hero,game.crewOrder[a],"A");
         }
      }
   }
}
function pressB()
{
   if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "B" || game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
   {
      if(game.crew[game.crewOrder[a]].location[2] != "B")
      {
         moveData = moveCheck(game.crewOrder[a],"B");
         tempPastLocation = moveData[0];
         tempCrewArray = moveData[1];
         tempNewLocation = moveData[2];
         game.animation[game.animation.length] = ["pushButton",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
      }
      if(game.crew[game.crewOrder[a]].zone == 0 && game.crew[game.crewOrder[a]].deck == 0)
      {
         if(game.ship[0].deck[0].B == "normal")
         {
            if(game.ship[0].shields < game.ship[0].shieldsMax && game.ship[0].energy > 0)
            {
               if(game.ship[0].shields < game.ship[0].shieldsMax)
               {
                  diff1 = game.ship[0].shieldsMax - game.ship[0].shields;
                  if(diff1 > game.ship[0].energy)
                  {
                     diff1 = game.ship[0].energy;
                  }
                  game.ship[0].energy = game.ship[0].energy - diff1;
                  game.ship[0].shields = game.ship[0].shields + diff1;
                  if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
                  {
                     game.ship[0].shields = game.ship[0].shields + 1;
                     game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                     game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
                  }
                  game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
                  game.animation[game.animation.length] = ["addEnergy",0,game.ship[0].energy];
                  game.animation[game.animation.length] = ["addShield",0,game.ship[0].shields,"up"];
               }
               else
               {
                  game.animation[game.animation.length] = ["playSound","boobooSND"];
               }
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(0,0,hero,game.crewOrder[a],"B");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 0 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[0].deck[1].B == "normal")
         {
            if(game.ship[0].energy < game.ship[0].energyMax && game.ship[1].energy > 0)
            {
               diff1 = game.ship[0].energyMax - game.ship[0].energy;
               if(diff1 > game.ship[1].energy)
               {
                  diff1 = game.ship[1].energy;
               }
               game.ship[1].energy = game.ship[1].energy - diff1;
               game.ship[0].energy = game.ship[0].energy + diff1;
               if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
               {
                  game.ship[0].energy = game.ship[0].energy + 1;
                  game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                  game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
               }
               game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
               game.animation[game.animation.length] = ["addEnergy",1,game.ship[1].energy];
               game.animation[game.animation.length] = ["addEnergy",0,game.ship[0].energy,"up"];
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(0,1,hero,game.crewOrder[a],"B");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 1 && game.crew[game.crewOrder[a]].deck == 0)
      {
         if(game.ship[1].deck[0].B == "normal")
         {
            if(game.ship[1].shields < game.ship[1].shieldsMax && game.ship[1].energy > 0)
            {
               if(game.ship[1].shields < game.ship[1].shieldsMax)
               {
                  diff1 = game.ship[1].shieldsMax - game.ship[1].shields;
                  if(diff1 > game.ship[1].energy)
                  {
                     diff1 = game.ship[1].energy;
                  }
                  game.ship[1].energy = game.ship[1].energy - diff1;
                  game.ship[1].shields = game.ship[1].shields + diff1;
                  if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
                  {
                     game.ship[1].shields = game.ship[1].shields + 1;
                     game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                     game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
                  }
                  game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
                  game.animation[game.animation.length] = ["addEnergy",1,game.ship[1].energy];
                  game.animation[game.animation.length] = ["addShield",1,game.ship[1].shields,"up"];
               }
               else
               {
                  game.animation[game.animation.length] = ["playSound","boobooSND"];
               }
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(1,0,hero,game.crewOrder[a],"B");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 1 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[1].deck[1].B == "normal")
         {
            if(game.ship[1].fuelCells > 0)
            {
               game.ship[1].fuelCells = game.ship[1].fuelCells - 1;
               if(game.ship[1].energy < game.ship[1].energyMax)
               {
                  game.ship[1].energy = game.ship[1].energyMax;
                  if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
                  {
                     game.ship[1].energy = game.ship[1].energy + 1;
                     game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                     game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
                  }
                  game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
                  game.animation[game.animation.length] = ["addFuel",game.ship[1].fuelCells];
                  game.animation[game.animation.length] = ["addEnergy",1,game.ship[1].energy,"up"];
               }
               else
               {
                  game.animation[game.animation.length] = ["playSound","boobooSND"];
               }
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(1,1,hero,game.crewOrder[a],"B");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 2 && game.crew[game.crewOrder[a]].deck == 0)
      {
         if(game.ship[2].deck[0].B == "normal")
         {
            if(game.ship[2].shields < game.ship[2].shieldsMax && game.ship[2].energy > 0)
            {
               if(game.ship[2].shields < game.ship[2].shieldsMax)
               {
                  diff1 = game.ship[2].shieldsMax - game.ship[2].shields;
                  if(diff1 > game.ship[2].energy)
                  {
                     diff1 = game.ship[2].energy;
                  }
                  game.ship[2].energy = game.ship[2].energy - diff1;
                  game.ship[2].shields = game.ship[2].shields + diff1;
                  if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
                  {
                     game.ship[2].shields = game.ship[2].shields + 1;
                     game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                     game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
                  }
                  game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
                  game.animation[game.animation.length] = ["addEnergy",2,game.ship[2].energy];
                  game.animation[game.animation.length] = ["addShield",2,game.ship[2].shields,"up"];
               }
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(2,0,hero,game.crewOrder[a],"B");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 2 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[2].deck[1].B == "normal")
         {
            if(game.ship[2].energy < game.ship[2].energyMax && game.ship[1].energy > 0)
            {
               diff1 = game.ship[2].energyMax - game.ship[2].energy;
               if(diff1 > game.ship[1].energy)
               {
                  diff1 = game.ship[1].energy;
               }
               game.ship[1].energy = game.ship[1].energy - diff1;
               game.ship[2].energy = game.ship[2].energy + diff1;
               if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
               {
                  game.ship[2].energy = game.ship[2].energy + 1;
                  game.animation[game.animation.length] = ["playSound","epicMoveSND"];
                  game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
               }
               game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
               game.animation[game.animation.length] = ["addEnergy",1,game.ship[1].energy];
               game.animation[game.animation.length] = ["addEnergy",2,game.ship[2].energy,"up"];
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "BH")
            {
               hero = true;
               game.animation[game.animation.length] = ["playSound","epicMoveSND"];
               game.animation[game.animation.length] = ["heroOn",game.crewOrder[a]];
            }
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(2,1,hero,game.crewOrder[a],"B");
         }
      }
   }
}
function pressC()
{
   if(game.crew[game.crewOrder[a]].actions[game.currentTurn] == "C")
   {
      if(game.crew[game.crewOrder[a]].location[2] != "C")
      {
         moveData = moveCheck(game.crewOrder[a],"C");
         tempPastLocation = moveData[0];
         tempCrewArray = moveData[1];
         tempNewLocation = moveData[2];
         game.animation[game.animation.length] = ["pushButton",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
      }
      if(game.crew[game.crewOrder[a]].zone == 0 && game.crew[game.crewOrder[a]].deck == 0)
      {
         trace("**********************************************************************");
         trace(game.crew[game.crewOrder[a]].battleBots + " " + game.battleBots[game.crew[game.crewOrder[a]].battleBots].status + " " + game.ship[0].FighterStatus);
         if(game.crew[game.crewOrder[a]].battleBots != null && game.battleBots[game.crew[game.crewOrder[a]].battleBots].status == "ready" && game.ship[0].FighterStatus == "ready")
         {
            trace("====================================   LAUNCH FIGHTERS!!!!");
            game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
            game.animation[game.animation.length] = ["boardCrew",game.crewOrder[a],game.crew[game.crewOrder[a]].battleBots];
            game.ship[0].FighterStatus = "fired";
            game.crew[game.crewOrder[a]].zone = "space";
         }
         else
         {
            game.animation[game.animation.length] = ["playSound","boobooSND"];
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 0 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[0].deck[1].C == "normal")
         {
            trace("I AM HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            if(game.crew[game.crewOrder[a]].battleBots != null && game.battleBots[game.crew[game.crewOrder[a]].battleBots].status == "damaged")
            {
               game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
               game.animation[game.animation.length] = ["fixBattleBots",game.crew[game.crewOrder[a]].battleBots];
               trace("BATTLEBOTS REPAIRED");
               game.battleBots[game.crew[game.crewOrder[a]].battleBots].status = "ready";
            }
            else if(game.ship[0].battleBots != null && game.crew[game.crewOrder[a]].battleBots == null)
            {
               game.crew[game.crewOrder[a]].battleBots = game.ship[0].battleBots;
               game.ship[0].battleBots = null;
               game.battleBots[game.crew[game.crewOrder[a]].battleBots].crew = a;
               flagcheck = null;
               f = 0;
               while(f < game.crewLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2]].length)
               {
                  if(game.crewLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2]][f] == game.crewOrder[a])
                  {
                     flagcheck = f;
                  }
                  f++;
               }
               botDamage = false;
               if(game.battleBots[game.crew[game.crewOrder[a]].battleBots].status == "damaged")
               {
                  botDamage = true;
               }
               game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
               game.animation[game.animation.length] = ["activateBattleBots",game.crew[game.crewOrder[a]].battleBots,game.crewOrder[a],game.crew[game.crewOrder[a]].location[0],game.crew[game.crewOrder[a]].location[1],game.crew[game.crewOrder[a]].location[2],flagcheck,botDamage];
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(0,1,hero,game.crewOrder[a],"C");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 1 && game.crew[game.crewOrder[a]].deck == 0)
      {
         if(game.ship[1].deck[0].C == "normal")
         {
            if(game.ship[1].computer == "ready")
            {
               game.ship[1].computer = "pushed";
               if(game.currentPhase == 1)
               {
                  game.computerPhase1 = true;
               }
               if(game.currentPhase == 2)
               {
                  game.computerPhase2 = true;
               }
               if(game.currentPhase == 3)
               {
                  game.computerPhase3 = true;
               }
               game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
               game.animation[game.animation.length] = ["moveMouse"];
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(1,0,hero,game.crewOrder[a],"C");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 1 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[1].deck[1].C == "normal")
         {
            game.crew[game.crewOrder[a]].observe = true;
            game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
         }
         else
         {
            hero = false;
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(1,1,hero,game.crewOrder[a],"C");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 2 && game.crew[game.crewOrder[a]].deck == 0)
      {
         if(game.ship[2].deck[0].C == "normal")
         {
            if(game.crew[game.crewOrder[a]].battleBots != null && game.battleBots[game.crew[game.crewOrder[a]].battleBots].status == "damaged")
            {
               game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
               game.animation[game.animation.length] = ["fixBattleBots",game.crew[game.crewOrder[a]].battleBots];
               trace("BATTLEBOTS REPAIRED");
               game.battleBots[game.crew[game.crewOrder[a]].battleBots].status = "ready";
            }
            else if(game.ship[2].battleBots != null && game.crew[game.crewOrder[a]].battleBots == null)
            {
               game.crew[game.crewOrder[a]].battleBots = game.ship[2].battleBots;
               game.ship[2].battleBots = null;
               game.battleBots[game.crew[game.crewOrder[a]].battleBots].crew = game.crewOrder[a];
               flagcheck = null;
               f = 0;
               while(f < game.crewLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2]].length)
               {
                  if(game.crewLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2]][f] == game.crewOrder[a])
                  {
                     flagcheck = f;
                  }
                  f++;
               }
               botDamage = false;
               if(game.battleBots[game.crew[game.crewOrder[a]].battleBots].status == "damaged")
               {
                  botDamage = true;
               }
               game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
               game.animation[game.animation.length] = ["activateBattleBots",game.crew[game.crewOrder[a]].battleBots,game.crewOrder[a],game.crew[game.crewOrder[a]].location[0],game.crew[game.crewOrder[a]].location[1],game.crew[game.crewOrder[a]].location[2],flagcheck,botDamage];
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(2,0,hero,game.crewOrder[a],"C");
         }
      }
      if(game.crew[game.crewOrder[a]].zone == 2 && game.crew[game.crewOrder[a]].deck == 1)
      {
         if(game.ship[2].deck[1].C == "normal")
         {
            if(game.ship[2].Rockets > 0 && game.ship[2].RocketsStatus == "ready")
            {
               game.ship[2].RocketsStatus = "fired";
               game.ship[2].Rockets = game.ship[2].Rockets - 1;
               game.animation[game.animation.length] = ["fadeIcon","icon-pushButton",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"pushButtonSND"];
               game.animation[game.animation.length] = ["launchRocket",game.ship[2].Rockets];
            }
            else
            {
               game.animation[game.animation.length] = ["playSound","boobooSND"];
            }
         }
         else
         {
            hero = false;
            game.animation[game.animation.length] = ["fadeIcon","icon-repair",game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][0],game.coordinateLocations[game.crew[game.crewOrder[a]].location[0]][game.crew[game.crewOrder[a]].location[1]][game.crew[game.crewOrder[a]].location[2] + "0"][1],"repairSND"];
            internalMalfunctionScan(2,1,hero,game.crewOrder[a],"C");
         }
      }
   }
}
