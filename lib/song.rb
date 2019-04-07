class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  #This creates a new song and artist from an entered filename. The filename
  #Is split into 3 parts (artist, song, .mp3) and then [0] or artist name is
  #Assigned to artist and [1] or song is assigned song. It also links the song
  #And artist together
  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

  #Interacts with Artist class and calls the find or create method, and then adds
  #Its self to that artist
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
