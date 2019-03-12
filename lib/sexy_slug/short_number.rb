module SexySlug::ShortNumber
  def self.call(string)
    words = SexySlug.t('number.word')
    pattern = /(?<=\s|^)#{Regexp.union(words.keys)}(?=\s|$)/
    string.gsub(pattern) { |match| words[match] }
  end
end
