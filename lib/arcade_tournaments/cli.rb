class ArcadeTournaments::CLI   
    def call 
    puts "\nWelcome to Arcade Tournaments!\n".upcase
    @input = ""
    until @input == "exit"
        get_tournaments
        list_tournaments
        get_user_tournament
        choose_again
        end
        good_luck_and_farewell
    end

    def get_tournaments #to be scraped
        @tournaments = ArcadeTournaments::Tournaments.all 
    end

    def list_tournaments #list tournaments for user
        puts "\nType the number for the tournament to see details.\n".upcase
        @tournaments.each.with_index(1) do |tournament, index|
            puts "#{index}. #{tournament.name}"
        end
    end

    def get_user_tournament #provides users access to choose
        chosen_tournament = gets.strip.to_i
        show_tournament_for(chosen_tournament) if valid_input(chosen_tournament, @tournaments) 
    end


    def valid_input(input, data) #makes sure users input a valid entery. 
        input.to_i <= data.length && input.to_i > 0 
    end

    def show_tournament_for(chosen_tournament) #displays chosen tournaments and detials. 
        tournament = @tournaments[chosen_tournament - 1]
        tournament.get_details
        puts "\nHere are the details for #{tournament.name}\n".upcase
        tournament.details.each do |detail|
            puts "\n~ #{detail.description}\n"
        end
    end

    def choose_again #user can press any key to enter to go back to tournament options. 
        puts "\nHit any key to select another tournament, or type 'exit' if you are done.\n"
        @input = gets.strip
    end

    def good_luck_and_farewell #goodbye message. 
        puts "\nGood luck and farewell!\n".upcase
    end
end