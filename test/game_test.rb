require_relative '../game'
require_relative '../lib/tic_tac_toe'
require 'minitest'
require 'minitest/autorun'
require 'rack/test'

class TicTacToeWebTest < Minitest::Test

  def setup
    @browser = Rack::Test::Session.new(Rack::MockSession.new(TicTacToeWeb))
  end

  def test_it_shows_the_homepage
    @browser.get '/'
    assert @browser.last_response.ok?
    assert @browser.last_response.body.include? "The Ultimate Tic Tac Toe"
  end

end