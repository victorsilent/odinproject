class Board
  attr_accessor :board
  def initialize(size)
    @board = Array.new(size.to_i){Array.new(size.to_i,' ') }
  end

  def change(x,y,val)
    @board[x][y] = val
  end

  def draw
    @board.size.times do |x|
        puts "|#{@board[x]}|"
    end
  end

  def valid?(x,y)
      if @board[x][y] != ' '
        puts "INVALID MOVE!"
        return false
      elsif @board.size < x || @board.size < y
        puts "BOARD SIZE EXCEED. INVALID MOVE!"
        return false
      else
        return true
      end
  end

  def rows(x,y,player_flag)
    @board.size.times do |b|
      if @board[x][b]!= @board[x][b+1]
        return false
      end
    end
    return true
  end

  def columns(x,y,player_flag)
    @board.size.times do |b|
      if @board[b][y]!= @board[b+1][y]
        return false
      end
    end
    return true
  end

  def diagonal(player_flag)
    diagonal_player = true
    diagonal_player2 = true
    for x in 0..@board.size-1
      if @board[x][x] != player_flag
        diagonal_player = false
      end
    end
    for x in 0..@board.size-1
      if @board[x][@board.size-x] != player_flag
        diagonal_player_2 = false
      end
    end
    if diagonal_player_2 || diagonal_player
      return true
    end
    return false
  end


end
