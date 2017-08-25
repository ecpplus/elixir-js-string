defmodule JSString.Mixfile do
  use Mix.Project

  def project do
    [
      app: :js_string,
      version: "0.1.2",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "JSString",
      source_url: "https://github.com/ecpplus/elixir-js-string"
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
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    """
    This library get you to get JavaScript string length in Elixir codes.
    """
  end

  defp package do
    [
      name: :js_string,
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["chu"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ecpplus/elixir-js-string"}
    ]
  end

end
