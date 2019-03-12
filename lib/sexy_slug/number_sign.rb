module SexySlug::NumberSign
  def self.call(string)
    string.gsub(PATTERN) do
      word = SexySlug.t("number.sign.#{$~[:number] ? :number : :hashtag}")
      " #{word} #{$~[:target]}"
    end
  end

  PATTERN = /\s*#\s*(?<target>(?<number>\d)|\w)/
end
