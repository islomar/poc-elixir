defmodule DictionaryTest do
  use ExUnit.Case
  doctest Dictionary

  test "start returns a list of words" do
    word_list = Dictionary.start()
    assert is_list(word_list)
    assert length(word_list) > 0
  end

  test "random_word returns a word from the list" do
    word_list = Dictionary.start()
    word = Dictionary.random_word(word_list)
    assert is_binary(word)
    assert word in word_list
  end
end
