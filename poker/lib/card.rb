class Card
  attr_reader :value, :suit

  SUITS = [:S, :C, :H, :D]

  def initialize(value, suit)
    raise "ArgumentError" if value > 14 || value < 2 || !suit.is_a?(Symbol)
    @value = value
    @suit = suit
  end

  def self.create_cards
    card_arr = []
    (2..14).each do |value|
      SUITS.each do |suit|
        card_arr << Card.new(value, suit)
      end
    end
    card_arr
  end

end
