# Dalt

Parse you date dynamically without raising error when invalid, but returning alternative object as you want.

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

### .parse

Simple. Very similiar with `Date.parse`. Just:
```ruby
['invalid', 'monday', '01-01-2019'].each do |date|
   Dalt.parse(date, alt: 'Invalid date')
end
```
will return

```ruby
["Invalid date", #<Date: 2019-03-18 ((2458561j,0s,0n),+0s,2299161j)>, #<Date: 2019-01-01 ((2458485j,0s,0n),+0s,2299161j)>]
```

If your date is valid, then will return your valid date.
If your date is not valid, then will return your alternate.
Simple, right?

### .smart_change

```ruby
Dalt.smart_change('31-12-2019', month: 2)
```

```
=> 29 February 2019
```

You can even use alternet in `.smart_change`

```ruby
Dalt.smart_change('31-12-2019', month: 2, alt: 'Alternate date')
```

```
=> "Alternate date"
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whatdacode/dalt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dalt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/whatdacode/dalt/blob/master/CODE_OF_CONDUCT.md).
