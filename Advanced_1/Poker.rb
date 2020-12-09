class Poker
  attr_reader :all_hands

  RANK = %w(A K Q J T 9 8 7 6 5 4 3 2)

  def initialize(hands)
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

  def wheel_straight?(hand)
    ranks(hand).sort == ['2', '3', '4', '5', 'A']
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

  def straight_flush?(hand)
    straight?(hand) && flush?(hand)
  end

  def rank_hand(hand)
    return 10 if straight_flush?(hand)
    return 9 if quads?(hand)
    return 8 if full_house?(hand)
    return 7 if flush?(hand)
    return 6 if straight?(hand)
    return 5 if wheel_straight?(hand)
    return 4 if trips?(hand)
    return 3 if two_pair?(hand)
    return 2 if pair?(hand)
    return 1 if high_card?(hand)
  end

  def best_hand
    return winning_hand if winning_hand.size == 1
    determine_best_hand(winning_hand)
  end

  def winning_hand
    results = []
    current_score = rank_hand(all_hands[0])

    all_hands.each do |hand|
      results = [hand] if rank_hand(hand) > current_score
      results << hand if rank_hand(hand) == current_score
    end

    results
  end

  def determine_best_hand(hands)
    hand = sort_card_values(hands)
    return hands if RANK.index(hand.first[0]) == RANK.index(hand.last[0])
    return [hands.first] if RANK.index(hand.first[0]) < RANK.index(hand.last[0])
    [hands.last]
  end

  def hands_stripped_of_suits(hands)
    ranks_only = []

    hands.each do |hand|
      ranks_only << ranks(hand)
    end

    ranks_only
  end

  def sort_card_values(hands)
    results = []

    hands_stripped_of_suits(hands).each do |hand|
      if hand == hand.uniq
        results << hand.sort.sort_by { |ele| RANK.index(ele) }
        results.sort_by { |ele| hand.count(ele) }
      else
        results << hand.sort.sort_by { |ele| hand.count(ele) }.reverse
      end
    end

    results
  end
end
