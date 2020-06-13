puts "Welcome to Scorekeeper, by Christopher Adams"

print "What game are you playing? "
game = gets.chomp.upcase

print "You are playing #{game}, correct? (y/n) "
confirm_game = gets.chomp.downcase

def yes_no(a)
    until a == "y" || a == "n"
        print "Please type 'y' for yes or 'n' for no: "
        a = gets.chomp.downcase
    end
end

until confirm_game == "y"
    yes_no(confirm_game)
    print "What game are you playing? "
    game = gets.chomp.upcase

    print "You are playing #{game}, correct? (y/n) "
    confirm_game = gets.chomp.downcase
end

print "Is there a winning score? (y/n) "
final_score = gets.chomp.downcase
yes_no(final_score)

if final_score == "y"
    print "What's the winning score? "
    winning_score = gets.to_i
    print "Winning score is #{winning_score}, correct? (y/n) "
    confirm_score = gets.chomp.downcase
    until confirm_score == "y"
        yes_no(confirm_score)
        print "What's the winning score? "
        winning_score = gets.to_i
        print "Winning score is #{winning_score}, correct? (y/n) "
        confirm_score = gets.chomp.downcase
    end 
end

players = Array.new
print "Enter name of first player: "
player = gets.chomp.upcase

print "Player name is #{player}, correct? (y/n) "
confirm_player = gets.chomp.downcase

until confirm_player == "y"
    yes_no(confirm_player)
    print "Enter name of first player: "
    player = gets.chomp.upcase

    print "Player name is #{player}, correct? (y/n) "
    confirm_player = gets.chomp.downcase
end

players.push(player)

print "Enter name of next player:  "
player = gets.chomp.upcase

print "Player name is #{player}, correct? (y/n) "
confirm_player = gets.chomp.downcase

until confirm_player == "y"
    yes_no(confirm_player)
    print "Enter name of next player: "
    player = gets.chomp.upcase

    print "Player name is #{player}, correct? (y/n) "
    confirm_player = gets.chomp.downcase
end

players.push(player)

print "Add another player? (y/n) "
add_player = gets.chomp.downcase
yes_no(add_player)

while add_player == "y"
    yes_no(add_player)
    print "Enter name of next player:  "
    player = gets.chomp.upcase
    
    print "Player name is #{player}, correct? (y/n) "
    confirm_player = gets.chomp.downcase
    
    until confirm_player == "y"
        yes_no(confirm_player)
        print "Enter name of next player: "
        player = gets.chomp.upcase

        print "Player name is #{player}, correct? (y/n) "
        confirm_player = gets.chomp.downcase
    end
    
    players.push(player)
    print "Add another player? (y/n) "
    add_player = gets.chomp.downcase
end

loop do
    scoreboard = Hash.new
    score = 0

    players.each do |player|
        scoreboard[player] = score
    end

    def print_scoreboard(game, scoreboard)
        puts "-" * 20
        puts "-" * 20
        puts " " * 5 + game
        sleep(1)
        puts "\n"
        scoreboard.each do |player, score|
            puts "#{player}: ".ljust(10) + "#{score}".rjust(10)
            sleep(1)
        end
        puts "\n\n"
    end

    print_scoreboard(game, scoreboard)

    if game == "FARKLE"
        puts "First to score exactly 10,000 points wins!"
        puts "\n"
        sleep(2)
        puts "Start game!"
        puts "\n"
    end


    def game_over(player)
        puts "\n#{player}" + " WINS!!!"
        puts "G A M E  O V E R !\n"
    end

    if winning_score
        loop do
            print "Player turn: "
            player_turn = gets.chomp.upcase
            until players.include?(player_turn)
                print "Please enter a valid player: "
                player_turn = gets.chomp.upcase
            end

            print "Add score: "
            add_score = gets.to_i

            scoreboard[player_turn] += add_score
            if scoreboard[player_turn] > winning_score
                puts "\nSorry, you cannot score higher than #{winning_score}. Removing last score.\n"
                scoreboard[player_turn] -= add_score
            end

            print_scoreboard(game, scoreboard)

            if scoreboard[player_turn] == winning_score
                game_over(player_turn)
            end

            break if scoreboard[player_turn] == winning_score
        end
    end

    if !winning_score
        loop do
            print "Player turn: "
            player_turn = gets.chomp.upcase
            if player_turn == "END"
                winner = scoreboard.key(scoreboard.values.max)
                game_over(winner)
                break
            end
            until players.include?(player_turn)
                print "Please enter a valid player: "
                player_turn = gets.chomp.upcase
                if player_turn == "END"
                    winner = scoreboard.key(scoreboard.values.max)
                    game_over(winner)
                    break
                end
            end
            print "Add score: "
            add_score = gets.to_i

            scoreboard[player_turn] += add_score

            print_scoreboard(game, scoreboard)

            puts "type 'end' to end the game\n"
        end
    end
    
    puts "\n"
    print "Play again? (y/n) "
    play_again = gets.chomp.downcase
    yes_no(play_again)
    puts "\n"
    if play_again == "n"
        break
    end
end
# Bonus ability to track player Wins

# Bonus ability to share to social media or email