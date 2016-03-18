function calculateRandom(min, max)
{
   return Math.floor(Math.random() * (max + 1 - min)) + min;
}
function cleanArray(someArray)
{
   var _loc2_ = [];
   m = 0;
   while(m < someArray.length)
   {
      if(someArray[m] != null)
      {
         _loc2_[_loc2_.length] = someArray[m];
      }
      m++;
   }
   trace("CLEANING " + _loc2_);
   return _loc2_;
}
function deleteFromArray(arrayName, delData)
{
   temp = null;
   inc = -1;
   trace(arrayName.length);
   while(temp != delData || inc > arrayName.length)
   {
      inc++;
      temp = arrayName[inc];
      if(temp == delData)
      {
         arrayName[inc] = null;
      }
   }
   arrayName = cleanArray(arrayName);
   return arrayName;
}
function doDamageInitial(zone, damageNum)
{
   damageType = game.ship[zone].damageChipsLibrary[damageNum];
   game.ship[zone].damage = game.ship[zone].damage - 1;
   if(damageType == "shield")
   {
      game.ship[zone].shieldsMax = game.ship[zone].shieldsMax - 1;
      game.ship[zone].shields = game.ship[zone].shields - 1;
   }
   if(damageType == "energy")
   {
      game.ship[zone].energyMax = game.ship[zone].energyMax - 1;
      game.ship[zone].energy = game.ship[zone].energy - 1;
   }
   if(damageType == "gravChute")
   {
      game.ship[zone].GravChuteDamage = true;
   }
   if(damageType == "HLaser")
   {
      game.ship[zone].HLaserCanon = game.ship[zone].HLaserCanon - 1;
   }
   if(damageType == "pulseCannon")
   {
      game.ship[zone].PulseCannonRange = 5;
   }
   if(damageType == "hull")
   {
      game.ship[zone].hullDamage = true;
      game.ship[zone].doubleDamage = game.ship[zone].doubleDamage + 1;
   }
   if(damageType == "LLaser")
   {
      game.ship[zone].LLaserCanon = game.ship[zone].LLaserCanon - 1;
   }
}
function doDamage(zone)
{
   if(game.destroyed != true)
   {
      game.ship[zone].damage = game.ship[zone].damage - 1;
      trace("DOING THE DAMAGE NOW");
      if(game.ship[zone].damage > 0)
      {
         tempSelect = calculateRandom(0,game.ship[zone].damageChipsRandomizer.length - 1);
         game.ship[zone].damageInflicted[game.ship[zone].damageInflicted.length] = game.ship[zone].damageChipsRandomizer[tempSelect];
         damageType = game.ship[zone].damageChipsLibrary[game.ship[zone].damageChipsRandomizer[tempSelect]];
         game.ship[zone].damageChipsRandomizer[tempSelect] = null;
         game.ship[zone].damageChipsRandomizer = cleanArray(game.ship[zone].damageChipsRandomizer);
         trace(damageType);
         game.animation[game.animation.length] = ["addDamageMarker",zone,damageType];
         if(damageType == "shield")
         {
            game.ship[zone].shieldsMax = game.ship[zone].shieldsMax - 1;
            if(game.ship[zone].shields > game.ship[zone].shieldsMax)
            {
               game.ship[zone].shields = game.ship[zone].shieldsMax;
               game.animation[game.animation.length] = ["addShield",zone,game.ship[zone].shields];
            }
         }
         if(damageType == "energy")
         {
            game.ship[zone].energyMax = game.ship[zone].energyMax - 1;
            if(game.ship[zone].energy > game.ship[zone].energyMax)
            {
               game.ship[zone].energy = game.ship[zone].energyMax;
               game.animation[game.animation.length] = ["addEnergy",zone,game.ship[zone].energy];
            }
         }
         if(damageType == "gravChute")
         {
            game.ship[zone].GravChuteDamage = true;
         }
         if(damageType == "HLaser")
         {
            game.ship[zone].HLaserCanon = game.ship[zone].HLaserCanon - 1;
         }
         if(damageType == "pulseCannon")
         {
            game.ship[zone].PulseCannonRange = 5;
         }
         if(damageType == "hull")
         {
            game.ship[zone].hullDamage = true;
         }
         if(damageType == "LLaser")
         {
            game.ship[zone].LLaserCanon = game.ship[zone].LLaserCanon - 1;
         }
      }
      else
      {
         trace("************  SHIP DESTROYED ***********************");
         game.destroyed = true;
         game.animation[game.animation.length] = ["shipDestoyed"];
      }
   }
}
function laserTarget(zone, weapon, damage)
{
   viableTargets = [];
   fa = 0;
   while(fa < game.threats.length)
   {
      if(game.threats[fa].zone == zone && game.threats[fa].range != null && game.threats[fa].internal != true)
      {
         targetable = true;
         if(game.threats[fa].targetable == false)
         {
            targetable = false;
         }
         if(weapon == "HLaser" && game.threats[fa].HlaserTargetable == false)
         {
            targetable = false;
         }
         if(targetable == true)
         {
            viableTargets[viableTargets.length] = fa;
         }
      }
      fa++;
   }
   target = viableTargets[0];
   if(target != null)
   {
      fa = 1;
      while(fa < viableTargets.length)
      {
         if(game.threats[viableTargets[fa]].range < game.threats[target].range)
         {
            target = viableTargets[fa];
         }
         if(game.threats[viableTargets[fa]].range == game.threats[target].range)
         {
            if(game.threats[viableTargets[fa]].T < game.threats[target].T)
            {
               target = viableTargets[fa];
            }
         }
         fa++;
      }
      trace("**************       LASER TARGET IS : " + game.threats[target].threatName);
      slot = game.threats[target].targetedWeapons.length;
      game.ship[zone][weapon + "Targets"] = target;
   }
   else
   {
      game.ship[zone][weapon + "Targets"] = "miss";
   }
}
function fighterTarget(hero)
{
   viableTargets = [];
   fz = 0;
   while(fz < game.threats.length)
   {
      if(game.threats[fz].range < 5 && game.threats[fz].internal != true)
      {
         targetable = true;
         if(game.threats[fz].targetable == false)
         {
            targetable = false;
         }
         if(game.threats[fz].figherTargetable == false)
         {
            targetable = false;
         }
         if(targetable == true)
         {
            viableTargets[viableTargets.length] = fz;
         }
      }
      fz++;
   }
   game.ship[0].FighterTargets = [];
   if(viableTargets.length > 0)
   {
      fx = 0;
      while(fx < viableTargets.length)
      {
         trace("**************  FIGHTER TARGET IS : " + game.threats[viableTargets[fx]].threatName);
         game.ship[0].FighterTargets[fx] = viableTargets[fx];
         fx++;
      }
   }
   else
   {
      game.ship[0].FighterTargets = "miss";
   }
}
function rocketTarget()
{
   trace("ROCKET TARGETING");
   trace("=========================================");
   viableTargets = [];
   fz = 0;
   while(fz < game.threats.length)
   {
      trace(game.threats[fz].threatName);
      trace("RANGE: " + game.threats[fz].range);
      trace("INTERNAL : " + game.threats[fz].internal);
      if(game.threats[fz].range < 10 && game.threats[fz].internal != true)
      {
         targetable = true;
         if(game.threats[fz].targetable == false)
         {
            targetable = false;
         }
         if(game.threats[fz].rocketTargetable == false)
         {
            targetable = false;
         }
         if(targetable == true)
         {
            viableTargets[viableTargets.length] = fz;
         }
      }
      fz++;
   }
   fz = 0;
   while(fz < game.threats.length)
   {
      if(game.threats[fz].threatName == "JUGGERNAUT")
      {
         viableTargets = [];
         viableTargets[viableTargets.length] = fz;
      }
      fz++;
   }
   trace(" viableTargets " + viableTargets);
   Rtarget = viableTargets[0];
   if(Rtarget != null)
   {
      fz = 1;
      while(fz < viableTargets.length)
      {
         if(game.threats[viableTargets[fz]].range < game.threats[Rtarget].range)
         {
            Rtarget = viableTargets[fz];
            trace("Rtarget1 " + Rtarget);
         }
         if(game.threats[viableTargets[fz]].range == game.threats[Rtarget].range)
         {
            if(game.threats[viableTargets[fz]].T < game.threats[Rtarget].T)
            {
               Rtarget = viableTargets[fz];
               trace("Rtarget2 " + Rtarget);
            }
         }
         fz++;
      }
      trace("************** ROCKET TARGET IS FUCKING  : " + game.threats[Rtarget].threatName);
      game.ship[2].RocketsTargets = Rtarget;
      fz = 0;
      while(fz < game.threats.length)
      {
         if(game.threats[fz].threatName == "PHANTOM FIGHTER" && game.threats[fz].range != null)
         {
            game.ship[2].RocketsTargets = "miss";
         }
         fz++;
      }
   }
   else
   {
      game.ship[2].RocketsTargets = "miss";
   }
}
function pulseTarget()
{
   game.ship[1].PulseTargets = [];
   fa = 0;
   while(fa < game.threats.length)
   {
      if(game.threats[fa].range > 0 && game.threats[fa].range < game.ship[1].PulseCannonRange && game.threats[fa].internal != true)
      {
         targetable = true;
         if(game.threats[fa].targetable == false)
         {
            targetable = false;
         }
         if(game.threats[fa].PulseTargetable == false)
         {
            targetable = false;
         }
         if(targetable == true)
         {
            slot = game.ship[1].PulseTargets.length;
            game.ship[1].PulseTargets[slot] = fa;
         }
         trace("PULSE CANNON TARGETS " + game.ship[1].PulseTargets);
      }
      fa++;
   }
}
function scanForOtherMalfunctions(threat, zone, deck, fix)
{
   sameCheck = false;
   fa = 0;
   while(fa < game.threats.length)
   {
      if(fa != threat && game.threats[fa].zone == zone && game.threats[fa].deck == deck && game.threats[fa].solveAction == fix && (game.threats[fa].range != null || game.threats[fa].status == "survived"))
      {
         sameCheck = true;
      }
      fa++;
   }
   return sameCheck;
}
function internalMalfunctionScan(zone, deck, hero, crew, button)
{
   viableTargets = [];
   fa = 0;
   while(fa < game.threats.length)
   {
      if(game.threats[fa].zone == zone && game.threats[fa].deck == deck && game.threats[fa].solveAction == button && game.threats[fa].range != null && game.threats[fa].internal == true && game.threats[fa].malfunction == true)
      {
         viableTargets[viableTargets.length] = fa;
      }
      fa++;
   }
   target = viableTargets[0];
   if(target != null)
   {
      fa = 1;
      while(fa < viableTargets.length)
      {
         if(game.threats[viableTargets[fa]].T < game.threats[target].T)
         {
            target = fa;
         }
         fa++;
      }
      temp = target;
      if(game.threats[target].proxy != null)
      {
         target = game.threats[target].proxy;
      }
      damage = 1;
      if(hero == true)
      {
         damage = 2;
      }
      if(game.threats[target].threatName == "NUCLEAR DEVICE")
      {
         damage = 0;
         game.threats[target].crewFixes = game.threats[target].crewFixes + 1;
         if(game.threats[target].crewFixes == 3)
         {
            damage = 1;
         }
      }
      if(game.threats[target].threatName == "POWER SYSTEM OVERLOAD")
      {
         game.threats[target]["zone" + game.threats[temp].zone] = true;
         trace(game.threats[target].zone0);
         trace(game.threats[target].zone1);
         trace(game.threats[target].zone2);
         if(game.threats[target].zone0 == true && game.threats[target].zone1 && game.threats[target].zone2)
         {
            damage = damage + 2;
            game.threats[target].zone0 = false;
            game.threats[target].zone1 = false;
            game.threats[target].zone2 = false;
         }
      }
      if(game.threats[target].threatName == "BATTLEBOT UPRISING")
      {
         game.threats[target]["zone" + game.threats[temp].zone] = true;
         trace(game.threats[target].zone0);
         trace(game.threats[target].zone2);
         if(game.threats[target].zone0 == true && game.threats[target].zone2)
         {
            damage = damage + 1;
            game.animation[game.animation.length] = ["iconDamage",target,game.threats[target].HP];
            game.threats[target].zone0 = false;
            game.threats[target].zone2 = false;
         }
      }
      trace("FIX MALFUNCTION " + target + " DAMAGE: " + damage);
      originalHP = game.threats[target].HP;
      game.threats[target].HP = game.threats[target].HP - damage;
      if(game.threats[target].HP < 0)
      {
         game.threats[target].HP = 0;
      }
      fa = 0;
      while(fa < damage)
      {
         tempHP = originalHP - (fa + 1);
         if(tempHP < 0)
         {
            tempHP = 0;
         }
         game.animation[game.animation.length] = ["iconDamage",target,tempHP];
         fa++;
      }
      if(game.threats[target].HP < 1)
      {
         game.animation[game.animation.length] = ["threatDestroyed",target];
         if(game.threats[target].threatName == "NUCLEAR DEVICE")
         {
            game.animation[game.animation.length] = ["revealNuke",false];
         }
         test = scanForOtherMalfunctions(target,game.threats[target].zone,game.threats[target].deck,game.threats[target].solveAction);
         if(test == false)
         {
            game.animation[game.animation.length] = ["showMalfunction",game.threats[target].zone,game.threats[target].deck,game.threats[target].solveAction,"hide"];
            game.ship[game.threats[target].zone].deck[game.threats[target].deck][game.threats[target].solveAction] = "normal";
         }
         if(game.threats[target].threatName == "POWER SYSTEM OVERLOAD")
         {
            test = scanForOtherMalfunctions(game.threats[target].proxies[0],0,1,"B");
            if(test == false)
            {
               game.animation[game.animation.length] = ["showMalfunction",0,1,"B","hide"];
               game.ship[0].deck[1].B = "normal";
            }
            test = scanForOtherMalfunctions(game.threats[target].proxies[1],2,1,"B");
            if(test == false)
            {
               game.animation[game.animation.length] = ["showMalfunction",2,1,"B","hide"];
               game.ship[2].deck[1].B = "normal";
            }
         }
         if(game.threats[target].threatName == "BATTLEBOT UPRISING")
         {
            test = scanForOtherMalfunctions(game.threats[target].proxies[0],2,0,"C");
            if(test == false)
            {
               game.animation[game.animation.length] = ["showMalfunction",2,0,"C","hide"];
               game.ship[2].deck[0].C = "normal";
            }
            if(game.ship[0].BattleBots != null)
            {
               game.animation[game.animation.length] = ["battleBotUprisng-destroyed",0,null,game.battleBots[0].zone,game.battleBots[0].deck,threat,game.battleBots[0].status,0,1];
            }
            if(game.ship[2].BattleBots != null)
            {
               game.animation[game.animation.length] = ["battleBotUprisng-destroyed",1,null,game.battleBots[1].zone,game.battleBots[1].deck,threat,game.battleBots[1].status,2,0];
            }
         }
         trace("THREAT " + target + " DESTROYED!");
         game.threats[target].HP = 0;
         game.threats[target].range = null;
         game.threats[target].status = "destroyed";
         if(game.threats[target].actionDeath != null)
         {
            fc = 0;
            while(fc < game.threats[target].actionDeath.length)
            {
               trace("THREAT " + target + " DEATH ACTION " + game.threats[target].actionDeath[fc][0]);
               executeAction(target,game.threats[target].actionDeath[fc][0],game.threats[target].actionDeath[fc][1],game.threats[target].actionDeath[fc][2],game.threats[target].actionDeath[fc][3]);
               fc++;
            }
         }
      }
   }
}
function internalTargetScan(zone, deck, hero, crew)
{
   viableTargets = [];
   die = false;
   counter = false;
   fa = 0;
   while(fa < game.threats.length)
   {
      trace("****************************************************8");
      trace("threat check " + game.threats[fa].threatName);
      trace("zone " + game.threats[fa].zone);
      trace("deck " + game.threats[fa].deck);
      trace("solveAction " + game.threats[fa].solveAction);
      trace("range " + game.threats[fa].range);
      trace("internal " + game.threats[fa].internal);
      if(game.threats[fa].zone == zone && game.threats[fa].deck == deck && game.threats[fa].solveAction == "Batt" && game.threats[fa].range != null && game.threats[fa].internal == true)
      {
         trace("OK");
         viableTargets[viableTargets.length] = fa;
      }
      fa++;
   }
   target = viableTargets[0];
   if(target != null)
   {
      fa = 1;
      while(fa < viableTargets.length)
      {
         if(game.threats[viableTargets[fa]].T < game.threats[target].T)
         {
            target = viableTargets[fa];
         }
         fa++;
      }
      trace("************** BOTT TARGET IS : " + game.threats[target].threatName);
      temp = target;
      if(game.threats[target].proxy != null)
      {
         target = game.threats[target].proxy;
      }
      game.threats[target].HP = game.threats[target].HP - 1;
      if(game.threats[target].HP < 1)
      {
         die = true;
      }
      if(game.threats[target].counterAttack == true && hero == false)
      {
         trace("BOTS ARE DISABLED");
         game.battleBots[game.crew[crew].battleBots].status = "damaged";
         counter = true;
      }
      if(game.threats[target].threatName == "SEEKER")
      {
         if(game.threats[target].HP < 1)
         {
            seekerDie = true;
            game.crew[crew].crewStatus = "knocked out";
            game.battleBots[game.crew[crew].battleBots].status = "damaged";
         }
      }
      game.animation[game.animation.length] = ["battleBotAttack",game.crew[crew].battleBots,game.crew[crew].zone,game.crew[crew].deck,target,die,counter,seekerDie,crew];
      if(game.threats[target].threatName == "CONTAMINATION")
      {
         game.animation[game.animation.length] = ["remIcon",game.threats[temp].movieClip];
         game.threats[temp] = null;
      }
      if(game.threats[target].parent != null)
      {
         game.threats[game.threats[target].parent].HP = game.threats[game.threats[target].parent].HP - 1;
         game.animation[game.animation.length] = ["iconDamage",game.threats[target].parent,game.threats[game.threats[target].parent].HP];
      }
      else
      {
         game.animation[game.animation.length] = ["iconDamage",target,game.threats[target].HP];
      }
      if(game.threats[target].HP < 1)
      {
         trace("THREAT " + target + " DESTROYED!");
         if(game.threats[target].parent == null)
         {
            game.animation[game.animation.length] = ["threatDestroyed",target];
         }
         game.threats[target].HP = 0;
         game.threats[target].range = null;
         game.threats[target].status = "destroyed";
         if(game.threats[target].threatName == "CONTAMINATION")
         {
            trace("PROXIES !!!!! " + game.threats[target].proxies);
            fa = 0;
            while(fa < game.threats[target].proxies.length)
            {
               game.animation[game.animation.length] = ["remIcon",game.threats[game.threats[target].proxies[fa]].movieClip];
               game.threats[game.threats[target].proxies[fa]] = null;
               fa++;
            }
         }
         if(game.threats[target].actionDeath != null)
         {
            fc = 0;
            while(fc < game.threats[target].actionDeath.length)
            {
               trace("THREAT " + a + " DEATH ACTION " + game.threats[target].actionDeath[fc][0]);
               executeAction(target,game.threats[target].actionDeath[fc][0],game.threats[target].actionDeath[fc][1],game.threats[target].actionDeath[fc][2],game.threats[target].actionDeath[fc][3]);
               fc++;
            }
         }
         if(game.threats[target].parent != null)
         {
            if(game.threats[game.threats[target].parent].threatName == "SLIME")
            {
               game.animation[game.animation.length] = ["showSlime",target,game.threats[target].zone,game.threats[target].deck,false];
            }
            if(game.threats[game.threats[target].parent].HP < 1)
            {
               trace("PARENT THREAT " + game.threats[target].parent + " DESTROYED!");
               if(game.threats[game.threats[target].parent].parent == null)
               {
                  game.animation[game.animation.length] = ["threatDestroyed",game.threats[target].parent];
               }
               game.threats[game.threats[target].parent].HP = 0;
               game.threats[game.threats[target].parent].range = null;
               game.threats[game.threats[target].parent].status = "destroyed";
               game.animation[game.animation.length] = ["threatDestroyed",target];
               if(game.threats[game.threats[target].parent].actionDeath != null)
               {
                  fc = 0;
                  while(fc < game.threats[game.threats[target].parent].actionDeath.length)
                  {
                     trace("THREAT " + a + " DEATH ACTION " + game.threats[game.threats[target].parent].actionDeath[fc][0]);
                     executeAction(game.threats[target].parent,game.threats[game.threats[target].parent].actionDeath[fc][0],game.threats[game.threats[target].parent].actionDeath[fc][1],game.threats[game.threats[target].parent].actionDeath[fc][2],game.threats[game.threats[target].parent].actionDeath[fc][3]);
                     fc++;
                  }
               }
            }
         }
      }
   }
   else
   {
      game.animation[game.animation.length] = ["battleBotAttack",game.crew[game.crewOrder[a]].battleBots,game.crew[game.crewOrder[a]].zone,game.crew[game.crewOrder[a]].deck];
      trace("NO BATTLEBOT TARGET");
   }
}
function delayActions(crew, turn, messageText)
{
   trace(crew + " IS DELAYED");
   if(messageText == null)
   {
      messageText = "";
   }
   game.animation[game.animation.length] = ["playSound","boobooSND"];
   game.animation[game.animation.length] = ["postMessage",messageText + game.crew[crew].crewName + " is delayed",15];
   tempActions = [];
   tempActions = game.crew[crew].actions;
   space = game.crew[crew].actions[turn];
   game.crew[crew].actions[turn] = "-";
   while(space != "-" && turn < 12)
   {
      space2 = game.crew[crew].actions[turn + 1];
      game.crew[crew].actions[turn + 1] = space;
      space = space2;
      turn = turn + 1;
   }
   game.crew[crew].actions[12] = null;
   game.crew[crew].actions = cleanArray(game.crew[crew].actions);
   trace("ACTIONS " + game.crew[crew].actions);
}
function attack(zone, threat, mod1, mod2, mod3)
{
   if(mod1 == "HP")
   {
      mod1 = game.threats[threat].HP;
   }
   if(mod1 == "HP2")
   {
      mod1 = game.threats[threat].HP * 2;
   }
   if(mod1 == "HP3")
   {
      mod1 = game.threats[threat].HP * 3;
   }
   if(mod1 == "energy")
   {
      mod1 = game.ship[zone].energy;
   }
   if(mod1 == "player")
   {
      mod1 = 0;
      fa = 0;
      while(fa < game.crewOrder.length)
      {
         trace("ZONE " + game.crew[game.crewOrder[fa]].zone + " " + game.threats[threat].zone + " -- DECK " + game.crew[game.crewOrder[fa]].deck + " " + game.threats[threat].deck);
         if(game.crew[game.crewOrder[fa]].zone == game.threats[threat].zone && game.crew[game.crewOrder[fa]].deck == game.threats[threat].deck)
         {
            mod1 = mod1 + 1;
         }
         trace(" ========================== DAMAGE IS " + mod1);
         fa++;
      }
   }
   if(game.threats[threat].internal != true)
   {
      mod1 = mod1 + game.attackBuff;
      if(game.threats[threat].threatName == "SCOUT" && game.threats[threat].attackBuffOn == true)
      {
         mod1 = mod1 - 1;
      }
   }
   damage = mod1;
   trace("DAMAGE " + damage);
   trace("ZONE " + zone);
   trace("******************************************************************** " + mod3);
   trace("SHIELDS " + game.ship[zone].shields);
   if(game.ship[zone].shields > 0)
   {
      if(mod2 == true)
      {
         damage = mod1 - game.ship[zone].shields;
         if(mod1 > game.ship[zone].shields)
         {
            game.ship[zone].shields = 0;
         }
         else
         {
            game.ship[zone].shields = game.ship[zone].shields - mod1;
         }
      }
   }
   else if(mod3 == "double")
   {
      damage = damage * 2;
   }
   trace("SHIELDS AFTER " + game.ship[zone].shields);
   trace("DAMAGE AFTER SHIELD " + damage);
   game.animation[game.animation.length] = ["addShield",zone,game.ship[zone].shields];
   if(game.ship[zone].doubleDamage > 0)
   {
      damage = damage * 2;
   }
   if(damage > 0)
   {
      fa = 0;
      while(fa < damage)
      {
         trace("fa " + fa);
         doDamage(zone);
         fa++;
      }
   }
}
function executeAction(threat, actionType, mod1, mod2, mod3)
{
   trace(actionType);
   if(actionType == "attack")
   {
      game.animation[game.animation.length] = ["playSound","alarm"];
      zone = game.threats[threat].zone;
      attack(zone,threat,mod1,mod2,mod3);
   }
   if(actionType == "attackAllZone")
   {
      game.animation[game.animation.length] = ["playSound","alarm"];
      attack(0,threat,mod1,mod2,mod3);
      attack(1,threat,mod1,mod2,mod3);
      attack(2,threat,mod1,mod2,mod3);
   }
   if(actionType == "attackOtherZone")
   {
      game.animation[game.animation.length] = ["playSound","alarm"];
      if(game.threats[threat].zone == 0)
      {
         zoneA = 1;
         zoneB = 2;
      }
      if(game.threats[threat].zone == 1)
      {
         zoneA = 0;
         zoneB = 2;
      }
      if(game.threats[threat].zone == 2)
      {
         zoneA = 0;
         zoneB = 1;
      }
      attack(zoneA,threat,mod1,mod2,mod3);
      attack(zoneB,threat,mod1,mod2,mod3);
   }
   if(actionType == "attackRedBlue")
   {
      game.animation[game.animation.length] = ["playSound","alarm"];
      attack(0,threat,mod1,mod2,mod3);
      attack(2,threat,mod1,mod2,mod3);
   }
   if(actionType == "attackRed")
   {
      game.animation[game.animation.length] = ["playSound","alarm"];
      attack(0,threat,mod1,mod2,mod3);
   }
   if(actionType == "attackWhite")
   {
      game.animation[game.animation.length] = ["playSound","alarm"];
      attack(1,threat,mod1,mod2,mod3);
   }
   if(actionType == "attackBlue")
   {
      game.animation[game.animation.length] = ["playSound","alarm"];
      attack(2,threat,mod1,mod2,mod3);
   }
   if(actionType == "reveal")
   {
      game.animation[game.animation.length] = ["reveal",threat];
      game.threats[threat].targetable = true;
   }
   if(actionType == "drainShields")
   {
      game.animation[game.animation.length] = ["playSound","alarm"];
      if(mod1 == "all")
      {
         trace(mod2);
         if(mod2 == "all")
         {
            game.ship[0].shields = 0;
            game.ship[1].shields = 0;
            game.ship[2].shields = 0;
         }
         else
         {
            trace("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX " + mod2);
            game.ship[0].shields = game.ship[0].shields - mod2;
            if(game.ship[0].shields < 0)
            {
               game.ship[0].shields = 0;
            }
            game.ship[1].shields = game.ship[1].shields - mod2;
            if(game.ship[1].shields < 0)
            {
               game.ship[1].shields = 0;
            }
            game.ship[2].shields = game.ship[2].shields - mod2;
            if(game.ship[2].shields < 0)
            {
               game.ship[2].shields = 0;
            }
            trace("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX " + game.ship[0].shields);
         }
         game.animation[game.animation.length] = ["addShield",0,game.ship[0].shields];
         game.animation[game.animation.length] = ["addShield",1,game.ship[1].shields];
         game.animation[game.animation.length] = ["addShield",2,game.ship[2].shields];
      }
      else
      {
         if(mod2 == "all")
         {
            game.ship[game.threats[threat].zone].shields = 0;
         }
         else
         {
            game.ship[game.threats[threat].zone].shields = game.ship[game.threats[threat].zone].shields - mod2;
            if(game.ship[game.threats[threat].zone].shields < 0)
            {
               game.ship[game.threats[threat].zone].shields = 0;
            }
         }
         game.animation[game.animation.length] = ["addShield",game.threats[threat].zone,game.ship[game.threats[threat].zone].shields];
      }
   }
   if(actionType == "heal")
   {
      if(mod1 == "half")
      {
         mod1 = Math.floor((game.threats[threat].HPMAX - game.threats[threat].HP) / 2);
      }
      if(game.threats[threat].HPMAX - game.threats[threat].HP < mod1)
      {
         mod1 = game.threats[threat].HPMAX - game.threats[threat].HP;
      }
      game.threats[threat].HP = game.threats[threat].HP + mod1;
      game.animation[game.animation.length] = ["iconHeal",threat,game.threats[threat].HP];
   }
   if(actionType == "speed")
   {
      game.threats[threat].speed = game.threats[threat].speed + mod1;
      if(mod1 > 0)
      {
         game.animation[game.animation.length] = ["iconSpeed",threat,game.threats[threat].speed,"up"];
      }
      if(mod1 < 0)
      {
         game.animation[game.animation.length] = ["iconSpeed",threat,game.threats[threat].speed,"down"];
      }
   }
   if(actionType == "shield")
   {
      if(mod2 == "set")
      {
         temp = mod1 - game.threats[threat].shieldsMAX;
         game.threats[threat].shieldsMAX = mod1;
         if(temp > 0)
         {
            game.threats[threat].shields = game.threats[threat].shields + temp;
         }
         if(game.threats[threat].shields > game.threats[threat].shieldsMAX)
         {
            game.threats[threat].shields = game.threats[threat].shieldsMAX;
         }
         mod1 = temp * -1;
      }
      else
      {
         game.threats[threat].shieldsMAX = game.threats[threat].shieldsMAX + mod1;
         if(mod1 > 0)
         {
            game.threats[threat].shields + mod1;
         }
         if(game.threats[threat].shields > game.threats[threat].shieldsMAX)
         {
            game.threats[threat].shields = game.threats[threat].shieldsMAX;
         }
      }
      if(mod1 < 0)
      {
         game.animation[game.animation.length] = ["iconShield",threat,game.threats[threat].shields,"up"];
      }
      if(mod1 > 0)
      {
         game.animation[game.animation.length] = ["iconShield",threat,game.threats[threat].shields,"down"];
      }
   }
   if(actionType == "attackBuff")
   {
      game.attackBuff = game.attackBuff + mod1;
      game.threats[threat].attackBuffOn = true;
   }
   if(actionType == "shieldBuff")
   {
      game.shieldBuff = game.shieldBuff + mod1;
      game.threats[threat].shieldBuffOn = true;
      threatsToBuff = [];
      fa = 0;
      while(fa < game.threats.length)
      {
         if(game.threats[fa].range != null && game.threats[fa].internal != true)
         {
            threatsToBuff[threatsToBuff.length] = [fa,game.threats[fa].shieldsCurrent + 1];
         }
         fa++;
      }
      game.animation[game.animation.length] = ["buffShields",threatsToBuff];
   }
   if(actionType == "actionTally")
   {
      game.threats[threat].actionTally = game.threats[threat].actionTally + 1;
   }
   if(actionType == "delaySector")
   {
      game.ship[mod1].deck[mod2].delay = game.ship[mod1].deck[mod2].delay + 1;
   }
   if(actionType == "removeSectorDelay")
   {
      trace("REMOVE SECTOR DELAY " + game.ship[2].deck[1].delay);
      game.ship[mod1].deck[mod2].delay = game.ship[mod1].deck[mod2].delay - 1;
      trace("REMOVE SECTOR DELAY " + game.ship[2].deck[1].delay);
   }
   if(actionType == "delay")
   {
      if(mod1 == "deck")
      {
         tempZone = game.threats[threat].zone;
         tempDeck = game.threats[threat].deck;
         if(mod2 != null)
         {
            tempZone = mod2;
         }
         if(mod3 != null)
         {
            tempDeck = mod3;
         }
         fa = 0;
         while(fa < game.crew.length)
         {
            if(game.crew[fa].zone == tempZone && game.crew[fa].deck == tempDeck)
            {
               delayActions(fa,game.currentTurn + 1);
            }
            fa++;
         }
      }
      if(mod1 == "zone")
      {
         fa = 0;
         while(fa < game.crew.length)
         {
            if(game.crew[fa].zone == game.threats[threat].zone)
            {
               delayActions(fa,game.currentTurn + 1);
            }
            fa++;
         }
      }
      if(mod1 == "ship")
      {
         fa = 0;
         while(fa < game.crew.length)
         {
            if(game.crew[fa].zone != "space")
            {
               delayActions(fa,game.currentTurn + 1);
            }
            fa++;
         }
      }
      if(mod1 == "location")
      {
         fa = 0;
         while(fa < game.crew.length)
         {
            if(game.crew[fa].zone == mod2 && game.crew[fa].deck == mod3)
            {
               delayActions(fa,game.currentTurn + 1);
            }
            fa++;
         }
      }
   }
   if(actionType == "executioner knockout")
   {
      game.animation[game.animation.length] = ["intruderAttack",threat,1];
      fa = 0;
      while(fa < game.crew.length)
      {
         if(game.crew[fa].zone == game.threats[threat].zone && game.crew[fa].deck == game.threats[threat].deck && game.battleBots[game.crew[fa].battleBots].status != "ready")
         {
            if(game.crew[fa].crewStatus != "knocked out")
            {
               game.crew[fa].crewStatus = "knocked out";
               game.animation[game.animation.length] = ["knockout",fa];
            }
         }
         fa++;
      }
   }
   if(actionType == "knockoutSector")
   {
      game.ship[mod1].deck[mod2].knockout = game.ship[mod1].deck[mod2].knockout + 1;
   }
   if(actionType == "knockout")
   {
      if(mod1 == "crew")
      {
         trace("Current Crew Member..  " + game.currentCrew);
         fa = game.currentCrew;
         if(game.crew[fa].crewStatus != "knocked out")
         {
            game.crew[fa].crewStatus = "knocked out";
            game.animation[game.animation.length] = ["knockout",fa];
         }
      }
      if(mod1 == "deck")
      {
         tempZone = game.threats[threat].zone;
         tempDeck = game.threats[threat].deck;
         if(mod2 != null)
         {
            tempZone = mod2;
         }
         if(mod3 != null)
         {
            tempDeck = mod3;
         }
         fa = 0;
         while(fa < game.crew.length)
         {
            if(game.crew[fa].zone == tempZone && game.crew[fa].deck == tempDeck)
            {
               trace("Crew " + fa + " is KO");
               if(game.crew[fa].crewStatus != "knocked out")
               {
                  game.crew[fa].crewStatus = "knocked out";
                  game.animation[game.animation.length] = ["knockout",fa];
               }
            }
            fa++;
         }
      }
      if(mod1 == "zone")
      {
         tempZone = game.threats[threat].zone;
         if(mod2 != null)
         {
            tempZone = mod2;
         }
         fa = 0;
         while(fa < game.crew.length)
         {
            if(game.crew[fa].zone == tempZone)
            {
               if(game.crew[fa].crewStatus != "knocked out")
               {
                  game.crew[fa].crewStatus = "knocked out";
                  game.animation[game.animation.length] = ["knockout",fa];
               }
            }
            fa++;
         }
      }
      if(mod1 == "ship")
      {
         fa = 0;
         while(fa < game.crew.length)
         {
            if(game.crew[fa].zone != "space")
            {
               if(game.crew[fa].crewStatus != "knocked out")
               {
                  game.crew[fa].crewStatus = "knocked out";
                  game.animation[game.animation.length] = ["knockout",fa];
               }
            }
            fa++;
         }
      }
      if(mod1 == "location")
      {
         fa = 0;
         while(fa < game.crew.length)
         {
            if(game.crew[fa].zone == mod2 && game.crew[fa].deck == mod3)
            {
               if(game.crew[fa].crewStatus != "knocked out")
               {
                  game.crew[fa].crewStatus = "knocked out";
                  game.animation[game.animation.length] = ["knockout",fa];
               }
            }
            fa++;
         }
      }
   }
   if(actionType == "damageThreats")
   {
      threatsToDamage = [];
      fa = 0;
      while(fa < game.threats.length)
      {
         if(game.threats[fa].range != null && game.threats[fa].internal != true)
         {
            threatsToDamage[threatsToDamage.length] = [fa];
         }
         fa++;
      }
      game.animation[game.animation.length] = ["leviathanExplosion",threatsToDamage,threat];
      fa = 0;
      while(fa < game.threats.length)
      {
         if(game.threats[fa].range != null && game.threats[fa].internal != true)
         {
            doDamageToThreat(fa,mod1);
         }
         fa++;
      }
   }
   if(actionType == "damageSelf")
   {
      fa = threat;
      totalDamage = mod1;
      if(game.threats[fa].damageLimit != null && totalDamage > game.threats[fa].damageLimit)
      {
         totalDamage = game.threats[fa].damageLimit;
      }
      trace("DAMAGE TO THREAT " + fa + " is " + totalDamage);
      game.threats[fa].HP = game.threats[fa].HP - totalDamage;
      game.animation[game.animation.length] = ["iconDamage",threat,game.threats[fa].HP];
      if(game.threats[fa].HP < 1)
      {
         trace("THREAT " + fa + " DESTROYED!");
         game.threats[fa].HP = 0;
         game.threats[fa].range = null;
         game.threats[fa].status = "destroyed";
         if(game.threats[fa].asteroidDamage > 0)
         {
            damage = game.threats[fa].actionTally * game.threats[fa].asteroidDamage;
            trace("*********** DEBRIS DAMAGE ************");
            executeAction(fa,"attack",damage,true);
         }
      }
   }
   if(actionType == "destroyShip")
   {
      game.destroyed = true;
      fa = 0;
      while(fa < game.crew.length)
      {
         if(game.crew[fa].zone != "space")
         {
            game.crew[fa].crewStatus = "knocked out";
         }
         fa++;
      }
      if(mod1 == true)
      {
         game.threats[threat].status = "destroyed";
      }
   }
   if(actionType == "fissure1")
   {
      game.destroyed = true;
      game.animation[game.animation.length] = ["shipDestoyed"];
   }
   if(actionType == "move")
   {
      go = true;
      currentZone = game.threats[threat].zone;
      currentDeck = game.threats[threat].deck;
      if(mod1 == "seeker")
      {
         sector = [0,0,0,0,0];
         fa = 0;
         while(fa < game.crew.length)
         {
            trace("MOVE MOVE MOVE " + game.crew[fa].crewStatus + " " + game.crew[fa].zone + " " + game.threats[threat].zone + " " + game.crew[fa].deck + " " + game.threats[threat].deck);
            if(game.crew[fa].crewStatus == "active" && game.crew[fa].zone == game.threats[threat].zone && game.crew[fa].deck == game.threats[threat].deck - 1)
            {
               sector[0] = sector[0] + 1;
            }
            if(game.crew[fa].crewStatus == "active" && game.crew[fa].zone == game.threats[threat].zone + 1 && game.crew[fa].deck == game.threats[threat].deck)
            {
               sector[1] = sector[1] + 1;
            }
            if(game.crew[fa].crewStatus == "active" && game.crew[fa].zone == game.threats[threat].zone && game.crew[fa].deck == game.threats[threat].deck + 1)
            {
               sector[2] = sector[2] + 1;
            }
            if(game.crew[fa].crewStatus == "active" && game.crew[fa].zone == game.threats[threat].zone - 1 && game.crew[fa].deck == game.threats[threat].deck)
            {
               sector[3] = sector[3] + 1;
            }
            fa++;
         }
         trace("AT SEEKER MOVE " + sector);
         choice = 0;
         tie = false;
         fa = 1;
         while(fa < sector.length)
         {
            if(sector[fa] == sector[choice])
            {
               tie = true;
            }
            if(sector[fa] > sector[choice])
            {
               tie = false;
               choice = fa;
            }
            fa++;
         }
         if(tie == false)
         {
            trace("move to choice " + choice);
            if(choice == 0)
            {
               game.threats[threat].deck = game.threats[threat].deck - 1;
            }
            if(choice == 1)
            {
               game.threats[threat].zone = game.threats[threat].zone + 1;
            }
            if(choice == 2)
            {
               game.threats[threat].deck = game.threats[threat].deck + 1;
            }
            if(choice == 3)
            {
               game.threats[threat].zone = game.threats[threat].zone - 1;
            }
         }
         else
         {
            go = false;
            trace("STAY PUT");
         }
      }
      else
      {
         if(mod2 == "IFdamaged")
         {
            go = false;
            if(game.threats[threat].HPMAX - game.threats[threat].HP > 0)
            {
               go = true;
            }
            if(go == false && mod3 != null)
            {
               game.animation[game.animation.length] = ["intruderAttack",threat,1];
               attack(game.threats[threat].zone,threat,mod3,false);
            }
         }
         if(mod1 == "R" && go == true)
         {
            game.threats[threat].zone = game.threats[threat].zone + 1;
            if(game.threats[threat].zone > 2)
            {
               game.threats[threat].zone = 2;
            }
         }
         if(mod1 == "L" && go == true)
         {
            game.threats[threat].zone = game.threats[threat].zone - 1;
            if(game.threats[threat].zone < 0)
            {
               game.threats[threat].zone = 0;
            }
         }
         if(mod1 == "D" && go == true)
         {
            if(game.threats[threat].deck == 0)
            {
               game.threats[threat].deck = 1;
            }
            else
            {
               game.threats[threat].deck = 0;
            }
         }
      }
      if(go == true)
      {
         game.animation[game.animation.length] = ["moveIntruder",threat,game.threats[threat].zone,game.threats[threat].deck,currentZone,currentDeck];
      }
   }
   if(actionType == "drainEnergy")
   {
      if(mod3 == true && game.ship[game.threats[threat].zone].energy < 1)
      {
         attack(game.threats[threat].zone,threat,mod1,false);
      }
      else if(mod2 == "all")
      {
         fa = 0;
         while(fa < 3)
         {
            if(mod1 == "all")
            {
               mod1 = game.ship[fa].energy;
            }
            game.ship[fa].energy = game.ship[fa].energy - mod1;
            if(game.ship[fa].energy < 0)
            {
               game.ship[fa].energy = 0;
            }
            game.animation[game.animation.length] = ["addEnergy",fa,game.ship[fa].energy];
            fa++;
         }
      }
      else
      {
         zone = game.threats[threat].zone;
         if(mod2 == 0)
         {
            zone = 0;
         }
         if(mod2 == 1)
         {
            zone = 1;
         }
         if(mod2 == 2)
         {
            zone = 2;
         }
         if(mod1 == "all")
         {
            mod1 = game.ship[zone].energy;
         }
         game.ship[zone].energy = game.ship[zone].energy - mod1;
         if(game.ship[zone].energy < 0)
         {
            game.ship[zone].energy = 0;
         }
         game.animation[game.animation.length] = ["addEnergy",zone,game.ship[zone].energy];
      }
   }
   if(actionType == "counterAttack")
   {
      game.threats[threat].counterAttack = true;
   }
   if(actionType == "fuel")
   {
      game.ship[1].fuelCells = game.ship[1].fuelCells - mod1;
      if(game.ship[1].fuelCells < 0)
      {
         game.ship[1].fuelCells = 0;
      }
      game.animation[game.animation.length] = ["addFuel",game.ship[1].fuelCells];
   }
   if(actionType == "destroyRocket")
   {
      rocketStart = game.ship[2].Rockets;
      if(mod1 == "HP")
      {
         mod1 = game.threats[threat].HP;
      }
      game.ship[2].Rockets = game.ship[2].Rockets - mod1;
      if(game.ship[2].Rockets < 0)
      {
         game.ship[2].Rockets = 0;
      }
      game.animation[game.animation.length] = ["detonateRockets",mod1,rocketStart];
   }
   if(actionType == "crossedWires1")
   {
      tempEnergy = game.ship[1].energy;
      game.ship[1].energy = 0;
      game.ship[1].shields = game.ship[1].shields + tempEnergy;
      excessEnergy = game.ship[1].shields - 3;
      if(game.ship[1].shields > 3)
      {
         game.ship[1].shields = 3;
      }
      game.animation[game.animation.length] = ["addEnergy",1,game.ship[1].energy];
      game.animation[game.animation.length] = ["addShield",1,game.ship[1].shields];
      if(excessEnergy > 0)
      {
         attack(1,threat,excessEnergy,false);
         game.animation[game.animation.length] = ["internalExplosion",null,1,0,excessEnergy];
      }
   }
   if(actionType == "crossedWires2")
   {
      tempEnergy = game.ship[1].shields;
      game.ship[1].shields = 0;
      game.animation[game.animation.length] = ["addShield",1,game.ship[1].shields];
      if(tempEnergy > 0)
      {
         attack(1,threat,tempEnergy,false);
         game.animation[game.animation.length] = ["internalExplosion",null,1,0,tempEnergy];
      }
   }
   if(actionType == "crossedWires3")
   {
      fe = 0;
      while(fe < 3)
      {
         tempEnergy = game.ship[fe].energy;
         game.ship[fe].energy = 0;
         game.animation[game.animation.length] = ["addEnergy",fe,game.ship[fe].energy];
         if(tempEnergy > 0)
         {
            attack(fe,threat,tempEnergy,false);
            game.animation[game.animation.length] = ["internalExplosion",null,fe,1,tempEnergy];
         }
         fe++;
      }
   }
   if(actionType == "doubleDamage")
   {
      game.ship[mod1].doubleDamage = game.ship[mod1].doubleDamage + 1;
   }
   if(actionType == "repairDoubleDamage")
   {
      action = 0;
      target = 0;
      fb = 0;
      while(fb < game.threats.length)
      {
         if(game.threats[fb].threatName == "FISSURE")
         {
            target = fb;
         }
         fb++;
      }
      trace("what is the target: " + target);
      range = game.threatTracks[3].length - 1 - (game.currentTurn - game.threats[target].T) * game.threats[target].speed;
      trace("REPAIR " + (game.threatTracks[3].length - 1) + " " + range);
      fb = game.threatTracks[3].length - 1;
      while(fb >= range)
      {
         if(action < game.threatTracks[3][fb])
         {
            action = game.threatTracks[3][fb];
         }
         trace("THE ACTION MAX WAS: " + action);
         fb--;
      }
      if(action == 1)
      {
         game.ship[0].doubleDamage = game.ship[0].doubleDamage - 1;
      }
      if(action >= 2)
      {
         game.ship[0].doubleDamage = game.ship[0].doubleDamage - 1;
         game.ship[1].doubleDamage = game.ship[1].doubleDamage - 1;
         game.ship[2].doubleDamage = game.ship[2].doubleDamage - 1;
      }
   }
   if(actionType == "battlebotUprising1")
   {
      fa = 0;
      while(fa < game.crew.length)
      {
         if(game.crew[fa].battleBots != null)
         {
            game.crew[fa].crewStatus = "knocked out";
            game.animation[game.animation.length] = ["battleBotUprisng-attack",game.crew[fa].battleBots,fa,game.crew[fa].zone,game.crew[fa].deck,threat,game.battleBots[game.crew[fa].battleBots].status,finalZone,finalDeck];
         }
         fa++;
      }
      fa = 0;
      while(fa < game.battleBots.length)
      {
         if(fa == 0)
         {
            finalZone = 0;
            finalDeck = 1;
            game.battleBots[fa].zone = 0;
            game.battleBots[fa].deck = 1;
         }
         else
         {
            finalZone = 2;
            finalDeck = 0;
            game.battleBots[fa].zone = 2;
            game.battleBots[fa].deck = 0;
         }
         game.animation[game.animation.length] = ["battleBotUprisng-move",fa,null,null,null,threat,game.battleBots[game.crew[fa].battleBots].status,finalZone,finalDeck];
         fa++;
      }
   }
   if(actionType == "battlebotUprising3")
   {
      fa = 0;
      while(fa < game.battleBots.length)
      {
         game.animation[game.animation.length] = ["battleBotUprisng-attack",fa,null,game.battleBots[fa].zone,game.battleBots[fa].deck,threat,game.battleBots[game.crew[fa].battleBots].status,finalZone,finalDeck];
         fa++;
      }
   }
   if(actionType == "battlebotUprising4")
   {
      game.animation[game.animation.length] = ["battleBotUprisng-attack",1,null,2,0,threat,game.battleBots[1].status,2,0];
      game.animation[game.animation.length] = ["battleBotUprisng-attack",0,null,0,1,threat,game.battleBots[0].status,0,1];
      game.animation[game.animation.length] = ["battleBotUprisng-move",1,null,2,0,threat,game.battleBots[1].status,2,1];
      game.animation[game.animation.length] = ["battleBotUprisng-attack",1,null,2,1,threat,game.battleBots[1].status,2,1];
      game.animation[game.animation.length] = ["battleBotUprisng-move",0,null,0,1,threat,game.battleBots[0].status,0,0];
      game.animation[game.animation.length] = ["battleBotUprisng-attack",0,null,0,0,threat,game.battleBots[0].status,0,0];
      game.animation[game.animation.length] = ["battleBotUprisng-move",1,null,null,null,threat,game.battleBots[1].status,1,1];
      game.animation[game.animation.length] = ["battleBotUprisng-attack",1,null,1,1,threat,game.battleBots[1].status,1,1];
   }
   if(actionType == "battlebotUprising5")
   {
   }
   if(actionType == "damageBattlebot")
   {
      if(game.ship[mod1].battleBots != null)
      {
         game.battleBots[game.ship[mod1].battleBots].status = "damaged";
         game.animation[game.animation.length] = ["fixBattleBots",game.ship[mod1].battleBots,"DAMAGE"];
         trace("BATTLEBOT " + game.ship[mod1].battleBots + " DAMAGED");
      }
   }
   if(actionType == "slime1")
   {
      test = false;
      fa = 0;
      while(fa < game.threats.length)
      {
         if(game.threats[fa].zone == game.threats[threat].zone - 1 && game.threats[game.threats[fa].parent].threatName == "SLIME")
         {
            test = true;
         }
         fa++;
      }
      if(test == false)
      {
         newThreat = game.threats.length;
         game.threats[game.threats[threat].parent].proxies[game.threats[game.threats[threat].parent].proxies.length] = newThreat;
         game.threats[newThreat] = [];
         game.threats[newThreat].solveAction = "Batt";
         game.threats[newThreat].internal = true;
         game.threats[newThreat].threatName = "proxy";
         game.threats[newThreat].born = true;
         game.threats[newThreat].VPsurvive = 0;
         game.threats[newThreat].VPkill = 0;
         game.threats[newThreat].zone = game.threats[threat].zone - 1;
         game.threats[newThreat].deck = 1;
         game.threats[newThreat].speed = 2;
         game.threats[newThreat].parent = game.threats[threat].parent;
         game.threats[newThreat].HPMAX = 1;
         game.threats[newThreat].HP = 1;
         game.threats[newThreat].T = game.threats[threat].T;
         game.threats[newThreat].range = game.threats[threat].range;
         game.threats[newThreat].action1 = [["destroyRocket",1]];
         game.threats[newThreat].action2 = [["slime1"]];
         game.threats[newThreat].action3 = [["attack",2,false]];
         game.threats[newThreat].actionAnim1 = [["intruderAttack",1]];
         game.threats[newThreat].actionAnim2 = [["intruderAttack",1]];
         game.threats[newThreat].actionAnim3 = [["intruderAttack",1]];
         game.threats[newThreat].actionDeath = [["removeSectorDelay",game.threats[threat].zone - 1,1]];
         game.ship[game.threats[threat].zone - 1].deck[1].delay = game.ship[game.threats[threat].zone - 1].deck[1].delay + 1;
         game.threats[game.threats[threat].parent].HP = game.threats[game.threats[threat].parent].HP + 1;
         game.animation[game.animation.length] = ["revealIntruder",newThreat,game.threats[newThreat].zone,1,"slime",true];
         game.animation[game.animation.length] = ["damageThreat",game.threats[threat].parent,game.threats[game.threats[threat].parent].HP];
      }
   }
   if(actionType == "slime2")
   {
      test = false;
      fa = 0;
      while(fa < game.threats.length)
      {
         if(game.threats[fa].zone == game.threats[threat].zone + 1 && game.threats[game.threats[fa].parent].threatName == "SLIME")
         {
            test = true;
         }
         fa++;
      }
      if(test == false)
      {
         newThreat = game.threats.length;
         game.threats[game.threats[threat].parent].proxies[game.threats[game.threats[threat].parent].proxies.length] = newThreat;
         game.threats[newThreat] = [];
         game.threats[newThreat].solveAction = "Batt";
         game.threats[newThreat].internal = true;
         game.threats[newThreat].threatName = "proxy";
         game.threats[newThreat].born = true;
         game.threats[newThreat].VPsurvive = 0;
         game.threats[newThreat].VPkill = 0;
         game.threats[newThreat].zone = game.threats[threat].zone + 1;
         game.threats[newThreat].deck = 1;
         game.threats[newThreat].speed = 2;
         game.threats[newThreat].parent = game.threats[threat].parent;
         game.threats[newThreat].HPMAX = 1;
         game.threats[newThreat].HP = 1;
         game.threats[newThreat].T = game.threats[threat].T;
         game.threats[newThreat].range = game.threats[threat].range;
         game.threats[newThreat].action1 = [["damageBattlebot",0]];
         game.threats[newThreat].action2 = [["slime2"]];
         game.threats[newThreat].action3 = [["attack",2,false]];
         game.threats[newThreat].actionAnim1 = [["intruderAttack",1]];
         game.threats[newThreat].actionAnim2 = [["intruderAttack",1]];
         game.threats[newThreat].actionAnim3 = [["intruderAttack",1]];
         game.threats[newThreat].actionDeath = [["removeSectorDelay",game.threats[threat].zone + 1,1]];
         game.ship[game.threats[threat].zone + 1].deck[1].delay = game.ship[game.threats[threat].zone + 1].deck[1].delay + 1;
         game.threats[game.threats[threat].parent].HP = game.threats[game.threats[threat].parent].HP + 1;
         game.animation[game.animation.length] = ["revealIntruder",newThreat,game.threats[newThreat].zone,1,"slime",true];
         game.animation[game.animation.length] = ["damageThreat",game.threats[threat].parent,game.threats[game.threats[threat].parent].HP];
      }
   }
   if(actionType == "advanceAllOther")
   {
      trace("THIS IS IT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      fe = 0;
      while(fe < game.threats.length)
      {
         trace("RANGE " + game.threats[fe].range);
         trace("INTERNAL " + game.threats[fe].internal);
         trace("threatName " + game.threats[fe].threatName);
         if(game.threats[fe].range != null && game.threats[fe].internal != true && game.threats[fe].threatName != "SCOUT")
         {
            trace("PASS");
            game.threats[fe].range = game.threats[fe].range - 1;
            game.animation[game.animation.length] = ["moveThreatTraker",fe,game.threats[fe].zone,game.threats[fe].range];
            checkThreatActions(fe,game.threats[fe].zone);
         }
         fe++;
      }
   }
   if(actionType == "internalExplosion")
   {
      game.animation[game.animation.length] = ["internalExplosion",null,mod1,mod2,mod3];
   }
   if(actionType == "hideIntruder")
   {
      game.animation[game.animation.length] = ["revealIntruder",threat,null,null,null,false];
   }
}
function generateThreats()
{
   game.threats = [];
   fa = 0;
   while(fa < 8)
   {
      if(this.main["menu-threat"]["menu-threat-" + fa]._x != null)
      {
         temp = game.threats.length;
         game.threats[temp] = [];
         game.threats[temp].T = fa;
         game.threats[temp].threatType = this.main["menu-threat"]["menu-threat-" + fa].threatType;
         game.threats[temp].ID = this.main["menu-threat"]["menu-threat-" + fa].ID;
         if(game.threats[temp].threatType == "external")
         {
            game.threats[temp].zone = this.main["menu-threat"]["menu-threat-" + fa].zone;
         }
      }
      fa++;
   }
}
function generateThreatsFinal()
{
   game.threats = [];
   fa = 0;
   while(fa < 8)
   {
      if(this.main["menu-threat"]["menu-threat-" + fa]._x != null)
      {
         temp = game.threats.length;
         game.threats[temp] = [];
         game.threats[temp] = game.threatsLibrary[this.main["menu-threat"]["menu-threat-" + fa].threatType][this.main["menu-threat"]["menu-threat-" + fa].ID];
         game.threats[temp].HP = game.threats[temp].HPMAX;
         game.threats[temp].T = fa;
         game.threats[temp].threatType = this.main["menu-threat"]["menu-threat-" + fa].threatType;
         game.threats[temp].ID = this.main["menu-threat"]["menu-threat-" + fa].ID;
         if(game.threats[temp].threatType == "external")
         {
            game.threats[temp].zone = this.main["menu-threat"]["menu-threat-" + fa].zone;
         }
         game.threats[temp].range = null;
         game.threats[temp].status = "active";
         game.threats[temp].location = null;
      }
      fa++;
   }
}
function moveCheck(crew, newLocation)
{
   flagcheck = false;
   tempPastLocation = [];
   tempCrewArray = [];
   tempNewLocation = [];
   tempPastLocation[0] = game.crew[crew].location[0];
   tempPastLocation[1] = game.crew[crew].location[1];
   tempPastLocation[2] = game.crew[crew].location[2];
   if(newLocation == "wait")
   {
      ff = 0;
      while(ff < 5)
      {
         if(game.crewLocations[game.crew[crew].zone][game.crew[crew].deck].wait[ff] == null && temp1 == null)
         {
            temp1 = ff;
         }
         if(game.crewLocations[game.crew[crew].zone][game.crew[crew].deck].wait[ff] == crew)
         {
            temp2 = ff;
         }
         ff++;
      }
      if(temp2 != null)
      {
         tempNewLocation[3] = temp2;
      }
      else
      {
         tempNewLocation[3] = temp1;
      }
   }
   else
   {
      tempNewLocation[3] = game.crewLocations[game.crew[crew].zone][game.crew[crew].deck][newLocation].length;
   }
   ff = 0;
   while(ff < game.crewLocations[tempPastLocation[0]][tempPastLocation[1]][tempPastLocation[2]].length)
   {
      if(game.crew[crew].location[2] != "wait")
      {
         if(flagcheck == true)
         {
            tempCrew = game.crewLocations[tempPastLocation[0]][tempPastLocation[1]][tempPastLocation[2]][ff];
            tempCrewArray[tempCrewArray.length] = [tempCrew,game.crew[game.crewOrder[tempCrew]].battleBots];
         }
      }
      if(game.crewLocations[tempPastLocation[0]][tempPastLocation[1]][tempPastLocation[2]][ff] == crew)
      {
         tempPastLocation[3] = ff;
         game.crewLocations[game.crew[crew].location[0]][game.crew[crew].location[1]][game.crew[crew].location[2]][ff] = null;
         flagcheck = true;
      }
      ff++;
   }
   if(game.crew[crew].location[2] != "wait")
   {
      game.crewLocations[game.crew[crew].location[0]][game.crew[crew].location[1]][game.crew[crew].location[2]] = cleanArray(game.crewLocations[game.crew[crew].location[0]][game.crew[crew].location[1]][game.crew[crew].location[2]]);
   }
   game.crew[crew].location[0] = game.crew[crew].zone;
   game.crew[crew].location[1] = game.crew[crew].deck;
   game.crew[crew].location[2] = newLocation;
   tempNewLocation[0] = game.crew[crew].location[0];
   tempNewLocation[1] = game.crew[crew].location[1];
   tempNewLocation[2] = game.crew[crew].location[2];
   temp1 = null;
   temp2 = null;
   game.crewLocations[tempNewLocation[0]][tempNewLocation[1]][tempNewLocation[2]][tempNewLocation[3]] = crew;
   returnData = [tempPastLocation,tempCrewArray,tempNewLocation];
   return returnData;
}
function checkThreatActions(fthreat, fthreatTrack)
{
   fx = 1;
   while(fx < 4)
   {
      if(game.threatTracks[fthreatTrack][game.threats[fthreat].range] == fx)
      {
         fc = 0;
         while(fc < game.threats[fthreat]["action" + fx].length)
         {
            if(game.threats[fthreat]["action" + fx][fc][4] == null || game.threats[fthreat]["action" + fx][fc][4] == "damaged" && game.threats[fthreat].HPMAX - game.threats[fthreat].HP >= game.threats[fthreat]["action" + fx][fc][5] || game.threats[fthreat]["action" + fx][fc][4] == "damagedX" && game.threats[fthreat].HPMAX - game.threats[fthreat].HP < game.threats[fthreat]["action" + fx][fc][5])
            {
               trace("THREAT " + game.threats[fthreat].threatName + " ACTION " + fx + " " + game.threats[fthreat]["action" + fx][fc][0]);
               if(game.threats[fthreat]["actionAnim" + fx][fc] != null)
               {
                  game.animation[game.animation.length] = [game.threats[fthreat]["actionAnim" + fx][fc][0],fthreat,game.threats[fthreat]["actionAnim" + fx][fc][1],game.threats[fthreat]["actionAnim" + fx][fc][2],game.threats[fthreat]["actionAnim" + fx][fc][3]];
               }
               executeAction(fthreat,game.threats[fthreat]["action" + fx][fc][0],game.threats[fthreat]["action" + fx][fc][1],game.threats[fthreat]["action" + fx][fc][2],game.threats[fthreat]["action" + fx][fc][3]);
            }
            fc++;
         }
         if(fx == 3 && game.threats[fthreat].threatName != "proxy")
         {
            game.threats[fthreat].status = "survived";
            game.animation[game.animation.length] = ["endThreatMove",fthreat];
         }
      }
      fx++;
   }
}
function doDamageToThreat(threat, damage)
{
   if(game.threats[threat].range != null)
   {
      if(game.threats[threat].cryoshield == true || game.threats[threat].cryoshield == "hit")
      {
         trace("CRYOSHIELD HIT");
         game.threats[threat].cryoshield = "hit";
         damage = 0;
      }
      tempDamage = damage - game.threats[threat].shieldsCurrent;
      game.threats[threat].shieldsCurrent = game.threats[threat].shieldsCurrent - damage;
      if(game.threats[threat].shieldsCurrent < 0)
      {
         game.threats[threat].shieldsCurrent = 0;
      }
      game.animation[game.animation.length] = ["damageThreatShields",threat,game.threats[threat].shieldsCurrent];
      damage = tempDamage;
      if(damage < 0)
      {
         damage = 0;
      }
      if(game.threats[threat].damageLimit[0] != null && damage > 0)
      {
         trace("SWARM!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
         if(game.threats[threat].damageLimit[1] == 0)
         {
            damage = 1;
            game.threats[threat].damageLimit[1] = 1;
         }
         else
         {
            damage = 0;
         }
         trace("SWARM DAMAGE " + damage);
      }
      trace("DAMAGE TO THREAT " + threat + " is " + damage);
      game.threats[threat].HP = game.threats[threat].HP - damage;
      trace("IS THE DAMAGE STAT OK? " + damage);
      HPDisplay = game.threats[threat].HP;
      if(HPDisplay < 1)
      {
         HPDisplay = 0;
      }
      game.animation[game.animation.length] = ["damageThreat",threat,HPDisplay];
      if(game.threats[threat].HP < 1)
      {
         game.animation[game.animation.length] = ["threatDestroyed",threat];
         trace("THREAT " + threat + " DESTROYED!");
         game.threats[threat].HP = 0;
         game.threats[threat].range = null;
         game.threats[threat].status = "destroyed";
         if(game.threats[threat].threatName == "SCOUT" && game.threats[threat].attackBuffOn == true)
         {
            game.attackBuff--;
            game.threats[threat].attackBuffOn = false;
         }
         if(game.threats[threat].threatName == "MARAUDER" && game.threats[threat].shieldBuffOn == true)
         {
            game.shieldBuff--;
            game.threats[threat].shieldBuffOn = false;
            threatsToBuff = [];
            fx = 0;
            while(fx < game.threats.length)
            {
               if(game.threats[fx].range != null && game.threats[fx].internal != true)
               {
                  threatsToBuff[threatsToBuff.length] = [fx,game.threats[fx].shields];
               }
               fx++;
            }
            game.animation[game.animation.length] = ["deBuffShields",threatsToBuff];
         }
         if(game.threats[threat].actionDeath != null)
         {
            fc = 0;
            while(fc < game.threats[threat].actionDeath.length)
            {
               trace("THREAT " + threat + " DEATH ACTION " + game.threats[threat].actionDeath[fc][0]);
               executeAction(threat,game.threats[threat].actionDeath[fc][0],game.threats[threat].actionDeath[fc][1],game.threats[threat].actionDeath[fc][2]);
               fc++;
            }
         }
         if(game.threats[threat].asteroidDamage > 0)
         {
            tempDamage = game.threats[threat].actionTally * game.threats[threat].asteroidDamage;
            trace("*********** DEBRIS DAMAGE ************");
            trace("ACTION TALLY " + game.threats[threat].actionTally);
            game.animation[game.animation.length] = ["debrisAttack",game.threats[threat].zone];
            attack(game.threats[threat].zone,threat,tempDamage,true);
         }
      }
   }
}
function heroicMove(crew, zoneStart, deckStart, zoneEnd, deckEnd)
{
   trace("StartHeroic Move function");
   trace("zone " + game.crew[crew].zone);
   trace("deck " + game.crew[crew].deck);
   game.animation[game.animation.length] = ["playSound","epicMoveSND"];
   game.animation[game.animation.length] = ["heroOn",crew];
   moveData = moveCheck(crew,"wait");
   tempPastLocation = moveData[0];
   tempCrewArray = moveData[1];
   tempNewLocation = moveData[2];
   game.animation[game.animation.length] = ["wait",crew,game.crew[crew].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
   if(deckStart != deckEnd)
   {
      if(game.crew[crew].deck == 0)
      {
         game.crew[crew].deck = 1;
      }
      else
      {
         game.crew[crew].deck = 0;
      }
      trace("DECK CHANGE");
      trace("zone " + game.crew[crew].zone);
      trace("deck " + game.crew[crew].deck);
      moveData = moveCheck(crew,"wait");
      tempPastLocation = moveData[0];
      tempCrewArray = moveData[1];
      tempNewLocation = moveData[2];
      game.animation[game.animation.length] = ["moveDeck",crew,game.crew[crew].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
   }
   if(zoneStart != zoneEnd)
   {
      diff = zoneStart - zoneEnd;
      while(diff != 0)
      {
         if(diff > 0)
         {
            game.crew[crew].zone = game.crew[crew].zone - 1;
         }
         else
         {
            game.crew[crew].zone = game.crew[crew].zone + 1;
         }
         trace("ZONE CHANGE");
         trace("zone " + game.crew[crew].zone);
         trace("deck " + game.crew[crew].deck);
         moveData = moveCheck(game.crewOrder[a],"wait");
         tempPastLocation = moveData[0];
         tempCrewArray = moveData[1];
         tempNewLocation = moveData[2];
         game.animation[game.animation.length] = ["moveZone",crew,game.crew[crew].battleBots,tempNewLocation,tempCrewArray,tempPastLocation];
         if(diff > 0)
         {
            diff--;
         }
         else
         {
            diff++;
         }
      }
   }
}
function varRefresh()
{
   game.threatsLibrary.external = [];
   game.threatsLibrary.external[0] = {threatName:"PULSE BALL",TAG:"E1-01",HPMAX:5,HP:5,shieldsMAX:1,shields:1,speedMAX:2,speed:2,action1:[["attackAllZone",1,true]],action2:[["attackAllZone",1,true]],action3:[["attackAllZone",2,true]],actionAnim1:[["shootBeamWide"]],actionAnim2:[["shootBeamWide"]],actionAnim3:[["shootBeamWide"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[1] = {threatName:"DESTROYER",TAG:"E1-02",HPMAX:5,HP:5,shieldsMAX:2,shields:2,speedMAX:2,speed:2,action1:[["attack",1,true,"double"]],action2:[["attack",2,true,"double"]],action3:[["attack",2,true,"double"]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[2] = {threatName:"STEALTH FIGHTER",TAG:"E1-03",HPMAX:4,HP:4,shieldsMAX:2,shields:2,speedMAX:3,speed:3,action1:[["reveal"]],action2:[["attack",2,true]],action3:[["attack",2,true]],actionAnim1:null,actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:false,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[3] = {threatName:"ENERGY CLOUD",TAG:"E1-04",HPMAX:5,HP:5,shieldsMAX:3,shields:3,speedMAX:2,speed:2,action1:[["drainShields","all","all"]],action2:[["attackOtherZone",1,true]],action3:[["attackOtherZone",2,true]],actionAnim1:[["shootLightning"]],actionAnim2:[["shootLightning"]],actionAnim3:[["shootLightning"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,pulseVulnerable:true,asteroidDamage:0};
   game.threatsLibrary.external[4] = {threatName:"GUNSHIP",TAG:"E1-05",HPMAX:5,HP:5,shieldsMAX:2,shields:2,speedMAX:2,speed:2,action1:[["attack",2,true]],action2:[["attack",2,true]],action3:[["attack",3,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[5] = {threatName:"CRYOSHIELD FIGHTER",TAG:"E1-06",HPMAX:4,HP:4,shieldsMAX:1,shields:1,speedMAX:3,speed:3,action1:[["attack",1,true]],action2:[["attack",2,true]],action3:[["attack",2,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:true,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[6] = {threatName:"FIGHTER",TAG:"E1-07",HPMAX:4,HP:4,shieldsMAX:2,shields:2,speedMAX:3,speed:3,action1:[["attack",1,true]],action2:[["attack",2,true]],action3:[["attack",3,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[7] = {threatName:"ARMORED GRAPLER",TAG:"E1-08",HPMAX:4,HP:4,shieldsMAX:3,shields:3,speedMAX:2,speed:2,action1:[["attack",1,true]],action2:[["heal",1]],action3:[["attack",4,true]],actionAnim1:[["shootBeams"]],actionAnim2:null,actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[8] = {threatName:"AMOEBA",TAG:"E1-09",HPMAX:8,HP:8,shieldsMAX:0,shields:0,speedMAX:2,speed:2,action1:[["heal",2]],action2:[["heal",2]],action3:[["attack",5,true]],actionAnim1:null,actionAnim2:null,actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[9] = {threatName:"METEOROID",TAG:"E1-10",HPMAX:5,HP:5,shieldsMAX:0,shields:0,speedMAX:5,speed:5,action1:[],action2:[],action3:[["attack","HP",true]],actionAnim3:[["impact"]],actionDeath:null,VPsurvive:2,VPkill:4,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[10] = {threatName:"KAMIKAZE",TAG:"E2-01",HPMAX:5,HP:5,shieldsMAX:2,shields:2,speedMAX:4,speed:4,action1:[["speed",1],["shield",1,"set"]],action2:[["speed",1],["shield",0,"set"]],action3:[["attack",6,true]],actionAnim3:[["impact"]],actionDeath:null,VPsurvive:3,VPkill:6,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[11] = {threatName:"SCOUT",TAG:"E2-02",HPMAX:3,HP:3,shieldsMAX:1,shields:1,speedMAX:2,speed:2,action1:[["attackBuff",1]],attackBuffOn:false,action2:[["advanceAllOther"]],action3:[["attack",3,false]],actionAnim1:[["shootBeamPulse"]],actionAnim2:[["shootBeamPulse"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:3,VPkill:6,rocketTargetable:true,HlaserTargetable:false,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[12] = {threatName:"PHANTOM FIGHTER",TAG:"E2-03",HPMAX:3,HP:3,shieldsMAX:3,shields:3,speedMAX:3,speed:3,action1:[["reveal"]],action2:[["attack",2,true]],action3:[["attack",3,true]],actionAnim1:null,actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:3,VPkill:6,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,rocketInvulnerable:true,targetable:false,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[13] = {threatName:"SWARM",TAG:"E2-04",HPMAX:3,HP:3,shieldsMAX:0,shields:0,speedMAX:2,speed:2,action1:[["attack",1,true]],action2:[["attack",2,true],["attackOtherZone",1,true]],action3:[["attack",3,true],["attackOtherZone",2,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"],["shootBeamWide"]],actionAnim3:[["shootBeams"],["shootBeamWide"]],actionDeath:null,VPsurvive:3,VPkill:6,rocketTargetable:false,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:[1,0],asteroidDamage:0};
   game.threatsLibrary.external[14] = {threatName:"JELLYFISH",TAG:"E2-05",HPMAX:13,HP:13,shieldsMAX:-2,shields:-2,speedMAX:2,speed:2,action1:[["attackAllZone",1,true],["heal","half"]],action2:[["attackAllZone",1,true],["heal","half"]],action3:[["attackAllZone",2,true]],actionAnim1:[["shootLightning"]],actionAnim2:[["shootLightning"]],actionAnim3:[["shootLightning"]],actionDeath:null,VPsurvive:3,VPkill:6,rocketTargetable:false,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[15] = {threatName:"MARAUDER",TAG:"E2-06",HPMAX:6,HP:6,shieldsMAX:1,shields:1,speedMAX:3,speed:3,action1:[["shieldBuff",1]],shieldBuffOn:false,action2:[["drainShields","all",1]],action3:[["attack",4,true]],actionAnim1:[["shootBeamPulse"]],actionAnim2:[["shootBeamPulse"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:3,VPkill:6,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[16] = {threatName:"MINOR ASTEROID",TAG:"E2-07",HPMAX:7,HP:7,shieldsMAX:0,shields:0,speedMAX:4,speed:4,action1:[["actionTally"]],action2:[["actionTally"]],action3:[["attack","HP",true]],actionAnim3:[["impact"]],actionDeath:null,VPsurvive:3,VPkill:6,rocketTargetable:false,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:1,actionTally:0};
   game.threatsLibrary.external[17] = {threatName:"FRIGATE",TAG:"SE1-01",HPMAX:7,HP:7,shieldsMAX:2,shields:2,speedMAX:2,speed:2,action1:[["attack",2,true]],action2:[["attack",3,true]],action3:[["attack",4,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:4,VPkill:8,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[18] = {threatName:"MAN-OF-WAR",TAG:"SE1-02",HPMAX:9,HP:9,shieldsMAX:2,shields:2,speedMAX:1,speed:1,action1:[["attack",2,true],["speed",1]],action2:[["attack",3,true],["shield",1]],action3:[["attack",5,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:4,VPkill:8,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[19] = {threatName:"LEVIATHAN TANKER",TAG:"SE1-03",HPMAX:8,HP:8,shieldsMAX:3,shields:3,speedMAX:2,speed:2,action1:[["attack",2,true]],action2:[["attack",2,true],["heal",2]],action3:[["attack",2,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:[["damageThreats",1,true]],VPsurvive:4,VPkill:8,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[20] = {threatName:"PULSE SATELITE",TAG:"SE1-04",HPMAX:4,HP:4,shieldsMAX:2,shields:2,speedMAX:3,speed:3,action1:[["attackAllZone",1,true]],action2:[["attackAllZone",2,true]],action3:[["attackAllZone",3,true]],actionAnim1:[["shootBeamWide"]],actionAnim2:[["shootBeamWide"]],actionAnim3:[["shootBeamWide"]],actionDeath:null,VPsurvive:4,VPkill:8,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:false,cryoshield:false,damageLimit:null,asteroidDamage:0,targetableRange:10};
   game.threatsLibrary.external[21] = {threatName:"CRYOSHIELD FRIGATE",TAG:"SE1-05",HPMAX:7,HP:7,shieldsMAX:1,shields:1,speedMAX:2,speed:2,action1:[["attack",2,true]],action2:[["attack",3,true]],action3:[["attack",4,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:4,VPkill:8,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:true,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[22] = {threatName:"INTERSTELLAR OCTOPUS",TAG:"SE1-06",HPMAX:8,HP:8,shieldsMAX:1,shields:1,speedMAX:2,speed:2,action1:[["attackAllZone",1,true,null,"damaged",1]],action2:[["attackAllZone",2,true,null,"damaged",1]],action3:[["attack","HP2",true]],actionAnim1:[["shootBeamWide"]],actionAnim2:[["shootBeamWide"]],actionAnim3:[["octopusBattle"]],actionDeath:null,VPsurvive:4,VPkill:8,rocketTargetable:false,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[23] = {threatName:"MAELSTROM",TAG:"SE1-07",HPMAX:8,HP:8,shieldsMAX:3,shields:3,speedMAX:2,speed:2,action1:[["drainShields","all","all"]],action2:[["attackOtherZone",2,true]],action3:[["attackOtherZone",3,true]],actionAnim1:[["shootLightning"]],actionAnim2:[["shootLightning"]],actionAnim3:[["shootLightning"]],actionDeath:null,VPsurvive:4,VPkill:8,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,pulseVulnerable:true,asteroidDamage:0};
   game.threatsLibrary.external[24] = {threatName:"ASTEROID",TAG:"SE1-08",HPMAX:9,HP:9,shieldsMAX:0,shields:0,speedMAX:3,speed:3,action1:[["actionTally"]],action2:[["actionTally"]],action3:[["attack","HP",true]],actionAnim3:[["impact"]],actionDeath:null,VPsurvive:4,VPkill:8,rocketTargetable:false,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:2,actionTally:0};
   game.threatsLibrary.external[25] = {threatName:"BEHEMOTH",TAG:"SE2-01",HPMAX:7,HP:7,shieldsMAX:4,shields:4,speedMAX:2,speed:2,action1:[["attack",2,true,null,"damagedX",2]],action2:[["attack",3,true,null,"damagedX",3]],action3:[["attack",6,true,null,"damagedX",6]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:4,VPkill:8,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[26] = {threatName:"JUGGERNAUT",TAG:"SE2-02",HPMAX:10,HP:10,shieldsMAX:3,shields:3,speedMAX:1,speed:1,action1:[["attack",2,true],["speed",2]],action2:[["attack",3,true],["speed",2]],action3:[["attack",7,true]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["shootBeams"]],actionDeath:null,VPsurvive:6,VPkill:12,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[27] = {threatName:"PSIONIC SATELLITE",TAG:"SE2-03",HPMAX:5,HP:5,shieldsMAX:2,shields:2,speedMAX:2,speed:2,action1:[["delay","zone"]],action2:[["delay","ship"]],action3:[["knockout","ship"]],actionAnim1:[["shootBeamPulse"]],actionAnim2:[["shootBeamPulse"]],actionAnim3:[["shootBeamPulse"]],actionDeath:null,VPsurvive:6,VPkill:12,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:false,cryoshield:false,damageLimit:null,asteroidDamage:0,targetableRange:10};
   game.threatsLibrary.external[28] = {threatName:"NEBULA CRAB",TAG:"SE2-04",HPMAX:7,HP:7,shieldsMAX:2,shields:2,speedMAX:2,speed:2,action1:[["shield",4,"set"]],action2:[["shield",2,"set"],["speed",2]],action3:[["attackRedBlue",5,true]],actionAnim3:[["crabBattle"]],actionDeath:null,VPsurvive:6,VPkill:12,rocketTargetable:false,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[29] = {threatName:"NEMESIS",TAG:"SE2-05",HPMAX:9,HP:9,tookDamage:false,shieldsMAX:1,shields:1,speedMAX:3,speed:3,action1:[["attack",1,true],["damageSelf",1]],action2:[["attack",2,true],["damageSelf",2]],action3:[["fissure1"]],actionAnim1:[["shootBeams"]],actionAnim2:[["shootBeams"]],actionAnim3:[["impact"]],actionAnim3:null,actionDeath:null,VPsurvive:0,VPkill:12,rocketTargetable:true,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:0};
   game.threatsLibrary.external[30] = {threatName:"MAJOR ASTEROID",TAG:"SE2-06",HPMAX:11,HP:11,shieldsMAX:0,shields:0,speedMAX:2,speed:2,action1:[["actionTally"]],action2:[["actionTally"]],action3:[["attack","HP",true]],actionAnim3:[["impact"]],actionDeath:null,VPsurvive:6,VPkill:12,rocketTargetable:false,HlaserTargetable:true,PulseTargetable:true,figherTargetable:true,targetable:true,cryoshield:false,damageLimit:null,asteroidDamage:3,actionTally:0};
   game.threatsLibrary.internal = [];
   game.threatsLibrary.internal[0] = {internal:true,threatName:"SKIRMISHERS",TAG:"I1-01",HPMAX:1,HP:1,speedMAX:3,speed:3,zone:0,deck:0,action1:[["move","R"]],action2:[["move","D"]],action3:[["attack",3,false],["hideIntruder"]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:2,VPkill:4,solveAction:"Batt",counterAttack:true,damageLimit:null};
   game.threatsLibrary.internal[1] = {internal:true,threatName:"SKIRMISHERS",TAG:"I1-02",HPMAX:1,HP:1,speed:3,speedMAX:3,zone:2,deck:0,action1:[["move","L"]],action2:[["move","D"]],action3:[["attack",3,false],["hideIntruder"]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:2,VPkill:4,solveAction:"Batt",counterAttack:true,damageLimit:null};
   game.threatsLibrary.internal[2] = {internal:true,threatName:"SABOTEUR",TAG:"I1-03",HPMAX:1,HP:1,speedMAX:4,speed:4,zone:1,deck:1,action1:[["move","R"]],action2:[["drainEnergy",1,null,true]],action3:[["attack",2,false],["hideIntruder"]],actionAnim2:[["intruderAttack",2]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:2,VPkill:4,solveAction:"Batt",counterAttack:false,damageLimit:null};
   game.threatsLibrary.internal[3] = {internal:true,threatName:"SABOTEUR",TAG:"I1-04",HPMAX:1,HP:1,speedMAX:4,speed:4,zone:1,deck:1,action1:[["move","L"]],action2:[["drainEnergy",1,null,true]],action3:[["attack",2,false],["hideIntruder"]],actionAnim2:[["intruderAttack",2]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:2,VPkill:4,solveAction:"Batt",counterAttack:false,damageLimit:null};
   game.threatsLibrary.internal[4] = {internal:true,threatName:"HACKED SHIELDS",TAG:"I1-05",HPMAX:3,HP:3,speedMAX:2,speed:2,zone:2,deck:0,action1:[["drainShields",null,"all"]],action2:[["drainEnergy","all",null,false]],action3:[["attack",2,false]],actionAnim1:[["shootLightning"]],actionAnim2:[["shootLightning"]],actionAnim3:[["internalExplosion",2,0,2]],actionDeath:null,VPsurvive:2,VPkill:4,solveAction:"B",counterAttack:false,damageLimit:null,malfunction:true};
   game.threatsLibrary.internal[5] = {internal:true,threatName:"HACKED SHIELDS",TAG:"I1-06",HPMAX:3,HP:3,speedMAX:2,speed:2,zone:0,deck:0,action1:[["drainShields",null,"all"]],action2:[["drainEnergy","all",null,false]],action3:[["attack",2,false]],actionAnim1:[["shootLightning"]],actionAnim2:[["shootLightning"]],actionAnim3:[["internalExplosion",0,0,2]],actionDeath:null,VPsurvive:2,VPkill:4,solveAction:"B",counterAttack:false,damageLimit:null,malfunction:true};
   game.threatsLibrary.internal[6] = {internal:true,threatName:"UNSTABLE WARHEADS",TAG:"I1-07",HPMAX:3,HP:3,speedMAX:3,speed:3,zone:2,deck:1,action1:null,action2:null,action3:[["destroyRocket","HP"],["attack","HP3",false]],actionDeath:null,VPsurvive:2,VPkill:4,solveAction:"C",counterAttack:false,damageLimit:null,malfunction:true};
   game.threatsLibrary.internal[7] = {internal:true,threatName:"SLIME",TAG:"I2-01",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:3,deck:null,actionDeath:null,VPsurvive:3,VPkill:6,counterAttack:false,damageLimit:null};
   game.threatsLibrary.internal[8] = {internal:true,threatName:"SLIME",TAG:"I2-02",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:3,deck:null,actionDeath:null,VPsurvive:3,VPkill:6,counterAttack:false,damageLimit:null};
   game.threatsLibrary.internal[9] = {internal:true,threatName:"TROOPERS",TAG:"I2-03",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:0,deck:0,action1:[["move","D"]],action2:[["move","R"]],action3:[["attack",4,false],["hideIntruder"]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:3,VPkill:6,solveAction:"Batt",counterAttack:true,damageLimit:null};
   game.threatsLibrary.internal[10] = {internal:true,threatName:"TROOPERS",TAG:"I2-04",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:2,deck:1,action1:[["move","D"]],action2:[["move","L"]],action3:[["attack",4,false],["hideIntruder"]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:3,VPkill:6,solveAction:"Batt",counterAttack:true,damageLimit:null};
   game.threatsLibrary.internal[11] = {internal:true,threatName:"VIRUS",TAG:"I2-05",HPMAX:3,HP:3,speedMAX:3,speed:3,zone:1,deck:0,action1:[["drainEnergy",1,"all"]],action2:[["delay","ship"]],action3:[["attackAllZone",1,false]],actionAnim1:[["shootLightning"]],actionAnim2:[["shootBeamPulse"]],actionAnim3:[["internalExplosion","all","all",3]],actionDeath:null,VPsurvive:3,VPkill:6,solveAction:"C",counterAttack:false,damageLimit:null,malfunction:true};
   game.threatsLibrary.internal[12] = {internal:true,threatName:"OVERHEATED REACTOR",TAG:"I2-06",HPMAX:3,HP:3,speedMAX:2,speed:2,zone:1,deck:1,action1:[["attack","energy",false]],action2:[["fuel",1]],action3:[["attack",3,false]],actionAnim1:[["internalExplosion",1,1,game.ship[1].energy]],actionAnim2:[["shootLightning"]],actionAnim3:[["internalExplosion",1,1,3]],actionDeath:[["internalExplosion",0,1,1],["knockout","deck",0,1],["internalExplosion",2,1,1],["knockout","deck",2,1]],VPsurvive:3,VPkill:6,solveAction:"B",counterAttack:false,damageLimit:null,malfunction:true};
   game.threatsLibrary.internal[13] = {internal:true,threatName:"COMMANDOS",TAG:"SI1-01",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:0,deck:1,action1:[["move","D"]],action2:[["move","R","IFdamaged",2]],action3:[["attack",4,false],["knockout","deck"],["hideIntruder"]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:4,VPkill:8,solveAction:"Batt",counterAttack:true,damageLimit:null};
   game.threatsLibrary.internal[14] = {internal:true,threatName:"COMMANDOS",TAG:"SI1-02",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:2,deck:0,action1:[["move","D"]],action2:[["move","L","IFdamaged",2]],action3:[["attack",4,false],["knockout","deck"],["hideIntruder"]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:4,VPkill:8,solveAction:"Batt",counterAttack:true,damageLimit:null};
   game.threatsLibrary.internal[15] = {internal:true,threatName:"ALIEN",TAG:"SI1-03",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:1,deck:1,action1:[["counterAttack"]],action2:[["move","D"],["attack","player",false]],action3:[["destroyShip"]],actionAnim1:[["growAlien",1]],actionAnim3:[["growAlien",2]],actionDeath:null,VPsurvive:0,VPkill:8,solveAction:"Batt",counterAttack:false,damageLimit:null};
   game.threatsLibrary.internal[16] = {internal:true,threatName:"FISSURE",TAG:"SI1-04",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:0,deck:0,action1:[["doubleDamage",0]],action2:[["doubleDamage",0],["doubleDamage",1],["doubleDamage",2]],action3:[["fissure1"]],actionAnim1:[["fissure1"]],actionAnim2:[["fissure2"]],actionAnim3:[["fissure3"]],actionDeath:[["repairDoubleDamage"]],VPsurvive:null,VPkill:8,solveAction:"C",counterAttack:false,damageLimit:null,malfunction:true};
   game.threatsLibrary.internal[17] = {internal:true,threatName:"CROSSED WIRES",TAG:"SI1-05",HPMAX:4,HP:4,speedMAX:3,speed:3,zone:1,deck:0,action1:[["crossedWires1"]],action2:[["crossedWires2"]],action3:[["crossedWires3"]],actionAnim1:[["shootLightning"]],actionAnim2:[["shootLightning"]],actionAnim3:[["shootLightning"]],actionDeath:null,VPsurvive:4,VPkill:8,solveAction:"B",counterAttack:false,damageLimit:null,malfunction:true};
   game.threatsLibrary.internal[18] = {internal:true,threatName:"BATTLEBOT UPRISING",TAG:"SI1-06",HPMAX:4,HP:4,speedMAX:2,speed:2,zone:0,deck:1,action1:[["battlebotUprising1"]],action2:[["battlebotUprising3"],["knockout","location",0,1],["knockout","location",2,0]],action3:[["battlebotUprising4"],["knockout","location",0,0],["knockout","location",0,1],["knockout","location",1,1],["knockout","location",2,0],["knockout","location",2,1]],actionDeath:[["battlebotUprising5"]],VPsurvive:4,VPkill:8,solveAction:"C",counterAttack:true,damageLimit:null,malfunction:true,location:[null,null],zone0:false,zone2:false};
   game.threatsLibrary.internal[19] = {internal:true,threatName:"EXECUTIONER",TAG:"SI2-01",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:2,deck:0,action1:[["move","L"],["executioner knockout"]],action2:[["move","D"],["executioner knockout"]],action3:[["attack",3,false],["hideIntruder"]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:6,VPkill:12,solveAction:"Batt",counterAttack:true,damageLimit:null};
   game.threatsLibrary.internal[20] = {internal:true,threatName:"SEEKER",TAG:"SI2-02",HPMAX:2,HP:2,speedMAX:2,speed:2,zone:1,deck:0,action1:[["move","seeker"]],action2:[["move","seeker"]],action3:[["attack",5,false],["knockout","deck"]],actionAnim3:[["intruderAttack",1]],actionDeath:null,VPsurvive:6,VPkill:15,solveAction:"Batt",counterAttack:false,damageLimit:null};
   game.threatsLibrary.internal[21] = {internal:true,threatName:"POWER SYSTEM OVERLOAD",TAG:"SI2-03",HPMAX:7,HP:7,speedMAX:3,speed:3,zone:1,deck:1,action1:[["drainEnergy",2,1]],action2:[["drainEnergy",1,"all"]],action3:[["attackAllZone",3,false]],actionAnim1:[["shootLightning"]],actionAnim2:[["shootLightning"]],actionAnim3:[["internalExplosion","all","all",9]],actionDeath:null,VPsurvive:6,VPkill:12,solveAction:"B",counterAttack:false,damageLimit:null,malfunction:true,zone0:false,zone1:false,zone2:false};
   game.threatsLibrary.internal[22] = {internal:true,threatName:"CONTAMINATION",TAG:"SI2-04",HPMAX:3,HP:3,speedMAX:2,speed:2,zone:3,deck:null,actionDeath:null,VPsurvive:6,VPkill:12,solveAction:"Batt",counterAttack:false,damageLimit:null,malfunction:true,children:[]};
   game.threatsLibrary.internal[23] = {internal:true,threatName:"NUCLEAR DEVICE",TAG:"SI2-05",HPMAX:1,HP:1,speedMAX:4,speed:4,zone:1,deck:1,action1:[["speed",1]],action2:[["speed",1]],action3:[["destroyShip"]],actionAnim3:[["fisionSurplus"]],actionDeath:null,VPsurvive:6,VPkill:12,solveAction:"C",counterAttack:false,damageLimit:null,malfunction:true,crewFixes:0};
   game.animation = [];
   game.animationGoal = false;
   game.animationLocation = 0;
   game.animationCurrent = null;
   game.animationTimer = null;
   game.destroyed = false;
   game.mouseLock = null;
   game.currentTurn = 0;
   game.currentPhase = 1;
   game.currentCrew = null;
   game.attackBuff = 0;
   game.shieldBuff = 0;
   game.threats0 = 0;
   game.threats2 = 0;
   game.threats1 = 0;
   game.threats3 = 0;
   game.computerPhase1 = false;
   game.computerPhase2 = false;
   game.computerPhase3 = false;
   game.observationPhase1 = 0;
   game.observationPhase2 = 0;
   game.observationPhase3 = 0;
   game.threatTracks = [];
   game.threatTracksSelecton = [0,1,2,3,4,5,6];
   game.ship[0].doubleDamage = 0;
   game.ship[0].damage = 7;
   game.ship[0].damageChips = [];
   game.ship[0].damageChipsRandomizer = [0,1,2,3,4,5];
   game.ship[0].shields = 1;
   game.ship[0].shieldsMax = 2;
   game.ship[0].energy = 2;
   game.ship[0].energyMax = 3;
   game.ship[0].reactorStauts = "ready";
   game.ship[0].HLaserCanon = 4;
   game.ship[0].HLaserStatus = "ready";
   game.ship[0].HLaserTargets = null;
   game.ship[0].LLaserCanon = 2;
   game.ship[0].LLaserStatus = "ready";
   game.ship[0].LLaserTargets = null;
   game.ship[0].LLaserBat = 1;
   game.ship[0].FighterStatus = "ready";
   game.ship[0].FighterTargets = [];
   game.ship[0].Fighter0Heading = 280;
   game.ship[0].Fighter1Heading = 280;
   game.ship[0].Fighter2Heading = 280;
   game.ship[0].GravChute = "ready";
   game.ship[0].GravChuteDamage = null;
   game.ship[0].hullDamage = null;
   game.ship[0].deck[0] = [];
   game.ship[0].deck[0].A = "normal";
   game.ship[0].deck[0].B = "normal";
   game.ship[0].deck[0].C = "normal";
   game.ship[0].deck[0].knockout = 0;
   game.ship[0].deck[0].delay = 0;
   game.ship[0].deck[0].threats = [null,null];
   game.ship[0].deck[1] = [];
   game.ship[0].deck[1].A = "normal";
   game.ship[0].deck[1].B = "normal";
   game.ship[0].deck[1].C = "normal";
   game.ship[0].deck[1].knockout = 0;
   game.ship[0].deck[1].delay = 0;
   game.ship[0].deck[1].threats = [null,null];
   game.ship[1].doubleDamage = 0;
   game.ship[1].damage = 7;
   game.ship[1].damageChips = [];
   game.ship[1].damageChipsRandomizer = [0,1,2,3,4,5];
   game.ship[1].shields = 1;
   game.ship[1].shieldsMax = 3;
   game.ship[1].energy = 3;
   game.ship[1].energyMax = 5;
   game.ship[1].reactorStauts = "ready";
   game.ship[1].fuelCells = 3;
   game.ship[1].HLaserCanon = 5;
   game.ship[1].HLaserStatus = "ready";
   game.ship[1].HLaserTargets = null;
   game.ship[1].PulseCanon = 1;
   game.ship[1].PulseCannonRange = 10;
   game.ship[1].PulseStatus = "ready";
   game.ship[1].PulseTargets = [];
   game.ship[1].ScreenSaverStatus = active;
   game.ship[1].VisualConfirmation = 0;
   game.ship[1].BattleBots = null;
   game.ship[1].GravChute = "ready";
   game.ship[1].GravChuteDamage = null;
   game.ship[1].hullDamage = null;
   game.ship[1].deck[0] = [];
   game.ship[1].deck[0].A = "normal";
   game.ship[1].deck[0].B = "normal";
   game.ship[1].deck[0].C = "normal";
   game.ship[1].deck[0].knockout = 0;
   game.ship[1].deck[0].delay = 0;
   game.ship[1].deck[0].threats = [null,null];
   game.ship[1].deck[1] = [];
   game.ship[1].deck[1].A = "normal";
   game.ship[1].deck[1].B = "normal";
   game.ship[1].deck[1].C = "normal";
   game.ship[1].deck[1].knockout = 0;
   game.ship[1].deck[1].delay = 0;
   game.ship[1].deck[1].threats = [null,null];
   game.ship[2].doubleDamage = 0;
   game.ship[2].damage = 7;
   game.ship[2].damageChips = [];
   game.ship[2].damageChipsRandomizer = [0,1,2,3,4,5];
   game.ship[2].shields = 1;
   game.ship[2].shieldsMax = 2;
   game.ship[2].energy = 2;
   game.ship[2].energyMax = 3;
   game.ship[2].reactorStauts = "ready";
   game.ship[2].HLaserCanon = 4;
   game.ship[2].HLaserStatus = "ready";
   game.ship[2].HLaserTargets = null;
   game.ship[2].LLaserCanon = 2;
   game.ship[2].LLaserStatus = "ready";
   game.ship[2].LLaserTargets = null;
   game.ship[2].LLaserBat = 1;
   game.ship[2].Rockets = 3;
   game.ship[2].RocketsStatus = "ready";
   game.ship[2].RocketsTargets = null;
   game.ship[2].RocketsDeployed = false;
   game.ship[2].GravChute = "ready";
   game.ship[2].GravChuteDamage = null;
   game.ship[2].hullDamage = null;
   game.ship[2].deck[0] = [];
   game.ship[2].deck[0].A = "normal";
   game.ship[2].deck[0].B = "normal";
   game.ship[2].deck[0].C = "normal";
   game.ship[2].deck[0].knockout = 0;
   game.ship[2].deck[0].delay = 0;
   game.ship[2].deck[0].threats = [null,null];
   game.ship[2].deck[1] = [];
   game.ship[2].deck[1].A = "normal";
   game.ship[2].deck[1].B = "normal";
   game.ship[2].deck[1].C = "normal";
   game.ship[2].deck[1].knockout = 0;
   game.ship[2].deck[1].delay = 0;
   game.ship[2].deck[1].threats = [null,null];
   game.threats = [];
   fa = 0;
   while(fa < 5)
   {
      game.crew[fa].zone = 1;
      game.crew[fa].deck = 0;
      game.crew[fa].crewStatus = "active";
      game.crew[fa].battleBots = null;
      game.crew[fa].actions = ["-","-","-","-","-","-","-","-","-","-","-","-"];
      game.crew[fa].observe = false;
      game.crew[fa].location = [1,0,"wait"];
      fa++;
   }
   fs = 0;
   while(fs < 3)
   {
      game.crewLocations[fs] = [];
      fu = 0;
      while(fu < 2)
      {
         game.crewLocations[fs][fu] = {A:[],B:[],C:[],wait:[]};
         fu++;
      }
      fs++;
   }
}
function varInit()
{
   game = {pauseGame:false,animation:[],animationGoal:false,animationLocation:0,animationCurrent:null,animationTimer:null,destroyed:false,crewLocations:[],coordinateLocations:[],crewOrder:[],mouseLock:null,crewSelection:[],ship:[],crew:[],tempCrewData:[],battleBots:[],currentTurn:0,currentPhase:1,currentCrew:null,threats:[],attackBuff:0,shieldBuff:0,threats0:0,threats2:0,threats1:0,threats3:0,computerPhase1:false,computerPhase2:false,computerPhase3:false,observationPhase1:0,observationPhase2:0,observationPhase3:0,threatsLibrary:[],threatTracks:[],threatTracksSelecton:[0,1,2,3,4,5,6],threatTracksLibrary:[[3,0,0,0,1,0,0,0,0,0],[3,0,0,0,0,0,0,1,0,0,0],[3,0,2,0,0,0,0,1,0,0,0,0],[3,0,0,0,2,0,0,0,1,0,0,0,0],[3,0,0,0,0,0,2,0,0,0,1,0,0,0],[3,0,2,0,0,0,2,0,0,1,0,0,0,0,0],[3,0,0,0,2,0,0,2,0,0,0,1,0,0,0,0]],VPs:[]};
   game.ship[0] = {deck:[],doubleDamage:0,damage:7,damageChips:[],damageChipsRandomizer:[0,1,2,3,4,5],damageChipsLibrary:["shield","HLaser","hull","gravChute","LLaser","energy"],damageInflict:[],damageInflicted:[],shields:1,shieldsMax:2,energy:2,energyMax:3,reactorStauts:"ready",HLaserCanon:4,HLaserStatus:"ready",HLaserTargets:null,LLaserCanon:2,LLaserStatus:"ready",LLaserTargets:null,LLaserBat:1,battleBots:0,FighterStatus:"ready",FighterTargets:[],Fighter0Heading:280,Fighter1Heading:280,Fighter2Heading:280,GravChute:"ready",GravChuteDamage:null,hullDamage:null};
   game.ship[0].deck[0] = [];
   game.ship[0].deck[0].A = "normal";
   game.ship[0].deck[0].B = "normal";
   game.ship[0].deck[0].C = "normal";
   game.ship[0].deck[0].knockout = 0;
   game.ship[0].deck[0].delay = 0;
   game.ship[0].deck[0].threats = [null,null];
   game.ship[0].deck[1] = [];
   game.ship[0].deck[1].A = "normal";
   game.ship[0].deck[1].B = "normal";
   game.ship[0].deck[1].C = "normal";
   game.ship[0].deck[1].knockout = 0;
   game.ship[0].deck[1].delay = 0;
   game.ship[0].deck[1].threats = [null,null];
   game.ship[1] = {deck:[],doubleDamage:0,damage:7,damageChips:[],damageChipsRandomizer:[0,1,2,3,4,5],damageChipsLibrary:["HLaser","shield","hull","gravChute","pulseCannon","energy"],damageInflict:[],damageInflicted:[],shields:1,shieldsMax:3,energy:3,energyMax:5,reactorStauts:"ready",fuelCells:3,HLaserCanon:5,HLaserStatus:"ready",HLaserTargets:null,PulseCanon:1,PulseCannonRange:10,PulseStatus:"ready",PulseTargets:[],ScreenSaverStatus:active,VisualConfirmation:0,BattleBots:null,GravChute:"ready",GravChuteDamage:null,hullDamage:null};
   game.ship[1].deck[0] = [];
   game.ship[1].deck[0].A = "normal";
   game.ship[1].deck[0].B = "normal";
   game.ship[1].deck[0].C = "normal";
   game.ship[1].deck[0].knockout = 0;
   game.ship[1].deck[0].delay = 0;
   game.ship[1].deck[0].threats = [null,null];
   game.ship[1].deck[1] = [];
   game.ship[1].deck[1].A = "normal";
   game.ship[1].deck[1].B = "normal";
   game.ship[1].deck[1].C = "normal";
   game.ship[1].deck[1].knockout = 0;
   game.ship[1].deck[1].delay = 0;
   game.ship[1].deck[1].threats = [null,null];
   game.ship[2] = {deck:[],doubleDamage:0,damage:7,damageChips:[],damageChipsRandomizer:[0,1,2,3,4,5],damageChipsLibrary:["HLaser","shield","gravChute","hull","energy","LLaser"],damageInflict:[],damageInflicted:[],shields:1,shieldsMax:2,energy:2,energyMax:3,reactorStauts:"ready",HLaserCanon:4,HLaserStatus:"ready",HLaserTargets:null,LLaserCanon:2,LLaserStatus:"ready",LLaserTargets:null,LLaserBat:1,battleBots:1,Rockets:3,RocketsStatus:"ready",RocketsTargets:null,RocketsDeployed:false,GravChute:"ready",GravChuteDamage:null,hullDamage:null};
   game.ship[2].deck[0] = [];
   game.ship[2].deck[0].A = "normal";
   game.ship[2].deck[0].B = "normal";
   game.ship[2].deck[0].C = "normal";
   game.ship[2].deck[0].knockout = 0;
   game.ship[2].deck[0].delay = 0;
   game.ship[2].deck[0].threats = [null,null];
   game.ship[2].deck[1] = [];
   game.ship[2].deck[1].A = "normal";
   game.ship[2].deck[1].B = "normal";
   game.ship[2].deck[1].C = "normal";
   game.ship[2].deck[1].knockout = 0;
   game.ship[2].deck[1].delay = 0;
   game.ship[2].deck[1].threats = [null,null];
   game.tempCrewData[0] = {crewRank:"CAPTAIN",crewName:"Player 1"};
   game.tempCrewData[1] = {crewRank:"COMMS",crewName:"Player 2"};
   game.tempCrewData[2] = {crewRank:"SECUIRTY",crewName:"Player 3"};
   game.tempCrewData[3] = {crewRank:"ENGINEERING",crewName:"Player 4"};
   game.tempCrewData[4] = {crewRank:"ANDROID",crewName:"Player 5"};
   fs = 0;
   while(fs < 3)
   {
      game.crewLocations[fs] = [];
      fu = 0;
      while(fu < 2)
      {
         game.crewLocations[fs][fu] = {A:[],B:[],C:[],wait:[]};
         fu++;
      }
      fs++;
   }
   fs = 0;
   while(fs < 3)
   {
      game.coordinateLocations[fs] = [];
      fu = 0;
      while(fu < 2)
      {
         game.coordinateLocations[fs][fu] = {A:[],B:[],C:[],wait0:[],wait1:[],wait2:[],wait3:[],wait4:[],center:[]};
         fu++;
      }
      fs++;
   }
   game.coordinateLocations[0][0].A0 = [162,146];
   game.coordinateLocations[0][0].A1 = [167,146];
   game.coordinateLocations[0][0].A2 = [170,146];
   game.coordinateLocations[0][0].A3 = [173,146];
   game.coordinateLocations[0][0].A4 = [176,146];
   game.coordinateLocations[0][0].B0 = [101,165];
   game.coordinateLocations[0][0].B1 = [106,165];
   game.coordinateLocations[0][0].B2 = [111,165];
   game.coordinateLocations[0][0].B3 = [116,165];
   game.coordinateLocations[0][0].B4 = [121,165];
   game.coordinateLocations[0][0].C0 = [103,217];
   game.coordinateLocations[0][0].C1 = [108,217];
   game.coordinateLocations[0][0].C2 = [113,217];
   game.coordinateLocations[0][0].C3 = [118,217];
   game.coordinateLocations[0][0].C4 = [123,217];
   game.coordinateLocations[0][0].wait0 = [166,177];
   game.coordinateLocations[0][0].wait1 = [177,192];
   game.coordinateLocations[0][0].wait2 = [185,169];
   game.coordinateLocations[0][0].wait3 = [147,169];
   game.coordinateLocations[0][0].wait4 = [139,192];
   game.coordinateLocations[0][0].grav = [166,222,227,482];
   game.coordinateLocations[0][0].door = [230,151];
   game.coordinateLocations[0][0].damage = [];
   game.coordinateLocations[0][0].damage.shield = [52,98];
   game.coordinateLocations[0][0].damage.energy = [97,265];
   game.coordinateLocations[0][0].damage.gravChute = [144,212];
   game.coordinateLocations[0][0].damage.HLaser = [129,76];
   game.coordinateLocations[0][0].damage.hull = [11,113];
   game.coordinateLocations[0][0].damage.LLaser = [5,224];
   game.coordinateLocations[0][0].damageLocation = [];
   game.coordinateLocations[0][0].damageLocation.shield = [97,127];
   game.coordinateLocations[0][0].damageLocation.energy = [117,297];
   game.coordinateLocations[0][0].damageLocation.gravChute = [165,235];
   game.coordinateLocations[0][0].damageLocation.HLaser = [165,105];
   game.coordinateLocations[0][0].damageLocation.hull = [164,164];
   game.coordinateLocations[0][0].damageLocation.LLaser = [43,253];
   game.coordinateLocations[0][0].weapon = [];
   game.coordinateLocations[0][0].weapon.HLaser = [164,57];
   game.coordinateLocations[0][0].weapon.LLaser = [36,224,50,224];
   game.coordinateLocations[0][0].center = [165,166];
   game.coordinateLocations[1][0].A0 = [296,98];
   game.coordinateLocations[1][0].A1 = [301,98];
   game.coordinateLocations[1][0].A2 = [306,98];
   game.coordinateLocations[1][0].A3 = [311,98];
   game.coordinateLocations[1][0].A4 = [316,98];
   game.coordinateLocations[1][0].B0 = [362,120];
   game.coordinateLocations[1][0].B1 = [367,120];
   game.coordinateLocations[1][0].B2 = [372,120];
   game.coordinateLocations[1][0].B3 = [377,120];
   game.coordinateLocations[1][0].B4 = [382,120];
   game.coordinateLocations[1][0].C0 = [227,120];
   game.coordinateLocations[1][0].C1 = [232,120];
   game.coordinateLocations[1][0].C2 = [237,120];
   game.coordinateLocations[1][0].C3 = [242,120];
   game.coordinateLocations[1][0].C4 = [247,120];
   game.coordinateLocations[1][0].wait0 = [296,132];
   game.coordinateLocations[1][0].wait1 = [323,147];
   game.coordinateLocations[1][0].wait2 = [315,124];
   game.coordinateLocations[1][0].wait3 = [277,124];
   game.coordinateLocations[1][0].wait4 = [269,147];
   game.coordinateLocations[1][0].grav = [295,175,357,434];
   game.coordinateLocations[1][0].damage = [];
   game.coordinateLocations[1][0].damage.shield = [358,42];
   game.coordinateLocations[1][0].damage.energy = [275,238];
   game.coordinateLocations[1][0].damage.gravChute = [275,164];
   game.coordinateLocations[1][0].damage.HLaser = [275,15];
   game.coordinateLocations[1][0].damage.hull = [210,15];
   game.coordinateLocations[1][0].damage.pulseCannon = [275,385];
   game.coordinateLocations[1][0].damageLocation = [];
   game.coordinateLocations[1][0].damageLocation.shield = [360,80];
   game.coordinateLocations[1][0].damageLocation.energy = [295,270];
   game.coordinateLocations[1][0].damageLocation.gravChute = [295,189];
   game.coordinateLocations[1][0].damageLocation.HLaser = [295,56];
   game.coordinateLocations[1][0].damageLocation.hull = [295,118];
   game.coordinateLocations[1][0].damageLocation.pulseCannon = [295,341];
   game.coordinateLocations[1][0].weapon = [];
   game.coordinateLocations[1][0].weapon.HLaser = [295,9];
   game.coordinateLocations[1][0].weapon.pulseCannon = [0,0];
   game.coordinateLocations[1][0].center = [295,111];
   game.coordinateLocations[2][0].A0 = [424,145];
   game.coordinateLocations[2][0].A1 = [429,145];
   game.coordinateLocations[2][0].A2 = [434,145];
   game.coordinateLocations[2][0].A3 = [439,145];
   game.coordinateLocations[2][0].A4 = [444,145];
   game.coordinateLocations[2][0].B0 = [492,165];
   game.coordinateLocations[2][0].B1 = [497,165];
   game.coordinateLocations[2][0].B2 = [502,165];
   game.coordinateLocations[2][0].B3 = [507,165];
   game.coordinateLocations[2][0].B4 = [512,165];
   game.coordinateLocations[2][0].C0 = [362,215];
   game.coordinateLocations[2][0].C1 = [367,215];
   game.coordinateLocations[2][0].C2 = [372,215];
   game.coordinateLocations[2][0].C3 = [377,215];
   game.coordinateLocations[2][0].C4 = [382,215];
   game.coordinateLocations[2][0].wait0 = [425,174];
   game.coordinateLocations[2][0].wait1 = [452,189];
   game.coordinateLocations[2][0].wait2 = [444,166];
   game.coordinateLocations[2][0].wait3 = [406,166];
   game.coordinateLocations[2][0].wait4 = [398,189];
   game.coordinateLocations[2][0].grav = [425,222,487,482];
   game.coordinateLocations[2][0].door = [358,151];
   game.coordinateLocations[2][0].damage = [];
   game.coordinateLocations[2][0].damage.shield = [500,98];
   game.coordinateLocations[2][0].damage.energy = [453,265];
   game.coordinateLocations[2][0].damage.gravChute = [405,212];
   game.coordinateLocations[2][0].damage.HLaser = [427,67];
   game.coordinateLocations[2][0].damage.hull = [533,113];
   game.coordinateLocations[2][0].damage.LLaser = [541,224];
   game.coordinateLocations[2][0].damageLocation = [];
   game.coordinateLocations[2][0].damageLocation.shield = [490,127];
   game.coordinateLocations[2][0].damageLocation.energy = [472,297];
   game.coordinateLocations[2][0].damageLocation.gravChute = [423,235];
   game.coordinateLocations[2][0].damageLocation.HLaser = [424,105];
   game.coordinateLocations[2][0].damageLocation.hull = [423,164];
   game.coordinateLocations[2][0].damageLocation.LLaser = [547,253];
   game.coordinateLocations[2][0].weapon = [];
   game.coordinateLocations[2][0].weapon.HLaser = [424,57];
   game.coordinateLocations[2][0].weapon.LLaser = [540,224,554,224];
   game.coordinateLocations[2][0].center = [427,166];
   game.coordinateLocations[0][1].A0 = [43,298];
   game.coordinateLocations[0][1].A1 = [48,298];
   game.coordinateLocations[0][1].A2 = [53,298];
   game.coordinateLocations[0][1].A3 = [58,298];
   game.coordinateLocations[0][1].A4 = [63,298];
   game.coordinateLocations[0][1].B0 = [117,341];
   game.coordinateLocations[0][1].B1 = [122,341];
   game.coordinateLocations[0][1].B2 = [127,341];
   game.coordinateLocations[0][1].B3 = [132,341];
   game.coordinateLocations[0][1].B4 = [137,341];
   game.coordinateLocations[0][1].C0 = [228,371];
   game.coordinateLocations[0][1].C1 = [233,371];
   game.coordinateLocations[0][1].C2 = [238,371];
   game.coordinateLocations[0][1].C3 = [243,371];
   game.coordinateLocations[0][1].C4 = [248,371];
   game.coordinateLocations[0][1].wait0 = [184,315];
   game.coordinateLocations[0][1].wait1 = [211,330];
   game.coordinateLocations[0][1].wait2 = [203,307];
   game.coordinateLocations[0][1].wait3 = [165,307];
   game.coordinateLocations[0][1].wait4 = [157,330];
   game.coordinateLocations[0][1].grav = [166,277,227,537];
   game.coordinateLocations[0][1].door = [231,311];
   game.coordinateLocations[0][1].center = [124,310];
   game.coordinateLocations[1][1].A0 = [295,351];
   game.coordinateLocations[1][1].A1 = [300,351];
   game.coordinateLocations[1][1].A2 = [305,351];
   game.coordinateLocations[1][1].A3 = [310,351];
   game.coordinateLocations[1][1].A4 = [315,351];
   game.coordinateLocations[1][1].B0 = [296,315];
   game.coordinateLocations[1][1].B1 = [301,315];
   game.coordinateLocations[1][1].B2 = [306,315];
   game.coordinateLocations[1][1].B3 = [311,315];
   game.coordinateLocations[1][1].B4 = [316,315];
   game.coordinateLocations[1][1].C0 = [233,280];
   game.coordinateLocations[1][1].C1 = [238,280];
   game.coordinateLocations[1][1].C2 = [243,280];
   game.coordinateLocations[1][1].C3 = [248,280];
   game.coordinateLocations[1][1].C4 = [253,280];
   game.coordinateLocations[1][1].wait0 = [296,271];
   game.coordinateLocations[1][1].wait1 = [323,286];
   game.coordinateLocations[1][1].wait2 = [315,263];
   game.coordinateLocations[1][1].wait3 = [277,263];
   game.coordinateLocations[1][1].wait4 = [269,286];
   game.coordinateLocations[1][1].grav = [295,231,357,490];
   game.coordinateLocations[1][1].center = [295,263];
   game.coordinateLocations[2][1].A0 = [547,298];
   game.coordinateLocations[2][1].A1 = [552,298];
   game.coordinateLocations[2][1].A2 = [557,298];
   game.coordinateLocations[2][1].A3 = [562,298];
   game.coordinateLocations[2][1].A4 = [567,298];
   game.coordinateLocations[2][1].B0 = [473,341];
   game.coordinateLocations[2][1].B1 = [478,341];
   game.coordinateLocations[2][1].B2 = [483,341];
   game.coordinateLocations[2][1].B3 = [488,341];
   game.coordinateLocations[2][1].B4 = [493,341];
   game.coordinateLocations[2][1].C0 = [360,371];
   game.coordinateLocations[2][1].C1 = [365,371];
   game.coordinateLocations[2][1].C2 = [370,371];
   game.coordinateLocations[2][1].C3 = [375,371];
   game.coordinateLocations[2][1].C4 = [380,371];
   game.coordinateLocations[2][1].wait0 = [404,315];
   game.coordinateLocations[2][1].wait1 = [431,324];
   game.coordinateLocations[2][1].wait2 = [423,307];
   game.coordinateLocations[2][1].wait3 = [412,307];
   game.coordinateLocations[2][1].wait4 = [377,330];
   game.coordinateLocations[2][1].grav = [425,277,487,537];
   game.coordinateLocations[2][1].door = [358,311];
   game.coordinateLocations[2][1].center = [463,310];
   game.coordinateLocations.rocket0 = [604,600];
   game.coordinateLocations.rocket1 = [617,589];
   game.coordinateLocations.rocket2 = [629,576];
   game.coordinateLocations.battlebots0 = [144,640];
   game.coordinateLocations.battlebots1 = [573,488];
   game.coordinateLocations.fighter0 = [87,433];
   game.coordinateLocations.fighter1 = [140,422];
   game.coordinateLocations.fighter2 = [117,405];
   game.coordinateLocations[0][0].fighterZone0 = [64,228];
   game.coordinateLocations[0][0].fighterZone1 = [298,228];
   game.coordinateLocations[0][0].fighterZone2 = [513,224];
   game.crew[0] = {color:null,crewRank:"CAPTAIN",crewName:"PLAYER 1",actions:["-","-","-","-","-","-","-","-","-","-","-","-"],zone:1,deck:0,crewStatus:"active",battleBots:null,observe:false,location:[1,0,"wait"]};
   game.crew[1] = {color:null,crewRank:"COMMS",crewName:"PLAYER 2",actions:["-","-","-","-","-","-","-","-","-","-","-","-"],zone:1,deck:0,crewStatus:"active",battleBots:null,observe:false,location:[1,0,"wait"]};
   game.crew[2] = {color:null,crewRank:"SECUIRTY",crewName:"PLAYER 3",actions:["-","-","-","-","-","-","-","-","-","-","-","-"],zone:1,deck:0,crewStatus:"active",battleBots:null,observe:false,location:[1,0,"wait"]};
   game.crew[3] = {color:null,crewRank:"ENGINEERING",crewName:"PLAYER 4",actions:["-","-","-","-","-","-","-","-","-","-","-","-"],zone:1,deck:0,crewStatus:"active",battleBots:null,observe:false,location:[1,0,"wait"]};
   game.crew[4] = {color:null,crewRank:"ANDROID",crewName:"PLAYER 5",actions:["-","-","-","-","-","-","-","-","-","-","-","-"],zone:1,deck:0,crewStatus:"active",battleBots:null,observe:false,location:[1,0,"wait"]};
   game.battleBots[0] = {crew:null,status:"ready"};
   game.battleBots[1] = {crew:null,status:"ready"};
}
