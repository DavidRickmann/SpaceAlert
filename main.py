
import Player

#Set Up Game

#How many players:
NumPlayers = int(input("How Many Players? "))


#Define Players
PlayerList = []

for x in range(0, NumPlayers):
    PlayerName = input("Enter Player " + str(x+1) + " Name: ")
    PlayerColour = input("Enter Player " + str(x+1) + " Colour: ")
    PlayerList.append(Player.Player(PlayerName, PlayerColour))

    print(PlayerList[x].Colour + " Player is called " + PlayerList[x].PlayerName)


#Some test stuff
print("Turn One")
print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")

print("Taking Lift")
PlayerList[0].move("lift")
print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")

print("Moving Blue")
PlayerList[0].move("blue")
print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")

print("Moving Blue")
PlayerList[0].move("blue")
print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")

print("Moving Red")
PlayerList[0].move("red")
print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")

print("Moving Red")
PlayerList[0].move("red")
print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")

print("Moving Red")
PlayerList[0].move("red")
print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")

print("Taking Lift")
PlayerList[0].move("lift")
print("The " + PlayerList[0].Colour + " player is on the " + PlayerList[0].Location + " " + PlayerList[0].Deck + " deck")
