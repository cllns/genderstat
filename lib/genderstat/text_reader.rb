require 'open-uri'
require 'readability'

class TextReader
  def initialize file_location
    @file_location = file_location
  end

  def read
    text = read_from_file || read_from_web
    text.downcase.split
  end

  def read_from_file
    if File.exist?(@file_location)
      puts "reading in file: " + @file_location
      IO.read(@file_location)
    end
  end


  def read_from_web
    @file_location = "http://" + @file_location if @file_location[0,7] != "http://"
    puts "reading in website: " + @file_location
    open(@file_location).read
  end

end
