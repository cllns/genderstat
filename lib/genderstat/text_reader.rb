require 'open-uri'
require 'readability'
require 'socket'

class TextReader
  def initialize file_location
    @file_location = file_location
  end

  def read
    text = read_from_file || read_from_web
    text.downcase.split
  end

  def read_from_file
    IO.read(@file_location) if File.exist? @file_location
  end


  def read_from_web
    begin
      clean_up_url
      open(@file_location).read
    rescue OpenURI::HTTPError, SocketError
      abort "Could not open: #{@file_location}"
    rescue Errno::ECONNREFUSED
      abort "Does not support HTTPS: #{@file_location}"
    end
  end

  # if the URL is doesn't match the URI regex, then prepend it with http://
  def clean_up_url url
    @file_location = "http://#{@file_location}" if (@file_location =~ URI.regexp).nil?
  end
end
