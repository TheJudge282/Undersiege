"""
A simple mod that copies the original game files.
"""

import os
import shutil

def runmod(level_dir, mods_dir, mod_dir, level_name, tools, info, **kwargs):
    dest_dir = os.path.join(mod_dir, "Levels", level_name)
    if not os.path.exists(dest_dir):
        shutil.copytree(level_dir, dest_dir)
