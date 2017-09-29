defmodule Noti do
  @moduledoc """
  # Simple Desktop notifications.

  Noti is a gentle wrapper around `notify-send` meant for linux.

  ## Examples

      iex> Noti.with("Hello World!")
      :ok

  ## Possible Options:
    * :urgency - Specifies the urgency level (:low, :normal, :critical).
    * :expire_time - Specifies the timeout in milliseconds at which to
  expire the notification.
    * :app_name - Specifies the app name for the icon
    * :icon - Specifies an icon filename or stock icon to display.
    * :category - Specifies the notification category.
  """

  @doc """
  `with` is the standard function to create notifications with.

  It takes in two arguments, the first being a string for a message
  and the second being a keyword list for options.

  ## Examples

      iex> Noti.with("<b>Hello</b>")
      :ok
  """
  def with(message, opts \\ []) do
    Noti.Notifications.send(message, opts)
  end
end
