<hgroup>
  <h1 align="center">
    <code>@gekkotadev</code>'s Godot Game Template
  </h1>
  <p align="center">
    <i>There are many like it, but this one is mine.</i>
  </p>
<hgroup>

A Godot game template with a subjectively sensible set of defaults to serve my
own needs — but maybe it'll work for your needs too. It assumes VS Code as your
IDE, comes pre-configured with a default set of add-ons, and set up with what I
perceive to be a good enough project structure to get started with.

Not optimized for any particular genre or type of game, just a general starter.

## Dependencies

- [ ] Godot
- [ ] [.NET SDK](https://dotnet.microsoft.com/en-us/download)
- [ ] Python
  - [ ] [uv](https://docs.astral.sh/uv/getting-started/installation/#__tabbed_1_2)

## Usage

<details>
  <summary>
    <h3>Cloning (select one method)</h3>
  </summary>

  #### [Copier](https://copier.readthedocs.io/en/stable/)

  ```sh
  # Set <project-folder> as "." if cloning into the current folder.
  
  copier copy https://github.com/gekkotadev/ggt <project-folder>
  cd <project-folder>
  git init -b main  # Creates your own Git repository
  ```


  #### [Giget](https://github.com/unjs/giget)
  
  ```sh
  # Set <project-folder> as "." if cloning into the current folder.

  npx giget@latest https://github.com/gekkotadev/ggt <project-folder>
  cd <project-folder>
  git init -b main  # Creates your own Git repository
  ```


  #### Powershell
  
  ```pwsh
  # Set <project-folder> as "." if cloning into the current folder.
  
  git clone https://github.com/gekkotadev/ggt <project-folder>
  cd <project-folder>
  rm -Recurse -Force .git
  git init -b main  # Creates your own Git repository
  ```


  #### Nushell/Zsh/Bash
  
  ```zsh
  # Set <project-folder> as "." if cloning into the current folder.
  
  git clone https://github.com/gekkotadev/ggt <project-folder>
  cd <project-folder>
  rm -rf .git
  git init -b main  # Creates your own Git repository
  ```
</details>

### Initialization

```sh
dotnet tool restore
uv install
uv run ./scripts/python/install_addons.py
godot -e .  # -e is shorthand for --editor
```

## Checklist

- [ ] Delete or update the [`LICENSE`](./LICENSE) file
- [ ] Rename `~/.vscode/My Game.code-workspace` to your game's title (or don't)
- [ ] Install the recommended VSCode extensions.
- [ ] Update the game title in `~/docs`
- [ ] Update this `README.md`
