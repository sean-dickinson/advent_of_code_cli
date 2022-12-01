# frozen_string_literal: true

require_relative "lib/advent_of_code_cli/version"

Gem::Specification.new do |spec|
  spec.name = "advent_of_code_cli"
  spec.version = AdventOfCode::VERSION
  spec.authors = ["Emily Samp"]
  spec.email = ["emily.samp@icloud.com"]

  spec.summary = "A CLI tool to scaffold and run Advent of Code solutions."
  spec.homepage = "https://github.com/egiurleo/advent_of_code_cli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
