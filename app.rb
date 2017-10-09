require "sinatra"
require_relative "tictactoe.rb"
require_relative "console_human.rb"
require_relative "console_sequential.rb"
require_relative "random.rb"
require_relative "unbeatable.rb"
enable :sessions

get "/" do
    session[:board] = Board.new
    erb :index, locals: {board: session[:board]}
end
post "/select" do
    session[:player1_style] = params[:player1]
    session[:player1_style] = params[:player2]
    session[:human1] = "no"
    session[:human2] = "no"
    if session[:player1_style] == 'Human'
        session[:player1] = Human.new('X')
        session[:human1] = "yes"
    elsif session[:player1_type] == 'Easy'
        session[:player1] = Sequential.new('X')
    elsif session[:player1_style] == "Medium"
        session[:player1] = Random.new('X')
    elsif session[:player1_style] == 'Unbeatable'
        session[:player1] = Unbeatable.new('X')
    end
    if session[:player2_style] == 'Human'
        session[:player2] = Human.new('O')
        session[:human2] = "yes"
    elsif session[:player2_type] == 'Easy'
        session[:player2] = Sequential.new('O')
    elsif session[:player2_style] == "Medium"
        session[:player2] = Random.new ('O')
    elsif session[:player2_style] == 'Unbeatable'
        session[:player2] = Unbeatable.new('O')
    end
    session[:active] = session[:player1]
    if session[:human1] == "yes"
        redirect "/board"
    elsif session[:human2] == "yes"
        redirect "/board"
    else 
        redirect "/move"
    end
end

get "/board" do
    erb :board_page, locals: {player1: session[:player1], player2: session[:player2], active: session[:active].marker, board: session[:board]}
end

get "/move" do 
    player_move = session[:active].get_move(session[:board].ttt_board)
    session[:board].update_position(player_move, session[:active].marker)
    redirect '/check_board'
end

get "/check_board" do
erb :check_over, locals: {player1: session[:player1], player2: session[:player2], active: session[:active].marker, board: session[:board], move: session[:player_move]}
end