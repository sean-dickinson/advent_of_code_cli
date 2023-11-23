# frozen_string_literal: true

module AdventOfCode
  module Commands
    class Scaffold < Command
      def execute

        unless File.exist?(solution_file_name)
          say("Creating file: #{solution_file_name}...")
          create_file(solution_file_name, solution_file_contents)
        end

        unless Dir.exist?("inputs")
          say("Creating inputs directory...")
          Dir.mkdir("inputs")
        end

        unless File.exist?(input_file_name)
          say("Creating file: #{input_file_name}...")
          create_file(input_file_name)
        end

        unless Dir.exist?("spec")
          say("Creating spec directory...")
          Dir.mkdir("spec")
        end

        unless File.exist?(spec_file_name)
          say("Creating file: #{spec_file_name}...")
          create_file(spec_file_name, spec_file_contents)
        end

        unless Dir.exist?("spec/test_inputs")
          say("Creating test_inputs directory...")
          Dir.mkdir("spec/test_inputs")
        end

        unless File.exist?(test_input_file_name)
          say("Creating file: #{test_input_file_name}...")
          create_file(test_input_file_name)
        end

        say "Done!", :green
      end

      private

      def solution_file_contents
        <<~RUBY
          module Day#{day_string}
            class << self
              def part_one(input)
                raise NotImplementedError
              end

              def part_two(input)
                raise NotImplementedError
              end
            end
          end
        RUBY
      end

      def spec_file_contents
        <<~RUBY
          require "./#{day_string}"
          RSpec.describe Day#{day_string} do
            context "part 1" do
              it "returns the correct answer for the example input" do
                pending
                input = File.readlines("spec/test_inputs/#{day_string}.txt", chomp: true)
                expect(Day#{day_string}.part_one(input)).to eq 0 # TODO: replace with correct answer
              end
            end

            context "part 2" do
              it "returns the correct answer for the example input" do
                pending
                input = File.readlines("spec/test_inputs/#{day_string}.txt", chomp: true)
                expect(Day#{day_string}.part_two(input)).to eq 0 # TODO: replace with correct answer
              end
            end
          end
        RUBY
      end
    end
  end
end
