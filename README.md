# Allmenus

This is the unofficial ruby wrapper for the Allmenus.com API, the nation's largest, fastest growing network of restaurants

[http://developer.allmenus.com/](http://developer.allmenus.com/)

Still a wip for the moment but if you want to contribute feel free to hit me up
## Installation

Add this line to your application's Gemfile:

    gem 'allmenus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install allmenus

## Usage

TODO: Write usage instructions here

Allmenus.configure{|c| c.api_key = ENV['ALLMENUS_API_KEY']; c.log_request = true}
Allmenus::Menu.find(menu_id)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[![Analytics](https://ga-beacon.appspot.com/UA-34823890-2/allmenus/readme?pixel)](https://github.com/gregory/allmenus)

