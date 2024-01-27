# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/pokemon_sub'
require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def setup
    @bomanda = Bomanda.new('ボーマンダ', 'ドラゴン', 'ひこう', 95)
    @kairyu = Kairyu.new('カイリュー', 'ドラゴン', 'ひこう', 91)
    @player = Player.new('サトシ', @bomanda)
  end

  def test_add_pokemon
    @player.add_pokemon(@kairyu)
    assert_equal 2, @player.show_pokemons.length
  end

  def test_add_pokemon_raises_when_pokemons_array_is_full
    e = assert_raises RuntimeError do
      6.times { @player.add_pokemon(@kairyu) }
    end
    assert_equal '手持ちがいっぱいです', e.message
  end

  def test_add_pokemon_raises_when_object_is_not_a_pokemon
    e = assert_raises RuntimeError do
      @player.add_pokemon('カイリュー')
    end
    assert_equal 'ポケモンを追加して下さい', e.message
  end

  def test_show_pokemons
    pokemons = @player.show_pokemons
    assert_includes(pokemons.first, @bomanda.name)
  end

  def test_show_pokemons_raises_error_when_pokemons_array_is_empty
    @player = Player.new('サトシ')
    e = assert_raises RuntimeError do
      @player.show_pokemons
    end
    assert_equal 'ポケモンを保有していません', e.message
  end

  def test_change_name
    @player.change_name('タケシ')
    assert_equal 'タケシ', @player.name
  end
end
