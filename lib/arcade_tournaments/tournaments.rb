class ArcadeTournaments::Tournaments 

    attr_accessor :name, :details, :url
    @@all = []

    def initialize(name, url)
        @name = name
        @details = []
        @url = url
        save
    end

    def self.all #if there's nothing in self then it will use Scraper.
        ArcadeTournaments::Scraper.scrape_tournaments if @@all.empty?  
        @@all
    end

    def get_details #if there's nothing in details then it will use Scraper
        ArcadeTournaments::Scraper.scrape_details(self) if @details.empty? 
    end

    def save
        @@all << self
    end
end

    