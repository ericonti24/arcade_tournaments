class ArcadeTournaments::CLI   
    def call 
    puts "\nWelcome to Arcade Tournaments!\n" 
    get_tournaments
    list_tournaments
    get_user_tournament
    end

    def get_tournaments #to be scraped
        @tournaments = ArcadeTournaments::Tournaments.all 
    end

    def list_tournaments #list tournaments for user
        puts "Choose the number for the tournament to see details." 
        @tournaments.each.with_index(1) do |tournament, index|
            puts "#{index}. #{tournament.name}"
        end
    end

    def get_user_tournament #provides users access to choose, #changed show_tournaments_for to show_detials_for. 
        chosen_tournament = gets.strip.to_i
        show_tournament_for(chosen_tournament) if valid_input(chosen_tournament, @tournaments) 
    end


    def valid_input(input, data) #makes sure users input a valid entery. 
        input.to_i <= data.length && input.to_i > 0 
    end

    def show_tournament_for(chosen_tournament) #displays what the users chooses. 
        tournament = @tournaments[chosen_tournament - 1]
        tournament.get_details
        puts "Here are the details for #{tournament.name}"
        tournament.details.each.with_index(1) do |detail|
            puts "#{detail.date}"
    
        end
    end
end