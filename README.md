[![Gem Version](https://badge.fury.io/rb/sexy_slug.svg)](http://badge.fury.io/rb/sexy_slug)
[![Build Status](https://travis-ci.org/jaynetics/sexy_slug.svg?branch=master)](https://travis-ci.org/jaynetics/sexy_slug)
[![codecov](https://codecov.io/gh/jaynetics/sexy_slug/branch/master/graph/badge.svg)](https://codecov.io/gh/jaynetics/sexy_slug)

# SexySlug

This is a Ruby gem that builds [slugs](https://en.wikipedia.org/wiki/Clean_URL#Slug) from Strings.

It is similar to [`StringEx' String#to_url`](https://github.com/rsl/stringex/#actsasurl), but more lightweight.

These are the main things that SexySlug does differently:

- depends on activesupport
- leaves core classes untouched
- makes a few more transformations (*[see specs](https://github.com/jaynetics/sexy_slug/blob/master/spec/sexy_slug_spec.rb)*)
- does not transliterate non-latin scripts (*[why?](#transliterations)*)
- provides no ActiveRecord mixin
- is less customizable
- is about five times faster (*[see benchmark](https://gist.github.com/jaynetics/b024ffa19ce28c731289bd880b492b0b)*)

## Installation

`gem install sexy_slug` or add it to your Gemfile.

## Usage

```ruby
SexySlug.from('Hi there!') # => 'hi-there'
SexySlug.from('Mambo #5') # => 'mambo-number-five'
I18n.with_locale(:de) { SexySlug.from('Mambo #5') } # => 'mambo-nummer-fuenf'
```

<a name='customization'></a>
### Customization

Simply change the contents of the `SexySlug::PROCESSORS` Array.

```ruby
SexySlug::PROCESSORS.delete(SexySlug::UsuallyTransliterableChar)
SexySlug::PROCESSORS.unshift(MyCustomProcessor)
```

<a name='transliterations'></a>
## Why no universal transliterations?

Sluggification is always a fuzzy business, but transliteration in particular is almost guaranteed to produce incorrect results.

In many languages, codepoints don't map one-to-one to pronunciations, so their correct transliteration is context-dependent. Some relevant issues are e.g. [allophones](https://en.wikipedia.org/wiki/Allophone), [crasis](https://en.wikipedia.org/wiki/Crasis), [digraphs](https://de.wikipedia.org/wiki/Digraph), [sandhi](https://en.wikipedia.org/wiki/Sandhi), and shared scripts.

Despite some restraint, `sexy_slug` isn't completely "i18n-proof", e.g.:
- it might mistranslate money amounts, as the dollar sign is also used for non-dollar currencies
- it always transliterates umlauts, which isn't appropriate for languages such as Turkish

See [customization](#customization) on how to avoid this if needed.

## Similar/related projects

- [babosa](https://github.com/norman/babosa)
- [friendly_id](https://github.com/norman/friendly_id)
- [stringex](https://github.com/rsl/stringex)

## Contributing

Feel free to send suggestions, point out issues, or submit pull requests.
