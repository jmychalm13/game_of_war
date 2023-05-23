# Game of War by JMo May 22, 2023

# deck Array
cards = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13]
shuffled_deck = cards.shuffle
player1_hand = shuffled_deck[0..35]
player2_hand = shuffled_deck[26..52]
center_cards = []
tie = true
turn = 1

until player1_hand.length == 1 || player2_hand.length == 1
  puts "Turn #{turn}"
  puts "Player A: #{player1_hand[0]}"
  puts "Player B: #{player2_hand[0]}"
  if player1_hand[0] > player2_hand[0]
    player1_hand << player2_hand.shift
    tie = false
  elsif player2_hand[0] > player1_hand[0]
    player2_hand << player1_hand.shift
    tie = false
  else
    puts "It's a tie!"
    center_cards << player1_hand.shift
    center_cards << player2_hand.shift
    tie = true
    while tie == true
      if player1_hand[0] > player2_hand[0]
        player1_hand << player2_hand[0]
        player1_hand << center_cards
        tie = false
      elsif player1_hand[0] < player2_hand[0]
        player2_hand << player1_hand[0]
        player2_hand << center_cards
        tie = false
      end
  end
  end
  turn += 1
end

p player1_hand.length
p player2_hand.length