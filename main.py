
#imports
import Tkinter as tk
import Player


class Starbase(tk.Tk):
    def __init__(self,parent):
        tk.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        container = tk.Frame(self)
        container.pack(side="top", fill="both", expand=True)
        
        #set up window properties and initial focus
        self.geometry('600x250')
        self.resizable(True,True)
        
        container.grid_columnconfigure(0,weight=1)    
        container.grid_rowconfigure(0, weight=1)        
        
        self.frames={}
        for F in (scrMenu, scrBarracks, scrSimulator):
            frame = F(container, self)
            self.frames[F] = frame
            
            frame.grid(row=0, column=0, sticky="nsew")
        
        self.show_frame(scrMenu)
        
    def show_frame(self, cont):
    
        frame = self.frames[cont]
        frame.tkraise()

#Definition of gui Screens
class scrMenu(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
                
        #set up window properties and initial focus
        
        self.grid()
        self.grid_columnconfigure(0,weight=1)
        self.grid_columnconfigure(1,weight=3) #button
        self.grid_columnconfigure(2,weight=1)
        self.grid_columnconfigure(3,weight=3) #button
        self.grid_columnconfigure(4,weight=1)
        self.grid_columnconfigure(5,weight=3) #button
        self.grid_columnconfigure(6,weight=1)
    
        
        self.grid_rowconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=2) #title
        self.grid_rowconfigure(2, weight=1)
        self.grid_rowconfigure(3, weight=2) #button
        self.grid_rowconfigure(4, weight=1)
        self.grid_rowconfigure(5, weight=2) #button
        self.grid_rowconfigure(6, weight=1)
        
            
        
        #Title
        
        Title = tk.Label(self, text="Space Alert : Starbase", bg="black", fg="green",bd=2, font="courier", relief="groove")
        Title.grid(column = 1 , row = 1,columnspan =5, sticky = 'nsew')
        
        #text box properties
        #set up text box variable and initialise it
        #self.entryVariable = tk.StringVar()
        #self.entryVariable.set(u"Enter text here.")
        
        #button properties
        button1 = tk.Button(self,text=u"Barracks", width = 1, command=lambda: controller.show_frame(scrBarracks))
        button1.grid(column = 1,row=3, sticky = 'nsew')

        button2 = tk.Button(self,text=u"Training", width = 1, command=lambda: controller.show_frame(scrBarracks))
        button2.grid(column = 3,row=3, sticky = 'nsew')

        button2 = tk.Button(self,text=u"Simulator", width = 1, command=lambda: controller.show_frame(scrSimulator))
        button2.grid(column = 5,row=3, sticky = 'nsew')

        button1 = tk.Button(self,text=u"Library", width = 1, command=lambda: controller.show_frame(scrBarracks))
        button1.grid(column = 1,row=5, sticky = 'nsew')

        button2 = tk.Button(self,text=u"Launch Bay", width = 1, command=lambda: controller.show_frame(scrBarracks))
        button2.grid(column = 3,row=5, sticky = 'nsew')

        button2 = tk.Button(self,text=u"Administration", width = 1, command=lambda: controller.show_frame(scrBarracks))
        button2.grid(column = 5,row=5, sticky = 'nsew')
        
       




class scrBarracks(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        
                #set up window properties and initial focus
        
        self.grid()
        self.grid_columnconfigure(0,weight=1)
        self.grid_columnconfigure(1,weight=3) #button
        self.grid_columnconfigure(2,weight=1)
        self.grid_columnconfigure(3,weight=3) #button
        self.grid_columnconfigure(4,weight=1)
        self.grid_columnconfigure(5,weight=3) #button
        self.grid_columnconfigure(6,weight=1)
    
        
        self.grid_rowconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=2) #title
        self.grid_rowconfigure(2, weight=1)
        self.grid_rowconfigure(3, weight=2) #button
        self.grid_rowconfigure(4, weight=1)
        self.grid_rowconfigure(5, weight=2) #button
        self.grid_rowconfigure(6, weight=1)
         
        
        #Title
        
        Title = tk.Label(self, text="Barracks", bg="black", fg="green",bd=2, font="courier", relief="groove")
        Title.grid(column = 1 , row = 1,columnspan =5, sticky = 'nsew')
               
       
        btnReturn = tk.Button(self, text="Done", command=lambda: controller.show_frame(scrMenu))
        btnReturn.grid(column = 5, row=5, sticky = "nsew")


        
        
        
