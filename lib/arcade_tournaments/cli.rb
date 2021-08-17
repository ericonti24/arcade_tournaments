class ArcadeTournaments::CLI   
    def call 
    puts 'Welcome to Arcade Tournaments!' 
    get_months
    list_months
    #get_tournement_for(month)
    #list_tournament
    end

    def get_months
        #to be scraped 
        @months = ['Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    end

    def list_months
        #list months for user
        @months.each.with_index(1) do |month, index|
            puts "#{index}. #{month}."
        end
    end

end