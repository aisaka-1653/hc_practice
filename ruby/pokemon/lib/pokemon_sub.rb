# frozen_string_literal: true

require_relative 'pokemon'

class Bomanda < Pokemon
  def initialize(*)
    super
  end

  def attack
    "#{@name}のドラゴンクロー"
  end
end

class Kairyu < Pokemon
  def initialize(*)
    super
  end

  def attack
    "#{@name}のドラゴンダイブ"
  end
end
