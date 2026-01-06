defmodule Hangman do

  alias Hangman.Impl.Game
  alias Hangman.Type

  @opaque game :: Game.t # an opaque type is not usable outside this module

  @spec new_game() :: game
  defdelegate new_game, to: Game

  @spec make_move(game, String.t) :: { game, Type.tally }
  defdelegate make_move(game, guess), to: Game
end
