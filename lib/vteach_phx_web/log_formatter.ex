defmodule VteachPhxWeb.LogFormatter do

  def format(level, message, timestamp, metadata) do
    try do
      # "#{fmt_timestamp(timestamp)} #{inspect(metadata)} [#{level}] #{message}\n"
      "#{fmt_timestamp(timestamp)} [#{level}] #{metadata[:module]}:#{metadata[:function]} >>>>  #{message}\n"
    rescue
      _ -> "could not format message: #{inspect({level, message, timestamp, metadata})}\n"
    end
  end

  defp fmt_timestamp({date, {hh, mm, ss, ms}}) do
    with {:ok, timestamp} <- NaiveDateTime.from_erl({date, {hh, mm, ss}}, {ms * 1000, 3})
      # result <- NaiveDateTime.to_iso8601(timestamp)
    do
      # "#{result}Z"
      timestamp
    end
  end
end
