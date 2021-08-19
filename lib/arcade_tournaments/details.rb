class ArcadeTournaments::Details 
    @@all = []

    attr_accessor :date, :time, :description

    def initialize(name, date)
        @name = name
        @date = date
        add_to_tournament
        save
    end

    def self.all
        @@all
    end

    def add_to_tournament
        @tournaments.details << self unless @tournaments.include?(self)
    end

    def save
        @@all << self
    end
end