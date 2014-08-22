require 'genderstat/file_reader'
require 'genderstat/web_reader'

class TextReader
  def initialize file_locator
    if File.exist? file_locator
      @reader = FileReader.new file_locator
    else
      @reader = WebReader.new file_locator
    end
  end

  def read
    @reader.read.downcase.split
  end
end
