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
        subject.update_board(player1, 3)
        expect(subject.spaces).to eq([['', '', '', '', '', '', ''],
                                      ['', '', '', '', '', '', ''],
                                      ['', '', '', '', '', '', ''],
                                      ['', '', '', '', '', '', ''],
                                      ['', '', '', '', '', '', ''],
                                      ['', '', '', '🔴', '', '', '']])
      end
    end
  end

  describe '.find_row' do
    context 'takes a user provided input for the move' do
      it 'returns a row' do
        result = subject.find_row(3)
        expect(result).to eq(5)
      end
    end
  end

  describe '.open_space?' do
    context 'determines if space is occupied' do
      it 'returns true if space is empty' do
        expect(subject.open_space?(2)).to be true
      end
      it 'returns false if space if occupied' do
        6.times { subject.update_board(player1, 3) }
        expect(subject.open_space?(3)).to be false
      end
    end
  end
end
