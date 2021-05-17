##
# This program uses recursion to find the best outcome for tic tac toe
#
# @author  Cameron Teed
# @version 1.0
# @since   2021-05-16
# frozen_string_literal: true

def win_lose(game_board, taken_space)
  # returns true or false for whether or not inputted array is a magic square
  if (game_board[0] == taken_space && game_board[1] == taken_space && game_board[2] == taken_space) ||
     (game_board[3] == taken_space && game_board[4] == taken_space && game_board[5] == taken_space) ||
     (game_board[6] == taken_space && game_board[7] == taken_space && game_board[8] == taken_space) ||
     (game_board[0] == taken_space && game_board[3] == taken_space && game_board[6] == taken_space) ||
     (game_board[1] == taken_space && game_board[4] == taken_space && game_board[7] == taken_space) ||
     (game_board[2] == taken_space && game_board[5] == taken_space && game_board[8] == taken_space) ||
     (game_board[0] == taken_space && game_board[4] == taken_space && game_board[8] == taken_space) ||
     (game_board[2] == taken_space && game_board[4] == taken_space && game_board[6] == taken_space)
    true
  else
    false
  end
end

def mini_max(current_board, count_place)
  # Finds the best outcome using the minimax algorithm.

  # Keep going if counter is less than 9
  if count_place <= 8
    # ind where is numeric on the board
    if is_numeric(current_board[count_place])

      # hold the value of a location in the array
      val_hold = current_board[count_place]
      # set the value of said location to "O"
      current_board[count_place] = 'O'

      # check if victory would be achieved in said scenario
      if win_lose(current_board, 'O')
        # set the value that causes victory to "O"
        current_board[count_place] = 'O'
        # increase countplace to induce a outofbounds error
        count_place += 20
      # if victory cannot be achieved reset the value of array
      else
        # reset the value of a location in the array
        current_board[count_place] = val_hold
      end
      # set the value of said location to "X"
      current_board[count_place] = 'X'

      # check if x victory possible
      if win_lose(current_board, 'X')
        # if it is block it
        current_board[count_place] = 'O'
        # increase loop variable to prevent further looping
        count_place += 20
      else
        # reset the value of a location in the array
        current_board[count_place] = val_hold
      end
    end

    #  Uses recursion to call itself
    mini_max(current_board, count_place + 1)
  # Eliminates all the extreme cases where the user wins
  elsif count_place > 8 && count_place < 20
    extr_cases(current_board, count_place)
  end
  current_board
rescue StandardError
  current_board
end

