class Genre
    attr_accessor :name, :artist, :song
    @@all = []

    def initialize(name)
        @name = name
        save
    end
    def save
        if @@all.none? {|existing_genre| existing_genre == name}
            @@all << self
        end
    end
    def self.all
        @@all
    end
    def songs
        Song.all.select {|song| song.genre == self}
    end
    def artists
        songs.map {|song| song.artist}
    end

        
end
