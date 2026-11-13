<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents** *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Notes form Exercism](#notes-form-exercism)
  - [Exercism platform](#exercism-platform)
  - [Basics](#basics)
  - [Anonymous Functions](#anonymous-functions)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Notes form Exercism

## Exercism platform

- **How to debug**
- To help with debugging, you can use the fact that all console output will be captured and shown in the test results window. You can output any value by passing it to `IO.inspect`.

## Basics

- Elixir is a dynamically-typed language, meaning that the type of a variable is only checked at runtime.
- Elixir is a **functional-programming language** and requires all named functions to be defined in a module. The `defmodule` keyword is used to define a module. All modules are available to all other modules at runtime and do not require an access modifier to make them visible to other parts of the program. A *module* is analogous to a class in other programming languages.
- **Named Functions** must be defined in a module. The `def` keyword is used to define a public named function.
  - The value of the last expression in a function is always implicitly returned.
  - The `defp` keyword can be used instead of `def` to define a private function. Private functions can only be used from within the same module that defined them.
  - You may also write short functions using a one-line syntax (note the comma `,` and the colon `:` around the keyword `do`). E.g. `defp private_subtract(x, y), do: x - y`
- It is common to refer to functions with their **arity**. The arity of a function is the number of arguments it accepts.
- **Naming conventions**
  - Module names should use `PascalCase`. A module name must start with an uppercase letter A-Z and can contain letters `a-zA-Z`, numbers `0-9`, and underscores `_`.
  - Variable and function names should use `snake_case`. A variable or function name must start with a lowercase letter `a-z` or an underscore `_`, can contain letters `a-zA-Z`, numbers `0-9`, and underscores `_`, and might end with a question mark `?` or an exclamation mark ``!.
- <https://hexdocs.pm/elixir>
- Most built-in data types have a corresponding module that offers functions for working with that data type, e.g. there's the `Integer` module for integers, `String` module for strings, `List` module for lists and so on.
- A notable module is the `Kernel` module. It provides the basic capabilities on top of which the rest of the standard library is built, like arithmetic operators, control-flow macros, and much more
- Single line comments in Elixir are preceded by `#`.

## Anonymous Functions

Functions are treated as first class citizens in Elixir. This means that:

- Named and anonymous functions can be assigned to variables.
- Named and anonymous functions can be passed around like data as arguments and return values.
- Anonymous functions can be created dynamically.
