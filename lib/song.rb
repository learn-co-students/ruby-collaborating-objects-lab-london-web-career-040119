require 'pry'
require_relative '../lib/mp3_importer.rb'
require_relative '../lib/artist.rb'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    song = Song.new(song_name)
    song.artist = artist_name=(artist)
    song
  end

  def artist_name=(artist_name)
    Artist.find_or_create_by_name(artist_name)
    Artist.all << self
  end

end
