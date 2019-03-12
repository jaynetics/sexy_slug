module SexySlug::Logogram
  def self.call(string)
    string.gsub(PATTERN) { ' ' + SexySlug.t("logogram.#{$1}") + ' ' }
  end

  PATTERN = /\s*(#{Regexp.union(SexySlug.t('logogram').keys)})\s*/
end
