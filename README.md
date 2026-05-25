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

## Dependencies

- [ ] Godot
- [ ] [.NET SDK](https://dotnet.microsoft.com/en-us/download)
- [ ] Python (optional; for MkDocs)
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
godot -e .  # -e is shorthand for --editor
```

## Checklist

- [ ] Delete or update the [`LICENSE`](./LICENSE) file.
- [ ] Rename `~/.vscode/My Game.code-workspace` to your game's title (or don't).
- [ ] Install the recommended VSCode extensions.
- [ ] Update the game title in `~/docs`
- [ ] Update this `README.md`
- [ ] Update project settings.
- [ ] Review the codebase.

## Additional Resources

- [**NuGet**](https://www.nuget.org). Additional C# libraries made by other developers; especially useful for application developers.
- [**Godot Documentation**](https://docs.godotengine.org/en/stable/). Manual containing relevant Godot resources; also built into the engine.
- [**Godot Asset Store**](https://store.godotengine.org). Reusable assets made for the Godot game engine; includes libraries for programming.

## License

[Zero-Clause BSD](./LICENSE)

## Oath Against Bad Development Practices

> Don't take this on a personal level; see it as my own opinions, all up to you whether to agree or not :p

I swear to...

- [ ] ... avoid polluting the codebase with "manager" classes https://softwareengineering.stackexchange.com/a/129566
  - [ ] ... understand that by naming something `XManager` I'm not telling other programmers especially my future self meaningfully what it actually does.
  - [ ] ... know that I am not clarifying the responsibilities of modules / scripts within my codebase.
  - [ ] ... acknowledge this offers no structure to the codebase, and that inevitably there will be `Manager` classes making a mess like scattered Lego bricks on the floor.
  - [ ] ... either [read a book on design patterns](https://refactoring.guru/design-patterns) or [a video equivalent](https://youtu.be/tv-_1er1mWI).
- [ ] ... avoid misguiding myself into creating complex "false optimizations" by making assumptions without either [measurements from the profiler](https://docs.godotengine.org/en/stable/tutorials/scripting/debug/the_profiler.html) or citing a well researched / highly voted upon answer.
  - [ ] ... understand ["premature optimization is the root of all evil"](https://youtu.be/tKbV6BpH-C8) and that I'm only making it more difficult for everyone to understand my code.
  - [ ] ... understand that only after either measuring and/or researching that I will write code that while more difficult to understand is noticeably faster.
- [ ] ... avoid reinventing the wheel if an addon already exists unless I have reason to reinvent the wheel — that is, for example: available addons do not meet my requirements.
- [ ] ... in all earnest honesty that I will [**read the friendly manual**](https://en.wikipedia.org/wiki/RTFM), perhaps participate in communities such as forums, and sharpen my [google-fu](https://en.wiktionary.org/wiki/Google-fu) skills.
  - [ ] ... acknowledge [people do not like help vampires](https://meta.stackoverflow.com/a/258208)
  - [ ] ... [don't ask if I have permission to ask](https://dontasktoask.com), I'll just ask my question right away!
  - [ ] ... get straight to the point and ask my question, and that [I will not be a jerk by first starting with "are u available?"](https://nohello.net/en/) thus wasting everyone's time by refusing to recognize online messaging has different etiquette compared to speaking.
  - [ ] ... get the point that my peers are neither ChatGPT nor some sort of psychic mind-reader; they're at the end of the day still humans with limited bandwidth.

This list again should not be taken as authority — I trust those that have had the hands on experience to know what they're doing — but please, whatever you do, don't fall into the trap of vibecoding; cheating only piles up the problems for your future self.
