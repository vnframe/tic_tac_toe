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
def winner?(board)
    #p "board is #{board}"
       if  board[0] == "x" && board[3] == "x" && board[6] == "x" || board[0] == "o" && board[3] == "o" && board[6] == "o"
        true
       elsif board[1] == "x" && board[4] == "x" && board[7] == "x" || board[1] == "o" && board[4] == "o" && board[7] == "o"
        true
       elsif board[2] == "x" && board[5] == "x" && board[8] == "x" || board[2] == "o" && board[5] == "o" && board[8] == "o"
        true
       elsif board[0] == "x" && board[1] == "x" && board[2] == "x" || board[0] == "o" && board[1] == "o" && board[2] == "o"
        true
       elsif board[3] == "x" && board[4] == "x" && board[5] == "x" || board[3] == "o" && board[4] == "o" && board[5] == "o"
        true
       elsif board[6] == "x" && board[7] == "x" && board[8] == "x" || board[6] == "o" && board[7] == "o" && board[8] == "o"
        true
       elsif board[0] == "x" && board[4] == "x" && board[8] == "x" || board[0] == "o" && board[4] == "o" && board[8] == "o"
        true
       elsif board[2] == "x" && board[4] == "x" && board[6] == "x" || board[2] == "o" && board[4] == "o" && board[6] == "o"
        true
       else 
        false
    end
end
