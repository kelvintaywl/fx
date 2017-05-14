defmodule Fx.Mixfile do
  use Mix.Project

  def project do
    [app: :fx,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: Coverex.Task],
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.11.2"},
      {:poison, "~> 3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:coverex, "~> 1.4.10", only: :test}
    ]
  end

  defp description do
    """
    Simple FX rates library for Elixir
    """
  end

  defp package do
    [
      files: ["lib", "config", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Kelvin Tay"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kelvintaywl/fx"}
    ]
  end
end
