# frozen_string_literal: true

require_relative 'cell'

class Board
  attr_reader :headers,
              :board

  def initialize
    @board = build
    @headers = @board.keys
  end

  def clear
    @board.values.flatten.each(&:reset!)
  end

  def place_cell(params)
    board[params.input].each do |cell|
      next if cell.taken?

      cell.place! params.type
      return
    end
  end

  def render
    result = @board.keys.push("\n")

    @board.values.each_with_index do |_value, index|
      cells = get_row((index + 1) * -1)
      result.push(Cell.render(cells))
    end

    result.join('')
  end

  def get_row(index)
    @board.values.dup.map do |values|
      values[index]
    end
  end

  def get_rendered_multi_array
    self.board.values.reduce([]) do |acc, cells|
      acc << cells.map { |cell| cell.render }
      acc
    end
  end

  def get_rendered_row(index)
    get_row(index).map(&:render)
  end

  def column_open?(input)
    @board[input.upcase].any?(&:available?)
  end

  def full?
    @board.values.flatten.none?(&:available?)
  end

  private

  def build
    base = {
      'A' => [],
      'B' => [],
      'C' => [],
      'D' => [],
      'E' => [],
      'F' => [],
      'G' => []
    }

    base.each do |_, value|
      7.times do
        value.push(Cell.new)
      end
    end
  end
end
