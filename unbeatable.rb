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
        possible_moves =  [
            [ttt_board[0],ttt_board[1],ttt_board[2]],
            [ttt_board[3],ttt_board[4],ttt_board[5]],
            [ttt_board[6],ttt_board[7],ttt_board[8]],
            [ttt_board[0],ttt_board[3],ttt_board[6]],
            [ttt_board[1],ttt_board[4],ttt_board[7]],
            [ttt_board[2],ttt_board[5],ttt_board[8]],
            [ttt_board[0],ttt_board[4],ttt_board[8]],
            [ttt_board[2],ttt_board[4],ttt_board[6]],
            ]
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
        #puts "#{possible_combos[1][2]}"
        move = 56
        possible_moves.each_with_index do |winning_line, index_of_array|
            #p "#{wins} are here"
            if winning_line.count(player) == 2 && winning_line.count('') == 1
                p index_of_array
                winner = winning_line.index('')
                move = possible_combos[index_of_array][winner]
            else 
                move
            end
            
       end
        move
    end
    def get_move(ttt_board)
        move = 50
            if  win(ttt_board) <= 8
                 move = win(ttt_board) 

            elsif  block(ttt_board) <= 8
                move = block(ttt_board) 
            elsif block_fork(ttt_board) <= 8
                move = block_fork(ttt_board)
            elsif take_center(ttt_board) <= 8
                move = take_center(ttt_board)  
            elsif take_corner(ttt_board) <= 8
                move = take_corner(ttt_board)
            elsif empty_side(ttt_board) <= 8
                move = empty_side(ttt_board)
            
            else
                move = ttt_board.index("") 
            
            end
            #puts move
            move
    end 
    def win(ttt_board)
        win_block_move(ttt_board, marker)
    end
    def block(ttt_board)
        win_block_move(ttt_board, opponent)
    end
    def take_center(ttt_board)
        if ttt_board[4] == ''
            move = 4
        else
            move = 56
        end
    end
    def take_corner(ttt_board)
        if ttt_board[0] == ''
            move = 0
        elsif ttt_board[2] == ''
            move = 2
        elsif ttt_board[6] == ''
            move = 6
        elsif ttt_board[8] == ''
            move = 8
        else 
            move = 56
        end
    end
    def empty_side(ttt_board)
        sides = [1,3,5,7]
		empty = []

		sides.each do |pos|
			if ttt_board[pos] == ''
				empty << pos
			end
		end

		if empty.length > 0
			move = empty.shift
		else
			move = 56
		end
move
    end
    def detect_block_fork(ttt_board, player)
        fork_combinations = [
            [ttt_board[0],ttt_board[1],ttt_board[2]],
            [ttt_board[3],ttt_board[4],ttt_board[5]],
            [ttt_board[6], ttt_board[7], ttt_board[8]],
            [ttt_board[0], ttt_board[3], ttt_board[6]],
            [ttt_board[1],ttt_board[4], ttt_board[7]],
            [ttt_board[2],ttt_board[5],ttt_board[8]], 
            [ttt_board[0], ttt_board[4], ttt_board[8]],
            [ttt_board[2],ttt_board[4],ttt_board[6]]
            ]

        fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[4,1,7],[2,5,8],[0,4,8],[2,4,6]]

        fork_spot = []
        i = []
        
            fork_combinations.each_with_index do |forking_line, index|
                if forking_line.count(player) == 1 && forking_line.count("") == 2
                    i.push(index)
                 
                end
            end
            p i
            i.each do |index|
                fork_spot << fork_positions[index]
            end
            
            fork_spot = fork_spot.flatten.sort
    
            intersections = []
            fork_spot.each do |spot|
                if ttt_board[spot] == ""
                    intersections.push(spot)
                end
            end
    
            intersections
    end
    def block_fork(ttt_board)
        intersections = detect_block_fork(ttt_board, @opponent)

        if ttt_board == ["", "", opponent, "", marker, "", opponent, "", ""]
                        move = 3
        elsif ttt_board == [opponent, "", "", "", marker, "", "", "", opponent]
            move = 3
        elsif intersections.detect { |match| intersections.count(match) > 1 } == nil
            move = 56
    else 
        move = intersections.detect { |match| intersections.count(match) > 1 }
        end
    move
    end
                    
            
end