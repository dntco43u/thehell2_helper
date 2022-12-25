#SingleInstance force
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#InstallKeybdHook
#UseHook
#Include %A_ScriptDir%\lib\JSON.ahk
#Include %A_ScriptDir%\lib\Object sort.ahk
#Include %A_ScriptDir%\lib\String-object-file.ahk
#Include %A_ScriptDir%\lib\classMemory.ahk

ListLines Off
Process, Priority, , A
SetTitleMatchMode, 2
SetTitleMatchMode, Fast
SetBatchLines, -1
SetKeyDelay, -1, -1, Play
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Client

global CONFIG_FILE := % A_ScriptDir "\config.json"  ;config file
global LOG_FILE = % A_ScriptDir "\log\thehell2.log" ;log file
global BAK_DIR := % A_ScriptDir "\save_mp\"         ;save backup directory
                                                    
global TRACE := 1                                   ;log level
global DEBUG := 2                                   ;log level
global INFO := 3                                    ;log level
global WARN := 4                                    ;log level
global ERROR := 5                                   ;log level
global X := 1                                       ;coordinate x
global Y := 2                                       ;coordinate y
global LOG_LEVEL := 2                               ;current log level
                                                    
global CAIN := 1                                    ;merchant
global GRISWOLD := 2                                ;merchant
global GILLIAN := 3                                 ;merchant
global WIRT := 4                                    ;merchant
global ADRIA := 5                                   ;merchant
global PEPIN := 6                                   ;merchant
global PORTAL := 1                                  ;entrance
global CHRUCH := 2                                  ;entrance
global CATACOMB := 3                                ;entrance
global CAVE := 4                                    ;entrance
global HELL := 5                                    ;entrance
global ABYSS := 6                                   ;entrance
global CRYPT := 7                                   ;entrance
global HORROR := 1                                  ;difficulty
global PURGATORY := 2                               ;difficulty
global DOOM := 3                                    ;difficulty
                                                    
global m_commonMap := ""                            ;config.json common
global m_slotArray := ""                            ;config.json slot
global m_equipmentArray := ""                       ;config.json equipment
global m_inventoryArray := ""                       ;config.json inventory
global m_merchantArray := ""                        ;config.json merchant
global m_presetArray := ""                          ;config.json preset
global m_memoryMap := ""                            ;config.json memory
global m_moveItemMap := ""                          ;config.json moveItem
global m_classMem := ""                             ;_classMemory
global m_message := ""                              ;m_message

init() ;init

;lwin:: ;leftwin
;if (!isWinActive("ahk_class THEHELL2", TRACE)) {
;  Send, {LWin}
;  Sleep, 1
;  return
;}
;if (m_commonMap.winKey) {
;  Send, {LWin}
;  Sleep, 1
;}
;return

h:: ;h input golem
if (!isWinActive("ahk_class THEHELL2", TRACE)) {
  Send, {h}
  Sleep, 1
  return
}
inputSwapEquipment(1)
inputCastSpell("G", 1000, true)
inputSwapEquipment(1)
return

f8:: ;f8 input fury
inputSwapEquipment(2)
inputCastSpell("F8", 500, true)
inputSwapEquipment(2)
return

f9:: ;f9 input swap equipment
inputSwapEquipment(1)
return

f10:: ;f10 input swap equipment
inputSwapEquipment(2)
return

f11:: ;f11 input swap equipment
inputSwapEquipment(3)
return

f12:: ;f12 input swap equipment
inputSwapEquipment(4)
return

;F11:: ;f11 input magi
;inputSwapEquipment(3)
;inputUseItem("righthand", 2, "J", 500, true)
;inputSwapEquipment(3)
return

;F12:: ;f12 input item recharge
;inputItemRecharge("righthand", 2, "I", 500, true)
;return

!q:: ;alt+q talk to cain
inputTalkToMerchant(CAIN, true)
Send, {LAlt Up}
Sleep, 1
return

!w:: ;alt+w talk to griswold
inputTalkToMerchant(GRISWOLD, true)
Send, {LAlt Up}
Sleep, 1
return

!e:: ;alt+e talk to gillian
inputTalkToMerchant(GILLIAN, false)
Send, {LAlt Up}
Sleep, 1
return

!r:: ;alt+r talk to wirt
inputTalkToMerchant(WIRT, false)
Send, {LAlt Up}
Sleep, 1
return

!t:: ;alt+t talk to adria
inputTalkToMerchant(ADRIA, true)
Send, {LAlt Up}
Sleep, 1
return

!y:: ;alt+y talk to pepin
inputTalkToMerchant(PEPIN, false)
Send, {LAlt Up}
Sleep, 1r
return

!a:: ;alt+a input move to crypt
inputMoveToLocation(CRYPT, m_commonMap.entrancePosition)
Send, {LAlt Up}
Sleep, 1
return

!s:: ;alt+s input move to abyss
inputMoveToLocation(ABYSS, m_commonMap.entrancePosition)
Send, {LAlt Up}
Sleep, 1
return

!d:: ;alt+d input move to hell
inputMoveToLocation(HELL, m_commonMap.entrancePosition)
Send, {LAlt Up}
Sleep, 1
return

!f:: ;alt+f input move to cave
inputMoveToLocation(CAVE, m_commonMap.entrancePosition)
Send, {LAlt Up}
Sleep, 1
return

!g:: ;alt+g input move to catacomb
inputMoveToLocation(CATACOMB, m_commonMap.entrancePosition)
Send, {LAlt Up}
Sleep, 1
return

!h:: ;alt+h input move to chruch
inputMoveToLocation(CHRUCH, m_commonMap.entrancePosition)
Send, {LAlt Up}
Sleep, 1
return

!z:: ;alt+z test
test()
Send, {LAlt Up}
Sleep, 1
return

!x:: ;alt+x input move to portal
inputMoveToLocation(PORTAL, m_commonMap.entrancePosition)
Send, {LAlt Up}
Sleep, 1
return

`:: ;` input move item
inputMoveItem()
Send, {LAlt Up}
Sleep, 1
return

!v:: ;alt+v input buy potion
inputBuyPotion(8)
Send, {LAlt Up}
Sleep, 1
return

!b:: ;alt+b input buy item
inputBuyItem()
Send, {LAlt Up}
Sleep, 1
return

^+1:: ;ctrl+shift+1 run game and talk to merchant
inputMultiPlayer()
inputCreateGame(m_commonMap.difficulty)
inputTalkToMerchant(GRISWOLD, true)
Send, {LCtrl Up}
Send, {LShift Up}
Sleep, 1
return

^+2:: ;ctrl+shift+2 restart and talk to merchant
inputNewGame()
inputCreateGame(m_commonMap.difficulty)
inputTalkToMerchant(GRISWOLD, true)
Send, {LCtrl Up}
Send, {LShift Up}
Sleep, 1
return

