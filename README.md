# Autogui

This is a wrapper around the classic [PyAutoGUI](https://pyautogui.readthedocs.io/en/latest/) package from Python. 

Most of the functions have been wrapped over to provide native Julia code and multiple dispatch. Some extra functionality regarding pauses and intervals have also been added. The documentation can be found at the above link and everything is same as the Python version. 

This package is more of a convinence right now but the plan is to make it native Julia very soon. I did not find any such package and not many people know of PyAutoGUI so I decided to port it.

PRs welcome if you can help me out!! It is just in its infancy right now.

## Install issues

1) Huge error about PyCall
- This package depends on Python files so dont forget to 
]add PyCall
- Please make sure you have Python installed first. 
- If you dont have pyautogui installed run this snippet
```julia
]add Conda
using Conda
Conda.add("pyautogui",channel = "conda-forge")
```
- If that didnt work go the REPL and run this 
```julia
ENV["PYTHON"] = "wherever your python is"
using Pkg
Pkg.build("PyCall")
```

## Functions provided

### Screen size

- getScreenSize()
- Will give you your current screen size.

### Move to

- moveTo(x::Int,y::Int) 
- Moves to a specific point on the screen
- eg. moveTo(100,100)

### Clicks

- Clicks/Double clicks a specific point on the screen or wherever the cursor is currently
- click(x::Int,y::Int) 
- click(x::String) 
- click() 
- doubleclick() 
- eg. click(10,10)
- eg. click()
- eg. doubleclick(10,10)

### Write text 

- with an interval or without
- write(x,t)
- write(x)
- eg. write("Julia is awesome",0.25)
- eg. write("Julia is awesome")

### Display an alert

- alert(x::String)
- eg. alert("I am done building NASA")

### Drag the pointer from a point to another over a certain duration

- drag(x::Int,y::Int,t::Float16)
- eg. drag(10,10,.5)

### Hold a key down / Stop holding it (or use press)

- keyDown(x::String)
- keyUp(x::String)
- eg. keyDown("ctrl"), keyUp("ctrl")

### Press with/without an interval

- Press a sequence of keys or just one key
- With/without an interval
- press(x::String,t=0.0)
- press(x::Any,t=0.0)
- eg. press("down",.5)
- eg. press(["control","l","control","l","control","l"],0.1)

### Scroll from a specific place or just scroll. 

- Negative numbers for backward. Positive for forward
- Horizontal scroll works too!
- hscroll(t::Int)
- Go to a place on the screen and scroll
- Just scroll wherever you are
- scroll(t::Int)
- scroll(t::Int,x::Int,y::Int)
- eg. scroll(-10,100,100)
- eg. hscroll(-10)

### Screenshot!

- Take a screenshot and display it directly on the notebook/REPL
- Add an interval if you want to take it after a while
- Choose a particular region and screenshot that bt only (with or without an interval)
- screenshot()
- screenshot(x::Any,t=0.0)
- eg. screenshot([100,100,100,100])
- eg. screenshot([100,100,100,100],600)