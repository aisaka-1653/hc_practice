# frozen_string_literal: true

class Suica
  DEFAULT_DEPOSIT = 500

  attr_reader :deposit

  def initialize
    @deposit = DEFAULT_DEPOSIT
  end

  def charge(price)
    raise ArgumentError, '100円以上でチャージして下さい。' if price < 100

    @deposit += price
  rescue ArgumentError => e
    puts e.message
    # exit
  end
end
