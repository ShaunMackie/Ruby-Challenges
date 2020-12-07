class Poker
  attr_reader :all_hands

  def initialize(hand1, hand2 = nil, hand3 = nil)
    @hand1 = hand1
    @hand2 = hand2
    @hand3 = hand3
    @all_hands = [@hand1, @hand2, @hand3]
  end

  def ranks(hand)
    hand.map do |card|
      card[0]
    end
  end

  def suits(hand)
    hand.map do |card|
      card[-1]
    end
  end

  def high_card?(hand)
    hand == hand.uniq
  end

  def pair?(hand)
    ranks(hand).uniq.size == 4
  end

  def two_pair?(hand)
    ranks(hand).uniq.size == 3
    # might need to swap some code with trips? if trips ends up first in da loop
  end

  def trips?(hand)
    cards = ranks(hand).sort
    two_pair?(hand) && cards[0] == cards[2] || cards[2] == cards[-1]
  end

  def straight?(hand)
    cards = ranks(hand).sort
    (cards - (cards[0]..cards[-1]).to_a).empty?
  end

  def flush?(hand)
    suits(hand).uniq.size == 1
  end

  def full_house?(hand)
    ranks(hand).uniq.size == 2
  end

  def quads?(hand)
    cards = ranks(hand).sort
    cards[0] == cards[3] || cards[1] == cards[-1]
  end

  def straightflush?(hand)
    straight?(hand) && flush?(hand)
  end
end

high_of_king = %w(4S 5H 6S 8D KH)
pair_of_4 = %w(2S 4H 6S 4D JH)
straight = %w(3S 4H 2S 6D 5H)
flush_to_7 = %w(2S 4S 5S 6S 7S)
straight_flush_to_9 = %w(5S 7S 8S 9S 6S)
pair_of_4 = %w(2S 4H 6S 4D JH)
double_pair = %w(4S 5H 4S 8D 5H)
three_of_4 = %w(4S 5H 4S 8D 4H)
full = %w(4S 5H 4S 5D 4H)
square_of_3 = %w(3S 3H 2S 3D 3H)

game = Poker.new([high_of_king, pair_of_4])

p game.high_card?(high_of_king)
p game.pair?(pair_of_4)
p game.straight?(straight)
p game.flush?(flush_to_7)
p game.straightflush?(straight_flush_to_9)
p game.two_pair?(double_pair)
p game.trips?(three_of_4)
p game.full_house?(full)
p game.quads?(square_of_3)
