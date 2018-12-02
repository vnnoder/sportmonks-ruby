# sportmonks-ruby
Ruby client for Sportmonks API

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
