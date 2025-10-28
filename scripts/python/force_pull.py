import shutil
import subprocess

from rich import print
from rich.prompt import Confirm


ORIGIN = "[bold blue]origin[/bold blue]"

INFO = "[bold blue]INFO[/bold blue]"
WARN = "[bold yellow]WARN[/bold yellow]"


def main():
    print(f"Rolling back to latest commit from {ORIGIN}.")

    permission = Confirm.ask(f"{WARN} All uncommitted work will be lost, continue?")

    if (
        not permission
        and shutil.which("lazygit")
        and Confirm.ask(f"{INFO} Commit files with Lazygit?")
    ):
        subprocess.run(["lazygit"], shell=False)
        return

    if (
        not permission
        and shutil.which("gitui")
        and Confirm.ask(f"{INFO} Commit files with gitui?")
    ):
        subprocess.run(["gitui"], shell=False)
        return

    if not permission:
        return

    subprocess.run(["git", "add", "."], shell=False)
    subprocess.run(["git", "stash"], shell=False)
    subprocess.run(["git", "pull"], shell=False)
    subprocess.run(["git", "stash", "drop"], shell=False)


if __name__ == "__main__":
    main()
