class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each { |cup| 4.times { cup << :stone } }
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,14)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    pos = start_pos + 1
    until stones.empty?
      if current_player_name == @name1 && pos == 13
        pos += 1
      elsif current_player_name == @name2 && pos == 6
        pos += 1
      end
      pos = 0 if pos == 14
      @cups[pos] << stones.shift
      pos += 1
    end
    pos -= 1
    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx.between?(0, 5) || ending_cup_idx.between?(7, 12)
      if @cups[ending_cup_idx].length == 1
        return :switch
      else
        ending_cup_idx
      end
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    return true if @cups[0..5].all? { |cup| cup.empty? }
    return true if @cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