class scrSimulator(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        
                #set up window properties and initial focus
        
        self.grid()
        
        for c in range(0,20):
            self.grid_columnconfigure(c,weight=1)
        
        for r in range(0,20):
            self.grid_rowconfigure(r, weight=1)
 
        
        #Title
        
        Title = tk.Label(self, text="Simulator", bg="black", fg="green",bd=2, font="courier", relief="groove")
        Title.grid(column = 1 , row = 1,columnspan =(c-1), sticky = 'nsew')
               
        #close button
        btnReturn = tk.Button(self, text="Done", command=lambda: controller.show_frame(scrMenu))
        btnReturn.grid(column = c-1, row=r-1, sticky = "nsew")

        #canvas element        
        w = tk.Canvas(self, width=900, height=500,
           borderwidth=0,
           highlightthickness=0,
           background='black')
        w.grid(column = 2, row = 1, columnspan=c-1, rowspan = r-1) 

        
        #Ship Location
        BridgeCentre = 450
        BridgeFront = 50
        
        #Cabin Size
        CabinHeight = 200
        CabinWidth = 200
        
        #Layout
        DeckOffset = 20

        #GravLifts
        GravLiftWidth = 40
        GravliftHeight = 20
              

        #White Deck
        TDW_1x = BridgeCentre - (CabinWidth / 2)
        TDW_1y = BridgeFront
        TDW_2x = BridgeCentre + (CabinWidth / 2)
        TDW_2y = BridgeFront + CabinHeight
        
        GLO_y = GravliftHeight/2
        GLO_x = GravLiftWidth / 2
              
        w.create_rectangle(TDW_1x, TDW_1y, TDW_2x , TDW_2y , fill="white") # Bridge
        w.create_rectangle(TDW_1x, TDW_1y + CabinHeight, TDW_2x , TDW_2y + CabinHeight , fill="white") # Engineering
        w.create_oval(BridgeCentre - GLO_x, TDW_2y + GLO_y, BridgeCentre + GLO_x, TDW_2y - GLO_y,fill="yellow", width = 3) # gravlift
        
        #BlueDeck
        
        TDB_1x = TDW_1x - CabinWidth
        TDB_1y = TDW_1y + DeckOffset
        TDB_2x = TDW_2x - CabinWidth
        TDB_2y = TDW_2y + DeckOffset
        
        w.create_rectangle(TDB_1x, TDB_1y, TDB_2x , TDB_2y , fill="blue") # Bridge
        w.create_rectangle(TDB_1x, TDB_1y + CabinHeight, TDB_2x , TDB_2y + CabinHeight , fill="blue") # Engineering
        
        w.create_oval(
            BridgeCentre - CabinWidth - GLO_x, 
            TDB_2y + GLO_y, 
            BridgeCentre - CabinWidth + GLO_x, 
            TDB_2y - GLO_y, 
            fill="yellow", width = 3) # gravlift
        
        #RedDeck
        
        TDR_1x = TDW_1x + CabinWidth
        TDR_1y = TDW_1y + DeckOffset
        TDR_2x = TDW_2x + CabinWidth
        TDR_2y = TDW_2y + DeckOffset
        
        w.create_rectangle(TDR_1x, TDR_1y, TDR_2x , TDR_2y , fill="red") # Bridge
        w.create_rectangle(TDR_1x, TDR_1y + CabinHeight, TDR_2x , TDR_2y + CabinHeight , fill="red") # Engineering
        w.create_oval(BridgeCentre + CabinWidth - GLO_x, TDB_2y + GLO_y, BridgeCentre + CabinWidth + GLO_x, TDB_2y - GLO_y , fill="yellow", width = 3) # gravlift
        

        
        w.create_oval(440,90,460,110, fill="red", width=2)
        
        
        

        
        
                
        
if __name__ == "__main__":
    app = Starbase(None)
    app.title('Space Alert: Starbase')
    app.mainloop()

