# frozen_string_literal: true

require "./lib/cell"

RSpec.describe Cell do
  let(:cell) { described_class.new }
  let(:empty) { described_class::EMPTY }

  describe "Instance methods" do
    describe "#reset!" do
      subject { cell.reset! }

      before { cell.place!(:player) }

      it "renders as empty" do
        subject
        expect(cell.render).to eq(empty)
      end
    end

    describe "#available?" do
      subject { cell.available? }

      before { cell.place!(:player) }

      context "With a taken cell" do
        it "returns false" do
          expect(subject).to be false
        end
      end

      context "With an available cell" do

        before { cell.reset! }

        it "returns true" do
          expect(subject).to be true
        end
      end
    end

    describe "#taken?" do
      subject { cell.taken? }

      before { cell.place!(:player) }

      context "With a taken cell" do
        it "returns true" do
          expect(subject).to be true
        end
      end
    end

    describe "#place!" do
      subject { cell.place! type }

      context "With a player" do
        let(:type) { :player }
        let(:placement) { "X" }

        it "renders the player placement" do
          subject
          expect(cell.render).to eq(placement)
        end
      end

      context "With a computer" do
        let(:type) { :computer }
        let(:placement) { "O" }

        it "renders the computer placement" do
          subject
          expect(cell.render).to eq(placement)
        end
      end
    end
  end
end
