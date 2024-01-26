# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/pokemon'
require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def setup
    @bomanda = Bomanda.new('ボーマンダ', 'ドラゴン', 'ひこう', 95)
    @kairyu = Kairyu.new('カイリュー', 'ドラゴン', 'ひこう', 91)
    @player = Player.new('サトシ', [@bomanda])
  end

  def test_add_pokemon
    @player.add_pokemon(@kairyu)
    assert_equal 2, @player.show_pokemons.length

    e = assert_raises RuntimeError do
      5.times { @player.add_pokemon(@kairyu) }
    end

    assert_equal '手持ちがいっぱいです', e.message
  end

  def test_show_pokemons
    pokemons = @player.show_pokemons
    assert_includes(pokemons.first, @bomanda.name)
  end
end
