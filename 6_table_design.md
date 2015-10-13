# Table Designdash

## MySQL Code From 261 Project

Just for reference, I am including some sql code from a past project. Commands should be in all caps, I was just stupid back then.


### The script that generated some sample data
```sql
use lilstat;
create table games (id int, game_date varchar(10), player_id int, player_name varchar(25), fg int, tp int, ft int, fl int);
insert into  games values (01, '1/1/2015', 23, 'Michael Jordan', 15, 5, 1, 1);
insert into  games values (02, '1/4/2015', 23, 'Michael Jordan', 20, 2, 2, 0);
insert into  games values (03, '1/6/2015', 23, 'Michael Jordan', 10, 8, 2, 1);
insert into  games values (04, '1/9/2015', 23, 'Michael Jordan', 12, 4, 0, 0);
```

### The python gui that interacted with the db

```py
#   sqlLilstat.py
#   IT261
#   04/2015
#   Final Prohect
#   Tyler Lubbers

from Tkinter import *
import mysql.connector
db = mysql.connector.connect(user = "root", host='127.0.0.1',
                              database='lilstat2')
c = db.cursor()

def whichSelected () :
    print "At '%s'" % (select.curselection())
    return int(select.curselection()[0])

def dosql (cmd) :
    print cmd
    c.execute(cmd)
    setSelect()

def addEntry () :
    c.execute("select max(id)+1 from games")
    id = c.fetchone()[0]  # digs deep to get next id
    c.execute("insert into games values ('%d','%s','%d','%s','%d','%d','%d', '%d')" % (id, dateVar.get(), playnoVar.get(), nameVar.get(), fgVar.get(), tpVar.get(), ftVar.get(), flVar.get()))
    setSelect()

def updateEntry() :
    id = gameList[whichSelected()][0]
    dosql("update games set game_date='%s', player_id='%d', player_name='%s', fg='%d', tp='%d', ft='%s', fl='%d' where id='%d'" %
                   (dateVar.get(), playnoVar.get(), nameVar.get(), fgVar.get(), tpVar.get(), ftVar.get(), flVar.get(), id))

def deleteEntry() :
    id = gameList[whichSelected()][0]
    dosql("delete from games where id='%d'" % id)

def loadEntry  () :
    id, game_date, player_id, player_name, fg, tp, ft, fl = gameList[whichSelected()]
    dateVar.set(game_date)
    playnoVar.set(player_id)
    nameVar.set(player_name)
    fgVar.set(fg)
    tpVar.set(tp)
    ftVar.set(ft)
    flVar.set(fl)

def makeWindow () :
    global dateVar, playnoVar, nameVar, fgVar, tpVar, ftVar, flVar, select
    win = Tk()
    win.title("Lil'BB Stats - IT261 - Final Project")
    frame1 = Frame(win)
    frame1.pack()

    Label(frame1, text="LilStat BB").grid(row=0, column=0, sticky=W)

    Label(frame1, text="Date").grid(row=1, column=0, sticky=W)
    dateVar= StringVar()
    game_date= Entry(frame1, textvariable=dateVar)
    game_date.grid(row=1, column=1, sticky=W)

    Label(frame1, text="Player No.").grid(row=2, column=0, sticky=W)
    playnoVar = IntVar()
    player_id = Entry(frame1, textvariable=playnoVar)
    player_id.grid(row=2, column=1, sticky=W)

    Label(frame1, text="Player Name").grid(row=3, column=0, sticky=W)
    nameVar= StringVar()
    player_name= Entry(frame1, textvariable=nameVar)
    player_name.grid(row=3, column=1, sticky=W)

    Label(frame1, text="Field Goals").grid(row=4, column=0, sticky=W)
    fgVar = IntVar()
    fg = Entry(frame1, textvariable=fgVar)
    fg.grid(row=4, column=1, sticky=W)

    Label(frame1, text="Three Pointers").grid(row=5, column=0, sticky=W)
    tpVar= IntVar()
    tp= Entry(frame1, textvariable=tpVar)
    tp.grid(row=5, column=1, sticky=W)

    Label(frame1, text="Free Throws").grid(row=6, column=0, sticky=W)
    ftVar = IntVar()
    ft = Entry(frame1, textvariable=ftVar)
    ft.grid(row=6, column=1, sticky=W)

    Label(frame1, text="Fouls").grid(row=7, column=0, sticky=W)
    flVar= IntVar()
    fl= Entry(frame1, textvariable=flVar)
    fl.grid(row=7, column=1, sticky=W)

    frame2 = Frame(win)       # Row of buttons
    frame2.pack()
    b1 = Button(frame2,text="Add  ",command=addEntry)
    b2 = Button(frame2,text="Update",command=updateEntry)
    b3 = Button(frame2,text="Delete",command=deleteEntry)
    b4 = Button(frame2,text="Load  ",command=loadEntry)
    b5 = Button(frame2,text="Refresh",command=setSelect)
    b1.pack(side=LEFT); b2.pack(side=LEFT)
    b3.pack(side=LEFT); b4.pack(side=LEFT); b5.pack(side=LEFT)

    frame3 = Frame(win)      # select of names
    frame3.pack()
    scroll = Scrollbar(frame3, orient=VERTICAL)
    select = Listbox(frame3, yscrollcommand=scroll.set, height=6, width = 50)
    scroll.config (command=select.yview)
    scroll.pack(side=RIGHT, fill=Y)
    select.pack(side=LEFT,  fill=BOTH, expand=1)
    return win

def setSelect () :
    global gameList
    c.execute("select * from games order by id")
    gameList = c.fetchall()
    select.delete(0,END)
    for i in gameList :
        select.insert (END, i)

win = makeWindow()
setSelect()
win.mainloop()
```