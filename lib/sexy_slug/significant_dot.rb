module SexySlug::SignificantDot
  def self.call(string)
    string.gsub(PATTERN, " #{SexySlug.t('dot')} ")
  end

  PATTERN = /(?<=[^\s\d.]|^)\.(?=[^\s\d.])/
end
