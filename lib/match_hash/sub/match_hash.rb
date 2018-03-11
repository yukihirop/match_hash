module Sub

  private

  def match_hash(expected, actual)
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

  def match_array(expected, actual)
    expected.each_with_index do |_,i|
      match_value(expected[i],actual[i])
    end
  end

  # trueを返すときがエラー
  def match_value(expected, actual)
    match_hash(expected, actual) if expected.is_a?(Hash)
    match_array(expected, actual) if expected.is_a?(Array)
    return false if expected == actual
    return true
  end

end