require 'minitest/autorun'
require_relative 'unbeatable.rb'
class TestUnbeatable < Minitest::Test 
    # def test_first
    #     impossible_var = Unbeatable.new('X')
    #     assert_equal(2, impossible_var.get_move(['X','X','','','','','','','']))
    # end
    def test_345
        impossible_var = Unbeatable.new('O')
        assert_equal(1, impossible_var.get_move(['X','','X','','','','','','']))
    end
end