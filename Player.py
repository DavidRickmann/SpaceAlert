
class Player(object):
#Player
#
#This class keeps all the info of what the player is doing, and the moves made.
#So, Player.goRed will update the players location one space in the red direction.
#Player.Location will return the players location.
#
#Later on will add specializations in here, to be loaded from file.
#(Also things like character names etc, which are only useful in expansion)
#

    def __init__(self, PlayerName, Colour):
        self.PlayerName = PlayerName
        self.Colour = Colour
        self.Location = "white"
        self.Deck = "top"

    def getPlayerName(self):
        return self.PlayerName

    def getColour(self):
        return self.Colour

    def moveblue(self):
        NewLocation = {
            "blue": "blue",
            "white": "blue",
            "red": "white"}
    
        self.Location = str(NewLocation.get(self.Location))

    def movered(self):
        NewLocation = {
            "blue": "white",
            "white": "red",
            "red": "red"}
    
        self.Location = str(NewLocation.get(self.Location))

    def takelift(self):
        
        NewDeck = {'top': 'bottom', 'bottom': 'top'}
        self.Deck = str(NewDeck.get(self.Deck))


    def errhandler(self):
        print("Your input has not been recognised")

    def move(self, direction):
        
        #set up dictionary of moves
        takeaction = {
            "blue": self.moveblue,
            "red": self.movered,
            "lift": self.takelift}
    
        takeaction.get(direction,self.errhandler)()

    