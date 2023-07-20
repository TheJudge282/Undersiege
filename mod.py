import datetime
import importlib
import logging
import os
import subprocess
import sys
import traceback

cwd = os.getcwd()
logfile = os.path.join("..", "mod.log") if os.path.basename(cwd) == "LevelData" else "mod.log"
logformat = "[%(asctime)s] %(levelname)s [%(name)s.%(funcName)s:%(lineno)d] %(message)s"
try:
    logging.basicConfig(filename=logfile, format=logformat, level=logging.DEBUG, force=True)
except Exception as e:
    logging.basicConfig(level=logging.DEBUG, format=logformat, force=True)
    logging.error("Could not create log file: " + str(e))

try:
    logging.info("Invoked new instance.")

    logging.debug("Working Directory: " + cwd)
    if os.path.basename(cwd) != "LevelData":
        logging.error("Current working directory is incorrect. Cannot continue.")
        sys.exit(1)

    # The level wdl file associated with the engine level.cnf file is a null-terminated string
    # at offest 0xA5BE0 in the engine executable.
    with open("level.cnf", "rb") as acknex_file:
        acknex_bytes = list(acknex_file.read())
    level = ""
    i = 0xA5BE0
    while acknex_bytes[i] != 0:
        level += chr(acknex_bytes[i])
        i += 1

    # Many levels have two parts/missions. Remapping the names to make them more clear.
    level_name_map = {
        "level1": "Level1",
        "lev2h": "Level2",
        "level3": "Level3",
        "level4h1": "Level4a",
        "level4h2": "Level4b",
        "level52h": "Level5a",
        "level51h": "Level5b",
        "lev6Ah": "Level6a",
        "lev6Mh": "Level6b",
        "lev7h1": "Level7a",
        "lev7h2": "Level7b",
        "level8h1": "Level8a",
        "level8h2": "Level8b",
        "level09h": "Level9",
        "lev10hk": "Level10a",
        "lev10ha": "Level10b",
        "lev11hk": "Level11a",
        "lev11ha": "Level11b",
        "lev12hk": "Level12a",
        "lev12ha": "Level12b"
    }
    level_name = level_name_map[level]

    # Adding the mods directory into the python import path.
    mods_dir = os.path.realpath(os.path.join("..", "mods"))
    logging.info("Level: %s -> %s", level, level_name)
    sys.path.append(os.path.realpath(mods_dir))
    level_dir = cwd

    tools = {
        "patch": os.path.join(mods_dir, "tools", "bin", "patch.exe")
        }
    # info dict for future expansion and backwards-compatibility.
    info = {
        "ver": "1.0"
        }

    # Load and run the mods.
    with open(os.path.join(mods_dir, "mod-order.txt")) as f:
        for line in f.readlines():
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            mod_name = line
            mod_dir = os.path.join(mods_dir, mod_name)
            if not os.path.exists(mod_dir):
                logging.error(f"Mod '{mod_name}' does not exist.")
                sys.exit(1)
            mod = importlib.import_module(f"{mod_name}.run")
            mod.runmod(level_dir, mods_dir, mod_dir, level_name, tools, info)

    # Patch acknex.
    # Engine executable contains checks if the wdl files have been modified. This patch
    # bypasses them by changing some conditional jump instructions.
    acknex_bytes[0xF0D0] = 0xEB
    acknex_bytes[0xF160] = 0xEB
    acknex_bytes[0xF5FC] = 0xB8
    acknex_bytes[0xF5FD] = 0x01
    acknex_bytes[0xF5FE] = 0x00
    with open("level.cnf", "wb") as acknex_file:
        acknex_file.write(bytes(acknex_bytes))
except Exception as e:
    if isinstance(e, SystemExit):
        raise
    logging.error("Caught exception: " + str(e))
    logging.error(traceback.format_exc())
    sys.exit(1)
