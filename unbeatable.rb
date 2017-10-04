class Unbeatable
    attr_accessor :marker, :opponent
    def initialize(marker)
        @marker = marker
        @opponent = get_opponent(@marker)
    end
    def get_opponent(marker)
            opponent = 'X'
    
            if marker == 'X'
                opponent = 'O'
            else
                opponent = 'X'
            end        
    end
    def win_block_move(ttt_board, player)
        possible_moves = [[ttt_board[0],ttt_board[1], ttt_board[2]], [ttt_board[3], ttt_board[4], ttt_board[5]]]
        possible_combos = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]
        puts "#{possible_combos[1][2]}"
        winner = 0
        move = 0
        index=0
        possible_moves.each_with_index do |wins, index|
            #p "#{wins} are here"
            if wins.count(player) == 2 && wins.include?('')
                p index
                winner = wins.index('')
                move = possible_combos[index][winner]
            else 
                move
            end
            
       end
        move
    end
    def get_move(ttt_board)

     win(ttt_board)
     block(ttt_board)
    end
    def win(ttt_board)
        win_block_move(ttt_board, marker)
    end
    def block(ttt_board)
        win_block_move(ttt_board, opponent)
    end
end