# Ibsenphrase

Passphrases consisting of several words chained together are popular. They are easier to remember and harder to crack. But generating them in your mind is not a good idea – humans have no random number generator, and will inevitably pick passphrases with a non-random sequence.

The most popular method of creating such passphrases is Diceware, a wordlist of 7776 (that is 6^5) english words, numbered with five digits between 1 and 6, making it easy to pick random words by throwing a die five times.

But sometimes, the passphrase needs to be made programmatically. This generator uses a wordlist compiled from the original plays by Henrik Ibsen. The wordlist is comprised of more than 8500 words, which is more than the original Diceware wordlist. The words are not pruned for length, so there are many hard and long words in the list.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ibsenphrase'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ibsenphrase

## Usage

Ibsenphrase is a library for other programs. First, load it:

```ruby
require 'ibsenphrase'
```

And then it can be used:

```ruby
Ibsenphrase::Generator.passphrase

# The returned string will obviously vary, but will have this format
# => "genstande svundne vogt skibsdækket silkesejlet stilladserne snygt"
```

You can change the number of words from the default of 7 by passing an integer:

```ruby
Ibsenphrase::Generator.passphrase(3)
#  => "skrifter strækker hverdagsmennesker"
```

You can also get capitalized passphrase strings instead of spaced-out:

```ruby
Ibsenphrase::Generator.passphrase(5, separation: :capitalize)
#  => "LånegodsFængsletMenneskeneFlødGram"
```

For anyone who knows that your password scheme is an Ibsenphrase, the complexity of cracking it is _solely_ the number of words chosen. A passphrase length of 3 gives "only" about 600 000 000 000 possibilities, which is within reach for anyone interested in cracking it. A length of 5 gives about 45 * 10^18 possibilities, which would be very, very time-consuming to crack.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sigvei/ibsenphrase.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

