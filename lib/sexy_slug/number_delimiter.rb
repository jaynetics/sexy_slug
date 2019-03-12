module SexySlug::NumberDelimiter
  def self.call(string)
    del = Regexp.escape(SexySlug.t('number.delimiter'))
    string.gsub(/((?:^|[^\d#{del}])\d+)#{del}(\d+(?:[^\d#{del}]|$))/, '\1\2')
  end
end
