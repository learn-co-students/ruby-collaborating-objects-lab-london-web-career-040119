
class Artist
  @@all = []
  attr_accessor :name, :songs # setting the artist name and songs method

  def initialize(name) #initialize with #name
    @name = name # to the name we pass
    @songs = [] # to an empty array we will push songs into
  end

  def self.all
    @@all # to print the class varaible all
  end

  def add_song(song) #keeps track of an artist's songs
    @songs << song # by pushing them into the songs array
  end

  def self.find_or_create_by_name(name) # finds or creates an artist by name maintaining uniqueness of objects by name property Creates new instance of Artist if none exist
    self.find(name) ? self.find(name) : self.create(name) # this statement follows: x? x:y -> if x is true then x otherwise y - so in this case if the name exists and is found it will print other wise it will create.
  end

  def self.find(name) # this method is set up to search exiting names and find them
    self.all.find {|artist| artist.name == name }  # by selecting the instance from the class varible all we use .find to set the name passed to artist name - .find will only find and select the first element in which is true
  end


  def self.create(name)  # class method to creat a new artist
    self.new(name).tap {|artist| artist.save} # this method will not only create a new artist but also via the .tap method save but using our.save method
  end

  def save # the .save method as used above in .create will save all instances
    @@all << self # adds the artist instance to the @@all class variable
  end

  def print_songs # to print the songs
    songs.each {|song| puts song.name} # will take each song and put out just the song name
  end
end
