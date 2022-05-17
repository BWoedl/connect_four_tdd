require_relative '../lib/board'

describe Board do
  subject(:board) { Board.new }
  let(:player_1) { double('player') }
  let(:move) { 'move' }

  before do
    allow(player_1).to receive(:number).and_return(1)
  end

  describe '.update_board' do
    context 'changes board state' do
      it 'takes a move and adds it to the board' do
        subject.update_board(player_1, 'f4')
        expect(subject.spaces).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                      ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                      ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                      ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                      ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                                      ' ', ' ', ' ', '🔴', ' ', ' ', ' '])
      end
    end
  end

  describe '.translate_input' do
    context 'takes a user provided input for the move' do 
      it 'returns an emoji and index' do
        result = subject.translate_input(player_1, 'f4')
        expect(result).to eq(['🔴', 38])
      end
    end
  end
end