^+8:: ;ctrl+shift+8 write backup save file
writeBackupSaveFile()
Send, {LCtrl Up}
Send, {LShift Up}
Sleep, 1
return

^+9:: ;ctrl+shift+9 input test coordinate
inputTestCoordinate()
Send, {LCtrl Up}
Send, {LShift Up}
Sleep, 1
return

^+0:: ;ctrl+shift+0 write config file
writeConfigFile()
Send, {LCtrl Up}
Send, {LShift Up}
Sleep, 1
return

^+a:: ;ctrl+shift+q get pixel color
getPixelColor()
Send, {LCtrl Up}
Send, {LShift Up}
Sleep, 1
return

^+p:: ;ctrl+shift+p ahk pause
Pause

^+r:: ;ctrl+shift+r ahk reload
Reload

^+x:: ;ctrl+shift+x ahk exitapp
ExitApp

inputHeal: ;timer input heal
inputHeal()
return

removeToolTip: ;timer remove tooltip
ToolTip
return

init() {
  ;run as admin
  runAsAdmin()
  ;get data
  configMap := readConfigFile()
  if (configMap = "")
    return
  m_commonMap :=      configMap.common
  m_slotArray :=      configMap.slot
  m_equipmentArray := configMap.equipment
  m_inventoryArray := configMap.inventory
  m_merchantArray :=  configMap.merchant
  m_presetArray :=    configMap.preset
  m_memoryMap :=      configMap.memory
  m_moveItemMap:=     configMap.moveItem
  ;remove log file
  removeLogFile(1024)
  ;input heal
  if (m_memoryMap.heal.enable)
    SetTimer, inputHeal, % m_memoryMap.heal.term
}

/*
input move to location
*/
inputMoveToLocation(location, positionArray) {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  if (!initClassMemory())
    return
  BlockInput, on
  ;get data
  addressArray :=          m_memoryMap.map.address
  offsetArray :=           m_memoryMap.map.offset
  moveToX :=               m_commonMap.centerCoordinate[X]
  moveToY :=               m_commonMap.centerCoordinate[Y] - 20
  centerX :=               m_commonMap.centerCoordinate[X]
  centerY :=               m_commonMap.centerCoordinate[Y]
  ;move to location
  playerX := m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[1])
  playerY := m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[2])
  if ((playerX != positionArray[location][X]) || (playerY != positionArray[location][Y])) {
    m_classMem.write(m_classMem.BaseAddress + addressArray[1], positionArray[location][X], , offsetArray[1])
    m_classMem.write(m_classMem.BaseAddress + addressArray[1], positionArray[location][Y], , offsetArray[2])
    Sleep, 1
    MouseMove, %moveToX%, %moveToY%
    Sleep, 1
    Click, %moveToX%, %moveToY%, Left, Down
    Sleep, 1
    Click, %moveToX%, %moveToY%, Left, Up
    Sleep, 300
  }
  MouseMove, %centerX%, %centerY%
  Sleep, 1
  BlockInput, off
  m_message := "positionArray[" location "] Processed " positionArray[location][X] "," positionArray[location][Y]
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(INFO, m_message)
}

/*
input buy potion
*/
inputBuyPotion(amount) {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  BlockInput, on
  MouseGetPos, mouseX, mouseY
  Send, {Shift Down}
  Sleep, 1
  ;buy item
  loop, % amount {
    Click, %mouseX%, %mouseY%, Left, Down
    Sleep, 1
    Click, %mouseX%, %mouseY%, Left, Up
    Sleep, 1
  }
  Send, {Shift Up}
  Sleep, Up
  MouseMove, %mouseX%, %mouseY%
  Sleep, 1
  BlockInput, off
  m_message := "buyPotion " amount " Processed " positionArray[location][X] "," positionArray[location][Y]
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(INFO, m_message)
}

/*
input cast spell
*/
inputCastSpell(shortcut, term, isInstant) {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  BlockInput, on
  Send, {%shortcut%}
  Sleep, 1
  if (isInstant) {
    Sleep, %term%
    BlockInput, off
    return
  }
  MouseGetPos, mouseX, mouseY
  Click, %mouseX%, %mouseY%, Right, Down
  Sleep, 1
  Click, %mouseX%, %mouseY%, Right, Up
  Sleep, %term%
  BlockInput, off
  m_message := "castSpell " shortcut " Processed"
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(INFO, m_message)
}

/*
input active slot
*/
inputActiveSlot(activeSlot) {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  BlockInput, on
  MouseGetPos, mouseX, mouseY
  ;open inventory
  Send, {i}
  Sleep, 1
  ;swap slot
  activeSlotX := getSlotMap(m_slotArray, activeSlot).coordinate[X]
  activeSlotY := getSlotMap(m_slotArray, activeSlot).coordinate[Y]
  Click, %activeSlotX%, %activeSlotY%, Left, Down
  Sleep, 1
  Click, %activeSlotX%, %activeSlotY%, Left, Up
  Sleep, 1
  ;close inventory
  Send, {i}
  Sleep, 1
  MouseMove, %mouseX%, %mouseY%
  Sleep, 1
  BlockInput, off
}

/*
input use item
*/
inputUseItem(itemType, slot, shortcut, term, isInstant) {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  inputActiveSlot(slot)
  BlockInput, on
  inputCastSpell(shortcut, term, isInstant)
  BlockInput, off
  inputActiveSlot(1)
}

/*
input item recharge
*/
inputItemRecharge(itemType, slot, shortcut, term, isInstant) {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  inputActiveSlot(slot)
  BlockInput, on
  itemTypeCoordinate :=  getEquipmentMap(m_equipmentArray, itemType)
  itemTypeCoordinateX := itemTypeCoordinate.coordinate[X]
  itemTypeCoordinateY := itemTypeCoordinate.coordinate[Y]
  MouseMove, %itemTypeCoordinateX%, %itemTypeCoordinateY%
  Sleep, 1
  BlockInput, off
  inputCastSpell(shortcut, 50, isInstant)
  BlockInput, on
  Sleep, term
  MouseGetPos, mouseX, mouseY
  Sleep, 1
  Click, %mouseX%, %mouseY%, Left, Down
  Sleep, 1
  Click, %mouseX%, %mouseY%, Left, Up
  Sleep, 1
  ;close inventory
  Send, {i}
  Sleep, 1
  BlockInput, off
  inputActiveSlot(1)
}

