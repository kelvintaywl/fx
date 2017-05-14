defmodule Fx.Rates do

  def from(amount) when amount >= 0.0 do
    from(amount, :USD)
  end

  def from(amount, currency) when amount >= 0.0 do
    rates = Fx.API.latest(currency)
    {:ok, %{amount: amount, currency: currency, rates: rates}}
  end

  def to({:ok, %{amount: amount, currency: currency, rates: rates}}) when amount >= 0.0 do
    to({:ok, %{amount: amount, currency: currency, rates: rates}}, :USD)
  end

  def to({:ok, %{amount: amount, currency: source_currency, rates: _rates}}, target_currency) when amount >= 0.0 and source_currency == target_currency do
    amount
  end

  def to({:ok, %{amount: amount, currency: _source_currency, rates: rates}}, target_currency) when amount >= 0.0 do
    if rates == [] do
      throw "#{rates}"
    end
    amount * rates[target_currency]
  end

  def to({:error, _res}, _currency) do
    throw "Not found"
  end

end
