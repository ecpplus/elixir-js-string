defmodule JSString do
  @moduledoc """
  Documentation for ElixirJsString.
  There are differences between JavaScript string length and Elixir string length.
  JavaScript String.prototype.length sometimes doesn't return the actual string length.
  For example, a length of some Emoji is sometimes more than 1.
  """

  @doc """


  ## Examples

      iex> JSString.string_to_charcodes("Beer")
      'Beer'
      iex> JSString.string_to_charcodes("ビール")
      [12499, 12540, 12523]
      iex> JSString.string_to_charcodes("🍺")
      [55356, 57210]

      iex> JSString.charcodes_to_string('Beer')
      "Beer"
      iex> JSString.charcodes_to_string([66, 101, 101, 114])
      "Beer"
      iex> JSString.charcodes_to_string([12499, 12540, 12523])
      "ビール"
      iex> JSString.charcodes_to_string([55356, 57210])
      "🍺"
  """

  # Get charcodes list from string.
  # The length of this list is the same as JavaScript String.length.
  # https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/String/charCodeAt
  def string_to_charcodes(string) do
    string |> to_charlist |> Enum.flat_map(fn(code) ->
      if 0xFFFF < code do
        # this code must be divided into two codes.
        # JavaScript's string always has codes <= 0xFFFFF
        low  = rem((code - 0x10000), 0x400) + 0xDC00
        high = div((code - 0x10000) - (low - 0xDC00), 0x400) + 0xD800
        [high, low]
      else
        [code]
      end
    end)
  end

  # Get String from JavaScript charcodes list
  def charcodes_to_string(charcodes) do
    charcodes_to_string(charcodes, [])
  end

  # High surrogate needs low surrogate to make a String.
  defp charcodes_to_string([high_surrogate|tail], result) when 0xD800 <= high_surrogate and high_surrogate <= 0xDBFF do
    charcodes_to_string(tail, high_surrogate, result)
  end

  # Low surrogate needs high surrogate. Get a String from these two surrogate.
  defp charcodes_to_string([low_surrogate|tail], high_surrogate, result) when 0xDC00 <= low_surrogate and low_surrogate <= 0xDFFF do
    result = result |> List.insert_at(-1, ((high_surrogate - 0xD800) * 0x400) + (low_surrogate - 0xDC00) + 0x10000)
    charcodes_to_string(tail, result)
  end

  # Single byte character
  defp charcodes_to_string([code|tail], result) do
    charcodes_to_string(tail, result |> List.insert_at(-1, code))
  end

  defp charcodes_to_string([], result) do
    to_string result
  end
end
