# run with `turn` to see pretty results
require 'test_helper'

class TestShurl < Test::Unit::TestCase
  def setup
    @foo = Shurl::Shortener.new
  end
  
  [:isgd, :tinyarrows, :idek, :chilp].each do |url|
    define_method "test_#{url}" do
      Net::HTTP.get_response(URI.parse( instance_eval(url.to_s) + long_url )).body
    end
  end
      
  def test_shorteners
    @@mini = []    
    [:test_isgd, :test_tinyarrows, :test_idek, :test_chilp].each do |test|
      @@mini << instance_eval(test.to_s)
    end
    result = @@mini.sort_by { |url| url.length } [0]
    
    # fucking shitty ass test, makes sure it returns a url
    assert_match %r{http://.+}, result
  end
end