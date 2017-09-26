def new_move(board, player, pos)
    p board
    p player
    p pos
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