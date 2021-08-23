class ArcadeTournaments::Scraper
    def self.scrape_tournaments
        page = Nokogiri::HTML(open("https://www.electricbatarcade.com/tournament-dates"))

        tournaments = page.css("article.eventlist-event--upcoming")

        tournaments.each do |t|
            name = t.css(".eventlist-title").text
            url = t.css("a").attr("href").value
            ArcadeTournaments::Tournaments.new(name, url)
        end
    end

    def self.scrape_details(tournament)
        url = "https://www.electricbatarcade.com#{tournament.url}"
        page = Nokogiri::HTML(open(url)) 
        date = page.css("li.eventitem-meta-date")
        date.each do |d|
            date = d.css('time.event-date').text
            ArcadeTournaments::Details.new(date, tournament)
        
        end
    end
end