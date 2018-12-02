# sportmonks-ruby
Ruby client for Sportmonks API at https://www.sportmonks.com/products/soccer/docs/2.0

## Install

`gem install sportmonks`

## Configure

```ruby
Sportmonks.configure do |config|
  config.api_token = "your API KEY here"
end
```

## API

```ruby
Sportmonks.continents()
Sportmonks.fixtures_between(Date.new(2018, 12, 1), Date.new(2018, 12, 2), [271])
```

Please check [the source code](https://github.com/vnnoder/sportmonks-ruby/blob/master/lib/sportmonks.rb) for more information
