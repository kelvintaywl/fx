# Fx

Fx is a simple library for dealing with Foreign Exchange (FX) rates and conversion.

> Note: Fx uses [Fixer.io](https://fixer.io) to grab latest FX rates

## Usage

```elixir
# Simplest use case: to convert USD$13.37 into Japanese Yen
13.37 |> Fx.convert(:USD, :JPY)
# 1515.82

13.37 |> FX.Rates.from(:USD)
# {:ok, %{amount: 13.37, currency: 'USD', rates: %{AUD: 1.35, GBP: 0.78, ...}}}

13.37 |> FX.Rates.from(:USD) | FX.Rates.to(:JPY)
# 1515.82
```

For the list of supported currencies, please see [Fx.API.Rates]().

## Installation

The package can be installed
by adding `fx` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:fx, "~> 0.1.0"}]
end
```

# TODO

- [ ] improve Documentation
- [ ] increase unit test coverage
