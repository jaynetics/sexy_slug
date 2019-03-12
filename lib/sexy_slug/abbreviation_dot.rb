module SexySlug::AbbreviationDot
  def self.call(string)
    string.gsub(PATTERN) { |match| match.tr('.', '') }
  end

  PATTERN = /(?:\s|\(|^)(?:\p{alpha}(?:\.\p{alpha})+\.?\p{alpha}*(?:\s|\)|$))/
end