/*
input move item
*/
inputMoveItem() {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  if (!initClassMemory())
    return
  BlockInput, on
  ;get data
  centerX :=           m_commonMap.centerCoordinate[X]
  centerY :=           m_commonMap.centerCoordinate[Y]
  dropX :=             m_commonMap.centerCoordinate[X]
  dropY :=             m_commonMap.centerCoordinate[Y]
  addressArray :=      m_memoryMap.buyItem.address
  offsetArray :=       m_memoryMap.buyItem.offset
  moveItemBeltArray := m_moveItemMap.moveItemBelt
  moveItemDropArray := m_moveItemMap.moveItemDrop
  m_classMem.write(m_classMem.BaseAddress + addressArray[1], 128, , offsetArray[1])
  MouseMove, %centerX%, %centerY%
  Sleep, 1
  ;open inventory
  Send, {i}
  Sleep, 1
  for k, v in m_inventoryArray {
    itemX := m_inventoryArray[A_Index].coordinate[X]
    itemY := m_inventoryArray[A_Index].coordinate[Y]
    itemCorrectionX := itemX - (m_commonMap.mouseUpCorrectionSize * 1)
    itemCorrectionY := itemY - (m_commonMap.mouseUpCorrectionSize * 1)
    MouseMove, %itemX%, %itemY%
    Sleep, 50
    itemName := m_classMem.readString(m_classMem.BaseAddress + addressArray[1], 128, , offsetArray[1])
    isBeltMatched := isMatchedItem(itemName, moveItemBeltArray)
    isDropMatched := isMatchedItem(itemName, moveItemDropArray)
    Sleep, 10
    if (isBeltMatched) {
      ;move item
      Send, {Shift Down}
      Sleep, 1
      Click, %itemX%, %itemY%, Left, Down
      Sleep, 1
      Click, %itemCorrectionX%, %itemCorrectionY%, Left, Up
      Sleep, 1
      Send, {Shift Up}
      Sleep, 1
      Click, %itemCorrectionX%, %itemCorrectionY%, Left, Down
      Sleep, 1
      Click, %itemX%, %itemY%, Left, Up
      Sleep, 1
      m_message := itemName " Processed"
      multiLineMessage := getToolTipMessage(multiLineMessage)
      writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
    } else if (isDropMatched) {
      ;get item
      Click, %itemX%, %itemY%, Left, Down
      Sleep, 1
      Click, %itemCorrectionX%, %itemCorrectionY%, Left, Up
      Sleep, 1
      ;drop item
      Click, %dropX%, %dropY%, Left, Down
      Sleep, 1
      Click, %dropX%, %dropY%, Left, Up
      Sleep, 1
      m_message := itemName " Processed"
      multiLineMessage := getToolTipMessage(multiLineMessage)
      writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
    }
    MouseMove, %itemX%, %itemY%
    Sleep, 1
  }
  ;close inventory
  Send, {i}
  Sleep, 1
  BlockInput, off
  showToolTip(INFO, multiLineMessage)
}

/*
input buy item
*/
inputBuyItem() {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  if (!initClassMemory())
    return
  ;get data
  dropX :=                m_commonMap.screenSize[X] * 0.05
  dropY :=                m_commonMap.screenSize[Y] * 0.05
  addressArray :=         m_memoryMap.buyItem.address
  offsetArray :=          m_memoryMap.buyItem.offset
  partNameArray :=        m_memoryMap.buyItem.partName
  partDescriptionArray := m_memoryMap.buyItem.partDescription
  prevItemName := ""
  m_classMem.write(m_classMem.BaseAddress + addressArray[1], 128, , offsetArray[1])
  loop {
    for k, v in m_merchantArray {
      itemX := m_merchantArray[A_Index].coordinate[X]
      itemY := m_merchantArray[A_Index].coordinate[Y]
      MouseMove, %itemX%, %itemY%
      Sleep, 50
      itemName := m_classMem.readString(m_classMem.BaseAddress + addressArray[1], 128, , offsetArray[1])
      if (itemName = prevItemName)
        continue
      itemDescription :=  itemName "`n"
      loop, 9 {
        itemDescription := itemDescription m_classMem.readString(m_classMem.BaseAddress + addressArray[1], 128, , offsetArray[1 + A_Index]) "`n"
      }
      itemDescriptionArray := StrSplit(itemDescription, "Buy price")
      isMatched := isMatchedItem(itemDescriptionArray[1], partDescriptionArray)
      ;Sleep, 1
      if (isMatched) {
        ;buy item
        PlayBeep()
        Sleep, 1
        Click, %itemX%, %itemY%, Left, Down
        Sleep, 1
        MouseGetPos, changedMouseX, changedMouseY
        Click, %changedMouseX%, %changedMouseY%, Left, Up
        Sleep, 1
        ;drop item
        Click, %dropX%, %dropY%, Left, Down
        Sleep, 1
        Click, %dropX%, %dropY%, Left, Up
        Sleep, 1
        m_message := itemName " Processed"
        writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
        showToolTip(INFO, m_message)
        Sleep, 1
      } else {
        ;buy and sell item
        loop, 2 {
          MouseGetPos, mouseX, mouseY
          Click, %mouseX%, %mouseY%, Left, Down
          Sleep, 1
          MouseGetPos, changedMouseX, changedMouseY
          Click, %changedMouseX%, %changedMouseY%, Left, Up
          Sleep, 1
        }
      }
      MouseMove, %itemX%, %itemY%
      Sleep, 1
      prevItemName := itemName
      writeLogFile(TRACE, A_ThisFunc, A_LineNumber, prevItemName)
      writeLogFile(TRACE, A_ThisFunc, A_LineNumber, itemDescriptionArray[1])
    }
  }
}

