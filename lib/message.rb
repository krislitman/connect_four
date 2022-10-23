# frozen_string_literal: true

require_relative 'board'
require_relative 'board_helper'
require_relative 'player'
require "active_support/core_ext/string/inflections"
require 'colorize'

class Message
  extend BoardHelper

  class << self

    def stats(player)
      time = convert_seconds_to_hms(player.total_time)
      name = player.name.titleize

      puts "Good job #{name}!\nYour total time playing was: #{time}\n".cyan
      puts "Press any key to continue".magenta
      gets.chomp
    end

    def player_name
      puts "Please enter your name!\n".magenta
    end

    def turn_board_display(board)
      puts board.render.cyan
    end

    def move
      puts "Make a move! (A-G) \n".magenta
    end

    def welcome
      puts 'Welcome to CONNECT FOUR'.cyan
      puts "Enter p to play. Enter q to quit.\n".magenta
    end

    def thanks
      puts "Thanks for playing!\n".cyan
    end

    def win(board)
      puts "You win!\n".green
      puts board.render.green
    end

    def lose(board)
      puts "You lost, so sad!\n".red
      puts board.render.red
    end

    def draw(board)
      puts "DRAW!\n".yellow
      puts board.render.yellow
    end

    def invalid_input
      puts "Please try again :(\n\n".red
    end
  end
end
