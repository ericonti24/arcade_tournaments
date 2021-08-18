class ArcadeTournaments::CLI   
    def call 
    puts "\nWelcome to Arcade Tournaments!\n" 
    get_months
    list_months
    get_user_month
    #list_tournament
    end

    def get_months
        #to be scraped 
        @months = ArcadeTournaments::Months.all
    end

    def list_months
        puts "Choose a number for the month to see tournaments."
        #list months for user
        @months.each.with_index(1) do |month, index|
            puts "#{index}. #{month}."
        end
    end

    def get_user_month
        chosen_month = gets.strip.to_i
        show_tournaments_for(chosen_month) if valid_input(chosen_month, @months)
    end


    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_tournaments_for(chosen_month)
       month = @months[chosen_month - 1]
       puts "Tournaments for #{month}"
    end
end