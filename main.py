
import Player
#check python version
#I guess this is in Python 2.7


print "Space Alert Processor"
print " "


#Set Up Game

#How many players:
NumPlayers = int(input("How Many Players? "))


#Define Players
PlayerList = []
   
for x in range(0, NumPlayers):
    PlayerName = raw_input('Enter Player Name: ')
    PlayerColour = raw_input('Enter Player ' + str(x+1) + ' Colour: ')
    PlayerList.append(Player.Player(PlayerName, PlayerColour))

    print(PlayerList[x].Colour + " Player is called " + PlayerList[x].PlayerName)

  
    
for x in range(0,13):
    Action = raw_input('Choose action for turn ' + str(x) + ': ')
    PlayerList[0].Turn[str(x)] = Action
    print PlayerList[0].Turn[str(x)]

print PlayerList[0].Turn
    
#Some test stuff
for x in range(0,13):
    print("Turn " + str(x+1))
    print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")

    print("The " + PlayerList[0].Colour + "chooses action " +  PlayerList[0].Turn[str(x)])
    
    
