require 'minitest/autorun'
require_relative 'random.rb'
class TestRandom < Minitest::Test 
    def test_one_open_spot
        random_var = Random.new('X')
        assert_equal(8, random_var.get_move(['X','O','X','X','X','X','X','X','']))
    end
end