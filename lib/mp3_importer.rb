
class MP3Importer
  attr_reader :path

  def initialize(path) # initialize with path
    @path = path
  end

# using the ||= means : a||=b --> of a is undefined or flasy then =b other wise if a is defined then = a
#Dir.glob is way to access the global directory with files that end in .mp3
  def files # loads all the mp3 files in the path directory / normalizes the filename to just the mp3 filename with no path
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") } # then using the .collect method and gsub to just return the filename with out path
  end

  def import # import the files into the library by creating songs from a filename
    files.each{|f| Song.new_by_filename(f)} # grab files from above iterate thought each song using .new_by_files name from song class
  end
end
