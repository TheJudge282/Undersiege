# Undersiege
Files and mods for Undersiege (2005)

# Introduction
The files (assets, most source) for Undersiege are locked in `levels.cat` which is a custom file format written by the developer and which contains a simple encryption (as far as I could tell).
There are two main executables for the game:
- `Under_Siege.exe`: This is the interface and the entry point for the game.
- `level.cnf` (for each level): This is the actual game engine executable. The game uses the acknex A5 / 3D GameStudio engine.

When a level is loaded in `Under_Siege.exe`, it extracts the level files from `levels.Cat` into a directory called `LevelData` in the game's installation folder, and then executes the engine `level.cnf`. When the level ends (engine execution finishes), the game's executable deletes the extracted files.
The level files themselves are made up of assets and source code. The acknex engine uses `.wdl` script files which are in plain-text so the game's logic can be easily modified. Some game code is compiled and made in the form of engine extensions in the `plug.dll` and `plug1.dll` files.
The way modding is done is by patching and injecting custom code into `Under_Siege.exe` so that it executes a python script before right before executing the engine and after extracing the files. The script acts as a mod-manager and runs mod script files that can modify the level files as desired.

# Installing mods and cheatmod
Need:
- [Python 3](https://www.python.org/downloads/):
    - **Important**: python **must** be added to PATH. You must select that option when installing it.
    - For Windows XP, the last available python version is [python 3.4.4](https://www.python.org/downloads/release/python-344/).
    - For Windows 7, [python 3.8.9](https://www.python.org/downloads/release/python-389/) installs without a problem.

Steps:
1. Grab files from the releases page.
2. Replace your original `Under_Siege.exe` with the one you just downloaded.
3. Copy `mod.py` and the `mods` directory to the game's installation folder, which is usually `C:\Program Files (x86)\AFKARMEDIA\UnderSiege\UnderSiege Gold` or `C:\Program Files\AFKARMEDIA\UnderSiege\UnderSiege Gold`.

# Original unpacked game files
https://drive.google.com/file/d/13aj0IPf6tgRpDzSywooiEo6h7KRTTbWw/view?usp=sharing

# Downloading the game
- https://archive.org/details/UnderSiege.7z
- https://www.mediafire.com/file/33tni88hfpny6td/Full_Version.rar

# Patching Under\_Siege.exe (inject.asm)
Need:
- [Netwide Assembler (NASM)](https://www.nasm.us): used for assembling `inject.asm` into a pure binary blob. The code is also written in its syntax.
- [CFF Explorer](https://ntcore.com/?page_id=388): used to add a new code section to `Under_Siege.exe` and expand it.
- [Ghidra](https://ghidra-sre.org): used to patch `Under_Siege.exe` and to map the relocation for the DLL functions that are called in `inject.asm`.

Steps:
1. Assemble `inject.asm` into a pure binary blob with `nasm -f bin inject.asm -o inject.bin`.
2. Open the original `Under_Siege.exe` in CFF Explorer:
    - Go to `Section Headers`, right-click and choose `Add Section (File Data)` and choose `inject.bin`.
    - Put `mod` or whatever you want in the section name field.
    - Change the section size to `200` (hex).
    - Right-click on the `Characteristics` field and choose `Change Section Flags`, then make sure that only the following flags are set:
        - `Is executable`
        - `Is readable`
        - `Contains code`
    - Save and exit.
3. Load the modified `Under_Siege.exe` in Ghidra and open the disassembler window for patching instructions:
    - Go to the new section you added, right click and choose `Disassemble`, and patch the `CALL 0` instructions with the correct function specified in the source code. Use `Patch Instruction` for this.
    - Rename the label at the top of your section to something like `mod_enter`.
    - Patch the original `CreateProcessA` call with a call to our new label:
        - In the vanilla file, the call instruction is at virtual address `00499227` (choose `Navigation->Go To` and enter this number).
        - Replace the instructions starting from `PUSH EAX` up to and including the `CALL` instruction. Put one `CALL mod` instruction, and fill the rest with `NOP` instructions.
    - Save
    - Go to `File->Export Program`, set the format to either `Original File` or `PE`, select the destination, and click ok.

# Writing mods
To write a new mod, you need to create a new directory in the `mods` directory, add a file named `run.py` inside it, and add your mod's name to `mods/mod-order.txt`.

Make sure your mod's name is compatible with python module names because it gets imported that way.

The `run.py` file must have the following interface, which will be called by `mod.py` for the actual execution:
```python
def runmod(level_dir, mods_dir, mod_dir, level_name, tools, info, **kwargs):
    pass
```

Some tools will be provided with the release files. These can be inspected in the [links.txt](https://github.com/TheJudge282/Undersiege/blob/main/mods/tools/links.txt) file, and the path to them will be provided in the `info` parameter.
The `patch` tool is particularly useful for applying source modifications.

# Misc
## level.cnf / acknex patch needed for modifying WDL files
The engine executable for each level contains checksums for the `wdl` files and will refuse to start if it detects modification. `mod.py` automatically applies the following patch, which changes some conditional jump instructions to bypass the checks:
https://github.com/TheJudge282/Undersiege/blob/c7c01998b5d2d6b01c2cb8cde2f561e56b148f47/mod.py#L89-L96
## More info about Under_Siege.exe and levels.Cat
The `Under_Siege.exe` file was written in the delphi programming language.
The `levels.Cat` file seems to contain a sort of serialization for types and structures used in `Under_Siege.exe` to represent level files.

Additionally, the content of `levels.Cat` is encrypted. Here's an example of the encryption:
The following are the bytes at offset `0x3B` of the file:
```
06 00 00 00 4D 67 79 69 71 37 | ....Mgyiq7
```
The bytes `06 00 00 00` represent a string length in little-endian encoding. The following 6 bytes are the encrypted string.

Each character is shifted forward by it's position in the string starting from 1. To decrypt, it needs to be shifted backwards:
- `M` shifted back by 1 -> `L`
- `g` shifted back by 2 -> `e`

and so on.

Decrypted string: `Level1`

Another example: `0x2F` bytes at offset `0x6E` decrypt to `F:\Data Line\International\level1.cd\level1.exe`.
