# GitHub Gist
# kroehre/ gist:9cc209bcf43a1d1b001b
# より引用＆一部改造

# @abstract           json形式のhashのkeyの数と値、hashの構造、keyとvalueのペアの一致(hash完全一致、順不同)
#                     をテストする.
# @params     [Hash]  expected これからjson形式のhashにするためのhash.
# @example            expect(result).to match_hash(data,nil)
#                     expect(result).to match_hash(data, 'created_at', 'updated_at')
# @note               gem 'rspec-rails', '~> 3.5'
#                     をGemfileを追加していること
# @see                https://gist.github.com/kroehre/9cc209bcf43a1d1b001b
RSpec::Matchers.define :match_hash do |expected|

  include Sub
  match do |actual|
    match_hash(expected, actual)
  end

  # RSpecc::Matchers::ExpectedsForMultipleDiffsは
  # private apiであり、Deprecatedであるが今、diffを取るにはこうするしかない。(2016/12/29現在)
  # @see https://github.com/rspec/rspec-expectations/blob/master/lib/rspec/expectations/fail_with.rb
  # @see https://github.com/rspec/rspec-expectations/blob/master/lib/rspec/matchers/expecteds_for_multiple_diffs.rb
  failure_message do |actual|
    differ = RSpec::Expectations.differ
    @failure_message = RSpec::Matchers::ExpectedsForMultipleDiffs.from(expected).message_with_diff(nil, differ,actual)
    @failure_message
  end

end

