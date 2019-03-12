# SexySlug

This is a Ruby gem that builds [slugs](https://en.wikipedia.org/wiki/Clean_URL#Slug) from Strings.

It is similar to [`StringEx' String#to_url`](https://github.com/rsl/stringex/#actsasurl), but more lightweight.

These are the main things that SexySlug does differently:

- depends on activesupport
- leaves core classes untouched
- makes a few more transformations (*[see specs](https://github.com/jaynetics/sexy_slug/blob/master/spec/sexy_slug_spec.rb)*)
- does not transliterate non-latin scripts (*[why?](#why)*)
- provides no ActiveRecord mixin
- isn't configurable
- is 5x faster (*[see benchmark](https://gist.github.com/jaynetics/b024ffa19ce28c731289bd880b492b0b)*)

## Installation

`gem install sexy_slug` or add it to your Gemfile.

## Usage

```ruby
SexySlug.from('Hi there!') # => 'hi-there'
SexySlug.from('Mambo #5') # => 'mambo-number-five'
I18n.with_locale(:de) { SexySlug.from('Mambo #5') } # => 'mambo-nummer-fünf'
```

<a name='why'></a>
## Why no universal transliterations?

Sluggification is always a fuzzy business, but transliteration in particular is almost guaranteed to produce incorrect results.

In many languages, codepoints don't map one-to-one to pronunciations, so their correct transliteration is context-dependent. This means only ML can yield decent results.

Some relevant issues are e.g. [allophones](https://en.wikipedia.org/wiki/Allophone), [crasis](https://en.wikipedia.org/wiki/Crasis), [digraphs](https://de.wikipedia.org/wiki/Digraph), and [sandhi](https://en.wikipedia.org/wiki/Sandhi).

## Contributing

Feel free to send suggestions, point out issues, or submit pull requests.
