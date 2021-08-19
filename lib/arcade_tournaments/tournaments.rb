class ArcadeTournaments::Tournaments 

    attr_accessor :name, :details
    @@all = []

    def initialize(name)
        @name = name
        @details = []
        save
    end

    def self.all
        ArcadeTournaments::Scraper.scrape_tournaments if @@all.empty?
        @@all
    end

    def get_details
        ArcadeTournaments::Scraper.scrape_details(self) if @details.empty?
    end

    def save
        @@all << self
    end
end