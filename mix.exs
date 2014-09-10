defmodule Exswift.Mixfile do
  use Mix.Project

  def project do
    [app: :exswift,
     version: "0.0.1",
     elixir: "~> 1.0.0-rc1",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0"},
      {:httpotion, "~> 0.2.0"},
      {:jsex, github: "talentdeficit/jsex"},
      {:mock, github: "jjh42/mock"}
    ]
  end
end
