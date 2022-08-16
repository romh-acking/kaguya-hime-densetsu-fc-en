[//]: <> (This readme is in the markdown format. Please preview in a markdown parser.)

# Kaguya Hime Densetsu: English Translation

## About
This repository contains source code for patches and tools to compile an English translation of Kaguya Hime Densetsu for the Famicom.

## Folders

* asm
	* Contains the asm files which are to be compiled with xkas
    * There's also an asm patch file that's commented out in the Write.bat script.
        * `Graphical Improvement.asm`: This somewhat improves some of the wonky CG art within the game.
* lua
    * Some lua scripts for debugging purposes. Lets you display cursor, score, and health values from ram.
* roms
	* Use this to store your roms
    * Please place a Japanese rom titled `Kaguya Hime Densetsu (Japan).nes`.
* script
	* Contains the dump script in Script.json. It contains the Japanese script, the English translation, and snark's original translation for comparison sake.
	* You can also store xlsx backups of the script here.
* tables
	* Contains table files
		* Files prefixed with "CHR" specify byte to character mapping.
		* Files prefixed with "Dictionary" specify dictionary mapping. A dictionary can be mapped to multiple character values.
		* Files prefixed with "SquishyText" do some find and replace functions
			* "SquishyText - New.tbl" replaces character patterns to be in one tile. For example, "ll" is converted to the character "[ll]".
		* Files with "Length" let you specify how wide, in pixels, characters are. This affects `spiro.exe`'s autolinebreaking logic. For a game without VWF, most characters should have a length of `8`. 
* tools
	* cyproAce
		* A script editor 
	* spiro
		* Script dumper and inserter
	* xkas+
		* Applies the assembly patches

## Manual
Check out the repo [kaguya-hime-densetsu-fc-en-manual](https://github.com/romh-acking/kaguya-hime-densetsu-fc-en-manual) for manual resources.

## Instructions
The tools are coded in C#. You'll have to mess with Wine if you want them to run in Linux. You'll also have to rewrite the bat files, which aren't complicated at all.

* If you want to dump the script for whatever reason (the Japanese and English script are already included in this repository), you can dump it by executing the bat file "Dump.bat" by double clicking it.
* To generate an NES rom file with the translation and patches included execute the bat file "Write.bat" by double clicking it.

## Changelog
* 2022 Auguest 16th: 1.1
	* Changes to three lines: one for grammar, one for script consistency, and one was to fix a mistranslation that was missed it snark's old translation (for one of the quiz questions)
* 2022 July 31st: 1.0
    * Initial release

## Credits

### Main Team
* FCandChill
    * ASM work
    * Utilities
    * Localizer
    * Proofreader
    * Manual
    * Graphics
* TheMajinZenki
    * Translator
	
### Support
* pinobath:
	* CRT guidance
* snarf
	* xkas troubleshooting
* Kajitani-Eizan#9804
	* Localization tips
* Pennywise
    * Guidance
* Filler
    * Spot translation
	
### Previous Project Owners
* Pennywise
* Eien Ni Hen
* Zynk

### Beta Testers
* ppltoast
* cccmar
* marklincadet
