# frozen_string_literal: true

require_relative 'board'
require_relative 'param'
require_relative 'board_helper'

class PlayerBoard < Board
  extend BoardHelper

  class << self
    def turn(board)
      return if win? board

      input = gets.chomp

      if check_input(input) && board.column_open?(input.upcase)
        board.place_cell(Param.new(input, :player))
      else
        puts "Please select a valid column!\n\n"
        turn(board)
      end
    end

    def win?(board)
      check_vertical(board) || check_horizontal(board) || check_diagonal(board)
    end
  end
end
