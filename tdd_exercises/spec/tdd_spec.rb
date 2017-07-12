require 'tdd'

describe Array do

  describe "#my_uniq" do
    subject(:arr) { [1,3,3,5,5] }

    it "returns an array" do
      expect(arr.my_uniq).to be_instance_of(Array)
    end

    it "should contain no duplicates" do
      expect(arr.my_uniq).to eq([1,3,5])
      arr2 = [2,4,4,6,10,8,1,1]
      expect(arr2.my_uniq).to eq([2,4,6,10,8,1])
    end

    context "for an empty array" do
      it "raises an EmptyArray error" do
        expect { [].my_uniq }.to raise_error("EmptyArray")
      end
    end
  end

  describe '#two_sum' do
    subject(:arr) { [-1, 0, 2, -2, 1, 0] }

    it 'returns an array' do
      expect(arr.two_sum).to be_instance_of(Array)
    end

    it "returns list of index pairs that sum to zero" do
      expect(arr.two_sum).to eq([[0, 4], [1, 5], [2, 3]])
      expect([4, -4, 5, -5, -4].two_sum).to eq([[0, 1], [0, 4], [2, 3]])
    end

    it "returns [] if there are no sum-zero or given an empty array" do
      expect([1, 2, 4, 5].two_sum).to eq([])
      expect([].two_sum).to eq([])
    end
  end

  describe "#my_transpose" do
    subject(:arr) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

    it "returns an array" do
      expect(arr.my_transpose).to be_instance_of(Array)
    end

    it "transposes a matrix" do
      expect(arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
      arr2 = [[1, 2, 3], [4, 5, 6]]
      expect(arr2.my_transpose).to eq([[1, 4], [2, 5], [3, 6]])
    end
  end

  describe "#stock_pick" do
    subject(:the_ticker) { [1, 3, 5, 2, 5, 6, 1] }

    it "returns largest profit" do
      expect(the_ticker.stock_pick).to eq([0, 5])
      expect([5, 2, 10, 1].stock_pick).to eq([1, 2])
    end

    it "returns [] if no profit can be made" do
      expect([5, 2, 1].stock_pick).to eq([])
    end
  end

end #Array

describe Hanoi do
  subject(:game) { Hanoi.new }

  describe "#initialize" do
    it "makes 1 tower with 3 rings, the other 2 are empty" do
      expect(game.towers).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move" do
    it "raises an error if placing bigger ring on smaller ring" do
      game.move(0, 1)
      expect { game.move(0, 1) }.to raise_error("MoveError")
    end

    it "raises an error if moving from empty tower" do
      expect { game.move(2, 0) }.to raise_error("MoveError")
    end

    it "successfully moves a ring" do
      game.move(0, 1)
      game.move(0, 2)
      expect(game.towers).to eq([[3], [1], [2]])
    end
  end

  describe "#won?" do
    it "returns true if all rings are on the right tower" do
      game.move(0, 2)
      game.move(0, 1)
      game.move(2, 1)
      game.move(0, 2)
      game.move(1, 0)
      game.move(1, 2)
      game.move(0, 2)
      expect(game.won?).to be_truthy
    end

    it "returns false if not all the rings are on the right tower" do
      expect(game.won?).to be_falsey
    end
  end

end #Hanoi
