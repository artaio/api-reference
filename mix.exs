defmodule Docs.MixProject do
  use Mix.Project

  def project do
    [
      app: :docs,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application, do: []

  defp elixirc_paths(:test), do: ["lib"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:open_api_spex, "~> 3.18"},
      {:jason, "~> 1.2"},
      {:credo, "~> 1.7", only: [:dev], runtime: false}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
