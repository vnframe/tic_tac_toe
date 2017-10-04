require 'minitest/autorun'
require_relative 'unbeatable.rb'
class TestUnbeatable < Minitest::Test 
    def test_win123
        impossible_var = Unbeatable.new('X')
        assert_equal(2, impossible_var.get_move(["X", "X", "", "", "", "", "", "", ""]))
    end
    def test_block
        impossible_var = Unbeatable.new('X')
        assert_equal(1, impossible_var.get_move(['O','','O','','','','','','']))
    end
    def test_center
        impossible_var = Unbeatable.new('X')
        assert_equal(4, impossible_var.get_move(["", "", "", "", "", "", "", "", ""]))
    end
end