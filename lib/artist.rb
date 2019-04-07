class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  #Is a basic method for checking all instances of itself
  def self.all
    @@all
  end

  #Adds a song to this artists collection
  def add_song(song)
    @songs << song
  end

  #If find returns true (the artist exists) leave it, otherwise create artist
  #With given name
  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  #Looks at all instances of artist and returns the instance's artist. True/false
  #Helper method
  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  #Looks at all instances of artist and returns the instance's artist.
  #Helper method
  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  #Basic save method, allows you to put instances into the all array
  def save
    @@all << self
  end

  #Print each song out that the artist has stored in songs array
  def print_songs
    songs.each {|song| puts song.name}
  end
end
