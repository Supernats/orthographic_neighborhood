# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/generate_neighbors'

describe GenerateNeighbors do
  describe '::[]' do
    subject { GenerateNeighbors[input] }

    describe 'for the word "cat"' do
      let(:input) { 'cat' }

      describe 'with respect to removing letters' do
        let(:expected) do
          %w[
            at
            ca
            ct
          ]
        end

        it 'works' do
          output = subject
          assert(
            expected.all?(&output.method(:include?)),
            "Got: #{output},\nExpected: #{expected}",
          )
        end
      end
    end

    describe 'bad input' do
      let(:expected) { [] }

      describe 'for nil' do
        let(:input) { nil }

        it 'returns an empty array' do
          assert_equal expected, subject
        end
      end

      describe 'for a blank string' do
        let(:input) { '' }

        it 'returns an empty array' do
          assert_equal expected, subject
        end
      end

      describe 'for an array' do
        let(:input) { [] }

        it 'returns an empty array' do
          assert_equal expected, subject
        end
      end

      describe 'for a string with numbers' do
        let(:input) { '123' }

        it 'returns an empty array' do
          assert_equal expected, subject
        end
      end

      describe 'for a string with special characters' do
        let(:input) { '!?' }

        it 'returns an empty array' do
          assert_equal expected, subject
        end
      end

      describe 'for a string with a mix of character' do
        let(:input) { 'animal123!?' }

        it 'returns an empty array' do
          assert_equal expected, subject
        end
      end

      describe 'for a string with spaces' do
        let(:input) { 'you are an animal' }

        it 'returns an empty array' do
          assert_equal expected, subject
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
