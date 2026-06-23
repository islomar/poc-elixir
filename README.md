# PoC Elixir

- Playground for learning about Elixir

- <https://elixir-lang.org/>
  - Elixir is a dynamically typed, functional language for building scalable and maintainable applications.
  - Elixir runs on the Erlang VM, known for creating low-latency, distributed, and fault-tolerant systems.
- [Elixir: The Documentary](https://www.youtube.com/watch?v=lxYFOM3UJzo)
  - José Valim
- <https://en.wikipedia.org/wiki/Elixir_(programming_language)>

## General

- **IEx**: Elixir Interactive Shell (a REPL: Read-Eval-Print Loop)
- It uses features of Ruby, Erlang, and Clojure to develop a **high-concurrency and low-latency** language. It was designed to handle large data volumes. Elixir is also used in telecommunications, e-commerce, and finance.
- Runs on the **BEAM** virtual machine, which is also used to implement the Erlang programming language
  - BEAM is the virtual machine at the core of the Erlang **Open Telecom Platform (OTP)**. BEAM is part of the Erlang Run-Time System (ERTS), which compiles Erlang source code into bytecode, which is then executed on the BEAM. BEAM bytecode files have the .beam file extension.
  - Bogdan/Björn's Erlang Abstract Machine
- Phoenix: web framework over Elixir
- <https://github.com/elixir-lang/elixir>
- The only prerequisite for Elixir is Erlang, version 26.0 or later.
- It compiles to BEAM bytecode, bringing better performance than interpreted languages.
- Used by
  - Discord to handle massive concurrent users,
  - Motorola to build fault tolerant communication,
  - Pinterest to scale up their real-time notification system
- A process in Erlang is a ligthweight thread of execution, like a go routine
- A **Behaviour** defines a contract that modules must implement.
- A **Protocol** is for polymorphism based on the type of data.
  - Elixir’s docs define protocols as a mechanism for polymorphism where behaviour varies depending on the data type. A protocol can be implemented for many data types, and dispatch is based on the type of the first argument.

## Syntax

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
- `or`, `and`, `not`: only for booleans
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

### Strings

- `IO.puts` function returns the atom `:ok` after printing.
- Strings in Elixir are represented internally by contiguous sequences of bytes known as binaries.
- You can use the strict comparison operator === and !== if you want to distinguish between `integers` and `floats`

### And more

- `defdelegate`
  - <https://gustavoaraujo.dev/elixir-tricks-delegating-a-function-to-another-module-using-defdelegate>

## Learning resources

- <https://elixir-lang.org/learning.html>
- <https://leanpub.com/elixir-toyrobot> (BDD with Elixir, simple examples)
- [Asking questions](https://elixir-lang.org/install.html#asking-questions)
- [Elixir Learning Plan (2024)](https://dev.to/aaronblondeau/elixir-learning-plan-377g)
- <https://plugins.jetbrains.com/plugin/7522-elixir>
  - <https://github.com/KronicDeth/intellij-elixir/blob/main/README.md>
- <https://www.elixirconf.eu/>
- <https://github.com/elixirkoans/elixir-koans>
- Georgina McFadyen
  - [SOLID Elixir • Georgina McFadyen • GOTO 2018](https://www.youtube.com/watch?v=rmftOs2BzgU)
- [Elixir in 100 seconds](https://www.youtube.com/watch?v=R7t7zca8SyM)
- [Why Functional Programming Failed: Erlang, Elixir & Immutability](https://www.youtube.com/watch?v=gtbVXQ5Xqwg)

## TDD and Testing

- <https://github.com/shufo/learning-elixir-with-tdd>
- [mox: Elixir Mocking library](https://github.com/dashbitco/mox)
- <https://github.com/msz/hammox>

## Design in Elixir

- [SOLID Elixir • Georgina McFadyen • GOTO 2018](https://www.youtube.com/watch?v=rmftOs2BzgU), from 2018
  - [Slides](https://files.gotocon.com/uploads/slides/conference_10/586/original/GOTO_SolidElixir2018.pdf)
  - <https://gotocph.com/2018/sessions/586/solid-elixir>
  - Holiday Booking Domain
  - <https://github.com/gemcfadyen/solid_elixir>
    - GET users preferences
    - [Elixir Behaviours](https://elixirschool.com/en/lessons/advanced/behaviours) allows us to define a contract
      - <https://elixirforum.com/t/help-understanding-protocols-and-behaviours/57229/2>
    - Dependency Inversion
      - Two options:
        - [Use Config to Substitute Test Doubles](https://github.com/gemcfadyen/solid_elixir/tree/dependency-inversion-addressed-with-config)
          - [mox: Elixir Mocking library](https://github.com/dashbitco/mox)
        - [Use Behaviours to Substitute Test Doubles](https://github.com/gemcfadyen/solid_elixir/tree/open-close-violation-addressed-with-behaviours)
- [Dependency inversion on Elixir using Ports and Adapters design pattern](https://dev.to/dcdourado/dependency-inversion-on-elixir-using-ports-and-adapters-design-pattern-4k3f)

  ```elixir
  defmodule MySystem.SmsNotificationPort do
    @moduledoc """
    Sends SMS to users using configured SMS adapter.
    """

    @callback notify(user :: User.t(), message :: String.t()) :: :ok | :error

    @adapter Application.get_env(:my_system, __MODULE__)

    defdelegate notify(user, message), to @adapter
  end
  ```

  - <https://gustavoaraujo.dev/elixir-tricks-delegating-a-function-to-another-module-using-defdelegate>

- [Dependency Inversion with Elixir Protocols](https://www.germanvelasco.com/blog/dependency-inversion-with-elixir-protocols)
  - TBD
- ElixirConf 2023 - German Velasco - **Using DDD concepts to create better Phoenix Contexts**
  - <https://www.youtube.com/watch?v=JNWPsaO4PNM>
  - <https://elixirforum.com/t/elixirconf-2023-german-velasco-using-ddd-concepts-to-create-better-phoenix-contexts/59139>
  - <https://phoenix.hexdocs.pm/contexts.html>
  - From our Controllers: Checkout.create_product(params)
- [ElixirConf 2022 - Chris Keathley - SOLID code isn't flexible](https://www.youtube.com/watch?v=fifbMZliHjI)
  - Chris Keathley
  - "This talk is about building systems with less stuff"
  - The speaker misses XP/Lean/product mindset. Too "technologist".
    - e.g. talking a lot about "reusing", not talking/thinking at all about testability, etc.
  - [Polymorphism in Elixir](https://youtu.be/fifbMZliHjI?si=E0FXkwL-n6P62Hgz&t=1950)
    - Enum is an example of inversion of control.
    - Ways of doing it:  
      - functions
        - Passing a function as paramenter with the same structure

        ```elixir
        defmodule Animal do
          def speak(f) do
            f.()
          end
        end

        dog = fn -> "bark" end
        cat = fn -> "Worshiop me you lowly human" end

        Animal.speak(dog)
        Animal.speak(cat)
        ```

      - **protocols**
        - Sometimes you need to carry state, functions are not enough
        - Controller --> Service (OMG!)

        ```elixir
        defprotocol MyService do
          def get_posts(impl)
        end

        defmodule Myservice.HTTP do
          defstruct :url, :fuse

          defimpl MyService do
            def get_posts() do
              case :fuse.check(fuse) do
                :ok ->
                  Req.get(url)

                :blown ->
                  {:error, Error.unavailable("Service is down")}
            end
        end

        defmodule Myservice.Mock do
          defstruct fake_response: %{}

          defimpl MyService do
            def get_posts() do
              case get_posts(%{fake_response: fake_response}) do
                fake_response
              end
            end
        end

        # Use
        real = %MyService.HTTP{}
        fake = %MyService.Mock{}
        MyService.get_posts(real)

        # Use in the Controller: inject the struct
        defmodule MyApp.Posts do
          def index(conn, _params) do
            service = conn.private[:service]
            MyService.get_posts(service)
          end
        end
        ```

      - **behaviours**
        - Behaviours are good when you control the machinery around them
  - Red flags
    - Excessive passthrough or defdelegates
    - Layered modules that share similar apis or functions
    - Changes impacting multiple dependencies
    - Pushing specific details into lower levesl decreases reuse
  - Delete passthrough modules: the example here is horrible... again, he misses the testability.
- [Elixir SOLID Principles - Examples](https://dev.to/lgdev07/elixir-solid-principles-examples-2db5) (post, 2021)
- [Dependency inversion in Elixir](https://chatgpt.com/c/6a3ab551-5a94-8330-b1cd-1f14416603dd)

## Dockerization  

- For production usage, we recommend using [Hex.pm Docker images](https://hub.docker.com/r/hexpm/elixir), which are immutable and point to a specific Erlang and Elixir version.
- <https://hub.docker.com/_/elixir>
  - `docker pull elixir:slim`
  - REPL: `docker run -it --rm elixir`
  - Bash inside container: `docker run -it --rm elixir bash`
  - Run a single Elixir exs script: `docker run -it --rm --name elixir-inst1 -v "$PWD":/usr/src/myapp -w /usr/src/myapp elixir elixir your-escript.exs`
- <https://dev.to/noelworden/elixir-phoenix-project-dockerizing-10p7> (2020)
- <https://pentacent.medium.com/getting-started-with-elixir-docker-982e2a16213c> (2017)

## Elixir and LLMs

- <https://hexdocs.pm/claude/guide-usage-rules.html>
  - <https://github.com/bradleygolden/claude-marketplace-elixir/blob/main/CLAUDE.md>
- <https://elixirforum.com/t/heres-how-im-coding-elixir-with-ai-results-are-mixed-mostly-positive-how-about-you/71588>

## Popular libraries/frameworks/tools

- Phoenix (web framework)
- [Ecto](https://ecto.hexdocs.pm/Ecto.html): database wrapper and query generator for Elixir
- [Commanded](https://commanded.hexdocs.pm/Commanded.html): library to build your own Elixir applications following the CQRS/ES pattern.
