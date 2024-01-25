# frozen_string_literal: true

require_relative 'juice'

class Machine
  DEFAULT_STOCK = 5
  JUICES = [
    { name: 'pepsi', price: 150 },
    { name: 'monster', price: 230 },
    { name: 'irohasu', price: 120 }
  ]

  attr_reader :sales

  def initialize
    @stocks = JUICES.each_with_object([]) do |juice, array|
      DEFAULT_STOCK.times { array << Juice.new(*juice.values_at(:name, :price)) }
    end
    @sales = 0
  end

  def restock(juice_name, quantity)
    raise '商品名が無効です' unless juice_exists?(juice_name)

    restock_juice = JUICES.find { |juice| juice[:name] == juice_name }
    quantity.times { @stocks << Juice.new(*restock_juice.values_at(:name, :price)) }
  end

  def lineup
    JUICES.map do |juice|
      next if stock_count(juice[:name]).zero?

      "商品:#{juice[:name]} 価格:#{juice[:price]} 在庫:#{stock_count(juice[:name])}"
    end
  end

  def purchase(juice_name, suica)
    raise '商品名が無効です' unless juice_exists?(juice_name)

    selected_juice = @stocks.find { |stock| stock.name == juice_name }
    raise '在庫がありません' if selected_juice.nil?
    raise '金額が不足しています' if suica.deposit < selected_juice.price

    index = @stocks.index { |stock| stock.name == juice_name }
    @stocks.delete_at(index) unless index.nil?

    suica.pay(selected_juice.price)
    @sales += selected_juice.price
  end

  private

  def stock_count(juice_name)
    @stocks.count { |juice| juice.name == juice_name }
  end

  def juice_exists?(juice_name)
    JUICES.any? { |juice| juice[:name] == juice_name }
  end
end
