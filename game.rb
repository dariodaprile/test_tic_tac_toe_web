require 'sinatra/base'
require_relative './lib/tic_tac_toe'

class TicTacToeWeb < Sinatra::Base

  get '/' do
    @game = TicTacToe.new('         ')
    @message = "Place X"
    erb :home
  end

  post '/' do
    @game = TicTacToe.new(params[:cells].join)
    if @game.finished?
        @message = " #{@game.current_player} is the winner."
        erb :new
    elsif @game.draw?
        @message = "Match is drawn."
        erb :new
    else
        @message = @game.current_player == "X" ? "Now 0" : "Now X"
        erb :home
    end
  end

end

