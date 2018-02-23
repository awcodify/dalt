# Dalt

```ruby
begin
   myDate = Date.parse("31-01-2016")
rescue ArgumentError
   # handle invalid date
end
```
or even something complex using regex to check valid date?
```ruby
/(\d{1,2}[-\/]\d{1,2}[-\/]\d{4})|(\d{4}[-\/]\d{1,2}[-\/]\d{1,2})/.match("31-02-2010")
```
or much another big effort ways to parsing date. Stop doing something big for something small and just doing small for something big :)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dalt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dalt

## Usage

Simple. Very similiar with `Date.parse`. Just:
```ruby
Dalt.parse('YOUR DATE').alt('YOUR ALTERNATIVE')
```

If your date is valid, then will return your valid date.
If your date is not valid, then will return your alternate.
Simple, right?

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whatdacode/dalt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dalt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/whatdacode/dalt/blob/master/CODE_OF_CONDUCT.md).
