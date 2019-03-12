require 'yaml'

module SexySlug
  TRANSLATIONS = YAML.load(File.read(__FILE__).split('__END__').last)
  LOCALES      = TRANSLATIONS.keys.map(&:to_sym)

  def self.t(path)
    path.split('.').inject(TRANSLATIONS[locale.to_s]) { |obj, key| obj[key] }
  end

  def self.locale
    defined?(I18n) && LOCALES.include?(I18n.locale) ? I18n.locale : :en
  end
end

__END__

de:
  currency:
    '$':
      full:
        one: Dollar
        other: Dollar
      part:
        one: Cent
        other: Cent
    '€':
      full:
        one: Euro
        other: Euro
      part:
        one: Cent
        other: Cent
    '£':
      full:
        one: Pfund
        other: Pfund
      part:
        one: Pence
        other: Pence

  dot: Punkt

  logogram:
    '%': Prozent
    '&': und
    '+': plus
    '/': oder
    '=': gleich
    '@': at
    '°': Grad
    '¼': ein Viertel
    '½': halb
    '¾': drei Viertel
    '÷': geteilt durch
    '⅓': ein Drittel
    '⅔': zwei Drittel
    '⅕': ein Fünftel
    '⅖': zwei Fünftel
    '⅗': drei Fünftel
    '⅘': vier Fünftel
    '⅙': ein Sechstel
    '⅚': fünf Sechstel
    '⅛': ein Achtel
    '⅜': drei Achtel
    '⅝': fünf Achtel
    '⅞': sieben Achtel

  number:
    delimiter: '.'
    separator: ','
    sign:
      hashtag: Hashtag
      number:  Nummer
    word:
      # only include numbers that are
      # - conventionally spelled out in the locale
      # - not subject to inflection
      '0': null
      '2': zwei
      '3': drei
      '4': vier
      '5': fuenf
      '6': sechs
      '7': sieben
      '8': acht
      '9': neun
      '10': zehn
      '11': elf
      '12': zwoelf

en:
  currency:
    '$':
      full:
        one: dollar
        other: dollars
      part:
        one: cent
        other: cents
    '€':
      full:
        one: euro
        other: euros
      part:
        one: cent
        other: cents
    '£':
      full:
        one: pound
        other: pounds
      part:
        one: pence
        other: pence

  dot: dot

  logogram:
    '%': percent
    '&': and
    '+': plus
    '/': or
    '=': equals
    '@': at
    '°': degrees
    '¼': one fourth
    '½': half
    '¾': three fourths
    '÷': divided by
    '⅓': one third
    '⅔': two thirds
    '⅕': one fifth
    '⅖': two fifths
    '⅗': three fifths
    '⅘': four fifths
    '⅙': one sixth
    '⅚': five sixths
    '⅛': one eighth
    '⅜': three eighths
    '⅝': five eighths
    '⅞': seven eighths

  number:
    delimiter: ','
    separator: '.'
    sign:
      hashtag: hashtag
      number:  number
    word:
      # only include numbers that are
      # - conventionally spelled out in the locale
      # - not subject to inflection
      '0': zero
      '1': one
      '2': two
      '3': three
      '4': four
      '5': five
      '6': six
      '7': seven
      '8': eight
      '9': nine
