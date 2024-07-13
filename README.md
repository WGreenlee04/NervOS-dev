# NervOS: Configuration Designed for Reuse 
### (Start Here!)
![A brain computer interface, the theme image for the NervOS repository.](https://github.com/WGreenlee04/NervOS/blob/main/nervos.avif)

Hey, it's me, the guy who took a software engineering class and developed a cripling obsession with reusability and modularity in the software I write.<sup>1</sup> If the language supports it, I implement systems of reuse wherever I can. As it turns out, Nix is one of those languages! As I explored the countless public configurations on the internet, I started to realize that it was difficult to copy and paste things from other configs into my own without **modifying components** (insert spooky music here). This project, and the resulting config, was my attempt to help fix that issue, and give people a quality set of components that they can reuse in their own configs.

<sub>1. Apparently, so are most in this community.</sub>

## Principles
I realized quickly that there is no such thing as modularization without opinion in declarative configuration. If you split everything up into completely minimal components, you would end up with essentially useless one-line modules. Things must be grouped together conceptually, and concepts entail opinion. With this realization, I set out with a few principles (some might call them axioms) to keep me on track. They take precidence in the order they are listed:

#### Reusability
I intend for this repository to be piecewise reusable without modificaiton. In practice, you should frequently be able to identify a file's purpose, and swap it in anywhere in your own config, so long as you can import modules.

#### Extensibility
All of the files should be open for extension, but closed for modification. In practice, this means that all of the options in a file should be exposed in order to enable maximum potential for reuse.

#### Ease of Understanding
Frequently, when people stumble onto declarative linux OSes, they are thrown to the wolves. They are suggested to explore massive repositories with minimal documentation on the choices made in each file. This presents a problem: in order to understand the configuration, one must understand the language, and to truly understand the language, you must understand the configurations. In contrast, I intend to provide a beginner friendly entry point with lots of documentation to explore not only the syntax, but my thought process for choosing a given option.

## Sounds Good, Now Live Up To Your Promises
**Woah there**, cowboy, good things take time! As of writing this, the repo is in version 0.1.0. I won't make an official release until I am sure everything meets my own standards and your expectations. Along with this, I will include a wiki that should help some less familiar people get aquainted with declarative languages and OS configuration.

## Contact Me. No, Really.
If you have any questions, concerns, or ransoms to hold against me, send me an email. I am always open to discussion about this repo and the philosphy of software development. The email provided below is my public one, so it might take me a while to sort through the week's ads and other junk before I see your email. I look forward to hearing from you!

greenlee04@gmail.com