defmodule Noti.Notifications do
  @valid_options [:urgency, :expire_time, :app_name, :icon, :category]
  @valid_urgencies [:low, :normal, :critical]

  @doc """
  `send` parses the options and passes them in to `notify-send`.
  """
  def send(message, options) do
    parsed = parse_options(options)
    notify().send([message | parsed])
    :ok
  end

  defp parse_options(options) do
    options
    |> Enum.map(&validate/1)
    |> Enum.map(&to_line_option/1)
  end

  defp notify do
    Application.get_env(:noti, :command, Noti.NotifySend)
  end

  defp to_line_option({option, value}) do
      "--#{option}=#{value}"
  end

  defp validate(opt = {:urgency, x}) when x in @valid_urgencies, do: opt
  defp validate({:icon, path}), do: {:icon, Path.expand(path)}
  defp validate(opt = {option, _value}) when option in @valid_options, do: opt
  defp validate(_option) do
    raise ArgumentError, "the passed option is not a valid argument"
  end
end
