# frozen_string_literal: true

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'pry-byebug'

require_relative '../lib/dictionary'

describe Dictionary do
  let(:dictionary) { Dictionary.new }

  it 'knowns about the word cat' do
    refute_nil dictionary['cat']
  end

  it 'does not care about casing' do
    refute_nil dictionary['Cat']
    refute_nil dictionary['CAt']
    refute_nil dictionary['CaT']
    refute_nil dictionary['CAT']
    refute_nil dictionary['cAt']
    refute_nil dictionary['cAT']
    refute_nil dictionary['caT']
  end

  it 'returns a definition' do
    definition = dictionary['cat']
    assert definition.length.positive?
    assert definition.respond_to?(:upcase)
  end

  it 'does not know about fake words' do
    assert_nil dictionary['aqzbwyjla']
  end
end
