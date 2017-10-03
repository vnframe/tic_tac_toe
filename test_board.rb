require "minitest/autorun"
require_relative "tictactoe.rb"
class TestBoard < Minitest::Test
    def test_board_return
        board_var = Board.new
        assert_equal(['','','','','','','','',''],board_var.ttt_board)
    end
    def test_update_board
        board_var = Board.new
        board_var.update_position(2, 'X')
        assert_equal(['','','X','','','','','',''], board_var.ttt_board)
    end
    def test_update_board
        board_var = Board.new
        board_var.update_position(2, 'X')
        board_var.update_position(8, 'O')
        assert_equal(['','','X','','','','','','O'], board_var.ttt_board)
    end
    def test_valid_pos
        board_var = Board.new
        board_var.ttt_board = ['','','X','','','','','','']
        assert_equal(true, board_var.valid_position?(1))
        assert_equal(false, board_var.valid_position?(2))
    end
    def test_full_board
        board_var = Board.new
        board_var.ttt_board = ["x","o","x","x","o","o","x","o","x"]
        assert_equal(true, board_var.full_board?)
    end
    def test_full_board_false
        board_var = Board.new
        board_var.ttt_board = ["x","","x","x","o","o","x","","x"]
        assert_equal(false, board_var.full_board?)
    end
    def test_win
        board_var = Board.new
        board_var.ttt_board = ["1","2","x","4","x","6","x","8","9"]
        assert_equal(true, board_var.winner?('x'))
        assert_equal(false, board_var.winner?('o'))
    end
end