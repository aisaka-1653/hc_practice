# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/pokemon'

class PokemonTest < Minitest::Test
  def test_pokemon
    assert Pokemon.new
  end
end
