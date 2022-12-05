# frozen_string_literal: true

require_relative "lib/chat_gpt/version"

Gem::Specification.new do |spec|
  spec.name = "chat_gpt"
  spec.version = ChatGpt::VERSION
  spec.authors = ["dpaluy"]
  spec.email = ["dpaluy@users.noreply.github.com"]

  spec.summary = "This is OpenAI's ChatGPT API wrapper for Ruby."
  spec.description = "This is OpenAI's ChatGPT API wrapper for Ruby."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["source_code_uri"] = "https://github.com/dpaluy/chat_gpt"
  spec.metadata["changelog_uri"] = "https://github.com/dpaluy/chat_gpt/blob/main/CHANGELOG.md"

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
