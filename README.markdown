# shurl
### Shortest URL

## TODO

There's still a lot left to be done. I'd like to add more url shorteners, and find a way to make tinyarrows actually work. But it works for now.

## What + Why

Shurl finds the shortest URL from a list of URL shortening APIs. If there's one I don't have, please let me know and I'll add it. It queries each API for 
a short url and then gives the user the shortest one back. Pretty simple stuff.

This is pretty much your stereotypical product of a college student. When I'm bored and not paying attention to lectures, this is what happens.

## Install

Updates are pushed to gemcutter.org

		sudo gem install shurl

Optionally clone it from here and make sure the tests pass

		git clone git://github.com/marksands/shurl.git

Test with `rake` or `turn`

## Usage

		require 'shurl'
		
		foo = Shurl::Shortener.new

		mini = foo.shorten("http://www.cnn.com")		
		# mini => "http://is.gd/aMH0W"

## Credit

&copy; 2010 [marksands](http://twitter.com/marksands). 