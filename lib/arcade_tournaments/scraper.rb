class ArcadeTournaments::Scraper
    def self.scrape_tournaments
        page = Nokogiri::HTML(open("https://www.electricbatarcade.com/tournament-dates"))

        tournaments = page.css("article.eventlist-event--upcoming")

        tournaments.each do |t|
            name = t.css(".eventlist-title").text
            ArcadeTournaments::Tournaments.new(name)
        end
    end

    def self.scrape_details(tournament)
        ArcadeTournaments::Details.new("Aug. 31", tournament)
        ArcadeTournaments::Details.new("Dec. 4", tournament)
    end

end