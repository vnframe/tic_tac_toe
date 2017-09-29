require_relative "console_game.rb"
class Board
    attr_accessor :ttt_board
    def initialize
        @ttt_board = Array.new(9, '')
    end
    def update_position(position, marker)
        ttt_board[position] = marker
    end
    def valid_position?(position)
        if ttt_board[position] == ''
            true
        else
            false
        end
        
    end
    def valid_input?(input)
        
        if input.match(/[xXoO]/)
            true
        else
            false
        end
        
    end
    def full_board?
        ttt_board.count('') == 0
    end
    def winner?(marker)
        #2D array of winning combos
        winners = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]
        #Set results to false by default.
        results = false
        #Nested loops.  Iterates over 'outer' array
        #Then iterates over each inner_array.
        #Uses the value from each number in the inner array as
        #an index position in ttt_board.
        #If there is a match, it adds to count. If count reaches
        #three, results get set to true because all 3 in a set matched.
        #Count is reset to 0 for every new inner array item
        #because it is outside the inner loop.
        winners.each do |inner_array|
            count = 0
            inner_array.each do |value|
                if ttt_board[value] == marker
                    count += 1
                    if count == 3
                        results = true
                    end
                end
            end
        end
        #Calls our results which is false by default.
        #Only true if a set of the three combos matches.
        results
    end
end
# class Board
#     attr_accessor :board

#     def initialize()
#         @board = Array.new(9, "")
#     end
#     def new_move(player, pos)
#     # p board
#     # p player
#     # p pos
#    @board[pos.to_i - 1] = marker
#     end

#     def open_spot?(pos)
   
#     if board[pos] == ""
#         true
#     else
#         false
#     end
#     end
# def switch_player(current_player)
#     if current_player == "playerX"
#         current_player = "playerO"
#     elsif current_player == "playerO"
#         current_player = "playerX"
#     end
# end
# def full_board
#     if ttt_board.count('') == 0
#     # if @board.all?{|space| space.include?("x") || space.include?("o")} 
#     # board_full = true
#     # else 
#     # board_full = false
#     # end
#     end
# end
#     def winner?(marker)
#     win = [
#         [0,1,2],
#         [3,4,5],
#         [6,7,8],
#         [0,3,6],
#         [1,4,7],
#         [2,5,8],
#         [0,4,8],
#         [2,4,6]
#     ]
#     results = false
#     win.each do |win_array|
#         count = open_spot?
#         win_array.each do |value|
#             if board[value] == marker
#                 count += 1
#                 if count == 3
#                     results = true
#                 end
#             end
#         end
#     end
#             #p "board is #{board}"
#     # if  @board[0] == "x" && @board[3] == "x" && @board[6] == "x" || @board[0] == "o" && @board[3] == "o" && @board[6] == "o"
#     #     true
#     #    elsif @board[1] == "x" && @board[4] == "x" && @board[7] == "x" || @board[1] == "o" && @board[4] == "o" && @board[7] == "o"
#     #     true
#     #    elsif @board[2] == "x" && @board[5] == "x" && @board[8] == "x" || @board[2] == "o" && @board[5] == "o" && @board[8] == "o"
#     #     true
#     #    elsif @board[0] == "x" && @board[1] == "x" && @board[2] == "x" || @board[0] == "o" && @board[1] == "o" && @board[2] == "o"
#     #     true
#     #    elsif @board[3] == "x" && @board[4] == "x" && @board[5] == "x" || @board[3] == "o" && @board[4] == "o" && @board[5] == "o"
#     #     true
#     #    elsif @board[6] == "x" && @board[7] == "x" && @board[8] == "x" || @board[6] == "o" && @board[7] == "o" && @board[8] == "o"
#     #     true
#     #    elsif @board[0] == "x" && @board[4] == "x" && @board[8] == "x" || @board[0] == "o" && @board[4] == "o" && @board[8] == "o"
#     #     true
#     #    elsif @board[2] == "x" && @board[4] == "x" && @board[6] == "x" || @board[2] == "o" && @board[4] == "o" && @board[6] == "o"
#     #     true
#     #    else 
#     #     false
#     # end
#     end
# end