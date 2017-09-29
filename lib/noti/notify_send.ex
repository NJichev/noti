defmodule Noti.NotifySend do
  @moduledoc """
  # A module that just sends to `notify-send` after parsing the options.
  """

  @doc """
  Use the System's module to find the `notify-send` binary and pass in the
  unix style arguments.
  """
  def send(args) do
    System.cmd("notify-send", args)
  end
end