/*
input heal
*/
inputHeal() {
  if (!isWinActive("ahk_class THEHELL2", TRACE))
    return
  if (!initClassMemory())
    return
  ;get data
  addressArray := m_memoryMap.heal.address
  offsetArray :=  m_memoryMap.heal.offset
  lifeRatio :=    m_memoryMap.heal.lifeRatio
  manaRatio :=    m_memoryMap.heal.manaRatio
  lifeShortcut := m_memoryMap.heal.lifeShortcut
  manaShortcut := m_memoryMap.heal.manaShortcut
  lifeNow :=      m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[1])
  lifeMax :=      m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[2])
  manaNow :=      m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[3])
  manaMax :=      m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[4])
  lifeNowRatio := ((lifeNow / lifeMax) * 100)
  manaNowRatio := ((manaNow / manaMax) * 100)
  if (lifeNow = "") {
    m_message := "m_classMem.read() Returned no value 0x" Format("{:x}", addressArray[1]) ",0x" Format("{:x}", offsetArray[1])
    writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
    showToolTip(INFO, m_message)
    return
  }
  ;mana heal
  if ((lifeNow > 0) && (manaNowRatio < manaRatio)) {
    ;mana heal
    if (manaShortcut = "potion") {
      loop, 8 {
        shortcutKey := 8 - (A_Index - 1)
        Send, {%shortcutKey%}
        Sleep, 10
        manaNow := m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[3])
        manaMax := m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[4])
        manaNowRatio := ((manaNow / manaMax) * 100)
        Sleep, 1
        if (manaNowRatio >= manaRatio)
          break
      }
    } else if (manaShortcut = "theMagi") {
      inputUseItem("righthand", 2, "J", 600, true)
    } else {
      Send, {%manaShortcut%}
    }
    Sleep, 1
    m_message := manaShortcut " Processed " Format("{:d}", manaNowRatio) "% " Format("{:d}", (manaNow / 64)) "/" Format("{:d}", (manaMax / 64))
    multiLineMessage := getToolTipMessage(multiLineMessage)
    writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  }
  ;life heal
  if ((lifeNow > 0) && (lifeNowRatio < lifeRatio)) {
    ;life heal
    if (lifeShortcut = "potion") {
      loop, 8 {
        shortcutKey := 8 - (A_Index - 1)
        Send, {%shortcutKey%}
        Sleep, 10
        lifeNow := m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[3])
        lifeMax := m_classMem.read(m_classMem.BaseAddress + addressArray[1], , offsetArray[4])
        lifeNowRatio := ((lifeNow / lifeMax) * 100)
        Sleep, 1
        if (lifeNowRatio >= lifeRatio)
          break
      }
    } else if (lifeShortcut = "manaShield") {
      inputCastSpell("F5", 500, true)
      inputCastSpell("F7", 500, true)
    } else {
      Send, {%lifeShortcut%}
    }
    Sleep, 1
    m_message := lifeShortcut " Processed " Format("{:d}", lifeNowRatio) "% " Format("{:d}", (lifeNow / 64)) "/" Format("{:d}", (lifeMax / 64))
    multiLineMessage := getToolTipMessage(multiLineMessage)
    writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  }
  showToolTip(INFO, multiLineMessage)
}

/*
input talk to merchant
*/
inputTalkToMerchant(merchant, isButton) {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  if (!initClassMemory())
    return
  ;get data
  addressArray :=          m_memoryMap.map.address
  offsetArray :=           m_memoryMap.map.offset
  centerX :=               m_commonMap.centerCoordinate[X]
  centerY :=               m_commonMap.centerCoordinate[Y]
  buttonX :=               m_commonMap.merchantButtonCoordinate[X]
  buttonY :=               m_commonMap.merchantButtonCoordinate[Y]
  ;move to merchant
  inputMoveToLocation(merchant, m_commonMap.merchantPosition)
  Sleep, 100
  BlockInput, on
  ;talk to  merchant
  Click, %centerX%, %centerY%, Left, Down
  Sleep, 100
  Click, %centerX%, %centerY%, Left, Up
  Sleep, 100
  ;trade item
  Send, {Down}
  Sleep, 1
  Send, {Enter}
  Sleep, 1
  if (isButton) {
    Sleep, 100
    Loop, 7 {
      Click, %buttonX%, %buttonY%, Left, Down
      Sleep, 1
      Click, %buttonX%, %buttonY%, Left, Up
      Sleep, 1
    }
  }
  MouseMove, %centerX%, %centerY%
  Sleep, 1
  BlockInput, off
}

/*
input new game
*/
inputNewGame() {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  BlockInput, on
  ;new game
  menuX := m_commonMap.menuButtonCoordinate[X]
  menuY := m_commonMap.menuButtonCoordinate[Y]
  Click, %menuX%, %menuY%, Left, Down
  Sleep, 1
  Click, %menuX%, %menuY%, Left, Up
  Sleep, 1
  Send, {Down}
  Sleep, 100
  Send, {Enter}
  Sleep, 2800
  BlockInput, off
}

/*
input multi player
*/
inputMultiPlayer() {
  ;run application
  theHell2Command := "cd " m_commonMap.theHell2Path " && TH2.exe"
  Run, %COMSPEC% /c %theHell2Command%
  Sleep, 2000
  if (!isWinActive("ahk_class SDlgDialog", INFO))
    return
  BlockInput, on
  ;multi player
  Send, {Down}
  Sleep, 100
  Send, {Enter}
  Sleep, 100
  ;select hero
  Send, {Enter}
  Sleep, 100
  ;local area network (ipx)
  Send, {Down}
  Sleep, 100
  Send, {Enter}
  Sleep, 200
  BlockInput, off
}

/*
input create game
*/
inputCreateGame(difficulty) {
  if (!isWinActive("ahk_class SDlgDialog", INFO))
    return
  BlockInput, on
  ;create game
  Send, {Enter}
  Sleep, 100
  ;difficulty
  if (difficulty = 1) {
    Send, {Enter}
    Sleep, 2200
  } else if (difficulty = 2) {
    Send, {Down}
    Sleep, 100
    Send, {Enter}
    Sleep, 2200
  } else if (difficulty = 3) {
    Send, {Up}
    Sleep, 100
    Send, {Enter}
    Sleep, 2200
  }
  BlockInput, off
}

