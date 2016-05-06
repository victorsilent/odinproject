require "./player.rb"
require "./board.rb"

class Game

  def initialize
    @board = nil
    @player1 = nil
    @player2 = nil
    @current_player = nil
  end

  def start_game
    puts "Hello!"
    puts " - Player one - "
    puts "Select one character to be your symbol!"
    player_one_symbol = gets.chomp
    puts "Player one name"
    player_one_name = gets.chomp
    puts " - Player two - "
    puts "Select one character to be your symbol!"
    player_two_symbol = gets.chomp
    puts "Player two name"
    player_two_name = gets.chomp

    puts "What is the size board do you like play? (min:3 / max:9)"
    size_board = gets.chomp

    @board = Board.new(size_board)
    @player1 = Player.new(player_one_name,player_one_symbol)
    @player2 = Player.new(player_two_name,player_two_symbol)
    @current_player = rand(1..2) == 1? @player1 : @player2
    self.play
  end

  def play
    win = false
    while(win == false)
      puts "Player #{@current_player.name} turn's! Make your move!"
      player_move = gets.chomp.split(',')
      if @board.valid?(player_move[0].to_i,player_move[1].to_i)
        move(player_move[0].to_i,player_move[1].to_i)
        win = win(player_move[0].to_i,player_move[1].to_i,@current_player.flag)
        turn
      else
        self.play
      end
      @board.draw
    end
  end

  def turn
    if @current_player === @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def move(x,y)
    @board.change(x,y,@current_player.flag)
  end
  def win(x,y,current_player)
    if @board.columns(x,y,current_player) || @board.rows(x,y,current_player) || @board.diagonal(current_player)
      puts "CONGRATULATIONS! #{@current_player.name} WON!"
      return true
    end
    return false
  end

end

game = Game.new
game.start_game
