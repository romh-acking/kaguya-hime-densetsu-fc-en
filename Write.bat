::Roms
set baseImage=roms\Kaguya Hime Densetsu (Japan).nes
set expandImage=roms\Kaguya Hime Densetsu (EXPAND).nes
set newImage=roms\Kaguya Hime Densetsu (NEW).nes

::Folders
set projectFolder=%cd%
set toolsFolder=%projectFolder%\tools

set spiroFolder=%toolsFolder%\spiro
set xkasFolder=%toolsFolder%\xkas
set asmFolder=%cd%\asm

del "%newImage%"
del "%expandImage%"

copy "%baseImage%" "%expandImage%"

::Xkas script to expand rom
"%xkasFolder%\xkas+.exe" -o "%expandImage%" "%asmFolder%\Expand.asm"

copy "%expandImage%" "%newImage%"

::Write script to rom
"%spiroFolder%\Spiro.exe" /ProjectDirectory "%projectFolder%" /WriteScriptToROM

::Xkas scripts
"%xkasFolder%\xkas+.exe" -o "%newImage%" "%asmFolder%\Graphics.asm" "%asmFolder%\Main.asm"
::"%xkasFolder%\xkas+.exe" -o "%newImage%" "%asmFolder%\Graphical Improvement.asm"


"%newImage%"
::@Pause
