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

    [
      removals,
    ].flatten
  end

  private

  attr_reader :input

  def removals
    Array.new(input.size) { input }.map.with_index do |el, i|
      el.slice(0, i) + el.slice(i + 1, el.length - 1)
    end
  end

  def valid_input?
    !!(input =~ /^[a-zA-Z]+$/)
  end
end
