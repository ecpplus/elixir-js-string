defmodule JSStringTest do
  use ExUnit.Case
  doctest JSString

  test ".string_to_charcodes(\"Beer\")" do
    # $ node
    # > s = 'Beer'
    # 'Beer'
    # >  for(let i = 0; i < s.length; i++) { console.log(s.charCodeAt(i)) }
    # 66
    # 101
    # 101
    # 114
    # undefined

    assert JSString.string_to_charcodes("Beer") == 'Beer'
    assert JSString.string_to_charcodes("Beer") == [66, 101, 101, 114]
  end

  test ".string_to_charcodes(\"ビール\")" do
    # $ node
    # > s = 'ビール'
    # 'ビール'
    # >  for(let i = 0; i < s.length; i++) { console.log(s.charCodeAt(i)) }
    # 12499
    # 12540
    # 12523
    # undefined

    assert JSString.string_to_charcodes("ビール") == 'ビール'
    assert JSString.string_to_charcodes("ビール") == [12499, 12540, 12523]
  end

  test ".string_to_charcodes(\"🍺\")" do
    # $ node
    # > s = '🍺'
    # '🍺'
    # >  for(let i = 0; i < s.length; i++) { console.log(s.charCodeAt(i)) }
    # 55356
    # 57210
    # undefined

    assert JSString.string_to_charcodes("🍺") == [55356, 57210]
  end

  test ".charcodes_to_string('Beer')" do
    assert JSString.charcodes_to_string('Beer') == "Beer"
    assert JSString.charcodes_to_string([66, 101, 101, 114]) == "Beer"
  end

  test ".charcodes_to_string('ビール')" do
    assert JSString.charcodes_to_string('ビール') == "ビール"
    assert JSString.charcodes_to_string([12499, 12540, 12523]) == "ビール"
  end

  test ".charcodes_to_string([55356, 57210])" do
    assert JSString.charcodes_to_string([55356, 57210]) == "🍺"
  end
end
