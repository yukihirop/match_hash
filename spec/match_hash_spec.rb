require "spec_helper"

describe MatchHash do

  before do
    @A = {
        a11:11,
        a12:12,
        a13:13,
        a14:{
            b11:11,
            b12:12
        },
        a15:[1,2,3],
        a16:16
    }

    @B = {
        a11:11,
        a12:12,
        a13:13,
        a14:{
            b11:11,
            b12:12
        },
        a15:[3,2,1],
        a16:16
    }
  end

  it "has a version number" do
    expect(MatchHash::VERSION).not_to be nil
  end

  it "A hash match A hash" do
    expect(@A).to match_hash(@A)
  end

  it "A hash do not match B hash and occured raise_error" do
    expect do
      expect(@A).to match_hash(@B)
    end.to raise_error
  end

end
