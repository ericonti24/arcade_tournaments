class ArcadeTournaments::Scraper
    def self.scrape_tournaments #scrapes list of tournaments to display for user. 
        page = Nokogiri::HTML(open("https://www.electricbatarcade.com/tournament-dates"))

        tournaments = page.css("article.eventlist-event--upcoming")

        tournaments.each do |t|
            name = t.css(".eventlist-title").text
            url = t.css("a").attr("href").value
            ArcadeTournaments::Tournaments.new(name, url)
        end
    end

    def self.scrape_details(tournament) #scrapes detials for chosen tournament. 
        url = "https://www.electricbatarcade.com#{tournament.url}"
        page = Nokogiri::HTML(open(url)) 
        des = page.css("div.sqs-block-content p")
        des.each do |d|
            description = d.text
            ArcadeTournaments::Details.new(description, tournament)
        end
    end
end