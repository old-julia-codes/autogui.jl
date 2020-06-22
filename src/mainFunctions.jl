using PyCall

pyautogui = pyimport("pyautogui")
function tester()
    @info "it works"
end

getScreenSize() = return pyautogui.size()
# Move
moveTo(x::Int,y::Int) = pyautogui.moveTo(x,y)

#Clicks
click(x::Int,y::Int) = pyautogui.click(x,y)
click(x::String) = pyautogui.click(x)
click() = pyautogui.click()
doubleclick() = pyautogui.doubleclick()

#Write text
write(x,t) = pyautogui.write(x, interval=t)
write(x) = pyautogui.write(x)

#Alert
alert(x::String) = pyautogui.alert(x)

# Drag function
drag(x::Int,y::Int,t::Float16) = pyautogui.drag(x,y, t)

#Pressing
function press(x::String,t=0.0)
    sleep(t)
    pyautogui.press(x)
end
function press(x::Any,t=0.0)
    for a in x
        pyautogui.press(a)
        sleep(t)
    end
end

# Key up and down
keyDown(x::String) = pyautogui.keyDown(x)
keyUp(x::String) = pyautogui.keyUp(x)

#Scroll functions
scroll(t::Int) = pyautogui.scroll(t)
scroll(t::Int,x::Int,y::Int) = pyautogui.scroll(t,x=x,y=y)
hscroll(t::Int) = pyautogui.hscroll(t)

# Screenshot functions
screenshot() = pyautogui.screenshot()
function screenshot(x::String,t::Float16=0.0)
    sleep(t)
    pyautogui.screenshot(x)
end
function screenshot(x::Any,t=0.0)
    sleep(t)
    pyautogui.screenshot(region=(x[1],x[2],x[3],x[4]))
end