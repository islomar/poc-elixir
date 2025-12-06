# Elixir for Programmers, second edition
- https://codestool.coding-gnome.com/courses/elixir-for-programmers-2
- Dave Thomas, @pragdave
- https://pragdave.me/
- 9 hours of video
- 88 individual course units in 20 chapters
- 44 exercises

## Getting started
- Year 2022: using Elixir 1.12.3 (current version in December 2025: 1.19.4)
- `git clone https://github.com/pragdave/e4p2-hangman.git`
- The **OTP framework** is a sophisticated way of managing large (and small) scale deployments of applications containing thousands of modules and millions of processes.
  - OTP **(Open Telecom Platform)** is a set of libraries that ships with Erlang
- **hex** is the Elixir package repository. It maintains a repository of Elixir and Erlang packages (at [hex.pm](https://hex.pm/)).
- [**mix**](https://hexdocs.pm/mix/Mix.html): a project configuration management build tool
- [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html) is a unit-test based framework that ships with Elixir.
- **iex**: the Elixir REPL
  - `h IO` (help for IO module)
  - `IO.puts "Hello world!"`: puts for "put string"
  - `clear`
  - `h IO.puts`
  - `v(9)`: give me the valueo of expression number 9
  - `#iex:break`: stop execution
  - You can customize some aspects of IEx by writing code into a file called `.iex.exs`: [example](./.iex.exs.pragdave)
    - "IEx looks for .iex.exs in the current directory and then in your home directory. My configuration above sits in my home directory, so it applies to all IEx sessions."
    - `chardata_to_string` converts a list of strings into a single string.
    - "The colors in the .iex.exs file are written as :cyan, :light_magenta, :yellow, and so on. These values (which Elixir calls atoms) are interpreted inside IEx using calls to IO.ANSI format."
    - https://hexdocs.pm/elixir/IO.ANSI.html
    - "The colors in the default prompt section use the 8-bit color extension for ANSI X3.64 escape sequences, which are honored by just about all terminal programs (although you may have to enable them using the registry in Windows)."

## Our first project
- In Elixir, a **"project"** = **"application"** = **"component"**
- Sometimes an Elixir application is what you might call a **library**
- Hangman game:
  - **Dictionary** application/component
  - **Logic** application/component
  - **UI** applications/components (CLI, GUI)
- `mix new hangman`
  - the production code goes under `lib/`
  - the file `mix.exs` defines the configuration of your project
- `mix test`
- `mix`: compile the application