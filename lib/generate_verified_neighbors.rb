# frozen_string_literal: true

require_relative 'generate_neighbors'
require_relative 'dictionary'

# GenerateNeighbhors[string] will return all orthographic neighbors of that
# string. It WILL check if they are real words. One can supply their own
# dictionary if they would like.
class GenerateVerifiedNeighbors
  class << self
    def call(input)
      new(input).call
    end

    alias_method :[], :call
  end

  def initialize(input, dictionary: nil)
    @input = input
    @dictionary = dictionary
  end

  def call
    GenerateNeighbors[input].select(&dictionary.method(:[]))
  end

  private

  attr_reader :input

  def dictionary
    @dictionary ||= Dictionary.new
  end
end
