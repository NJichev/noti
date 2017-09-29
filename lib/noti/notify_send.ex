defmodule Noti.NotifySend do
  def send(args) do
    System.cmd("notify-send", args)
  end
end
