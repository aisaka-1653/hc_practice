# frozen_string_literal: true

require_relative 'name_changer'

class Pokemon
  include NameChanger

  attr_reader :name, :type1, :type2, :hp

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    "#{@name}の攻撃!"
  end
end
