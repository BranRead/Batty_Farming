# Batty Farming
## Introduction
### This started as a project for Quantum Arcade. A website started by myself and 3 classmates for our capstone project at NSCC. The repo for that website can be found elsewhere.
### I orginally had the idea to make an Insaniquarium clone and use fish sprites for it. Keeping extremely close to that game in design. I had trouble finding fish assets I was happy with but ended up stumbling upon a bat spritesheet which I felt was perfect. 
### Found those here: 
### [Bat Spritesheet](https://opengameart.org/content/lpc-monsters)
### After finding those I quickly came up with an idea on how to make bats be the animal the player feeds instead of guppies like in Insaniquarium.
### This game is incredibly fun for me to work on and see come together. I played Insaniquarium on an old website which hosted flash games (Coffee Break). Eventually convincing my Grandma to buy the deluxe edition. Many hours were spent playing this game as a kid. 
### This game is truly a love letter to Insaniquarium.
## Gameplay
### Like with the game it's based off of, the main gameplay loop is to feed the bats, keep them alive and collect what they drop. Seashells in Insaniquarium and guano in this one.
### The wincon is similar to Insaniquarium in which something has to be bought 3 times to finish the game.
### The bats have three stages of growth with the largest bats dropping gold guano which is worth more. 
### If the player doesn't feed the bats then they will die, causing the player to manage their money between buying upgrades, buying bats and paying for dropping food. 
### The upgrades are as follows:
1. Food quantity upgrade
2. Food quality upgrade
3. Weapon upgrade
### #1 upgrades how many items of food can be on the screen at once. (Up to a max of 10). 
### #2 upgrades the quality of food. The greater the quality the faster it will cause bats to grow
### #3 upgrades the weapon power and changes the sprite used to indicate the use of it when an enemy spawns in. 
## Technical 
### Made using Godot and GDScript.
### The game uses a GET and POST request in order to get the user id in relation to Quantum Arcade and then to send the final score to the website.
### There are essentially 3 difficulties. Normal, and then two with the white-nose fungus. This fungus is based on a fungus which ravaged Nova Scotia's bat population and the two difficulties reflect real life prevention of this.
### The user can choose whether to clean their clothes before starting or not. Cleaning clothes makes for a "hard" (or "batty") difficulty and not cleaning clothes creates and even harder mode with increased chance of the fungus appearing.  
## To-do:
- [x] Make food sprite change when food quality upgrade is purchased
- [x] Have the above cause bats to grow faster
- [ ] \(Optional) Make better food keep bats full longer
- [x] Figure out enemy spawning and movement
- [x] Enemy collision with bat = death
- [x] Find water gun sprites
- [x] Figure out damage and HP for enemies
- [ ] \(Optional) Display enemy hp
- [x] Figure out wincon
- [x] Figure out how to implement White-Nose Syndrome (Something which nearly wiped out NS's bat population I want there to be something which includes this in gameplay and a small PSA for users)
- [x] Finish off sound effects. The ones implemented now are placeholders
- [x] Finish tweaking before release
