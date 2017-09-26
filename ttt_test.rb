require "minitest/autorun"
require_relative "tictactoe.rb"
class Test_Tic_Tac_Toe < Minitest::Test
    # def test_one_is_one
    #     x = "x"
    #     assert_equal(1,x)
    # end
    def test_grid
        grid = ["1","2","3","4","5","6","7","8","9"]
        assert_equal(["x","2","3","4","5","6","7","8","9"], new_move(grid, "x", 1))
    end
    def test_second_pos
        grid = ["x","2","3","4","5","6","7","8","9"]
        assert_equal(["x","o","3","4","5","6","7","8","9"], new_move(grid, "o", 2))
    end
    def test_valid_move
        grid = ["x","o","3","4","5","6","7","8","9"]
        pos = 3
        assert_equal(true, open_spot?(grid, pos))
    end

end