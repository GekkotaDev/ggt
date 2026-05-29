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
  - [ ] ... understand that by naming something `XManager` I'm not telling other programmers especially my future self meaningfully what it actually does
  - [ ] ...  recognize **I'm already managing data / behaviors** when programming hence the need to avoid manager classes.
  - [ ] ... acknowledge this offers no structure to the codebase, and that inevitably these `Manager` will leave a difficult or worse impossible to understand mess.
  - [ ] ... either [read a book on design patterns](https://refactoring.guru/design-patterns) or [a video equivalent](https://youtu.be/tv-_1er1mWI).
- [ ] ... avoid misguiding myself into creating complex "false optimizations" by making assumptions without either [measurements from the profiler](https://docs.godotengine.org/en/stable/tutorials/scripting/debug/the_profiler.html) or citing a well researched / highly voted upon answer.
  - [ ] ... understand ["premature optimization is the root of all evil"](https://youtu.be/tKbV6BpH-C8) and that I'm only making it more difficult for everyone to understand and use my code.
  - [ ] ... understand that only after either measuring and/or researching that I will write code that while more difficult to understand is noticeably faster.
- [ ] ... avoid reinventing the wheel if an addon already exists unless I have reason to reinvent the wheel — that is, for example: available addons do not meet my requirements.
  - (Yes, there are other valid reasons to reinvent the wheel such as for the purpose of learning, but it's also important to try accomplish deadlines)
- [ ] ... in all earnest honesty that I will [**read the friendly manual**](https://en.wikipedia.org/wiki/RTFM), perhaps participate in communities such as forums, and sharpen my [google-fu](https://en.wiktionary.org/wiki/Google-fu) skills.
  - [ ] ... acknowledge [people do not like help vampires](https://meta.stackoverflow.com/a/258208)
  - [ ] ... [don't ask if I have permission to ask](https://dontasktoask.com), I'll just ask my question right away!
  - [ ] ... [get straight to the point and ask my question](https://nohello.net/en/) and understand it's not rude; it's rude to ask "are u available?" in online messaging as it defeats the point and wastes time.
  - [ ] ... get the point that my peers are neither ChatGPT nor some sort of psychic mind-reader; they're at the end of the day still humans with limited bandwidth.
- [ ] ... **understand** Agile facilitates being able to respond to changing client requirements but is **not** an excuse to have no defined vision (e.g: being the "ideas guy" yet lack the competency for a cohesive game or story).

This list again should not be taken as authority — I trust those that have had the hands on experience to know what they're doing — aside on one point; please be able to develop software without relying solely on Generative AI, no matter your stance please recognize you should not be reliant on being spoonfed answers and/or on a subscription service.

## TODO

- [ ] Set up boilerplate for creating game installers.
  - [ ] Windows: NSIS, Inno, Wix, Qt, etc.
  - [ ] Linux: Qt, AppImages, ???
  - [ ] macOS: Automated `.app` bundles
