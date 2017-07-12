require 'deck'

describe Deck do
  subject(:deck) { Deck.fill_deck }

  describe "::fill_deck" do
    it "@cards has a length of 52" do
      expect(deck.cards.length).to eq(52)
    end

    it "fills @cards with Card objects" do
      expect(deck.cards[0]).to be_instance_of(Card)
    end

    it "returns a Deck object" do
      expect(deck.class).to be_instance_of(Deck)
    end
  end

  describe "#mix" do
    it "randomizes card order" do
      ordered_cards = deck.cards
      deck.mix
      expect(deck.cards).to_not eq(ordered_cards)
    end
  end
end
