# frozen_string_literal: true

class Param
  attr_reader :input,
              :type

  def initialize(input, type)
    @input = input.upcase
    @type = type
  end
end
