require "minitest/autorun"
require_relative "console_sequential.rb"
class Test_Sequential < Minitest::Test 
    def test_for_X
        seq_var = Sequential.new ("X")
        assert_equal("X", seq_var.marker)
    end
    def test_first_available
        seq_var = Sequential.new("X")
        assert_equal(0, seq_var.get_move(['','','', '','','','','','']))
    end
end