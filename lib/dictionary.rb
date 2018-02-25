# frozen_string_literal: true

require 'json'

# A Ruby Hash interface with Webster's Unabridged English Dictionary in JSON.
class Dictionary
  def initialize(pre_warm: false)
    @hashed = load_file if pre_warm
  end

  def [](string)
    hashed[string.downcase]
  end

  private

  SOURCE_PATH = 'vendor/dictionary.json'
  private_constant :SOURCE_PATH

  def hashed
    @hashed ||= load_file
  end

  def load_file
    JSON[File.read(SOURCE_PATH)]
  end
end
