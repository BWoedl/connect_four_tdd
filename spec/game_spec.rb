require_relative '../lib/game.rb'

describe Game do 

let(:display_board) { double('board') }
subject(:game) { described_class.new(display_board) }

  xcontext 'initializer' do 
    it 'gets created' do
      expect(subject).to be_a(Game)
    end
  end

  describe '#display' do 
    it 'prints the board' do
      allow(display_board).to receive(:spaces).and_return([' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                                    ' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                                    ' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                                    ' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                                    ' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                                    ' ', ' ', ' ', ' ', ' ', ' ', ' '])

      expect(game.display).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                        ' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                        ' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                        ' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                        ' ', ' ', ' ', ' ', ' ', ' ', ' ', 
                                        ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end
end