class ArcadeTournaments::Details 

    attr_accessor :date, :tournament, :time, :description
    @@all = []

    def initialize(date, tournament)
        @date = date
        @tournament = tournament
        add_to_tournament
        save
    end

    def self.all
        @@all 
    end
    
    def add_to_tournament
        @tournament.details << self unless @tournament.details.include?(self)
    end

    def save
        @@all << self
    end
end
