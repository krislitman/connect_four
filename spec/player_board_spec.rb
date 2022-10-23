# frozen_string_literal: true

require './lib/player_board'
require './lib/board_helper'
require './lib/cell'
require './lib/param'

RSpec.describe PlayerBoard do
  let(:player_board) { Board.new }

  describe "#check_diagonal" do
    subject { PlayerBoard.check_diagonal player_board }

    context "With a players board" do
      context "and there are four diagonal moves" do
        before do
          player_board.place_cell(Param.new('a', :player))

          player_board.place_cell(Param.new('b', :computer))
          player_board.place_cell(Param.new('b', :player))

          player_board.place_cell(Param.new('c', :computer))
          player_board.place_cell(Param.new('c', :computer))
          player_board.place_cell(Param.new('c', :player))

          player_board.place_cell(Param.new('d', :computer))
          player_board.place_cell(Param.new('d', :computer))
          player_board.place_cell(Param.new('d', :computer))
          player_board.place_cell(Param.new('d', :player))
        end

        it "returns true" do
          expect(subject).to be true
        end
      end
    end
  end

  describe '#check_horizontal' do
    subject { PlayerBoard.check_horizontal player_board }

    context 'With a players board' do
      context 'and there are four horizontal moves' do
        before do
          player_board.place_cell(Param.new('a', :player))
          player_board.place_cell(Param.new('b', :player))
          player_board.place_cell(Param.new('c', :player))
          player_board.place_cell(Param.new('d', :player))
        end

        it 'returns true' do
          expect(subject).to be true
        end
      end
    end
  end

  describe '#check_vertical' do
    subject { PlayerBoard.check_vertical player_board }

    context 'With a players board' do
      context 'and there are four moves vertically' do
        let(:params) { Param.new('a', :player) }

        before do
          4.times do
            player_board.place_cell(params)
          end
        end

        it 'returns true' do
          expect(subject).to be true
        end
      end
    end
  end
end
