defmodule Fx.API.Rates do
  @derive [Poison.Encoder]
  defstruct [AUD: 1.0, BGN: 1.0, BRL: 1.0, CAD: 1.0, CHF: 1.0, CNY: 1.0, CZK: 1.0,
    DKK: 1.0, EUR: 1.0, GBP: 1.0, HKD: 1.0, HRK: 1.0, HUF: 1.0, IDR: 1.0, ILS: 1.0,
    INR: 1.0, JPY: 1.0, KRW: 1.0, MXN: 1.0, MYR: 1.0, NOR: 1.0, NZD: 1.0, PHP: 1.0,
    PLN: 1.0, RON: 1.0, RUB: 1.0, SEK: 1.0, SGD: 1.0, THB: 1.0, TRY: 1.0, USD: 1.0,
    ZAR: 1.0]
end

defmodule Fx.API.Response do
  @derive [Poison.Encoder]
  defstruct [:base, :date, :rates]
end

defmodule Fx.API do
  @url "http://api.fixer.io"

  defp call(path) do
    case HTTPoison.get("#{@url}#{path}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:ok, %HTTPoison.Response{status_code: 400}} ->
        throw "Bad Request"
      {:ok, %HTTPoison.Response{status_code: 500}} ->
        throw "Internal Server Error"
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def latest() do
    latest(:USD)
  end

  def latest(currency) when Kernel.is_atom(currency) do
    latest(Atom.to_string(currency))
  end

  def latest(currency) when is_binary(currency) do
    currency = String.upcase(currency)
    resp = call("/latest?base=#{currency}") |> Poison.decode!(as: %Fx.API.Response{rates: %Fx.API.Rates{}})
    resp.rates |> Map.from_struct
  end
end
