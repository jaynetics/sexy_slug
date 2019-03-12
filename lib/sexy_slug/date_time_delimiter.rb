module SexySlug::DateTimeDelimiter
  def self.call(string)
    string.gsub(PATTERN, '-')
  end

  PATTERN = /(?<=\d)[:\/](?=\d)/
end
