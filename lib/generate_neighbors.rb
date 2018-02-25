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
      changes,
      additions,
    ].flatten
  end

  private

  ALPHABET = ('a'..'z').to_a unless defined? ALPHABET
  ALPHABET_SIZE = ALPHABET.size unless defined? ALPHABET_SIZE
  private_constant :ALPHABET, :ALPHABET_SIZE

  attr_reader :input

  def additions
    Array.new((input.size + 1) * ALPHABET_SIZE) { input }.
      map.with_index do |el, i|
        el.dup.insert((i / ALPHABET_SIZE), ALPHABET[i % ALPHABET_SIZE])
      end
  end

  def changes
    Array.new(input.size * ALPHABET_SIZE) { input }.map.with_index do |el, i|
      new_el = el.dup
      new_el[i / ALPHABET_SIZE] = ALPHABET[i % ALPHABET_SIZE]
      new_el
    end
  end

  def removals
    Array.new(input.size) { input }.map.with_index do |el, i|
      el.slice(0, i) + el.slice(i + 1, el.length - 1)
    end
  end

  def valid_input?
    !!(input =~ /^[a-zA-Z]+$/)
  end
end
