class ArcadeTournaments::CLI   
    def call 
    puts "\nWelcome to Arcade Tournaments!\n" 
    get_tournaments
    list_tournaments
    get_user_tournament
    end

    def get_tournaments
        #to be scraped 
        @tournaments = ArcadeTournaments::Tournaments.all
    end

    def list_tournaments
        puts "Choose a number for the tournament to see date and details."
        #list tournaments for user
        @tournaments.each.with_index(1) do |tournament, index|
            puts "#{index}. #{tournament.name}"
        end
    end

    def get_user_tournament
        chosen_tournament = gets.strip.to_i
        show_tournaments_for(chosen_tournament) if valid_input(chosen_tournament, @tournaments)
    end


    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_tournaments_for(chosen_tournament)
       tournament = @tournaments[chosen_tournament - 1]
       tournaments.get_details
       puts "Here are the details for #{tournament.name}"
       tournament.details.each.with_index(1) do |detail, index|
        puts "#{index} #{events.date}"
    end
end