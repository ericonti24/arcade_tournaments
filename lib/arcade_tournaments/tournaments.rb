class ArcadeTournaments::Tournaments
    @@all = []

    attr_accessor :name 

    def initialize(name)
        @name = name
        save
    end

    def self.all
        ArcadeTournaments::Scraper.scrape_tournaments if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end
end