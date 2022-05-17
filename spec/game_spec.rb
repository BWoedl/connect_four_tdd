require_relative '../lib/game'

describe Game do
  let(:board) { double('display_board') }
  subject(:game) { described_class.new(board) }

  context 'initializer' do 
    it 'gets created' do
      expect(subject).to be_a(Game)
    end
  end

  describe '.display' do 
    it 'prints the formatted board' do
      allow(board).to receive(:spaces).and_return([' ', ' ', ' ', ' ', ' ', ' ', ' ',
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

  describe '.game_over?' do
    let(:completed_board) { double('completed_board') }

    context 'board is full and game is draw' do
      it 'returns true' do
        allow(completed_board).to receive(:spaces).and_return(['🟣', '🟣', '🔴', '🔴', '🔴', '🟣', '🟣',
                                                               '🔴', '🔴', '🟣', '🟣', '🟣', '🔴', '🔴',
                                                               '🟣', '🟣', '🔴', '🔴', '🔴', '🟣', '🟣',
                                                               '🔴', '🔴', '🟣', '🟣', '🟣', '🔴', '🔴',
                                                               '🟣', '🟣', '🟣', '🔴', '🟣', '🟣', '🟣',
                                                               '🔴', '🔴', '🔴', '🟣', '🔴', '🔴', '🔴'])
        expect(subject.game_over?).to be true
      end
    end

    context 'game is won' do
      it 'returns true' do
        allow(completed_board).to receive(:spaces).and_return(['🔴', '🔴', '🔴', '🟣', '🟣', '🟣', '🟣',
                                                               '🔴', '🔴', '🟣', '🟣', '🟣', '🔴', '🔴',
                                                               '🟣', '🟣', '🔴', '🔴', '🔴', '🟣', '🟣',
                                                               '🔴', '🔴', '🟣', '🟣', '🟣', '🔴', '🔴',
                                                               '🟣', '🟣', '🟣', '🔴', '🟣', '🟣', '🟣',
                                                               '🔴', '🔴', '🔴', '🟣', '🔴', '🔴', '🔴'])
        expect(subject.game_over?).to be true
      end
    end

    context 'game is in progress' do
      it 'returns false' do
        allow(completed_board).to receive(:spaces).and_return(['🔴', '🔴', '🔴', '🟣', '🟣', ' ', '🟣',
                                                               '🔴', '🔴', '🟣', '🟣', '🟣', ' ', '🔴',
                                                               '🟣', '🟣', '🔴', '🔴', '🔴', '🟣', '🟣',
                                                               '🔴', '🔴', '🟣', '🟣', '🟣', '🔴', '🔴',
                                                               '🟣', '🟣', '🟣', '🔴', '🟣', '🟣', '🟣',
                                                               '🔴', '🔴', '🔴', '🟣', '🔴', '🔴', '🔴'])
        expect(subject.game_over?).to be false
      end
    end
  end
end
