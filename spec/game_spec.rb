require_relative '../lib/game'

describe Game do
  let(:display_board) { double('display_board') }
  subject(:game) { described_class.new(display_board) }

  context 'initializer' do 
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
      expect(subject).to receive(:p).with([' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                           ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                           ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                           ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                           ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                           ' ', ' ', ' ', ' ', ' ', ' ', ' '])
      subject.display
    end
  end
end