/*
input swap equipment
*/
inputSwapEquipment(preset) {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  if (m_presetArray[preset].Length() < 1) {
    m_message := "preset[" preset "] Returned .Length() < 1"
    writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
    showToolTip(INFO, m_message)
    return
  }
  writeBackupSaveFile()
  MouseGetPos, mouseX, mouseY
  m_presetArray[preset] := ObjectSort(m_presetArray[preset], "order")
  enableItemCount := 0
  for k, v in m_presetArray[preset] {
    if (!m_presetArray[preset][A_Index].enable) {
      if ((m_presetArray[preset].Length() = A_Index) && (enableItemCount = 0)) {
        m_message := "preset[" preset "] Returned enableItemCount = 0"
        writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
        showToolTip(INFO, m_message)
        return
      }
    } else {
      enableItemCount += 1
      if (enableItemCount = 1) {
        BlockInput, on
        ;open inventory
        Send, {i}
        Sleep, 1
      }
    }
  }
  for k, v in m_presetArray[preset] {
    if (!m_presetArray[preset][A_Index].enable)
      continue
    if (m_presetArray[preset][A_Index].activeSlot > 0) {
      ;swap slot
      activeSlotX := getSlotMap(m_slotArray, m_presetArray[preset][A_Index].activeSlot).coordinate[X]
      activeSlotY := getSlotMap(m_slotArray, m_presetArray[preset][A_Index].activeSlot).coordinate[Y]
      Click, %activeSlotX%, %activeSlotY%, Left, Down
      Sleep, 1
      Click, %activeSlotX%, %activeSlotY%, Left, Up
      Sleep, 1
      m_message := "preset[" preset "] Processed " m_presetArray[preset][A_Index].itemType " activeSlot " m_presetArray[preset][A_Index].activeSlot " " activeSlotX ","  activeSlotY
      multiLineMessage := getToolTipMessage(multiLineMessage)
      writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
      if ((m_presetArray[preset][A_Index].position[X] = 0) || (m_presetArray[preset][A_Index].position[Y] = 0))
        continue
    }
    ;get data
    itemSource :=                 getInventoryMap(m_inventoryArray, m_presetArray[preset][A_Index])
    itemSourceX :=                itemSource.coordinate[X] + ((m_commonMap.mouseUpCorrectionSize * m_presetArray[preset][A_Index].itemSlotSize[X]) - m_commonMap.mouseUpCorrectionSize)
    itemSourceY :=                itemSource.coordinate[Y] + ((m_commonMap.mouseUpCorrectionSize * m_presetArray[preset][A_Index].itemSlotSize[Y]) - m_commonMap.mouseUpCorrectionSize)
    itemSourceCorrectionX :=      itemSourceX - (m_commonMap.mouseUpCorrectionSize * m_presetArray[preset][A_Index].itemSlotSize[X])
    itemSourceCorrectionY :=      itemSourceY - (m_commonMap.mouseUpCorrectionSize * m_presetArray[preset][A_Index].itemSlotSize[Y])
    itemDestination :=            getEquipmentMap(m_equipmentArray, m_presetArray[preset][A_Index].itemType)
    itemDestinationX :=           itemDestination.coordinate[X]
    itemDestinationY :=           itemDestination.coordinate[Y]
    itemDestinationCorrectionX := itemDestinationX - (m_commonMap.mouseUpCorrectionSize * m_presetArray[preset][A_Index].itemSlotSize[X])
    itemDestinationCorrectionY := itemDestinationY - (m_commonMap.mouseUpCorrectionSize * m_presetArray[preset][A_Index].itemSlotSize[Y])
    ;validataion coordinate
    if ((m_presetArray[preset][A_Index].position[X] < 1) || (m_presetArray[preset][A_Index].position[X] > 10) || (m_presetArray[preset][A_Index].position[Y] < 1) || (m_presetArray[preset][A_Index].position[Y] > 7)) {
      m_message := "preset[" preset "] Returned incorrect value " m_presetArray[preset][A_Index].itemType " position " m_presetArray[preset][A_Index].position[X] ","  m_presetArray[preset][A_Index].position[Y]
      multiLineMessage := getToolTipMessage(multiLineMessage)
      writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
      showToolTip(INFO, multiLineMessage)
      ;close inventory
      Send, {i}
      Sleep, 1
      BlockInput, off
      return
    }
    if ((m_presetArray[preset][A_Index].itemSlotSize[X] < 1) || (m_presetArray[preset][A_Index].itemSlotSize[X] > 2) || (m_presetArray[preset][A_Index].itemSlotSize[Y] < 1) || (m_presetArray[preset][A_Index].itemSlotSize[Y] > 4)) {
      m_message := "preset[" preset "] Returned incorrect value " m_presetArray[preset][A_Index].itemType " itemSlotSize " m_presetArray[preset][A_Index].itemSlotSize[X] ","  m_presetArray[preset][A_Index].itemSlotSize[Y]
      multiLineMessage := getToolTipMessage(multiLineMessage)
      writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
      showToolTip(INFO, multiLineMessage)
      ;close inventory
      Send, {i}
      Sleep, 1
      BlockInput, off
      return
    }
    if ((itemSourceX < 1) || (itemSourceY < 1) || (itemSourceCorrectionX < 1) || (itemSourceCorrectionY < 1) || (itemDestinationX < 1) || (itemDestinationY < 1) || (itemDestinationCorrectionX < 1) || (itemDestinationCorrectionY < 1)) {
      m_message := "preset[" preset "] Returned incorrect value " m_presetArray[preset][A_Index].itemType " src " itemSourceX "," itemSourceY " " itemSourceCorrectionX "," itemSourceCorrectionY " dest " itemDestinationX "," itemDestinationY " " itemDestinationCorrectionX "," itemDestinationCorrectionY
      multiLineMessage := getToolTipMessage(multiLineMessage)
      writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
      showToolTip(INFO, multiLineMessage)
      ;close inventory
      Send, {i}
      Sleep, 1
      BlockInput, off
      return
    }
    ;swap item
    Click, %itemSourceX%, %itemSourceY%, Left, Down
    Sleep, 1
    Click, %itemSourceCorrectionX%, %itemSourceCorrectionY%, Left, Up
    Sleep, 1
    Click, %itemDestinationCorrectionX%, %itemDestinationCorrectionY%, Left, Down
    Sleep, 1
    Click, %itemDestinationX%, %itemDestinationY%, Left, Up
    Sleep, 1
    Click, %itemSourceCorrectionX%, %itemSourceCorrectionY%, Left, Down
    Sleep, 1
    Click, %itemSourceX%, %itemSourceY%, Left, Up
    Sleep, 1
    m_message := "preset[" preset "] Processed " m_presetArray[preset][A_Index].itemType " src " itemSourceX "," itemSourceY " " itemSourceCorrectionX "," itemSourceCorrectionY " dest " itemDestinationX "," itemDestinationY " " itemDestinationCorrectionX "," itemDestinationCorrectionY
    multiLineMessage := getToolTipMessage(multiLineMessage)
    writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  }
  ;close inventory
  Send, {i}
  Sleep, 1
  MouseMove, %mouseX%, %mouseY%
  Sleep, 1
  BlockInput, off
  showToolTip(INFO, multiLineMessage)
}

