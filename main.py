
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
        for F in (scrMenu, ScrBarracks):
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
        button1 = tk.Button(self,text=u"Barracks", width = 1, command=lambda: controller.show_frame(ScrBarracks))
        button1.grid(column = 1,row=3, sticky = 'nsew')

        button2 = tk.Button(self,text=u"Training", width = 1, command=lambda: controller.show_frame(ScrBarracks))
        button2.grid(column = 3,row=3, sticky = 'nsew')

        button2 = tk.Button(self,text=u"Simulator", width = 1, command=lambda: controller.show_frame(ScrBarracks))
        button2.grid(column = 5,row=3, sticky = 'nsew')

        button1 = tk.Button(self,text=u"Library", width = 1, command=lambda: controller.show_frame(ScrBarracks))
        button1.grid(column = 1,row=5, sticky = 'nsew')

        button2 = tk.Button(self,text=u"Launch Bay", width = 1, command=lambda: controller.show_frame(ScrBarracks))
        button2.grid(column = 3,row=5, sticky = 'nsew')

        button2 = tk.Button(self,text=u"Administration", width = 1, command=lambda: controller.show_frame(ScrBarracks))
        button2.grid(column = 5,row=5, sticky = 'nsew')
        
       




class ScrBarracks(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="barracks")
        label.pack(pady=10, padx=10)
        
        button = tk.Button(self, text="Menu",
                            command=lambda: controller.show_frame(scrMenu))
        button.pack()



                
        
if __name__ == "__main__":
    app = Starbase(None)
    app.title('Space Alert: Starbase')
    app.mainloop()

