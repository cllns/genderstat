require 'open-uri'
require 'socket'

class WebReader
  def initialize url
    @url = clean_up_url url
  end

  def read
    begin
      open(@url).read
    rescue Exception => ex
      handle_web_exceptions ex
    end
  end

  private
  def handle_web_exceptions ex
    if ex == OpenURI::HTTPError || ex == SocketError
      abort "Could not open: #{url}"
    elsif ex == Errno::ECONNREFUSED
      abort "Does not support HTTPS: #{url}"
    end
  end

  # if the URL is doesn't match the URI regex, then prepend it with http://
  def clean_up_url url
    "http://#{url}" if (url =~ URI.regexp).nil?
  end
end
