## Oath Against Bad Development Practices

> Don't take this on a personal level; see it as my own opinions, all up to you whether to agree or not :p

I swear to...

- [ ] ... avoid polluting codebases with "manager" classes https://softwareengineering.stackexchange.com/a/129566
  - [ ] ... understand that by naming something `XManager` I'm not telling other programmers especially my future self meaningfully what it actually does
  - [ ] ...  recognize **I'm already managing data / behaviors just by programming** hence the need to avoid manager classes.
  - [ ] ... acknowledge this offers no structure to the codebase, and that inevitably these `Manager` will leave a difficult or worse impossible to understand mess because the name itself inherently does not clarify anything.
  - [ ] ... either [read a book on design patterns](https://refactoring.guru/design-patterns) or [a video equivalent](https://youtu.be/tv-_1er1mWI).
  - For example: The name `DuplicateManager` does not immediately tell other developers what it does.
    - How does it manage duplicates? Do duplicates mean the noun (objects that one has cloned) or the verb (the act of duplicating)
    - By writing code you're already managing something. How would one make it more clear the purpose of the class?
    - If it's to store something in memory to avoid expensive instantiation, you're looking for the term "cache"
    - If it's to create a clone of an object, [this is already handled by Godot](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-duplicate)
- [ ] ... avoid misguiding myself into creating complex "false optimizations" by making assumptions without either [measurements from the profiler](https://docs.godotengine.org/en/stable/tutorials/scripting/debug/the_profiler.html) or citing a well researched / highly voted upon answer.
  - [ ] ... understand ["premature optimization is the root of all evil"](https://youtu.be/tKbV6BpH-C8) and that I'm only making it more difficult for everyone to understand and use my code.
  - [ ] ... understand that only after either measuring and/or researching that I will write code that while more difficult to understand is noticeably faster.
    - You do not necessarily need to be scientific, just be sure the effects are observable.
    - Sometimes it's clear it won't work without needing research or measurements (e.g: moving the game onto an SSD **will not** and **should not** be expected to improve the frames per second; it will improve file loading speed but does not fix the actual issue of the CPU and/or GPU being overworked)
  - [ ] ... understand simple can be better than complex until complexity is called for **because** I have measured it and/or researched it to be the case.
- [ ] ... avoid reinventing the wheel if an addon already exists unless I have reason to reinvent the wheel — that is, for example: available addons do not meet my requirements.
  - (Yes, there are other valid reasons to reinvent the wheel such as for the purpose of learning, but it's also important to try accomplish deadlines)
- [ ] ... in all earnest honesty that I will [**read the friendly manual**](https://en.wikipedia.org/wiki/RTFM), perhaps participate in communities such as forums, and sharpen my [google-fu](https://en.wiktionary.org/wiki/Google-fu) skills.
  - [ ] ... [don't ask if I have permission to ask](https://dontasktoask.com), I'll just ask my question right away!
    - It's not rude to ask your question directly, often it's appreciated that you understand the asynchronous nature of online messaging. The person to whom you're asking your question to will reply at their own pace.
    - In contrast it's often seen as rude to ask if you have permission to ask a question given by doing that you've already asked a question, and you've wasted both your own time and the other person's time waiting for the other person to reply that they're available.
      - Example phrases where one is clearly asking if they have permission to ask: "are u available?", "can i ask u a question?", "help me X" without also providing them your question, etc.
      - Do not be surprised if you will be ignored as it's seen as a sign that the problem isn't serious to begin with if you can't bother following proper online etiquette; the other person likely has more pressing issues to tackle.
  - [ ] ... get the point that my peers are neither ChatGPT which does not tire nor some sort of psychic mind-reader.
    - Nobody can immediately understand what you mean when you provide a vague reply with little to no information, understand your collaborators can not read exactly what's on your mind.
    - Your peers are not a walking encyclopedia that can answer every single question you have. If they have made it clear this is not within their expertise and that they may not help you with it, do not force them to help you; it will harm both you and them.
    - Unlike chatbots, your peers can become exhausted. For the sake of everyone involved please have the decency not to make it your first instinct to reach out to your peers if it can be clearly answered by Google or other sites such as YouTube and Stack Overflow. You do not want to become a [help vampire](https://meta.stackexchange.com/questions/19665/the-help-vampire-problem) nor for you to act entitled.
- [ ] ... **understand** Agile facilitates being able to respond to changing client requirements but is **not** an excuse to have no defined vision (i.e: being the "ideas guy" yet no actual cohesive game or story to show for it; **always** throwing all progress away to redo it from scratch; etc.).
- [ ] ... not take assets without following the license that it has granted to me.
  - I can't believe this needs to be said — do not take credit for something that you had just copied and pasted from online without even bothering to give proper credit.
  - **Do research** if the license for the asset permits you to use it or not.
- [ ] ... will not act entitled as if I did nothing wrong when I'm caught red handed with definitive proof/evidence.
  - Mistakes are fine and understood to be unintentional, you take ownership of what you did not out of shame but out of understanding.
- [ ] ... be able to function without the use of Generative AI, and that it is not an excuse to cheat/reject learning how to read and write code, do art, manage projects, etc., knowing that I can not contribute if I can not ever access it (e.g: service outage, unable to afford it, limited hardware, organizational ban, etc.).
  - **You will be a better developer or artist if you can function without Generative AI.** People have done it not even that long ago and it teaches you not to be entirely dependent on something that can very easily be taken away from you.
  - Your peers and customers will respect you more for it.

This list again should not be taken as authority — I trust those that have had the hands on experience to know what they're doing.

This checklist takes a jab at what I had experienced so far when collaborating in game development that introduced unnecessary friction, what can be done to address these future inevitable difficulties, and a reminder of how one (including the writer/s of this document) can do better.
