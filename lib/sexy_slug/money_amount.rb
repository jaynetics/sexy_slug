module SexySlug::MoneyAmount
  def self.call(string)
    result = string
    separator = Regexp.escape(SexySlug.t('number.separator'))

    SexySlug.t('currency').keys.each do |currency_symbol|
      sym = Regexp.escape(currency_symbol)
      next unless string.match?(/#{sym}/)

      result = result.gsub(/
        (?<=\s|^)
        #{sym}\ *\d*(?:#{separator}\d+)? | \d*(?:#{separator}\d+)?\ *#{sym}
        (?=\s|$)
      /x) do |match|
        translations = SexySlug.t("currency.#{currency_symbol}")

        full, part = match.split(/#{separator}/).map { |el| el.to_s[/\d+/] }
        part = nil if part.to_i == 0

        [
          full,
          full && translations['full'][full.to_i == 1 ? 'one' : 'other'],
          part,
          part && translations['part'][part.to_i == 1 ? 'one' : 'other'],
        ].compact.join(' ')
      end
    end
    result
  end
end
