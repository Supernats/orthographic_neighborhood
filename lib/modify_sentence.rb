# frozen_string_literal: true

require_relative 'generate_verified_neighbors'
require_relative 'dictionary'

# ModifySentece will take in a string, split it on spaces, and return an array
# of multi-word strings where one and only one word has been changed. That
# change is an orthographic neighbor of the source word. It will produce all
# verified orthographic neighbors of all words in the string.
class ModifySentence
  class << self
    def call(input)
      new(input).call
    end

    alias_method :[], :call
  end

  def initialize(input)
    @input = input.downcase
  end

  def call
    all_sentences.reject { |sentence| sentence == input }.uniq
  end

  private

  attr_reader :input

  def dictionary
    @dictionary ||= Dictionary.new(pre_warm: true)
  end

  def verified_candidates_by_word_index
    @verified_candidates_by_word_index ||=
      Hash[input.split(' ').map.with_index do |_, index|
        [index, GenerateVerifiedNeighbors[input.split(' ')[index]]]
      end]
  end

  def all_sentences
    @all_sentences ||=
      verified_candidates_by_word_index.map do |sentence_index, words|
        words.map do |word|
          arr = input.split(' ')
          arr[sentence_index] = word
          arr.join(' ')
        end
      end.flatten
  end
end
