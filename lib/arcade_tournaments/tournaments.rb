class ArcadeTournaments::Tournaments
    @@all = []

    attr_accessor :name, :details

    def initialize(name)
        @name = name
        @details = []
        save
    end

    def self.all
        ArcadeTournaments::Scraper.scrape_tournaments if @@all.empty?
        @@all
    end

    def details
        ArcadeTournaments::Scraper.scrape_details(self) if @details.empty?
        @details
    end

    def save
        @@all << self
    end
end