require "sinatra"
require "pg"
require_relative "tictactoe.rb"
require "aws-sdk"
# require_relative "console_human.rb"
# require_relative "console_sequential.rb"
# require_relative "random.rb"
require_relative "player_classes.rb"
require_relative "unbeatable.rb"
enable :sessions
load './local_env.rb' if File.exists?('./local_env.rb')
db_params = {
    host: ENV['host'],
    port: ENV['port'],
    dbname: ENV['dbname'],
    user: ENV['user'],
    password: ENV['password']
}

#db = PG::Connection.new(db_params)
get "/" do
    #scoreboard = db.exec("Select * From tictactoe_data")
    session[:board] = Board.new
    erb :index, locals: {board: session[:board], scoreboard: scoreboard}
end
post "/select" do
    session[:player1_style] = params[:player1]
    session[:player2_style] = params[:player2]
    session[:human1] = "no"
    session[:human2] = "no"
    if session[:player1_style] == 'Human'
        session[:player1] = Human2.new('X')
        session[:human1] = "yes"
         session[:human_name_one] = params[:human_name]
    elsif session[:player1_style] == 'Easy'
         session[:human_name_one] = "Easy"
        session[:player1] = Sequential2.new('X')
    elsif session[:player1_style] == 'Medium'
        session[:human_name_one] = "Medium"
        session[:player1] = Random2.new('X')
    elsif session[:player1_style] == 'Unbeatable'
        session[:player1] = Unbeatable.new('X')
        session[:human_name_one] = "Unbeatable"
    end
    if session[:player2_style] == 'Human'
        session[:player2] = Human2.new('O')
        session[:human2] = "yes"
         session[:human_name_two] = params[:human_name_2]
    elsif session[:player2_style] == 'Medium'
        session[:human_name_two] = 'Medium'
        session[:player2] = Random2.new('O')
        puts "marker is #{session[:player2].marker}"
    elsif session[:player2_style] == 'Easy'
        session[:human_name_two] = 'Easy'
        session[:player2] = Sequential2.new('O')
    elsif session[:player2_style] == 'Unbeatable'
        session[:human_name_two] = 'Unbeatable'
        session[:player2] = Unbeatable.new('O')
    end
    session[:active] = session[:player1]
    if session[:human1] == "yes"
       
        redirect "/board"
    # elsif session[:human2] == "yes"
    #     redirect "/board"
    else 
        puts "THIS is active player from post select #{session[:active].marker}!!!!!!!!!!!!!!!!!!!!"
        redirect "/computer_move"
    end
end

get "/board" do
    puts "this is active human player #{session[:active].marker}"
    erb :board_page, locals: {player1: session[:player1], player2: session[:player2], active: session[:active].marker, board: session[:board]}

end
post "/make_a_move" do
    player_move = params[:spot].to_i - 1
    if session[:board].valid_position?(player_move) == true
        puts player_move
        session[:board].update_position(player_move, session[:active].marker)
        redirect "/check_board"
    else
        redirect "/board"
    end
end

get "/computer_move" do 
    puts "this is active computer #{session[:active].marker}"
    puts "at get computer move, #{session[:active]}"
    player_move = session[:active].get_move(session[:board].ttt_board)
    puts "move is #{player_move}"
    puts "marker is #{session[:active].marker}"
    session[:board].update_position(player_move, session[:active].marker)
    
    redirect '/check_board'
end

get "/check_board" do
    win_time = Time.new
    if session[:board].winner?(session[:active].marker)
        end_game = "#{session[:active].marker} WINS!"
        puts "WINNNER"
        #db.exec("INSERT INTO tictactoe_data(player1_data, player2_data, winner, date) VALUES('#{session[:human_name_one]}', '#{session[:human_name_two]}', '#{end_game}', '#{win_time.inspect}')");
        erb :check_over, locals: {board: session[:board], end_game: end_game}
    elsif session[:board].full_board? == true
        end_game = "Its a cats game!"
        #db.exec("INSERT INTO tictactoe_data(player1_data, player2_data, winner, date) VALUES('#{session[:human_name_one]}', '#{session[:human_name_two]}', '#{end_game}', '#{win_time.inspect}')");
        erb :check_over, locals: {board: session[:board], end_game: end_game}
    else
        if session[:active] == session[:player1]
        session[:active] = session[:player2]
        else
        session[:active] = session[:player1]
        end
        if session[:active] == session[:player1] && session[:human1] == "yes" || session[:active] == session[:player2] && session[:human2] == "yes"
        redirect "/board"
    else
        puts "THIS IS ACTIVE PLAYER FROM check board #{session[:active].marker}"
        redirect "/computer_move"
        end
    end
    
end