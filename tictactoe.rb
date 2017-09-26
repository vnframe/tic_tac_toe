def new_move(board, player, pos)
    # p board
    # p player
    # p pos
   board[pos-1] = player
   board
end

def open_spot?(board, pos)
   
    if board[pos-1] == "x" || board[pos-1] == "o"
        false
    elsif pos >= 10 || pos <= 0 
        false
    else
        true
    end
end
def switch_player(current_player)
    if current_player == "playerX"
        "X, it is your turn"
    elsif current_player == "playerO"
        "O, it is your turn"
    end
end
def full_board(board)
    if board.all?{|space| space.include?("x") || space.include?("o")} 
    board_full = true
    else 
    board_full = false
    end
end
