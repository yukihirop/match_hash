require "spec_helper"

describe MatchHash do

  let(:A) do
    {
        a11:11,
        a12:12,
        a13:13,
        a14:{
            b11:11,
            b12:12
        },
        a15:[1,2,3]
    }
  end

  it "has a version number" do
    expect(MatchHash::VERSION).not_to be nil
  end

  it "A hash match A hash" do
    expect({
               a11:11,
               a12:12,
               a13:13,
               a14:{
                   b11:11,
                   b12:12
               },
               a15:[1,2,3]
           }).to match_hash({
                                    a11:11,
                                    a12:12,
                                    a13:13,
                                    a14:{
                                        b11:11,
                                        b12:12
                                    },
                                    a15:[1,2,3]
                                })
  end

end
