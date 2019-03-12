require 'active_support/inflector/transliterate'
require 'active_support/multibyte'
Dir[File.join(__dir__, 'sexy_slug', '*.rb')].each { |file| require file }

module SexySlug
  def self.from(string)
    PROCESSORS.inject(string.to_s) { |str, processor| processor.call(str) }
  end

  PROCESSORS = [
    ActiveSupportComposableChar,
    UnreadableChar,
    Apostrophe,
    NumberDelimiter,
    DateTimeDelimiter,
    MoneyAmount,
    AbbreviationDot,
    Logogram,
    NumberSign,
    ShortNumber,
    SignificantDot,
    Underscore,
    UsuallyTransliterableChar,
    ActiveSupportParameterize,
  ]
end
