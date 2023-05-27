# Game of War by JMo May 22, 2023

# Todo: Change 11 - 13 to J, Q, K
# Todo: User interaction?????

class GameOfWar
  def initialize()
    @cards = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13]
    @shuffled_deck = @cards.shuffle
    @player1_hand = @shuffled_deck[0..25]
    @player2_hand = @shuffled_deck[26..51]
    @center_cards = []
  end

  def turn
    until @player1_hand.length == 0 || @player2_hand.length == 0
      compare_cards(@player1_hand, @player2_hand)
    end
    game_over(@player1_hand, @player2_hand)
  end

  def tie(player1_hand, player2_hand)
    p "It's a tie."
    @center_cards = []
    @center_cards << player1_hand.shift()
    @center_cards << player2_hand.shift()
    if player1_hand == []
      p "Player 2 Wins"
    elsif player2_hand == []
      p "Player 1 Wins"
    end
    p "Center Cards Length: " + @center_cards.length.to_s
    p "Player 1 Cards Length: " + player1_hand.length.to_s
    p "Player 2 Cards Length: " + player2_hand.length.to_s
    if player1_hand[0] > player2_hand[0]
      player1_hand << player2_hand.shift()
      player1_hand += @center_cards
    elsif player1_hand[0] < player2_hand[0]
      player2_hand << player1_hand.shift()
      player2_hand += @center_cards
    end
    p @center_cards
  end

  def game_over(player1_hand, player2_hand)
    if player1_hand.length > player2_hand.length
      puts "Player 1 Wins!!!!!"
    elsif player2_hand.length > player1_hand.length
      puts "Player 2 Wins!!!!"
    end
  end

  def compare_cards(player1_hand, player2_hand)
    if @player1_hand[0] > @player2_hand[0]
      p "Player 1 wins"
      p "Player 1 played: " + @player1_hand[0].to_s + " Player 2 played: " + @player2_hand[0].to_s
      @player1_hand << @player2_hand.shift()
      p "Player 1 Length: " + @player1_hand.length.to_s + " Player 2 Length: " + @player2_hand.length.to_s
    elsif @player1_hand[0] < @player2_hand[0]
      p "Player 2 wins"
      p "Player 2 played: " + @player2_hand[0].to_s + " Player 1 played: " + @player1_hand[0].to_s
      @player2_hand << @player1_hand.shift()
      p  "Player 1 Length: " + @player1_hand.length.to_s + " Player 2 Length: " + @player2_hand.length.to_s
    else
      tie(@player1_hand, @player2_hand)
    end
    p @player1_hand, @player2_hand
  end
end

game = GameOfWar.new()
game.turn()
