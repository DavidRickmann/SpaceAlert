

import Tkinter
import Player


class MainMenu(Tkinter.Tk):
    def __init__(self,parent):
        Tkinter.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        #set up window properties and initial focus
        self.geometry('600x250')
        
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
        
        self.resizable(True,True)
             
        
        #Title
        
        Title = Tkinter.Label(self, text="Space Alert : Starbase", bg="black", fg="green",bd=2, font="courier", relief="groove")
        Title.grid(column = 1 , row = 1,columnspan =5, sticky = 'nsew')
        
        #text box properties
        #set up text box variable and initialise it
        #self.entryVariable = Tkinter.StringVar()
        #self.entryVariable.set(u"Enter text here.")
        
        #button properties
        button1 = Tkinter.Button(self,text=u"Barracks", width = 1, command=self.OnButton1Click)
        button1.grid(column = 1,row=3, sticky = 'nsew')

        button2 = Tkinter.Button(self,text=u"Training", width = 1, command=self.OnButton2Click)
        button2.grid(column = 3,row=3, sticky = 'nsew')

        button2 = Tkinter.Button(self,text=u"Simulator", width = 1, command=self.OnButton3Click)
        button2.grid(column = 5,row=3, sticky = 'nsew')

        button1 = Tkinter.Button(self,text=u"Library", width = 1, command=self.OnButton4Click)
        button1.grid(column = 1,row=5, sticky = 'nsew')

        button2 = Tkinter.Button(self,text=u"Launch Bay", width = 1, command=self.OnButton5Click)
        button2.grid(column = 3,row=5, sticky = 'nsew')

        button2 = Tkinter.Button(self,text=u"Administration", width = 1, command=self.OnButton6Click)
        button2.grid(column = 5,row=5, sticky = 'nsew')
        
        #make sure everything is drawn and then fix window size.
        self.update()
        self.geometry(self.geometry())   
        
        
    def OnButton1Click(self):
        # create child window
        BarracksWin = Tkinter.Toplevel(self)
        
        BarracksWin.geometry(self.geometry())
        
        BarracksWin.grid()
        BarracksWin.grid_columnconfigure(0,weight=1)
        BarracksWin.grid_columnconfigure(1,weight=3) 
        BarracksWin.grid_columnconfigure(2,weight=1)
        BarracksWin.grid_columnconfigure(3,weight=3) 
        BarracksWin.grid_columnconfigure(4,weight=1)
        BarracksWin.grid_columnconfigure(5,weight=3) 
        BarracksWin.grid_columnconfigure(6,weight=1)
            
        BarracksWin.grid_rowconfigure(0, weight=1)
        BarracksWin.grid_rowconfigure(1, weight=2) #title
        BarracksWin.grid_rowconfigure(2, weight=1)
        BarracksWin.grid_rowconfigure(3, weight=2) 
        BarracksWin.grid_rowconfigure(4, weight=1)
        BarracksWin.grid_rowconfigure(5, weight=2) #button
        BarracksWin.grid_rowconfigure(6, weight=1)
        
        BarracksWin.resizable(True,True)
        
         #Title
        
        BarracksTitle = Tkinter.Label(self, text="Barracks", bg="black", fg="green",bd=2, font="courier", relief="groove")
        BarracksTitle.grid(column = 1 , row = 1,columnspan =5, sticky = 'nsew')
                
        # quit child window and return to root window
        # the button is optional here, simply use the corner x of the child window
        BtnClose = Tkinter.Button(BarracksWin, text='Done', command=BarracksWin.destroy)
        BtnClose.grid(column = 5,row=5, sticky = 'nsew')
        
    def OnButton2Click(self):
         pass
         
    def OnButton3Click(self):
         pass
        
    def OnButton4Click(self):
         pass

    def OnButton5Click(self):
         pass
         
    def OnButton6Click(self):
         pass
         
        
if __name__ == "__main__":
    app = MainMenu(None)
    app.title('Space Alert: Starbase')
    app.mainloop()

