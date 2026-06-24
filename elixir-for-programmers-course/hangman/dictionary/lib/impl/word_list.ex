defmodule Dictionary.Impl.WordList do
  @moduledoc """
  Implementation module for the dictionary word list.
  """

  @typep t :: list(String.t())

  @spec word_list() :: t
  def word_list do
    :code.priv_dir(:dictionary)
    |> Path.join("words.txt")
    |> File.read!()
    |> String.split()
  end

  @spec random_word(t) :: String.t()
  def random_word(word_list) do
    word_list
    |> Enum.random()
  end
end

