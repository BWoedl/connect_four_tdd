require_relative '../lib/game'

describe Game do
  let(:board) { double('board') }
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  subject(:game) { described_class.new(board) }

  context 'initializer' do 
    it 'gets created' do
      expect(subject).to be_a(Game)
    end
  end

  describe '.display' do 
    it 'prints the formatted board' do
      allow(board).to receive(:spaces).and_return([['', '', '', '', '', '', ''],
                                                   ['', '', '', '', '', '', ''],
                                                   ['', '', '', '', '', '', ''],
                                                   ['', '', '', '', '', '', ''],
                                                   ['', '', '', '', '', '', ''],
                                                   ['', '', '', '', '', '', '']])
      expect(subject).to receive(:puts).exactly(6).times
      subject.display
    end
  end

  describe '.draw?' do
    let(:draw_board) { double('draw_board') }
    subject(:game) { described_class.new(draw_board) }

    before do
      allow(player1).to receive(:number).and_return(1)
      allow(player1).to receive(:get_symbol).and_return('🔴')
      allow(player2).to receive(:number).and_return(2)
      allow(player2).to receive(:get_symbol).and_return('🔵')
    end

    context 'board is full and game is draw' do
      it 'returns true' do
        allow(draw_board).to receive(:spaces).and_return([['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔵'],
                                                               ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                               ['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔵'],
                                                               ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                               ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                               ['🔴', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
        expect(subject.draw?).to be true
      end
    end

    context 'game is in progress' do
      it 'returns false' do
        allow(draw_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔵', '', '🔵'],
                                                               ['🔴', '🔴', '🔵', '🔵', '🔵', '', '🔴'],
                                                               ['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔵'],
                                                               ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                               ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                               ['🔴', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
        expect(subject.draw?).to be false
      end
    end
  end

  describe '.won?' do
    let(:won_board) { double('won_board') }
    subject(:game) { described_class.new(won_board) }

    before do
      allow(player1).to receive(:number).and_return(1)
      allow(player1).to receive(:get_symbol).and_return('🔴')
      allow(player2).to receive(:number).and_return(2)
      allow(player2).to receive(:get_symbol).and_return('🔵')
    end

    context 'game is won with 4 horizontal in top right' do
      it 'returns true' do
        allow(won_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔵', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                         ['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                         ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
        expect(subject.check_horizontal(player2)).to be true
      end
    end
    context 'game is won with 4 horizontal in bottom left' do
      it 'returns true' do
        allow(won_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔵', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                         ['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                         ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔴', '🔴', '🔵', '🔴', '🔴']])
        expect(subject.check_horizontal(player1)).to be true
      end
    end
    context 'game is won with 4 horizontal in middle' do
      it 'returns true' do
        allow(won_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔵', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                         ['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔴'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔵', '🔴'],
                                                         ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
        expect(subject.check_horizontal(player2)).to be true
      end
    end
  end

  describe '.check_vertical' do
    let(:won_board) { double('won_board') }
    subject(:game) { described_class.new(won_board) }

    before do
      allow(player1).to receive(:number).and_return(1)
      allow(player1).to receive(:get_symbol).and_return('🔴')
      allow(player2).to receive(:number).and_return(2)
      allow(player2).to receive(:get_symbol).and_return('🔵')
    end

    context 'game is won with 4 vertical in top right' do
      it 'returns true' do
        allow(won_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔴', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔵'],
                                                         ['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔵'],
                                                         ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔴'],
                                                         ['🔴', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
        expect(subject.won?(player2)).to be true
      end
    end
  end

  describe '.check_diagonal' do
    let(:won_board) { double('won_board') }
    subject(:game) { described_class.new(won_board) }

    before do
      allow(player1).to receive(:number).and_return(1)
      allow(player1).to receive(:get_symbol).and_return('🔴')
      allow(player2).to receive(:number).and_return(2)
      allow(player2).to receive(:get_symbol).and_return('🔵')
    end

    context 'game is won with 4 vertical in top right' do
      it 'returns true' do
        allow(won_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔴', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔴', '🔵', '🔴', '🔵'],
                                                         ['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                         ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
        expect(subject.check_diagonal(player1)).to be true
      end
    end

    context 'game is won with 4 vertical in bottom left' do
      it 'returns true' do
        allow(won_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔵', '🔴', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔴', '🔴', '🔴', '🔵'],
                                                         ['🔵', '🔵', '🔴', '🔵', '🔵', '🔵', '🔵'],
                                                         ['🔴', '🔴', '🔵', '🔵', '🔴', '🔴', '🔴'],
                                                         ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                         ['🔵', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
        expect(subject.check_diagonal(player2)).to be true
      end
    end
  end
end
