# frozen_string_literal: true

Dir['./lib/*.rb'].sort.each { |file| require file }

Game.new
