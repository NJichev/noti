defmodule Noti.Mixfile do
  use Mix.Project

  def project do
    [
      app: :noti,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      name: "Noti",
      description: "A library for linux desktop notifications.",
      package: package(),
      source_url: "https://www.github.com/njichev/noti",
      homepage_url: "https://www.github.com/njichev/noti",
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["njichev@gmail.com"],
      licenses: ["MIT"],
      links: %{github: "https://www.github.com/njichev/noti"}
    ]
  end
end
