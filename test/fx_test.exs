defmodule FxTest do
  use ExUnit.Case
  doctest Fx

  test "rates when successful" do
    assert (Fx.Rates.from(20.0, :EUR) |> Fx.Rates.to(:EUR)) == 20.0
    assert Fx.convert(20.0, :EUR, :EUR) == 20.0
    assert (Fx.Rates.from(21.0) |> Fx.Rates.to(:EUR)) != 21.0
    assert Fx.convert(21.0, :EUR, :USD) != 21.0
    assert (20.0 |>  Fx.Rates.from(:EUR) |> Fx.Rates.to(:EUR)) == 20.0
    assert (21.0 |> Fx.Rates.from |> Fx.Rates.to(:EUR)) != 21.0
  end
end
