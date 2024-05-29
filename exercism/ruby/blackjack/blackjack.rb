module Blackjack
  def self.parse_card(card)
    case card
    when "ace" then	11
    when "two"	then 2	
    when "three"	then 3	
    when "four"	then 4	
    when "five" then 5    
    when "six" then	6
    when "seven"	then 7
    when "eight" then	8
    when "nine"	then 9
    when "jack", "ten", "queen", "king" then	10
    else	0
    end
  end

  def self.card_range(card1, card2)
    value = self.parse_card(card1) + self.parse_card(card2)
    case value
    when 4..11 then "low"
    when 12..16 then "mid"
    when 17..20 then "high"
    when 21 then "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    parsed_card1 = self.parse_card(card1)
    parsed_card2 = self.parse_card(card2)
    sum_of_cards = parsed_card1 + parsed_card2
    parsed_dealer_card = self.parse_card(dealer_card)
    case 
    when parsed_card1 == 11 && parsed_card2 == 11
      then "P"
    when sum_of_cards == 21 && parsed_dealer_card < 10
      then "W"
    when sum_of_cards == 21 && parsed_dealer_card >= 10
      then "S"
    when (17..20).include?(sum_of_cards)
      then "S"
    when (12..16).include?(sum_of_cards) && parsed_dealer_card < 7
      then "S"
    when (12..16).include?(sum_of_cards) && parsed_dealer_card >= 7
      then "H"
    when sum_of_cards <= 11
      then "H"
    end
  end
end
