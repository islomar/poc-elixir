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
  - `v(9)`: give me the value of expression number 9
  - `v(-1)`: give me the value of the last expression
  - `#iex:break`: stop execution
  - You can customize some aspects of IEx by writing code into a file called `.iex.exs`: [example](./.iex.exs.pragdave)
    - "IEx looks for .iex.exs in the current directory and then in your home directory. My configuration above sits in my home directory, so it applies to all IEx sessions."
    - `chardata_to_string` converts a list of strings into a single string.
    - "The colors in the .iex.exs file are written as :cyan, :light_magenta, :yellow, and so on. These values (which Elixir calls **atoms**) are interpreted inside IEx using calls to IO.ANSI format."
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
- All the functions must be inside **modules* (`defmodule`)
- `mix run` does nothing if there is no proper entrypoint
- `mix run -e Dictionary.hello`: `-e` for `execute`. It executes the `hello` function inside the `Dictionary` module.
- `iex -S mix`: it runs iex with mix, which has the knowledge about our application, modules, functions, etc.
- From inside `iex`, in order to reload a module, there are two options:
  - `r Dictionar`: recompile Dictionary. Advantage: it allows autocompletion
  - `c "lib/dictionary.ex"`: compile this file
- **Module names** must be an Elixir atom. 
  - Conventionally we use Capitalized words (MyFirstModule).
- **Function names** are either names or one of the Elixir operators. 
  - Names must start with a lowercase letter or underscore, and may contain letters, digits, and underscores. 
  - The name may end with an exclamation point or a question mark.
