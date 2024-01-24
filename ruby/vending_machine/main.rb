# frozen_string_literal: true

require_relative 'machine'
require_relative 'suica'

suica = Suica.new
machine = Machine.new

suica.charge(100)
puts suica.deposit
# suica.charge(90) #=> 100円以上でチャージして下さい
# suica.deposit = 1000 #=> NoMethodError

puts machine.lineup
machine.purchase('pepsi', suica)
machine.purchase('irohasu', suica)
machine.purchase('monster', suica)
# machine.purchase('redbull', suica) #=> 商品名が無効です
# machine.purchase('monster', suica) #=> 金額が不足しています

puts suica.deposit
puts machine.sales
# machine.sales = 1000 #=> NoMethodError

suica.charge(2000)
machine.purchase('pepsi', suica)
machine.purchase('pepsi', suica)
machine.purchase('pepsi', suica)
machine.purchase('pepsi', suica)
# machine.purchase('pepsi', suica) #=> 在庫がありません
puts machine.lineup # 在庫が0のジュースは表示しない

machine.restock('pepsi', 10)
puts machine.lineup
