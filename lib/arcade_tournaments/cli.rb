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
        @months = ['Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    end

    def list_months
        puts "Choose a month to see tournaments."
        #list months for user
        @months.each.with_index(1) do |month, index|
            puts "#{index}. #{month}."
        end
    end

    def get_user_month
        chosen_month = gets.strip
        binding.pry
        if valid_input(chosen_month, @months)
        end
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

end