from dataclasses import dataclass
import os
import pathlib
import shutil
import subprocess

import copier
from rich.prompt import Confirm


@dataclass(frozen=True)
class Git:
    repo: str
    subdirectory: str
    vcs_ref: str | None = None


CI = os.getenv("ci_cd")
PROJECT_DIR = pathlib.Path(os.path.dirname(__file__)).parent.parent.absolute()
CACHE = f"{PROJECT_DIR}/.addons/copier"
ADDONS = f"{PROJECT_DIR}/addons"


DEPENDENCIES = {
    "shaderV": Git(
        repo="gh:arkology/ShaderV",
        subdirectory="addons/shaderV",
    ),
    "quick_layout_changer": Git(
        repo="gh:mathrick/godot-quick-layout-changer",
        subdirectory="addons/quick_layout_changer",
    ),
}

addons_exists = False
if pathlib.Path(ADDONS).exists():
    with os.scandir(ADDONS) as directory:
        (addons_exists := True) if any(directory) else None

if (
    not CI
    and addons_exists
    and Confirm.ask("Addons folder already exists. Delete for proper installation?")
):
    shutil.rmtree(ADDONS)

subprocess.run(["dotnet", "godotenv", "addons", "install"], shell=True)


for name, git in DEPENDENCIES.items():
    normalize = os.path.normpath

    dependency = normalize(f"{CACHE}/{name}")
    addon = normalize(f"{dependency}/{git.subdirectory}")
    target = normalize(f"{PROJECT_DIR}/addons/{name}")

    if not pathlib.Path(dependency).exists() or Confirm.ask(
        f"Update dependency {name}?"
    ):
        copier.run_copy(git.repo, dependency, vcs_ref=git.vcs_ref)

    try:
        subprocess.run(["mklink", "/j", target, addon], shell=True, capture_output=True)
    except PermissionError:
        if pathlib.Path(target).exists():
            shutil.rmtree(target)
        shutil.copytree(addon, target)
