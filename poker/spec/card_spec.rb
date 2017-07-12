require "card"

describe Card do

  subject(:card) {Card.new(11, :H)}
  let(:card2) {Card.new(5, :S)}

  describe "#initialize" do
    it "assigns value as an integer between 2..14" do
      expect(card.value).to eq(11)
      expect(card2.value).to eq(5)
      expect { Card.new(15, :C) }.to raise_error("ArgumentError")
    end

    it "assigns one of four suit types to a symbol" do
      expect(card.suit).to eq(:H)
      expect(card2.suit).to eq(:S)
      expect { Card.new(8, "C") }.to raise_error("ArgumentError")
    end
  end
end
