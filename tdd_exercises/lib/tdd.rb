require "byebug"

class Array
  def my_uniq
    raise "EmptyArray" if self.empty?
    self.uniq
  end

  def two_sum
    final = []
    self.length.times do |i1|
      self.length.times do |i2|
        next if i2 <= i1
        final << [i1, i2] if (self[i1] + self[i2]).zero?
      end
    end
    final
  end

  def my_transpose
    final = []

    self[0].length.times do |i|
      subarr = []
      self.each do |arr|
        subarr << arr[i]
      end
      final << subarr
    end
    final
  end

  def stock_pick
    result = []
    highest_profit = 0
    self.each_with_index do |val1, idx1|
      self.each_with_index do |val2, idx2|
        next if idx2 <= idx1
        if val2 - val1 > highest_profit
          result = [idx1, idx2]
          highest_profit = val2 - val1
        end
      end
    end
    result
  end

end #Array

class Hanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(start, target)
    raise "MoveError" unless valid_move?(start, target)
    @towers[target] << @towers[start].pop
  end

  def won?
    return false if @towers[0..1].any? { |tower| !tower.empty? }
    true
  end

  private
  def valid_move?(start, target)
    return false if towers[start].empty?
    return true if towers[target].empty?
    return false if towers[start].last > towers[target].last
    true
  end
end #Hanoi
