require 'open-uri'
require 'open_uri_redirections'
require 'socket'

class WebReader
  def initialize url
    @url = clean_up_url url
  end

  def read
    begin
      open(@url, :allow_redirections => :safe).read
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
    if (url =~ URI.regexp).nil?
      "http://#{url}"
    else
      url
    end
  end
end
