module SexySlug::ActiveSupportComposableChar
  def self.call(string)
    ActiveSupport::Multibyte::Chars.new(string).compose.to_s
  end
end
