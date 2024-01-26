# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/pokemon'

class PokemonTest < Minitest::Test
  def setup
    @bomanda = Bomanda.new('ボーマンダ', 'ドラゴン', 'ひこう', 95)
  end

  def test_attack
    assert_equal 'ボーマンダのドラゴンクロー', @bomanda.attack
  end

  def test_change_name
    @bomanda.change_name('ボーちゃん')
    assert_equal 'ボーちゃん', @bomanda.name
  end
end