- From Erlang: any collection of bytes is a `binary` (strings didn't make much sense in Erlang)
  - In Elixir, most `binary` data will be strings...
- In Erlang/Elixir, the identification of a function consists in two parts: its name and the number of parameters it takes (arity)
  - name / arity, e.g. `split/1`, `split/2`
- Often Elixir has two variants of a function, such as `File.read` and `File.read!` 
  - Most of the time this means that the plain version will return an error status on failure, and the version with the shriek will raise an exception. 
  - This rule isn't universal, though, so check the documentation.
- `String.codepoints(my_string)`: Split a string into a list of characters, where each entry in the list is a single character string.
- `String.myers_difference(my_string_1, my_string_2)`calculate the set of differences between two strings
- As a font, he uses "Fira Code"
- **Functional Composition**
  - Composition means chaining together functions so that the output of one becomes the input of the next.
  - `|> a_function`: functional style, it will pass the output of the previous line as a first parameter to this function
- **Module attributes**: they start with `@`
  - Created and executed at compile time.

## A mad dash through Elixir types
- Also see [this](../README.md)
- `?c` is the codepoint of the UTF character c.
  - A **codepoint** is a unique number that identifies an abstract character in a text system like Unicode, represented as U+ followed by a hexadecimal number (e.g., U+0041 for 'A').
- **Floats** are stored in IEEE 754 format.
- **Atoms** are constants that are used to name things. 
  - In a way they are just like strings—the difference is in the representation. 
  - Sometimes you need to create atoms that contain characters that aren't allowed in normal names. Do this by enclosing them in double quotes:
    - `:"now is the time"`
  - Atoms can start with either:
    - A colon. E.g. `:cat`
    - An uppercase letter. This is what our module names are.
      - However, the Erlang standard libraries, which Elixir uses, have hundreds of atoms already defined for their modules. 
      - To avoid a name clash, Elixir automatically adds the prefix `Elixir.` to atoms derived from capitalized names.
- **Booleans**
  - `nil` and `false` are considered falsy; all other values are truthy.
  - For bit operations, use the library `Bitwise`
- **Ranges**
  - Ranges represent a bounded set of integers. They are typically used in two contexts.
    - `in` operator.
      - `a = 5..10`
      - `4 in a` --> false
    - starting point for different kinds of iteration
    ```elixir
    iex> b = 8..3
    8..3    
    iex> for i <- b, do: i*3
    [24, 21, 18, 15, 12, 9]
    ```
- **Strings**
  - An Elixir string is a sequence of Unicode codepoints.
    - The operator `<>` concatenates strings
  - Besides the classical strings between double quotes, there are also **sigils** (kind of string-like constants)
    - A sigil is simply a notation for creating values from strings.
      - All sigils start with the tilde character, `~`. 
      - This is followed by a single letter, which determines the type of value to be generated. 
      - Next comes the string, between delimiters, and finally there may be some optional flags.
      - E.g. the regex `~r/cat/i`
      - `~r` is a sigil
      - E.g. `~w//`or `~W//` for getting a list of words from a string
      - The lowercase versions of sigils expand escape sequences and interpolate embedded expressions, e.g. `~s/Hello #{name}\n/`
      - There are three additional builtin sigils, `~D//`, `~N//`, and `~T//`. These generate dates and times.
- **Regular expression literals**
  - The underlying regular expression engine is [PCRE](http://erlang.org/doc/man/re.html#regexp_syntax).
    ```elixir
    iex> str = "once upon a time"
    "once upon a time"
    iex> str =~ ~r/u..n/
    true
    ```    
- **Tuples**
  - A tuple is a fixed-length collection of values.
  - Typically tuples are small (two or three elements). They are frequently used to pass flagged values to and from functions.
  - E.g. `{ :ok, contents }`
- **Lists**
  - Lists are NOT arrays
  - An array is a contiguous area of memory containing fixed size cells. You can directly access an element at a specific position, e.g. my_array[2]
  - Lists are a sequence of zero of more elements, one linked to the next.
  - `[ value | list ]`
    - The value part of the definition is normally called the **head** of the list, and the rest is called the **tail**.
  - **Improper lists**
    - `i = [ 1 | 2 ]`
    - It is not a list because it does not end with an **empty list `[]`**
- **Maps**
  - Some languages call them dictionaries, hashes, or associative arrays.
  - Maps are an unordered collection of key/value pairs. Both keys and values can be any Elixir type, and those types can be mixed within a map.
  - `%{ key1 => value1, key2 => value2, . . . }`
  - Keys can be atoms, being able to access in two different ways:
    - `my_map[:twice]`
    - `my_map.twice`
  - We can also declare maps with atoms as keys like this: `multipliers = %{ once: 1, twice: 2, thrice: 3 }`

## Pattern matching
- The ability to match arbitrary **structured data** against a pattern, extracting elements of that data along the way. 
- On top of that, Elixir lets you choose what code to run based on the patterns that match.
- In `a = 1`, `=` is not really an assignment operator. Instead, it is a little game that we let Elixir play with our code.
  - The rules of this game are simple: Elixir has to make the left and right hand sides of the = the same. 
  - But, to make it challenging, the only tool Elixir has available is the ability to **bind a variable to a value**. 
  - And because that's not difficult enough, this variable binding can only happen on the **left hand side (LHS)** of the equals sign. 
  - At the start of the expression, all the variables on the LHS are marked as unbound. 
    - Elixir then says "what can I do to make the LHS and RHS equal?". The answer is to bind 1 to a.
- For a match to succeed, **the LHS and RHS must have the same shape**, and each value on the right must match the corresponding value on the left. 
  - If the thing on the left is an unbound variable, Elixir binds that variable to the value being matched.
- **The LHS cannot contain any calculations or function calls.**
- `{ :ok, file } = File.open("/etc/passwd")`
  - If the open succeeds, the variable file will be bound to a handle for the file. 
  - If it fails, then the pattern match fails, and your code raises a MatchError. 
  - This is **the Elixir way**. "Fail early" is one of the keys to highly reliable code.
- To be successful
  - the pattern must have the **same shape** as the right hand side (RHS)
  - any literals in the pattern must match corresponding values in the RHS
  - **once bound, a variable in the pattern always represents that value**
- You can **ignore** values using the underscores
  - E.g. `[ h | _ ]` # extract just the head of a list
- **Pinning the values of variables**
  - All variables on the LHS of a match are unbound before the match is made.
    ```elixir
    iex> first = 42
    42
    iex> { first, second } = { 0, 1 }
    { 0, 1 }
    iex> first
    0
    ```
  - The solution is to use the pin operator, an uparrow, `^`. Prefix a variable with an `uparrow`, and Elixir will not rebind its value:
    ```elixir
    iex> first = 42
    42
    iex> { ^first, second } = { 42, 53 }
    { 42, 53 }
    iex> { ^first, second } = { 0, 1 }
    ** (MatchError) no match of right hand side value: { 0, 1 }
    ```
- **Functions pattern match their parameters**
  - When you call a function, the arguments you pass are not simply assigned to the corresponding parameters in the function. 
    - Instead, **each argument is pattern matched to its parameter**.
  - Functions can be **overloaded** based on the patterns their parameters match. 
    - That enables for example to write two `read_file` implementations, when for `:ok` and another for `:error`, and in the pipeline the right one will be pattern matched automatically.
  - [Several examples](example_pattern_matching.ex)  
- **Enum** has lots of map functions
  - Enum is probably the most used module in Elixir.

## Let's start coding
- **tally**
  - Public
  - current score, etc.
  - client-side value
- **state**
  - Private
  - represents game
  - implementation side value
- Unlike OO programming, state is not automatically associated with a group of methods. 
- Instead, you have to ensure that state is passed to functions that need it, and also to keep track of the new state those functions may return.
- **Dialyzer** is a static type analyzer for Elixir and Erlang.
  - It works better with _annotated_ code: type specifications (or **typespecs**, if you want to be cool) are annotations that you add to your source files.
  - It does not come preinstalled with Elixir. Instead, we typically add it as a dependency to each project that needs it.
  - https://hex.pm/packages/dialyxir
    - Add the dependency at the end of your `mix.exs` and then run `mix deps.get`
- Typespecs are written in the following format:
  ```elixir
  @spec titlecase(String.t) :: String.t 
  def titlecase(title) do
    ...
  end
  ```
- There is no `Enum` type in Elixir, you can "fake it" with a type with a set of atoms.
- The `@type` annotation lets you create a new type in terms of other types.
- A spec, created with the `@spec` annotation, shows the signature of a named function.
- https://hexdocs.pm/elixir/typespecs.html


## Start coding
- The Elixir convention is to qualify all module names by prefixing them with the application name and the filesystem path (relative to lib/) that contains the source code file.
  - For example, the file `lib/impl/game.ex` has the module name `Hangman.Impl.Game`.
  - The `alias` function can be used to create a short name for a module. 
- `@opaque` to make a field private
- `defstruct` will create a structure with the same name that the module.
  - A structure is always associated with a module, and the structure will always have the name of the module. 
  - This is a pretty big clue: structures are meant to hold the data that is processed by that module's functions.
  - The name of the **struct** is always the name of the module that contains its definition. Elixir conveniently declares the name `__MODULE__`, which always contains the current module name.
- `exs`: EliXir Script (something which is not compiled into a program that is going to be distributed)
  - Test files end with `.exs` (convention)
- [`mix deps.get`](https://hexdocs.pm/mix/Mix.Tasks.Deps.Get.html): Fetches unavailable and out of date dependencies.
- `mix deps`: Lists all dependencies and their status.
- Author conventions: 
  - "I personally put the logic part of my code into a directory called `lib/impl`; most in the community instead use `lib/hangman` (or whatever your application is called) for all their application's files. You'll start to see the benefits of having split directories when we look at processes."
  - put the API in the top-level `lib/` directory, and the implementation below that.
  - [`defdelegate`](https://hexdocs.pm/elixir/1.12.3/Kernel.html#defdelegate/2) is a fantastic way to ensure this separation.
    - Defines a function that delegates to another module.
    - Functions defined with `defdelegate/2` are public and can be invoked from outside the module they're defined in, as if they were defined using `def/2`.
    - Therefore, `defdelegate/2` is about extending the current module's public API. 
  
### What We Saw
- Remember to separate your API from your implementation. My convention is to put the API in the top-level lib/ directory, and the implementation below that.
- **defdelegate** is a fantastic way to ensure this separation.
- **alias** does more than save you typing—it also lets you decouple your code from actual module names.
- Maps are a good way of representing state. **defstruct** can be used to make the structure static, predefining the keys and the default values.
- Another of my habits is to put commas at the end of every element in a collection literal, and to lay the literal out with one value per line. This makes maintaining the literal (adding, deleting, sorting, and so on) easier.

## Pattern matching Game State
- Elixir's pattern matching supports a style of coding functions that can be largely condition free.
- A `when` clause (also called a guard clause) can further restrict when a particular variant of a function can be called. The `when` is executed after the parameters are bound, so the values of parameters can be used.
  - E.g. `def make_move(game = %{ game_state: state}, _guess) when state in [:won, :lost] do`
- However, for both performance and reliability reasons, the `when` clause can only use a restricted set of Elixir expressions.