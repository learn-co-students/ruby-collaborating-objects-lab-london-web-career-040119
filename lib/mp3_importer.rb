require "pry"

class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path

  end


  def files
    @files ||= Dir.glob("#{path}/*.mp3").map{ |f| f.gsub("#{path}/", "") }

  end


  def import
    files.each {|each_file| Song.new_by_filename(each_file)}
     # binding.pry
  end

end
