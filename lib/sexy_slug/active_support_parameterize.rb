module SexySlug::ActiveSupportParameterize
  def self.call(string)
    ActiveSupport::Inflector.parameterize(string)
  end
end
