

import Tkinter
import Player


class simpleapp_tk(Tkinter.Tk):
    def __init__(self,parent):
        Tkinter.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        #set up window properties and initial focus
        self.grid()
        self.grid_columnconfigure(0,weight=1)
        self.grid_columnconfigure(1,weight=1) #button
        self.grid_columnconfigure(2,weight=1)
        self.grid_columnconfigure(3,weight=1) #button
        self.grid_columnconfigure(4,weight=1)
        self.grid_columnconfigure(5,weight=1) #button
        self.grid_columnconfigure(6,weight=1)
    
        
        self.grid_rowconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1) #button
        self.grid_rowconfigure(2, weight=1)
        self.grid_rowconfigure(3, weight=1) #button
        self.grid_rowconfigure(4, weight=1)
        self.resizable(True,True)
             
       
        #text box properties
        #set up text box variable and initialise it
        #self.entryVariable = Tkinter.StringVar()
        #self.entryVariable.set(u"Enter text here.")
        
        #button properties
        button1 = Tkinter.Button(self,text=u"Barracks", width = 1, command=self.OnButton1Click)
        button1.grid(column = 1,row=1, sticky = 'nsew')

        button2 = Tkinter.Button(self,text=u"Training", width = 1, command=self.OnButton2Click)
        button2.grid(column = 3,row=1, sticky = 'nsew')

        button2 = Tkinter.Button(self,text=u"Simulator", width = 1, command=self.OnButton3Click)
        button2.grid(column = 5,row=1, sticky = 'nsew')

        button1 = Tkinter.Button(self,text=u"Library", width = 1, command=self.OnButton4Click)
        button1.grid(column = 1,row=3, sticky = 'nsew')

        button2 = Tkinter.Button(self,text=u"Launch Bay", width = 1, command=self.OnButton5Click)
        button2.grid(column = 3,row=3, sticky = 'nsew')

        button2 = Tkinter.Button(self,text=u"Administration", width = 1, command=self.OnButton6Click)
        button2.grid(column = 5,row=3, sticky = 'nsew')
        
        #make sure everything is drawn and then fix window size.
        self.update()
        self.geometry(self.geometry())   
        
        
    def OnButton1Click(self):
         pass

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
    app = simpleapp_tk(None)
    app.title('starbase')
    app.mainloop()

