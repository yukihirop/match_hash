require "spec_helper"

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
    # Error message
    #
    # RSpec::Expectations::ExpectationNotMetError:
    # Diff:
    #
    # @@ -2,7 +2,7 @@
    #  :a12 => 12,
    #  :a13 => 13,
    #  :a14 => {:b11=>11, :b12=>12},
    # -:a15 => [3, 2, 1],
    # +:a15 => [1, 2, 3],
    #  :a16 => 16,
    # -:a17 => [{:b13=>14}],
    # +:a17 => [{:b13=>13}],
    expect do
      expect(expected).to match_hash(actual)
    end.to raise_error(RSpec::Expectations::ExpectationNotMetError)
  end
end
