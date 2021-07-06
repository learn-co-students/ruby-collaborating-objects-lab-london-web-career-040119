require "pry"

class Artist

  attr_accessor :songs, :name


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end


  def add_song(new_song)
    @songs.push(new_song)
  end

  def self.all
    @@all
  end

  def save
    @@all.push(self)
  end

  def self.find_or_create_by_name(artist_name)
    @@all.find {|artist| artist.name == artist_name} || new_artist = Artist.new(artist_name)
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