def extr_cases(current_board, _count_place)
  random_num = rand(0..3)
  if is_numeric(current_board[4])
    current_board[4] = 'O'
  # Eliminates all the extreme casses where X would win
  elsif current_board[4] == 'O' && current_board[0] == 'X' &&
        current_board[8] == 'X' && is_numeric(current_board[1]) &&
        is_numeric(current_board[3]) && is_numeric(current_board[5]) &&
        is_numeric(current_board[7])
    if random_num.zero? && is_numeric(current_board[1])
      current_board[1] = 'O'
    elsif random_num == 1 && is_numeric(current_board[3])
      current_board[3] = 'O'
    elsif random_num == 2 && is_numeric(current_board[5])
      current_board[5] = 'O'
    elsif random_num == 3 && is_numeric(current_board[7])
      current_board[7] = 'O'
    end
  elsif current_board[4] == 'O' && current_board[2] == 'X' &&
        current_board[6] == 'X' && is_numeric(current_board[1]) &&
        is_numeric(current_board[3]) && is_numeric(current_board[5]) &&
        is_numeric(current_board[7])
    if random_num.zero? && is_numeric(current_board[1])
      current_board[1] = 'O'
    elsif random_num == 1 && is_numeric(current_board[3])
      current_board[3] = 'O'
    elsif random_num == 2 && is_numeric(current_board[5])
      current_board[5] = 'O'
    elsif random_num == 3 && is_numeric(current_board[7])
      current_board[7] = 'O'
    end
  elsif current_board[4] == 'O' && current_board[1] == 'X' &&
        current_board[3] == 'X' && is_numeric(current_board[0]) &&
        is_numeric(current_board[2]) && is_numeric(current_board[5]) &&
        is_numeric(current_board[6]) && is_numeric(current_board[7]) &&
        is_numeric(current_board[8])
    current_board[0] = 'O'

  elsif current_board[4] == 'O' && current_board[1] == 'X' &&
        current_board[5] == 'X' && is_numeric(current_board[0]) &&
        is_numeric(current_board[2]) && is_numeric(current_board[3]) &&
        is_numeric(current_board[6]) && is_numeric(current_board[7]) &&
        is_numeric(current_board[8])
    current_board[2] = 'O'
  elsif current_board[4] == 'O' && current_board[3] == 'X' &&
        current_board[7] == 'X' && is_numeric(current_board[0]) &&
        is_numeric(current_board[1]) && is_numeric(current_board[2]) &&
        is_numeric(current_board[5]) && is_numeric(current_board[6]) &&
        is_numeric(current_board[8])
    current_board[6] = 'O'
  elsif current_board[4] == 'O' && current_board[5] == 'X' &&
        current_board[7] == 'X' && is_numeric(current_board[0]) &&
        is_numeric(current_board[1]) && is_numeric(current_board[2]) &&
        is_numeric(current_board[3]) && is_numeric(current_board[6]) &&
        is_numeric(current_board[8])
    current_board[8] = 'O'
  elsif random_num == 1 && is_numeric(current_board[2])
    current_board[2] = 'O'
  elsif random_num == 2 && is_numeric(current_board[6])
    current_board[6] = 'O'
  elsif random_num == 3 && is_numeric(current_board[8])
    current_board[8] = 'O'
  elsif random_num.zero? && is_numeric(current_board[1])
    current_board[1] = 'O'
  elsif random_num == 1 && is_numeric(current_board[3])
    current_board[3] = 'O'
  elsif random_num == 2 && is_numeric(current_board[5])
    current_board[5] = 'O'
  elsif random_num == 3 && is_numeric(current_board[7])
    current_board[7] = 'O'
  end
  current_board
end

def is_full(present_board)
  # Returns whether the board if full or not
  counter = 0
  full = true
  while counter != present_board.length.to_i
    if is_numeric(present_board[counter])
      full = false
      break
    end
    counter += 1
  end
  full
end

def print_game_board(the_board)
  # Prints out the current game board
  new_string = ''
  counter = 0
  puts '----+----+----'
  while counter < 9
    new_string = "#{new_string} | #{the_board[counter]}"
    if ((counter + 1) % 3).zero?
      puts new_string
      new_string = ''
      puts '----+----+----'
    end
    counter += 1
  end
end

def is_numeric(string_num)
  # Checks if the chosen swaure has a letter in it
  if %w[X O].include?(string_num)
    false
  else
    true
  end
end

# This is the main function for Tic Tac Toe
game_board_full = false
check_win_x = false
check_win_o = false
# creates the string of intigers for the square
game_game_board = %w[1 2 3 4 5 6 7 8 9]

puts "Welcome to tic tac toe!\n"

# prints out the board
print_game_board(game_game_board)

# Starts loop
loop do
  # Asks for user input
  puts 'Which space would you like to put the X?'
  space = gets.chomp.to_i

  # Cehcks if the number is in the range and its not a letter
  if space >= 1 && space <= 9 && is_numeric(game_game_board[space - 1])
    # Replaces number with X
    game_game_board[space - 1] = 'X'
    count_place = 0
    # Finds O's move
    mini_max(game_game_board, count_place)
    # Prints out O's move
    print_game_board(game_game_board)
  elsif game_game_board[space - 1] == 'X' || game_game_board[space - 1] == 'O'
    # Finds if the spot is taken
    puts "\nThat spots taken!"
    print_game_board(game_game_board)
  else
    puts "\nError"
    break
  end
  # Determines who ones the game
  check_win_x = win_lose(game_game_board, 'X')
  check_win_o = win_lose(game_game_board, 'O')
  if check_win_x == true
    puts "\nX has won."
  elsif check_win_o == true
    puts "\nO has won."
  end
  # Finds if the board if full
  game_board_full = is_full(game_game_board)
  # Determines if it is a tie
  if game_board_full == true && check_win_x == false && check_win_o == false
    puts "\nDraw."
    puts "\nGame Over."
    puts "\nDone"
    break
  # Determiens if game is over
  elsif game_board_full == true || game_board_full == false && (check_win_x == true || check_win_o == true)
    puts "\nGame Over."
    puts "\nDone"
    break
  end
end
