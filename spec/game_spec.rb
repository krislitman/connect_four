# frozen_string_literal: true

require 'rspec'
require './lib/game'

RSpec.describe Game do
  let(:message) { "Press s to start the game!\n" }

  describe 'Private methods' do
    context '#check_input' do
      let(:matcher) { /s/ }

      context 'with correct user input' do
        let(:user_input) { 's' }

        it 'returns true' do
          expect(user_input.downcase.match?(matcher)).to be true
        end
      end

      context 'with incorrect user input' do
        let(:user_input) { '123' }

        it 'returns false' do
          expect(user_input.downcase.match?(matcher)).to be false
        end
      end
    end
  end
end
