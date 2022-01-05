require_relative '../tic_tac_toe'
describe TicTacToe do
  describe '#end_turn' do
    subject(:game_turn) { described_class.new }
    context 'when victory is false and it was circle turn' do
      before do
        game_turn.end_turn
        game_turn.end_turn
      end
      it 'changes turn from circle to X' do
        expect(game_turn.instance_variable_get(:@turn)).to eql('X')
      end
    end

    context 'when victory is false and it was X turn' do
      before do
        game_turn.end_turn
      end
      it 'changes turn from circle to X' do
        expect(game_turn.instance_variable_get(:@turn)).to eql('O')
      end
    end

    context 'when victory is true' do
      let(:victory) { true }
      before do
        allow(game_turn).to receive(:victory).and_return(victory)
      end
      it 'does not displays board' do
        expect(game_turn.end_turn).not_to be_nil
      end
    end
  end

  describe '#make_move' do
    subject(:game_move) { described_class.new }
    context 'when X moves to position 3' do
      it 'sets the value of X to the position on the board' do
        game_move.make_move(3)
        this_board = game_move.instance_variable_get(:@board)
        expect(this_board[2][2]).to eq('X')
      end
    end
    context 'when O moves to position 4 after another movement' do
      it 'sets the value of O to position 4' do
        game_move.make_move(5)
        game_move.make_move(4)
        this_board = game_move.instance_variable_get(:@board)
        expect(this_board[1][0]).to eq('O')
      end
    end
    context 'when the position is already occupied' do
      it 'returns an error message' do
        game_move.make_move(3)
        expect(game_move.make_move(3)).to eql('error')
      end
    end
  end

  describe '#board_condition' do
    subject(:game_condition) { described_class.new }
    context 'when top row is X X X' do
      before do
        game_condition.make_move(7)
        game_condition.make_move(4)
        game_condition.make_move(8)
        game_condition.make_move(3)
        game_condition.make_move(9)
      end
      it 'calls victory' do
        expect(game_condition).to receive(:victory)
        game_condition.board_condition
      end
    end
    context 'when turn_count is 9' do
      before do
        game_condition.instance_variable_set(:@turn_count, 9)
      end
      it 'calls draw method' do
        expect(game_condition).to receive(:draw)
        game_condition.board_condition
      end
    end
  end
end