/*
input test coordinate
*/
inputTestCoordinate() {
  if (!isWinActive("ahk_class THEHELL2", INFO))
    return
  BlockInput, on
  ;test m_commonMap coordinate
  MouseMove, m_commonMap.inventoryTopLeftCoordinate[X], m_commonMap.inventoryTopLeftCoordinate[Y]
  m_message := "common.inventoryTopLeftCoordinate " m_commonMap.inventoryTopLeftCoordinate[X] "," m_commonMap.inventoryTopLeftCoordinate[Y]
  multiLineMessage := getToolTipMessage(multiLineMessage)
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, m_message)
  Sleep, 100
  ;test m_slotArray coordinate
  for k, v in m_slotArray {
    MouseMove, m_slotArray[A_Index].coordinate[X], m_slotArray[A_Index].coordinate[Y]
    m_message := "slot.activeSlot " m_slotArray[A_Index].activeSlot " " m_slotArray[A_Index].coordinate[X] "," m_slotArray[A_Index].coordinate[Y]
    multiLineMessage := getToolTipMessage(multiLineMessage)
    writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, m_message)
    Sleep, 100
  }
  ;test m_equipmentArray coordinate
  for k, v in m_equipmentArray {
    MouseMove, m_equipmentArray[A_Index].coordinate[X], m_equipmentArray[A_Index].coordinate[Y]
    m_message := "equipment.coordinate " m_equipmentArray[A_Index].itemType " " m_equipmentArray[A_Index].coordinate[X] "," m_equipmentArray[A_Index].coordinate[Y]
    multiLineMessage := getToolTipMessage(multiLineMessage)
    writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, m_message)
    Sleep, 100
  }
  ;test m_inventoryArray coordinate
  for k, v in m_inventoryArray {
    MouseMove, m_inventoryArray[A_Index].coordinate[X], m_inventoryArray[A_Index].coordinate[Y]
    m_message := "inventory.coordinate " m_inventoryArray[A_Index].position[X] "," m_inventoryArray[A_Index].position[Y] " " m_inventoryArray[A_Index].coordinate[X] "," m_inventoryArray[A_Index].coordinate[Y]
    multiLineMessage := getToolTipMessage(multiLineMessage)
    writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, m_message)
    Sleep, 100
  }
  ;test m_merchantArray coordinate
  for k, v in m_merchantArray {
    MouseMove, m_merchantArray[A_Index].coordinate[X], m_merchantArray[A_Index].coordinate[Y]
    m_message := "merchant.coordinate " m_merchantArray[A_Index].position[X] "," m_merchantArray[A_Index].position[Y] " " m_merchantArray[A_Index].coordinate[X] "," m_merchantArray[A_Index].coordinate[Y]
    multiLineMessage := getToolTipMessage(multiLineMessage)
    writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, m_message)
    Sleep, 100
  }
  BlockInput, off
  writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(DEBUG, multiLineMessage)
}

/*
is win active
*/
isWinActive(ahkClass, level) {
  if (!WinActive(ahkClass)) {
    m_message := "!WinActive(" chr(34) ahkClass chr(34) ") Returned"
    writeLogFile(level, A_ThisFunc, A_LineNumber, m_message)
    showToolTip(level, m_message)
    return false
  }
  return true
}

/*
init _ClassMemory
*/
initClassMemory() {
  if (_ClassMemory.__Class != "_ClassMemory") {
    m_message := m_message := "_ClassMemory.__Class != " chr(34) "_ClassMemory" chr(34) " Failed"
    writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, m_message)
    showToolTip(DEBUG, m_message)
    return false
  }
  m_classMem := new _ClassMemory("ahk_exe TH2.exe"," ", hProcessCopy)
  if (!isObject(m_classMem)) {
    m_message := "!isObject(m_classMem) Failed"
    writeLogFile(DEBUG, A_ThisFunc, A_LineNumber, m_message)
    showToolTip(DEBUG, m_message)
    return false
  }
  return true
}

/*
write backup save file
*/
writeBackupSaveFile() {
  FileCopyDir, % m_commonMap.theHell2Path "save_mp\", % BAK_DIR A_Now "\"
  m_message := "FileCopyDir() " (ErrorLevel = 0 ? "Processed" : "Failed") " " SAVE_DIR " " BAK_DIR A_Now "\ "
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(INFO, m_message)
}

/*
read config file
*/
readConfigFile() {
  ;read config file
  FileRead, config, %CONFIG_FILE%
  m_message := "FileRead() " (ErrorLevel = 0 ? "Processed" : "Failed") " " CONFIG_FILE
  multiLineMessage := getToolTipMessage(multiLineMessage)
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  try {
    configMap := JSON.Load(config)
  } catch e {
    m_message := "JSON.Load() Failed " CONFIG_FILE "`n" e.Message
    multiLineMessage := getToolTipMessage(multiLineMessage)
    writeLogFile(ERROR, A_ThisFunc, A_LineNumber, m_message)
    showToolTip(ERROR, multiLineMessage)
  }
  m_message := "JSON.Load() Processed " CONFIG_FILE
  multiLineMessage := getToolTipMessage(multiLineMessage)
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  writeLogFile(TRACE, A_ThisFunc, A_LineNumber, config)
  showToolTip(INFO, multiLineMessage)
  return configMap
}

