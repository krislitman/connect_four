# frozen_string_literal: true

class Cell
  EMPTY = '.'
  PLACEMENT_TYPE = {
    player: 'X',
    computer: 'O'
  }.freeze

  attr_reader :render

  def initialize
    @render = EMPTY
  end

  def reset!
    @render = EMPTY
  end

  def available?
    @render == EMPTY
  end

  def taken?
    @render != EMPTY
  end

  def place!(type)
    @render = PLACEMENT_TYPE[type]
  end

  class << self
    def render(cells)
      cells.map(&:render).push("\n")
    end
  end
end
