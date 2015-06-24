# iScraper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iscraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iscraper

## Usage

Just simply call function like this:
```ruby
Iscraper.get_warranty_status(your_serial_no_or_imei)
```

You can expect to get such results:

```ruby
{
  warranty_status: true, # Congrats, you have a valid warranty!
  expiration_date: <Date>
}
```

or

```ruby
{
  warranty_status: false, # You warranty has expired :(
  expiration_date: nil
}
```

or

```ruby
{
  error: "Error description" # Check your serial, imei or connection
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/iscraper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
