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
    def  test_current_player
        assert_equal( "X, it is your turn", switch_player("playerX"))
    end
    def test_board_is_full
        grid =["x","o","x","x","o","o","x","o","x"]
        assert_equal(true, full_board(grid))
    end
    def test_board_is_full_false
        grid =["1","o","x","x","o","o","x","o","x"]
        assert_equal(false, full_board(grid))
    end
end