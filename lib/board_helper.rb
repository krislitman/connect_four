# frozen_string_literal: true

module BoardHelper
  PLAYER_BOARD = 'PlayerBoard'
  COMPUTER_BOARD = 'ComputerBoard'

  def convert_seconds_to_hms(seconds)
    "%02d:%02d:%02d" % [seconds / 3600, seconds / 60 % 60, seconds % 60]
  end

  def correct_inputs
    'ABCDEFG'
  end

  def check_input(input)
    correct_inputs.include?(input.upcase) && input.length == 1
  end

  def player_win
    'X'
  end

  def computer_win
    'O'
  end

  def check_each_diagonal(board, type)
    board = board.get_rendered_multi_array

    4.times do |num|
      4.times do |num_2|
        if board[num][num_2] == type &&
          board[num + 1][num_2 + 1] == type &&
          board[num + 2][num_2 + 2] == type &&
          board[num + 3][num_2 + 3] == type
          return true
        end
      end
    end

    board = board.transpose

    4.times do |num|
      4.times do |num_2|
        if board[num][num_2] == type &&
          board[num + 1][num_2 + 1] == type &&
          board[num + 2][num_2 + 2] == type &&
          board[num + 3][num_2 + 3] == type
          return true
        end
      end
    end
  end

  def check_diagonal(board)
    case name
    when PLAYER_BOARD
      if check_each_diagonal(board, player_win) == true
        return true
      end
    when COMPUTER_BOARD
      if check_each_diagonal(board, computer_win) == true
        return true
      end
    end
    return false
  end

  def check_each_horizontal(board, type)
    board.headers.each_with_index do |_header, index|
      board.get_rendered_row(index).each_cons(4) do |cells|
        result = cells.uniq.size == 1 && cells.first != Cell::EMPTY

        return true if result && type == cells.first
      end
    end
  end

  def check_horizontal(board)
    case name
    when PLAYER_BOARD
      if check_each_horizontal(board, player_win) == true
        return true
      end
    when COMPUTER_BOARD
      if check_each_horizontal(board, computer_win) == true
        return true
      end
    end
    return false
  end

  def check_each_vertical(board, type)
    board.board.each do |_key, values|
      Cell.render(values).each_cons(4) do |cells|
        result = cells.uniq.size == 1 && cells.first != Cell::EMPTY

        return true if result && type == cells.first
      end
    end
  end

  def check_vertical(board)
    case name
    when PLAYER_BOARD
      if check_each_vertical(board, player_win) == true
        return true
      end
    when COMPUTER_BOARD
      if check_each_vertical(board, computer_win) == true
        return true
      end
    end
    return false
  end
end
