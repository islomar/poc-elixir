defmodule Sequence do

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)

end

defmodule Lists do

  def len([]),    do: 0
  def len([_h|t]), do: 1 + len(t)

  def sum([]),    do: 0
  def sum([h|t]), do: h + sum(t)

  def square([]),    do: []
  def square([h|t]), do: [ h*h + sqare(t) ]

  def map([], func), do: []
  def map([h|t], func), do: [ func.(h) | map(t, func)]
  # Usage:                                  Lists.map [1,2,3,4], fn x -> 3*x end
  # Usage (using an anonymous function):    Lists.map [1,2,3,4], &(&1*3)
end

def read_file({ :ok, file }) do
  file
  |> IO.read(:line)
end


def read_file({ :error, reason}) do
  Logger.error("File error: #{reason}}")
  []
end


def example() do
  "my_file.txt"
  |> File.open
  |> read_file
end