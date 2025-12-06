# PoC Elixir
- Playground for learning about Elixir

- https://elixir-lang.org/
  - Elixir is a dynamic, functional language for building scalable and maintainable applications.
  - Elixir runs on the Erlang VM, known for creating low-latency, distributed, and fault-tolerant systems.
- [Elixir: The Documentary](https://www.youtube.com/watch?v=lxYFOM3UJzo)
  - José Valim
- https://en.wikipedia.org/wiki/Elixir_(programming_language)

## General
- **IEx**: Elixir Interactive Shell (a REPL: Read-Eval-Print Loop)
- It uses features of Ruby, Erlang, and Clojure to develop a high-concurrency and low-latency language. It was designed to handle large data volumes. Elixir is also used in telecommunications, e-commerce, and finance.
- Runs on the BEAM virtual machine, which is also used to implement the Erlang programming language
  - BEAM is the virtual machine at the core of the Erlang Open Telecom Platform (OTP). BEAM is part of the Erlang Run-Time System (ERTS), which compiles Erlang source code into bytecode, which is then executed on the BEAM. BEAM bytecode files have the .beam file extension.
  - Bxxx Erlang Abstract Machine
- Phoenix: web framework over Elixir
- https://github.com/elixir-lang/elixir
- The only prerequisite for Elixir is Erlang, version 26.0 or later.

### Basic types
- General
    - integer
    - float: 64-bit precision
    - boolean: true / false
    - atom / symbol
    - string
    - list
    - tuple
- Basic arithmetic
    - `/` always returns a float. Use `div()` or `rem` (reminder) for integer divisions
    - `round()`, `trunc()`
- `is_integer`
- `or`, `and`, `not`: better for booleans
- `!`, `&&`, `||`: for non-booleans
- `raise("This is an error)`
- `nil`: absence of a value
- `0` and `""` are truthy

### Atoms
- An atom is a constant whose value is its own name. Some other languages call these symbols.
- E.g. `:apple`
- They are often useful to enumerate over distinct values.
- Similar to Enums?
- Often they are used to express the state of an operation, by using values such as `:ok` and `:error`.
- The booleans `true` and `false` are also atoms.
- Elixir allows you to skip the leading `:` for the atoms `false`, `true` and `nil`.

## Strings

- `IO.puts` function returns the atom `:ok` after printing.
- Strings in Elixir are represented internally by contiguous sequences of bytes known as binaries.
- You can use the strict comparison operator === and !== if you want to distinguish between `integers` and `floats`

## Learning resources

- https://elixir-lang.org/learning.html
- https://leanpub.com/elixir-toyrobot (BDD with Elixir, simple examples)
- [Asking questions](https://elixir-lang.org/install.html#asking-questions)
- [Elixir Learning Plan (2024)](https://dev.to/aaronblondeau/elixir-learning-plan-377g)
- https://plugins.jetbrains.com/plugin/7522-elixir
  - https://github.com/KronicDeth/intellij-elixir/blob/main/README.md
- https://www.elixirconf.eu/
- https://github.com/elixirkoans/elixir-koans
- Georgina McFadyen
  - [SOLID Elixir • Georgina McFadyen • GOTO 2018](https://www.youtube.com/watch?v=rmftOs2BzgU)

## TDD and Testing

- https://github.com/shufo/learning-elixir-with-tdd

## Dockerization  

- For production usage, we recommend using [Hex.pm Docker images](https://hub.docker.com/r/hexpm/elixir), which are immutable and point to a specific Erlang and Elixir version.
- https://hub.docker.com/_/elixir
  - `docker pull elixir:slim`
  - REPL: `docker run -it --rm elixir`
  - Bash inside container: `docker run -it --rm elixir bash`
  - Run a single Elixir exs script: `docker run -it --rm --name elixir-inst1 -v "$PWD":/usr/src/myapp -w /usr/src/myapp elixir elixir your-escript.exs`
- https://dev.to/noelworden/elixir-phoenix-project-dockerizing-10p7 (2020)
- https://pentacent.medium.com/getting-started-with-elixir-docker-982e2a16213c (2017)

## Elixir and LLMs

- https://elixirforum.com/t/heres-how-im-coding-elixir-with-ai-results-are-mixed-mostly-positive-how-about-you/71588