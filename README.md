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
  let(:expected) do
    {
      a11:11,
      a12:12,
      a13:13,
      a14:{
          b11:11,
          b12:12
      },
      a15:[1,2,3],
      a16:16,
      a17: [{b13: 13}]
    }
  end

  let(:actual) do
    {
      a11:11,
      a12:12,
      a13:13,
      a14:{
          b11:11,
          b12:12
      },
      a15:[3,2,1],
      a16:16,
      a17: [{b13: 14}]
    }
  end

  it "has a version number" do
    expect(MatchHash::VERSION).not_to be nil
  end

  it "expected hash match expected hash" do
    expect(expected).to match_hash(expected)
  end

  it "expected hash do not match actual hash and occured raise_error" do
    expect do
      expect(expected).to match_hash(actual)
    end.to raise_error(RSpec::Expectations::ExpectationNotMetError)
  end
end
```

## Failure message

For example:

```ruby
Failures:

  1) MatchHash expected hash match expected hash
     Failure/Error: expect(expected).to match_hash(actual)

       Diff:

       @@ -2,7 +2,7 @@
        :a12 => 12,
        :a13 => 13,
        :a14 => {:b11=>11, :b12=>12},
       -:a15 => [3, 2, 1],
       +:a15 => [1, 2, 3],
        :a16 => 16,
       -:a17 => [{:b13=>14}],
       +:a17 => [{:b13=>13}],

     # ./spec/match_hash_spec.rb:40:in `block (2 levels) in <top (required)>'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yukihirop/match_hash.

## Licence

* MIT

