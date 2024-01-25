# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/pokemon'

class PokemonTest < Minitest::Test
  def test_pokemon
    bomanda = Bomanda.new('ボーマンダ', 'ドラゴン', 'ひこう', 95)
    assert_equal 'ボーマンダのドラゴンクロー', bomanda.attack
    bomanda.change_name('カイリュウ')
    assert_equal 'カイリュウ', bomanda.name
  end
end
