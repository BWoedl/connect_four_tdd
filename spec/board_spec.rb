require_relative '../lib/board'

describe Board do
  subject(:board) { Board.new }
  let(:player1) { double('player1') }
  let(:move) { 'move' }

  before do
    allow(player1).to receive(:number).and_return(1)
    allow(player1).to receive(:get_symbol).and_return('🔴')
  end

  describe '.update_board' do
    context 'changes board state' do
      it 'takes a move and adds it to the board' do
        subject.update_board(player1, 'f4')
        expect(subject.spaces).to eq([['', '', '', '', '', '', ''],
                                      ['', '', '', '', '', '', ''],
                                      ['', '', '', '', '', '', ''],
                                      ['', '', '', '', '', '', ''],
                                      ['', '', '', '', '', '', ''],
                                      ['', '', '', '🔴', '', '', '']])
      end
    end
  end

  describe '.translate_input' do
    context 'takes a user provided input for the move' do
      it 'returns an emoji and row/column' do
        result = subject.translate_input(player1, 'f4')
        expect(result).to eq(['🔴', [5, 3]])
      end
    end
  end
end
