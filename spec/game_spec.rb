require_relative '../lib/game'

describe Game do
  let(:board) { double('board') }
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  subject(:game) { described_class.new(board, player1, player2) }

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
    subject(:game) { described_class.new(draw_board, player1, player2) }

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
    subject(:game) { described_class.new(won_board, player1, player2) }

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
    subject(:game) { described_class.new(won_board, player1, player2) }

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
    subject(:game) { described_class.new(won_board, player1, player2) }

    before do
      allow(player1).to receive(:number).and_return(1)
      allow(player1).to receive(:get_symbol).and_return('🔴')
      allow(player2).to receive(:number).and_return(2)
      allow(player2).to receive(:get_symbol).and_return('🔵')
    end

    it 'returns true with four diagonal from top left' do
      allow(won_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔴', '🔵', '🔵'],
                                                       ['🔴', '🔴', '🔵', '🔴', '🔵', '🔴', '🔵'],
                                                       ['🔵', '🔵', '🔴', '🔴', '🔴', '🔵', '🔵'],
                                                       ['🔴', '🔴', '🔵', '🔵', '🔵', '🔴', '🔴'],
                                                       ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                       ['🔴', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
      expect(subject.check_diagonal(player1)).to be true
    end
    it 'returns true with four diagonal in the bottom left' do
      allow(won_board).to receive(:spaces).and_return([['🔴', '🔴', '🔴', '🔵', '🔵', '🔴', '🔵'],
                                                       ['🔴', '🔴', '🔵', '🔴', '🔴', '🔴', '🔵'],
                                                       ['🔵', '🔵', '🔴', '🔵', '🔵', '🔵', '🔵'],
                                                       ['🔴', '🔴', '🔵', '🔵', '🔴', '🔴', '🔴'],
                                                       ['🔵', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                       ['🔵', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
      expect(subject.check_diagonal(player2)).to be true
    end
    it 'returns true with four diagonal in center' do
      allow(won_board).to receive(:spaces).and_return([['', '🔴', '🔴', '', '', '', ''],
                                                       ['', '🔵', '🔵', '🔴', '', '', ''],
                                                       ['', '🔴', '🔴', '🔵', '🔵', '🔵', ''],
                                                       ['', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴'],
                                                       ['', '🔵', '🔵', '🔴', '🔵', '🔵', '🔵'],
                                                       ['', '🔴', '🔴', '🔵', '🔴', '🔴', '🔴']])
      expect(subject.check_diagonal(player1)).to be true
    end
  end

  describe '.player_turn' do
    context 'specifies the player whose turn it is' do
      it 'returns player1 if odd turn' do
        game.instance_variable_set(:@turn, 1)
        expect(game.player_turn).to eq(player1)
      end
    end
  end

  describe '.valid_move?' do
    let(:full_board) { double('board') }
    let(:empty_board) { double('board') }
    let(:player1) { double('player1') }
    let(:player2) { double('player2') }
    subject(:game_empty) { described_class.new(empty_board, player1, player2) }
    subject(:game_full) { described_class.new(full_board, player1, player2) }

    context 'determines if move is acceptable for grid' do
      before do
        allow(full_board).to receive(:open_space?).and_return(false)
        allow(empty_board).to receive(:open_space?).and_return(true)
      end

      it 'returns false if out of bounds column' do
        expect(game_empty.valid_move?(8)).to be false
      end

      it 'returns true if in bounds' do
        expect(game_empty.valid_move?(4)).to be true
      end

      it 'returns false if all rows in that column are occupied' do
        expect(game_full.valid_move?(4)).to be false
      end
    end
  end

  describe '.play' do
    context 'when game in progress' do
      before do
        allow(subject).to receive(:game_over?).with(player1, player2).and_return(false, true)
        allow(subject).to receive(:gets).and_return('2')
        allow(player2).to receive(:name).and_return('Brittany')
        allow(board).to receive(:spaces).and_return([['', '', '', '', '', '', ''],
                                                     ['', '', '', '', '', '', ''],
                                                     ['', '', '', '🔵', '', '', ''],
                                                     ['', '🔴', '🔵', '', '', '', ''],
                                                     ['', '🔴', '🔵', '', '', '', ''],
                                                     ['', '🔴', '🔵', '', '', '', '']])
        allow(subject).to receive(:puts)
      end
      it 'calls for another turn' do
        expect(subject).to receive(:take_turn).once
        subject.play
      end
    end
  end
end
