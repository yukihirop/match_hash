# MatchHash

[![Gem Version](https://badge.fury.io/rb/match_hash.svg)](https://badge.fury.io/rb/match_hash)
[![wercker status](https://app.wercker.com/status/b7b6922e7a90870633ac09993e8aa51b/s/master "wercker status")](https://app.wercker.com/project/byKey/b7b6922e7a90870633ac09993e8aa51b)

Easily handle Hash in RSpec.

## RSpec

match_hash defines one new RSpec matcher:

* `match_hash`

## Installation

Add this line to your application's `Gemfile` :

```ruby
gem 'match_hash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install match_hash

## Usage

The new matcher could be used in RSpec as follows:

```ruby
describe MatchHash do

  before do
    @A = {
        a11:11,
        a12:{
            b11:21,
            b12:22
        },
        a13:[1,2,3],
    }

    @B = {
        a11:11,
        a12:{
            b11:21,
            b12:22
        },
        a13:[3,2,1],
    }
  end

  it "A hash match A hash" do
    expect(@A).to match_hash(@A)
  end

  it "A hash do not match B hash and occured raise_error" do
      expect do
        expect(@A).to match_hash(@B)
      end.to raise_error(RSpec::Expectations::ExpectationNotMetError)
    end

end
```

## Failure message

For example:

```ruby
1) MatchHash A hash match A hash
     Failure/Error: expect(@A).to match_hash(@B)

       Diff:
       @@ -2,6 +2,6 @@
        :a12 => 12,
        :a13 => 13,
        :a14 => {:b11=>11, :b12=>12},
       -:a15 => [3, 2, 1],
       +:a15 => [1, 2, 3],
        :a16 => 16,

     # ./spec/match_hash_spec.rb:36:in `block (2 levels) in <top (required)>'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yukihirop/match_hash.

## Licence

* MIT

