module SexySlug::Apostrophe
  def self.call(string)
    string.gsub(PATTERN, '')
  end

  PATTERN = /(?<=^|\p{alpha})['’`´](?=\p{alpha}|$)/
end
