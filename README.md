# Noti

A module for linux desktop notifications.

## Installation

The package can be installed by adding `noti` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:noti, "~> 0.1.0", only: :dev}]
end
```

## Usage

Simply give the message you want to notify with.

```elixir
iex> Noti.with("Hello World")
:ok
```

This will send a message to the linux notification server.

Make sure that you can use `notify-send` and that it's in the `$PATH`.

## Contributing
  * Star it.
  * Share it.
  * Found an issue? - Sumbit an issue.
  * Need a feature?
    * Fork it.
    * Pull-request with details why you need this.
    * Profit!

