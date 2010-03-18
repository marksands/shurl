require 'rubygems'
require 'test/unit'
require 'shurl'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

class Test::Unit::TestCase
  def long_url
    "http://cnn.com"
  end
  
    # add new url shortener links here
  @@shorten_urls = %w{
    http://is.gd/api.php?longurl=
    http://tinyarro.ws/api-create.php?url=
    http://idek.net/shorten/?idek-api=true&idek-ref=your_app&idek-anchor=anchortag&idek-url=
    http://chilp.it/api.php?url=
  }
  
    # add new url shortener names here
  def self.url_list
    [:isgd, :tinyarrows, :idek, :chilp]
  end
    
  url_list.each_with_index do |url, i|
    define_method url do
      @@shorten_urls[i]
    end
  end  
end