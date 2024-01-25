# frozen_string_literal: true

class Pokemon
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

  def change_name(new_name)
    @name = new_name
  end
end

class Bomanda < Pokemon
  def initialize(*)
    super
  end

  def attack
    "#{@name}のドラゴンクロー"
  end
end
