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
        let(:expected) { removals }

        it 'inclues all possible removals' do
          output = subject

          expected.each do |expectation|
            assert_includes output, expectation
          end
        end
      end

      describe 'with respect to adding letters' do
        let(:expected) { additions }

        it 'includes all possible additions' do
          output = subject

          expected.each do |expectation|
            assert_includes output, expectation
          end
        end
      end

      describe 'with respect to changing in place' do
        let(:expected) { changes }
        it 'includes all possible changes' do
          output = subject

          expected.each do |expectation|
            assert_includes output, expectation
          end
        end
      end

      # This is really the only test one needs, but I found the tests above made
      # it easier to reason about during development. I'm keeping them for that
      # reason.
      describe 'when you put them all together' do
        let(:expected) { (removals + additions + changes).sort }

        it 'includes only the specified words and nothing else' do
          assert_equal expected, subject.sort
        end
      end

      let(:removals) do
        %w[
          at
          ca
          ct
        ]
      end

      let(:changes) do
        %w[
          aat
          bat
          cat
          dat
          eat
          fat
          gat
          hat
          iat
          jat
          kat
          lat
          mat
          nat
          oat
          pat
          qat
          rat
          sat
          tat
          uat
          vat
          wat
          xat
          yat
          zat
          cat
          cbt
          cct
          cdt
          cet
          cft
          cgt
          cht
          cit
          cjt
          ckt
          clt
          cmt
          cnt
          cot
          cpt
          cqt
          crt
          cst
          ctt
          cut
          cvt
          cwt
          cxt
          cyt
          czt
          caa
          cab
          cac
          cad
          cae
          caf
          cag
          cah
          cai
          caj
          cak
          cal
          cam
          can
          cao
          cap
          caq
          car
          cas
          cat
          cau
          cav
          caw
          cax
          cay
          caz
        ]
      end

      let(:additions) do
        %w[
          acat
          bcat
          ccat
          dcat
          ecat
          fcat
          gcat
          hcat
          icat
          jcat
          kcat
          lcat
          mcat
          ncat
          ocat
          pcat
          qcat
          rcat
          scat
          tcat
          ucat
          vcat
          wcat
          xcat
          ycat
          zcat
          caat
          cbat
          ccat
          cdat
          ceat
          cfat
          cgat
          chat
          ciat
          cjat
          ckat
          clat
          cmat
          cnat
          coat
          cpat
          cqat
          crat
          csat
          ctat
          cuat
          cvat
          cwat
          cxat
          cyat
          czat
          caat
          cabt
          cact
          cadt
          caet
          caft
          cagt
          caht
          cait
          cajt
          cakt
          calt
          camt
          cant
          caot
          capt
          caqt
          cart
          cast
          catt
          caut
          cavt
          cawt
          caxt
          cayt
          cazt
          cata
          catb
          catc
          catd
          cate
          catf
          catg
          cath
          cati
          catj
          catk
          catl
          catm
          catn
          cato
          catp
          catq
          catr
          cats
          catt
          catu
          catv
          catw
          catx
          caty
          catz
        ]
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
