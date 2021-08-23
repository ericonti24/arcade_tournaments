class ArcadeTournaments::Details 

    attr_accessor :date, :tournament, :time, :description, :url
    @@all = []

    def initialize(date, tournament)
        @date = date
        @tournament = tournament
        @url = url
        add_to_tournament
        save
    end

    def self.all
        @@all 
    end
    
    def add_to_tournament
        @tournament.details << self unless @tournament.details.include?(self)
    end

    def self.date #if there's nothing in self then it will use Scraper.
        ArcadeTournaments::Scraper.scrape_details if @@all.empty?  
    end

    def save
        @@all << self
    end
end
