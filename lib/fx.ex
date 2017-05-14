defmodule Fx do
  alias Fx.Rates
  @moduledoc """
  Fx is a client to fetch the latest foreign exchange rates.

  It is a thin wrapper around [Fixer.io](http://fixer.io/)
  """

  def convert(amount, source_currency, target_currency) when amount >= 0.0 do
    amount
     |> Rates.from(source_currency)
     |> Rates.to(target_currency)
  end

end
