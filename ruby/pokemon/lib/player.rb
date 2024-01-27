# frozen_string_literal: true

require_relative 'name_changer'

class Player
  include NameChanger

  attr_reader :name

  def initialize(name, *pokemons)
    @name = name
    @pokemons = pokemons
  end

  def add_pokemon(pokemon)
    raise '手持ちがいっぱいです' if @pokemons.length >= 6
    raise 'ポケモンを追加して下さい' unless pokemon.is_a?(Pokemon)

    @pokemons << pokemon
  end

  def show_pokemons
    raise 'ポケモンを保有していません' if @pokemons.empty?

    @pokemons.map do |pokemon|
      <<~STATUS
        name: #{pokemon.name}
        type1: #{pokemon.type1}
        type2: #{pokemon.type2}
        hp: #{pokemon.hp}\n
      STATUS
    end
  end
end
