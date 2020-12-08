class Poker
  attr_reader :all_hands, :hand1, :hand2, :hand3

  RANK = %w(A K Q J T 9 8 7 6 5 4 3 2)

  def initialize(hands)
    @hand1 = hands[0]
    @hand2 = hands[1]
    @hand3 = hands[2]
    @all_hands = hands
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
    card_indexes = []
    counter = 0
    cards = ranks(hand).sort_by! { |obj| RANK.index(obj[0]) }

    5.times do
      card_indexes << RANK.index(cards[counter])
      RANK.index(cards[counter])
      counter += 1
    end
    card_indexes == (card_indexes[0]..card_indexes[-1]).to_a
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

  def rank_hand(hand)
    return 9 if straightflush?(hand)
    return 8 if quads?(hand)
    return 7 if full_house?(hand)
    return 6 if flush?(hand)
    return 5 if straight?(hand)
    return 4 if trips?(hand)
    return 3 if two_pair?(hand)
    return 2 if pair?(hand)
    return 1 if high_card?(hand)
  end

  def best_hand
    results = []
    current_score = rank_hand(all_hands[0])
  
    all_hands.each do |hand|
      results = [hand] if rank_hand(hand) > current_score
      results << hand if rank_hand(hand) == current_score
    end
    return results if results.size == 1
    determine_high_card(results) if results.size == 2
  end

  def determine_high_card(hands)
    p first_hand = hands.first.sort_by { |obj| RANK.index(obj[0]) }
    p second_hand = hands.last.sort_by { |obj| RANK.index(obj[0]) }
    high_card = [first_hand, second_hand].max
    [hands.first] if high_card == first_hand
    [hands.last] if high_card == second_hand
    #hands if first_hand == second_hand
  end
end

flush_to_8 = %w(3H 6H 7H 8H 5H)
flush_to_7 = %w(2S 4S 5S 6S 7S)
game = Poker.new([flush_to_8, flush_to_7])


