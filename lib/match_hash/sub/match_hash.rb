module Sub

  private

  def match_hash(expected, actual)
    is_errors=[]
    expected.each do |key, value|
      true unless actual.has_key?(key)
      is_errors << match_value(expected[key], actual[key])
      return if is_errors.include?(true)
    end
    actual.each do |key, value|
      true unless expected.has_key?(key)
      is_errors << match_value(expected[key], actual[key])
      return if is_errors.include?(true)
    end
    !is_errors.include?(true)
  end

  def match_array(expected, actual)
    expected.each_with_index do |i|
      match_value(expected[i],actual[i])
    end
  end

  def match_value(expected, actual)
    match_hash(expected, actual) if expected.is_a?(Hash)
    match_array(expected, actual) if expected.is_a?(Array)
    return false if expected.is_a?(Hash) || expected.is_a?(Array) || expected === actual
    true
  end

end