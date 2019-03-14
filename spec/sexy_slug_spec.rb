RSpec.describe SexySlug do
  it 'has a version number' do
    expect(SexySlug::VERSION).not_to be nil
  end

  it 'removes end-of-sentence and abbreviation dots' do
    expect('nice. really nice. etc.').to become 'nice-really-nice-etc'
  end

  it 'translates significant dots, e.g. in URLs' do
    expect('visit github.com').to become 'visit-github-dot-com'
  end

  it 'removes ellipsis dots' do
    expect('hi...there... you... rock ...').to become 'hi-there-you-rock'
  end

  it 'replaces datetime separators with dashes' do
    expect('31/12/2018 09:00').to become '31-12-2018-09-00'
  end

  it 'replaces underscores with dashes' do
    expect('foo_bar').to become 'foo-bar'
  end

  it 'squeezes surplus whitespace' do
    expect('foo     bar').to become 'foo-bar'
  end

  it 'removes apostrophes' do
    expect("help me buy a bat'leth").to become 'help-me-buy-a-batleth'
  end

  it 'removes accents' do
    expect('Frère Jacques').to become 'frere-jacques'
  end

  it 'transliterates common characters from extended latin alphabets' do
    expect('Bjørn Müller-Faßbinder').to become 'bjoern-mueller-fassbinder'
  end

  it 'can handle combining diacritical marks' do
    expect("Fre\u0300re Ha\u0308nschen").to become 'frere-haenschen'
  end

  it 'translates various logograms' do
    expect('180° is a ½ turn').to become '180-degrees-is-a-half-turn'
  end

  it 'translates hashtags' do
    expect('WRONG #covfefe').to become 'wrong-hashtag-covfefe'
  end

  it 'translates number signs' do
    expect('now #25 in the charts').to become 'now-number-25-in-the-charts'
  end

  it 'removes number delimiters' do
    expect('I will eat 1,000 pizzas').to become 'i-will-eat-1000-pizzas'
  end

  it 'translates money amounts in various formats' do
    expect('$50').to become '50-dollars'
    expect('$ 50').to become '50-dollars'
    expect('50$').to become '50-dollars'
    expect('50 $').to become '50-dollars'
  end

  it 'translates money amounts with correct pluralization' do
    expect('$0').to become 'zero-dollars'
    expect('$1').to become 'one-dollar'
    expect('$2').to become 'two-dollars'
  end

  it 'translates money amounts in various currencies' do
    expect('5.50€').to become 'five-euros-50-cents'
    expect('£5.50').to become 'five-pounds-50-pence'
  end

  it 'translates money amounts with fractional parts' do
    expect('$50.00').to become '50-dollars'
    expect('$50.50').to become '50-dollars-50-cents'
    expect('$5,000.50').to become '5000-dollars-50-cents'
  end

  it 'translates money amounts without messing up quantities' do
    expect('100 $1 popsicles').to become '100-one-dollar-popsicles'
  end

  it 'removes unreadable chars' do
    expect("hack\x00er\u0014man").to become 'hackerman'
  end

  it 'does not leave any non-ascii chars' do
    # string = RegexpPropertyValues.all_for_current_ruby.map do |prop|
    #   prop.matched_codepoints.first.chr('utf-8') rescue ''
    # end.uniq.join
    string = %[
      A\t\u00000!a ­\u0378ʰªǅ̀ः҈ᛮ²_-)»«($^+¦\u2028\u2029𞤀𑜀𔐀؀Ա𐬀ᬀꚠ𖫐ᯀ ঀ𑰀˪
       𑀀⠀ᨀᝀ᐀𐊠𐔰𑄀ꨀᎠϢ𒀀𐠀Ѐ𐐀ऀ𛰀𓀀𐔀ሀႠⰀ𐌰𑌀Ͱઁਁ⺀ᄀᜠ𐣠֑ぁ𐡀𐭠𐭀ꦀ𑂀ಀァ꤀𐨀ក𑈀𑊰
      ກᰀᤀ𐘀𐀀ꓐ𐊀𐤠𑅐ഀࡀ𐫀𑱰𑴀ꫠ𞠀𐦠𐦀𖼀𑘀᠀𖩀𑊀က𐢀ᦀ𑐀߀𖿡 ᱐𐲀𐌀𐪀𐍐𐎠𐩠𐰀ଁ𐒰𐒀𖬀
      𐡠𑫀ꡀ𐤀𐮀ꤰᚠࠀꢀ𑆀𐑐𑖀𝠀ං𑃐𑩐ᮀꠀ܀ᜀᝠᥐᨠꪀ𑚀ஂ𖿠ఀހกༀⴰ𑒀𐎀ꔀ𑢠ꀀ𑨀'्؜ŉ·⿰⿲〆
      เ\uFDD0ͅ͏াᢅⅠ\"🇦i㐀᠋#🏻☝⌚\u0080ĀƀɐԀ\u0530\u0590ݐࡠࢠ\u0A00\u0A80\u0B00
      \u0B80\u0D80\u0E00\u0E80ᎀᢰ᧠᪰ᲀ᳀᳐ᴀᶀ᷀Ḁἀ ⁰₠⃐℀⅐←∀⌀␀⑀①─▀■☀✀⟀⟰⤀⦀⨀⬀ⱠⲀ
      ⴀⶀⷠ⸀⼀\u3040゠\u3100\u3130㆐ㆠ㇀ㇰ㈀㌀䷀一꒐Ꙁ꜀꜠꠰꣠ꥠꧠꩠ\uAB00ꬰꭰꯀ
      가ힰ豈ﬀﭐ︀︐︠︰﹐ﹰ\uFF00\uFFF0𐂀𐄀𐅀𐆐𐇐𐋠𐹠\u{111E0}𑙠𒐀𒒀𖠀𗀀𘠀𛀀𛄀𛅰𛲠𝀀𝄀
      𝈀𝌀𝍠𝐀𞀀𞸀🀀🀰🂠🄀🈀🌀😀🙐🚀🜀🞀🠀🤀𠀀𪜀𫝀𫠠𬺰丽\u{E0000}󠄀󰀀􀀀\u0870
    ]
    expect(SexySlug.from(string)).not_to match(/[^\x00-\x7F]/)
  end

  it 'takes any input responding to #to_s' do
    expect(nil).to become ''
    expect(42).to become '42'
    expect(:foo_bar).to become 'foo-bar'
  end

  it 'does not mutate the input' do
    input = 'Hi there!'
    expect { SexySlug.from(input) }.not_to change { input }
  end

  it 'translates logograms in German', locale: :de do
    expect('heute/morgen').to become 'heute-oder-morgen'
  end

  it 'removes number delimiters in German', locale: :de do
    expect('1.000 Pizzen').to become '1000-pizzen'
  end

  it 'translates money amounts in German', locale: :de do
    expect('5.000,50 $').to become '5000-dollar-50-cent'
  end

  it 'replaces datetime separators in German', locale: :de do
    expect('31.12.2018 09:00').to become '31-12-2018-09-00'
  end
end
