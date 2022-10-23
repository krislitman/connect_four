# frozen_string_literal: true

require_relative "message"

class Player
  attr_reader :name,
              :start_time,
              :total_time

  attr_accessor :finish_time

  def initialize
    create
    @name = name
    @start_time = start_time
    @finish_time = finish_time
  end

  def total_time
    time = @finish_time - @start_time
    time.round(2)
  end

  def create
    Message.player_name
    input = gets.chomp

    @name = input
    @start_time = Time.now
  end
end
