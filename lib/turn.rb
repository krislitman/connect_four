# frozen_string_literal: true

require_relative 'board'
require_relative 'player_board'
require_relative 'computer_board'
require_relative 'message'
require 'colorize'

class Turn
  class << self
    def round(board)
      Message.move
      Message.turn_board_display(board)

      PlayerBoard.turn(board)
      ComputerBoard.turn(board) unless board.full?
    end
  end
end
