# frozen_string_literal: true

require 'yaml'
require_relative 'modify_sentence'

# Get the possibilities of spell lists
class RingOfTheGrammarian
  class << self
    def call(**args)
      new(function_signature.merge(args)).call
    end

    def function_signature
      { spell_list: nil, spell_file: nil, output_location: nil }
    end

    alias_method :[], :call

    def proper_args?(**args)
      !!args[:spell_list] ^ !!args[:spell_file]
    end

    def argument_error_message
      'Something is wrong in your method call. This function takes the '\
      "following:\n`spell_list` XOR `spell_file` (required)\n"\
      '`output_location` (optional)'
    end
  end

  def initialize(**args)
    args = self.class.function_signature.merge(args)

    unless self.class.proper_args?(args)
      raise(ArgumentError, self.class.argument_error_message)
    end

    @output_location = args[:output_location]
    @spell_file = args[:spell_file]
    @spell_list = args[:spell_list]
  end

  def call
    return puts(as_yaml) unless output_location

    File.open(output_location, 'w+') { |f| f.write(as_yaml) }
  end

  private

  attr_reader :output_location, :spell_list, :spell_file

  def as_yaml
    YAML.dump(hash_of_spells_and_mods)
  end

  def hash_of_spells_and_mods
    if !spells.respond_to?(:each) || !spells.size.positive?
      raise 'No spells to modify'
    end

    @hash_of_spells_and_mods ||=
      Hash[
        spells.map do |spell|
          [spell.strip, ModifySentence[spell]]
        end
      ]
  end

  def spells
    @spells ||= (spell_list || spells_from_given_file)
  end

  def spells_from_given_file
    YAML.load_file(spell_file)
  end
end
