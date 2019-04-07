require "pry"

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    song_name = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]

    new_song = Song.new(song_name)
    Artist.find_or_create_by_name(artist)
    new_song
  end


end