/*
write config file
*/
writeConfigFile() {
  ;set base data
  baseTheHell2Path :=                       "c:\GOG Games\TH2\"
  baseTheHell2Version :=                    "1.0780"
  baseDifficulty :=                         DOOM
  baseScreenSizeArray :=                    [1280, 720]
  baseInventoryTopLeftCoordinateArray :=    [832, 295]
  baseMerchantTopLeftCoordinateArray :=     [188, 105]
  baseMenuButtonCoordinateArray :=          [355, 703]
  baseMerchantButtonCoordinateArray :=      [220, 490]
  baseCenterCoordinateArray :=              [640, 330]
  baseMerchantPositionArray :=              [[62, 71], [62, 63], [55, 44], [56, 58], [44, 68], [55, 79]]
  baseEntrancePositionArray :=              [[57, 40], [25, 30], [49, 21], [17, 69], [41, 80], [80, 62], [37, 25]]
  baseMouseUpCorrectionSize :=              14
  baseInventoryGapSizeArray :=              [29, 29]
  baseSlot1CoordinateArray :=               [825, 80]
  baseSlotGapSize :=                        20
  baseInventorySlotSizeArray :=             [10, 7]
  baseMerchantSlotSizeArray :=              [10, 12]
  baseSlotSize :=                           3
  baseItemTypeArray :=                      ["rightHand"," leftHand"," head"," cloth"," belt"," gloves"," shoes"," amulet"," rightRing"," leftRing"]
  baseItemRemarkArray :=                    ["weapon name"," orb/shield name"," helm name","armor name"," belt name"," gloves name"," shoes name"," amulet name"," right ring name"," left ring name"]
  basem_equipmentArray :=                   [[844, 145], [1071, 145], [960, 90], [960, 176], [960, 240], [844, 233], [1073, 233], [1020, 105], [903, 220], [1017, 220]]
  baseitemSlotSizeArray :=                  [[1, 2], [2, 2], [2, 2], [2, 3], [2, 1], [2, 2], [2, 2], [1, 1], [1, 1], [1, 1]]
  basePositionArray :=                      [[6, 6], [7, 1], [9, 1], [9, 3], [9, 6], [7, 3], [7, 5], [10, 7], [8, 7], [9, 7]]
  baseMeomoryMapAddressArray :=             ["0x0090A3D4"]
  baseMeomoryMapOffsetArray :=              ["0x38", "0x3C"]
  baseMeomoryHealAddressArray :=            ["0x0090A3D4"]
  baseMeomoryHealOffsetArray :=             ["0x0198", "0x019C", "0x01AC", "0x01B0"]
  baseMeomoryHealRatioArray :=              [0, 20]
  baseMeomoryHealShortcutArray :=           ["", "potion"]
  baseMeomoryHealTerm :=                    1000
  baseMeomoryBuyItemAddressArray :=         ["0x00E1B318"]
  baseMeomoryBuyItemOffsetArray :=          ["0x00", "0x0108", "0x0210", "0x0318", "0x0420", "0x0528", "0x0630", "0x0738", "0x0840", "0x0948"]
  baseMeomoryBuyItemPartDescriptionArray := [["% to mana regeneration", "+24 to magic"]]
  baseMoveItemDropArray :=                  [["gold"], ["relict"], ["repair"], ["potion", "healing"]]
  baseMoveItemBeltArray :=                  [["potion", "mana"], ["holy", "water"]]
  configMap := Object()
  configMap.insert("moveItem", m_moveItemMap)
  ;set m_commonMap
  m_commonMap := Object()
  m_commonMap.insert("theHell2Path", baseTheHell2Path)
  m_commonMap.insert("theHell2Version", baseTheHell2Version)
  m_commonMap.insert("difficulty", baseDifficulty)
  m_commonMap.insert("mouseUpCorrectionSize", baseMouseUpCorrectionSize)
  m_commonMap.insert("screenSize", baseScreenSizeArray)
  m_commonMap.insert("inventoryTopLeftCoordinate", baseInventoryTopLeftCoordinateArray)
  m_commonMap.insert("merchnatTopLeftCoordinate", baseMerchantTopLeftCoordinateArray)
  m_commonMap.insert("merchnatTopLeftCoordinate", baseMerchantTopLeftCoordinateArray)
  m_commonMap.insert("menuButtonCoordinate", baseMenuButtonCoordinateArray)
  m_commonMap.insert("merchantButtonCoordinate", baseMerchantButtonCoordinateArray)
  m_commonMap.insert("centerCoordinate", baseCenterCoordinateArray)
  m_commonMap.insert("merchantPosition", baseMerchantPositionArray)
  m_commonMap.insert("entrancePosition", baseEntrancePositionArray)
  m_commonMap.insert("winKey", false)
  configMap.insert("common", m_commonMap)
  ;set m_slotArray
  m_slotArray := Array()
  loop, % baseSlotSize {
    coordinateArray := Array()
    coordinateArray.Push(baseSlot1CoordinateArray[X] + (baseSlotGapSize * (A_index - 1)))
    coordinateArray.Push(baseSlot1CoordinateArray[Y])
    innerMap := Object()
    innerMap.insert("activeSlot", A_index)
    innerMap.insert("coordinate", coordinateArray)
    m_slotArray.Push(innerMap)
  }
  m_slotArray := ObjectSort(m_slotArray, "activeSlot")
  configMap.insert("slot", m_slotArray)
  ;set m_equipmentArray
  m_equipmentArray := Array()
  for k, v in baseItemTypeArray {
    coordinateArray := Array()
    coordinateArray.Push(basem_equipmentArray[A_index][X])
    coordinateArray.Push(basem_equipmentArray[A_index][Y])
    innerMap := Object()
    innerMap.insert("itemType", baseItemTypeArray[A_index])
    innerMap.insert("coordinate", coordinateArray)
    m_equipmentArray.Push(innerMap)
  }
  configMap.insert("equipment", m_equipmentArray)
  ;set m_inventoryArray
  m_inventoryArray := Array()
  loop, % baseInventorySlotSizeArray[Y] {
    yIndex := A_index + 0 ;to number
    loop, % baseInventorySlotSizeArray[X] {
      xIndex := A_index + 0 ;to number
      positionArray := Array()
      positionArray.Push(xIndex)
      positionArray.Push(yIndex)
      coordinateArray := Array()
      coordinateArray.Push(baseInventoryTopLeftCoordinateArray[X] + (baseInventoryGapSizeArray[X] * (xIndex - 1)))
      coordinateArray.Push(baseInventoryTopLeftCoordinateArray[Y] + (baseInventoryGapSizeArray[Y] * (yIndex - 1)))
      innerMap := Object()
      innerMap.insert("position", positionArray)
      innerMap.insert("coordinate", coordinateArray)
      m_inventoryArray.Push(innerMap)
    }
  }
  configMap.insert("inventory", m_inventoryArray)
  ;set m_merchantArray
  m_merchantArray := Array()
  loop, % baseMerchantSlotSizeArray[Y] {
    yIndex := A_index + 0 ;to number
    loop, % baseMerchantSlotSizeArray[X] {
      xIndex := A_index + 0 ;to number
      positionArray := Array()
      positionArray.Push(xIndex)
      positionArray.Push(yIndex)
      coordinateArray := Array()
      coordinateArray.Push(baseMerchantTopLeftCoordinateArray[X] + (baseInventoryGapSizeArray[X] * (xIndex - 1)))
      coordinateArray.Push(baseMerchantTopLeftCoordinateArray[Y] + (baseInventoryGapSizeArray[Y] * (yIndex - 1)))
      innerMap := Object()
      innerMap.insert("position", positionArray)
      innerMap.insert("coordinate", coordinateArray)
      m_merchantArray.Push(innerMap)
    }
  }
  configMap.insert("merchant", m_merchantArray)
  ;set m_memoryMap
  mapMap := Object()
  mapMap.insert("address", baseMeomoryMapAddressArray)
  mapMap.insert("offset", baseMeomoryMapOffsetArray)
  healMap := Object()
  healMap.insert("address", baseMeomoryHealAddressArray)
  healMap.insert("offset", baseMeomoryHealOffsetArray)
  healMap.insert("enable", true)
  healMap.insert("lifeRatio", baseMeomoryHealRatioArray[1])
  healMap.insert("manaRatio", baseMeomoryHealRatioArray[2])
  healMap.insert("lifeShortcut", baseMeomoryHealShortcutArray[1])
  healMap.insert("manaShortcut", baseMeomoryHealShortcutArray[2])
  healMap.insert("term", baseMeomoryHealTerm)
  buyItemMap := Object()
  buyItemMap.insert("address", baseMeomoryBuyItemAddressArray)
  buyItemMap.insert("offset", baseMeomoryBuyItemOffsetArray)
  buyItemMap.insert("partDescription", baseMeomoryBuyItemPartDescriptionArray)
  m_memoryMap := Object()
  m_memoryMap.insert("map", mapMap)
  m_memoryMap.insert("heal", healMap)
  m_memoryMap.insert("buyItem", buyItemMap)
  configMap.insert("memory", m_memoryMap)
 ;set m_moveItemMap
  m_moveItemMap := Object()
  m_moveItemMap.insert("moveItemDrop", baseMoveItemDropArray)
  m_moveItemMap.insert("moveItemBelt", baseMoveItemBeltArray)
  ;set m_presetArray
  m_presetArray := Array()
  presetInnerArray := Array()
  for k, v in baseItemTypeArray {
    positionArray := Array()
    positionArray.Push(basePositionArray[A_index][X])
    positionArray.Push(basePositionArray[A_index][Y])
    itemSlotSizeArray := Array()
    itemSlotSizeArray.Push(baseitemSlotSizeArray[A_index][X])
    itemSlotSizeArray.Push(baseitemSlotSizeArray[A_index][Y])
    innerMap:= Object()
    innerMap.insert("enable", false)
    innerMap.insert("order", A_Index)
    innerMap.insert("activeSlot", false)
    innerMap.insert("remarks", baseItemRemarkArray[A_index])
    innerMap.insert("itemType", baseItemTypeArray[A_index])
    innerMap.insert("position", positionArray)
    innerMap.insert("itemSlotSize", itemSlotSizeArray)
    presetInnerArray.Push(innerMap)
  }
  presetInnerArray := ObjectSort(presetInnerArray, "order")
  loop, 4 {
    m_presetArray.Push(presetInnerArray)
  }
  configMap.insert("preset", m_presetArray)
  ;write config file
  config := ""
  try {
    config := % JSON.Dump(configMap, , 2)
  } catch e {
    m_message := "JSON.Dump() Failed " CONFIG_FILE "`n" e.m_message
    writeLogFile(ERROR, A_ThisFunc, A_LineNumber, m_message)
    showToolTip(ERROR, m_message)
    return
  }
  m_message := "JSON.Dump() Processed" CONFIG_FILE
  multiLineMessage := getToolTipMessage(multiLineMessage)
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  writeLogFile(TRACE, A_ThisFunc, A_LineNumber, config)
  FileDelete, %CONFIG_FILE%
  m_message := "FileDelete() " (ErrorLevel = 0 ? "Processed" : "Failed") " " CONFIG_FILE
  multiLineMessage := getToolTipMessage(multiLineMessage)
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  FileAppend, %config%, %CONFIG_FILE%
  m_message := "FileAppend() " (ErrorLevel = 0 ? "Processed" : "Failed") " " CONFIG_FILE
  multiLineMessage := getToolTipMessage(multiLineMessage)
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(INFO, multiLineMessage)
}

