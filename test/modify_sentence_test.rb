# frozen_string_literal: true

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/modify_sentence'

describe ModifySentence do
  # Yes, I know all of these test the dictionary. Too lazy to stub stuff proper
  # right now. Maybe when I add support for loading in your own dictionaries.
  describe '::[]' do
    subject { ModifySentence[input] }
    describe 'when the sentence has no valid changes' do
      let(:input) { 'wuwqzzzz zzzzuiiiqquuw' }

      it 'returns an empty array' do
        assert_equal [], subject
      end
    end

    describe 'when the sentence has valid changes' do
      let(:input) { 'cat dog' }
      it 'only changes one word at a time' do
        diffs =
          subject.map { |sentence| input.split(' ') - sentence.split(' ') }

        assert(diffs.all? { |diff| diff.size == 1 }, "DIFF: #{diffs}")
        assert(diffs.all? { |diff| input.include?(diff.first) })
      end
    end
  end
end
