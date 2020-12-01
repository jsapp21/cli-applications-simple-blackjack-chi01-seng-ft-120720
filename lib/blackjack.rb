require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp 
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  one_card = deal_card
  two_card = deal_card 
  first_hand = one_card + two_card
  display_card_total(first_hand)
    return first_hand
end

def hit?(current_card_total)
  prompt_user
  players_input = get_user_input

  if players_input == 's'
    current_card_total
  elsif players_input == 'h'
    deal_card + current_card_total
  else 
    invalid_command
    hit?(current_card_total)
  end 
end

def invalid_command
  puts "Please enter a valid command"
end

def runner
  welcome
  new_card_total = initial_round
  until card_total > 21 
    new_card_total = hit?(new_card_total)
    display_card_total(new_card_total)
  end 
  end_game(new_card_total)
end
    
