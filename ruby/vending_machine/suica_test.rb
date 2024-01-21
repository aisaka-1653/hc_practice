# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'suica'

class SuicaTest < Minitest::Test
  def test_suica
    my_suica = Suica.new
    assert_equal 500, my_suica.deposit
    assert_equal 600, my_suica.charge(100)
    refute my_suica.charge(50)
  end
end
