require_relative "console_game.rb"

game = ConsoleGame.new

game.intro

until game.check_winner || game.board.full_board?
    game.display_board
    game.update_board
    if game.check_winner == false 
        game.change_player
        game.display_board
    else 
        game.display_board
    end
    
   

end
if game.check_winner
    puts "#{game.active_player.marker} wins!"
else
    puts "It's a cats game!"
end