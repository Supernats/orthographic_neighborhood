# frozen_string_literal: true

# GenerateNeighbhors[string] will return all orthographic neighbors of that
# string. It will NOT check if they are real words.
class GenerateNeighbors
  class << self
    def call(input)
      new(input).call
    end

    alias_method :[], :call
  end

  def initialize(input)
    @input = input
  end

  def call
    return [] unless valid_input?
  end

  private

  attr_reader :input

  def valid_input?
    !!(input =~ /^[a-zA-Z]+$/)
  end
end
