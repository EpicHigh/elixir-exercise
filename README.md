# Elixir Exercises

A repo that compiles the exercise of the Elixir.

## Useful commands

Open an interactive shell:

```bash
iex -S mix
recompile # recompile the project
```

Then you can call modules and methods directly. For example:

```bash
Card.create_deck
```

Generate a document by using

```bash
mix docs
```

Run the tests:

```bash
mix test
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cards` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cards, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/cards>.

