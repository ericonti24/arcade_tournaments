class ArcadeTournaments::Details 

    attr_accessor :description, :tournament, :url
    @@all = []

    def initialize(description, tournament)
        @description = description
        @tournament = tournament
        add_to_tournament
        save
    end

    def self.all
        @@all 
    end
    
    def add_to_tournament #allows details to know about tournaments. 
        @tournament.details << self unless @tournament.details.include?(self)
    end

    def self.description #if there's nothing in self then it will use Scraper.
        ArcadeTournaments::Scraper.scrape_details if @@all.empty?  
    end
    
    def save
        @@all << self
    end
end
