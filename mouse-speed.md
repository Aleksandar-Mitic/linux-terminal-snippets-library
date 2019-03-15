# HOW TO CHANGE THE MOUSE SCROLL WHEEL SPEED IN LINUX USING IMWHEEL [QUICK TIP]
Based on: [ http://www.webupd8.org/2015/12/how-to-change-mouse-scroll-wheel-speed.html ]

Install imwheel
    sudo apt-get install imwheel

Next, create a file called ".imwheelrc" in your home directory - I'll use Sublime in the command below to open this file:

    subl ~/.imwheelrc

And in this file, paste the following: Notice that higher numbers on Button4 and Button5 make mouse scroll faster!

    ".*"
    None,      Up,   Button4, 3
    None,      Down, Button5, 3
    Control_L, Up,   Control_L|Button4
    Control_L, Down, Control_L|Button5
    Shift_L,   Up,   Shift_L|Button4
    Shift_L,   Down, Shift_L|Button5

Start imwheel (type "imwheel --kill" in a terminal). "--kill" is used to make sure other running instances are terminated, so they don't interfere.

    imwheel --kill

Also, if you have back / forward navigation buttons on your mouse, they will stop working using the configuration we've used above. In such cases, you should launch imwheel like this:

    imwheel --kill --buttons "4 5"
