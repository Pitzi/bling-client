# create support methods

module Support
  def blank?(obj)
    obj.respond_to?(:empty) ? obj.empty? : !obj
  end

  def present?(obj)
    !blank?(obj)
  end
end
