module SexySlug::Underscore
  def self.call(string)
    string.tr('_', '-')
  end
end
