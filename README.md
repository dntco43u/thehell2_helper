# thehell2_helper
<div align=left> 
  <img src="https://img.shields.io/badge/autohotkey-334455?style=flat-square&logo=autohotkey&logoColor=white">
  <img src="https://img.shields.io/badge/windows-0078D6?style=flat-square&logo=windows&logoColor=white">
  <br>
  <br>
</div>
This script helps with battle macros, item swap, item cleanup, gamble, etc.<br>

* * *

### Configuration

Edit \Script Directory\config.json

```json
["common.theHell2Path"] /* The Hell2 folder */
["memory.heal.enable"] /* 1:on (default), 0:off */
["memory.heal.lifeRatio"] /* percentage to recover */
["memory.heal.manaRatio"] /* percentage to heal (%) */
["memory.heal.lifeShortcut"] /* Short cut (requires source modification) */
["memory.heal.manaShortcut"] /* Shortcut or "potion" (requires source modification) */
["memory.heal.term"] /* life and mana check frequency ms unit 1000 (default)
Among the lower values of memory, address and offset must be found and replaced when the version is changed.
There are 4 presets by default, but you can increase them as much as you want and add hotkeys. There are 10 swap items in total, and you can change the weapon slot for each item. */
["preset.enable"] /* 0:off (default), 1: on */
["preset.activeSlot"] /* 0:off (default), if 1|2|3, swap to the corresponding slot */
["preset.order"] /* swap order (can be changed) */
["preset.position"] /* Inventory position of the item to be swapped. Upper left of inventory = [1, 1] / Lower right = [10, 7] **Need to fill in accurately */
```

* * *

### How to use

`H`<br>
After swapping items with preset1, restore after casting Golem

`F8`<br>
After swapping items with preset2 and restoring after casting Fury

`F9`<br>
Toggle item swap preset1

`F10`<br>
Toggle item swap preset2

`F11`<br>
Toggle item swap preset3

`F12`<br>
Toggle item swap preset4

`Alt+Q`<br>
After moving to cain coordinates, identify all

`Alt+W`<br>
After moving to griswold coordinates, repair all

`Alt+E`<br>
Move to gillian coordinates

`Alt+R`<br>
Move to wirt coordinates

`Alt+T`<br>
Move to adria coordinates and recharge all

`Alt+Y`<br>
Move to pepin coordinates

`Alt+A`<br>
Move to crypt coordinates

`Alt+S`<br>
Move to abyss coordinates

`Alt+D`<br>
Move to hell coordinates

`Alt+F`<br>
Move to cave coordinates

`Alt+G`<br>
Move to catacomb coordinates

`Alt+H`<br>
Move to church coordinates

`Alt+X`<br>
Move to portal coordinates

`` ` ``<br>
Organize items<br>
Write name and options in config.json moveItemBelt<br>
```json
["potion", "mana"], ["holy", "water"] /* Fill belt with Mana Potion, Full Mana Potion, Holy Water, Full Holy Water */
```
Write name and options in config.json moveItemDrop<br>
```json
["gold"], ["relict"], ["repair"], ["potion", "healing"] /* Discard Gold, All Relics, Repair Oil x, Healing Potion, Full Healing Potion */
```

`Alt+V`<br>
Buy 8 potions

`Alt+B`<br>
Griswold Auto Gamble<br>
Write name and options in config.json memory.buyItem.partDescription<br>
```json
["amulet", "replenishing", "wisdom"] /* replenishing amulet of wisdom */
["amulet", "% to mana regeneration", "+24 to magic"] /* replenishing amulet of wisdom */
["% to mana regeneration", "+24 to magic"] /* replenishing (all items) of wisdom */
["+24 to magic"] /* (all items) of wisdom */
```

`Ctrl+Shift+1`<br>
Start a new game

`Ctrl+Shift+2`<br>
Game restart

`Ctrl+Shift+8`<br>
TH2 save file backup
```sh
c:\Users\User account\Documents\thehell2\save_mp\20210219204903\
```

`Ctrl+Shift+0`<br>
Create and initialize config.json

* * *

### Contact and license

<a href="mailto:xqbty8po-dntco43u@yahoo.com" target="_blank"><img src="https://img.shields.io/badge/yahoo!-6001D2?style=flat-square&logo=yahoo!&logoColor=white"/></a>
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
