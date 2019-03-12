module SexySlug::UsuallyTransliterableChar
  def self.call(string)
    string.gsub(PATTERN) { |match| TRANSLITERATIONS[match] }
  end

  TRANSLITERATIONS = {
    'Ä' => 'AE',
    'Å' => 'AA',
    'Æ' => 'AE',
    'Ö' => 'OE',
    'Ø' => 'OE',
    'Ü' => 'UE',
    'ß' => 'ss',
    'ä' => 'ae',
    'å' => 'aa',
    'æ' => 'ae',
    'ö' => 'oe',
    'ø' => 'oe',
    'ü' => 'ue',
  }

  PATTERN = Regexp.union(TRANSLITERATIONS.keys)
end
