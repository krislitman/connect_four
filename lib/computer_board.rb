# frozen_string_literal: true

require_relative 'board'
require_relative 'board_helper'

class ComputerBoard < Board
  extend BoardHelper

  class << self
    def turn(board)
      return if win? board

      input = board.headers.sample

      if board.column_open?(input.upcase)
        board.place_cell(Param.new(input, :computer))
      else
        turn(board)
      end
    end

    def win?(board)
      check_vertical board
      check_horizontal board
    end
  end
end
