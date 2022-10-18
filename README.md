# AhkCoordGrid
AutoHotkey code for Windows overlay grid allowing you to emulate a mouse click at different points on the screen using keyboard shortcuts.

When you press capslock, this script builds then displays a 5x5 grid of buttons (actually AHK edit controls), labelled A-Z, overlaying the whole screen.
Press the corresponding letter and the mouse moves there. If you're happy with that location, press space for left click or enter for right click. 

After you press a letter, besides moving the mouse to where your selected letter was, the script displays a new, smaller, 5x5 grid around that location. If you need to adjust the locaiton of the mouse, select one of these letters to move the mouse again. Repeat as necessary

Inspired by the cVim chrome plugin's 'hints' - shortcut keys to most links / buttons on web pages.

AhkCoordGrid goes some way towards helping realize WCAG 2.1 Success Criterion 2.1.1, which begins 'All functionality of the content is operable through a keyboard interface ...'

## RELEASE HISTORY

### 2/2/2019 v1.0

Initial release. Grid not movable.

### 27/11/2019 v2.0

Grid made movable, thanks to code contributed by SpeedMaster @ www.autohotkey.com/boards

### 17/10/2022
forked by Ben. grid not moveable but you instead recursively pick from smaller grids until you reach your destination. Also alows right click. And scroll up with '[' and down with "'"