defmodule Noti.NotifySend do
  defp send(args) do
    System.cmd("notify-send", args)
  end
end
