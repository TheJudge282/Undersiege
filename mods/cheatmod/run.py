"""
A mod that adds infinite health, infinite ammo, and noclip mode to the game.
"""

import logging
import os
import shutil
import subprocess

def runmod(level_dir, mods_dir, mod_dir, level_name, tools, info, **kwargs):
    cmd = '"{}" -d "{}" --verbose -p3 --no-backup-if-mismatch -i "{}"'.format(
        tools["patch"], level_dir,
        os.path.join(mod_dir, "patches", f"{level_name}.patch"))
    ret = subprocess.run(cmd, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
    if ret.returncode != 0:
        logging.error(f"Failed to patch {level_name}")
        logging.error("out:\n%s", ret.stdout.decode())
        logging.error("err:\n%s", ret.stderr.decode())
    # system.pcx is the font used to display the cheat menu.
    shutil.copyfile(os.path.join(mod_dir, "system.pcx"),
                    os.path.join(level_dir, "system.pcx"))
    shutil.copyfile(os.path.join(mod_dir, "cheat-defaults.txt"),
                    os.path.join(level_dir, "cheat-defaults.txt"))

