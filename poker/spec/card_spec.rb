require 'card'

describe Card do
  subject(:card) { Card.new(11, :H) }
  let(:card2) { Card.new(5, :S) }
  let(:stack_of_cards) { Card.create_cards }

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

  describe "::create_cards" do
    it "returns an array of Card objects" do
      expect(stack_of_cards[0]).to be_instance_of(Card)
      expect(stack_of_cards[8]).to be_instance_of(Card)
    end

    it "returns an array of length 52" do
      expect(stack_of_cards.length).to eq(52)
    end
  end
end