/*
get pixel color
*/
getPixelColor() {
  MouseGetPos, mouseX, mouseY
  PixelGetColor, color, %mouseX%, %mouseY%
  m_message := "PixelGetColor() "(ErrorLevel = 0 ? "Processed" : "Failed") " "color " " mouseX "," mouseY
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(INFO, m_message)
}

/*
get inventory map
*/
getInventoryMap(m_inventoryArray, presetMap) {
  for k, v in m_inventoryArray {
    if ((m_inventoryArray[A_Index].position[X] = presetMap.position[X]) && (m_inventoryArray[A_Index].position[Y] = presetMap.position[Y]))
      return % m_inventoryArray[A_Index]
  }
}

/*
get merchant map
*/
getMerchantMap(m_merchantArray, positionX, positionY) {
  for k, v in m_merchantArray {
    if ((m_merchantArray[A_Index].position[X] = positionX) && (m_merchantArray[A_Index].position[Y] = positionY))
      return % m_merchantArray[A_Index]
  }
}

/*
get equipment map
*/
getEquipmentMap(m_equipmentArray, itemType) {
  for k, v in m_equipmentArray {
    if (m_equipmentArray[A_Index].itemType = itemType)
      return % m_equipmentArray[A_Index]
  }
}

/*
get slot map
*/
getSlotMap(m_slotArray, activeSlot) {
  for k, v in m_slotArray {
    if (m_slotArray[A_Index].activeSlot = activeSlot)
      return % m_slotArray[A_Index]
  }
}

/*
is matched item
*/
isMatchedItem(itemDescription, partDescriptionArray) {
  for k, v in partDescriptionArray {
    itemIndex := A_index + 0 ;to number
    for k, v in partDescriptionArray[itemIndex] {
      partDescriptionIndex := A_index + 0 ;to number
      if (InStr(itemDescription, partDescriptionArray[itemIndex][partDescriptionIndex], false)) {
        isMatched := true
      } else {
        isMatched := false
        break
      }
    }
    if (isMatched)
      break
  }
  return isMatched
}

/*
remove log file
*/
removeLogFile(thresholdSize) {
  FileGetSize, fileSize, %LOG_FILE%, K
  m_message := "FileGetSize() " (ErrorLevel = 0 ? "Processed" : "Failed") " " fileSize "bytes " LOG_FILE
  multiLineMessage := getToolTipMessage(multiLineMessage)
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  if (fileSize < thresholdSize)
    return
  FileDelete, %LOG_FILE%
  m_message := "FileDelete() " (ErrorLevel = 0 ? "Processed" : "Failed") " " LOG_FILE
  multiLineMessage := getToolTipMessage(multiLineMessage)
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(INFO, multiLineMessage)
}

/*
write log file
*/
writeLogFile(level, functionName, lineNumber, message) {
  if (LOG_LEVEL > level)
    return
  ;write log file
  levelName := ""
  switch (level) {
    case TRACE:
      levelName := "TRACE"
    case DEBUG:
      levelName := "DEBUG"
    case INFO:
      levelName := "INFO"
    case WARN:
      levelName := "WARN"
    case ERROR:
      levelName := "ERROR"
    default:
  }
  FileAppend, % A_YYYY "-" A_MM  "-" A_DD " " A_Hour ":" A_Min ":" A_Sec "." A_MSec " " levelName " " A_ScriptName "." functionName "() Line " lineNumber " " message "`n", %LOG_FILE%
}

/*
show tooltip
*/
showToolTip(level, message) {
  if (LOG_LEVEL > level)
    return
  ToolTip, %message%, 8, 8
  SetTimer, removeToolTip, -2000
}

/*
get tool tip message
*/
getToolTipMessage(multiLineMessage) {
  return % multiLineMessage m_message (m_message = "" ? "" : "`n")
}

/*
play beep
*/
playBeep() {
  ;play beep
  loop, 3 {
    SoundBeep
    Sleep, 10
  }
}

/*
run as admin
*/
runAsAdmin() {
  m_message := "A_IsAdmin "(A_IsAdmin = 1 ? "Processed" : "Failed")
  writeLogFile(INFO, A_ThisFunc, A_LineNumber, m_message)
  showToolTip(INFO, m_message)
  if (A_IsAdmin) {
    return
  } else {  
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
  }
}

/*
test
*/
test() {
}