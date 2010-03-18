require 'test_helper'

class TestShurl < Test::Unit::TestCase
  [:isgd, :tinyarrows, :idek, :chilp].each do |url|
    define_method "test_#{url}" do
      Net::HTTP.get_response(URI.parse( instance_eval(url.to_s) + long_url )).body
    end
  end
      
  def test_shortest
    @@mini = []    
    [:test_isgd, :test_tinyarrows, :test_idek, :test_chilp].each do |test|
      @@mini << instance_eval(test.to_s)
    end
    @@result = @@mini.sort_by { |url| url.length } [0]
    
    # a big `wtf` test, just verifies that it's a url #embarrassingcode
    assert_match %r{http://.+}, @@result
  end
  
  def test_shortest_is_short
    @@mini.map { |m| assert_operator @@result.length, :<=, m.length }
  end
end