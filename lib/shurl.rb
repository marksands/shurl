http://tinyarro.ws/info/api # http://tinyarro.ws/api-create.php?url=http://www.example.com
http://is.gd/api_info.php # http://is.gd/api.php?longurl=http://www.example.com
http://krz.ch/?module=Pages&id=27 # http://krz.ch/?module=ShortURL&file=Add&url=http%3A%2F%2Fvergleiche.ch%2Fmp3player%2Fueber_50gb_speicher%2Fapple_ipod_classic_120gb_silber_mb562
http://idek.net/info/url-shortening-api # http://idek.net/shorten/?idek-api=true&idek-ref=your_app&idek-anchor=anchortag&idek-url=http://yourlonglink.com
http://chilp.it/ # Shortening: http://chilp.it/api.php?url=http://www.example.com
# http://ow.ly/url/shorten-url # probably not... it's not out yet
# http://code.google.com/p/bitly-api/wiki/ApiDocumentation # have to have api key.. :\

URL_SHORTENERS = []
%{"http://is.gd/api.php?longurl=",
  "http://tinyarro.ws/api-create.php?url=",
  "http://idek.net/shorten/?idek-api=true&idek-ref=your_app&idek-anchor=anchortag&idek-url=",
  "http://chilp.it/api.php?url=",
  "http://krz.ch/?module=ShortURL&file=Add&url=" } do |url|
  URL_SHORTENERS << url;
end

  url = url_encode(url);
  URL_SHORTENERS.each do |URL|
    @mini << open( URL + url )
  end

def url_encode(url)
  URI.encode(url)
end