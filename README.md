# Uchardet

Fast character set encoding detection using International Components for Unicode library: [International Components for Unicode](http://site.icu-project.org/)

* https://rubygems.org/gems/uchardet
* https://github.com/dmgk/uchardet
* https://www.rubydoc.info/gems/uchardet/

[![Build Status](https://travis-ci.org/dmgk/uchardet.svg?branch=master)](https://travis-ci.org/dmgk/uchardet)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uchardet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uchardet

## Usage

```ruby
  require 'open-uri'
  require 'uchardet'
  
  text = open('https://raw.githubusercontent.com/dmgk/uchardet/master/test/samples/shift_jis.txt').read
  encoding = ICU::UCharsetDetector.detect(text)
  encoding # => {:encoding=>"Shift_JIS", :confidence=>100, :language=>"ja"}
```

From command line:

```
  $ uchardet
  
  Usage: uchardet [options] file
      -l, --list                       Display list of detectable character sets.
      -s, --strip                      Strip HTML or XML markup before detection.
      -e, --encoding                   Hint the charset detector about possible encoding.
      -a, --all                        Show all matching encodings.
      -h, --help                       Show this help message.
      -v, --version                    Show version.

  $ uchardet `which uchardet`
  
  ISO-8859-1 (confidence 25%)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dmgk/uchardet

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
