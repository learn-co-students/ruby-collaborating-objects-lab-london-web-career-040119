class MP3Importer

  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  #Dir refers to current directory. glob allows you to execute code on files using
  #A specific criteria. The criteria ive put here collects all files with X.mp3
  #In thier name and then removes that X.mp3 to return a normalized name.
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  #Takes all the files normalized from above and sen them to Song, to be proccessed
  def import
    files.each{|f| Song.new_by_filename(f)}
  end
end
