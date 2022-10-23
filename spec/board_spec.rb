# frozen_string_literal: true

require 'rspec'
require './lib/board'

RSpec.describe Board do
  describe '#clear' do
    let(:board) { Board.new }

    context 'After clearing a board' do
      before { board.clear }

      context 'player is able to make a new move' do
        let(:params) { Param.new('a', :player) }
        let(:rendered) { board.board['A'].first.available? }

        it 'renders' do
          subject
          board.place_cell(params)

          expect(rendered).to be false
        end
      end
    end
  end

  describe '#print_board' do
    subject { described_class.new.render }

    context 'With a header and cells' do
      let(:output) { "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n.......\n" }

      it 'prints the board' do
        expect(subject).to eq(output)
      end
    end
  end

  describe '#place_cell' do
    let(:board) { described_class.new }

    context 'With a valid placement' do
      let(:output) { "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\nX......\n" }
      let(:params) { Param.new('a', :player) }

      before { board.place_cell(params) }

      it 'places at the bottom of the column' do
        expect(board.render).to eq(output)
      end
    end
  end
end
