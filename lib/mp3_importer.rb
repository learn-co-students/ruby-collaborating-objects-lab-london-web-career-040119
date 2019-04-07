require 'pry'
require_relative '../lib/song.rb'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"].collect do |file|
      file.split("mp3s/")[1]
    end
  end

  def import
    files.each {|filename| Song.new_by_filename(filename)}
  end


end
