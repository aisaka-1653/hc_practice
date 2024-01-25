# frozen_string_literal: true

class Suica
  DEFAULT_DEPOSIT = 500

  attr_reader :deposit

  def initialize
    @deposit = DEFAULT_DEPOSIT
  end

  def charge(price)
    raise '100円以上でチャージして下さい' if price < 100

    @deposit += price
  end

  def pay(amount)
    @deposit -= amount
  end
end
