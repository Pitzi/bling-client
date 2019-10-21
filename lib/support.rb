# create support methods

class Object
  def blank?
    respond_to?(:empty) ? empty? : !self
  end

  def present?
    !blank?
  end

  def in?(arr)
    arr.include?(self)
  rescue NoMethodError
    raise ArgumentError.new("The parameter passed to #in? must respond to #include?")
  end
end
