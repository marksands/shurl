# http://ow.ly/url/shorten-url -- not out yet
# http://api.bit.ly/shorten?version=2.0.1&login=shurl&apiKey=R_a08944fe85b63e4e35dd04d78d180611&longUrl=
require 'net/http'

module Shurl
  class Shortener
    def initialize
      @@mini = []
      @@shorteners = %w{http://is.gd/api.php?longurl=
        http://tinyarro.ws/api-create.php?url=
        http://idek.net/shorten/?idek-api=true&idek-ref=your_app&idek-anchor=anchortag&idek-url=
        http://chilp.it/api.php?url= }
    end

    def shorten(url)
      @@shorteners.each do |u|
        @@mini << Net::HTTP.get_response(URI.parse(u+urle(url))).body
      end
      @@mini.sort_by { |url| url.length } [0]
    end
    
    private 
    
    def url_encode(url)
      URI.encode(url)
    end
    alias_method :urle, :url_encode
  end
end