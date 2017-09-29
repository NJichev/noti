defmodule Noti.NotifyFixture do
  # Save arguments given in a state.
  # Return them later for the test.
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, []}
  end

  # Public API

  def send(args) do
    GenServer.call(__MODULE__, {:send, args})
    :ok
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  # Server API

  def handle_call({:send, args}, _from, _state) do
    {:reply, :ok, args}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end
end

defmodule NotiTest do
  use ExUnit.Case

  alias Noti.NotifyFixture

  setup_all do
    Application.put_env(:noti, :command, NotifyFixture)
    NotifyFixture.start_link
    :ok
  end

  test "it sends one argument hello" do
    Noti.with("hello")

    assert NotifyFixture.get == ["hello"]
  end

  test "it parses options to command line ones" do
    Noti.with("hello", urgency: :low)

    assert "--urgency=low" in NotifyFixture.get
  end

  test "it rejects unsupported options" do
    assert_raise ArgumentError, fn ->
      Noti.with("Hello", invalid_option: true)
    end
  end

  test "it expands icon path" do
    Noti.with("Hello", icon: '~/short_path')

    assert Enum.any?(NotifyFixture.get, fn x ->
      case x do
        "--icon=/home" <> _rest -> true
        _ -> false
      end
    end)
  end

  test "it does not raise with all valid options" do
    Noti.with("Hello", urgency: :low, expire_time: "1m", app_name: 'Test', icon: '~/some/path', category: :test)
  end
end
