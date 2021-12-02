# Class for a tic-tac-toe game
class TicTacToe
  @turn = String.new
  @victory = false
  attr_accessor :player_one, :player_two

  def initialize
    create_board
    @turn = 'X'
    @turn_count = 0
    puts 'First player name: '
    @player_one = gets.chomp
    puts 'Second player name: '
    @player_two = gets.chomp
    @victory = false
    game_loop
  end

  private

  def create_board
    @board = [[7, 8, 9], [4, 5, 6], [1, 2, 3]]
  end

  def display_board
    puts `clear`
    (0..2).each do |i|
      row = ''
      (0..2).each do |j|
        row += " #{@board[i][j]}"
        row += ' |' unless j == 2
      end
      puts row
      puts '---+---+---' unless i == 2
    end
  end

  def end_turn
    @turn_count += 1 unless @victory
    @turn = @turn == 'X' ? 'O' : 'X'
    display_board unless @victory
  end

  def player_turn
    @turn == 'X' ? @player_one : @player_two
  end

  def board_condition 
    if @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2]
      victory
    elsif @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2] 
      victory
    elsif @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2]
      victory
    elsif @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] 
      victory
    elsif @board[2][0] == @board[1][1] && @board[1][1] == @board[0][2] 
      victory
    elsif @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0]
      victory
    elsif @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1]
      victory
    elsif @board[0][2] == @board[1][2] && @board[1][2] == @board[0][2]
      victory
    elsif @turn_count == 9
      draw
    end
  end

  def victory
    @victory = true
    end_turn
    puts "#{player_turn} is the winner!"
  end

  def draw
    puts 'DRAW!'
    @victory = true
  end

  def make_move(position)
    (0..2).each do |i|
      (0..2).each do |j|
        if @board[i][j] == position
          @board[i][j] = @turn
          return end_turn
        end
      end
    end
    puts 'Invalid move.'
  end

  def game_loop
    display_board
    while @victory == false
      puts "#{player_turn}, pick a number to move on the board."
      make_move(gets.to_i)
      board_condition
    end
  end
end