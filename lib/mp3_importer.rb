class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.foreach(path).select { |filename| filename.split('.').last == 'mp3' }
  end

  def import
    files.each { |filename| Song.new_by_filename(filename) }
  end
end
