# frozen_string_literal: true

require 'yaml'

# A Ruby Hash interface with Webster's Unabridged English Dictionary in JSON.
class Dictionary
  def initialize(pre_warm: false)
    @hashed = YAML.load_file(SOURCE_PATH) if pre_warm
  end

  def [](string)
    hashed[string.upcase]
  end

  private

  SOURCE_PATH = 'vendor/dictionary.json'
  private_constant :SOURCE_PATH

  def hashed
    @hashed ||= YAML.load_file(SOURCE_PATH)
  end
end
