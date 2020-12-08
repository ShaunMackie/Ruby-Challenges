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
    return determine_high_card(results) if results.size == 2 && current_score == 1 || current_score == 5 || current_score == 6 || current_score == 9
    #return determine_highest_pairs(results)
  end

  def determine_highest_pairs(hands)
    ranks_only = []

  hands.each do |hand|
    ranks_only << ranks(hand)
  end
  
  ranks_only.each do |hand|
    hand.each do |rank|
      hand.delete(rank) if hand.count(rank) < 2
    end
  end
  p ranks_only
  end

  def determine_high_card(hands)
    high_card = sort_hands(hands).max
    first_hand = sort_hands(hands).first
    second_hand = sort_hands(hands).last

    return hands if first_hand[0][0] == second_hand[0][0]
    return [hands.first] if high_card == first_hand
    return [hands.last] if high_card == second_hand
  end

  def sort_hands(hands)
    first_hand = hands.first.sort_by { |obj| RANK.index(obj[0]) }
    second_hand = hands.last.sort_by { |obj| RANK.index(obj[0]) }
    [first_hand, second_hand]
  end
end

pair_of_2 = %w(4S 2H 6S 2D JH)
pair_of_4 = %w(2S 4H 6S 4D JH)
game = Poker.new([pair_of_2, pair_of_4])
game.determine_highest_pairs(game.all_hands)