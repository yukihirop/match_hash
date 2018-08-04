require 'pry'

module Sub

  private

  def match_hash?(expected, actual)
    expected.each do |key, value|
      return true unless actual.has_key?(key)
      @is_errors << match_value(expected[key], actual[key])
      return true if @is_errors.include?(true)
    end

    return true if @is_errors.include?(true)
    actual.each do |key, value|
      return true unless expected.has_key?(key)
      @is_errors << match_value(expected[key], actual[key])
      return true if @is_errors.include?(true)
    end
    @is_errors.include?(true)
  end
  alias :match_hash :match_hash?

  def match_array?(expected, actual)
    expected.each_with_index do |data,i|
      case data
      when Hash
        match_hash(data, actual[i])
      when Array
        match_array(data, actual[i])
      else
        match_value(data, actual[i])
      end
    end
  end
  alias :match_array :match_array?

  # trueを返すときがエラー
  def match_value?(expected, actual)
    match_hash(expected, actual) if expected.is_a?(Hash)
    match_array(expected, actual) if expected.is_a?(Array)
    return false if expected == actual
    return true
  end
  alias :match_value :match_value?

end