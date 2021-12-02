class TicTacToe
  @turn = String.new

  def initialize
    create_board
    @turn = 'X'
  end

  private

  def create_board
    @board = [[9, 8, 7], [6, 5, 4], [3, 2, 1]]
  end

  def display_board
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    puts '---+---+---'
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    puts '---+---+---'
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end

  public

  def make_move(position)
    if @board[0].index(position)
      @board[0][@board[0].index(position)] = @turn
    elsif @board[1].index(position)
      @board[1][@board[1].index(position)] = @turn
    elsif @board[2].index(position)
      @board[2][@board[2].index(position)] = @turn
    else
      return puts 'Invalid move.'
    end
    @turn = @turn == 'X' ? 'O' : 'X'
    display_board
  end
end

game1 = TicTacToe.new
game1.make_move(2)