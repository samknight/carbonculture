# Carbonculture

Reads the utility usage of various public buildings including Number 10 Downing Street

## Installation

Add this line to your application's Gemfile:

    gem 'carbonculture'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carbonculture

## Usage

You can find building from organisations or call it directly.

    Carbonculture::Organisation('number10').places
    
or

    Carbonculture::Place('10-downing-street', 'number10')
    
Channels for different types of utility (electric, gas, etc)

    Carbonculture::Place('10-downing-street', 'number10').channels
    
More information on methods and results available can be discovered at http://data.carbonculture.net/

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
