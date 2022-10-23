# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'player_board'
require_relative 'computer_board'
require_relative 'message'
require 'colorize'

class Game
  START = /p/.freeze
  QUIT = /q/.freeze

  def initialize
    @board = Board.new
    @game_over = false
    welcome
    @player = player
  end

  private

  def welcome
    Message.welcome
    input = gets.chomp

    if check_input(input)
      start
    elsif check_quit(input)
      Message.thanks
      exit
    else
      Message.invalid_input
      welcome
    end
  end

  def start
    @player = Player.new
    Turn.round(@board) until game_over?
    Game.new
  end

  def game_over?
    if @board.full?
      Message.draw(@board)
      reset_game
    elsif PlayerBoard.win? @board
      Message.win(@board)
      reset_game
    elsif ComputerBoard.win? @board
      Message.lose(@board)
      reset_game
    end
  end

  def reset_game
    @game_over = true
    @player.finish_time = Time.now
    Message.stats(@player)
  end

  def check_input(user_input)
    user_input.downcase.match?(START)
  end

  def check_quit(input)
    input.downcase.match?(QUIT)
  end
end
