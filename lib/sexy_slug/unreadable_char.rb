module SexySlug::UnreadableChar
  def self.call(string)
    string.gsub(PATTERN, '')
  end

  PATTERN = /\p{cntrl}/
end
