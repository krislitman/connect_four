#frozen_string_literal: true

require "./lib/turn"
require "./lib/message"
require "./lib/board"
require "./lib/player_board"
require "./lib/computer_board"

RSpec.describe Turn do
  describe "#round" do
    context "When a turn is initiated" do
      subject { described_class.round(board) }

      let(:board) { Board.new }
      let(:expectation) { 1 }

      before do
        allow(Message).to receive(:move).and_return(expectation)
        allow(Message).to receive(:turn_board_display).and_return(expectation)
        allow(PlayerBoard).to receive(:turn).and_return(expectation)
        allow(ComputerBoard).to receive(:turn).and_return(expectation)
      end

      it "prompts a move" do
        expect(Message).to receive(:move)
        subject
      end

      it "displays the board" do
        expect(Message).to receive(:turn_board_display).with(board)
        subject
      end

      it "lets player take a turn" do
        expect(PlayerBoard).to receive(:turn).with(board)
        subject
      end

      it "lets computer take a turn" do
        expect(ComputerBoard).to receive(:turn).with(board)
        subject
      end
    end
  end
end
