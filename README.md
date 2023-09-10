# I18nDateRange

The purpose of this gem is to add a helper needed to display proper Date range informations.  
For example: "Du 3 au 5 octobre 2024" or "Du 3 octobre 2023 au 12 janvier 2024"

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18n_date_range'
```
And then execute:

    $ bundle install

## Usage

This gem comes with an integrated view helper: `date_range_i18n` which takes 3 parameters:
- date_from
- date_to (optional)
- format (optional) 

Format can be `:short` or `:long` (default is :short)

"Short" format means without the explicit day name (September 8, 2024).  
"Long" format means with it (Friday, September 8, 2024).  

## Change texts or formats

This gem is based on I18n. Feel free to overwrite any key you want.  
Refer to [config/locales/fr.yml](config/locales/fr.yml) to see what can be edited.

## Tests

Tests are done with RSpec, and Combustion is used to simulate the Rails app.
Rubocop is used to check the syntax.

- `bundle exec rspec` to launch the tests
- `rake rubocop` to launch Rubocop
- `rake` to launch both (default)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noesya/i18n_date_range.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Bibliography

https://coderwall.com/p/fkg-ng/display-date-ranges-in-text-in-rails