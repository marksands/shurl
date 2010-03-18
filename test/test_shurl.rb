require 'test_helper'

class TestShurl < Test::Unit::TestCase
  url_list.each do |url|
    define_method "test_#{url}" do
      Net::HTTP.get_response(URI.parse( instance_eval(url.to_s) + long_url )).body
    end
  end
      
  def test_shortest
    @@mini = []    
    Test::Unit::TestCase.url_list.each do |url|
      @@mini << instance_eval("test_#{url.to_s}")
    end
    @@result = @@mini.sort_by { |url| url.length } [0]
    
    # a big `wtf` test, just verifies that it's a url #embarrassingcode
    assert_match %r{http://.+}, @@result    
  end
  
  def test_shortest_is_short
    @@mini.map { |m| assert_operator @@result.length, :<=, m.length }
  end
    
  def test_shortest_urls_are_valid
    @@mini.map { |m| assert_match %r{http://.+}, m }
  end
end