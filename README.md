# JSString (for Elixir)

[![CircleCI](https://circleci.com/gh/ecpplus/elixir-js-string.svg?style=svg)](https://circleci.com/gh/ecpplus/elixir-js-string)

There are differences between JavaScript string length and Elixir string length.
JavaScript String.prototype.length sometimes doesn't return the actual string length.
For example, a length of some Emoji is sometimes more than 1.

This library allow you to get JavaScript string length in Elixir codes.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_js_string` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_js_string, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_js_string](https://hexdocs.pm/elixir_js_string).

## 
