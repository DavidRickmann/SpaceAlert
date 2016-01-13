
import Player
#check python version
#I guess this is in Python 2.7


print "Space Alert Processor"
print " "


#Set Up Game

#How many players:
NumPlayers = int(input("How Many Players? "))
NumTurns = 2

#Define Players
PlayerList = []
   
for x in range(0, NumPlayers):
    PlayerName = raw_input('Enter Player Name: ')
    PlayerColour = raw_input('Enter Player ' + str(x+1) + ' Colour: ')
    PlayerList.append(Player.Player(PlayerName, PlayerColour))

    print(PlayerList[x].Colour + " Player is called " + PlayerList[x].PlayerName)

#populate action list    
for x in range(0,NumTurns): 
    Action = raw_input('Choose action for turn ' + str(x) + ': ')
    PlayerList[0].Turn[str(x)] = Action
    print PlayerList[0].Turn[str(x)]


#Some test stuff
for x in range(0,NumTurns):
    print("Turn " + str(x+1))
    print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")
    print("The " + PlayerList[0].Colour + " player chooses action " +  PlayerList[0].Turn[str(x)])
    
    if PlayerList[0].Turn[str(x)] == 'red':
        print("action was red")
        PlayerList[0].movered
    if PlayerList[0].Turn[str(x)] == "blue":
        print("action was blue")
        PlayerList[0].moveblue



print("done")
    
